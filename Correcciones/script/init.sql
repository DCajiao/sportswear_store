-- MySQL Script generated by MySQL Workbench
-- Tue Apr 16 00:56:03 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Sportswear_Store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Sportswear_Store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS Sportswear_Store DEFAULT CHARACTER SET utf8 ;
USE Sportswear_Store ;

-- -----------------------------------------------------
-- Table Sportswear_Store.Lugar
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Sportswear_Store.Lugar (
  Codigo INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(45) NOT NULL,
  Lugar_Codigo INT NOT NULL,
  PRIMARY KEY (Codigo, Lugar_Codigo),
  INDEX fk_Lugar_Lugar1_idx (Lugar_Codigo ASC) VISIBLE,
  UNIQUE INDEX Lugar_Codigo_UNIQUE (Lugar_Codigo ASC) VISIBLE,
  CONSTRAINT fk_Lugar_Lugar1
    FOREIGN KEY (Lugar_Codigo)
    REFERENCES Sportswear_Store.Lugar (Codigo))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Sportswear_Store.Persona
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Sportswear_Store.Persona (
  Identificacion INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(45) NOT NULL,
  Correo VARCHAR(45) NOT NULL,
  Telefono VARCHAR(45) NOT NULL,
  Genero ENUM('Hombre', 'Mujer') NULL,
  Edad INT NULL,
  Lugar_Codigo INT NOT NULL,
  PRIMARY KEY (Identificacion, Lugar_Codigo),
  INDEX fk_Persona_Lugar1_idx (Lugar_Codigo ASC) VISIBLE,
  CONSTRAINT fk_Persona_Lugar1
    FOREIGN KEY (Lugar_Codigo)
    REFERENCES Sportswear_Store.Lugar (Codigo))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Sportswear_Store.Cuenta
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Sportswear_Store.Cuenta (
  Usuario VARCHAR(50) NOT NULL,
  Tipo_Cuenta ENUM('Administrador', 'Cliente') NOT NULL,
  Contraseña VARCHAR(45) NOT NULL,
  Usuario_Identificacion INT NOT NULL,
  PRIMARY KEY (Usuario, Usuario_Identificacion),
  INDEX fk_Cuenta_Usuario1_idx (Usuario_Identificacion ASC) VISIBLE,
  CONSTRAINT fk_Cuenta_Usuario1
    FOREIGN KEY (Usuario_Identificacion)
    REFERENCES Sportswear_Store.Persona (Identificacion))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Sportswear_Store.Compra
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Sportswear_Store.Compra (
  ID_compra INT NOT NULL AUTO_INCREMENT,
  Costo_total DECIMAL(10,2) NOT NULL,
  Fecha_compra DATE NOT NULL,
  Cuenta_Usuario VARCHAR(50) NOT NULL,
  PRIMARY KEY (ID_compra, Cuenta_Usuario),
  INDEX fk_Compra_Cuenta1_idx (Cuenta_Usuario ASC) VISIBLE,
  CONSTRAINT fk_Compra_Cuenta1
    FOREIGN KEY (Cuenta_Usuario)
    REFERENCES Sportswear_Store.Cuenta (Usuario))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Sportswear_Store.Envio
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Sportswear_Store.Envio (
  ID_envio INT NOT NULL AUTO_INCREMENT,
  Direccion VARCHAR(45) NOT NULL,
  Fecha_envio DATE NOT NULL,
  Codigo_postal INT NOT NULL,
  Compra_ID_compra INT NOT NULL,
  Lugar_Codigo INT NOT NULL,
  PRIMARY KEY (ID_envio, Compra_ID_compra, Lugar_Codigo),
  INDEX fk_Envio_Compra1_idx (Compra_ID_compra ASC) VISIBLE,
  INDEX fk_Envio_Lugar1_idx (Lugar_Codigo ASC) VISIBLE,
  CONSTRAINT fk_Envio_Compra1
    FOREIGN KEY (Compra_ID_compra)
    REFERENCES Sportswear_Store.Compra (ID_compra),
  CONSTRAINT fk_Envio_Lugar1
    FOREIGN KEY (Lugar_Codigo)
    REFERENCES Sportswear_Store.Lugar (Codigo))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Sportswear_Store.Producto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Sportswear_Store.Producto (
  Identificacion INT NOT NULL AUTO_INCREMENT,
  Precio DECIMAL(10,2) NOT NULL,
  Imagen_producto BLOB NOT NULL,
  Tipo_Producto ENUM('Articulo', 'Diseño') NOT NULL,
  Tipo_Articulo ENUM('Calcetines', 'Polo', 'Zapatillas', 'Gorra', 'Pantalon', 'Camisa') NULL,
  Seccion_Articulo ENUM('Hombre', 'Mujer', 'Nino') NULL,
  Cantidad_Articulo INT NULL,
  Especificaciones_Articulo JSON NULL,
  Productos_paquete JSON NULL,
  esPaquete TINYINT NULL,
  PRIMARY KEY (Identificacion))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Sportswear_Store.Contiene
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Sportswear_Store.Contiene (
  Producto_Identificacion INT NOT NULL,
  Compra_ID_compra INT NOT NULL,
  Cantidad INT NOT NULL,
  Especificaciones JSON NULL,
  PRIMARY KEY (Producto_Identificacion, Compra_ID_compra),
  INDEX fk_Producto_has_Compra_Compra1_idx (Compra_ID_compra ASC) VISIBLE,
  INDEX fk_Producto_has_Compra_Producto1_idx (Producto_Identificacion ASC) VISIBLE,
  CONSTRAINT fk_Producto_has_Compra_Producto1
    FOREIGN KEY (Producto_Identificacion)
    REFERENCES Sportswear_Store.Producto (Identificacion),
  CONSTRAINT fk_Producto_has_Compra_Compra2 -- Changed the constraint name to make it unique
    FOREIGN KEY (Compra_ID_compra)
    REFERENCES Sportswear_Store.Compra (ID_compra))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;