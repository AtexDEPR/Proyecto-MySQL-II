
-- --------------------------------------------------
-- Script SQL: Soluciones a las 100 consultas 
-- --------------------------------------------------

USE los_ambientales;

-- --------------------------------------------------
-- 1. Estado actual de parques (Consultas 1-24)
-- --------------------------------------------------

-- 1. Estado actual de parques
SELECT p.id_parque, p.nombre, p.fecha_declaracion, COUNT(a.id_area) AS numero_areas, SUM(a.extension_hectareas) AS superficie_total
FROM parque_natural p
LEFT JOIN area a ON p.id_parque = a.id_parque
GROUP BY p.id_parque;

-- 2. Total de parques por departamento
SELECT * FROM vista_parques_por_departamento
ORDER BY numero_parques DESC;

-- 3. Superficie total de parques por departamento 
SELECT id_departamento, nombre_departamento, superficie_total
FROM vista_parques_por_departamento
ORDER BY superficie_total DESC;

-- 4. Parques por categoría de conservación [Consulta Avanzada]
SELECT p.id_parque, p.nombre, COUNT(a.id_area) AS numero_areas
FROM parque_natural p
LEFT JOIN area a ON p.id_parque = a.id_parque
GROUP BY p.id_parque, p.nombre
ORDER BY numero_areas DESC;

-- 5. Superficie media de parques por categoría [Consulta Avanzada]
SELECT id_parque, nombre_parque, superficie_total / (SELECT COUNT(*) FROM area WHERE id_parque = vsp.id_parque) AS superficie_media_area
FROM vista_superficie_parques vsp
WHERE superficie_total IS NOT NULL
ORDER BY superficie_media_area DESC;

-- 6. Parques activos con proyectos en curso
SELECT p.id_parque, p.nombre
FROM parque_natural p
JOIN vista_proyectos_activos vpa ON p.id_parque = vpa.id_proyecto 
GROUP BY p.id_parque, p.nombre;

-- 7. Parques sin proyectos activos
SELECT p.id_parque, p.nombre
FROM parque_natural p
LEFT JOIN proyecto_investigacion pi ON p.id_parque = pi.id_proyecto 
WHERE pi.id_proyecto IS NULL OR pi.estado != 'En Proceso'
GROUP BY p.id_parque, p.nombre;

-- 8. Comparativo de parques entre departamentos [Consulta Avanzada] 
SELECT nombre_departamento, numero_parques, superficie_total
FROM vista_parques_por_departamento
ORDER BY numero_parques DESC;

-- 9. Parques con más superficie [Consulta Avanzada]
SELECT id_parque, nombre_parque, superficie_total
FROM vista_superficie_parques
ORDER BY superficie_total DESC
LIMIT 5;

-- 10. Parques con menos superficie [Consulta Avanzada]
SELECT id_parque, nombre_parque, superficie_total
FROM vista_superficie_parques
WHERE superficie_total IS NOT NULL
ORDER BY superficie_total ASC
LIMIT 5;

-- 11. Superficie total protegida [Consulta Avanzada] 
SELECT SUM(superficie_total) AS superficie_total_protegida
FROM vista_superficie_parques;

-- 12. Parques creados después de 2010
SELECT id_parque, nombre, fecha_declaracion
FROM parque_natural
WHERE fecha_declaracion > '2010-01-01'
ORDER BY fecha_declaracion;

-- 13. Parques con más de 1000 hectáreas
SELECT id_parque, nombre_parque, superficie_total
FROM vista_superficie_parques
WHERE superficie_total > 1000
ORDER BY superficie_total DESC;

-- 14. Superficie protegida por entidad responsable [Consulta Avanzada]
SELECT er.id_entidad, er.nombre AS nombre_entidad, SUM(a.extension_hectareas) AS superficie_total
FROM entidad_responsable er
LEFT JOIN departamento_entidad de ON er.id_entidad = de.id_entidad
LEFT JOIN parque_departamento pd ON de.id_departamento = pd.id_departamento
LEFT JOIN parque_natural p ON pd.id_parque = p.id_parque
LEFT JOIN area a ON p.id_parque = a.id_parque
GROUP BY er.id_entidad, er.nombre
ORDER BY superficie_total DESC;

-- 15. Parques con más especies registradas [Consulta Avanzada] 
SELECT p.id_parque, p.nombre, COUNT(vie.id_especie) AS total_especies
FROM parque_natural p
JOIN vista_inventario_especies vie ON p.id_parque = vie.id_parque
GROUP BY p.id_parque, p.nombre
ORDER BY total_especies DESC
LIMIT 5;

