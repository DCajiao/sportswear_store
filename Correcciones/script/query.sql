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
SELECT seccion, COUNT(seccion) FROM producto AS p GROUP BY seccion HAVING 
COUNT(seccion) = (SELECT MAX(suma_secciones) FROM (SELECT seccion, COUNT(seccion) AS suma_secciones
FROM producto AS p GROUP BY seccion) AS maximo);

-- ¿Cuales productos estan en el paquete 3?
SELECT p.Tipo_Articulo FROM producto AS p JOIN almacena ON Identificacion = Producto_identificacion
WHERE paquete_ID_paquete = 3;

-- ¿Cuantos productos de tipo articulo tiene la tienda?
SELECT COUNT(Tipo) AS numArticulos FROM producto WHERE Tipo = 'Articulo';

-- ¿Cuál es el producto con el precio más alto?
SELECT Tipo, Tipo_Articulo, Precio 
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
SELECT p.Nombre, c.Costo_total 
FROM persona AS p 
JOIN compra AS c ON p.Identificacion = c.Cuenta_Usuario 
WHERE c.Costo_total = (SELECT MAX(Costo_total) FROM compra);

-- CONSULTA ANIDADA -->
-- ¿Cuál es la sección con el precio promedio más alto por artículo vendido?
SELECT p.Seccion, AVG(p.Precio) AS PrecioPromedio 
FROM producto AS p 
JOIN contiene AS c ON p.Identificacion = c.Producto_Identificacion 
GROUP BY p.Seccion 
HAVING AVG(p.Precio) = (SELECT MAX(PrecioPromedio)
                        FROM (SELECT AVG(p.Precio) AS PrecioPromedio 
                                FROM producto AS p 
                                JOIN contiene AS c ON p.Identificacion = c.Producto_Identificacion 
                                GROUP BY p.Seccion) AS PreciosPorSeccion);
