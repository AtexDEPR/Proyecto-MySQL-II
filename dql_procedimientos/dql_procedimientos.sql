-- --------------------------------------------------
-- Script SQL con Procedimientos Almacenados
-- --------------------------------------------------

-- Usar la base de datos
USE los_ambientales;

-- Delimitador para procedimientos
DELIMITER //

-- 1. Procedimiento para registrar un nuevo parque con su nombre y fecha de declaración
CREATE PROCEDURE registrar_parque (
    IN p_nombre VARCHAR(150),
    IN p_fecha_declaracion DATE
)
BEGIN
    -- Insertar el nuevo parque en la tabla parque_natural
    INSERT INTO parque_natural (nombre, fecha_declaracion, descripcion)
    VALUES (p_nombre, p_fecha_declaracion, NULL);
    
    -- Mensaje de confirmación (opcional)
    SELECT CONCAT('Parque ', p_nombre, ' registrado exitosamente.') AS mensaje;
END //

-- 2. Procedimiento que asigne un área específica a un parque determinado
CREATE PROCEDURE asignar_area_parque (
    IN p_id_parque INT,
    IN p_nombre_area VARCHAR(100),
    IN p_extension_hectareas DECIMAL(10,2),
    IN p_descripcion TEXT
)
BEGIN
    -- Verificar si el parque existe
    IF EXISTS (SELECT 1 FROM parque_natural WHERE id_parque = p_id_parque) THEN
        -- Insertar el área en la tabla area
        INSERT INTO area (id_parque, nombre, extension_hectareas, descripcion)
        VALUES (p_id_parque, p_nombre_area, p_extension_hectareas, p_descripcion);
        
        SELECT CONCAT('Área ', p_nombre_area, ' asignada al parque con ID ', p_id_parque, '.') AS mensaje;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El parque especificado no existe.';
    END IF;
END //

-- 3. Procedimiento que actualice la cantidad de especies en un área
CREATE PROCEDURE actualizar_cantidad_especies (
    IN p_id_area INT,
    IN p_id_especie INT,
    IN p_numero_inventario INT,
    IN p_fecha_conteo DATE
)
BEGIN
    -- Verificar si la relación área-especie existe
    IF EXISTS (SELECT 1 FROM area_especie WHERE id_area = p_id_area AND id_especie = p_id_especie) THEN
        -- Actualizar el inventario
        UPDATE area_especie
        SET numero_inventario = p_numero_inventario,
            fecha_ultimo_conteo = p_fecha_conteo,
            observaciones = CONCAT('Actualización manual el ', p_fecha_conteo)
        WHERE id_area = p_id_area AND id_especie = p_id_especie;
        
        SELECT CONCAT('Inventario actualizado para especie ', p_id_especie, ' en área ', p_id_area, '.') AS mensaje;
    ELSE
        -- Si no existe, insertar un nuevo registro
        INSERT INTO area_especie (id_area, id_especie, numero_inventario, fecha_ultimo_conteo)
        VALUES (p_id_area, p_id_especie, p_numero_inventario, p_fecha_conteo);
        
        SELECT CONCAT('Nueva relación área-especie registrada para especie ', p_id_especie, ' en área ', p_id_area, '.') AS mensaje;
    END IF;
END //

-- 4. Procedimiento para calcular la cantidad total de visitantes en un parque en un período dado
CREATE PROCEDURE calcular_visitantes_parque (
    IN p_id_parque INT,
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE
)
BEGIN
    -- Validar fechas
    IF p_fecha_inicio > p_fecha_fin THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha de inicio debe ser menor o igual a la fecha de fin.';
    END IF;
    
    -- Calcular total de visitantes en el período
    SELECT 
        p.nombre AS nombre_parque,
        COUNT(v.id_visita) AS total_visitantes,
        p_fecha_inicio AS fecha_inicio,
        p_fecha_fin AS fecha_fin
    FROM 
        parque_natural p
    LEFT JOIN 
        visita v ON p.id_parque = v.id_parque
    WHERE 
        p.id_parque = p_id_parque
        AND v.fecha_entrada BETWEEN p_fecha_inicio AND p_fecha_fin
    GROUP BY 
        p.id_parque, p.nombre;