-- 16. Parques sin inventario actualizado
SELECT p.id_parque, p.nombre
FROM parque_natural p
LEFT JOIN vista_inventario_especies vie ON p.id_parque = vie.id_parque
WHERE vie.id_especie IS NULL OR vie.fecha_ultimo_conteo < DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR)
GROUP BY p.id_parque, p.nombre;

-- 17. Crecimiento de superficie protegida por año [Consulta Avanzada]
SELECT YEAR(p.fecha_declaracion) AS año, SUM(a.extension_hectareas) AS superficie_anual
FROM parque_natural p
LEFT JOIN area a ON p.id_parque = a.id_parque
GROUP BY YEAR(p.fecha_declaracion)
ORDER BY año;

-- 18. Departamento con parques transfronterizos
SELECT d.id_departamento, d.nombre AS nombre_departamento, COUNT(pd.id_parque) AS parques_transfronterizos
FROM departamento d
JOIN parque_departamento pd ON d.id_departamento = pd.id_departamento
GROUP BY d.id_departamento, d.nombre
HAVING COUNT(pd.id_parque) > 1;

-- 19. Parques en más de un departamento [Consulta Avanzada]
SELECT p.id_parque, p.nombre, COUNT(pd.id_departamento) AS numero_departamentos
FROM parque_natural p
JOIN parque_departamento pd ON p.id_parque = pd.id_parque
GROUP BY p.id_parque, p.nombre
HAVING numero_departamentos > 1
ORDER BY numero_departamentos DESC;

-- 20. Relación parques vs áreas por departamento [Consulta Avanzada]
SELECT d.id_departamento, d.nombre AS nombre_departamento, COUNT(pd.id_parque) AS total_parques, COUNT(a.id_area) AS total_areas, 
       COUNT(pd.id_parque) / NULLIF(COUNT(a.id_area), 0) AS relacion_parques_areas
FROM departamento d
LEFT JOIN parque_departamento pd ON d.id_departamento = pd.id_departamento
LEFT JOIN parque_natural p ON pd.id_parque = p.id_parque
LEFT JOIN area a ON p.id_parque = a.id_parque
GROUP BY d.id_departamento, d.nombre;

-- 21. Parques sin visitantes registrados el último año
SELECT p.id_parque, p.nombre
FROM parque_natural p
LEFT JOIN visita v ON p.id_parque = v.id_parque AND YEAR(v.fecha_entrada) = YEAR(CURRENT_DATE) - 1
WHERE v.id_visita IS NULL
GROUP BY p.id_parque, p.nombre;

-- 22. Inventarios de especies
SELECT id_area, nombre_area, nombre_parque, COUNT(denominacion_cientifica) AS total_especies
FROM vista_inventario_especies
GROUP BY id_area, nombre_area, nombre_parque;

-- 23. Total de especies registradas por parque [Consulta Avanzada] 
SELECT id_parque, nombre_parque, COUNT(DISTINCT denominacion_cientifica) AS total_especies
FROM vista_inventario_especies
GROUP BY id_parque, nombre_parque
ORDER BY total_especies DESC;

-- 24. Parques con inventarios recientes 
SELECT p.id_parque, p.nombre, COUNT(ae.id_especie) AS especies_recientes
FROM parque_natural p
JOIN area a ON p.id_parque = a.id_parque
JOIN area_especie ae ON a.id_area = ae.id_area
WHERE ae.fecha_ultimo_conteo >= DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR)
GROUP BY p.id_parque, p.nombre;

-- --------------------------------------------------
-- 2. Especies (Consultas 25-48)
-- --------------------------------------------------

-- 25. Especies por tipo de conteo reciente 
SELECT te.nombre AS tipo_especie, COUNT(ae.id_especie) AS especies_recientes
FROM tipo_especie te
JOIN especie e ON te.id_tipo_especie = e.id_tipo_especie
JOIN area_especie ae ON e.id_especie = ae.id_especie
WHERE ae.fecha_ultimo_conteo >= DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR)
GROUP BY te.nombre;

-- 26. Especies por tipo (mamífero, reptil, planta) 
SELECT te.nombre AS tipo_especie, COUNT(e.id_especie) AS total_especies
FROM tipo_especie te
LEFT JOIN especie e ON te.id_tipo_especie = e.id_tipo_especie
GROUP BY te.nombre;

-- 27. Parques con más inventarios completos [Consulta Avanzada] 
SELECT p.id_parque, p.nombre, COUNT(ae.id_especie) AS total_especies
FROM parque_natural p
JOIN area a ON p.id_parque = a.id_parque
JOIN area_especie ae ON a.id_area = ae.id_area
GROUP BY p.id_parque, p.nombre
ORDER BY total_especies DESC
LIMIT 5;

