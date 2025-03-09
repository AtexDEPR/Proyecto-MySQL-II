-- --------------------------------------------------
-- Script SQL con Triggers
-- --------------------------------------------------

-- Usar la base de datos
USE los_ambientales;


-- 1. Trigger para registrar cada inserción en la tabla de visitantes 
DELIMITER //
CREATE TRIGGER tr_registrar_nuevo_visitante
AFTER INSERT ON visitante
FOR EACH ROW
BEGIN
    INSERT INTO log_eventos (tabla_afectada, accion, id_registro, usuario, detalles)
    VALUES (
        'visitante',
        'INSERT',
        NEW.id_visitante,
        CURRENT_USER(),
        CONCAT('Nuevo visitante: ', NEW.nombre, ' ', NEW.apellido, ' - Cédula: ', NEW.cedula)
    );
END//
DELIMITER ;

-- 2. Trigger para impedir eliminar un parque si tiene áreas asignadas 
DELIMITER //
CREATE TRIGGER tr_proteger_parque_con_areas
BEFORE DELETE ON parque_natural
FOR EACH ROW
BEGIN
    DECLARE area_count INT;
    SELECT COUNT(*) INTO area_count FROM area WHERE id_parque = OLD.id_parque;
    IF area_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar un parque con áreas asignadas';
    END IF;
END//
DELIMITER ;

-- 3. Trigger para actualizar inventario al insertar una nueva especie 
DELIMITER //
CREATE TRIGGER tr_actualizar_inventario_especie
AFTER INSERT ON area_especie
FOR EACH ROW
BEGIN
    INSERT INTO log_eventos (tabla_afectada, accion, id_registro, usuario, detalles)
    VALUES (
        'area_especie',
        'INSERT',
        NEW.id_especie,
        CURRENT_USER(),
        CONCAT('Especie asignada al área ', NEW.id_area, ' - Inventario: ', NEW.numero_inventario)
    );
END//
DELIMITER ;

-- 4. Trigger para registrar cambios en el sueldo de los empleados 
DELIMITER //
CREATE TRIGGER tr_registrar_cambio_sueldo
AFTER UPDATE ON personal
FOR EACH ROW
BEGIN
    IF OLD.sueldo != NEW.sueldo THEN
        INSERT INTO log_eventos (tabla_afectada, accion, id_registro, usuario, detalles)
        VALUES (
            'personal',
            'UPDATE',
            NEW.id_personal,
            CURRENT_USER(),
            CONCAT('Sueldo cambiado de ', OLD.sueldo, ' a ', NEW.sueldo, ' - ', NEW.nombre, ' ', NEW.apellido)
        );
    END IF;
END//
DELIMITER ;

-- 5. Trigger para evitar registros duplicados de visitantes por cédula 
DELIMITER //
CREATE TRIGGER tr_evitar_visitante_duplicado
BEFORE INSERT ON visitante
FOR EACH ROW
BEGIN
    DECLARE cedula_count INT;
    SELECT COUNT(*) INTO cedula_count FROM visitante WHERE cedula = NEW.cedula;
    IF cedula_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ya existe un visitante con esta cédula';
    END IF;
END//
DELIMITER ;

-- 6. Trigger para registrar asignación de investigador a proyecto 
DELIMITER //
CREATE TRIGGER tr_registrar_asignacion_investigador
AFTER INSERT ON proyecto_investigador
FOR EACH ROW
BEGIN
    DECLARE nombre_investigador VARCHAR(200);
    SELECT CONCAT(nombre, ' ', apellido) INTO nombre_investigador 
    FROM personal WHERE id_personal = NEW.id_personal;
    
    INSERT INTO log_eventos (tabla_afectada, accion, id_registro, usuario, detalles)
    VALUES (
        'proyecto_investigador',
        'INSERT',
        NEW.id_proyecto,
        CURRENT_USER(),
        CONCAT('Investigador ', nombre_investigador, ' asignado al proyecto ', NEW.id_proyecto)
    );
END//
DELIMITER ;

