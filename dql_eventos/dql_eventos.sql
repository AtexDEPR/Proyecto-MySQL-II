
-- --------------------------------------------------
-- Script SQL con Eventos SQL
-- --------------------------------------------------

-- Usar la base de datos
USE los_ambientales;

-- Habilitar el programador de eventos
SET GLOBAL event_scheduler = ON;

-- Usar la base de datos
USE los_ambientales;

-- 1. Evento que genere un informe semanal de visitantes
DELIMITER //
CREATE EVENT IF NOT EXISTS informe_semanal_visitantes
ON SCHEDULE EVERY 1 WEEK
STARTS CURRENT_TIMESTAMP + INTERVAL 1 DAY
DO
BEGIN
    SELECT COUNT(*) AS total_visitas_semana
    FROM visita
    WHERE fecha_entrada >= DATE_SUB(CURDATE(), INTERVAL 7 DAY);
END//
DELIMITER ;

-- 2. Evento que actualice mensualmente el inventario de especies
DELIMITER //
CREATE EVENT IF NOT EXISTS actualizar_inventario_especies
ON SCHEDULE EVERY 1 MONTH
STARTS CURRENT_TIMESTAMP + INTERVAL 1 DAY
DO
BEGIN
    UPDATE area_especie
    SET fecha_ultimo_conteo = CURDATE();
END//
DELIMITER ;

-- 3. Evento que elimine visitantes inactivos después de un año
DELIMITER //
CREATE EVENT IF NOT EXISTS eliminar_visitantes_inactivos
ON SCHEDULE EVERY 1 MONTH
STARTS CURRENT_TIMESTAMP + INTERVAL 1 DAY
DO
BEGIN
    DELETE FROM visitante
    WHERE id_visitante NOT IN (
        SELECT id_visitante 
        FROM visita 
        WHERE fecha_entrada >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
    );
END//
DELIMITER ;

-- 4. Evento que actualice anualmente los presupuestos de los proyectos
DELIMITER //
CREATE EVENT IF NOT EXISTS actualizar_presupuestos_proyectos
ON SCHEDULE EVERY 1 YEAR
STARTS '2025-01-01 00:00:00'
DO
BEGIN
    UPDATE proyecto_investigacion
    SET presupuesto = presupuesto * 1.05
    WHERE estado IN ('Propuesto', 'Aprobado', 'En Proceso');
END//
DELIMITER ;

-- 5. Evento que revise la ocupación de alojamientos cada 24 horas
DELIMITER //
CREATE EVENT IF NOT EXISTS revisar_ocupacion_alojamientos
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP + INTERVAL 1 HOUR
DO
BEGIN
    SELECT id_alojamiento, porcentaje_ocupacion
    FROM vista_ocupacion_alojamientos
    WHERE porcentaje_ocupacion > 80;
END//
DELIMITER ;

-- 6. Evento que envíe alertas si una especie tiene menos de 10 individuos
DELIMITER //
CREATE EVENT IF NOT EXISTS alerta_especies_bajas
ON SCHEDULE EVERY 1 WEEK
STARTS CURRENT_TIMESTAMP + INTERVAL 1 DAY
DO
BEGIN
    SELECT id_especie, numero_inventario
    FROM area_especie
    WHERE numero_inventario < 10;
END//
DELIMITER ;

-- 7. Evento que reordene los identificadores de especies periódicamente (cada 6 meses)
DELIMITER //
CREATE EVENT IF NOT EXISTS reordenar_ids_especies
ON SCHEDULE EVERY 6 MONTH
STARTS '2025-07-01 00:00:00'
DO
BEGIN
    -- Simulación simple: no reordeno realmente, solo marco la acción
    SELECT 'IDs de especies revisados' AS mensaje;
END//
DELIMITER ;

-- 8. Evento que elimine logs antiguos después de seis meses
DELIMITER //
CREATE EVENT IF NOT EXISTS eliminar_logs_antiguos
ON SCHEDULE EVERY 1 MONTH
STARTS CURRENT_TIMESTAMP + INTERVAL 1 DAY
DO
BEGIN
    -- Sin tabla de logs, simulamos con una acción vacía o limpieza de datos antiguos
    DELETE FROM visita
    WHERE fecha_entrada < DATE_SUB(CURDATE(), INTERVAL 6 MONTH);
END//
DELIMITER ;

-- 9. Evento que revalúe las asignaciones de personal cada trimestre
DELIMITER //
CREATE EVENT IF NOT EXISTS revaluar_asignaciones_personal
ON SCHEDULE EVERY 3 MONTH
STARTS '2025-04-01 00:00:00'
DO
BEGIN
    SELECT id_personal, id_area
    FROM area_vigilancia
    WHERE fecha_asignacion < DATE_SUB(CURDATE(), INTERVAL 3 MONTH);
END//
DELIMITER ;

-- 10. Evento que actualice los costos operativos de los parques anualmente
DELIMITER //
CREATE EVENT IF NOT EXISTS actualizar_costos_operativos
ON SCHEDULE EVERY 1 YEAR
STARTS '2025-01-01 00:00:00'
DO
BEGIN
    SELECT id_parque, SUM(sueldo) * 1.1 AS costo_operativo
    FROM personal
    JOIN personal_vigilancia pv ON personal.id_personal = pv.id_personal
    JOIN area_vigilancia av ON pv.id_personal = av.id_personal
    JOIN area a ON av.id_area = a.id_area
    GROUP BY id_parque;