-- 28. Parques con inventarios antiguos 
SELECT p.id_parque, p.nombre, COUNT(ae.id_especie) AS especies_antiguas
FROM parque_natural p
JOIN area a ON p.id_parque = a.id_parque
JOIN area_especie ae ON a.id_area = ae.id_area
WHERE ae.fecha_ultimo_conteo < DATE_SUB(CURRENT_DATE, INTERVAL 5 YEAR)
GROUP BY p.id_parque, p.nombre;

-- 29. Especies con mayor número en inventario 
SELECT e.id_especie, e.denominacion_vulgar, SUM(ae.numero_inventario) AS total_individuos
FROM especie e
JOIN area_especie ae ON e.id_especie = ae.id_especie
GROUP BY e.id_especie, e.denominacion_vulgar
ORDER BY total_individuos DESC
LIMIT 5;

-- 30. Relación especies vegetales vs animales [Consulta Avanzada]
SELECT 
    (SELECT COUNT(e.id_especie) FROM especie e JOIN tipo_especie te ON e.id_tipo_especie = te.id_tipo_especie WHERE te.nombre = 'Vegetal') AS total_vegetales,
    (SELECT COUNT(e.id_especie) FROM especie e JOIN tipo_especie te ON e.id_tipo_especie = te.id_tipo_especie WHERE te.nombre = 'Animal') AS total_animales,
    (SELECT COUNT(e.id_especie) FROM especie e JOIN tipo_especie te ON e.id_tipo_especie = te.id_tipo_especie WHERE te.nombre = 'Vegetal') / 
    NULLIF((SELECT COUNT(e.id_especie) FROM especie e JOIN tipo_especie te ON e.id_tipo_especie = te.id_tipo_especie WHERE te.nombre = 'Animal'), 0) AS relacion_vegetal_animal;

-- 31. Total de especies por departamento [Consulta Avanzada]
SELECT d.id_departamento, d.nombre AS nombre_departamento, COUNT(DISTINCT ae.id_especie) AS total_especies
FROM departamento d
LEFT JOIN parque_departamento pd ON d.id_departamento = pd.id_departamento
LEFT JOIN parque_natural p ON pd.id_parque = p.id_parque
LEFT JOIN area a ON p.id_parque = a.id_parque
LEFT JOIN area_especie ae ON a.id_area = ae.id_area
GROUP BY d.id_departamento, d.nombre;

-- 32. Nuevas especies registradas por año [Consulta Avanzada]
SELECT YEAR(ae.fecha_ultimo_conteo) AS año, COUNT(DISTINCT ae.id_especie) AS nuevas_especies
FROM area_especie ae
GROUP BY YEAR(ae.fecha_ultimo_conteo)
ORDER BY año;

-- 33. Parques con más registros por tipo de especie [Consulta Avanzada] 
SELECT p.id_parque, p.nombre, te.nombre AS tipo_especie, COUNT(ae.id_especie) AS total_especies
FROM parque_natural p
JOIN area a ON p.id_parque = a.id_parque
JOIN area_especie ae ON a.id_area = ae.id_area
JOIN especie e ON ae.id_especie = e.id_especie
JOIN tipo_especie te ON e.id_tipo_especie = te.id_tipo_especie
GROUP BY p.id_parque, p.nombre, te.nombre
ORDER BY total_especies DESC
LIMIT 5;

-- 34. Inventarios incompletos (menos de 50 especies) [Consulta Avanzada]
SELECT p.id_parque, p.nombre, COUNT(ae.id_especie) AS total_especies
FROM parque_natural p
LEFT JOIN area a ON p.id_parque = a.id_parque
LEFT JOIN area_especie ae ON a.id_area = ae.id_area
GROUP BY p.id_parque, p.nombre
HAVING total_especies < 50 AND total_especies > 0;

-- 35. Parques sin registros recientes de especies 
SELECT p.id_parque, p.nombre
FROM parque_natural p
LEFT JOIN vista_inventario_especies vie ON p.id_parque = vie.id_parque
WHERE vie.fecha_ultimo_conteo < DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR) OR vie.id_especie IS NULL
GROUP BY p.id_parque, p.nombre;

-- 36. Especies con inventarios más antiguos 
SELECT e.id_especie, e.denominacion_vulgar, MIN(ae.fecha_ultimo_conteo) AS fecha_mas_antigua
FROM especie e
JOIN area_especie ae ON e.id_especie = ae.id_especie
GROUP BY e.id_especie, e.denominacion_vulgar
ORDER BY fecha_mas_antigua
LIMIT 5;

-- 37. Parques con mayor densidad de especies [Consulta Avanzada] 
SELECT vsp.id_parque, vsp.nombre_parque, COUNT(vie.id_especie) / vsp.superficie_total AS densidad_especies
FROM vista_superficie_parques vsp
JOIN vista_inventario_especies vie ON vsp.id_parque = vie.id_parque
GROUP BY vsp.id_parque, vsp.nombre_parque, vsp.superficie_total
ORDER BY densidad_especies DESC
LIMIT 5;

