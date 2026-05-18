-- Ejercicio 1 
SELECT 
    E.nombre AS 'Nombre Empleado', 
    E.apellido AS 'Apellido Empleado', 
    P.nombre AS 'Nombre Proyecto', 
    A.horas_asignadas AS 'Horas Asignadas'
FROM 
    Empleados E
JOIN 
    AsignacionesDeProyectos A ON E.empleado_id = A.empleado_id
JOIN 
    Proyectos P ON A.proyecto_id = P.proyecto_id
ORDER BY 
    E.nombre, E.apellido, A.horas_asignadas DESC;
    
-- Ejercicio 2

SELECT 
    D.nombre AS 'Nombre Departamento',
    SUM(AP.horas_asignadas) AS 'Total Horas Asignadas'
FROM 
    Departamentos D
JOIN 
    Empleados E ON D.depto_id = E.depto_id
JOIN 
    AsignacionesDeProyectos AP ON E.empleado_id = AP.empleado_id
GROUP BY 
    D.nombre
ORDER BY 
    SUM(AP.horas_asignadas) DESC;
    
-- Ejercicio 3
    SELECT 
    E.nombre AS 'Nombre',
    E.apellido AS 'Apellido',
    SUM(AP.horas_asignadas) AS 'Total Horas Trabajadas',
    RANK() OVER (PARTITION BY E.depto_id ORDER BY SUM(AP.horas_asignadas) DESC) AS 'Ranking Departamental'
FROM 
    Empleados E
JOIN 
    AsignacionesDeProyectos AP ON E.empleado_id = AP.empleado_id
GROUP BY 
    E.empleado_id, E.nombre, E.apellido, E.depto_id
ORDER BY 
    E.depto_id, 'Ranking Departamental';