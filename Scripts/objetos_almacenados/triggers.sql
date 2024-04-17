-- ---------------------------------------------------
-- TRIGGERS
-- ---------------------------------------------------

-- Trigger para validar la existencia de un usuario antes de registrar una compra
DELIMITER //
CREATE TRIGGER validar_usuario_existente
BEFORE INSERT ON Compra
FOR EACH ROW
BEGIN
    DECLARE usuario_valido INT;
    
    -- Verificar si el usuario especificado existe en la tabla Cuenta
    SELECT COUNT(*) INTO usuario_valido
    FROM Cuenta
    WHERE Usuario = NEW.Cuenta_Usuario;
    
    -- Si el usuario no existe, emitir un mensaje de error
    IF usuario_valido = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario especificado no existe';
    END IF;
END;
//DELIMITER ;

-----------------------------------------------------

-- Trigger para validar la disponibilidad antes de registrar qué contiene una compra
DELIMITER //
CREATE TRIGGER validar_disponibilidad
BEFORE INSERT ON Contiene
FOR EACH ROW
BEGIN
    DECLARE cantidad_disponible INT;
    
    -- Obtener la cantidad disponible del producto
    SELECT Cantidad_Articulo INTO cantidad_disponible
    FROM Producto
    WHERE Identificacion = NEW.Producto_Identificacion;
    
    -- Verificar si la cantidad seleccionada es mayor que la cantidad disponible
    IF NEW.Cantidad > cantidad_disponible THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No hay suficiente stock disponible para insertar esta cantidad de producto';
    END IF;
END;
// DELIMITER ;

-- -----------------------------------------------------

-- Trigger para actualizar la cantidad disponible de un producto en el inventario después de una compra
DELIMITER //
CREATE TRIGGER ActualizarCantidadDisponible
AFTER INSERT ON Contiene
FOR EACH ROW
BEGIN
    UPDATE Producto
    SET Cantidad_Articulo = Cantidad_Articulo - NEW.Cantidad
    WHERE Identificacion = NEW.Producto_Identificacion;
END //
DELIMITER ;

-- -----------------------------------------------------

-- Trigger para actualizar el valor de la compra después de insertar un nuevo registro en la tabla Contiene
DELIMITER //
CREATE TRIGGER actualizar_costo_total_despues_insertar
AFTER INSERT ON Contiene
FOR EACH ROW
BEGIN
    DECLARE total DECIMAL(10,2);
    
    -- Calcular el costo total de la compra
    SELECT SUM(p.Precio * c.Cantidad) INTO total
    FROM Producto p
    JOIN Contiene c ON p.Identificacion = c.Producto_Identificacion
    WHERE c.Compra_ID_compra = NEW.Compra_ID_compra;
    
    -- Actualizar el costo total de la compra
    UPDATE Compra
    SET Costo_total = total
    WHERE ID_compra = NEW.Compra_ID_compra;
END;
//DELIMITER ;

-- -----------------------------------------------------