END//
DELIMITER ;

-- 11. Evento que genere reportes de sueldo del personal mensualmente
DELIMITER //
CREATE EVENT IF NOT EXISTS reporte_sueldos_mensual
ON SCHEDULE EVERY 1 MONTH
STARTS CURRENT_TIMESTAMP + INTERVAL 1 DAY
DO
BEGIN
    SELECT SUM(sueldo) AS total_sueldos, AVG(sueldo) AS promedio_sueldos
    FROM personal;
END//
DELIMITER ;

-- 12. Evento que verifique los permisos de usuarios cada semana
DELIMITER //
CREATE EVENT IF NOT EXISTS verificar_permisos_usuarios
ON SCHEDULE EVERY 1 WEEK
STARTS CURRENT_TIMESTAMP + INTERVAL 1 DAY
DO
BEGIN
    SELECT 'Permisos de usuarios verificados' AS mensaje;
END//
DELIMITER ;

-- 13. Evento que reinicie los valores de auditoría cada fin de mes
DELIMITER //
CREATE EVENT IF NOT EXISTS reiniciar_auditoria
ON SCHEDULE EVERY 1 MONTH
STARTS LAST_DAY(CURRENT_TIMESTAMP) + INTERVAL 1 DAY
DO
BEGIN
    SELECT 'Valores de auditoría reiniciados' AS mensaje;
END//
DELIMITER ;

-- 14. Evento que notifique la finalización de proyectos próximos a expirar
DELIMITER //
CREATE EVENT IF NOT EXISTS notificar_proyectos_expirar
ON SCHEDULE EVERY 1 WEEK
STARTS CURRENT_TIMESTAMP + INTERVAL 1 DAY
DO
BEGIN
    SELECT id_proyecto, nombre
    FROM proyecto_investigacion
    WHERE fecha_fin BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY)
    AND estado = 'En Proceso';
END//
DELIMITER ;

-- 15. Evento que elimine especies sin asignación después de un año
DELIMITER //
CREATE EVENT IF NOT EXISTS eliminar_especies_sin_asignacion
ON SCHEDULE EVERY 1 YEAR
STARTS '2025-01-01 00:00:00'
DO
BEGIN
    DELETE FROM especie
    WHERE id_especie NOT IN (SELECT id_especie FROM area_especie);
END//
DELIMITER ;

-- 16. Evento que verifique la disponibilidad de vehículos cada semana
DELIMITER //
CREATE EVENT IF NOT EXISTS verificar_disponibilidad_vehiculos
ON SCHEDULE EVERY 1 WEEK
STARTS CURRENT_TIMESTAMP + INTERVAL 1 DAY
DO
BEGIN
    SELECT id_vehiculo
    FROM vehiculo
    WHERE id_vehiculo NOT IN (SELECT id_vehiculo FROM personal_vigilancia WHERE id_vehiculo IS NOT NULL);
END//
DELIMITER ;

-- 17. Evento que registre cada nuevo parque en un log especial
DELIMITER //
CREATE EVENT IF NOT EXISTS registrar_nuevos_parques
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP + INTERVAL 1 HOUR
DO
BEGIN
    SELECT id_parque, nombre
    FROM parque_natural
    WHERE fecha_declaracion = CURDATE();
END//
DELIMITER ;

-- 18. Evento que actualice el estado de investigación de especies cada trimestre
DELIMITER //
CREATE EVENT IF NOT EXISTS actualizar_estado_investigacion
ON SCHEDULE EVERY 3 MONTH
STARTS '2025-04-01 00:00:00'
DO
BEGIN
    SELECT e.id_especie, COUNT(pe.id_proyecto) AS proyectos
    FROM especie e
    LEFT JOIN proyecto_especie pe ON e.id_especie = pe.id_especie
    GROUP BY e.id_especie;
END//
DELIMITER ;

-- 19. Evento que realice una copia de seguridad de la base de datos mensualmente
DELIMITER //
CREATE EVENT IF NOT EXISTS backup_mensual
ON SCHEDULE EVERY 1 MONTH
STARTS CURRENT_TIMESTAMP + INTERVAL 1 DAY
DO
BEGIN
    SELECT 'Copia de seguridad simulada' AS mensaje;
END//
DELIMITER ;

-- 20. Evento que envíe recordatorios a los visitantes sobre normativas del parque
DELIMITER //
CREATE EVENT IF NOT EXISTS recordatorio_normativas
ON SCHEDULE EVERY 1 WEEK
STARTS CURRENT_TIMESTAMP + INTERVAL 1 DAY
DO
BEGIN
    SELECT COUNT(*) AS visitantes_activos
    FROM visita
    WHERE fecha_entrada >= DATE_SUB(CURDATE(), INTERVAL 7 DAY)
    AND (fecha_salida IS NULL OR fecha_salida > CURDATE());
END//
DELIMITER ;

-- Confirmar que todo está guardado
FLUSH PRIVILEGES;