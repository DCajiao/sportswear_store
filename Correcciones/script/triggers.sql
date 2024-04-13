-- Trigger para actualizar la cantidad disponible de un producto en el inventario después de una compra
DELIMITER //
CREATE TRIGGER ActualizarCantidadDisponible
AFTER INSERT ON Contiene
FOR EACH ROW
BEGIN
    UPDATE Producto
    SET Cantidad = Cantidad - NEW.Cantidad
    WHERE Identificacion = NEW.Producto_Identificacion;
END //
DELIMITER ;

-- Insertar para pruebas
-- INSERT INTO Contiene (Producto_Identificacion, Compra_ID_compra, Cantidad) VALUES (1, 8, 5);

-- ¿Cómo llamar al Trigger para verificar la actualización?
-- SELECT Cantidad FROM Producto WHERE Identificacion = 1;
-- -----------------------------------------------------