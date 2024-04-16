INSERT INTO `Sportswear_Store`.`Lugar` (`Nombre`, `Lugar_Codigo`) VALUES
('Cali', 1),
('Medenin', 2),
('Cucuta', 3),
('Pasto', 4),
('Bogota', 5),
('Buga', 6),
('Tulua', 7),
('Santa Marta', 8),
('Ibague', 9),
('Manizales', 10);

INSERT INTO `Sportswear_Store`.`Persona` (`Nombre`, `Correo`, `Telefono`, `Genero`, `Edad`, `Lugar_Codigo`) VALUES
('Juan', 'juan@example.com', '123456789', 'Hombre', 25, 2),
('Maria', 'maria@example.com', '987654321', 'Mujer', 30, 1),
('Pedro', 'pedro@example.com', '555555555', 'Hombre', 28, 1),
('Luisa', 'luisa@example.com', '444444444', 'Mujer', 35, 3),
('Carlos', 'carlos@example.com', '777777777', 'Hombre', 40, 7),
('Ana', 'ana@example.com', '666666666', 'Mujer', 32, 8),
('Pablo', 'pablo@example.com', '333333333', 'Hombre', 45, 1),
('Sofia', 'sofia@example.com', '222222222', 'Mujer', 27, 3),
('Diego', 'diego@example.com', '999999999', 'Hombre', 38, 8),
('Laura', 'laura@example.com', '111111111', 'Mujer', 33, 2);

INSERT INTO `Sportswear_Store`.`Cuenta` (`Usuario`, `Tipo_Cuenta`, `Contraseña`, `Usuario_Identificacion`) VALUES
('juan_perez', 'Administrador', 'P3r3z#2024',1),
('Maria_gonzalez', 'Cliente', 'G0nz@lez21',2),
('Pedro_ruiz12', 'Cliente', 'Ruiz_2024',3),
('Luisa_martinez9191', 'Cliente', 'M@rt1n3z!',4),
('77Carlos_rodriguez77', 'Cliente', 'R0dr1gu3z&',5),
('Ana_5454', 'Cliente', 'S@nch3z21',6),
('Pablito22', 'Cliente', 'L0pez2024',7),
('Sofia_', 'Cliente', 'G0mez#21',8),
('Diego_el_master', 'Cliente', 'D14z!',9),
('Lauris', 'Cliente', 'H3rn@nd3z20',10);

INSERT INTO `Sportswear_Store`.`Compra` (`Costo_total`, `Fecha_compra`, `Cuenta_usuario`) VALUES
(100.50, '2024-03-01', 'juan_perez'),
(75.20, '2024-03-02', 'Maria_gonzalez'),
(150.75, '2024-02-03','Pedro_ruiz12'), 
(200.00, '2024-03-04', 'Luisa_martinez9191'),
(90.80, '2024-03-05', '77Carlos_rodriguez77'),
(120.25, '2024-03-06', 'Ana_5454'),
(85.50, '2024-02-07', 'Pablito22'),
(95.60, '2024-03-08', 'Sofia_'),
(110.45, '2024-03-10', 'Diego_el_master'),
(130.70, '2024-03-10', 'Lauris');

INSERT INTO `Sportswear_Store`.`Envio` (`Direccion`, `Fecha_envio`, `Codigo_postal`, `Compra_ID_compra`, `Lugar_Codigo`) VALUES
('Calle 1 #123', '2024-03-01', 12345, 1, 1),
('Avenida 2 #456', '2024-03-02', 23456, 2, 2),
('Carrera 3 #789', '2024-03-03', 34567, 3, 3),
('Calle 4 #1011', '2024-03-04', 45678, 4, 6),
('Avenida 5 #1213', '2024-03-05', 56789, 5, 5),
('Carrera 6 #1415', '2024-03-06', 67890, 6, 6),
('Calle 7 #1617', '2024-03-07', 78901, 7, 7),
('Avenida 8 #1819', '2024-03-08', 89012, 8, 8),
('Carrera 9 #2021', '2024-03-09', 90123, 9, 9),
('Calle 10 #2223', '2024-03-10', 12345, 10, 10);