END //

-- 5. Procedimiento que registre un nuevo visitante con todos sus datos
CREATE PROCEDURE registrar_visitante (
    IN p_cedula VARCHAR(20),
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_direccion VARCHAR(200),
    IN p_telefono VARCHAR(15),
    IN p_email VARCHAR(100),
    IN p_profesion VARCHAR(100)
)
BEGIN
    -- Insertar el nuevo visitante en la tabla visitante
    INSERT INTO visitante (cedula, nombre, apellido, direccion, telefono, email, profesion)
    VALUES (p_cedula, p_nombre, p_apellido, p_direccion, p_telefono, p_email, p_profesion);
    
    -- Mensaje de confirmación
    SELECT CONCAT('Visitante ', p_nombre, ' ', p_apellido, ' registrado con cédula ', p_cedula, '.') AS mensaje;
END //

-- 6. Procedimiento que asigne personal de gestión a un parque específico
CREATE PROCEDURE asignar_personal_gestion (
    IN p_id_personal INT,
    IN p_id_entrada INT
)
BEGIN
    -- Verificar si el personal existe y es de tipo "Personal de Gestión" (id_tipo_personal = 1)
    IF EXISTS (SELECT 1 FROM personal WHERE id_personal = p_id_personal AND id_tipo_personal = 1) THEN
        -- Verificar si la entrada existe
        IF EXISTS (SELECT 1 FROM entrada WHERE id_entrada = p_id_entrada) THEN
            -- Insertar en la tabla personal_gestion
            INSERT INTO personal_gestion (id_personal, id_entrada)
            VALUES (p_id_personal, p_id_entrada);
            
            SELECT CONCAT('Personal con ID ', p_id_personal, ' asignado a la entrada con ID ', p_id_entrada, '.') AS mensaje;
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La entrada especificada no existe.';
        END IF;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El personal especificado no existe o no es de tipo Gestión.';
    END IF;
END //

-- 7. Procedimiento para actualizar el sueldo de un empleado según su tipo de personal
CREATE PROCEDURE actualizar_sueldo_por_tipo (
    IN p_id_tipo_personal INT,
    IN p_porcentaje_aumento DECIMAL(5,2)
)
BEGIN
    -- Validar que el porcentaje sea positivo
    IF p_porcentaje_aumento <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El porcentaje de aumento debe ser mayor a 0.';
    END IF;
    
    -- Actualizar el sueldo de todos los empleados del tipo especificado
    UPDATE personal
    SET sueldo = sueldo * (1 + p_porcentaje_aumento / 100)
    WHERE id_tipo_personal = p_id_tipo_personal;
    
    SELECT CONCAT('Sueldo actualizado para todos los empleados de tipo ', p_id_tipo_personal, ' con un aumento del ', p_porcentaje_aumento, '%.') AS mensaje;
END //

-- 8. Procedimiento para registrar un nuevo proyecto de investigación
CREATE PROCEDURE registrar_proyecto_investigacion (
    IN p_nombre VARCHAR(200),
    IN p_descripcion TEXT,
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE,
    IN p_presupuesto DECIMAL(12,2)
)
BEGIN
    -- Validar que el presupuesto no sea negativo
    IF p_presupuesto < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El presupuesto no puede ser negativo.';
    END IF;
    
    -- Validar que la fecha de fin sea mayor o igual a la de inicio (si no es NULL)
    IF p_fecha_fin IS NOT NULL AND p_fecha_fin < p_fecha_inicio THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha de fin debe ser mayor o igual a la fecha de inicio.';
    END IF;
    
    -- Insertar el proyecto en la tabla proyecto_investigacion
    INSERT INTO proyecto_investigacion (nombre, descripcion, fecha_inicio, fecha_fin, presupuesto, estado)
    VALUES (p_nombre, p_descripcion, p_fecha_inicio, p_fecha_fin, p_presupuesto, 'Propuesto');
    
    SELECT CONCAT('Proyecto ', p_nombre, ' registrado exitosamente.') AS mensaje;
END //

