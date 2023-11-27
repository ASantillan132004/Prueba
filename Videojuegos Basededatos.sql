create database ventadevideojuegos;

CREATE TABLE Persona (
    IdPersona INT PRIMARY KEY,
    Nombre VARCHAR(55),
    Apellido VARCHAR(55),
    CorreoElectronico VARCHAR(55)
);
CREATE TABLE Empleado (
    IdEmpleado INT PRIMARY KEY,
    IdPersona INT UNIQUE,
    Cargo VARCHAR(55),
    FOREIGN KEY (IdPersona) REFERENCES Persona(IdPersona)
);

CREATE TABLE Cliente (
    IdCliente INT PRIMARY KEY,
    IdPersona INT UNIQUE,
    FOREIGN KEY (IdPersona) REFERENCES Persona(IdPersona)
);

CREATE TABLE Categoria (
    IdCategoria INT PRIMARY KEY,
    NombreCategoria VARCHAR(55),
    Descripcion VARCHAR(255)
);

CREATE TABLE Producto (
    IdProducto INT PRIMARY KEY,
    IdCategoria INT,
    NombreJuego VARCHAR(55),
    Plataforma VARCHAR(55),
    Precio DECIMAL(10, 2),
    FOREIGN KEY (IdCategoria) REFERENCES Categoria(IdCategoria)
);
CREATE TABLE Venta (
    IdVenta INT PRIMARY KEY,
    IdEmpleado INT,
    IdCliente INT,
    FechaHoraVenta DATETIME,
    FOREIGN KEY (IdEmpleado) REFERENCES Empleado(IdEmpleado),
    FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente)
);

CREATE TABLE DetalleVenta (
    IdDetalleVenta INT PRIMARY KEY,
    IdVenta INT,
    IdProducto INT,
    CantidadVendida INT,
    Total DECIMAL(10, 2),
    FOREIGN KEY (IdVenta) REFERENCES Venta(IdVenta),
    FOREIGN KEY (IdProducto) REFERENCES Producto(IdProducto)
    );
    -- Proyecto