INSERT INTO `Sportswear_Store`.`Producto` (`Precio`, `Imagen_producto`, `Tipo_Producto`, `Tipo_Articulo`, `Seccion_Articulo`, `Cantidad_Articulo`, `Especificaciones_Articulo`, `Productos_paquete`, `esPaquete`) VALUES
(50.00, 'imagen1.jpg', 'Articulo', 'Camisa', 'Hombre', 100, '[{"Talla":"XS","Cantidad":20},{"Talla":"S","Cantidad":20},{"Talla":"M", "Cantidad":20},{"Talla":"L","Cantidad":20},{"Talla":"XL","Cantidad":20}]', NULL, false),
(35.00, 'imagen2.jpg', 'Articulo', 'Pantalon', 'Mujer', 80, '[{"Talla":"4","Cantidad":10},{"Talla":"6", "Cantidad":30}, {"Talla":"8","Cantidad":10},{"Talla":"10","Cantidad":15},{"Talla":"12","Cantidad":10},{"Talla":"14","Cantidad":5}]', NULL, false),
(20.00, 'imagen3.jpg', 'Articulo', 'Gorra', 'Niño', 120, '[{"Talla":"12 meses","Cantidad":5},{"Talla":"18 meses","Cantidad":10},{"Talla":"24 meses","Cantidad":10},{"Talla":"36 meses","Cantidad":15},{"Talla":"4 anos","Cantidad":30},{"Talla":"6 anos","Cantidad":25},{"Talla":"8-12 anos","Cantidad":25}]', NULL, false),
(45.00, 'imagen4.jpg', 'Diseno', NULL, NULL, 90, NULL, NULL, false),
(60.00, 'imagen5.jpg', 'Diseno', NULL, NULL, 70, NULL, NULL, false),
(25.00, 'imagen6.jpg', 'Articulo', 'Zapatillas', 'Niño', 110, '[{"Talla":"20","Cantidad":5},{"Talla":"21","Cantidad":10},{"Talla":"22","Cantidad":15},{"Talla":"23","Cantidad":10},{"Talla":"24","Cantidad":10},{"Talla":"25","Cantidad":15},{"Talla":"26","Cantidad":10},{"Talla":"27","Cantidad":5},{"Talla":"28","Cantidad":20},{"Talla":"29","Cantidad":5},{"Talla":"30","Cantidad":5}]', NULL, false),
(40.00, 'imagen7.jpg', 'Articulo', 'Polo', 'Hombre', 95, '[{"Talla":"XS","Cantidad":10},{"Talla":"S","Cantidad":20},{"Talla":"M","Cantidad":30},{"Talla":"L","Cantidad":20},{"Talla":"XL","Cantidad":15}]', NULL, false),
(55.00, 'imagen8.jpg', 'Diseno', NULL, NULL, 75, NULL, NULL, false),
(30.00, 'imagen9.jpg', 'Articulo', 'Calcetines', 'Niño', 130, '[{"Talla":"2-4","Cantidad":60},{"Talla":"4-6","Cantidad":40},{"Talla":"6-8","Cantidad":30}]', NULL, false),
(65.00, 'imagen10.jpg', 'Diseno', NULL, NULL, 85, NULL, NULL, false);

INSERT INTO `Sportswear_Store`.`Contiene` (`Producto_Identificacion`, `Compra_ID_compra`, `Cantidad`, `Especificaciones`) VALUES
(1, 1, 2, '[{"Talla":"M","Cantidad":2}]'),
(2, 2, 3, '[{"Talla":"10","Cantidad":3}]'),
(3, 3, 1, '[{"Talla":"4 Anos","Cantidad":1}]'),
(4, 4, 2, NULL),
(1, 5, 3, '[{"Talla":"L","Cantidad":2},{"Talla":"S","Cantidad":1}]'),
(6, 6, 1, '[{"Talla":"22","Cantidad":1}]'),
(7, 7, 2, '[{"Talla":"XL","Cantidad":2}]'),
(8, 8, 3, NULL),
(9, 9, 1, '[{"Talla":"6-8","Cantidad":1}]'),
(10, 10, 2, NULL);