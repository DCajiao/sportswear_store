-- Vista de los productos disponibles junto con su cantidad en stock
CREATE VIEW ProductosDisponibles AS
SELECT Identificacion, Precio, Tipo, Tipo_Articulo, Seccion, Cantidad
FROM Producto
WHERE Cantidad > 0;

-- ¿Cómo llamar la vista?
-- SELECT * FROM ProductosDisponibles;
-- Otra forma de llamar la vista
--SELECT * FROM ProductosDisponibles WHERE Tipo = 'Articulo' AND Seccion = 'Hombre';

-- -----------------------------------------------------