-- --------------------------------------------------
-- DDL para el proyecto "Los Ambientales"
-- Base de datos para la gestión de parques naturales
-- --------------------------------------------------

-- Eliminar la base de datos si existe
DROP DATABASE IF EXISTS los_ambientales;

-- Crear la base de datos
CREATE DATABASE los_ambientales;

-- Usar la base de datos
USE los_ambientales;

-- --------------------------------------------------
-- Tablas principales
-- --------------------------------------------------

-- Tabla departamento
CREATE TABLE departamento (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    CONSTRAINT uk_departamento_nombre UNIQUE (nombre)
);

-- Tabla entidad_responsable
CREATE TABLE entidad_responsable (
    id_entidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL,
    CONSTRAINT uk_entidad_responsable_nombre UNIQUE (nombre)
);

-- Tabla de relación entre departamento y entidad_responsable
CREATE TABLE departamento_entidad (
    id_departamento INT NOT NULL,
    id_entidad INT NOT NULL,
    PRIMARY KEY (id_departamento, id_entidad),
    CONSTRAINT fk_departamento_entidad_departamento FOREIGN KEY (id_departamento) REFERENCES departamento (id_departamento) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_departamento_entidad_entidad FOREIGN KEY (id_entidad) REFERENCES entidad_responsable (id_entidad) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabla parque_natural
CREATE TABLE parque_natural (
    id_parque INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    fecha_declaracion DATE NOT NULL,
    descripcion TEXT,
    CONSTRAINT uk_parque_natural_nombre UNIQUE (nombre)
);

-- Tabla de relación entre parque y departamento
CREATE TABLE parque_departamento (
    id_parque INT NOT NULL,
    id_departamento INT NOT NULL,
    PRIMARY KEY (id_parque, id_departamento),
    CONSTRAINT fk_parque_departamento_parque FOREIGN KEY (id_parque) REFERENCES parque_natural (id_parque) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_parque_departamento_departamento FOREIGN KEY (id_departamento) REFERENCES departamento (id_departamento) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabla area
CREATE TABLE area (
    id_area INT AUTO_INCREMENT PRIMARY KEY,
    id_parque INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    extension_hectareas DECIMAL(10,2) NOT NULL,
    descripcion TEXT,
    CONSTRAINT fk_area_parque FOREIGN KEY (id_parque) REFERENCES parque_natural (id_parque) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT uk_area_parque_nombre UNIQUE (id_parque, nombre)
);

-- Tabla tipo_especie
CREATE TABLE tipo_especie (
    id_tipo_especie INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    CONSTRAINT uk_tipo_especie_nombre UNIQUE (nombre)
);

-- Insertar los tres tipos básicos de especies
INSERT INTO tipo_especie (nombre) VALUES ('Vegetal'), ('Animal'), ('Mineral');

-- Tabla especie
CREATE TABLE especie (
    id_especie INT AUTO_INCREMENT PRIMARY KEY,
    id_tipo_especie INT NOT NULL,
    denominacion_cientifica VARCHAR(150) NOT NULL,
    denominacion_vulgar VARCHAR(100) NOT NULL,
    descripcion TEXT,
    CONSTRAINT fk_especie_tipo FOREIGN KEY (id_tipo_especie) REFERENCES tipo_especie (id_tipo_especie) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uk_especie_denominacion_cientifica UNIQUE (denominacion_cientifica)
);

-- Tabla de relación entre área y especie (con inventario)
CREATE TABLE area_especie (
    id_area INT NOT NULL,
    id_especie INT NOT NULL,
    numero_inventario INT NOT NULL DEFAULT 0,
    fecha_ultimo_conteo DATE NOT NULL,
    observaciones TEXT,
    PRIMARY KEY (id_area, id_especie),
    CONSTRAINT fk_area_especie_area FOREIGN KEY (id_area) REFERENCES area (id_area) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_area_especie_especie FOREIGN KEY (id_especie) REFERENCES especie (id_especie) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabla tipo_personal
CREATE TABLE tipo_personal (
    id_tipo_personal INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    CONSTRAINT uk_tipo_personal_nombre UNIQUE (nombre)
);

-- Insertar los cuatro tipos básicos de personal
INSERT INTO tipo_personal VALUES 
(1, 'Personal de Gestión', 'Registra datos de visitantes en las entradas'),
(2, 'Personal de Vigilancia', 'Vigila áreas específicas del parque con vehículos'),
(3, 'Personal de Conservación', 'Mantiene áreas específicas con especialidades como limpieza o mantenimiento'),
(4, 'Personal Investigador', 'Realiza proyectos de investigación sobre especies');

-- Tabla personal
CREATE TABLE personal (
    id_personal INT AUTO_INCREMENT PRIMARY KEY,
    cedula VARCHAR(20) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    telefono_fijo VARCHAR(15),
    telefono_movil VARCHAR(15) NOT NULL,
    email VARCHAR(100),
    fecha_contratacion DATE NOT NULL,
    sueldo DECIMAL(10,2) NOT NULL,
    id_tipo_personal INT NOT NULL,
    CONSTRAINT fk_personal_tipo FOREIGN KEY (id_tipo_personal) REFERENCES tipo_personal (id_tipo_personal) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uk_personal_cedula UNIQUE (cedula)
);

-- Tabla entrada (para Personal de Gestión)
CREATE TABLE entrada (
    id_entrada INT AUTO_INCREMENT PRIMARY KEY,
    id_parque INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(200) NOT NULL,
    CONSTRAINT fk_entrada_parque FOREIGN KEY (id_parque) REFERENCES parque_natural (id_parque) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT uk_entrada_parque_nombre UNIQUE (id_parque, nombre)
);

-- Tabla personal_gestion
CREATE TABLE personal_gestion (
    id_personal INT PRIMARY KEY,
    id_entrada INT NOT NULL,
    CONSTRAINT fk_personal_gestion_personal FOREIGN KEY (id_personal) REFERENCES personal (id_personal) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_personal_gestion_entrada FOREIGN KEY (id_entrada) REFERENCES entrada (id_entrada) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Tabla tipo_vehiculo
CREATE TABLE tipo_vehiculo (
    id_tipo_vehiculo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    CONSTRAINT uk_tipo_vehiculo_nombre UNIQUE (nombre)
);

-- Tabla vehiculo (para Personal de Vigilancia)
CREATE TABLE vehiculo (
    id_vehiculo INT AUTO_INCREMENT PRIMARY KEY,
    id_tipo_vehiculo INT NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    placa VARCHAR(20) NOT NULL,
    año INT NOT NULL,
    CONSTRAINT fk_vehiculo_tipo FOREIGN KEY (id_tipo_vehiculo) REFERENCES tipo_vehiculo (id_tipo_vehiculo) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uk_vehiculo_placa UNIQUE (placa)
);

-- Tabla personal_vigilancia
CREATE TABLE personal_vigilancia (
    id_personal INT PRIMARY KEY,
    id_vehiculo INT,
    CONSTRAINT fk_personal_vigilancia_personal FOREIGN KEY (id_personal) REFERENCES personal (id_personal) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_personal_vigilancia_vehiculo FOREIGN KEY (id_vehiculo) REFERENCES vehiculo (id_vehiculo) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Tabla area_vigilancia (relación entre personal de vigilancia y áreas asignadas)
CREATE TABLE area_vigilancia (
    id_personal INT NOT NULL,
    id_area INT NOT NULL,
    fecha_asignacion DATE NOT NULL,
    PRIMARY KEY (id_personal, id_area),
    CONSTRAINT fk_area_vigilancia_personal FOREIGN KEY (id_personal) REFERENCES personal_vigilancia (id_personal) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_area_vigilancia_area FOREIGN KEY (id_area) REFERENCES area (id_area) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabla especialidad_conservacion
CREATE TABLE especialidad_conservacion (
    id_especialidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    CONSTRAINT uk_especialidad_conservacion_nombre UNIQUE (nombre)
);

-- Tabla personal_conservacion
CREATE TABLE personal_conservacion (
    id_personal INT PRIMARY KEY,
    id_especialidad INT NOT NULL,
    CONSTRAINT fk_personal_conservacion_personal FOREIGN KEY (id_personal) REFERENCES personal (id_personal) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_personal_conservacion_especialidad FOREIGN KEY (id_especialidad) REFERENCES especialidad_conservacion (id_especialidad) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Tabla area_conservacion (relación entre personal de conservación y áreas asignadas)
CREATE TABLE area_conservacion (
    id_personal INT NOT NULL,
    id_area INT NOT NULL,
    fecha_asignacion DATE NOT NULL,
    PRIMARY KEY (id_personal, id_area),
    CONSTRAINT fk_area_conservacion_personal FOREIGN KEY (id_personal) REFERENCES personal_conservacion (id_personal) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_area_conservacion_area FOREIGN KEY (id_area) REFERENCES area (id_area) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabla proyecto_investigacion
CREATE TABLE proyecto_investigacion (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    presupuesto DECIMAL(12,2) NOT NULL,
    estado ENUM('Propuesto', 'Aprobado', 'En Proceso', 'Completado', 'Cancelado') NOT NULL DEFAULT 'Propuesto',
    CONSTRAINT uk_proyecto_investigacion_nombre UNIQUE (nombre),
    CONSTRAINT chk_proyecto_fechas CHECK (fecha_fin IS NULL OR fecha_fin >= fecha_inicio)
);

-- Tabla personal_investigador
CREATE TABLE personal_investigador (
    id_personal INT PRIMARY KEY,
    especialidad VARCHAR(100) NOT NULL,
    grado_academico VARCHAR(50) NOT NULL,
    CONSTRAINT fk_personal_investigador_personal FOREIGN KEY (id_personal) REFERENCES personal (id_personal) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabla proyecto_investigador (relación entre proyectos e investigadores)
CREATE TABLE proyecto_investigador (
    id_proyecto INT NOT NULL,
    id_personal INT NOT NULL,
    rol VARCHAR(50) NOT NULL,
    fecha_asignacion DATE NOT NULL,
    PRIMARY KEY (id_proyecto, id_personal),
    CONSTRAINT fk_proyecto_investigador_proyecto FOREIGN KEY (id_proyecto) REFERENCES proyecto_investigacion (id_proyecto) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_proyecto_investigador_personal FOREIGN KEY (id_personal) REFERENCES personal_investigador (id_personal) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabla proyecto_especie (relación entre proyectos y especies investigadas)
CREATE TABLE proyecto_especie (
    id_proyecto INT NOT NULL,
    id_especie INT NOT NULL,
    observaciones TEXT,
    PRIMARY KEY (id_proyecto, id_especie),
    CONSTRAINT fk_proyecto_especie_proyecto FOREIGN KEY (id_proyecto) REFERENCES proyecto_investigacion (id_proyecto) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_proyecto_especie_especie FOREIGN KEY (id_especie) REFERENCES especie (id_especie) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabla visitante
CREATE TABLE visitante (
    id_visitante INT AUTO_INCREMENT PRIMARY KEY,
    cedula VARCHAR(20) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    direccion VARCHAR(200),
    telefono VARCHAR(15),
    email VARCHAR(100),
    profesion VARCHAR(100),
    CONSTRAINT uk_visitante_cedula UNIQUE (cedula)
);

-- Tabla categoria_alojamiento
CREATE TABLE categoria_alojamiento (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    CONSTRAINT uk_categoria_alojamiento_nombre UNIQUE (nombre)
);

-- Tabla alojamiento
CREATE TABLE alojamiento (
    id_alojamiento INT AUTO_INCREMENT PRIMARY KEY,
    id_parque INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    id_categoria INT NOT NULL,
    capacidad INT NOT NULL,
    precio_noche DECIMAL(10,2) NOT NULL,
    descripcion TEXT,
    CONSTRAINT fk_alojamiento_parque FOREIGN KEY (id_parque) REFERENCES parque_natural (id_parque) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_alojamiento_categoria FOREIGN KEY (id_categoria) REFERENCES categoria_alojamiento (id_categoria) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uk_alojamiento_parque_nombre UNIQUE (id_parque, nombre),
    CONSTRAINT chk_alojamiento_capacidad CHECK (capacidad > 0),
    CONSTRAINT chk_alojamiento_precio CHECK (precio_noche >= 0)
);

-- Tabla reserva
CREATE TABLE reserva (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_visitante INT NOT NULL,
    id_alojamiento INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    numero_personas INT NOT NULL,
    precio_total DECIMAL(10,2) NOT NULL,
    estado ENUM('Pendiente', 'Confirmada', 'Cancelada', 'Completada') NOT NULL DEFAULT 'Pendiente',
    fecha_reserva TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_reserva_visitante FOREIGN KEY (id_visitante) REFERENCES visitante (id_visitante) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_reserva_alojamiento FOREIGN KEY (id_alojamiento) REFERENCES alojamiento (id_alojamiento) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_reserva_fechas CHECK (fecha_fin > fecha_inicio),
    CONSTRAINT chk_reserva_personas CHECK (numero_personas > 0)
);

-- Tabla visita
CREATE TABLE visita (
    id_visita INT AUTO_INCREMENT PRIMARY KEY,
    id_visitante INT NOT NULL,
    id_parque INT NOT NULL,
    id_entrada INT NOT NULL,
    fecha_entrada DATETIME NOT NULL,
    fecha_salida DATETIME,
    id_personal_registro INT NOT NULL,
    observaciones TEXT,
    CONSTRAINT fk_visita_visitante FOREIGN KEY (id_visitante) REFERENCES visitante (id_visitante) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_visita_parque FOREIGN KEY (id_parque) REFERENCES parque_natural (id_parque) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_visita_entrada FOREIGN KEY (id_entrada) REFERENCES entrada (id_entrada) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_visita_personal FOREIGN KEY (id_personal_registro) REFERENCES personal_gestion (id_personal) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT chk_visita_fechas CHECK (fecha_salida IS NULL OR fecha_salida > fecha_entrada)
);

-- Tabla actividad
CREATE TABLE actividad (
    id_actividad INT AUTO_INCREMENT PRIMARY KEY,
    id_parque INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    duracion_minutos INT NOT NULL,
    capacidad_maxima INT,
    precio DECIMAL(10,2) NOT NULL DEFAULT 0,
    CONSTRAINT fk_actividad_parque FOREIGN KEY (id_parque) REFERENCES parque_natural (id_parque) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT uk_actividad_parque_nombre UNIQUE (id_parque, nombre),
    CONSTRAINT chk_actividad_duracion CHECK (duracion_minutos > 0)
);

-- Tabla actividad_visitante (relación entre actividades y visitantes)
CREATE TABLE actividad_visitante (
    id_actividad INT NOT NULL,
    id_visita INT NOT NULL,
    fecha_hora DATETIME NOT NULL,
    numero_personas INT NOT NULL DEFAULT 1,
    precio_pagado DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_actividad, id_visita),
    CONSTRAINT fk_actividad_visitante_actividad FOREIGN KEY (id_actividad) REFERENCES actividad (id_actividad) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_actividad_visitante_visita FOREIGN KEY (id_visita) REFERENCES visita (id_visita) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_actividad_visitante_personas CHECK (numero_personas > 0)
);

-- --------------------------------------------------
-- Vistas para facilitar consultas comunes
-- --------------------------------------------------

-- Vista para obtener la superficie total de cada parque
CREATE VIEW vista_superficie_parques AS
SELECT 
    p.id_parque,
    p.nombre AS nombre_parque,
    SUM(a.extension_hectareas) AS superficie_total
FROM 
    parque_natural p
LEFT JOIN 
    area a ON p.id_parque = a.id_parque
GROUP BY 
    p.id_parque;

-- Vista para obtener el número de parques por departamento
CREATE VIEW vista_parques_por_departamento AS
SELECT 
    d.id_departamento,
    d.nombre AS nombre_departamento,
    COUNT(pd.id_parque) AS numero_parques,
    SUM(a.extension_hectareas) AS superficie_total
FROM 
    departamento d
LEFT JOIN 
    parque_departamento pd ON d.id_departamento = pd.id_departamento
LEFT JOIN 
    parque_natural p ON pd.id_parque = p.id_parque
LEFT JOIN 
    area a ON p.id_parque = a.id_parque
GROUP BY 
    d.id_departamento;

-- Vista para inventario de especies por área
CREATE VIEW vista_inventario_especies AS
SELECT 
    a.id_area,
    a.nombre AS nombre_area,
    p.id_parque,
    p.nombre AS nombre_parque,
    te.nombre AS tipo_especie,
    e.denominacion_cientifica,
    e.denominacion_vulgar,
    ae.numero_inventario,
    ae.fecha_ultimo_conteo
FROM 
    area a
JOIN 
    parque_natural p ON a.id_parque = p.id_parque
JOIN 
    area_especie ae ON a.id_area = ae.id_area
JOIN 
    especie e ON ae.id_especie = e.id_especie
JOIN 
    tipo_especie te ON e.id_tipo_especie = te.id_tipo_especie;

-- Vista para proyectos de investigación activos
CREATE VIEW vista_proyectos_activos AS
SELECT 
    pi.id_proyecto,
    pi.nombre AS nombre_proyecto,
    pi.fecha_inicio,
    pi.fecha_fin,
    pi.presupuesto,
    COUNT(DISTINCT pie.id_personal) AS numero_investigadores,
    COUNT(DISTINCT pe.id_especie) AS numero_especies
FROM 
    proyecto_investigacion pi
LEFT JOIN 
    proyecto_investigador pie ON pi.id_proyecto = pie.id_proyecto
LEFT JOIN 
    proyecto_especie pe ON pi.id_proyecto = pe.id_proyecto
WHERE 
    pi.estado = 'En Proceso'
GROUP BY 
    pi.id_proyecto;

-- Vista para estadísticas de ocupación de alojamientos
CREATE VIEW vista_ocupacion_alojamientos AS
SELECT 
    a.id_alojamiento,
    a.nombre AS nombre_alojamiento,
    p.id_parque,
    p.nombre AS nombre_parque,
    ca.nombre AS categoria,
    a.capacidad,
    COUNT(r.id_reserva) AS numero_reservas,
    SUM(CASE WHEN r.estado = 'Confirmada' AND r.fecha_inicio <= CURRENT_DATE AND r.fecha_fin >= CURRENT_DATE THEN r.numero_personas ELSE 0 END) AS ocupacion_actual,
    ROUND((SUM(CASE WHEN r.estado = 'Confirmada' AND r.fecha_inicio <= CURRENT_DATE AND r.fecha_fin >= CURRENT_DATE THEN r.numero_personas ELSE 0 END) / a.capacidad) * 100, 2) AS porcentaje_ocupacion
FROM 
    alojamiento a
JOIN 
    parque_natural p ON a.id_parque = p.id_parque
JOIN 
    categoria_alojamiento ca ON a.id_categoria = ca.id_categoria
LEFT JOIN 
    reserva r ON a.id_alojamiento = r.id_alojamiento
GROUP BY 
    a.id_alojamiento;

-- --------------------------------------------------
-- Creación de usuarios y roles
-- --------------------------------------------------

-- 1. Administrador: Acceso total
CREATE ROLE 'rol_administrador';
GRANT ALL PRIVILEGES ON los_ambientales.* TO 'rol_administrador';

-- 2. Gestor de parques: Gestión de parques, áreas y especies
CREATE ROLE 'rol_gestor_parques';
GRANT SELECT, INSERT, UPDATE, DELETE ON los_ambientales.parque_natural TO 'rol_gestor_parques';
GRANT SELECT, INSERT, UPDATE, DELETE ON los_ambientales.area TO 'rol_gestor_parques';
GRANT SELECT, INSERT, UPDATE, DELETE ON los_ambientales.especie TO 'rol_gestor_parques';
GRANT SELECT, INSERT, UPDATE, DELETE ON los_ambientales.area_especie TO 'rol_gestor_parques';
GRANT SELECT ON los_ambientales.tipo_especie TO 'rol_gestor_parques';
GRANT SELECT ON los_ambientales.departamento TO 'rol_gestor_parques';
GRANT SELECT ON los_ambientales.entidad_responsable TO 'rol_gestor_parques';
GRANT SELECT ON los_ambientales.parque_departamento TO 'rol_gestor_parques';
GRANT SELECT ON los_ambientales.vista_superficie_parques TO 'rol_gestor_parques';
GRANT SELECT ON los_ambientales.vista_parques_por_departamento TO 'rol_gestor_parques';
GRANT SELECT ON los_ambientales.vista_inventario_especies TO 'rol_gestor_parques';

-- 3. Investigador: Acceso a datos de proyectos y especies
CREATE ROLE 'rol_investigador';
GRANT SELECT ON los_ambientales.proyecto_investigacion TO 'rol_investigador';
GRANT SELECT, INSERT, UPDATE ON los_ambientales.proyecto_investigador TO 'rol_investigador';
GRANT SELECT, INSERT, UPDATE ON los_ambientales.proyecto_especie TO 'rol_investigador';
GRANT SELECT ON los_ambientales.especie TO 'rol_investigador';
GRANT SELECT ON los_ambientales.tipo_especie TO 'rol_investigador';
GRANT SELECT ON los_ambientales.area_especie TO 'rol_investigador';
GRANT SELECT ON los_ambientales.area TO 'rol_investigador';
GRANT SELECT ON los_ambientales.parque_natural TO 'rol_investigador';
GRANT SELECT ON los_ambientales.personal_investigador TO 'rol_investigador';
GRANT SELECT ON los_ambientales.vista_inventario_especies TO 'rol_investigador';
GRANT SELECT ON los_ambientales.vista_proyectos_activos TO 'rol_investigador';

-- 4. Auditor: Acceso a reportes financieros
CREATE ROLE 'rol_auditor';
GRANT SELECT ON los_ambientales.* TO 'rol_auditor';
GRANT EXECUTE ON los_ambientales.* TO 'rol_auditor';

-- 5. Encargado de visitantes: Gestión de visitantes y alojamientos
CREATE ROLE 'rol_encargado_visitantes';
GRANT SELECT, INSERT, UPDATE, DELETE ON los_ambientales.visitante TO 'rol_encargado_visitantes';
GRANT SELECT, INSERT, UPDATE, DELETE ON los_ambientales.reserva TO 'rol_encargado_visitantes';
GRANT SELECT, INSERT, UPDATE ON los_ambientales.visita TO 'rol_encargado_visitantes';
GRANT SELECT, INSERT, UPDATE ON los_ambientales.actividad_visitante TO 'rol_encargado_visitantes';
GRANT SELECT ON los_ambientales.alojamiento TO 'rol_encargado_visitantes';
GRANT SELECT ON los_ambientales.categoria_alojamiento TO 'rol_encargado_visitantes';
GRANT SELECT ON los_ambientales.parque_natural TO 'rol_encargado_visitantes';
GRANT SELECT ON los_ambientales.entrada TO 'rol_encargado_visitantes';
GRANT SELECT ON los_ambientales.actividad TO 'rol_encargado_visitantes';
GRANT SELECT ON los_ambientales.vista_ocupacion_alojamientos TO 'rol_encargado_visitantes';

-- Crear usuarios de ejemplo (hay que cambiar las contraseñas en un entorno real)
-- Administrador
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin_password';
GRANT 'rol_administrador' TO 'admin'@'localhost';

-- Gestor de parques
CREATE USER 'gestor'@'localhost' IDENTIFIED BY 'gestor_password';
GRANT 'rol_gestor_parques' TO 'gestor'@'localhost';

-- Investigador
CREATE USER 'investigador'@'localhost' IDENTIFIED BY 'investigador_password';
GRANT 'rol_investigador' TO 'investigador'@'localhost';

-- Auditor
CREATE USER 'auditor'@'localhost' IDENTIFIED BY 'auditor_password';
GRANT 'rol_auditor' TO 'auditor'@'localhost';

-- Encargado de visitantes
CREATE USER 'encargado'@'localhost' IDENTIFIED BY 'encargado_password';
GRANT 'rol_encargado_visitantes' TO 'encargado'@'localhost';

-- Activar los roles para los usuarios
SET DEFAULT ROLE ALL TO 
'admin'@'localhost',
'gestor'@'localhost',
'investigador'@'localhost',
'auditor'@'localhost',
'encargado'@'localhost';

-- Confirmar que todo está guardado
FLUSH PRIVILEGES;