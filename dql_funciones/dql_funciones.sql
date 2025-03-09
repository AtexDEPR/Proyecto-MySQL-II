
-- --------------------------------------------------
-- Script SQL con Funciones
-- --------------------------------------------------

USE los_ambientales;

-- 1. Cantidad total de parques en un departamento
DELIMITER //
CREATE FUNCTION fn_parques_por_departamento(p_id_departamento INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(id_parque) INTO total
    FROM parque_departamento
    WHERE id_departamento = p_id_departamento;
    RETURN total;
END //
DELIMITER ;

-- 2. Superficie total de parques en un departamento
DELIMITER //
CREATE FUNCTION fn_superficie_departamento(p_id_departamento INT)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    DECLARE superficie DECIMAL(12,2);
    SELECT SUM(a.extension_hectareas) INTO superficie
    FROM parque_departamento pd
    JOIN area a ON pd.id_parque = a.id_parque
    WHERE pd.id_departamento = p_id_departamento;
    RETURN IFNULL(superficie, 0);
END //
DELIMITER ;

-- 3. Cantidad de especies en un parque
DELIMITER //
CREATE FUNCTION fn_especies_parque(p_id_parque INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(DISTINCT ae.id_especie) INTO total
    FROM area a
    JOIN area_especie ae ON a.id_area = ae.id_area
    WHERE a.id_parque = p_id_parque;
    RETURN total;
END //
DELIMITER ;

-- 4. Total de visitantes en un mes
DELIMITER //
CREATE FUNCTION fn_visitantes_mes(p_mes INT, p_año INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(id_visita) INTO total
    FROM visita
    WHERE MONTH(fecha_entrada) = p_mes 
    AND YEAR(fecha_entrada) = p_año;
    RETURN total;
END //
DELIMITER ;

-- 5. Sueldo promedio por tipo de personal
DELIMITER //
CREATE FUNCTION fn_sueldo_promedio_tipo(p_id_tipo_personal INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(10,2);
    SELECT AVG(sueldo) INTO promedio
    FROM personal
    WHERE id_tipo_personal = p_id_tipo_personal;
    RETURN IFNULL(promedio, 0);
END //
DELIMITER ;

-- 6. Ocupación promedio de alojamientos en un parque
DELIMITER //
CREATE FUNCTION fn_ocupacion_promedio_parque(p_id_parque INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE porcentaje DECIMAL(5,2);
    SELECT AVG(porcentaje_ocupacion) INTO porcentaje
    FROM vista_ocupacion_alojamientos
    WHERE id_parque = p_id_parque;
    RETURN IFNULL(porcentaje, 0);
END //
DELIMITER ;

-- 7. Parque con más especies registradas
DELIMITER //
CREATE FUNCTION fn_parque_mas_especies()
RETURNS VARCHAR(150)
DETERMINISTIC
BEGIN
    DECLARE nombre_parque VARCHAR(150);
    SELECT p.nombre INTO nombre_parque
    FROM parque_natural p
    JOIN area a ON p.id_parque = a.id_parque
    JOIN area_especie ae ON a.id_area = ae.id_area
    GROUP BY p.id_parque, p.nombre
    ORDER BY COUNT(ae.id_especie) DESC
    LIMIT 1;
    RETURN nombre_parque;
END //
DELIMITER ;

-- 8. Presupuesto total de proyectos en un departamento
DELIMITER //
CREATE FUNCTION fn_presupuesto_departamento(p_id_departamento INT)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(12,2);
    SELECT SUM(pi.presupuesto) INTO total
    FROM proyecto_investigacion pi
    JOIN proyecto_especie pe ON pi.id_proyecto = pe.id_proyecto
    JOIN area_especie ae ON pe.id_especie = ae.id_especie
    JOIN area a ON ae.id_area = a.id_area
    JOIN parque_departamento pd ON a.id_parque = pd.id_parque
    WHERE pd.id_departamento = p_id_departamento;
    RETURN IFNULL(total, 0);
END //
DELIMITER ;

-- 9. Total de especies en peligro en un parque
DELIMITER //
CREATE FUNCTION fn_especies_peligro_parque(p_id_parque INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(DISTINCT ae.id_especie) INTO total
    FROM area a
    JOIN area_especie ae ON a.id_area = ae.id_area
    WHERE a.id_parque = p_id_parque
    AND ae.numero_inventario < 10; -- Suponiendo que menos de 10 individuos indica peligro
    RETURN total;
END //
DELIMITER ;

-- 10. Media de sueldos de investigadores
DELIMITER //
CREATE FUNCTION fn_sueldo_promedio_investigadores()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(10,2);
    SELECT AVG(p.sueldo) INTO promedio
    FROM personal p
    WHERE p.id_tipo_personal = 4; -- 4 = Personal Investigador
    RETURN IFNULL(promedio, 0);
END //
DELIMITER ;

-- 11. Visitantes recibidos en un parque en un año
DELIMITER //
CREATE FUNCTION fn_visitantes_anual_parque(p_id_parque INT, p_año INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(id_visita) INTO total
    FROM visita
    WHERE id_parque = p_id_parque
    AND YEAR(fecha_entrada) = p_año;
    RETURN total;
END //
DELIMITER ;

-- 12. Número de proyectos activos en un parque
DELIMITER //
CREATE FUNCTION fn_proyectos_activos_parque(p_id_parque INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(DISTINCT pi.id_proyecto) INTO total
    FROM proyecto_investigacion pi
    JOIN proyecto_especie pe ON pi.id_proyecto = pe.id_proyecto
    JOIN area_especie ae ON pe.id_especie = ae.id_especie
    JOIN area a ON ae.id_area = a.id_area
    WHERE a.id_parque = p_id_parque
    AND pi.estado = 'En Proceso';
    RETURN total;
END //
DELIMITER ;

-- 13. Especie con mayor cantidad de individuos en un parque
DELIMITER //
CREATE FUNCTION fn_especie_mayor_poblacion(p_id_parque INT)
RETURNS VARCHAR(150)
DETERMINISTIC
BEGIN
    DECLARE nombre_especie VARCHAR(150);
    SELECT e.denominacion_vulgar INTO nombre_especie
    FROM area a
    JOIN area_especie ae ON a.id_area = ae.id_area
    JOIN especie e ON ae.id_especie = e.id_especie
    WHERE a.id_parque = p_id_parque
    ORDER BY ae.numero_inventario DESC
    LIMIT 1;
    RETURN nombre_especie;
END //
DELIMITER ;

-- 14. Antigüedad de un parque desde su declaración
DELIMITER //
CREATE FUNCTION fn_antiguedad_parque(p_id_parque INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE años INT;
    SELECT DATEDIFF(CURRENT_DATE, fecha_declaracion) / 365 INTO años
    FROM parque_natural
    WHERE id_parque = p_id_parque;
    RETURN IFNULL(años, 0);
END //
DELIMITER ;

-- 15. Cantidad de visitantes por categoría profesional
DELIMITER //
CREATE FUNCTION fn_visitantes_por_profesion(p_profesion VARCHAR(100))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(DISTINCT v.id_visitante) INTO total
    FROM visitante v
    JOIN visita vi ON v.id_visitante = vi.id_visitante
    WHERE v.profesion = p_profesion;
    RETURN total;
END //
DELIMITER ;

-- 16. Cantidad de personal de vigilancia por parque
DELIMITER //
CREATE FUNCTION fn_vigilantes_parque(p_id_parque INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(DISTINCT pv.id_personal) INTO total
    FROM personal_vigilancia pv
    JOIN area_vigilancia av ON pv.id_personal = av.id_personal
    JOIN area a ON av.id_area = a.id_area
    WHERE a.id_parque = p_id_parque;
    RETURN total;
END //
DELIMITER ;

-- 17. Investigador con más proyectos asignados
DELIMITER //
CREATE FUNCTION fn_investigador_mas_proyectos()
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
    DECLARE nombre_completo VARCHAR(200);
    SELECT CONCAT(p.nombre, ' ', p.apellido) INTO nombre_completo
    FROM personal p
    JOIN proyecto_investigador pi ON p.id_personal = pi.id_personal
    GROUP BY p.id_personal, p.nombre, p.apellido
    ORDER BY COUNT(pi.id_proyecto) DESC
    LIMIT 1;
    RETURN nombre_completo;
END //
DELIMITER ;

-- 18. Porcentaje de ocupación (corregido: parece referirse a alojamiento, no tren)
DELIMITER //
CREATE FUNCTION fn_porcentaje_ocupacion_alojamiento(p_id_alojamiento INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE porcentaje DECIMAL(5,2);
    SELECT porcentaje_ocupacion INTO porcentaje
    FROM vista_ocupacion_alojamientos
    WHERE id_alojamiento = p_id_alojamiento;
    RETURN IFNULL(porcentaje, 0);
END //
DELIMITER ;

-- 19. Cantidad de especies vegetales por parque
DELIMITER //
CREATE FUNCTION fn_especies_vegetales_parque(p_id_parque INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(DISTINCT ae.id_especie) INTO total
    FROM area a
    JOIN area_especie ae ON a.id_area = ae.id_area
    JOIN especie e ON ae.id_especie = e.id_especie
    JOIN tipo_especie te ON e.id_tipo_especie = te.id_tipo_especie
    WHERE a.id_parque = p_id_parque
    AND te.nombre = 'Vegetal';
    RETURN total;
END //
DELIMITER ;

-- 20. Total de presupuesto usado en proyectos completados
DELIMITER //
CREATE FUNCTION fn_presupuesto_proyectos_completados()
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(12,2);
    SELECT SUM(presupuesto) INTO total
    FROM proyecto_investigacion
    WHERE estado = 'Completado';
    RETURN IFNULL(total, 0);
END //
DELIMITER ;