-- 7. Trigger para actualizar capacidad tras una reserva 
DELIMITER //
CREATE TRIGGER tr_actualizar_capacidad_alojamiento
BEFORE INSERT ON reserva
FOR EACH ROW
BEGIN
    DECLARE capacidad_total INT;
    DECLARE ocupacion_actual INT;
    
    SELECT capacidad INTO capacidad_total FROM alojamiento WHERE id_alojamiento = NEW.id_alojamiento;
    SELECT COALESCE(SUM(numero_personas), 0) INTO ocupacion_actual
    FROM reserva
    WHERE id_alojamiento = NEW.id_alojamiento
    AND estado = 'Confirmada'
    AND (fecha_inicio <= NEW.fecha_fin AND fecha_fin >= NEW.fecha_inicio);
    
    IF (ocupacion_actual + NEW.numero_personas) > capacidad_total THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La reserva excede la capacidad del alojamiento';
    END IF;
END//
DELIMITER ;

-- 8. Trigger para verificar que el presupuesto no sea negativo 
DELIMITER //
CREATE TRIGGER tr_verificar_presupuesto_proyecto
BEFORE INSERT ON proyecto_investigacion
FOR EACH ROW
BEGIN
    IF NEW.presupuesto < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El presupuesto del proyecto no puede ser negativo';
    END IF;
END//
DELIMITER ;

-- 9. Trigger para impedir eliminar investigador en proyectos activos 
DELIMITER //
CREATE TRIGGER tr_proteger_investigador_activo
BEFORE DELETE ON personal_investigador
FOR EACH ROW
BEGIN
    DECLARE proyecto_count INT;
    SELECT COUNT(*) INTO proyecto_count
    FROM proyecto_investigador pi
    JOIN proyecto_investigacion p ON pi.id_proyecto = p.id_proyecto
    WHERE pi.id_personal = OLD.id_personal AND p.estado = 'En Proceso';
    
    IF proyecto_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar un investigador asignado a proyectos activos';
    END IF;
END//
DELIMITER ;

-- 10. Trigger para actualizar cantidad de empleados por parque 
DELIMITER //
CREATE TRIGGER tr_actualizar_empleados_parque
AFTER INSERT ON personal
FOR EACH ROW
BEGIN
    INSERT INTO log_eventos (tabla_afectada, accion, id_registro, usuario, detalles)
    VALUES (
        'personal',
        'INSERT',
        NEW.id_personal,
        CURRENT_USER(),
        CONCAT('Nuevo empleado ', NEW.nombre, ' ', NEW.apellido, ' tipo: ', NEW.id_tipo_personal)
    );
END//
DELIMITER ;

-- 11. Trigger para registrar salida de visitantes 
DELIMITER //
CREATE TRIGGER tr_registrar_salida_visitante
AFTER UPDATE ON visita
FOR EACH ROW
BEGIN
    IF NEW.fecha_salida IS NOT NULL AND OLD.fecha_salida IS NULL THEN
        INSERT INTO log_eventos (tabla_afectada, accion, id_registro, usuario, detalles)
        VALUES (
            'visita',
            'UPDATE',
            NEW.id_visita,
            CURRENT_USER(),
            CONCAT('Visitante salió del parque el ', NEW.fecha_salida)
        );
    END IF;
END//
DELIMITER ;

-- 12. Trigger para verificar sueldo mínimo 
DELIMITER //
CREATE TRIGGER tr_verificar_sueldo_minimo
BEFORE UPDATE ON personal
FOR EACH ROW
BEGIN
    DECLARE sueldo_minimo DECIMAL(10,2) DEFAULT 1423500; 
    IF NEW.sueldo < sueldo_minimo THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El sueldo no puede ser menor al mínimo establecido';
    END IF;
END//
DELIMITER ;

-- 13. Trigger para registrar modificaciones en áreas
DELIMITER //
CREATE TRIGGER tr_registrar_modificacion_area
AFTER UPDATE ON area
FOR EACH ROW
BEGIN
    INSERT INTO log_eventos (tabla_afectada, accion, id_registro, usuario, detalles)
    VALUES (
        'area',
        'UPDATE',
        NEW.id_area,
        CURRENT_USER(),
        CONCAT('Área modificada: ', NEW.nombre, ' - Extensión: ', NEW.extension_hectareas)
    );
END//
DELIMITER ;

