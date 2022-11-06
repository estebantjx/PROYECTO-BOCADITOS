-- MySQL Script generated by MySQL Workbench
-- Sun Nov  6 11:40:48 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bocaditos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bocaditos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bocaditos` DEFAULT CHARACTER SET utf8 ;
USE `bocaditos` ;

-- -----------------------------------------------------
-- Table `bocaditos`.`tblRoles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bocaditos`.`tblRoles` (
  `rolId` INT NOT NULL AUTO_INCREMENT,
  `rolUsuario` VARCHAR(45) NOT NULL,
  `rolContraseña` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`rolId`),
  UNIQUE INDEX `rolId_UNIQUE` (`rolId` ASC) VISIBLE,
  UNIQUE INDEX `rolUsuario_UNIQUE` (`rolUsuario` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bocaditos`.`tblCliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bocaditos`.`tblCliente` (
  `cliDocumento` INT NOT NULL,
  `cliNombres` VARCHAR(50) NOT NULL,
  `cliApellidos` VARCHAR(50) NOT NULL,
  `cliCorreo` VARCHAR(100) NOT NULL,
  `cliDireccion` VARCHAR(100) NOT NULL,
  `cliTelefono` BIGINT NOT NULL,
  `tblRoles_rolId` INT NOT NULL,
  PRIMARY KEY (`cliDocumento`, `tblRoles_rolId`),
  UNIQUE INDEX `cliDocumento_UNIQUE` (`cliDocumento` ASC) VISIBLE,
  UNIQUE INDEX `cliCorreo_UNIQUE` (`cliCorreo` ASC) VISIBLE,
  INDEX `fk_tblCliente_tblRoles1_idx` (`tblRoles_rolId` ASC) VISIBLE,
  CONSTRAINT `fk_tblCliente_tblRoles1`
    FOREIGN KEY (`tblRoles_rolId`)
    REFERENCES `bocaditos`.`tblRoles` (`rolId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bocaditos`.`tblOrden`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bocaditos`.`tblOrden` (
  `ordCodigo` INT NOT NULL AUTO_INCREMENT,
  `ordFechaEntrega` DATE NOT NULL,
  `ordFechaPedido` DATE NOT NULL,
  `ordEstado` VARCHAR(45) NOT NULL,
  `tblCliente_cliDocumento` INT NOT NULL,
  PRIMARY KEY (`ordCodigo`, `tblCliente_cliDocumento`),
  UNIQUE INDEX `ordCodigo_UNIQUE` (`ordCodigo` ASC) VISIBLE,
  INDEX `fk_tblOrden_tblCliente1_idx` (`tblCliente_cliDocumento` ASC) VISIBLE,
  CONSTRAINT `fk_tblOrden_tblCliente1`
    FOREIGN KEY (`tblCliente_cliDocumento`)
    REFERENCES `bocaditos`.`tblCliente` (`cliDocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bocaditos`.`tblDomiciliario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bocaditos`.`tblDomiciliario` (
  `domDocumento` INT NOT NULL,
  `domNombres` VARCHAR(50) NOT NULL,
  `domApellidos` VARCHAR(50) NOT NULL,
  `domCorreo` VARCHAR(100) NOT NULL,
  `domDireccion` VARCHAR(100) NOT NULL,
  `domTelefono` BIGINT NOT NULL,
  `tblRoles_rolId` INT NOT NULL,
  PRIMARY KEY (`domDocumento`, `tblRoles_rolId`),
  UNIQUE INDEX `domDocumento_UNIQUE` (`domDocumento` ASC) VISIBLE,
  UNIQUE INDEX `domCorreo_UNIQUE` (`domCorreo` ASC) VISIBLE,
  INDEX `fk_tblDomiciliario_tblRoles1_idx` (`tblRoles_rolId` ASC) VISIBLE,
  CONSTRAINT `fk_tblDomiciliario_tblRoles1`
    FOREIGN KEY (`tblRoles_rolId`)
    REFERENCES `bocaditos`.`tblRoles` (`rolId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bocaditos`.`tblRepostero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bocaditos`.`tblRepostero` (
  `repDocumento` INT NOT NULL,
  `repNombres` VARCHAR(50) NOT NULL,
  `repApellidos` VARCHAR(50) NOT NULL,
  `repCorreo` VARCHAR(100) NOT NULL,
  `repDireccion` VARCHAR(100) NOT NULL,
  `repTelefono` BIGINT NOT NULL,
  `tblRoles_rolId` INT NOT NULL,
  PRIMARY KEY (`repDocumento`, `tblRoles_rolId`),
  UNIQUE INDEX `repDocumento_UNIQUE` (`repDocumento` ASC) VISIBLE,
  INDEX `fk_tblRepostero_tblRoles1_idx` (`tblRoles_rolId` ASC) VISIBLE,
  CONSTRAINT `fk_tblRepostero_tblRoles1`
    FOREIGN KEY (`tblRoles_rolId`)
    REFERENCES `bocaditos`.`tblRoles` (`rolId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bocaditos`.`tblProducto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bocaditos`.`tblProducto` (
  `proId` INT NOT NULL,
  `proFechaVen` DATE NOT NULL,
  `proFechaElab` DATE NOT NULL,
  `proNombre` VARCHAR(50) NOT NULL,
  `proCantidad` INT NOT NULL,
  `proEstado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`proId`),
  UNIQUE INDEX `proId_UNIQUE` (`proId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bocaditos`.`tblProveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bocaditos`.`tblProveedor` (
  `prvNit` INT NOT NULL,
  `prvNombre` VARCHAR(50) NOT NULL,
  `prvDireccion` VARCHAR(100) NOT NULL,
  `prvTelefono` BIGINT NULL,
  `prvCorreo` VARCHAR(100) NULL,
  PRIMARY KEY (`prvNit`),
  UNIQUE INDEX `prvNit_UNIQUE` (`prvNit` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bocaditos`.`tblMateriaPrima`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bocaditos`.`tblMateriaPrima` (
  `matId` INT NOT NULL,
  `proFechaVen` DATE NOT NULL,
  `proFechaElab` DATE NOT NULL,
  `proNombre` VARCHAR(50) NOT NULL,
  `proCantidad` INT NOT NULL,
  `proEstado` VARCHAR(45) NOT NULL,
  `tblProveedor_prvNit` INT NOT NULL,
  PRIMARY KEY (`matId`, `tblProveedor_prvNit`),
  UNIQUE INDEX `matId_UNIQUE` (`matId` ASC) VISIBLE,
  INDEX `fk_tblMateriaPrima_tblProveedor1_idx` (`tblProveedor_prvNit` ASC) VISIBLE,
  CONSTRAINT `fk_tblMateriaPrima_tblProveedor1`
    FOREIGN KEY (`tblProveedor_prvNit`)
    REFERENCES `bocaditos`.`tblProveedor` (`prvNit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bocaditos`.`tblrelordenrepostero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bocaditos`.`tblrelordenrepostero` (
  `tblOrden_ordCodigo` INT NOT NULL,
  `tblRepostero_repDocumento` INT NOT NULL,
  PRIMARY KEY (`tblOrden_ordCodigo`, `tblRepostero_repDocumento`),
  INDEX `fk_tblOrden_has_tblRepostero_tblRepostero1_idx` (`tblRepostero_repDocumento` ASC) VISIBLE,
  INDEX `fk_tblOrden_has_tblRepostero_tblOrden_idx` (`tblOrden_ordCodigo` ASC) VISIBLE,
  CONSTRAINT `fk_tblOrden_has_tblRepostero_tblOrden`
    FOREIGN KEY (`tblOrden_ordCodigo`)
    REFERENCES `bocaditos`.`tblOrden` (`ordCodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblOrden_has_tblRepostero_tblRepostero1`
    FOREIGN KEY (`tblRepostero_repDocumento`)
    REFERENCES `bocaditos`.`tblRepostero` (`repDocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bocaditos`.`tblrelordenproducto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bocaditos`.`tblrelordenproducto` (
  `tblOrden_ordCodigo` INT NOT NULL,
  `tblProducto_proId` INT NOT NULL,
  PRIMARY KEY (`tblOrden_ordCodigo`, `tblProducto_proId`),
  INDEX `fk_tblOrden_has_tblProducto_tblProducto1_idx` (`tblProducto_proId` ASC) VISIBLE,
  INDEX `fk_tblOrden_has_tblProducto_tblOrden1_idx` (`tblOrden_ordCodigo` ASC) VISIBLE,
  CONSTRAINT `fk_tblOrden_has_tblProducto_tblOrden1`
    FOREIGN KEY (`tblOrden_ordCodigo`)
    REFERENCES `bocaditos`.`tblOrden` (`ordCodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblOrden_has_tblProducto_tblProducto1`
    FOREIGN KEY (`tblProducto_proId`)
    REFERENCES `bocaditos`.`tblProducto` (`proId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bocaditos`.`tblordendomiciliario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bocaditos`.`tblordendomiciliario` (
  `tblOrden_ordCodigo` INT NOT NULL,
  `tblDomiciliario_domDocumento` INT NOT NULL,
  PRIMARY KEY (`tblOrden_ordCodigo`, `tblDomiciliario_domDocumento`),
  INDEX `fk_tblOrden_has_tblDomiciliario_tblDomiciliario1_idx` (`tblDomiciliario_domDocumento` ASC) VISIBLE,
  INDEX `fk_tblOrden_has_tblDomiciliario_tblOrden1_idx` (`tblOrden_ordCodigo` ASC) VISIBLE,
  CONSTRAINT `fk_tblOrden_has_tblDomiciliario_tblOrden1`
    FOREIGN KEY (`tblOrden_ordCodigo`)
    REFERENCES `bocaditos`.`tblOrden` (`ordCodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblOrden_has_tblDomiciliario_tblDomiciliario1`
    FOREIGN KEY (`tblDomiciliario_domDocumento`)
    REFERENCES `bocaditos`.`tblDomiciliario` (`domDocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bocaditos`.`tblrelproductomateriaprima`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bocaditos`.`tblrelproductomateriaprima` (
  `tblProducto_proId` INT NOT NULL,
  `tblMateriaPrima_matId` INT NOT NULL,
  PRIMARY KEY (`tblProducto_proId`, `tblMateriaPrima_matId`),
  INDEX `fk_tblProducto_has_tblMateriaPrima_tblMateriaPrima1_idx` (`tblMateriaPrima_matId` ASC) VISIBLE,
  INDEX `fk_tblProducto_has_tblMateriaPrima_tblProducto1_idx` (`tblProducto_proId` ASC) VISIBLE,
  CONSTRAINT `fk_tblProducto_has_tblMateriaPrima_tblProducto1`
    FOREIGN KEY (`tblProducto_proId`)
    REFERENCES `bocaditos`.`tblProducto` (`proId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblProducto_has_tblMateriaPrima_tblMateriaPrima1`
    FOREIGN KEY (`tblMateriaPrima_matId`)
    REFERENCES `bocaditos`.`tblMateriaPrima` (`matId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
