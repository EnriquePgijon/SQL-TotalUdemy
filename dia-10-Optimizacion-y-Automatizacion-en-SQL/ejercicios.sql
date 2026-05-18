Create view VistaEmpleadosTecnologia as 
select nombre, apellido, email from empleados where depto_id =1;

select * from VistaEmpleadosTecnologia

DELIMITER $$
CREATE TRIGGER RegistrarNuevoEmpleado after insert on Empleados for each row 
Begin 
	INSERT INTO LogEmpleados( empleado_id, fecha_registro) VALUES (NEW.empleado_id, now());
END $$

INSERT INTO Empleados (nombre, apellido, email) VALUES ('Juan','Perez','juan.perez@example.com');

SELECT * FROM LogEmpleados;

CREATE VIEW VistaEmpleadosProyectos AS
SELECT E.nombre AS NombreEmpleado, E.apellido AS ApellidoEmpleado, P.nombre AS NombreProyecto
FROM Empleados E
JOIN AsignacionesDeProyectos A ON E.empleado_id = A.empleado_id
JOIN Proyectos P ON A.proyecto_id = P.proyecto_id;