-- 9. Procedimiento para asignar un investigador a un proyecto
CREATE PROCEDURE asignar_investigador_proyecto (
    IN p_id_proyecto INT,
    IN p_id_personal INT,
    IN p_rol VARCHAR(50)
)
BEGIN
    -- Verificar si el proyecto existe
    IF EXISTS (SELECT 1 FROM proyecto_investigacion WHERE id_proyecto = p_id_proyecto) THEN
        -- Verificar si el personal es un investigador (id_tipo_personal = 4)
        IF EXISTS (SELECT 1 FROM personal WHERE id_personal = p_id_personal AND id_tipo_personal = 4) THEN
            -- Insertar en la tabla proyecto_investigador
            INSERT INTO proyecto_investigador (id_proyecto, id_personal, rol, fecha_asignacion)
            VALUES (p_id_proyecto, p_id_personal, p_rol, CURDATE());
            
            SELECT CONCAT('Investigador con ID ', p_id_personal, ' asignado al proyecto con ID ', p_id_proyecto, ' con rol ', p_rol, '.') AS mensaje;
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El personal especificado no es un investigador.';
        END IF;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El proyecto especificado no existe.';
    END IF;
END //

-- 10. Procedimiento que elimine un parque y todas sus áreas asociadas
CREATE PROCEDURE eliminar_parque (
    IN p_id_parque INT
)
BEGIN
    -- Verificar si el parque existe
    IF EXISTS (SELECT 1 FROM parque_natural WHERE id_parque = p_id_parque) THEN
        -- Las relaciones con ON DELETE CASCADE eliminan automáticamente áreas, entradas, etc.
        DELETE FROM parque_natural
        WHERE id_parque = p_id_parque;
        
        SELECT CONCAT('Parque con ID ', p_id_parque, ' y sus áreas asociadas eliminados exitosamente.') AS mensaje;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El parque especificado no existe.';
    END IF;
END //

-- 11. Procedimiento que genere un informe de los proyectos en curso
CREATE PROCEDURE informe_proyectos_en_curso ()
BEGIN
    -- Seleccionar proyectos con estado "En Proceso"
    SELECT 
        p.id_proyecto,
        p.nombre AS nombre_proyecto,
        p.fecha_inicio,
        p.fecha_fin,
        p.presupuesto,
        COUNT(pi.id_personal) AS numero_investigadores,
        COUNT(pe.id_especie) AS numero_especies
    FROM 
        proyecto_investigacion p
    LEFT JOIN 
        proyecto_investigador pi ON p.id_proyecto = pi.id_proyecto
    LEFT JOIN 
        proyecto_especie pe ON p.id_proyecto = pe.id_proyecto
    WHERE 
        p.estado = 'En Proceso'
    GROUP BY 
        p.id_proyecto, p.nombre, p.fecha_inicio, p.fecha_fin, p.presupuesto
    ORDER BY 
        p.fecha_inicio ASC;
END //

-- 12. Procedimiento que asigne alojamiento a un visitante según la disponibilidad
CREATE PROCEDURE asignar_alojamiento_visitante (
    IN p_id_visitante INT,
    IN p_id_alojamiento INT,
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE,
    IN p_numero_personas INT
)
BEGIN
    DECLARE v_capacidad INT;
    DECLARE v_ocupacion_actual INT;
    DECLARE v_precio_noche DECIMAL(10,2);
    
    -- Obtener la capacidad y precio del alojamiento
    SELECT capacidad, precio_noche INTO v_capacidad, v_precio_noche
    FROM alojamiento
    WHERE id_alojamiento = p_id_alojamiento;
    
    -- Calcular la ocupación actual para el rango de fechas
    SELECT SUM(numero_personas) INTO v_ocupacion_actual
    FROM reserva
    WHERE id_alojamiento = p_id_alojamiento
    AND estado = 'Confirmada'
    AND (p_fecha_inicio <= fecha_fin AND p_fecha_fin >= fecha_inicio);
    
    -- Si no hay ocupación, inicializar en 0
    SET v_ocupacion_actual = IFNULL(v_ocupacion_actual, 0);
    
    -- Validar disponibilidad
    IF v_ocupacion_actual + p_numero_personas <= v_capacidad THEN
        -- Insertar la reserva
        INSERT INTO reserva (id_visitante, id_alojamiento, fecha_inicio, fecha_fin, numero_personas, precio_total, estado)
        VALUES (p_id_visitante, p_id_alojamiento, p_fecha_inicio, p_fecha_fin, p_numero_personas, 
                v_precio_noche * DATEDIFF(p_fecha_fin, p_fecha_inicio), 'Confirmada');
        
        SELECT CONCAT('Alojamiento asignado al visitante ', p_id_visitante, ' desde ', p_fecha_inicio, ' hasta ', p_fecha_fin, '.') AS mensaje;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay suficiente capacidad en el alojamiento para las fechas solicitadas.';
    END IF;
