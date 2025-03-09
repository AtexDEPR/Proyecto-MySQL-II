# Los Ambientales - Sistema de Gestión de Parques Naturales

## Descripción del Proyecto

El proyecto **"Los Ambientales"** es una base de datos diseñada para gestionar de manera eficiente todas las operaciones relacionadas con los parques naturales bajo la supervisión del Ministerio del Medio Ambiente. El sistema abarca la administración de departamentos, parques, áreas, especies, personal, proyectos de investigación, visitantes y alojamientos, asegurando una solución robusta, optimizada y capaz de facilitar consultas críticas para la toma de decisiones.

### Propósito
El objetivo principal de este proyecto es proporcionar una herramienta integral para la gestión de parques naturales, permitiendo:
- La administración de departamentos y entidades responsables.
- La gestión de áreas y especies dentro de los parques.
- El control del personal y sus actividades.
- La supervisión de proyectos de investigación.
- La gestión de visitantes y alojamientos.

### Funcionalidades Principales
- **Gestión de Parques y Áreas**: Registro y consulta de parques naturales, áreas y su extensión.
- **Inventario de Especies**: Clasificación y registro de especies vegetales, animales y minerales.
- **Personal**: Registro de empleados, asignación de roles y seguimiento de actividades.
- **Proyectos de Investigación**: Gestión de proyectos, presupuestos y asignación de investigadores.
- **Visitantes y Alojamientos**: Registro de visitantes, reservas y gestión de alojamientos.

---

## Requisitos del Sistema

Para ejecutar este proyecto, se requiere el siguiente software:

- **MySQL Server**: Versión 8.0 o superior.
- **MySQL Workbench**: Cliente gráfico para la gestión de la base de datos (opcional).
- **Git**: Para clonar el repositorio y gestionar versiones.

---

## Instalación y Configuración

### 1. Clonar el Repositorio
Primero, clona el repositorio desde GitHub:

```bash
git clone https://github.com/tu-usuario/Proyecto-MySQL-II.git
cd los-ambientales
```

### 2. Configuración de la Base de Datos
1. **Crear la Base de Datos**: Ejecuta el archivo `ddl.sql` para crear la estructura de la base de datos y las tablas.

   ```bash
   mysql -u tu_usuario -p < ddl.sql
   ```

2. **Cargar Datos Iniciales**: Ejecuta el archivo `dml.sql` para insertar datos de prueba en las tablas.

   ```bash
   mysql -u tu_usuario -p < dml.sql
   ```

### 3. Ejecución de Consultas, Procedimientos y Funciones
- **Consultas SQL**: Ejecuta el archivo `dql_select.sql` para realizar consultas sobre la base de datos.
- **Procedimientos Almacenados**: Ejecuta el archivo `dql_procedimientos.sql` para crear y ejecutar procedimientos almacenados.
- **Funciones SQL**: Ejecuta el archivo `dql_funciones.sql` para crear y utilizar funciones personalizadas.
- **Triggers**: Ejecuta el archivo `dql_triggers.sql` para crear y probar los triggers.
- **Eventos**: Ejecuta el archivo `dql_eventos.sql` para configurar y ejecutar eventos automáticos.

---

## Estructura de la Base de Datos

### Tablas Principales
- **departamento**: Almacena información sobre los departamentos y sus entidades responsables.
- **parque_natural**: Contiene los datos de los parques naturales, incluyendo su fecha de declaración.
- **area**: Registra las áreas dentro de los parques, con su extensión en hectáreas.
- **especie**: Almacena información sobre las especies vegetales, animales y minerales.
- **personal**: Registra los datos del personal, incluyendo su tipo (gestión, vigilancia, conservación, investigación).
- **proyecto_investigacion**: Contiene los proyectos de investigación, su presupuesto y estado.
- **visitante**: Almacena los datos de los visitantes, incluyendo su profesión.
- **alojamiento**: Registra los alojamientos disponibles en los parques, con su capacidad y categoría.

### Relaciones
- Un departamento puede tener varios parques naturales.
- Un parque puede estar en varios departamentos.
- Cada área pertenece a un parque y puede albergar varias especies.
- El personal se asigna a áreas específicas según su tipo.
- Los proyectos de investigación involucran a varios investigadores y especies.

---

## Ejemplos de Consultas

### Consultas Básicas
1. **Obtener todos los parques naturales**:
   ```sql
   SELECT * FROM parque_natural;
   ```

2. **Contar el número de áreas en un parque**:
   ```sql
   SELECT COUNT(*) AS numero_areas FROM area WHERE id_parque = 1;
   ```

### Consultas Avanzadas
1. **Superficie total de parques por departamento**:
   ```sql
   SELECT d.nombre, SUM(a.extension_hectareas) AS superficie_total
   FROM departamento d
   JOIN parque_departamento pd ON d.id_departamento = pd.id_departamento
   JOIN area a ON pd.id_parque = a.id_parque
   GROUP BY d.nombre;
   ```

2. **Especies en peligro en un parque**:
   ```sql
   SELECT e.denominacion_vulgar, ae.numero_inventario
   FROM especie e
   JOIN area_especie ae ON e.id_especie = ae.id_especie
   JOIN area a ON ae.id_area = a.id_area
   WHERE a.id_parque = 1 AND ae.numero_inventario < 10;
   ```

---

## Procedimientos, Funciones, Triggers y Eventos

### Procedimientos Almacenados
1. **Registrar un nuevo parque**:
   ```sql
   CALL registrar_parque('Parque Nacional Test', '2025-03-09');
   ```

2. **Asignar un área a un parque**:
   ```sql
   CALL asignar_area_parque(1, 'Zona Norte', 150.75, 'Área boscosa con especies nativas.');
   ```

### Funciones SQL
1. **Cantidad de especies en un parque**:
   ```sql
   SELECT fn_especies_parque(1) AS total_especies;
   ```

2. **Sueldo promedio de los investigadores**:
   ```sql
   SELECT fn_sueldo_promedio_investigadores() AS sueldo_promedio;
   ```

### Triggers
1. **Registrar cambios en el sueldo del personal**:
   ```sql
   UPDATE personal SET sueldo = 3000000 WHERE id_personal = 1;
   ```

2. **Impedir la eliminación de un parque con áreas asignadas**:
   ```sql
   DELETE FROM parque_natural WHERE id_parque = 1;
   ```

### Eventos
1. **Generar un informe semanal de visitantes**:
   ```sql
   SHOW EVENTS;
   ```

2. **Actualizar inventarios de especies mensualmente**:
   ```sql
   SHOW EVENTS;
   ```

---

## Roles de Usuario y Permisos

### Roles Definidos
1. **Administrador**: Acceso total a la base de datos.
2. **Gestor de Parques**: Gestión de parques, áreas y especies.
3. **Investigador**: Acceso a datos de proyectos y especies.
4. **Auditor**: Acceso a reportes financieros.
5. **Encargado de Visitantes**: Gestión de visitantes y alojamientos.

### Asignación de Roles
Para asignar roles a los usuarios en MySQL, ejecuta los siguientes comandos:

```sql
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin_password';
GRANT 'rol_administrador' TO 'admin'@'localhost';
```

¡Gracias por revisar mi proyecto!