-- 14. Trigger para impedir eliminar especie asignada a proyecto 
DELIMITER //
CREATE TRIGGER tr_proteger_especie_en_proyecto
BEFORE DELETE ON especie
FOR EACH ROW
BEGIN
    DECLARE proyecto_count INT;
    SELECT COUNT(*) INTO proyecto_count FROM proyecto_especie WHERE id_especie = OLD.id_especie;
    IF proyecto_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar una especie asignada a un proyecto';
    END IF;
END//
DELIMITER ;

-- 15. Trigger para actualizar estado de alojamiento en mantenimiento 
DELIMITER //
CREATE TRIGGER tr_actualizar_estado_mantenimiento
AFTER UPDATE ON alojamiento
FOR EACH ROW
BEGIN
    IF NEW.descripcion LIKE '%mantenimiento%' AND OLD.descripcion NOT LIKE '%mantenimiento%' THEN
        INSERT INTO log_eventos (tabla_afectada, accion, id_registro, usuario, detalles)
        VALUES (
            'alojamiento',
            'UPDATE',
            NEW.id_alojamiento,
            CURRENT_USER(),
            CONCAT('Alojamiento ', NEW.nombre, ' puesto en mantenimiento')
        );
    END IF;
END//
DELIMITER ;

-- 16. Trigger para notificar finalización de proyecto 
DELIMITER //
CREATE TRIGGER tr_notificar_fin_proyecto
AFTER UPDATE ON proyecto_investigacion
FOR EACH ROW
BEGIN
    IF NEW.estado = 'Completado' AND OLD.estado != 'Completado' THEN
        INSERT INTO log_eventos (tabla_afectada, accion, id_registro, usuario, detalles)
        VALUES (
            'proyecto_investigacion',
            'UPDATE',
            NEW.id_proyecto,
            CURRENT_USER(),
            CONCAT('Proyecto ', NEW.nombre, ' completado el ', NEW.fecha_fin)
        );
    END IF;
END//
DELIMITER ;

-- 17. Trigger para evitar áreas menores a 1 hectárea 
DELIMITER //
CREATE TRIGGER tr_verificar_extension_area
BEFORE INSERT ON area
FOR EACH ROW
BEGIN
    IF NEW.extension_hectareas < 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El área debe tener al menos 1 hectárea';
    END IF;
END//
DELIMITER ;

-- 18. Trigger para registrar cambio de parque de empleado 
DELIMITER //
CREATE TRIGGER tr_registrar_cambio_parque_empleado
AFTER UPDATE ON personal_gestion
FOR EACH ROW
BEGIN
    IF NEW.id_entrada != OLD.id_entrada THEN
        DECLARE parque_nuevo VARCHAR(150);
        SELECT p.nombre INTO parque_nuevo 
        FROM entrada e 
        JOIN parque_natural p ON e.id_parque = p.id_parque 
        WHERE e.id_entrada = NEW.id_entrada;
        
        INSERT INTO log_eventos (tabla_afectada, accion, id_registro, usuario, detalles)
        VALUES (
            'personal_gestion',
            'UPDATE',
            NEW.id_personal,
            CURRENT_USER(),
            CONCAT('Empleado trasladado a parque: ', parque_nuevo)
        );
    END IF;
END//
DELIMITER ;

-- 19. Trigger para impedir proyecto sin presupuesto 
DELIMITER //
CREATE TRIGGER tr_verificar_presupuesto_obligatorio
BEFORE INSERT ON proyecto_investigacion
FOR EACH ROW
BEGIN
    IF NEW.presupuesto IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El presupuesto es obligatorio para un proyecto';
    END IF;
END//
DELIMITER ;

-- 20. Trigger para actualizar fecha de última modificación de parque 
DELIMITER //
CREATE TRIGGER tr_actualizar_modificacion_parque
AFTER UPDATE ON parque_natural
FOR EACH ROW
BEGIN
    INSERT INTO log_eventos (tabla_afectada, accion, id_registro, usuario, detalles)
    VALUES (
        'parque_natural',
        'UPDATE',
        NEW.id_parque,
        CURRENT_USER(),
        CONCAT('Parque ', NEW.nombre, ' modificado el ', CURRENT_TIMESTAMP)
    );
END//
DELIMITER ;

-- --------------------------------------------------
-- Confirmar cambios
-- --------------------------------------------------
FLUSH PRIVILEGES;