-- 38. Promedio de especies por parque [Consulta Avanzada]
SELECT AVG(total_especies) AS promedio_especies
FROM (
    SELECT p.id_parque, COUNT(ae.id_especie) AS total_especies
    FROM parque_natural p
    LEFT JOIN area a ON p.id_parque = a.id_parque
    LEFT JOIN area_especie ae ON a.id_area = ae.id_area
    GROUP BY p.id_parque
) AS subconsulta;

-- 39. Especies por área 
SELECT a.id_area, a.nombre AS nombre_area, COUNT(ae.id_especie) AS total_especies
FROM area a
LEFT JOIN area_especie ae ON a.id_area = ae.id_area
GROUP BY a.id_area, a.nombre;

-- 40. Parques con mayor número de individuos registrados [Consulta Avanzada] 
SELECT p.id_parque, p.nombre, SUM(ae.numero_inventario) AS total_individuos
FROM parque_natural p
JOIN area a ON p.id_parque = a.id_parque
JOIN area_especie ae ON a.id_area = ae.id_area
GROUP BY p.id_parque, p.nombre
ORDER BY total_individuos DESC
LIMIT 5;

-- 41. Inventario histórico (primeras especies registradas) [Consulta Avanzada]
SELECT e.id_especie, e.denominacion_vulgar, MIN(ae.fecha_ultimo_conteo) AS primera_fecha
FROM especie e
JOIN area_especie ae ON e.id_especie = ae.id_especie
GROUP BY e.id_especie, e.denominacion_vulgar
ORDER BY primera_fecha
LIMIT 5;

-- 42. Especies con menos individuos [Consulta Avanzada] 
SELECT e.id_especie, e.denominacion_vulgar, SUM(ae.numero_inventario) AS total_individuos
FROM especie e
JOIN area_especie ae ON e.id_especie = ae.id_especie
GROUP BY e.id_especie, e.denominacion_vulgar
ORDER BY total_individuos ASC
LIMIT 5;

-- --------------------------------------------------
-- 3. Actividades del personal (Consultas 43-62)
-- --------------------------------------------------

-- 43. Total de personal por parque [Consulta Avanzada]
SELECT p.id_parque, p.nombre, COUNT(DISTINCT per.id_personal) AS total_personal
FROM parque_natural p
LEFT JOIN area a ON p.id_parque = a.id_parque
LEFT JOIN area_vigilancia av ON a.id_area = av.id_area
LEFT JOIN area_conservacion ac ON a.id_area = ac.id_area
LEFT JOIN personal per ON per.id_personal IN (av.id_personal, ac.id_personal)
GROUP BY p.id_parque, p.nombre;

-- 44. Personal por tipo de contrato [Consulta Avanzada]
SELECT tp.nombre AS tipo_personal, COUNT(p.id_personal) AS total_personal
FROM tipo_personal tp
LEFT JOIN personal p ON tp.id_tipo_personal = p.id_tipo_personal
GROUP BY tp.nombre;

-- 45. Personal asignado a más áreas [Consulta Avanzada] 
SELECT p.id_personal, p.nombre, p.apellido, COUNT(DISTINCT av.id_area) + COUNT(DISTINCT ac.id_area) AS total_areas
FROM personal p
LEFT JOIN area_vigilancia av ON p.id_personal = av.id_personal
LEFT JOIN area_conservacion ac ON p.id_personal = ac.id_personal
GROUP BY p.id_personal, p.nombre, p.apellido
ORDER BY total_areas DESC
LIMIT 5;

-- 46. Promedio de personal por parque [Consulta Avanzada]
SELECT AVG(total_personal) AS promedio_personal
FROM (
    SELECT p.id_parque, COUNT(DISTINCT per.id_personal) AS total_personal
    FROM parque_natural p
    LEFT JOIN area a ON p.id_parque = a.id_parque
    LEFT JOIN area_vigilancia av ON a.id_area = av.id_area
    LEFT JOIN area_conservacion ac ON a.id_area = ac.id_area
    LEFT JOIN personal per ON per.id_personal IN (av.id_personal, ac.id_personal)
    GROUP BY p.id_parque
) AS subconsulta;

-- 47. Personal con mayor antigüedad [Consulta Avanzada]
SELECT p.id_personal, p.nombre, p.apellido, p.fecha_contratacion
FROM personal p
ORDER BY p.fecha_contratacion ASC
LIMIT 5;

-- 48. Total de sueldos por parque [Consulta Avanzada]
SELECT p.id_parque, p.nombre, SUM(per.sueldo) AS total_sueldos
FROM parque_natural p
LEFT JOIN area a ON p.id_parque = a.id_parque
LEFT JOIN area_vigilancia av ON a.id_area = av.id_area
LEFT JOIN area_conservacion ac ON a.id_area = ac.id_area
LEFT JOIN personal per ON per.id_personal IN (av.id_personal, ac.id_personal)
GROUP BY p.id_parque, p.nombre;

