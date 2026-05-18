With HorasEmpleado as(
	Select empleado_id, SUM(horas_asignadas) as TotalHoras
    FROM AsignacionesDeProyectos
    GROUP BY empleado_id
)
SELECT E.nombre, E.apellido, H.TotalHoras
FROM Empleados E
JOIN HorasEmpleado H on E.empleado_id =H.empleado_id
ORDER BY H.TotalHoras DESC

-- Creación de la base de datos ReservasDB
CREATE DATABASE IF NOT EXISTS ReservasDB;
USE ReservasDB;


-- Clientes
   CREATE TABLE Clientes (
       cliente_id INT AUTO_INCREMENT PRIMARY KEY,
       nombre VARCHAR(100),
       contacto VARCHAR(100)
   );

-- Reservas
   CREATE TABLE Reservas (
       reserva_id INT AUTO_INCREMENT PRIMARY KEY,
       cliente_id INT,
       fecha_reserva DATE,
       numero_personas INT,
       FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
   );

-- Habitaciones
   CREATE TABLE Habitaciones (
       habitacion_id INT AUTO_INCREMENT PRIMARY KEY,
       tipo VARCHAR(50),
       capacidad INT
   );

INSERT INTO Clientes (nombre, contacto) VALUES ('Juan Perez', 'juan.perez@example.com');
INSERT INTO Habitaciones(tipo, capacidad) VALUES ('Suite',2);

INSERT INTO Reservas (cliente_id, fecha_reserva, numero_personas) VALUES (1,'2023-04-01',2);

SELECT * FROM Habitaciones Where capacidad >=2;
   