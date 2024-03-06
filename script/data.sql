INSERT INTO `Sportswear_Store`.`Usuario` (`Nombre`, `Correo`, `Telefono`, `Tipo`, `Genero`, `Edad`) VALUES
('Juan', 'juan@example.com', '123456789', 'Cliente', 'Hombre', 25),
('Maria', 'maria@example.com', '987654321', 'Administrador', 'Mujer', 30),
('Pedro', 'pedro@example.com', '555555555', 'Cliente', 'Hombre', 28),
('Luisa', 'luisa@example.com', '444444444', 'Cliente', 'Mujer', 35),
('Carlos', 'carlos@example.com', '777777777', 'Cliente', 'Hombre', 40),
('Ana', 'ana@example.com', '666666666', 'Cliente', 'Mujer', 32),
('Pablo', 'pablo@example.com', '333333333', 'Administrador', 'Hombre', 45),
('Sofia', 'sofia@example.com', '222222222', 'Cliente', 'Mujer', 27),
('Diego', 'diego@example.com', '999999999', 'Cliente', 'Hombre', 38),
('Laura', 'laura@example.com', '111111111', 'Cliente', 'Mujer', 33);


INSERT INTO `Sportswear_Store`.`Compra` (`Costo_total`, `Fecha_compra`, `Usuario_Identificacion`) VALUES
(100.50, '2024-03-01', 1),
(75.20, '2024-03-02', 2),
(150.75, '2024-03-03', 3),
(200.00, '2024-03-04', 4),
(90.80, '2024-03-05', 5),
(120.25, '2024-03-06', 6),
(85.50, '2024-03-07', 7),
(95.60, '2024-03-08', 8),
(110.45, '2024-03-09', 9),
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
('Calle 4 #1011', '2024-03-04', 45678, 4, 4),
('Avenida 5 #1213', '2024-03-05', 56789, 5, 5),
('Carrera 6 #1415', '2024-03-06', 67890, 6, 6),
('Calle 7 #1617', '2024-03-07', 78901, 7, 7),
('Avenida 8 #1819', '2024-03-08', 89012, 8, 8),
('Carrera 9 #2021', '2024-03-09', 90123, 9, 9),
('Calle 10 #2223', '2024-03-10', 12345, 10, 10);

INSERT INTO `Sportswear_Store`.`Producto` (`Precio`, `Imagen_producto`, `Tipo`, `Tipo_Articulo`, `Seccion`, `Cantidad`) VALUES
(50.00, 'imagen1.jpg', 'Articulo', 'Camisa', 'Hombre', 100),
(35.00, 'imagen2.jpg', 'Articulo', 'Pantalón', 'Mujer', 80),
(20.00, 'imagen3.jpg', 'Articulo', 'Gorra', 'Niño', 120),
(45.00, 'imagen4.jpg', 'Diseño', 'Sudadera', 'Hombre', 90),
(60.00, 'imagen5.jpg', 'Diseño', 'Vestido', 'Mujer', 70),
(25.00, 'imagen6.jpg', 'Articulo', 'Zapatillas', 'Niño', 110),
(40.00, 'imagen7.jpg', 'Articulo', 'Polo', 'Hombre', 95),
(55.00, 'imagen8.jpg', 'Diseño', 'Falda', 'Mujer', 75),
(30.00, 'imagen9.jpg', 'Articulo', 'Calcetines', 'Niño', 130),
(65.00, 'imagen10.jpg', 'Diseño', 'Chaquetón', 'Hombre', 85);

INSERT INTO `Sportswear_Store`.`Contiene` (`Producto_Identificacion`, `Compra_ID_compra`, `Cantidad`) VALUES
(1, 1, 2),
(2, 2, 3),
(3, 3, 1),
(4, 4, 2),
(5, 5, 3),
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
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO `Sportswear_Store`.`Resena` (`Comentarios`, `Valoraciones`, `Producto_Identificacion`) VALUES
('Buen producto', 4, 1),
('Excelente calidad', 5, 2),
('Muy recomendado', 4, 3),
('Me encantó', 5, 4),
('Gran diseño', 4, 5),
('Cómodo y bonito', 5, 6),
('Buena relación calidad-precio', 4, 7),
('Perfecto para cualquier ocasión', 5, 8),
('Muy satisfecho con la compra', 4, 9),
('Superó mis expectativas', 5, 10);