-- 49. Promedio de sueldo por cargo [Consulta Avanzada]
SELECT tp.nombre AS tipo_personal, AVG(p.sueldo) AS promedio_sueldo
FROM tipo_personal tp
LEFT JOIN personal p ON tp.id_tipo_personal = p.id_tipo_personal
GROUP BY tp.nombre;

-- 50. Parques con menos personal [Consulta Avanzada]
SELECT p.id_parque, p.nombre, COUNT(DISTINCT per.id_personal) AS total_personal
FROM parque_natural p
LEFT JOIN area a ON p.id_parque = a.id_parque
LEFT JOIN area_vigilancia av ON a.id_area = av.id_area
LEFT JOIN area_conservacion ac ON a.id_area = ac.id_area
LEFT JOIN personal per ON per.id_personal IN (av.id_personal, ac.id_personal)
GROUP BY p.id_parque, p.nombre
ORDER BY total_personal ASC
LIMIT 5;

-- 51. Personal investigador por especialidad [Consulta Avanzada] 
SELECT pi.especialidad, COUNT(p.id_personal) AS total_personal
FROM personal_investigador pi
JOIN personal p ON pi.id_personal = p.id_personal
GROUP BY pi.especialidad;

-- 52. Personal con vehículos asignados 
SELECT p.id_personal, p.nombre, p.apellido, v.marca, v.modelo
FROM personal p
JOIN personal_vigilancia pv ON p.id_personal = pv.id_personal
JOIN vehiculo v ON pv.id_vehiculo = v.id_vehiculo;

-- 53. Parques con más actividades de vigilancia [Consulta Avanzada]
SELECT p.id_parque, p.nombre, COUNT(av.id_personal) AS total_vigilancia
FROM parque_natural p
JOIN area a ON p.id_parque = a.id_parque
JOIN area_vigilancia av ON a.id_area = av.id_area
GROUP BY p.id_parque, p.nombre
ORDER BY total_vigilancia DESC
LIMIT 5;

-- 54. Personal en proyectos de investigación
SELECT p.id_personal, p.nombre, p.apellido, COUNT(pi.id_proyecto) AS total_proyectos
FROM personal p
JOIN proyecto_investigador pi ON p.id_personal = pi.id_personal
GROUP BY p.id_personal, p.nombre, p.apellido;

-- 55. Personal con más proyectos asignados [Consulta Avanzada] 
SELECT p.id_personal, p.nombre, p.apellido, COUNT(pi.id_proyecto) AS total_proyectos
FROM personal p
LEFT JOIN proyecto_investigador pi ON p.id_personal = pi.id_personal
GROUP BY p.id_personal, p.nombre, p.apellido
ORDER BY total_proyectos DESC
LIMIT 5;

-- 56. Parques con menos vigilancia [Consulta Avanzada] 
SELECT p.id_parque, p.nombre, COUNT(av.id_personal) AS total_vigilancia
FROM parque_natural p
LEFT JOIN area a ON p.id_parque = a.id_parque
LEFT JOIN area_conservacion av ON a.id_area = av.id_area
GROUP BY p.id_parque, p.nombre
ORDER BY total_vigilancia ASC
LIMIT 5;

-- 57. Personal por entidad responsable [Consulta Avanzada]
SELECT er.id_entidad, er.nombre AS nombre_entidad, COUNT(p.id_personal) AS total_personal
FROM entidad_responsable er
LEFT JOIN departamento_entidad de ON er.id_entidad = de.id_entidad
LEFT JOIN parque_departamento pd ON de.id_departamento = pd.id_departamento
LEFT JOIN parque_natural pn ON pd.id_parque = pn.id_parque
LEFT JOIN area a ON pn.id_parque = a.id_parque
LEFT JOIN area_vigilancia av ON a.id_area = av.id_area
LEFT JOIN area_conservacion ac ON a.id_area = ac.id_area
LEFT JOIN personal p ON p.id_personal IN (av.id_personal, ac.id_personal)
GROUP BY er.id_entidad, er.nombre;

-- 58. Parques con más personal de conservación 
SELECT p.id_parque, p.nombre, COUNT(ac.id_personal) AS total_conservacion
FROM parque_natural p
JOIN area a ON p.id_parque = a.id_parque
JOIN area_conservacion ac ON a.id_area = ac.id_area
GROUP BY p.id_parque, p.nombre
ORDER BY total_conservacion DESC
LIMIT 5;

