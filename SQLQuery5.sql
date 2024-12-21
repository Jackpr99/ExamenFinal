
CREATE DATABASE GestionEmpleadosProyectos;

USE GestionEmpleadosProyectos;

CREATE TABLE Empleados (
    EmpleadoId INT AUTO_INCREMENT PRIMARY KEY,
    NumeroCarnet VARCHAR(50) UNIQUE NOT NULL,
    Nombre VARCHAR(255) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Categoria ENUM('Administrador', 'Operario', 'Peón') NOT NULL,
    Salario DECIMAL(10, 2) NOT NULL DEFAULT 250000,
    Direccion VARCHAR(255) NOT NULL DEFAULT 'San Jose',
    Telefono VARCHAR(50),
    Correo VARCHAR(255) UNIQUE NOT NULL,
    CHECK (Salario BETWEEN 250000 AND 500000),
    CHECK (DATEDIFF(CURDATE(), FechaNacimiento) / 365.25 >= 18)
);


CREATE TABLE Proyectos (
    ProyectoId INT AUTO_INCREMENT PRIMARY KEY,
    Codigo VARCHAR(50) UNIQUE NOT NULL,
    NombreProyecto VARCHAR(255) UNIQUE NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE
);


CREATE TABLE Asignaciones (
    AsignacionId INT AUTO_INCREMENT PRIMARY KEY,
    EmpleadoId INT NOT NULL,
    ProyectoId INT NOT NULL,
    FechaAsignacion DATE NOT NULL,
    FOREIGN KEY (EmpleadoId) REFERENCES Empleados(EmpleadoId),
    FOREIGN KEY (ProyectoId) REFERENCES Proyectos(ProyectoId)
);
