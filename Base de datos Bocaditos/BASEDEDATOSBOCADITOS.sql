-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: bocaditos_bd
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cliId` int NOT NULL AUTO_INCREMENT,
  `cliDocumento` int NOT NULL,
  `cliNombres` varchar(50) NOT NULL,
  `cliApellidos` varchar(50) NOT NULL,
  `cli_usuId_fk` int NOT NULL,
  PRIMARY KEY (`cliId`),
  KEY `usuId_fk` (`cli_usuId_fk`),
  CONSTRAINT `usuId_fk` FOREIGN KEY (`cli_usuId_fk`) REFERENCES `usuario` (`usuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domiciliario`
--

DROP TABLE IF EXISTS `domiciliario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domiciliario` (
  `domId` int NOT NULL AUTO_INCREMENT,
  `domNombres` varchar(50) NOT NULL,
  `domApellidos` varchar(50) NOT NULL,
  `dom_usuId_fk` int NOT NULL,
  PRIMARY KEY (`domId`),
  KEY `dom_usuId_fk` (`dom_usuId_fk`),
  CONSTRAINT `dom_usuId_fk` FOREIGN KEY (`dom_usuId_fk`) REFERENCES `usuario` (`usuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domiciliario`
--

LOCK TABLES `domiciliario` WRITE;
/*!40000 ALTER TABLE `domiciliario` DISABLE KEYS */;
/*!40000 ALTER TABLE `domiciliario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materiaprima`
--

DROP TABLE IF EXISTS `materiaprima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materiaprima` (
  `matId` int NOT NULL,
  `matFechaVen` date NOT NULL,
  `matFechaElab` date NOT NULL,
  `matNombre` varchar(50) NOT NULL,
  `matCantidad` int NOT NULL,
  `matEstado` varchar(45) NOT NULL,
  `mat_prvNIT_fk` int NOT NULL,
  PRIMARY KEY (`matId`),
  KEY `mat_prvNIT_fk_idx` (`mat_prvNIT_fk`),
  CONSTRAINT `mat_prvNIT_fk` FOREIGN KEY (`mat_prvNIT_fk`) REFERENCES `proveedor` (`prvNit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materiaprima`
--

LOCK TABLES `materiaprima` WRITE;
/*!40000 ALTER TABLE `materiaprima` DISABLE KEYS */;
/*!40000 ALTER TABLE `materiaprima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden`
--

DROP TABLE IF EXISTS `orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden` (
  `ordId` int NOT NULL AUTO_INCREMENT,
  `ordFechaEntrega` date NOT NULL,
  `ordFechaPedido` date NOT NULL,
  `ordEstado` varchar(45) NOT NULL,
  `ord_cliId_fk` int NOT NULL,
  PRIMARY KEY (`ordId`),
  KEY `ord_cliId_fk_idx` (`ord_cliId_fk`),
  CONSTRAINT `ord_cliId_fk` FOREIGN KEY (`ord_cliId_fk`) REFERENCES `cliente` (`cliId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden`
--

LOCK TABLES `orden` WRITE;
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `proId` int NOT NULL,
  `proFechaVen` date NOT NULL,
  `proFechaElab` date NOT NULL,
  `proNombre` varchar(50) NOT NULL,
  `proCantidad` int NOT NULL,
  `proEstado` varchar(45) NOT NULL,
  PRIMARY KEY (`proId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `prvNit` int NOT NULL,
  `prvNombre` varchar(50) NOT NULL,
  `prvDireccion` varchar(100) NOT NULL,
  `prvTelefono` bigint DEFAULT NULL,
  `prvCorreo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`prvNit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relmateriaprimaproducto`
--

DROP TABLE IF EXISTS `relmateriaprimaproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relmateriaprimaproducto` (
  `proId_fk` int NOT NULL,
  `matId_fk` int NOT NULL,
  KEY `proId_fk_idx` (`proId_fk`),
  KEY `matId_fk_idx` (`matId_fk`),
  CONSTRAINT `matId_fk` FOREIGN KEY (`matId_fk`) REFERENCES `materiaprima` (`matId`),
  CONSTRAINT `proId_fk` FOREIGN KEY (`proId_fk`) REFERENCES `producto` (`proId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relmateriaprimaproducto`
--

LOCK TABLES `relmateriaprimaproducto` WRITE;
/*!40000 ALTER TABLE `relmateriaprimaproducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `relmateriaprimaproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relordendomiciliario`
--