-- 59. Personal de gestión por entrada 
SELECT p.id_personal, p.nombre, p.apellido, e.nombre AS entrada
FROM personal p
JOIN personal_gestion pg ON p.id_personal = pg.id_personal
JOIN entrada e ON pg.id_entrada = e.id_entrada;

-- 60. Personal con más áreas asignadas [Consulta Avanzada]
SELECT p.id_personal, p.nombre, p.apellido, COUNT(DISTINCT av.id_area) + COUNT(DISTINCT ac.id_area) AS total_areas
FROM personal p
LEFT JOIN area_vigilancia av ON p.id_personal = av.id_personal
LEFT JOIN area_conservacion ac ON p.id_personal = ac.id_personal
GROUP BY p.id_personal, p.nombre, p.apellido
ORDER BY total_areas DESC
LIMIT 5;

-- 61. Distribución de personal por tipo de vehículo [Consulta Avanzada] 
SELECT tv.nombre AS tipo_vehiculo, COUNT(pv.id_personal) AS total_personal
FROM tipo_vehiculo tv
LEFT JOIN vehiculo v ON tv.id_tipo_vehiculo = v.id_tipo_vehiculo
LEFT JOIN personal_vigilancia pv ON v.id_vehiculo = pv.id_vehiculo
GROUP BY tv.nombre;

-- 62. Personal contratado por año [Consulta Avanzada] 
SELECT YEAR(p.fecha_contratacion) AS año, COUNT(p.id_personal) AS personal_contratado
FROM personal p
GROUP BY YEAR(p.fecha_contratacion)
ORDER BY año;

-- --------------------------------------------------
-- 4. Proyectos de investigación (Consultas 63-82)
-- --------------------------------------------------

-- 63. Total de proyectos por parque [Consulta Avanzada]
SELECT p.id_parque, p.nombre, COUNT(pi.id_proyecto) AS total_proyectos
FROM parque_natural p
LEFT JOIN proyecto_investigacion pi ON p.id_parque = pi.id_proyecto 
GROUP BY p.id_parque, p.nombre;

-- 64. Proyectos por estado [Consulta Avanzada] 
SELECT pi.estado AS estado_proyecto, COUNT(pi.id_proyecto) AS total_proyectos
FROM proyecto_investigacion pi
GROUP BY pi.estado;

-- 65. Costo total de proyectos por parque [Consulta Avanzada]
SELECT p.id_parque, p.nombre, SUM(pi.presupuesto) AS costo_total
FROM parque_natural p
LEFT JOIN proyecto_investigacion pi ON p.id_parque = pi.id_proyecto 
GROUP BY p.id_parque, p.nombre;

-- 66. Proyectos con más especies estudiadas [Consulta Avanzada]
SELECT pi.id_proyecto, pi.nombre, COUNT(pe.id_especie) AS total_especies
FROM proyecto_investigacion pi
LEFT JOIN proyecto_especie pe ON pi.id_proyecto = pe.id_proyecto
GROUP BY pi.id_proyecto, pi.nombre
ORDER BY total_especies DESC
LIMIT 5;

-- 67. Promedio de costo por proyecto [Consulta Avanzada]
SELECT AVG(presupuesto) AS promedio_costo
FROM proyecto_investigacion;

-- 68. Proyectos de larga duración 
SELECT id_proyecto, nombre, DATEDIFF(fecha_fin, fecha_inicio) / 365 AS duracion_años
FROM proyecto_investigacion
WHERE DATEDIFF(fecha_fin, fecha_inicio) / 365 > 2;

-- 69. Proyectos con más de 3 años de duración
SELECT id_proyecto, nombre, DATEDIFF(fecha_fin, fecha_inicio) / 365 AS duracion_años
FROM proyecto_investigacion
WHERE DATEDIFF(fecha_fin, fecha_inicio) / 365 > 3;

-- 70. Parques con más proyectos activos [Consulta Avanzada]
SELECT p.id_parque, p.nombre, COUNT(vpa.id_proyecto) AS total_proyectos
FROM parque_natural p
JOIN vista_proyectos_activos vpa ON p.id_parque = vpa.id_proyecto -- Relación hipotética
GROUP BY p.id_parque, p.nombre
ORDER BY total_proyectos DESC
LIMIT 5;

-- 71. Proyectos aprobados 
SELECT id_proyecto, nombre
FROM proyecto_investigacion
WHERE estado = 'Aprobado';

-- 72. Proyectos cancelados
SELECT id_proyecto, nombre
FROM proyecto_investigacion
WHERE estado = 'Cancelado';