END //

-- 13. Procedimiento para eliminar registros antiguos de visitantes
CREATE PROCEDURE eliminar_visitantes_antiguos (
    IN p_anos_limite INT
)
BEGIN
    -- Eliminar visitantes cuya última visita sea anterior al límite de años
    DELETE FROM visitante
    WHERE id_visitante NOT IN (
        SELECT id_visitante
        FROM visita
        WHERE fecha_entrada >= DATE_SUB(CURDATE(), INTERVAL p_anos_limite YEAR)
    );
    
    SELECT CONCAT('Visitantes sin visitas en los últimos ', p_anos_limite, ' años eliminados.') AS mensaje;
END //

-- 14. Procedimiento que devuelva el inventario total de especies por parque
CREATE PROCEDURE inventario_especies_por_parque (
    IN p_id_parque INT
)
BEGIN
    -- Verificar si el parque existe
    IF EXISTS (SELECT 1 FROM parque_natural WHERE id_parque = p_id_parque) THEN
        -- Consultar el inventario de especies
        SELECT 
            p.nombre AS nombre_parque,
            te.nombre AS tipo_especie,
            e.denominacion_cientifica,
            e.denominacion_vulgar,
            SUM(ae.numero_inventario) AS total_individuos,
            MAX(ae.fecha_ultimo_conteo) AS ultima_actualizacion
        FROM 
            parque_natural p
        JOIN 
            area a ON p.id_parque = a.id_parque
        JOIN 
            area_especie ae ON a.id_area = ae.id_area
        JOIN 
            especie e ON ae.id_especie = e.id_especie
        JOIN 
            tipo_especie te ON e.id_tipo_especie = te.id_tipo_especie
        WHERE 
            p.id_parque = p_id_parque
        GROUP BY 
            p.nombre, te.nombre, e.denominacion_cientifica, e.denominacion_vulgar
        ORDER BY 
            te.nombre, e.denominacion_cientifica;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El parque especificado no existe.';
    END IF;
END //

-- 15. Procedimiento que aumente el presupuesto de un proyecto en base a un porcentaje
CREATE PROCEDURE aumentar_presupuesto_proyecto (
    IN p_id_proyecto INT,
    IN p_porcentaje_aumento DECIMAL(5,2)
)
BEGIN
    -- Validar que el porcentaje sea positivo
    IF p_porcentaje_aumento <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El porcentaje de aumento debe ser mayor a 0.';
    END IF;
    
    -- Verificar si el proyecto existe
    IF EXISTS (SELECT 1 FROM proyecto_investigacion WHERE id_proyecto = p_id_proyecto) THEN
        -- Actualizar el presupuesto
        UPDATE proyecto_investigacion
        SET presupuesto = presupuesto * (1 + p_porcentaje_aumento / 100)
        WHERE id_proyecto = p_id_proyecto;
        
        SELECT CONCAT('Presupuesto del proyecto con ID ', p_id_proyecto, ' aumentado en un ', p_porcentaje_aumento, '%.') AS mensaje;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El proyecto especificado no existe.';
    END IF;
END //