DROP TABLE IF EXISTS `relordendomiciliario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relordendomiciliario` (
  `orId_fk` int NOT NULL,
  `domId_fk` int NOT NULL,
  KEY `orId_fk_idx` (`orId_fk`),
  KEY `domId_fk_idx` (`domId_fk`),
  CONSTRAINT `domId_fk` FOREIGN KEY (`domId_fk`) REFERENCES `domiciliario` (`domId`),
  CONSTRAINT `orId_fk` FOREIGN KEY (`orId_fk`) REFERENCES `orden` (`ordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relordendomiciliario`
--

LOCK TABLES `relordendomiciliario` WRITE;
/*!40000 ALTER TABLE `relordendomiciliario` DISABLE KEYS */;
/*!40000 ALTER TABLE `relordendomiciliario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relordenproducto`
--

DROP TABLE IF EXISTS `relordenproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relordenproducto` (
  `ordId_fk` int NOT NULL,
  `prodId_fk` int NOT NULL,
  KEY `proId_fk_idx` (`prodId_fk`),
  KEY `ordId_fk_idx` (`ordId_fk`),
  CONSTRAINT `ordId_fk` FOREIGN KEY (`ordId_fk`) REFERENCES `orden` (`ordId`),
  CONSTRAINT `prodId_fk` FOREIGN KEY (`prodId_fk`) REFERENCES `producto` (`proId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relordenproducto`
--

LOCK TABLES `relordenproducto` WRITE;
/*!40000 ALTER TABLE `relordenproducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `relordenproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relordenrepostero`
--

DROP TABLE IF EXISTS `relordenrepostero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relordenrepostero` (
  `orddId_fk` int NOT NULL,
  `repId_fk` int NOT NULL,
  KEY `orddId_fk_idx` (`orddId_fk`),
  KEY `repId_fk_idx` (`repId_fk`),
  CONSTRAINT `orddId_fk` FOREIGN KEY (`orddId_fk`) REFERENCES `orden` (`ordId`),
  CONSTRAINT `repId_fk` FOREIGN KEY (`repId_fk`) REFERENCES `repostero` (`repId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relordenrepostero`
--

LOCK TABLES `relordenrepostero` WRITE;
/*!40000 ALTER TABLE `relordenrepostero` DISABLE KEYS */;
/*!40000 ALTER TABLE `relordenrepostero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repostero`
--

DROP TABLE IF EXISTS `repostero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repostero` (
  `repId` int NOT NULL AUTO_INCREMENT,
  `repNombres` varchar(50) NOT NULL,
  `repApellidos` varchar(50) NOT NULL,
  `rep_usuId_fk` int NOT NULL,
  PRIMARY KEY (`repId`),
  KEY `rep_usuId_fk` (`rep_usuId_fk`),
  CONSTRAINT `rep_usuId_fk` FOREIGN KEY (`rep_usuId_fk`) REFERENCES `usuario` (`usuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repostero`
--

LOCK TABLES `repostero` WRITE;
/*!40000 ALTER TABLE `repostero` DISABLE KEYS */;
/*!40000 ALTER TABLE `repostero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `rolId` int NOT NULL AUTO_INCREMENT,
  `rolDescripcion` varchar(25) NOT NULL,
  PRIMARY KEY (`rolId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador'),(2,'Cliente'),(3,'Domiciliario'),(4,'Repostero');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `usuId` int NOT NULL AUTO_INCREMENT,
  `usuCorreo` varchar(50) NOT NULL,
  `usuContraseña` varchar(16) NOT NULL,
  `usuApellido` varchar(45) NOT NULL,
  `usuNombre` varchar(45) NOT NULL,
  `usuDocumento` int NOT NULL,
  `usuTelefono` bigint NOT NULL,
  `usuDireccion` varchar(70) NOT NULL,
  `usuEstado` varchar(45) NOT NULL,
  `rolId_fk` int NOT NULL,
  PRIMARY KEY (`usuId`),
  UNIQUE KEY `usuCorreo_UNIQUE` (`usuCorreo`),
  KEY `rolId_idx` (`rolId_fk`) /*!80000 INVISIBLE */,
  CONSTRAINT `rolId_fk` FOREIGN KEY (`rolId_fk`) REFERENCES `roles` (`rolId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'ljramirez044@misena.edu.co','Leandro123','Ramirez','Leandro',1232406440,3192557948,'calle 59','Activo',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-06 18:07:03
