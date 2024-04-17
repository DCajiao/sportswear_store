-- Vista de los productos disponibles junto con su cantidad en stock
CREATE VIEW ProductosDisponibles AS
SELECT Identificacion, Precio, Tipo_Producto, Tipo_Articulo, Seccion_Articulo, Cantidad_Articulo
FROM Producto
WHERE Cantidad_Articulo > 0;

-- ¿Cómo llamar la vista?
-- SELECT * FROM ProductosDisponibles;
-- Otra forma de llamar la vista
--SELECT * FROM ProductosDisponibles WHERE Tipo = 'Articulo' AND Seccion = 'Hombre';

-- -----------------------------------------------------
-- Vista de los productos con el conteo de ventas
CREATE VIEW VentasProducto AS
SELECT p.Identificacion AS ID_Producto, 
    p.Tipo,
	p.Tipo_Articulo,
    COUNT(c.Producto_Identificacion) AS Cantidad_Ventas
FROM Producto p
LEFT JOIN Contiene c ON p.Identificacion = c.Producto_Identificacion
GROUP BY p.Identificacion;

-- ¿Cómo llamarlo?
--SELECT * FROM VentasProducto;

-- -----------------------------------------------------
-- Vista de Cantidad de ejemplares de un producto 
CREATE VIEW Vista_Cantidad_Ejemplares AS
SELECT Identificacion AS Producto_ID, Cantidad_Articulo, Tipo_Articulo AS Ejemplares
FROM Producto;

-- ¿Cómo llamarlo?
-- SELECT * FROM Vista_Cantidad_Ejemplares;

-- -----------------------------------------------------
-- Vista de los 3 productos más vendidos
CREATE VIEW Top3ProductosMasVendidos AS
SELECT p.Identificacion AS ID_Producto, 
    p.Tipo_Articulo AS Nombre_Producto,
    COUNT(*) AS Cantidad_Ventas
FROM Producto p
LEFT JOIN Contiene c ON p.Identificacion = c.Producto_Identificacion
GROUP BY p.Identificacion
ORDER BY Cantidad_Ventas DESC
LIMIT 3;
-- ¿Cómo llamarlo?
--SELECT * FROM Top3ProductosMasVendidos

-- -----------------------------------------------------