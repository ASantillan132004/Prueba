-- Insertar un Nuevo Producto
DELIMITER //
CREATE PROCEDURE InsertarProducto
(
    IN p_IdCategoria INT,
    IN p_NombreJuego VARCHAR(55),
    IN p_Plataforma VARCHAR(55),
    IN p_Precio DECIMAL(10, 2)
)
BEGIN
    INSERT INTO Producto (IdCategoria, NombreJuego, Plataforma, Precio)
    VALUES (p_IdCategoria, p_NombreJuego, p_Plataforma, p_Precio);
END //
DELIMITER ;

-- Obtener Detalles de una Venta
DELIMITER //
CREATE PROCEDURE ObtenerDetallesVenta(
    IN p_IdVenta INT
)
BEGIN
    SELECT
        V.IdVenta,
        V.FechaHoraVenta,
        E.IdEmpleado,
        E.Cargo,
        C.IdCliente,
        P.IdProducto,
        P.NombreJuego,
        P.Precio,
        DVP.CantidadVendida,
        DVP.Total
    FROM Venta V
    JOIN Empleado E ON V.IdEmpleado = E.IdEmpleado
    JOIN Cliente C ON V.IdCliente = C.IdCliente
    JOIN DetalleVentaProducto DVP ON V.IdVenta = DVP.IdVenta
    JOIN Producto P ON DVP.IdProducto = P.IdProducto
    WHERE V.IdVenta = p_IdVenta;
END //
DELIMITER ;

FUNCIONES

-- Actualizar el Precio de un Producto
DELIMITER //
CREATE PROCEDURE ActualizarPrecioProducto(
    IN p_IdProducto INT,
    IN p_NuevoPrecio DECIMAL(10, 2)
)
BEGIN
    UPDATE Producto
    SET Precio = p_NuevoPrecio
    WHERE IdProducto = p_IdProducto;
END //
DELIMITER ;

-- Calcular el Total de Ventas de un Cliente
DELIMITER //
CREATE FUNCTION CalcularTotalVentasCliente(
    p_IdCliente INT
) RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE total DECIMAL(10, 2);

    SELECT SUM(DVP.Total)
    INTO total
    FROM Venta V
    JOIN DetalleVentaProducto DVP ON V.IdVenta = DVP.IdVenta
    WHERE V.IdCliente = p_IdCliente;

    RETURN COALESCE(total, 0);
END //
DELIMITER ;

-- Obtener el Nombre Completo de un Empleado
DELIMITER //
CREATE FUNCTION ObtenerNombreCompletoEmpleado(
    p_IdEmpleado INT
) RETURNS VARCHAR(110)
BEGIN
    DECLARE nombreCompleto VARCHAR(110);

    SELECT CONCAT(P.Nombre, ' ', P.Apellido)
    INTO nombreCompleto
    FROM Persona P
    JOIN Empleado E ON P.IdPersona = E.IdPersona
    WHERE E.IdEmpleado = p_IdEmpleado;

    RETURN COALESCE(nombreCompleto, 'Empleado no encontrado');
END //
DELIMITER ;

-- Contar la Cantidad de Productos en una Categoría

DELIMITER //
CREATE FUNCTION ContarProductosEnCategoria(
    p_IdCategoria INT
) RETURNS INT
BEGIN
    DECLARE cantidadProductos INT;

    SELECT COUNT(*)
    INTO cantidadProductos
    FROM Producto
    WHERE IdCategoria = p_IdCategoria;

    RETURN COALESCE(cantidadProductos, 0);
END //
DELIMITER ;

-- Registra la fecha y hora de cada inserción en la tabla Producto
DELIMITER //
CREATE TRIGGER RegistroFechaHoraProducto
BEFORE INSERT ON producto
FOR EACH ROW
SET NEW.FechaRegistro = NEW();
//
DELIMITER ;
-- ..


