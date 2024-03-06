-- ¿Cuál es el producto más vendido?
SELECT pr.Tipo_Articulo FROM producto AS pr JOIN contiene AS c ON Producto_Identificacion = Identificacion
GROUP BY pr.Tipo_Articulo HAVING COUNT(c.Producto_Identificacion) = (SELECT MAX(cuenta) FROM 
(SELECT COUNT(Producto_Identificacion) AS cuenta FROM contiene GROUP BY Producto_Identificacion) AS conteo);

-- ¿Cuál son las reseñas de los calcetines?
SELECT comentarios, p.Tipo_Articulo FROM resena JOIN producto AS p 
ON Producto_identificacion = p.identificacion WHERE Tipo_Articulo = 'Calcetines';

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
