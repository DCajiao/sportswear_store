# Proyecto Almacenamiento de Datos: Sportswear Store

*[Natalia Moreno Montoya](https://github.com/natam226)*

*[Valentina Bueno Collazos](https://github.com/valentinabc19)*

*[David Alejandro Cajiao Lazt](https://github.com/DCajiao)*

*[Juan Andres Lopez Alvarez](https://github.com/DCajiao)*

---

Redirección al PDF aquí

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

<img src="https://raw.githubusercontent.com/DCajiao/sportswear_store/f131386f710e07b6b1eae32757bb5a2bbb08d070/images/MER.svg?token=A5OJHELNPLBERWW2CZX3MVLF4TDKU" alt="MER-diagrama-svg" width="auto"/>

- [Diagrama completo](https://drive.google.com/file/d/1OhrWwU322MSNL48Lc3sZaY-cKv6n9IXW/view)


## 🧩 MR

![MR-diagrama-svg](url)

- [Diagrama completo](https://drive.google.com/file/d/1OhrWwU322MSNL48Lc3sZaY-cKv6n9IXW/view)


## 📝 Script:

[Archivo SQL](https://github.com/DCajiao/sportswear_store/blob/main/sql/init.sql)


## 🚀 Próximamente …

- Implementación de db nosql.
- Dockerización.
- Despliegue en Cloud Computing.
- ...