-- 16. Procedimiento para transferir personal de un parque a otro
CREATE PROCEDURE transferir_personal_parque (
    IN p_id_personal INT,
    IN p_id_entrada_nueva INT
)
BEGIN
    DECLARE v_id_tipo_personal INT;
    
    -- Obtener el tipo de personal
    SELECT id_tipo_personal INTO v_id_tipo_personal
    FROM personal
    WHERE id_personal = p_id_personal;
    
    -- Verificar si el personal existe
    IF v_id_tipo_personal IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El personal especificado no existe.';
    END IF;
    
    -- Verificar si la nueva entrada existe
    IF NOT EXISTS (SELECT 1 FROM entrada WHERE id_entrada = p_id_entrada_nueva) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La entrada especificada no existe.';
    END IF;
    
    -- Si es Personal de Gestión (id_tipo_personal = 1), actualizar la asignación
    IF v_id_tipo_personal = 1 THEN
        UPDATE personal_gestion
        SET id_entrada = p_id_entrada_nueva
        WHERE id_personal = p_id_personal;
        
        SELECT CONCAT('Personal de Gestión con ID ', p_id_personal, ' transferido a la entrada con ID ', p_id_entrada_nueva, '.') AS mensaje;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Este procedimiento solo aplica a Personal de Gestión.';
    END IF;
END //

-- 17. Procedimiento que liste todos los visitantes de un parque en un día específico
CREATE PROCEDURE listar_visitantes_dia (
    IN p_id_parque INT,
    IN p_fecha DATE
)
BEGIN
    -- Verificar si el parque existe
    IF EXISTS (SELECT 1 FROM parque_natural WHERE id_parque = p_id_parque) THEN
        -- Listar visitantes del día especificado
        SELECT 
            p.nombre AS nombre_parque,
            v.id_visita,
            vis.cedula,
            vis.nombre,
            vis.apellido,
            v.fecha_entrada,
            v.fecha_salida
        FROM 
            visita v
        JOIN 
            visitante vis ON v.id_visitante = vis.id_visitante
        JOIN 
            parque_natural p ON v.id_parque = p.id_parque
        WHERE 
            v.id_parque = p_id_parque
            AND DATE(v.fecha_entrada) = p_fecha
        ORDER BY 
            v.fecha_entrada ASC;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El parque especificado no existe.';
    END IF;
END //

-- 18. Procedimiento para reasignar áreas de vigilancia a personal de seguridad
CREATE PROCEDURE reasignar_areas_vigilancia (
    IN p_id_personal INT,
    IN p_id_area_nueva INT
)
BEGIN
    -- Verificar si el personal es de vigilancia (id_tipo_personal = 2)
    IF EXISTS (SELECT 1 FROM personal WHERE id_personal = p_id_personal AND id_tipo_personal = 2) THEN
        -- Verificar si el área existe
        IF EXISTS (SELECT 1 FROM area WHERE id_area = p_id_area_nueva) THEN
            -- Eliminar asignaciones previas del personal (si las hay)
            DELETE FROM area_vigilancia
            WHERE id_personal = p_id_personal;
            
            -- Asignar la nueva área
            INSERT INTO area_vigilancia (id_personal, id_area, fecha_asignacion)
            VALUES (p_id_personal, p_id_area_nueva, CURDATE());
            
            SELECT CONCAT('Área con ID ', p_id_area_nueva, ' asignada al personal de vigilancia con ID ', p_id_personal, '.') AS mensaje;
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El área especificada no existe.';
        END IF;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El personal especificado no existe o no es de vigilancia.';
    END IF;
END //

-- 19. Procedimiento que registre el uso de vehículos en un parque
CREATE PROCEDURE registrar_uso_vehiculo (
    IN p_id_personal INT,
    IN p_id_vehiculo INT,
    IN p_id_area INT
)
BEGIN
    -- Verificar si el personal es de vigilancia (id_tipo_personal = 2)
    IF EXISTS (SELECT 1 FROM personal WHERE id_personal = p_id_personal AND id_tipo_personal = 2) THEN
        -- Verificar si el vehículo existe
        IF EXISTS (SELECT 1 FROM vehiculo WHERE id_vehiculo = p_id_vehiculo) THEN
            -- Verificar si el área existe
            IF EXISTS (SELECT 1 FROM area WHERE id_area = p_id_area) THEN
                -- Actualizar el vehículo asignado al personal
                UPDATE personal_vigilancia
                SET id_vehiculo = p_id_vehiculo
                WHERE id_personal = p_id_personal;
                
                -- Registrar el área de vigilancia si no está asignada
                IF NOT EXISTS (SELECT 1 FROM area_vigilancia WHERE id_personal = p_id_personal AND id_area = p_id_area) THEN
                    INSERT INTO area_vigilancia (id_personal, id_area, fecha_asignacion)
                    VALUES (p_id_personal, p_id_area, CURDATE());
                END IF;
                
                SELECT CONCAT('Uso de vehículo con ID ', p_id_vehiculo, ' registrado para personal con ID ', p_id_personal, ' en área ', p_id_area, '.') AS mensaje;
            ELSE
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El área especificada no existe.';
            END IF;
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El vehículo especificado no existe.';
        END IF;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El personal especificado no es de vigilancia.';
    END IF;
