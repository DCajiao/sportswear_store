-- ---------------------------------------------------
-- FUNCTIONS
-- ---------------------------------------------------

-- Función para obtener la cantidad de productos disponible en el inventario
DELIMITER //
CREATE FUNCTION ObtenerCantidadDisponible(
    p_identificacion INT
)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE cantidad_disponible INT;
    SELECT Cantidad_Articulo INTO cantidad_disponible
    FROM Producto
    WHERE Identificacion = p_identificacion;
    RETURN cantidad_disponible;
END //
DELIMITER ;

-- ¿Cómo llamar la función?
-- SELECT ObtenerCantidadDisponible(1) AS CantidadDisponible;

-- -----------------------------------------------------

-- Función para calcular el costo total de una compra, teniendo en cuenta la cantidad y el precio de los productos.
DELIMITER //
CREATE FUNCTION CalcularCostoTotal(
    p_id_compra INT
)
RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(p.Precio * c.Cantidad) INTO total
    FROM Producto p
    JOIN Contiene c ON p.Identificacion = c.Producto_Identificacion
    WHERE c.Compra_ID_compra = p_id_compra;
    RETURN total;
END //
DELIMITER ;

-- ¿Cómo llamar la función?
-- SELECT CalcularCostoTotal(3) AS CostoTotalCompra;

-- -----------------------------------------------------

-- Función para calcular el total de ingresos obtenidos en un período de tiempo específico 
DELIMITER //
CREATE FUNCTION CalcularTotalIngresos(
    p_fecha_inicio DATE,
    p_fecha_fin DATE
)
RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(Costo_total) INTO total
    FROM Compra
    WHERE Fecha_compra BETWEEN p_fecha_inicio AND p_fecha_fin;
    RETURN total;
END //
DELIMITER ;

-- ¿Cómo llamar la función?
-- SELECT CalcularTotalIngresos('2024-03-01', '2024-03-10') AS TotalIngresos;

-- ---------------------------------------------------