-- 73. Proyectos por entidad responsable [Consulta Avanzada]
SELECT er.id_entidad, er.nombre AS nombre_entidad, COUNT(pi.id_proyecto) AS total_proyectos
FROM entidad_responsable er
LEFT JOIN departamento_entidad de ON er.id_entidad = de.id_entidad
LEFT JOIN parque_departamento pd ON de.id_departamento = pd.id_departamento
LEFT JOIN parque_natural p ON pd.id_parque = p.id_parque
LEFT JOIN proyecto_investigacion pi ON p.id_parque = pi.id_proyecto 
GROUP BY er.id_entidad, er.nombre;

-- 74. Especies más estudiadas en proyectos [Consulta Avanzada]
SELECT e.id_especie, e.denominacion_vulgar, COUNT(pe.id_proyecto) AS total_proyectos
FROM especie e
JOIN proyecto_especie pe ON e.id_especie = pe.id_especie
GROUP BY e.id_especie, e.denominacion_vulgar
ORDER BY total_proyectos DESC
LIMIT 5;

-- 75. Proyectos completados 
SELECT id_proyecto, nombre
FROM proyecto_investigacion
WHERE estado = 'Completado';

-- 76. Parques sin proyectos recientes
SELECT p.id_parque, p.nombre
FROM parque_natural p
LEFT JOIN proyecto_investigacion pi ON p.id_parque = pi.id_proyecto
WHERE pi.id_proyecto IS NULL OR pi.fecha_inicio < DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR)
GROUP BY p.id_parque, p.nombre;

-- 77. Proyectos con mayor presupuesto 
SELECT id_proyecto, nombre, presupuesto
FROM proyecto_investigacion
ORDER BY presupuesto DESC
LIMIT 5;

-- 78. Proyectos en proceso 
SELECT id_proyecto, nombre_proyecto, fecha_inicio, presupuesto
FROM vista_proyectos_activos;

-- 79. Proyectos con más investigadores 
SELECT pi.id_proyecto, pi.nombre, COUNT(pie.id_personal) AS total_investigadores
FROM proyecto_investigacion pi
JOIN proyecto_investigador pie ON pi.id_proyecto = pie.id_proyecto
GROUP BY pi.id_proyecto, pi.nombre
ORDER BY total_investigadores DESC
LIMIT 5;

-- 80. Personal asignado por proyecto 
SELECT pi.id_proyecto, pi.nombre, COUNT(pie.id_personal) AS total_personal
FROM proyecto_investigacion pi
LEFT JOIN proyecto_investigador pie ON pi.id_proyecto = pie.id_proyecto
GROUP BY pi.id_proyecto, pi.nombre;

-- 81. Proyectos propuestos 
SELECT id_proyecto, nombre
FROM proyecto_investigacion
WHERE estado = 'Propuesto';

-- 82. Proyectos con mayor duración 
SELECT id_proyecto, nombre, DATEDIFF(fecha_fin, fecha_inicio) AS duracion_dias
FROM proyecto_investigacion
WHERE fecha_fin IS NOT NULL
ORDER BY duracion_dias DESC
LIMIT 5;

-- --------------------------------------------------
-- 5. Gestión de visitantes y ocupación (Consultas 83-100)
-- --------------------------------------------------

-- 83. Total de visitantes por parque 
SELECT p.id_parque, p.nombre, COUNT(v.id_visita) AS total_visitantes
FROM parque_natural p
LEFT JOIN visita v ON p.id_parque = v.id_parque
GROUP BY p.id_parque, p.nombre;

-- 84. Visitantes por mes 
SELECT MONTH(v.fecha_entrada) AS mes, COUNT(v.id_visita) AS total_visitantes
FROM visita v
GROUP BY MONTH(v.fecha_entrada);

-- 85. Parques más visitados [Consulta Avanzada]
SELECT p.id_parque, p.nombre, COUNT(v.id_visita) AS total_visitantes
FROM parque_natural p
LEFT JOIN visita v ON p.id_parque = v.id_parque
GROUP BY p.id_parque, p.nombre
ORDER BY total_visitantes DESC
LIMIT 5;

-- 86. Parques menos visitados [Consulta Avanzada]
SELECT p.id_parque, p.nombre, COUNT(v.id_visita) AS total_visitantes
FROM parque_natural p
LEFT JOIN visita v ON p.id_parque = v.id_parque
GROUP BY p.id_parque, p.nombre
ORDER BY total_visitantes ASC
LIMIT 5;

-- 87. Promedio de visitantes por parque [Consulta Avanzada]
SELECT AVG(total_visitantes) AS promedio_visitantes
FROM (
    SELECT p.id_parque, COUNT(v.id_visita) AS total_visitantes
    FROM parque_natural p
    LEFT JOIN visita v ON p.id_parque = v.id_parque
    GROUP BY p.id_parque
) AS subconsulta;

-- 88. Visitantes por entrada [Consulta Avanzada] 
SELECT e.id_entrada, e.nombre AS nombre_entrada, COUNT(v.id_visita) AS total_visitantes
FROM entrada e
LEFT JOIN visita v ON e.id_entrada = v.id_entrada
GROUP BY e.id_entrada, e.nombre;

