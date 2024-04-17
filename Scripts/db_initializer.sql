-- MySQL Script generated by MySQL Workbench
-- Tue Apr 16 22:38:53 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sportswear_store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sportswear_store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sportswear_store` DEFAULT CHARACTER SET utf8mb4 ;
USE `sportswear_store` ;

-- -----------------------------------------------------
-- Table `sportswear_store`.`Lugar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sportswear_store`.`Lugar` (
  `Codigo` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Lugar_Codigo` INT NOT NULL,
  PRIMARY KEY (`Codigo`),
  INDEX `fk_Lugar_Lugar1_idx` (`Lugar_Codigo` ASC),
  UNIQUE INDEX `Lugar_Codigo_UNIQUE` (`Lugar_Codigo` ASC),
  CONSTRAINT `fk_Lugar_Lugar1`
    FOREIGN KEY (`Lugar_Codigo`)
    REFERENCES `sportswear_store`.`Lugar` (`Codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sportswear_store`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sportswear_store`.`Persona` (
  `Identificacion` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Correo` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  `Genero` ENUM('Hombre', 'Mujer') NULL,
  `Edad` INT NULL,
  `Lugar_Codigo` INT NOT NULL,
  PRIMARY KEY (`Identificacion`),
  INDEX `fk_Persona_Lugar1_idx` (`Lugar_Codigo` ASC),
  CONSTRAINT `fk_Persona_Lugar1`
    FOREIGN KEY (`Lugar_Codigo`)
    REFERENCES `sportswear_store`.`Lugar` (`Codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sportswear_store`.`Cuenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sportswear_store`.`Cuenta` (
  `Usuario` VARCHAR(50) NOT NULL,
  `Tipo_Cuenta` ENUM('Administrador', 'Cliente') NOT NULL,
  `Contraseña` VARCHAR(45) NOT NULL,
  `Usuario_Identificacion` INT NOT NULL,
  PRIMARY KEY (`Usuario`),
  INDEX `fk_Cuenta_Usuario1_idx` (`Usuario_Identificacion` ASC),
  CONSTRAINT `fk_Cuenta_Usuario1`
    FOREIGN KEY (`Usuario_Identificacion`)
    REFERENCES `sportswear_store`.`Persona` (`Identificacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sportswear_store`.`Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sportswear_store`.`Compra` (
  `ID_compra` INT NOT NULL AUTO_INCREMENT,
  `Costo_total` DECIMAL(10,2) NOT NULL,
  `Fecha_compra` DATE NOT NULL,
  `Cuenta_Usuario` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ID_compra`),
  INDEX `fk_Compra_Cuenta1_idx` (`Cuenta_Usuario` ASC),
  CONSTRAINT `fk_Compra_Cuenta1`
    FOREIGN KEY (`Cuenta_Usuario`)
    REFERENCES `sportswear_store`.`Cuenta` (`Usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sportswear_store`.`Envio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sportswear_store`.`Envio` (
  `ID_envio` INT NOT NULL AUTO_INCREMENT,
  `Direccion` VARCHAR(45) NOT NULL,
  `Fecha_envio` DATE NOT NULL,
  `Codigo_postal` INT NOT NULL,
  `Compra_ID_compra` INT NOT NULL,
  `Lugar_Codigo` INT NOT NULL,
  PRIMARY KEY (`ID_envio`),
  INDEX `fk_Envio_Compra1_idx` (`Compra_ID_compra` ASC),
  INDEX `fk_Envio_Lugar1_idx` (`Lugar_Codigo` ASC),
  CONSTRAINT `fk_Envio_Compra1`
    FOREIGN KEY (`Compra_ID_compra`)
    REFERENCES `sportswear_store`.`Compra` (`ID_compra`),
  CONSTRAINT `fk_Envio_Lugar1`
    FOREIGN KEY (`Lugar_Codigo`)
    REFERENCES `sportswear_store`.`Lugar` (`Codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sportswear_store`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sportswear_store`.`Producto` (
  `Identificacion` INT NOT NULL AUTO_INCREMENT,
  `Precio` DECIMAL(10,2) NOT NULL,
  `Imagen_producto` BLOB NOT NULL,
  `Tipo_Producto` ENUM('Articulo', 'Diseño') NOT NULL,
  `Tipo_Articulo` ENUM('Calcetines', 'Polo', 'Zapatillas', 'Gorra', 'Pantalon', 'Camisa') NULL,
  `Seccion_Articulo` ENUM('Hombre', 'Mujer', 'Nino') NULL,
  `Cantidad_Articulo` INT NULL,
  `Especificaciones_Articulo` JSON NULL,
  `Productos_paquete` JSON NULL,
  `esPaquete` TINYINT NULL,
  PRIMARY KEY (`Identificacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sportswear_store`.`Contiene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sportswear_store`.`Contiene` (
  `ID_contiene` INT NOT NULL AUTO_INCREMENT,
  `Producto_Identificacion` INT NOT NULL,
  `Compra_ID_compra` INT NOT NULL,
  `Cantidad` INT NOT NULL,
  `Especificaciones` JSON NULL,
  INDEX `fk_Producto_has_Compra_Compra1_idx` (`Compra_ID_compra` ASC),
  INDEX `fk_Producto_has_Compra_Producto1_idx` (`Producto_Identificacion` ASC),
  PRIMARY KEY (`ID_contiene`),
  CONSTRAINT fk_Producto_has_Compra_Producto1
    FOREIGN KEY (Producto_Identificacion)
    REFERENCES Sportswear_Store.Producto (Identificacion),
  CONSTRAINT fk_Producto_has_Compra_Compra1
    FOREIGN KEY (Compra_ID_compra)
    REFERENCES Sportswear_Store.Compra (ID_compra))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- ---------------------------------------------------
-- TRIGGERS
-- ---------------------------------------------------

-- Trigger para validar la existencia de un usuario antes de registrar una compra
DELIMITER //
CREATE TRIGGER validar_usuario_existente
BEFORE INSERT ON Compra
FOR EACH ROW
BEGIN
    DECLARE usuario_valido INT;
    
    -- Verificar si el usuario especificado existe en la tabla Cuenta
    SELECT COUNT(*) INTO usuario_valido
    FROM Cuenta
    WHERE Usuario = NEW.Cuenta_Usuario;
    
    -- Si el usuario no existe, emitir un mensaje de error
    IF usuario_valido = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario especificado no existe';
    END IF;
END;
//DELIMITER ;

-----------------------------------------------------

-- Trigger para validar la disponibilidad antes de registrar qué contiene una compra
DELIMITER //
CREATE TRIGGER validar_disponibilidad
BEFORE INSERT ON Contiene
FOR EACH ROW
BEGIN
    DECLARE cantidad_disponible INT;
    
    -- Obtener la cantidad disponible del producto
    SELECT Cantidad_Articulo INTO cantidad_disponible
    FROM Producto
    WHERE Identificacion = NEW.Producto_Identificacion;
    
    -- Verificar si la cantidad seleccionada es mayor que la cantidad disponible
    IF NEW.Cantidad > cantidad_disponible THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No hay suficiente stock disponible para insertar esta cantidad de producto';
    END IF;
END;
// DELIMITER ;

-- -----------------------------------------------------

-- Trigger para actualizar la cantidad disponible de un producto en el inventario después de una compra
DELIMITER //
CREATE TRIGGER ActualizarCantidadDisponible
AFTER INSERT ON Contiene
FOR EACH ROW
BEGIN
    UPDATE Producto
    SET Cantidad_Articulo = Cantidad_Articulo - NEW.Cantidad
    WHERE Identificacion = NEW.Producto_Identificacion;
END //
DELIMITER ;

-- -----------------------------------------------------

-- Trigger para actualizar el valor de la compra después de insertar un nuevo registro en la tabla Contiene
DELIMITER //
CREATE TRIGGER actualizar_costo_total_despues_insertar
AFTER INSERT ON Contiene
FOR EACH ROW
BEGIN
    DECLARE total DECIMAL(10,2);
    
    -- Calcular el costo total de la compra
    SELECT SUM(p.Precio * c.Cantidad) INTO total
    FROM Producto p
    JOIN Contiene c ON p.Identificacion = c.Producto_Identificacion
    WHERE c.Compra_ID_compra = NEW.Compra_ID_compra;
    
    -- Actualizar el costo total de la compra
    UPDATE Compra
    SET Costo_total = total
    WHERE ID_compra = NEW.Compra_ID_compra;
END;
//DELIMITER ;

-- -----------------------------------------------------

-- ---------------------------------------------------
-- FUNCTIONS
-- ---------------------------------------------------

-- Función para obtener la cantidad de productos disponible en el inventario
DELIMITER //
CREATE FUNCTION ObtenerCantidadDisponible(
    p_identificacion INT
)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE cantidad_disponible INT;
    SELECT Cantidad_Articulo INTO cantidad_disponible
    FROM Producto
    WHERE Identificacion = p_identificacion;
    RETURN cantidad_disponible;
END //
DELIMITER ;

-- ¿Cómo llamar la función?
-- SELECT ObtenerCantidadDisponible(1) AS CantidadDisponible;

-- -----------------------------------------------------

-- Función para calcular el costo total de una compra, teniendo en cuenta la cantidad y el precio de los productos.
DELIMITER //
CREATE FUNCTION CalcularCostoTotal(
    p_id_compra INT
)
RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(p.Precio * c.Cantidad) INTO total
    FROM Producto p
    JOIN Contiene c ON p.Identificacion = c.Producto_Identificacion
    WHERE c.Compra_ID_compra = p_id_compra;
    RETURN total;
END //
DELIMITER ;

-- ¿Cómo llamar la función?
-- SELECT CalcularCostoTotal(3) AS CostoTotalCompra;

-- -----------------------------------------------------

-- Función para calcular el total de ingresos obtenidos en un período de tiempo específico 
DELIMITER //
CREATE FUNCTION CalcularTotalIngresos(
    p_fecha_inicio DATE,
    p_fecha_fin DATE
)
RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(Costo_total) INTO total
    FROM Compra
    WHERE Fecha_compra BETWEEN p_fecha_inicio AND p_fecha_fin;
    RETURN total;
END //
DELIMITER ;

-- ¿Cómo llamar la función?
-- SELECT CalcularTotalIngresos('2024-03-01', '2024-03-10') AS TotalIngresos;

-- ---------------------------------------------------

-- ---------------------------------------------------
-- VIEWS
-- ---------------------------------------------------

-- Vista de los productos disponibles junto con su cantidad en stock
CREATE VIEW ProductosDisponibles AS
SELECT Identificacion, Precio, Tipo_Producto, Tipo_Articulo, Seccion_Articulo, Cantidad_Articulo
FROM Producto
WHERE Cantidad_Articulo > 0;

-- ¿Cómo llamar la vista?
-- SELECT * FROM ProductosDisponibles;
-- Otra forma de llamar la vista
-- SELECT * FROM ProductosDisponibles WHERE Tipo = 'Articulo' AND Seccion = 'Hombre';

-- -----------------------------------------------------

-- Vista de los productos con el conteo de ventas
CREATE VIEW VentasProducto AS
SELECT p.Identificacion AS ID_Producto, 
    p.Tipo_Producto,
	p.Tipo_Articulo,
    COUNT(c.Producto_Identificacion) AS Cantidad_Ventas
FROM Producto p
LEFT JOIN Contiene c ON p.Identificacion = c.Producto_Identificacion
GROUP BY p.Identificacion;

-- ¿Cómo llamar la vista?
-- SELECT * FROM VentasProducto;

-- -----------------------------------------------------

-- Vista de Cantidad de ejemplares de un producto 
CREATE VIEW Vista_Cantidad_Ejemplares AS
SELECT Identificacion AS Producto_ID, Cantidad_Articulo, Tipo_Articulo AS Ejemplares
FROM Producto;

-- ¿Cómo llamar la vista?
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

-- ¿Cómo llamar la vista?
-- SELECT * FROM Top3ProductosMasVendidos

-- -----------------------------------------------------

-- ---------------------------------------------------
-- DATA
-- ---------------------------------------------------

INSERT INTO Sportswear_Store.Lugar (`Nombre`, `Lugar_Codigo`) VALUES
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

INSERT INTO Sportswear_Store.Persona (`Nombre`, `Correo`, `Telefono`, `Genero`, `Edad`, `Lugar_Codigo`) VALUES
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

INSERT INTO Sportswear_Store.Cuenta (`Usuario`, `Tipo_Cuenta`, `Contraseña`, `Usuario_Identificacion`) VALUES
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

INSERT INTO Sportswear_Store.Compra (`Costo_total`, `Fecha_compra`, `Cuenta_usuario`) VALUES
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

INSERT INTO Sportswear_Store.Envio (`Direccion`, `Fecha_envio`, `Codigo_postal`, `Compra_ID_compra`, `Lugar_Codigo`) VALUES
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

INSERT INTO Sportswear_Store.Producto (`Precio`, `Imagen_producto`, `Tipo_Producto`, `Tipo_Articulo`, `Seccion_Articulo`, `Cantidad_Articulo`, `Especificaciones_Articulo`, `Productos_paquete`, `esPaquete`) VALUES
(50.00, 'imagen1.jpg', 'Articulo', 'Camisa', 'Hombre', 100, '[{"Talla":"XS","Cantidad":20},{"Talla":"S","Cantidad":20},{"Talla":"M","Cantidad":20},{"Talla":"L","Cantidad":20},{"Talla":"XL","Cantidad":20}]', NULL, 0),
(35.00, 'imagen2.jpg', 'Articulo', 'Pantalon', 'Mujer', 80, '[{"Talla":"4","Cantidad":10},{"Talla":"6","Cantidad":30},{"Talla":"8","Cantidad":10},{"Talla":"10","Cantidad":15},{"Talla":"12","Cantidad":10},{"Talla":"14","Cantidad":5}]', NULL, 0),
(20.00, 'imagen3.jpg', 'Articulo', 'Gorra', 'Nino', 120, '[{"Talla":"12 meses","Cantidad":5},{"Talla":"18 meses","Cantidad":10},{"Talla":"24 meses","Cantidad":10},{"Talla":"36 meses","Cantidad":15},{"Talla":"4 anos","Cantidad":30},{"Talla":"6 anos","Cantidad":25},{"Talla":"8-12 anos","Cantidad":25}]', NULL, 0),
(45.00, 'imagen4.jpg', 'Diseno', NULL, NULL, 90, NULL, NULL, 0),
(60.00, 'imagen5.jpg', 'Diseno', NULL, NULL, 70, NULL, NULL, 0),
(25.00, 'imagen6.jpg', 'Articulo', 'Zapatillas', 'Niño', 110, '[{"Talla":"20","Cantidad":5},{"Talla":"21","Cantidad":10},{"Talla":"22","Cantidad":15},{"Talla":"23","Cantidad":10},{"Talla":"24","Cantidad":10},{"Talla":"25","Cantidad":15},{"Talla":"26","Cantidad":10},{"Talla":"27","Cantidad":5},{"Talla":"28","Cantidad":20},{"Talla":"29","Cantidad":5},{"Talla":"30","Cantidad":5}]', NULL, 0),
(40.00, 'imagen7.jpg', 'Articulo', 'Polo', 'Hombre', 95, '[{"Talla":"20","Cantidad":5},{"Talla":"21","Cantidad":10},{"Talla":"22","Cantidad":15},{"Talla":"23","Cantidad":10},{"Talla":"24","Cantidad":10},{"Talla":"25","Cantidad":15},{"Talla":"26","Cantidad":10},{"Talla":"27","Cantidad":5},{"Talla":"28","Cantidad":20},{"Talla":"29","Cantidad":5},{"Talla":"30","Cantidad":5}]', NULL, 0),
(55.00, 'imagen8.jpg', 'Diseno', NULL, NULL, 75, NULL, NULL, 0),
(30.00, 'imagen9.jpg', 'Articulo', 'Calcetines', 'Nino', 130, '[{"Talla":"2-4","Cantidad":60},{"Talla":"4-6","Cantidad":40},{"Talla":"6-8","Cantidad":30}]', NULL, 0),
(65.00, 'imagen10.jpg', 'Diseno', NULL, NULL, 85, NULL, NULL, 0),
(20.00, 'imagen11.jpg', 'Articulo', NULL, NULL, NULL, NULL, '[{"IdProducto":1},{"IdProducto":2}]', 1),
(25.00, 'imagen12.jpg', 'Articulo', NULL, NULL, NULL, NULL, '[{"IdProducto":3},{"IdProducto":2}]', 1),
(30.00, 'imagen13.jpg', 'Articulo', NULL, NULL, NULL, NULL, '[{"IdProducto":4},{"IdProducto":2}]', 1);

INSERT INTO Sportswear_Store.Contiene (`Producto_Identificacion`, `Compra_ID_compra`, `Cantidad`, `Especificaciones`) VALUES
(1, 1, 2, '{"Talla":"M", "Cantidad":1}'), 
(2, 2, 3, '{"Talla":"4", "Cantidad":2}'),
(3, 3, 1, '{"Talla":"12 meses", "Cantidad":5}'),
(4, 4, 2, NULL),
(5, 5, 3, NULL),
(6, 6, 1, '{"Talla":"20", "Cantidad":1}'),
(7, 7, 2, '{"Talla":"XS", "Cantidad":3}'),
(8, 8, 3, NULL),
(9, 9, 1, '{"Talla":"6-8", "Cantidad":1}'),
(10, 10, 2, NULL);