END //

-- 20. Procedimiento para deshabilitar un alojamiento temporalmente
CREATE PROCEDURE deshabilitar_alojamiento (
    IN p_id_alojamiento INT,
    IN p_fecha_reactivacion DATE
)
BEGIN
    -- Verificar si el alojamiento existe
    IF EXISTS (SELECT 1 FROM alojamiento WHERE id_alojamiento = p_id_alojamiento) THEN
        -- Cancelar reservas futuras
        UPDATE reserva
        SET estado = 'Cancelada'
        WHERE id_alojamiento = p_id_alojamiento
        AND fecha_inicio >= CURDATE()
        AND estado = 'Pendiente';
        
        -- Aquí podríamos agregar un campo "estado" en alojamiento si existiera, pero como no está en el DDL,
        -- usamos una solución alternativa: registrar en la descripción
        UPDATE alojamiento
        SET descripcion = CONCAT(descripcion, ' [Deshabilitado hasta ', p_fecha_reactivacion, ']')
        WHERE id_alojamiento = p_id_alojamiento;
        
        SELECT CONCAT('Alojamiento con ID ', p_id_alojamiento, ' deshabilitado hasta ', p_fecha_reactivacion, '.') AS mensaje;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El alojamiento especificado no existe.';
    END IF;
END //

-- Restaurar delimitador
DELIMITER ;

-- Ejemplos de ejecución para probar los procedimientos
-- 1
CALL registrar_parque('Parque Nacional Test', '2025-03-09');

-- 2
CALL asignar_area_parque(1, 'Zona Norte', 150.75, 'Área boscosa con especies nativas.');

-- 3
CALL actualizar_cantidad_especies(1, 1, 50, '2025-03-09');

-- 4
CALL calcular_visitantes_parque(1, '2025-01-01', '2025-12-31');

-- 5
CALL registrar_visitante('123456789', 'Juan', 'Pérez', 'Calle Falsa 123', '555-1234', 'juan@example.com', 'Biólogo');

-- 6
CALL asignar_personal_gestion(1, 1);

-- 7
CALL actualizar_sueldo_por_tipo(1, 10.5); -- Aumenta el sueldo del Personal de Gestión en 10.5%

-- 8
CALL registrar_proyecto_investigacion('Estudio de Flora Nativa', 'Análisis de especies vegetales', '2025-04-01', '2025-12-31', 50000.00);

-- 9
CALL asignar_investigador_proyecto(1, 2, 'Investigador Principal');

-- 10
CALL eliminar_parque(1);

-- 11
CALL informe_proyectos_en_curso();

-- 12
CALL asignar_alojamiento_visitante(1, 1, '2025-06-01', '2025-06-05', 2);

-- 13
CALL eliminar_visitantes_antiguos(2); -- Elimina visitantes sin visitas en los últimos 2 años

-- 14
CALL inventario_especies_por_parque(1);

-- 15
CALL aumentar_presupuesto_proyecto(1, 15.0); -- Aumenta el presupuesto del proyecto 1 en 15%

-- 16
CALL transferir_personal_parque(1, 2);

-- 17
CALL listar_visitantes_dia(1, '2025-03-09');

-- 18
CALL reasignar_areas_vigilancia(2, 1);

-- 19
CALL registrar_uso_vehiculo(2, 1, 1);

-- 20
CALL deshabilitar_alojamiento(1, '2025-12-31');