-- 89. Ocupación de alojamientos por parque [Consulta Avanzada] 
SELECT id_parque, nombre_parque, SUM(ocupacion_actual) AS ocupacion_total
FROM vista_ocupacion_alojamientos
GROUP BY id_parque, nombre_parque;

-- 90. Parques sin alojamientos disponibles
SELECT p.id_parque, p.nombre
FROM parque_natural p
LEFT JOIN alojamiento a ON p.id_parque = a.id_parque
WHERE a.id_alojamiento IS NULL;

-- 91. Ingresos por reservas por parque [Consulta Avanzada] 
SELECT p.id_parque, p.nombre, SUM(r.precio_total) AS ingresos_totales
FROM parque_natural p
LEFT JOIN alojamiento a ON p.id_parque = a.id_parque
LEFT JOIN reserva r ON a.id_alojamiento = r.id_alojamiento
GROUP BY p.id_parque, p.nombre;

-- 92. Promedio de estancia por parque [Consulta Avanzada]
SELECT p.id_parque, p.nombre, AVG(DATEDIFF(r.fecha_fin, r.fecha_inicio)) AS promedio_estancia
FROM parque_natural p
LEFT JOIN alojamiento a ON p.id_parque = a.id_parque
LEFT JOIN reserva r ON a.id_alojamiento = r.id_alojamiento
GROUP BY p.id_parque, p.nombre;

-- 93. Visitantes en temporada alta vs baja
SELECT 
    CASE WHEN MONTH(v.fecha_entrada) IN (6, 7, 8) THEN 'Alta' ELSE 'Baja' END AS temporada,
    COUNT(v.id_visita) AS total_visitantes
FROM visita v
GROUP BY CASE WHEN MONTH(v.fecha_entrada) IN (6, 7, 8) THEN 'Alta' ELSE 'Baja' END;

-- 94. Parques con más actividades programadas - Reemplazo de grupos escolares
SELECT p.id_parque, p.nombre, COUNT(a.id_actividad) AS total_actividades
FROM parque_natural p
JOIN actividad a ON p.id_parque = a.id_parque
GROUP BY p.id_parque, p.nombre
ORDER BY total_actividades DESC
LIMIT 5;

-- 95. Visitantes frecuentes por parque [Consulta Avanzada]
SELECT p.id_parque, p.nombre, v.id_visitante, COUNT(v.id_visita) AS total_visitas
FROM parque_natural p
JOIN visita v ON p.id_parque = v.id_parque
GROUP BY p.id_parque, p.nombre, v.id_visitante
HAVING total_visitas > 5;

-- 96. Parques con alojamientos de mayor capacidad 
SELECT p.id_parque, p.nombre, SUM(a.capacidad) AS capacidad_total
FROM parque_natural p
JOIN alojamiento a ON p.id_parque = a.id_parque
GROUP BY p.id_parque, p.nombre
ORDER BY capacidad_total DESC
LIMIT 5;

-- 97. Ocupación media de alojamientos [Consulta Avanzada] 
SELECT id_alojamiento, nombre_alojamiento, AVG(porcentaje_ocupacion) AS ocupacion_media
FROM vista_ocupacion_alojamientos
GROUP BY id_alojamiento, nombre_alojamiento;

-- 98. Parques con más reservas confirmadas [Consulta Avanzada] 
SELECT p.id_parque, p.nombre, COUNT(r.id_reserva) AS total_reservas
FROM parque_natural p
JOIN alojamiento a ON p.id_parque = a.id_parque
JOIN reserva r ON a.id_alojamiento = r.id_alojamiento
WHERE r.estado = 'Confirmada'
GROUP BY p.id_parque, p.nombre
ORDER BY total_reservas DESC
LIMIT 5;

-- 99. Parques con ocupación superior al 90% en el último año [Consulta Avanzada] 
SELECT id_parque, nombre_parque
FROM vista_ocupacion_alojamientos
WHERE porcentaje_ocupacion > 90
GROUP BY id_parque, nombre_parque;

-- 100. Comparación de visitantes entre parques con y sin alojamiento [Consulta Avanzada]
SELECT 
    CASE WHEN a.id_alojamiento IS NOT NULL THEN 'Con alojamiento' ELSE 'Sin alojamiento' END AS tiene_alojamiento,
    COUNT(v.id_visita) AS total_visitantes
FROM parque_natural p
LEFT JOIN alojamiento a ON p.id_parque = a.id_parque
LEFT JOIN visita v ON p.id_parque = v.id_parque
GROUP BY CASE WHEN a.id_alojamiento IS NOT NULL THEN 'Con alojamiento' ELSE 'Sin alojamiento' END;



