INSERT INTO Cuenta (Usuario, Tipo, Contraseña) VALUES
('juan_perez', 'Administrador', 'P3r3z#2024'),
('Maria_gonzalez', 'Cliente', 'G0nz@lez21'),
('Pedro_ruiz12', 'Cliente', 'Ruiz_2024'),
('Luisa_martinez9191', 'Cliente', 'M@rt1n3z!'),
('77Carlos_rodriguez77', 'Cliente', 'R0dr1gu3z&'),
('Ana_5454', 'Cliente', 'S@nch3z21'),
('Pablito22', 'Cliente', 'L0pez2024'),
('Sofia_', 'Cliente', 'G0mez#21'),
('Diego_el_master', 'Cliente', 'D14z!'),
('Lauris', 'Cliente', 'H3rn@nd3z20');

INSERT INTO `Sportswear_Store`.`Usuario` (`Nombre`, `Correo`, `Telefono`, `Genero`, `Edad`, `Cuenta_Usuario`) VALUES
('Juan', 'juan@example.com', '123456789', 'Hombre', 25, 'juan_perez'),
('Maria', 'maria@example.com', '987654321', 'Mujer', 30, 'Maria_gonzalez'),
('Pedro', 'pedro@example.com', '555555555', 'Hombre', 28, 'Pedro_ruiz12'),
('Luisa', 'luisa@example.com', '444444444', 'Mujer', 35, 'Luisa_martinez9191'),
('Carlos', 'carlos@example.com', '777777777', 'Hombre', 40, '77Carlos_rodriguez77'),
('Ana', 'ana@example.com', '666666666', 'Mujer', 32, 'Ana_5454'),
('Pablo', 'pablo@example.com', '333333333', 'Hombre', 45, 'Pablito22'),
('Sofia', 'sofia@example.com', '222222222', 'Mujer', 27, 'Sofia_'),
('Diego', 'diego@example.com', '999999999', 'Hombre', 38, 'Diego_el_master'),
('Laura', 'laura@example.com', '111111111', 'Mujer', 33, 'Lauris');

INSERT INTO `Sportswear_Store`.`Compra` (`Costo_total`, `Fecha_compra`, `Usuario_Identificacion`) VALUES
(100.50, '2024-03-01', 1),
(75.20, '2024-03-02', 2),
(150.75, '2024-02-03', 3),
(200.00, '2024-03-04', 4),
(90.80, '2024-03-05', 5),
(120.25, '2024-03-06', 6),
(85.50, '2024-02-07', 7),
(95.60, '2024-03-08', 8),
(110.45, '2024-03-10', 9),
(130.70, '2024-03-10', 10);

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

INSERT INTO `Sportswear_Store`.`Producto` (`Precio`, `Imagen_producto`, `Tipo`, `Tipo_Articulo`, `Seccion`, `Cantidad`) VALUES
(50.00, 'imagen1.jpg', 'Articulo', 'Camisa', 'Hombre', 100),
(35.00, 'imagen2.jpg', 'Articulo', 'Pantalon', 'Mujer', 80),
(20.00, 'imagen3.jpg', 'Articulo', 'Gorra', 'Niño', 120),
(45.00, 'imagen4.jpg', 'Diseno', 'Sudadera', 'Hombre', 90),
(60.00, 'imagen5.jpg', 'Diseno', 'Vestido', 'Mujer', 70),
(25.00, 'imagen6.jpg', 'Articulo', 'Zapatillas', 'Niño', 110),
(40.00, 'imagen7.jpg', 'Articulo', 'Polo', 'Hombre', 95),
(55.00, 'imagen8.jpg', 'Diseno', 'Falda', 'Mujer', 75),
(30.00, 'imagen9.jpg', 'Articulo', 'Calcetines', 'Niño', 130),
(65.00, 'imagen10.jpg', 'Diseno', 'Chaqueta', 'Hombre', 85);

INSERT INTO `Sportswear_Store`.`Contiene` (`Producto_Identificacion`, `Compra_ID_compra`, `Cantidad`) VALUES
(1, 1, 2),
(2, 2, 3),
(3, 3, 1),
(4, 4, 2),
(1, 5, 3),
(6, 6, 1),
(7, 7, 2),
(8, 8, 3),
(9, 9, 1),
(10, 10, 2);

INSERT INTO `Sportswear_Store`.`Paquete` (`Precio`) VALUES
(80.00),
(95.00),
(110.00),
(125.00),
(140.00),
(155.00),
(170.00),
(185.00),
(200.00),
(215.00);

INSERT INTO `Sportswear_Store`.`Almacena` (`Producto_Identificacion`, `Paquete_ID_paquete`) VALUES
(1, 1),
(2, 1),
(3, 3),
(2, 3),
(5, 2),
(6, 2),
(7, 2),
(8, 4),
(9, 4),
(10, 4);

INSERT INTO `Sportswear_Store`.`Resena` (`Comentarios`, `Valoraciones`, `Producto_Identificacion`) VALUES
('Buen producto', 4, 1),
('Excelente calidad', 5, 2),
('Muy recomendado', 4, 3),
('Me encanto', 5, 4),
('Gran diseno', 4, 5),
('Comodo y bonito', 5, 9),
('Buena relacion calidad-precio', 4, 7),
('Perfecto para cualquier ocasion', 5, 9),
('Muy satisfecho con la compra', 4, 9),
('Supero mis expectativas', 5, 10);
