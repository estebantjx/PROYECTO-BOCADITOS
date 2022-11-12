-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bocaditos_bd
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bocaditos_bd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bocaditos_bd` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `bocaditos_bd` ;

-- -----------------------------------------------------
-- Table `bocaditos_bd`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bocaditos_bd`.`roles` (
  `rolId` INT NOT NULL AUTO_INCREMENT,
  `rolDescripcion` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`rolId`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bocaditos_bd`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bocaditos_bd`.`usuario` (
  `usuId` INT NOT NULL AUTO_INCREMENT,
  `usuCorreo` VARCHAR(50) NOT NULL,
  `usuContraseña` VARCHAR(16) NOT NULL,
  `usuApellido` VARCHAR(45) NOT NULL,
  `usuNombre` VARCHAR(45) NOT NULL,
  `usuDocumento` INT NOT NULL,
  `usuTelefono` BIGINT NOT NULL,
  `usuDireccion` VARCHAR(70) NOT NULL,
  `usuEstado` VARCHAR(45) NOT NULL,
  `rolId_fk` INT NOT NULL,
  PRIMARY KEY (`usuId`),
  UNIQUE INDEX `usuCorreo_UNIQUE` (`usuCorreo` ASC) VISIBLE,
  INDEX `rolId_idx` (`rolId_fk` ASC) INVISIBLE,
  CONSTRAINT `rolId_fk`
    FOREIGN KEY (`rolId_fk`)
    REFERENCES `bocaditos_bd`.`roles` (`rolId`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bocaditos_bd`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bocaditos_bd`.`cliente` (
  `cliId` INT NOT NULL AUTO_INCREMENT,
  `cliDocumento` INT NOT NULL,
  `cliNombres` VARCHAR(50) NOT NULL,
  `cliApellidos` VARCHAR(50) NOT NULL,
  `cli_usuId_fk` INT NOT NULL,
  PRIMARY KEY (`cliId`),
  INDEX `usuId_fk` (`cli_usuId_fk` ASC) VISIBLE,
  CONSTRAINT `usuId_fk`
    FOREIGN KEY (`cli_usuId_fk`)
    REFERENCES `bocaditos_bd`.`usuario` (`usuId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bocaditos_bd`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bocaditos_bd`.`proveedor` (
  `prvNit` INT NOT NULL,
  `prvNombre` VARCHAR(50) NOT NULL,
  `prvDireccion` VARCHAR(100) NOT NULL,
  `prvTelefono` BIGINT NULL DEFAULT NULL,
  `prvCorreo` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`prvNit`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bocaditos_bd`.`materiaprima`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bocaditos_bd`.`materiaprima` (
  `matId` INT NOT NULL,
  `matFechaVen` DATE NOT NULL,
  `matFechaElab` DATE NOT NULL,
  `matNombre` VARCHAR(50) NOT NULL,
  `matCantidad` INT NOT NULL,
  `matEstado` VARCHAR(45) NOT NULL,
  `mat_prvNIT_fk` INT NOT NULL,
  PRIMARY KEY (`matId`),
  INDEX `mat_prvNIT_fk_idx` (`mat_prvNIT_fk` ASC) VISIBLE,
  CONSTRAINT `mat_prvNIT_fk`
    FOREIGN KEY (`mat_prvNIT_fk`)
    REFERENCES `bocaditos_bd`.`proveedor` (`prvNit`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bocaditos_bd`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bocaditos_bd`.`producto` (
  `proId` INT NOT NULL,
  `proFechaVen` DATE NOT NULL,
  `proFechaElab` DATE NOT NULL,
  `proNombre` VARCHAR(50) NOT NULL,
  `proCantidad` INT NOT NULL,
  `proEstado` VARCHAR(45) NOT NULL,
  `proPrecio` INT NOT NULL,
  PRIMARY KEY (`proId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bocaditos_bd`.`detallesmateriaprima`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bocaditos_bd`.`detallesmateriaprima` (
  `proId_fk` INT NOT NULL,
  `matId_fk` INT NOT NULL,
  `Cantidad` INT NOT NULL,
  INDEX `proId_fk_idx` (`proId_fk` ASC) VISIBLE,
  INDEX `matId_fk_idx` (`matId_fk` ASC) VISIBLE,
  CONSTRAINT `matId_fk`
    FOREIGN KEY (`matId_fk`)
    REFERENCES `bocaditos_bd`.`materiaprima` (`matId`),
  CONSTRAINT `proId_fk`
    FOREIGN KEY (`proId_fk`)
    REFERENCES `bocaditos_bd`.`producto` (`proId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bocaditos_bd`.`domiciliario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bocaditos_bd`.`domiciliario` (
  `domId` INT NOT NULL AUTO_INCREMENT,
  `domNombres` VARCHAR(50) NOT NULL,
  `domApellidos` VARCHAR(50) NOT NULL,
  `dom_usuId_fk` INT NOT NULL,
  PRIMARY KEY (`domId`),
  INDEX `dom_usuId_fk` (`dom_usuId_fk` ASC) VISIBLE,
  CONSTRAINT `dom_usuId_fk`
    FOREIGN KEY (`dom_usuId_fk`)
    REFERENCES `bocaditos_bd`.`usuario` (`usuId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bocaditos_bd`.`orden`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bocaditos_bd`.`orden` (
  `ordId` INT NOT NULL AUTO_INCREMENT,
  `ordFechaEntrega` DATE NOT NULL,
  `ordFechaPedido` DATE NOT NULL,
  `ordEstado` VARCHAR(45) NOT NULL,
  `ord_cliId_fk` INT NOT NULL,
  `domiciliario_domId` INT NOT NULL,
  PRIMARY KEY (`ordId`),
  INDEX `ord_cliId_fk_idx` (`ord_cliId_fk` ASC) VISIBLE,
  INDEX `fk_orden_domiciliario1_idx` (`domiciliario_domId` ASC) VISIBLE,
  CONSTRAINT `ord_cliId_fk`
    FOREIGN KEY (`ord_cliId_fk`)
    REFERENCES `bocaditos_bd`.`cliente` (`cliId`),
  CONSTRAINT `fk_orden_domiciliario1`
    FOREIGN KEY (`domiciliario_domId`)
    REFERENCES `bocaditos_bd`.`domiciliario` (`domId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bocaditos_bd`.`detallesorden`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bocaditos_bd`.`detallesorden` (
  `ordId_fk` INT NOT NULL,
  `prodId_fk` INT NOT NULL,
  `Cantidad` INT NOT NULL,
  `Detalles` VARCHAR(50) NULL DEFAULT NULL,
  `Precio` INT NOT NULL,
  INDEX `proId_fk_idx` (`prodId_fk` ASC) VISIBLE,
  INDEX `ordId_fk_idx` (`ordId_fk` ASC) VISIBLE,
  CONSTRAINT `ordId_fk`
    FOREIGN KEY (`ordId_fk`)
    REFERENCES `bocaditos_bd`.`orden` (`ordId`),
  CONSTRAINT `prodId_fk`
    FOREIGN KEY (`prodId_fk`)
    REFERENCES `bocaditos_bd`.`producto` (`proId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bocaditos_bd`.`repostero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bocaditos_bd`.`repostero` (
  `repId` INT NOT NULL AUTO_INCREMENT,
  `repNombres` VARCHAR(50) NOT NULL,
  `repApellidos` VARCHAR(50) NOT NULL,
  `rep_usuId_fk` INT NOT NULL,
  PRIMARY KEY (`repId`),
  INDEX `rep_usuId_fk` (`rep_usuId_fk` ASC) VISIBLE,
  CONSTRAINT `rep_usuId_fk`
    FOREIGN KEY (`rep_usuId_fk`)
    REFERENCES `bocaditos_bd`.`usuario` (`usuId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bocaditos_bd`.`relordenrepostero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bocaditos_bd`.`relordenrepostero` (
  `orddId_fk` INT NOT NULL,
  `repId_fk` INT NOT NULL,
  INDEX `orddId_fk_idx` (`orddId_fk` ASC) VISIBLE,
  INDEX `repId_fk_idx` (`repId_fk` ASC) VISIBLE,
  CONSTRAINT `orddId_fk`
    FOREIGN KEY (`orddId_fk`)
    REFERENCES `bocaditos_bd`.`orden` (`ordId`),
  CONSTRAINT `repId_fk`
    FOREIGN KEY (`repId_fk`)
    REFERENCES `bocaditos_bd`.`repostero` (`repId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
