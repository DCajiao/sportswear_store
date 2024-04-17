INSERT INTO `Sportswear_Store`.`Lugar` (`Nombre`, `Lugar_Codigo`) VALUES
('Bogotá', 1),
('Medellín', 2),
('Cali', 3),
('Barranquilla', 4),
('Cartagena', 5),
('Cúcuta', 6),
('Bucaramanga', 7),
('Pereira', 8),
('Santa Marta', 9),
('Ibagué', 10),
('Bello', 11),
('Soledad', 12),
('Villavicencio', 13),
('Soacha', 14),
('Manizales', 15),
('Pasto', 16),
('Montería', 17),
('Neiva', 18),
('Palmira', 19),
('Armenia', 20);

INSERT INTO Sportswear_Store.Persona (Nombre, Correo, Telefono, Genero, Edad, Lugar_Codigo) VALUES
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

INSERT INTO Sportswear_Store.Cuenta (Usuario, Tipo_Cuenta, Contraseña, Usuario_Identificacion) VALUES
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

INSERT INTO Sportswear_Store.Compra (Costo_total, Fecha_compra, Cuenta_usuario) VALUES
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

INSERT INTO Sportswear_Store.Envio (Direccion, Fecha_envio, Codigo_postal, Compra_ID_compra, Lugar_Codigo) VALUES
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

INSERT INTO `Sportswear_Store`.`Producto` (`Precio`, `Imagen_producto`, `Tipo`, `Tipo_Articulo`, `Seccion_Articulo`, `Cantidad_Articulo`, `Especificaciones_Articulo`, `Productos_paquete`) VALUES
(50.00, 'imagen1.jpg', 'Articulo', 'Camisa', 'Hombre', 100, '{"XS":20, "S":20, "M":20, "L":20, "XL":20}', NULL),
(35.00, 'imagen2.jpg', 'Articulo', 'Pantalon', 'Mujer', 80, '{"4":10, "6":30, "8":10, "10":15, "12":10, "14":5}', NULL),
(20.00, 'imagen3.jpg', 'Articulo', 'Gorra', 'Niño', 120, '{"12 meses":5, "18 meses":10, "24 meses":10, "36 meses":15,"4 años":30, "6 años":25, "8-12 años":25}', NULL),
(45.00, 'imagen4.jpg', 'Diseno', NULL, NULL, 90,'{"Especificaciones":"No tiene"}', NULL),
(60.00, 'imagen5.jpg', 'Diseno', NULL, NULL, 70, '{"Especificaciones":"No tiene"}', NULL),
(25.00, 'imagen6.jpg', 'Articulo', 'Zapatillas', 'Niño', 110, '{"20":5, "21":10, "22":15, "23":10, "24":10, "25":15, "26":10, "27":5, "28":20, "29":5, "30":5}', NULL),
(40.00, 'imagen7.jpg', 'Articulo', 'Polo', 'Hombre', 95, '{"XS":10, "S":20, "M":30, "L":20, "XL":15}', NULL),
(55.00, 'imagen8.jpg', 'Diseno', NULL, NULL, 75, '{"Especificaciones":"No tiene"}', NULL),
(30.00, 'imagen9.jpg', 'Articulo', 'Calcetines', 'Niño', 130, '{"2-4":60, "4-6":40, "6-8":30}', NULL),
(65.00, 'imagen10.jpg', 'Diseno', NULL, NULL, 85, '{"Especificaciones":"No tiene"}', NULL);

INSERT INTO `Sportswear_Store`.`Contiene` (`Producto_Identificacion`, `Compra_ID_compra`, `Cantidad`, `Especificaciones`) VALUES
(1, 1, 2, '{"M":2}'),
(2, 2, 3, '{"10":3}'),
(3, 3, 1, '{"4 Aaños":1}'),
(4, 4, 2, '{"Especificaciones":"No tiene"}'),
(1, 5, 3, '{"L":2, "S":1}'),
(6, 6, 1, '{"22":1}'),
(7, 7, 2, '{"XL":2}'),
(8, 8, 3, '{"Especificaciones":"No tiene"}'),
(9, 9, 1, '{"6-8":1}'),
(10, 10, 2, '{"Especificaciones":"No tiene"}');