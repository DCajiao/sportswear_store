-- ¿Cuál es el producto más vendido?
SELECT pr.Tipo_Articulo FROM producto AS pr JOIN contiene AS c ON Producto_Identificacion = Identificacion
GROUP BY pr.Tipo_Articulo HAVING COUNT(c.Producto_Identificacion) = (SELECT MAX(cuenta) FROM 
(SELECT COUNT(Producto_Identificacion) AS cuenta FROM contiene GROUP BY Producto_Identificacion) AS conteo);

-- ¿Cuál es  el lugar que ha recibido más envios? 
SELECT l.Nombre FROM lugar AS l JOIN envio AS e USING (Lugar_codigo)
GROUP BY l.Nombre HAVING COUNT(Lugar_codigo) = (SELECT MAX(cuenta) FROM 
(SELECT COUNT(Lugar_codigo) AS cuenta FROM envio GROUP BY Lugar_Codigo) AS conteo);

-- ¿Cuál es la fecha en la que más se han hecho compras?
SELECT fecha_compra, COUNT(fecha_compra) FROM compra GROUP BY fecha_compra HAVING 
COUNT(fecha_compra) = (SELECT MAX(fechas) FROM (SELECT fecha_compra, COUNT(fecha_compra) AS fechas
FROM compra GROUP BY fecha_compra) AS maximo);

-- ¿Cuál es la sección en la que se venden más productos?
SELECT Seccion_Articulo, COUNT(Seccion_Articulo) FROM producto AS p GROUP BY Seccion_Articulo HAVING 
COUNT(Seccion_Articulo) = (SELECT MAX(suma_secciones) FROM (SELECT Seccion_Articulo, COUNT(Seccion_Articulo) AS suma_secciones
FROM producto AS p GROUP BY Seccion_Articulo) AS maximo);

-- ¿Cuales productos estan en el paquete 3? (Descartada ya que se tuvo que modificar la base de datos para que funcionara correctamente)
-- SELECT p.Tipo_Articulo FROM producto AS p JOIN almacena ON Identificacion = Producto_identificacion
-- WHERE paquete_ID_paquete = 3;

-- ¿Cuantos productos de tipo articulo tiene la tienda?
SELECT COUNT(Tipo_Producto) AS numArticulos FROM producto WHERE Tipo_Producto = 'Articulo';

-- ¿Cuál es el producto con el precio más alto?
SELECT Tipo_Producto, Tipo_Articulo, Precio 
FROM producto 
WHERE Precio = (SELECT MAX(Precio) FROM producto);

-- ¿Cuál es el monto total de ventas por mes de cada año?
SELECT MONTH(Fecha_compra) AS Mes, YEAR(Fecha_compra) AS Año, SUM(Costo_total) AS Monto_Total 
FROM compra 
GROUP BY Mes, Año;

-- ¿Cuál es el promedio de edad de los clientes por género?
SELECT Genero, ROUND(AVG(Edad)) AS PromedioEdad -- ROUND usamos esta función ya que funciona igual en Python.
FROM persona
GROUP BY Genero;

-- ¿Cuál es el cliente que ha realizado la compra más cara en términos de costo total?
SELECT C.Cuenta_Usuario, C.Costo_total AS Compra_mas_cara
FROM Compra AS C
WHERE C.Costo_total = (
        SELECT MAX(Costo_total)
        FROM Compra
);

-- CONSULTA ANIDADA -->
-- ¿Cuál es la sección con el precio promedio más alto por artículo vendido?
-- Este da NULL ya que el articulo más comprado es un Diseño y estos no tienen Sección
SELECT p.Seccion_Articulo, AVG(p.Precio) AS PrecioPromedio 
FROM producto AS p 
JOIN contiene AS c ON p.Identificacion = c.Producto_Identificacion 
GROUP BY p.Seccion_Articulo 
HAVING AVG(p.Precio) = (SELECT MAX(PrecioPromedio)
                        FROM (SELECT AVG(p.Precio) AS PrecioPromedio 
                                FROM producto AS p 
                                JOIN contiene AS c ON p.Identificacion = c.Producto_Identificacion 
                                GROUP BY p.Seccion_Articulo) AS PreciosPorSeccion);