# Proyecto Almacenamiento de Datos: Sportswear Store

*[Natalia Moreno Montoya](https://github.com/natam226)*

*[Valentina Bueno Collazos](https://github.com/valentinabc19)*

*[David Alejandro Cajiao Lazt](https://github.com/DCajiao)*

*[Juan Andres Lopez Alvarez](https://github.com/DCajiao)*

---

[Información sobre el proyecto](https://github.com/DCajiao/sportswear_store/blob/main/Proyecto%20de%20Curso%20-%20Almacenamiento%20de%20Datos.pdf)

---

Este repositorio contiene el diseño del backend, centrado primordialmente en la estructura y gestión de la base de datos, así como en su implementación. Comenzando desde la concepción del diseño de la base de datos, basado en un análisis exhaustivo del dominio de aplicación (también conocido como “Universo del Discurso”), este proyecto abarca todos los aspectos desde el desarrollo hasta el despliegue.

---

## 🔍 Análisis sobre el Universo del Discurso

### Entidades

| ENTIDAD | Atributo PK | Atributos simples | Atributos Derivados |
| --- | --- | --- | --- |
| Administrador | ID_admin | nombre, correo, teléfono |  |
| Cliente | Identificacion | nombre, correo, genero, edad |  |
| Paquete | ID_paquete | precio |  |
| Articulo | Identificacion | precio, imagen_del_producto, tipo, secciones, cantidad |  |
| Diseño | Identificacion | precio, imagen_del_producto, |  |
| Reseña | ID_reseña | comentarios,valoraciones |  |
| Compra | ID_compra | fecha_compra | costo_total |
| Envio | ID_envio | Direccion, fecha_envio, codigo_postal |  |
| Lugar | Codigo | Nombre |  |

### Relaciones:

| ENTIDAD 1 | SE RELACIONA CON | ENTIDAD 2 | ATRIBUTOS DE LA RELACIÓN |
| --- | --- | --- | --- |
| ADMINISTRADOR | Crea | PAQUETE |  |
| PAQUETE | Almacena | PRODUCTO |  |
| PRODUCTO | Tiene | RESEÑA |  |
| CLIENTE | Realiza | COMPRA |  |
| COMPRA | Contiene | PRODUCTO | cantidad |
| COMPRA | Lleva  | LUGAR |  |
| ENVÍO | Hacia  | LUGAR |  |
| LUGAR | Esta_en | LUGAR |  |


## 🗂️ MER

![MER-diagrama-png](https://github.com/DCajiao/sportswear_store/blob/main/db_diagrams/MER.png?raw=true)

- [Diagrama completo](https://drive.google.com/file/d/1OhrWwU322MSNL48Lc3sZaY-cKv6n9IXW/view)


## 🧩 MR

![MR-diagrama-png](https://github.com/DCajiao/sportswear_store/blob/main/db_diagrams/MR.png?raw=true)

- [Diagrama Completo](https://drive.google.com/file/d/18cunQ3gYTccL-rEyEJTIVkVz7Fbsw2J3/view?usp=sharing)

- Observacion: Debido al MySQL Workbench, a la hora de exportar las imágenes no se logra apreciar muy bien el dominio de las columnas, pero sí en el script. Por ende, se clarificarán a continuación:
    | Tabla    | Columna  | Dominio                           |
    |----------|----------|-----------------------------------|
    | Cuenta   | Tipo     | 'Cliente', 'Administrador'        |
    | Usuario  | Genero   | 'Hombre', 'Mujer'                 |
    | Producto | Tipo     | 'Articulo', 'Diseño'              |
    | Producto | Seccion  | 'Hombre', 'Mujer', 'Niño'         |


## 📊 Query's 
1. ¿Cuál es el producto más vendido?

2. ¿Cuál son las reseñas de los calcetines?

3. ¿Cuál es el lugar que ha recibido más envíos?

4. ¿Cuál es la fecha en la que más se han hecho compras?

5. ¿Cuál es la sección en la que se venden más productos?

6. ¿Cuáles productos están en el paquete 3?

7. ¿Cuántos productos de tipo artículo tiene la tienda?

8. ¿Cuál es el producto con el precio más alto?

9. ¿Cuál es el promedio de valoraciones de los productos por tipo?

10. ¿Cuál es el monto total de ventas por mes de cada año?

11. ¿Cuál es el promedio de edad de los clientes por género?

12. ¿Cuántos clientes han dejado reseñas y cuál es la valoración promedio que han dado?

13. ¿Cuál es el cliente que ha realizado la compra más cara en términos de costo total?

14. ¿Cuál es la sección con el precio promedio más alto por artículo vendido?


## 📝 Scripts:

[Archivo SQL db](https://github.com/DCajiao/sportswear_store/blob/main/script/init.sql)

[Archivo SQL data](https://github.com/DCajiao/sportswear_store/blob/main/script/data.sql)

[Archivo SQL querys](https://github.com/DCajiao/sportswear_store/blob/main/script/query.sql)

## 🚀 Próximamente …

- Implementación de db NoSQL.
- Dockerización.
- Despliegue en Cloud Computing.
- ...
