DROP DATABASE IF EXISTS gelatos;
CREATE DATABASE gelatos;
USE gelatos;

-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: gelatos
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `unidad_medida`
--

DROP TABLE IF EXISTS `unidad_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidad_medida` (
  `id_unidad_medida` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `estatus` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_unidad_medida`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_medida`
--

LOCK TABLES `unidad_medida` WRITE;
/*!40000 ALTER TABLE `unidad_medida` DISABLE KEYS */;
INSERT INTO `unidad_medida` VALUES (1,'Kilogramos',1,'2023-04-20 16:40:41','2023-04-20 16:40:41'),(2,'Gramos',1,'2023-04-20 16:40:41','2023-04-20 16:40:41'),(3,'Litros',1,'2023-04-20 16:40:41','2023-04-20 16:40:41'),(4,'Mililitros',1,'2023-04-20 16:40:41','2023-04-20 16:40:41'),(5,'Saco',1,'2023-04-20 16:40:41','2023-04-20 16:40:41'),(6,'Bolsa',1,'2023-04-20 16:40:41','2023-04-20 16:40:41'),(7,'Paquete',1,'2023-04-20 16:40:41','2023-04-20 16:40:41'),(8,'Cartón',1,'2023-04-20 16:40:41','2023-04-20 16:40:41'),(9,'Frasco',1,'2023-04-20 16:40:41','2023-04-20 16:40:41'),(10,'Unidad',1,'2023-04-20 16:40:41','2023-04-20 16:40:41');
/*!40000 ALTER TABLE `unidad_medida` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-23 23:34:33


-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: gelatos
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `materia_prima`
--

DROP TABLE IF EXISTS `materia_prima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia_prima` (
  `id_materia_prima` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `estatus` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fk_unidad_medida` int NOT NULL,
  PRIMARY KEY (`id_materia_prima`),
  KEY `fk_unidad_medida` (`fk_unidad_medida`),
  CONSTRAINT `materia_prima_ibfk_1` FOREIGN KEY (`fk_unidad_medida`) REFERENCES `unidad_medida` (`id_unidad_medida`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia_prima`
--

LOCK TABLES `materia_prima` WRITE;
/*!40000 ALTER TABLE `materia_prima` DISABLE KEYS */;
INSERT INTO `materia_prima` VALUES (1,'Azucar',1,'2023-04-20 16:40:41','2023-04-20 16:40:41',1),(2,'Leche',1,'2023-04-20 16:40:41','2023-04-20 16:40:41',3),(3,'Fresas',1,'2023-04-20 16:40:42','2023-04-20 16:40:42',1),(4,'Hielo',1,'2023-04-20 16:40:42','2023-04-20 16:40:42',6),(5,'Crema',1,'2023-04-20 16:40:42','2023-04-20 16:40:42',3),(6,'Vainilla',1,'2023-04-20 16:40:42','2023-04-20 16:40:42',9),(7,'Chocolate en polvo',1,'2023-04-20 16:40:42','2023-04-20 16:40:42',2),(8,'Galleta oreo',1,'2023-04-20 16:40:42','2023-04-20 16:40:42',7),(9,'Chocoalte delice',1,'2023-04-20 16:40:42','2023-04-20 16:40:42',10),(10,'Colorante amarillo',1,'2023-04-20 16:40:42','2023-04-20 16:40:42',6),(11,'Colorante rojo',1,'2023-04-20 16:40:42','2023-04-20 16:40:42',6),(12,'Colorante morado',1,'2023-04-20 16:40:42','2023-04-20 16:40:42',6),(13,'Colorante cafe',0,'2023-04-20 16:40:42','2023-04-23 22:39:44',1),(14,'Coco',0,'2023-04-20 19:16:24','2023-04-20 19:16:36',3),(15,'Hile',0,'2023-04-23 22:39:51','2023-04-23 22:39:54',2);
/*!40000 ALTER TABLE `materia_prima` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-23 23:34:35


-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: gelatos
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `almacen`
--

DROP TABLE IF EXISTS `almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `almacen` (
  `id_almacen` int NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `caducidad` datetime NOT NULL,
  `estatus` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fk_materia_prima` int NOT NULL,
  PRIMARY KEY (`id_almacen`),
  KEY `fk_materia_prima` (`fk_materia_prima`),
  CONSTRAINT `almacen_ibfk_1` FOREIGN KEY (`fk_materia_prima`) REFERENCES `materia_prima` (`id_materia_prima`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen`
--

LOCK TABLES `almacen` WRITE;
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
INSERT INTO `almacen` VALUES (1,500,'2023-04-30 00:00:00',1,'2023-04-20 16:40:42','2023-04-20 16:40:42',2),(2,500,'2024-07-30 00:00:00',1,'2023-04-20 16:40:42','2023-04-20 16:40:42',1),(3,500,'2023-08-30 00:00:00',1,'2023-04-20 16:40:42','2023-04-20 16:40:42',2),(4,500,'2024-01-30 00:00:00',1,'2023-04-20 16:40:42','2023-04-20 16:40:42',1),(5,500,'2023-04-30 00:00:00',1,'2023-04-20 16:40:43','2023-04-20 16:40:43',3),(6,500,'2024-07-30 00:00:00',1,'2023-04-20 16:40:43','2023-04-20 16:40:43',3),(7,500,'2023-08-30 00:00:00',1,'2023-04-20 16:40:43','2023-04-20 16:40:43',4),(8,500,'2024-01-30 00:00:00',1,'2023-04-20 16:40:43','2023-04-20 16:40:43',4),(9,500,'2023-04-30 00:00:00',1,'2023-04-20 16:40:43','2023-04-20 16:40:43',6),(10,500,'2024-07-30 00:00:00',1,'2023-04-20 16:40:43','2023-04-20 16:40:43',5),(11,500,'2023-08-30 00:00:00',1,'2023-04-20 16:40:43','2023-04-20 16:40:43',6),(12,500,'2024-01-30 00:00:00',1,'2023-04-20 16:40:43','2023-04-20 16:40:43',5),(13,500,'2023-04-30 00:00:00',1,'2023-04-20 16:40:43','2023-04-20 16:40:43',7),(14,500,'2024-07-30 00:00:00',1,'2023-04-20 16:40:43','2023-04-20 16:40:43',7),(15,500,'2023-08-30 00:00:00',1,'2023-04-20 16:40:44','2023-04-20 16:40:44',8),(16,500,'2024-01-30 00:00:00',1,'2023-04-20 16:40:44','2023-04-20 16:40:44',8),(17,200,'2024-01-01 00:00:00',1,'2023-04-20 16:40:44','2023-04-20 16:40:44',13),(18,200,'2024-01-01 00:00:00',1,'2023-04-20 16:40:44','2023-04-20 16:40:44',12),(19,200,'2024-01-01 00:00:00',1,'2023-04-20 16:40:44','2023-04-20 16:40:44',11),(20,200,'2024-01-01 00:00:00',1,'2023-04-20 16:40:44','2023-04-20 16:40:44',9),(21,200,'2024-01-01 00:00:00',1,'2023-04-20 16:40:44','2023-04-20 16:40:44',10),(22,360,'2023-04-30 00:00:00',1,'2023-04-23 22:03:21','2023-04-23 22:03:21',8);
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-23 23:34:33

-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: gelatos
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `estatus` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador',1,'2023-04-20 16:40:41','2023-04-20 16:40:41'),(2,'Cliente',1,'2023-04-20 16:40:41','2023-04-20 16:40:41'),(3,'Vendedor',1,'2023-04-20 16:40:41','2023-04-20 16:40:41'),(4,'Repartidor',1,'2023-04-20 16:40:41','2023-04-20 16:40:41'),(5,'Comprador',1,'2023-04-20 16:40:41','2023-04-20 16:40:41'),(6,'Gerente',1,'2023-04-20 16:40:41','2023-04-20 16:40:41'),(7,'Productor',1,'2023-04-20 16:40:41','2023-04-20 16:40:41');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-23 23:34:35

-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: gelatos
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `correo` varchar(255) NOT NULL,
  `contrasenia` varchar(255) NOT NULL,
  `estatus` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'empleado@gmail.com','123',1,'2023-04-20 16:40:42','2023-04-20 16:40:42'),(2,'cliente@gmail.com','123',1,'2023-04-20 16:40:42','2023-04-20 16:40:42'),(3,'ian@email.com','123457',1,'2023-04-20 16:40:45','2023-04-20 16:40:45'),(4,'paco@email.com','1238',1,'2023-04-20 16:40:45','2023-04-20 16:40:45'),(5,'maria@email.com','1236',1,'2023-04-20 16:40:45','2023-04-20 16:40:45'),(6,'adrian@email.com','pbkdf2:sha256:260000$FPKCKeyNgcJj8buw$59040fb21234c0a653cd727749b5253d1c60404f9211430a774ab8192d7e533f',1,'2023-04-20 16:40:45','2023-04-20 16:40:45'),(7,'nestor@email.com','1234',1,'2023-04-20 16:40:45','2023-04-20 16:40:45'),(8,'andres@email.com','123',1,'2023-04-20 16:40:45','2023-04-20 16:40:45'),(9,'hernandez@gmail.com','1234',1,'2023-04-20 18:28:12','2023-04-20 18:28:12'),(10,'hernandez@gmail.com','1234',1,'2023-04-20 19:01:28','2023-04-20 19:01:28'),(11,'hernandez@gmail.com','1234',1,'2023-04-23 22:31:38','2023-04-23 22:31:38');
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

-- Dump completed on 2023-04-23 23:34:35

-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: gelatos
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `rol_usuario`
--

DROP TABLE IF EXISTS `rol_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol_usuario` (
  `id_rol_usuario` int NOT NULL AUTO_INCREMENT,
  `fk_usuario` int NOT NULL,
  `fk_rol` int NOT NULL,
  PRIMARY KEY (`id_rol_usuario`),
  KEY `fk_rol` (`fk_rol`),
  KEY `fk_usuario` (`fk_usuario`),
  CONSTRAINT `rol_usuario_ibfk_1` FOREIGN KEY (`fk_rol`) REFERENCES `roles` (`id_rol`),
  CONSTRAINT `rol_usuario_ibfk_2` FOREIGN KEY (`fk_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_usuario`
--

LOCK TABLES `rol_usuario` WRITE;
/*!40000 ALTER TABLE `rol_usuario` DISABLE KEYS */;
INSERT INTO `rol_usuario` VALUES (4,2,2),(5,3,2),(6,4,1),(7,5,2),(8,6,6),(9,6,1),(10,7,4),(11,7,7),(12,7,2),(13,8,3),(16,9,5),(17,9,4),(24,10,5),(25,10,4),(28,11,7),(29,11,3),(30,1,7),(31,1,4),(32,1,3);
/*!40000 ALTER TABLE `rol_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-23 23:34:35

-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: gelatos
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `id_persona` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apaterno` varchar(255) NOT NULL,
  `amaterno` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) NOT NULL,
  `codigo_postal` int NOT NULL,
  `numero_exterior` varchar(255) NOT NULL,
  `numero_interior` varchar(255) DEFAULT NULL,
  `calle` varchar(255) NOT NULL,
  `colonia` varchar(255) NOT NULL,
  `estatus` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Proveedor','Ivan','Ornelas','4771231212',37000,'111',NULL,'Calle','Colonia',1,'2023-04-20 16:40:42','2023-04-20 16:40:42'),(2,'Nestor1','Ivan','Ornelas','4771231212',37000,'111','NA','Calle','Colonia',1,'2023-04-20 16:40:42','2023-04-23 22:31:46'),(3,'Cliente','Ivan','Ornelas','4771231212',37000,'111',NULL,'Calle','Colonia',1,'2023-04-20 16:40:42','2023-04-20 16:40:42'),(4,'Ían','Gimenez','Villa','4771231212',37000,'112',NULL,'Calle','Colonia',1,'2023-04-20 16:40:45','2023-04-20 16:40:45'),(5,'Paco','Villanueva','Puerta','4771231212',37000,'113',NULL,'Calle','Colonia',1,'2023-04-20 16:40:45','2023-04-20 16:40:45'),(6,'Maria1','Villegas','Bonilla','4771231212',37000,'114','NA','Calle','Colonia',1,'2023-04-20 16:40:45','2023-04-23 22:34:47'),(7,'Luis Adrián','Hernández','Sánchez','4771231212',37000,'115',NULL,'Calle','Colonia',1,'2023-04-20 16:40:45','2023-04-20 16:40:45'),(8,'Nestor','Peña','Sánchez','4771231212',37000,'116',NULL,'Calle','Colonia',1,'2023-04-20 16:40:45','2023-04-20 16:40:45'),(9,'Andres','Bautista','Peralta','4771231212',37000,'117',NULL,'Calle','Colonia',1,'2023-04-20 16:40:45','2023-04-20 16:40:45'),(10,'Janneth','Valencia','Palomares','4771231212',37000,'120',NULL,'Calle','Colonia',1,'2023-04-20 16:40:45','2023-04-20 16:40:45'),(11,'Diana','Duran','Diaz','4771231212',37000,'121',NULL,'Calle','Colonia',1,'2023-04-20 16:40:45','2023-04-20 16:40:45'),(12,'Mariana','Molino','Parra','4771231212',37000,'122',NULL,'Calle','Colonia',0,'2023-04-20 16:40:45','2023-04-23 22:41:06'),(13,'Daniela','Torres','Gonzales','4771234567',37295,'506','Na','16 de julio','Ampliacion San Francisco',0,'2023-04-20 18:28:12','2023-04-23 22:31:01'),(14,'Luis','Hernandez','Sanchez','4775353250',37295,'506','NA','16 de julio ','Ampliacion San Francisco',0,'2023-04-20 19:01:28','2023-04-20 19:13:55'),(15,'Adrian','Hernandez','Saucedo','4775353250',37295,'506','NA','16 de julio','Ampliacion San Francisco',1,'2023-04-23 22:31:38','2023-04-23 22:31:38'),(16,'Adrian1','Hernandez','Saucedo','4775353250',37295,'506','NA','16 de julio','Ampliacion San Francisco',1,'2023-04-23 22:40:52','2023-04-23 22:42:59');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-23 23:34:33

-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: gelatos
-- ------------------------------------------------------
-- Server version	8.0.24

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
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `fk_persona` int NOT NULL,
  `fk_usuario` int NOT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `fk_persona` (`fk_persona`),
  KEY `fk_usuario` (`fk_usuario`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`fk_persona`) REFERENCES `persona` (`id_persona`),
  CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`fk_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,3,2),(2,4,3),(3,5,4),(4,6,5);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-23 23:34:33

-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: gelatos
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `fk_persona` int NOT NULL,
  `fk_usuario` int NOT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `fk_persona` (`fk_persona`),
  KEY `fk_usuario` (`fk_usuario`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`fk_persona`) REFERENCES `persona` (`id_persona`),
  CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`fk_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,2,1),(2,7,6),(3,8,7),(4,9,8),(5,13,9),(6,14,10),(7,15,11);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-23 23:34:34

-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: gelatos
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `correo` varchar(255) NOT NULL,
  `fk_persona` int NOT NULL,
  PRIMARY KEY (`id_proveedor`),
  KEY `fk_persona` (`fk_persona`),
  CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`fk_persona`) REFERENCES `persona` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'proveedor@gmail.com',1),(2,'janneth@email.com',10),(3,'diana@email.com',11),(4,'mariana@email.com',12),(5,'hernandez@gmail.com',16);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-23 23:34:34

-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: gelatos
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `total` float NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fk_proveedor` int NOT NULL,
  `fk_empleado` int NOT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `fk_proveedor` (`fk_proveedor`),
  KEY `fk_empleado` (`fk_empleado`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`fk_proveedor`) REFERENCES `proveedor` (`id_proveedor`),
  CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`fk_empleado`) REFERENCES `empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,599.98,'2023-04-20 16:40:42','2023-04-20 16:40:42',1,1),(2,599.98,'2023-04-20 16:40:42','2023-04-20 16:40:42',1,1),(3,99.98,'2023-04-20 16:40:43','2023-04-20 16:40:43',1,1),(4,99.98,'2023-04-20 16:40:43','2023-04-20 16:40:43',1,1),(5,399.98,'2023-04-20 16:40:43','2023-04-20 16:40:43',1,1),(6,399.98,'2023-04-20 16:40:43','2023-04-20 16:40:43',1,1),(7,369.98,'2023-04-20 16:40:43','2023-04-20 16:40:43',1,1),(8,369.98,'2023-04-20 16:40:44','2023-04-20 16:40:44',1,1),(9,149.95,'2023-04-20 16:40:44','2023-04-20 16:40:44',1,1),(16,2.4,'2023-04-23 22:03:21','2023-04-23 22:03:21',2,3);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-23 23:34:34

-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: gelatos
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `total` float NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fk_cliente` int NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `fk_cliente` (`fk_cliente`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`fk_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,699.97,'2023-04-20 16:40:45','2023-04-20 16:40:45',1),(2,399.99,'2023-04-20 16:40:45','2023-04-20 16:40:45',2);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-23 23:34:34

-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: gelatos
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `envio`
--

DROP TABLE IF EXISTS `envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envio` (
  `id_envio` int NOT NULL AUTO_INCREMENT,
  `entregado` tinyint(1) NOT NULL DEFAULT '0',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fk_venta` int NOT NULL,
  `fk_empleado` int DEFAULT NULL,
  PRIMARY KEY (`id_envio`),
  KEY `fk_empleado` (`fk_empleado`),
  KEY `fk_venta` (`fk_venta`),
  CONSTRAINT `envio_ibfk_1` FOREIGN KEY (`fk_empleado`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `envio_ibfk_2` FOREIGN KEY (`fk_venta`) REFERENCES `venta` (`id_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envio`
--

LOCK TABLES `envio` WRITE;
/*!40000 ALTER TABLE `envio` DISABLE KEYS */;
INSERT INTO `envio` VALUES (1,1,'2023-04-20 16:40:45','2023-04-20 16:40:45',1,1),(2,0,'2023-04-20 16:40:45','2023-04-20 16:40:45',2,NULL);
/*!40000 ALTER TABLE `envio` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-23 23:34:35

-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: gelatos
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `receta`
--

DROP TABLE IF EXISTS `receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receta` (
  `id_receta` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `cantidad` int NOT NULL,
  `precio` float NOT NULL,
  `ruta_imagen` varchar(255) NOT NULL,
  `estatus` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_receta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta`
--

LOCK TABLES `receta` WRITE;
/*!40000 ALTER TABLE `receta` DISABLE KEYS */;
INSERT INTO `receta` VALUES (1,'Helado Frambuesa',20,299.99,'/uploads/asdasd',1,'2023-04-20 16:40:42','2023-04-23 21:31:32'),(2,'Helado de ore',20,1999.99,'uploads/3',1,'2023-04-20 16:40:42','2023-04-23 21:32:24'),(3,'Helado de vainilla',20,1499.99,'uploads/3',0,'2023-04-20 16:40:42','2023-04-23 21:10:29'),(4,'Helado de Fres',500,500,'uploads/3',0,'2023-04-23 20:35:19','2023-04-23 21:01:41'),(5,'Helado de n',12,131,'uploads/1',0,'2023-04-23 21:01:35','2023-04-23 21:03:01'),(6,'Helado de Uva',89,18,'uploads/1',0,'2023-04-23 21:11:24','2023-04-23 21:11:38'),(7,'Helado de Nuez',12,14,'uploads/1',1,'2023-04-23 22:14:15','2023-04-23 22:14:15'),(8,'Helado de Uv',14,14,'uploads/3',1,'2023-04-23 22:16:53','2023-04-23 22:22:58'),(9,'Helado de Chocolate',12,12,'uploads/1',0,'2023-04-23 22:17:57','2023-04-23 22:21:52'),(10,'Helado de ore',12,12,'uploads/1',0,'2023-04-23 22:19:10','2023-04-23 22:21:19');
/*!40000 ALTER TABLE `receta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-23 23:34:33


-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: gelatos
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id_stock` int NOT NULL AUTO_INCREMENT,
  `caducidad` varchar(255) NOT NULL,
  `cantidad` int NOT NULL,
  `precio` float NOT NULL,
  `estatus` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fk_receta` int NOT NULL,
  PRIMARY KEY (`id_stock`),
  KEY `fk_receta` (`fk_receta`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`fk_receta`) REFERENCES `receta` (`id_receta`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,'2023-05-08 13:26:46',2,199.99,0,'2023-04-20 16:40:44','2023-04-20 16:40:44',1),(2,'2023-05-15 13:26:46',1,199.99,0,'2023-04-20 16:40:44','2023-04-20 16:40:44',1),(3,'2023-05-15 13:26:46',2,299.99,1,'2023-04-20 16:40:44','2023-04-20 16:40:44',1),(4,'2023-05-15 13:26:46',1,399.99,1,'2023-04-20 16:40:45','2023-04-20 16:40:45',3),(5,'2023-04-23 23:27:52',1,123,1,'2023-04-23 23:28:04','2023-04-23 23:28:04',1),(6,'2023-04-23 23:27:52',1,300,1,'2023-04-23 23:31:39','2023-04-23 23:31:39',10);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-23 23:34:34

-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: gelatos
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `detalle_almacen_stock`
--

DROP TABLE IF EXISTS `detalle_almacen_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_almacen_stock` (
  `id_detalle_almacen_stock` int NOT NULL AUTO_INCREMENT,
  `cantidad` float NOT NULL,
  `fk_almacen` int NOT NULL,
  `fk_stock` int NOT NULL,
  PRIMARY KEY (`id_detalle_almacen_stock`),
  KEY `fk_stock` (`fk_stock`),
  KEY `fk_almacen` (`fk_almacen`),
  CONSTRAINT `detalle_almacen_stock_ibfk_1` FOREIGN KEY (`fk_stock`) REFERENCES `stock` (`id_stock`),
  CONSTRAINT `detalle_almacen_stock_ibfk_2` FOREIGN KEY (`fk_almacen`) REFERENCES `almacen` (`id_almacen`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_almacen_stock`
--

LOCK TABLES `detalle_almacen_stock` WRITE;
/*!40000 ALTER TABLE `detalle_almacen_stock` DISABLE KEYS */;
INSERT INTO `detalle_almacen_stock` VALUES (1,5,4,1),(2,3,1,1),(3,2,5,1),(4,1,7,1),(5,3,12,1),(6,5,4,1),(7,3,1,1),(8,2,5,1),(9,1,7,1),(10,3,12,1),(11,5,4,2),(12,3,1,2),(13,2,5,2),(14,1,7,2),(15,3,12,2),(16,5,4,3),(17,3,1,3),(18,2,5,3),(19,1,7,3),(20,3,12,3),(21,5,4,3),(22,3,1,3),(23,2,5,3),(24,1,7,3),(25,3,12,3),(26,5,4,4),(27,6,1,4),(28,1,7,4),(29,8,9,4),(30,3,21,4),(31,3,12,4),(32,10,4,5),(33,15,1,5),(34,3,5,5),(35,5,7,5),(36,4,12,5),(37,12,22,6);
/*!40000 ALTER TABLE `detalle_almacen_stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-23 23:34:34


-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: gelatos
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_compra` (
  `id_detalle_compra` int NOT NULL AUTO_INCREMENT,
  `cantidad` float NOT NULL,
  `precio` float NOT NULL,
  `fk_almacen` int NOT NULL,
  `fk_compra` int NOT NULL,
  PRIMARY KEY (`id_detalle_compra`),
  KEY `fk_almacen` (`fk_almacen`),
  KEY `fk_compra` (`fk_compra`),
  CONSTRAINT `detalle_compra_ibfk_1` FOREIGN KEY (`fk_almacen`) REFERENCES `almacen` (`id_almacen`),
  CONSTRAINT `detalle_compra_ibfk_2` FOREIGN KEY (`fk_compra`) REFERENCES `compra` (`id_compra`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compra`
--

LOCK TABLES `detalle_compra` WRITE;
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
INSERT INTO `detalle_compra` VALUES (1,500,99.99,1,1),(2,500,499.99,2,1),(3,500,99.99,3,2),(4,500,499.99,4,2),(5,500,49.99,5,3),(6,500,49.99,6,3),(7,500,49.99,7,4),(8,500,49.99,8,4),(9,500,149.99,9,5),(10,500,249.99,10,5),(11,500,149.99,11,6),(12,500,249.99,12,6),(13,500,129.99,13,7),(14,500,239.99,14,7),(15,500,129.99,15,8),(16,500,239.99,16,8),(17,200,29.99,17,9),(18,200,29.99,18,9),(19,200,29.99,19,9),(20,200,29.99,20,9),(21,200,29.99,21,9),(22,360,2.4,22,16);
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-23 23:34:34


-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: gelatos
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `detalle_materia_prima_receta`
--

DROP TABLE IF EXISTS `detalle_materia_prima_receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_materia_prima_receta` (
  `id_detalle_materia_prima_receta` int NOT NULL AUTO_INCREMENT,
  `fk_receta` int NOT NULL,
  `cantidad` float NOT NULL,
  `fk_materia_prima` int NOT NULL,
  PRIMARY KEY (`id_detalle_materia_prima_receta`),
  KEY `fk_materia_prima` (`fk_materia_prima`),
  KEY `fk_receta` (`fk_receta`),
  CONSTRAINT `detalle_materia_prima_receta_ibfk_1` FOREIGN KEY (`fk_materia_prima`) REFERENCES `materia_prima` (`id_materia_prima`),
  CONSTRAINT `detalle_materia_prima_receta_ibfk_2` FOREIGN KEY (`fk_receta`) REFERENCES `receta` (`id_receta`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_materia_prima_receta`
--

LOCK TABLES `detalle_materia_prima_receta` WRITE;
/*!40000 ALTER TABLE `detalle_materia_prima_receta` DISABLE KEYS */;
INSERT INTO `detalle_materia_prima_receta` VALUES (11,3,3,5),(12,3,3,10),(13,3,8,6),(14,3,1,4),(15,3,6,2),(16,3,5,1),(19,4,2,2),(20,4,3,1),(21,4,1,5),(22,4,2,4),(23,4,3,3),(24,4,4,2),(25,4,5,1),(26,5,12,4),(27,6,12,4),(28,6,12,2),(29,1,4,5),(30,1,5,4),(31,1,3,3),(32,1,15,2),(33,1,10,1),(34,7,12,10),(35,7,14,9),(37,9,12,5),(38,10,12,8);
/*!40000 ALTER TABLE `detalle_materia_prima_receta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-23 23:34:34

-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: gelatos
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `id_detalle_venta` int NOT NULL AUTO_INCREMENT,
  `cantidad` float NOT NULL,
  `precio` float NOT NULL,
  `fk_stock` int NOT NULL,
  `fk_venta` int NOT NULL,
  PRIMARY KEY (`id_detalle_venta`),
  KEY `fk_stock` (`fk_stock`),
  KEY `fk_venta` (`fk_venta`),
  CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`fk_stock`) REFERENCES `stock` (`id_stock`),
  CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`fk_venta`) REFERENCES `venta` (`id_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (1,2,199.99,1,1),(2,1,199.99,2,1),(3,1,299.99,3,1),(4,1,399.99,4,2);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-23 23:34:34

-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: gelatos
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Temporary view structure for view `vista_empleado`
--

DROP TABLE IF EXISTS `vista_empleado`;
/*!50001 DROP VIEW IF EXISTS `vista_empleado`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_empleado` AS SELECT 
 1 AS `id_empleado`,
 1 AS `fk_usuario`,
 1 AS `fk_persona`,
 1 AS `correo`,
 1 AS `estatus`,
 1 AS `nombre`,
 1 AS `apaterno`,
 1 AS `amaterno`,
 1 AS `telefono`,
 1 AS `codigo_postal`,
 1 AS `numero_exterior`,
 1 AS `numero_interior`,
 1 AS `calle`,
 1 AS `colonia`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_receta`
--

DROP TABLE IF EXISTS `vista_receta`;
/*!50001 DROP VIEW IF EXISTS `vista_receta`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_receta` AS SELECT 
 1 AS `id_receta`,
 1 AS `nombre`,
 1 AS `cantidad`,
 1 AS `precio`,
 1 AS `ruta_imagen`,
 1 AS `estatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_cargada_compra`
--

DROP TABLE IF EXISTS `vista_cargada_compra`;
/*!50001 DROP VIEW IF EXISTS `vista_cargada_compra`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_cargada_compra` AS SELECT 
 1 AS `id_compra`,
 1 AS `total`,
 1 AS `id_proveedor`,
 1 AS `correo_proveedor`,
 1 AS `id_persona_proveedor`,
 1 AS `nombre_proveedor`,
 1 AS `apaterno_proveedor`,
 1 AS `amaterno_proveedor`,
 1 AS `tel_proveedor`,
 1 AS `cp_proveedor`,
 1 AS `numext_proveedor`,
 1 AS `numint_proveedor`,
 1 AS `calle_proveedor`,
 1 AS `colonia_proveedor`,
 1 AS `id_empleado`,
 1 AS `id_persona_empleado`,
 1 AS `nombre_empleado`,
 1 AS `apaterno_empleado`,
 1 AS `amaterno_empleado`,
 1 AS `tel_empleado`,
 1 AS `cp_empleado`,
 1 AS `numext_empleado`,
 1 AS `numint_empleado`,
 1 AS `calle_empleado`,
 1 AS `colonia_empleado`,
 1 AS `id_usuario`,
 1 AS `correo_empleado`,
 1 AS `cantidad`,
 1 AS `precio`,
 1 AS `caducidad`,
 1 AS `nombre`,
 1 AS `descripcion`,
 1 AS `fk_compra`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_cliente`
--

DROP TABLE IF EXISTS `vista_cliente`;
/*!50001 DROP VIEW IF EXISTS `vista_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_cliente` AS SELECT 
 1 AS `id_cliente`,
 1 AS `fk_usuario`,
 1 AS `fk_persona`,
 1 AS `correo`,
 1 AS `estatus`,
 1 AS `nombre`,
 1 AS `apaterno`,
 1 AS `amaterno`,
 1 AS `telefono`,
 1 AS `codigo_postal`,
 1 AS `numero_exterior`,
 1 AS `numero_interior`,
 1 AS `calle`,
 1 AS `colonia`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_envio_entregado`
--

DROP TABLE IF EXISTS `vista_envio_entregado`;
/*!50001 DROP VIEW IF EXISTS `vista_envio_entregado`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_envio_entregado` AS SELECT 
 1 AS `id_envio`,
 1 AS `entregado`,
 1 AS `total`,
 1 AS `nombre_cliente`,
 1 AS `apaterno_cliente`,
 1 AS `amaterno_cliente`,
 1 AS `calle`,
 1 AS `colonia`,
 1 AS `numero_exterior`,
 1 AS `IFNULL(p1.numero_interior, '')`,
 1 AS `codigo_postal`,
 1 AS `telefono`,
 1 AS `nombre_empleado`,
 1 AS `apaterno_empleado`,
 1 AS `amaterno_empleado`,
 1 AS `telefono_repartidor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `stock_en_venta`
--

DROP TABLE IF EXISTS `stock_en_venta`;
/*!50001 DROP VIEW IF EXISTS `stock_en_venta`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `stock_en_venta` AS SELECT 
 1 AS `id_receta`,
 1 AS `nombre`,
 1 AS `ruta_imagen`,
 1 AS `stock_usable`,
 1 AS `precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_envio_cargada`
--

DROP TABLE IF EXISTS `vista_envio_cargada`;
/*!50001 DROP VIEW IF EXISTS `vista_envio_cargada`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_envio_cargada` AS SELECT 
 1 AS `id_envio`,
 1 AS `entregado`,
 1 AS `id_venta`,
 1 AS `total`,
 1 AS `id_cliente`,
 1 AS `id_persona_cliente`,
 1 AS `nombre_cliente`,
 1 AS `apaterno_cliente`,
 1 AS `amaterno_cliente`,
 1 AS `telefono_cliente`,
 1 AS `codigo_postal_cliente`,
 1 AS `numero_exterior_cliente`,
 1 AS `numero_interior_cliente`,
 1 AS `calle_cliente`,
 1 AS `colonia_cliente`,
 1 AS `id_empleado`,
 1 AS `id_persona_empleado`,
 1 AS `id_nombre_empleado`,
 1 AS `apaterno_empleado`,
 1 AS `amaterno_empleado`,
 1 AS `telefono_empleado`,
 1 AS `codigo_postal_empleado`,
 1 AS `numero_exterior_empleado`,
 1 AS `numero_interior_empleado`,
 1 AS `calle_empleado`,
 1 AS `colonia_empleado`,
 1 AS `DATE(en.fecha_actualizacion)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_materia_prima`
--

DROP TABLE IF EXISTS `vista_materia_prima`;
/*!50001 DROP VIEW IF EXISTS `vista_materia_prima`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_materia_prima` AS SELECT 
 1 AS `id_materia_prima`,
 1 AS `nombre`,
 1 AS `estatus`,
 1 AS `unidad_medida`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_almacen`
--

DROP TABLE IF EXISTS `vista_almacen`;
/*!50001 DROP VIEW IF EXISTS `vista_almacen`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_almacen` AS SELECT 
 1 AS `id_materia_prima`,
 1 AS `nombre`,
 1 AS `cantidad_usable`,
 1 AS `unidad_medida`,
 1 AS `caducidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_envio`
--

DROP TABLE IF EXISTS `vista_envio`;
/*!50001 DROP VIEW IF EXISTS `vista_envio`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_envio` AS SELECT 
 1 AS `id_envio`,
 1 AS `entregado`,
 1 AS `total`,
 1 AS `nombre_cliente`,
 1 AS `apaterno_cliente`,
 1 AS `amaterno_cliente`,
 1 AS `calle`,
 1 AS `colonia`,
 1 AS `numero_exterior`,
 1 AS `IFNULL(p1.numero_interior, '')`,
 1 AS `codigo_postal`,
 1 AS `telefono`,
 1 AS `nombre_empleado`,
 1 AS `apaterno_empleado`,
 1 AS `amaterno_empleado`,
 1 AS `telefono_repartidor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_proveedor`
--

DROP TABLE IF EXISTS `vista_proveedor`;
/*!50001 DROP VIEW IF EXISTS `vista_proveedor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_proveedor` AS SELECT 
 1 AS `id_proveedor`,
 1 AS `fk_persona`,
 1 AS `correo`,
 1 AS `nombre`,
 1 AS `apaterno`,
 1 AS `amaterno`,
 1 AS `telefono`,
 1 AS `codigo_postal`,
 1 AS `numero_exterior`,
 1 AS `numero_interior`,
 1 AS `calle`,
 1 AS `colonia`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_empleado`
--

/*!50001 DROP VIEW IF EXISTS `vista_empleado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_empleado` AS select `e`.`id_empleado` AS `id_empleado`,`e`.`fk_usuario` AS `fk_usuario`,`e`.`fk_persona` AS `fk_persona`,`u`.`correo` AS `correo`,`p`.`estatus` AS `estatus`,`p`.`nombre` AS `nombre`,`p`.`apaterno` AS `apaterno`,`p`.`amaterno` AS `amaterno`,`p`.`telefono` AS `telefono`,`p`.`codigo_postal` AS `codigo_postal`,`p`.`numero_exterior` AS `numero_exterior`,`p`.`numero_interior` AS `numero_interior`,`p`.`calle` AS `calle`,`p`.`colonia` AS `colonia` from ((`empleado` `e` join `usuario` `u` on((`e`.`fk_usuario` = `u`.`id_usuario`))) join `persona` `p` on((`e`.`fk_persona` = `p`.`id_persona`))) where (`p`.`estatus` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_receta`
--

/*!50001 DROP VIEW IF EXISTS `vista_receta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_receta` AS select `receta`.`id_receta` AS `id_receta`,`receta`.`nombre` AS `nombre`,`receta`.`cantidad` AS `cantidad`,`receta`.`precio` AS `precio`,`receta`.`ruta_imagen` AS `ruta_imagen`,`receta`.`estatus` AS `estatus` from `receta` where (`receta`.`estatus` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_cargada_compra`
--

/*!50001 DROP VIEW IF EXISTS `vista_cargada_compra`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_cargada_compra` AS select `c`.`id_compra` AS `id_compra`,`c`.`total` AS `total`,`t1`.`id_proveedor` AS `id_proveedor`,`t1`.`correo_proveedor` AS `correo_proveedor`,`t1`.`id_persona_proveedor` AS `id_persona_proveedor`,`t1`.`nombre_proveedor` AS `nombre_proveedor`,`t1`.`apaterno_proveedor` AS `apaterno_proveedor`,`t1`.`amaterno_proveedor` AS `amaterno_proveedor`,`t1`.`tel_proveedor` AS `tel_proveedor`,`t1`.`cp_proveedor` AS `cp_proveedor`,`t1`.`numext_proveedor` AS `numext_proveedor`,`t1`.`numint_proveedor` AS `numint_proveedor`,`t1`.`calle_proveedor` AS `calle_proveedor`,`t1`.`colonia_proveedor` AS `colonia_proveedor`,`t2`.`id_empleado` AS `id_empleado`,`t2`.`id_persona_empleado` AS `id_persona_empleado`,`t2`.`nombre_empleado` AS `nombre_empleado`,`t2`.`apaterno_empleado` AS `apaterno_empleado`,`t2`.`amaterno_empleado` AS `amaterno_empleado`,`t2`.`tel_empleado` AS `tel_empleado`,`t2`.`cp_empleado` AS `cp_empleado`,`t2`.`numext_empleado` AS `numext_empleado`,`t2`.`numint_empleado` AS `numint_empleado`,`t2`.`calle_empleado` AS `calle_empleado`,`t2`.`colonia_empleado` AS `colonia_empleado`,`t2`.`id_usuario` AS `id_usuario`,`t2`.`correo_empleado` AS `correo_empleado`,`t3`.`cantidad` AS `cantidad`,`t3`.`precio` AS `precio`,`t3`.`caducidad` AS `caducidad`,`t3`.`nombre` AS `nombre`,`t3`.`descripcion` AS `descripcion`,`t3`.`fk_compra` AS `fk_compra` from (((`compra` `c` join (select `pro`.`id_proveedor` AS `id_proveedor`,`pro`.`correo` AS `correo_proveedor`,`per`.`id_persona` AS `id_persona_proveedor`,`per`.`nombre` AS `nombre_proveedor`,`per`.`apaterno` AS `apaterno_proveedor`,`per`.`amaterno` AS `amaterno_proveedor`,`per`.`telefono` AS `tel_proveedor`,`per`.`codigo_postal` AS `cp_proveedor`,`per`.`numero_exterior` AS `numext_proveedor`,`per`.`numero_interior` AS `numint_proveedor`,`per`.`calle` AS `calle_proveedor`,`per`.`colonia` AS `colonia_proveedor` from (`proveedor` `pro` join `persona` `per` on((`per`.`id_persona` = `pro`.`fk_persona`)))) `t1` on((`c`.`fk_proveedor` = `t1`.`id_proveedor`))) join (select `em`.`id_empleado` AS `id_empleado`,`per`.`id_persona` AS `id_persona_empleado`,`per`.`nombre` AS `nombre_empleado`,`per`.`apaterno` AS `apaterno_empleado`,`per`.`amaterno` AS `amaterno_empleado`,`per`.`telefono` AS `tel_empleado`,`per`.`codigo_postal` AS `cp_empleado`,`per`.`numero_exterior` AS `numext_empleado`,`per`.`numero_interior` AS `numint_empleado`,`per`.`calle` AS `calle_empleado`,`per`.`colonia` AS `colonia_empleado`,`u`.`id_usuario` AS `id_usuario`,`u`.`correo` AS `correo_empleado` from ((`empleado` `em` join `persona` `per` on((`per`.`id_persona` = `em`.`fk_persona`))) join `usuario` `u` on((`u`.`id_usuario` = `em`.`fk_usuario`)))) `t2` on((`c`.`fk_empleado` = `t2`.`id_empleado`))) join (select `dc`.`cantidad` AS `cantidad`,`dc`.`precio` AS `precio`,`a`.`caducidad` AS `caducidad`,`mp`.`nombre` AS `nombre`,`um`.`descripcion` AS `descripcion`,`dc`.`fk_compra` AS `fk_compra` from (((`detalle_compra` `dc` join `almacen` `a` on((`dc`.`fk_almacen` = `a`.`id_almacen`))) join `materia_prima` `mp` on((`mp`.`id_materia_prima` = `a`.`fk_materia_prima`))) join `unidad_medida` `um` on((`um`.`id_unidad_medida` = `mp`.`fk_unidad_medida`)))) `t3` on((`c`.`id_compra` = `t3`.`fk_compra`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_cliente`
--

/*!50001 DROP VIEW IF EXISTS `vista_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_cliente` AS select `c`.`id_cliente` AS `id_cliente`,`c`.`fk_usuario` AS `fk_usuario`,`c`.`fk_persona` AS `fk_persona`,`u`.`correo` AS `correo`,`p`.`estatus` AS `estatus`,`p`.`nombre` AS `nombre`,`p`.`apaterno` AS `apaterno`,`p`.`amaterno` AS `amaterno`,`p`.`telefono` AS `telefono`,`p`.`codigo_postal` AS `codigo_postal`,`p`.`numero_exterior` AS `numero_exterior`,`p`.`numero_interior` AS `numero_interior`,`p`.`calle` AS `calle`,`p`.`colonia` AS `colonia` from ((`cliente` `c` join `usuario` `u` on((`c`.`fk_usuario` = `u`.`id_usuario`))) join `persona` `p` on((`c`.`fk_persona` = `p`.`id_persona`))) where (`p`.`estatus` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_envio_entregado`
--

/*!50001 DROP VIEW IF EXISTS `vista_envio_entregado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_envio_entregado` AS select `en`.`id_envio` AS `id_envio`,`en`.`entregado` AS `entregado`,`v`.`total` AS `total`,`p1`.`nombre` AS `nombre_cliente`,`p1`.`apaterno` AS `apaterno_cliente`,`p1`.`amaterno` AS `amaterno_cliente`,`p1`.`calle` AS `calle`,`p1`.`colonia` AS `colonia`,`p1`.`numero_exterior` AS `numero_exterior`,ifnull(`p1`.`numero_interior`,'') AS `IFNULL(p1.numero_interior, '')`,`p1`.`codigo_postal` AS `codigo_postal`,`p1`.`telefono` AS `telefono`,`p2`.`nombre` AS `nombre_empleado`,`p2`.`apaterno` AS `apaterno_empleado`,`p2`.`amaterno` AS `amaterno_empleado`,`p2`.`telefono` AS `telefono_repartidor` from (((((`envio` `en` join `venta` `v` on((`en`.`fk_venta` = `v`.`id_venta`))) join `cliente` `c` on((`v`.`fk_cliente` = `c`.`id_cliente`))) join `persona` `p1` on((`c`.`fk_persona` = `p1`.`id_persona`))) join `empleado` `e` on((`en`.`fk_empleado` = `e`.`id_empleado`))) join `persona` `p2` on((`e`.`fk_persona` = `p2`.`id_persona`))) where (`en`.`entregado` = true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stock_en_venta`
--

/*!50001 DROP VIEW IF EXISTS `stock_en_venta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stock_en_venta` AS select `r`.`id_receta` AS `id_receta`,`r`.`nombre` AS `nombre`,`r`.`ruta_imagen` AS `ruta_imagen`,`t1`.`stock_usable` AS `stock_usable`,`t1`.`precio` AS `precio` from (`receta` `r` join (select sum((`s`.`cantidad` - ifnull(`dv`.`stock_usado`,0))) AS `stock_usable`,`s`.`precio` AS `precio`,`s`.`fk_receta` AS `fk_receta` from ((select `stock`.`id_stock` AS `id_stock`,`stock`.`caducidad` AS `caducidad`,`stock`.`cantidad` AS `cantidad`,`stock`.`precio` AS `precio`,`stock`.`estatus` AS `estatus`,`stock`.`fk_receta` AS `fk_receta` from `stock`) `s` left join (select sum(`detalle_venta`.`cantidad`) AS `stock_usado`,`detalle_venta`.`fk_stock` AS `fk_stock` from `detalle_venta` group by `detalle_venta`.`fk_stock`) `dv` on((`dv`.`fk_stock` = `s`.`id_stock`))) where ((`s`.`estatus` = true) and (cast(`s`.`caducidad` as date) > cast(now() as date)) and ((`s`.`cantidad` - ifnull(`dv`.`stock_usado`,0)) > 0)) group by `s`.`precio`,`s`.`fk_receta`) `t1` on((`r`.`id_receta` = `t1`.`fk_receta`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_envio_cargada`
--

/*!50001 DROP VIEW IF EXISTS `vista_envio_cargada`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_envio_cargada` AS select `en`.`id_envio` AS `id_envio`,`en`.`entregado` AS `entregado`,`t1`.`id_venta` AS `id_venta`,`t1`.`total` AS `total`,`t1`.`id_cliente` AS `id_cliente`,`t1`.`id_persona_cliente` AS `id_persona_cliente`,`t1`.`nombre_cliente` AS `nombre_cliente`,`t1`.`apaterno_cliente` AS `apaterno_cliente`,`t1`.`amaterno_cliente` AS `amaterno_cliente`,`t1`.`telefono_cliente` AS `telefono_cliente`,`t1`.`codigo_postal_cliente` AS `codigo_postal_cliente`,`t1`.`numero_exterior_cliente` AS `numero_exterior_cliente`,`t1`.`numero_interior_cliente` AS `numero_interior_cliente`,`t1`.`calle_cliente` AS `calle_cliente`,`t1`.`colonia_cliente` AS `colonia_cliente`,`t2`.`id_empleado` AS `id_empleado`,`t2`.`id_persona_empleado` AS `id_persona_empleado`,`t2`.`id_nombre_empleado` AS `id_nombre_empleado`,`t2`.`apaterno_empleado` AS `apaterno_empleado`,`t2`.`amaterno_empleado` AS `amaterno_empleado`,`t2`.`telefono_empleado` AS `telefono_empleado`,`t2`.`codigo_postal_empleado` AS `codigo_postal_empleado`,`t2`.`numero_exterior_empleado` AS `numero_exterior_empleado`,`t2`.`numero_interior_empleado` AS `numero_interior_empleado`,`t2`.`calle_empleado` AS `calle_empleado`,`t2`.`colonia_empleado` AS `colonia_empleado`,cast(`en`.`fecha_actualizacion` as date) AS `DATE(en.fecha_actualizacion)` from ((`envio` `en` join (select `v`.`id_venta` AS `id_venta`,`v`.`total` AS `total`,`c`.`id_cliente` AS `id_cliente`,`p`.`id_persona` AS `id_persona_cliente`,`p`.`nombre` AS `nombre_cliente`,`p`.`apaterno` AS `apaterno_cliente`,`p`.`amaterno` AS `amaterno_cliente`,`p`.`telefono` AS `telefono_cliente`,`p`.`codigo_postal` AS `codigo_postal_cliente`,`p`.`numero_exterior` AS `numero_exterior_cliente`,`p`.`numero_interior` AS `numero_interior_cliente`,`p`.`calle` AS `calle_cliente`,`p`.`colonia` AS `colonia_cliente` from ((`venta` `v` join `cliente` `c` on((`v`.`fk_cliente` = `c`.`id_cliente`))) join `persona` `p` on((`c`.`fk_persona` = `p`.`id_persona`)))) `t1` on((`t1`.`id_venta` = `en`.`fk_venta`))) left join (select `em`.`id_empleado` AS `id_empleado`,`p`.`id_persona` AS `id_persona_empleado`,`p`.`nombre` AS `id_nombre_empleado`,`p`.`apaterno` AS `apaterno_empleado`,`p`.`amaterno` AS `amaterno_empleado`,`p`.`telefono` AS `telefono_empleado`,`p`.`codigo_postal` AS `codigo_postal_empleado`,`p`.`numero_exterior` AS `numero_exterior_empleado`,`p`.`numero_interior` AS `numero_interior_empleado`,`p`.`calle` AS `calle_empleado`,`p`.`colonia` AS `colonia_empleado` from (`empleado` `em` join `persona` `p` on((`em`.`fk_persona` = `p`.`id_persona`)))) `t2` on((`en`.`fk_empleado` = `t2`.`id_empleado`))) order by `en`.`entregado`,`en`.`id_envio` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_materia_prima`
--

/*!50001 DROP VIEW IF EXISTS `vista_materia_prima`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_materia_prima` AS select `mp`.`id_materia_prima` AS `id_materia_prima`,`mp`.`nombre` AS `nombre`,`mp`.`estatus` AS `estatus`,`um`.`descripcion` AS `unidad_medida` from (`materia_prima` `mp` join `unidad_medida` `um` on((`mp`.`fk_unidad_medida` = `um`.`id_unidad_medida`))) where (`mp`.`estatus` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_almacen`
--

/*!50001 DROP VIEW IF EXISTS `vista_almacen`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_almacen` AS select `materia_prima`.`id_materia_prima` AS `id_materia_prima`,`materia_prima`.`nombre` AS `nombre`,`t2`.`cantidad_usable` AS `cantidad_usable`,`unidad_medida`.`descripcion` AS `unidad_medida`,`t2`.`caducidad` AS `caducidad` from ((`materia_prima` join (select `t`.`fk_materia_prima` AS `fk_materia_prima`,(case when (`t`.`cantidad_total` is null) then `t`.`cantidad` else `t`.`cantidad_total` end) AS `cantidad_usable`,`t`.`caducidad` AS `caducidad` from (select `a`.`id_almacen` AS `id_almacen`,`a`.`fk_materia_prima` AS `fk_materia_prima`,`a`.`cantidad` AS `cantidad`,(`a`.`cantidad` - sum(`das`.`cantidad`)) AS `cantidad_total`,`a`.`caducidad` AS `caducidad` from (`almacen` `a` left join `detalle_almacen_stock` `das` on((`a`.`id_almacen` = `das`.`fk_almacen`))) where ((`a`.`estatus` = true) and (cast(`a`.`caducidad` as date) > cast(now() as date))) group by `a`.`id_almacen`,`a`.`caducidad`,`a`.`estatus`,`a`.`fk_materia_prima` having ((`cantidad_total` is null) or (`cantidad_total` > 0)) order by `a`.`caducidad`) `t`) `t2` on((`t2`.`fk_materia_prima` = `materia_prima`.`id_materia_prima`))) join `unidad_medida` on((`materia_prima`.`fk_unidad_medida` = `unidad_medida`.`id_unidad_medida`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_envio`
--

/*!50001 DROP VIEW IF EXISTS `vista_envio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_envio` AS select `en`.`id_envio` AS `id_envio`,`en`.`entregado` AS `entregado`,`v`.`total` AS `total`,`p1`.`nombre` AS `nombre_cliente`,`p1`.`apaterno` AS `apaterno_cliente`,`p1`.`amaterno` AS `amaterno_cliente`,`p1`.`calle` AS `calle`,`p1`.`colonia` AS `colonia`,`p1`.`numero_exterior` AS `numero_exterior`,ifnull(`p1`.`numero_interior`,'') AS `IFNULL(p1.numero_interior, '')`,`p1`.`codigo_postal` AS `codigo_postal`,`p1`.`telefono` AS `telefono`,`p2`.`nombre` AS `nombre_empleado`,`p2`.`apaterno` AS `apaterno_empleado`,`p2`.`amaterno` AS `amaterno_empleado`,`p2`.`telefono` AS `telefono_repartidor` from (((((`envio` `en` join `venta` `v` on((`en`.`fk_venta` = `v`.`id_venta`))) join `cliente` `c` on((`v`.`fk_cliente` = `c`.`id_cliente`))) join `persona` `p1` on((`c`.`fk_persona` = `p1`.`id_persona`))) join `empleado` `e` on((`en`.`fk_empleado` = `e`.`id_empleado`))) join `persona` `p2` on((`e`.`fk_persona` = `p2`.`id_persona`))) where (`en`.`entregado` = false) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_proveedor`
--

/*!50001 DROP VIEW IF EXISTS `vista_proveedor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_proveedor` AS select `pr`.`id_proveedor` AS `id_proveedor`,`pr`.`fk_persona` AS `fk_persona`,`pr`.`correo` AS `correo`,`p`.`nombre` AS `nombre`,`p`.`apaterno` AS `apaterno`,`p`.`amaterno` AS `amaterno`,`p`.`telefono` AS `telefono`,`p`.`codigo_postal` AS `codigo_postal`,`p`.`numero_exterior` AS `numero_exterior`,`p`.`numero_interior` AS `numero_interior`,`p`.`calle` AS `calle`,`p`.`colonia` AS `colonia` from (`proveedor` `pr` join `persona` `p` on((`pr`.`fk_persona` = `p`.`id_persona`))) where (`p`.`estatus` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-23 23:34:36



DELIMITER //
CREATE PROCEDURE insertar_venta(
	IN iarr_recetas TEXT,
    IN ifk_cliente INT
)
BEGIN
    DECLARE did_venta INT;
    DECLARE dobjeto_receta JSON;
	DECLARE did_receta INT;
	DECLARE dcantidad_receta INT;
	DECLARE dprecio_receta FLOAT;
	DECLARE dposicion_recetas INT;
    DECLARE dtotal FLOAT;

	DECLARE dlistado_existencias JSON;
	DECLARE did_stock INT;
	DECLARE dprecio_existencia FLOAT;
	DECLARE dstock_existencia INT;
    DECLARE dposicion_existencias INT;
    DECLARE dcomprobacion_existencia INT;
    
    DECLARE realizar_commit BOOLEAN;
    START TRANSACTION;
	
    SET realizar_commit = TRUE;
    SET dtotal = 0;
	INSERT INTO venta (total, fk_cliente) VALUES (dtotal, ifk_cliente);
	SET did_venta = LAST_INSERT_ID();
	SET dposicion_recetas = JSON_LENGTH(iarr_recetas);
	ciclo_for: LOOP
	    IF dposicion_recetas = 0 THEN
	        LEAVE ciclo_for;
	    END IF;
	    SET dobjeto_receta = JSON_EXTRACT(iarr_recetas, CONCAT('$[',dposicion_recetas - 1,']'));
	    SET did_receta = JSON_EXTRACT(dobjeto_receta, CONCAT('$[0]'));
	    SET dcantidad_receta = JSON_EXTRACT(dobjeto_receta, CONCAT('$[1]'));
	    SET dprecio_receta = JSON_EXTRACT(dobjeto_receta, CONCAT('$[2]'));

        SET dcomprobacion_existencia = (SELECT COUNT(*) FROM (SELECT SUM((cantidad - IFNULL(stock_usado, 0))) AS stock_usable, precio, fk_receta
            FROM (SELECT id_stock, caducidad, cantidad, precio, estatus, fk_receta FROM stock) AS s
            LEFT JOIN (SELECT SUM(cantidad) AS stock_usado, fk_stock FROM detalle_venta GROUP BY fk_stock) AS dv
                ON fk_stock = id_stock
            WHERE s.estatus = TRUE
            AND DATE(s.caducidad) > DATE(NOW())
            AND (cantidad - IFNULL(stock_usado, 0)) > 0
            GROUP BY precio, fk_receta) AS t1
            WHERE stock_usable >= dcantidad_receta
            AND ROUND(precio,2) = ROUND(dprecio_receta,2)
            AND fk_receta = did_receta);
        IF  dcomprobacion_existencia = 0 THEN
			SET realizar_commit = FALSE;
			LEAVE ciclo_for;
		END IF;
	    SELECT JSON_ARRAYAGG(JSON_OBJECT(
	            'id_stock', id_stock,
	            'precio', ROUND(precio,2),
	            'stock_usable', stock_usable
	        ))
	        INTO dlistado_existencias
	    FROM (
	        SELECT id_stock, precio, (cantidad - IFNULL(stock_usado, 0)) AS stock_usable
	            FROM (SELECT id_stock, caducidad, cantidad, precio, estatus, fk_receta FROM stock) AS s
	            LEFT JOIN (SELECT SUM(cantidad) AS stock_usado, fk_stock FROM detalle_venta GROUP BY fk_stock) AS dv
	                ON fk_stock = id_stock
	            WHERE s.estatus = TRUE
	            AND DATE(s.caducidad) > DATE(NOW())
	            AND (cantidad - IFNULL(stock_usado, 0)) > 0
	            AND fk_receta = did_receta
				AND ROUND(precio,2) = ROUND(dprecio_receta,2)
	        ) AS t;
	    SET dposicion_existencias = 0;
	    SET did_stock = JSON_EXTRACT(dlistado_existencias, CONCAT('$[',dposicion_existencias,'].id_stock'));
	    SET dprecio_existencia = JSON_EXTRACT(dlistado_existencias, CONCAT('$[',dposicion_existencias,'].precio'));
	    SET dstock_existencia = JSON_EXTRACT(dlistado_existencias, CONCAT('$[',dposicion_existencias,'].stock_usable'));
        IF ISNULL(dstock_existencia) THEN
        	SET realizar_commit = FALSE;
			LEAVE ciclo_for;
        END IF;
        IF (dstock_existencia <= dcantidad_receta) THEN
			INSERT INTO detalle_venta(cantidad, precio, fk_stock, fk_venta)
				VALUES (dstock_existencia, dprecio_existencia, did_stock, did_venta);
			UPDATE stock SET estatus = FALSE WHERE id_stock = dstock_existencia;
			IF NOT(dstock_existencia = dcantidad_receta) THEN
				subciclo_tabla_intermedia: LOOP
					SET dcantidad_receta = dcantidad_receta - dstock_existencia;
					SET dposicion_existencias = dposicion_existencias + 1;
					SET did_stock = JSON_EXTRACT(dlistado_existencias, CONCAT('$[', dposicion_existencias,'].id_stock'));
					SET dstock_existencia = JSON_EXTRACT(dlistado_existencias, CONCAT('$[', dposicion_existencias,'].stock_usable'));
					IF ISNULL(dstock_existencia) THEN
						SET realizar_commit = FALSE;
						LEAVE ciclo_for;
					END IF;
					IF (dstock_existencia <= dcantidad_receta) THEN
						INSERT INTO detalle_venta(cantidad, precio, fk_stock, fk_venta)
							VALUES (dstock_existencia, dprecio_existencia, did_stock, did_venta);
						UPDATE stock SET estatus = FALSE WHERE id_stock = did_stock;
						IF NOT(dstock_existencia = dcantidad_receta) THEN
							ITERATE subciclo_tabla_intermedia;
						ELSE
							LEAVE subciclo_tabla_intermedia;
                        END IF;
					ELSE 
						INSERT INTO detalle_venta(cantidad, precio, fk_stock, fk_venta)
							VALUES (dcantidad_receta, dprecio_existencia, dstock_existencia, did_venta);
						LEAVE subciclo_tabla_intermedia;
					END IF;
				END LOOP;
			END IF;
		ELSE 
			INSERT INTO detalle_venta(cantidad, precio, fk_stock, fk_venta)
				VALUES (dcantidad_receta, dprecio_existencia, did_stock, did_venta);
		END IF;
	    SET dposicion_recetas = dposicion_recetas - 1;
	    ITERATE ciclo_for;
	END LOOP;
	SET dtotal = (SELECT SUM(precio) FROM detalle_venta WHERE fk_venta = did_venta);
	IF ISNULL(dtotal) THEN
		SET realizar_commit = FALSE;
	ELSE 
		UPDATE venta SET
			total = dtotal
		WHERE id_venta = did_venta;
	END IF;

	INSERT INTO envio ( fk_venta ) 
		VALUES ( did_venta );

	IF realizar_commit = TRUE THEN
        COMMIT;
    ELSE
        ROLLBACK;
    END IF;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE consultar_unidad_medida()
BEGIN
	SELECT id_unidad_medida, descripcion, estatus
	FROM unidad_medida;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE consultar_unidad_medida_por_id( IN iid_unidad_medida INT )
BEGIN
	SELECT id_unidad_medida, descripcion, estatus
	FROM unidad_medida
    WHERE id_unidad_medida = iid_unidad_medida;
END //
DELIMITER ;



DELIMITER //
CREATE PROCEDURE insertar_unidad_medida(
    IN idescripcion VARCHAR(255)
)
BEGIN
	INSERT INTO unidad_medida ( descripcion )
		VALUES (idescripcion);
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE actualizar_unidad_medida(
    IN iid_unidad_medida INT,
    IN idescripcion VARCHAR(255),
    IN iestatus BOOLEAN
)
BEGIN
	IF iestatus = NULL THEN
		SET iestatus = FALSE;
	END IF;
	UPDATE unidad_medida SET
		descripcion = idescripcion,
		estatus = iestatus,
        fecha_actualizacion = NOW()
	WHERE id_unidad_medida = iid_unidad_medida;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE eliminar_unidad_medida(
    IN iid_unidad_medida INT
)
BEGIN
	UPDATE unidad_medida SET
		estatus = FALSE,
        fecha_actualizacion = NOW()
	WHERE id_unidad_medida = iid_unidad_medida;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE obtener_info_usuario( IN iid_usuario INT )
BEGIN
	SELECT id_usuario,
		correo,
		contrasenia,
		estatus,
		(SELECT JSON_ARRAYAGG(fk_rol)
			FROM rol_usuario
			WHERE fk_usuario = iid_usuario)
		AS roles
	FROM usuario
	WHERE id_usuario = iid_usuario
    AND estatus = TRUE;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE consultar_stock()
BEGIN
	SELECT id_stock, caducidad, receta.cantidad AS cantidad_receta, stock.precio AS stock_precio, stock.estatus AS stock_estatus, nombre, cantidad, receta.precio AS receta_precio, ruta_imagen, receta.estatus AS receta_estatus
	FROM stock
	INNER JOIN
	receta ON id_receta = fk_receta;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE consultar_stock_por_id( IN iid_stock INT )
BEGIN
	SELECT id_stock, caducidad, receta.cantidad AS cantidad_receta, stock.precio AS stock_precio, stock.estatus AS stock_estatus, nombre, cantidad, receta.precio AS receta_precio, ruta_imagen, receta.estatus AS receta_estatus
	FROM stock
	INNER JOIN
	receta ON id_receta = fk_receta
    WHERE id_stock = iid_stock;
END //
DELIMITER ;

USE gelatos;


DELIMITER //
CREATE PROCEDURE insertar_stock(
	IN icaducidad DATETIME,
    IN iprecio FLOAT,
    IN ifk_receta INT
)
BEGIN
	DECLARE did_almacen INT;
    DECLARE dcantidad_usable FLOAT;
    DECLARE dlistado_existencias JSON;
    DECLARE dposicion_existencias INT;
	DECLARE dcantidad FLOAT;
    DECLARE dfk_materia_prima INT;
    DECLARE dposicion_receta INT;
    DECLARE dreceta JSON;
	DECLARE dids_validos JSON;
    DECLARE did_stock INT;
    DECLARE dcanitdad_en_stock INT;
    DECLARE realizar_commit BOOLEAN;

	SET dlistado_existencias = JSON_ARRAY();
	SET dreceta = JSON_ARRAY();

    START TRANSACTION;
    SET realizar_commit = TRUE;
    CALL consultar_recetas_posibles(dids_validos);
    IF JSON_CONTAINS(dids_validos, CAST(ifk_receta AS JSON)) THEN
    
		SET did_stock = (
		SELECT id_stock FROM stock
		WHERE DATE(caducidad) = DATE(icaducidad)
		AND fk_receta = ifk_receta
		AND precio BETWEEN iprecio - 0.01 AND iprecio + 0.01
		);
		IF did_stock > 0 THEN 
		SET dcanitdad_en_stock = (
				SELECT cantidad FROM stock
				WHERE id_stock = did_stock
			);
		UPDATE stock SET
			estatus = TRUE,
			cantidad = 1 + dcanitdad_en_stock
		WHERE id_stock = did_stock;
		ELSE 
		INSERT INTO stock (caducidad, precio, cantidad, fk_receta)
			VALUES (icaducidad, iprecio, 1, ifk_receta);
		SET did_stock = LAST_INSERT_ID();
		END IF;
		SELECT JSON_ARRAYAGG(JSON_OBJECT(
			   'fk_materia_prima', fk_materia_prima,
			   'cantidad', cantidad
			))
			INTO dreceta
		FROM detalle_materia_prima_receta
		WHERE fk_receta = ifk_receta;
        SET dposicion_receta = JSON_LENGTH(dreceta);
        ciclo_for: LOOP
			IF dposicion_receta = 0 THEN
				LEAVE ciclo_for;
			END IF;
            SET dfk_materia_prima = JSON_EXTRACT(dreceta, CONCAT('$[', dposicion_receta - 1,'].fk_materia_prima'));
			SELECT JSON_ARRAYAGG(JSON_OBJECT(
				   'id_almacen', id_almacen,
				   'fk_materia_prima', fk_materia_prima,
				   'cantidad_usable', cantidad_usable
				))
                INTO dlistado_existencias
			FROM (
				SELECT id_almacen, fk_materia_prima,
					   CASE WHEN cantidad_total IS NULL THEN cantidad ELSE cantidad_total END AS cantidad_usable
				FROM (
					SELECT a.id_almacen, a.fk_materia_prima, a.cantidad, (a.cantidad - SUM(das.cantidad)) AS cantidad_total, a.caducidad
					FROM almacen a
					LEFT JOIN detalle_almacen_stock das
					ON id_almacen = fk_almacen
					WHERE estatus = TRUE
					AND DATE(caducidad) > DATE(NOW())
                    AND a.fk_materia_prima = dfk_materia_prima
					GROUP BY a.id_almacen, a.caducidad, a.estatus, a.fk_materia_prima
					HAVING cantidad_total IS NULL OR cantidad_total > 0
					ORDER BY a.caducidad
				) AS t
			) AS t2;
			SET dposicion_existencias = 0;
			SET did_almacen = JSON_EXTRACT(dlistado_existencias, CONCAT('$[',dposicion_existencias,'].id_almacen'));
			SET dcantidad = JSON_EXTRACT(dreceta, CONCAT('$[', dposicion_receta - 1,'].cantidad'));
			SET dcantidad_usable = JSON_EXTRACT(dlistado_existencias, CONCAT('$[',dposicion_existencias,'].cantidad_usable'));
            IF (dcantidad_usable <= dcantidad) THEN
				INSERT INTO detalle_almacen_stock(cantidad, fk_almacen, fk_stock)
					VALUES (dcantidad_usable, did_almacen, did_stock);
				UPDATE almacen SET estatus = FALSE WHERE id_almacen = did_almacen;
				subciclo_tabla_intermedia: LOOP
					SET dcantidad = dcantidad - dcantidad_usable;
					SET dposicion_existencias = dposicion_existencias + 1;
					SET did_almacen = JSON_EXTRACT(dlistado_existencias, CONCAT('$[', dposicion_existencias,'].id_almacen'));
					SET dcantidad_usable = JSON_EXTRACT(dlistado_existencias, CONCAT('$[', dposicion_existencias,'].cantidad_usable'));
					IF (dcantidad_usable <= dcantidad) THEN
						INSERT INTO detalle_almacen_stock(cantidad, fk_almacen, fk_stock)
							VALUES (dcantidad_usable, did_almacen, did_stock);
						UPDATE almacen SET estatus = FALSE WHERE id_almacen = did_almacen;
						ITERATE subciclo_tabla_intermedia;
					ELSE 
						INSERT INTO detalle_almacen_stock(cantidad, fk_almacen, fk_stock)
							VALUES (dcantidad, did_almacen, did_stock);
						LEAVE subciclo_tabla_intermedia;
					END IF;
				END LOOP;
			ELSE 
				INSERT INTO detalle_almacen_stock(cantidad, fk_almacen, fk_stock)
					VALUES (dcantidad, did_almacen, did_stock);
			END IF;

			SET dposicion_receta = dposicion_receta - 1;
            ITERATE ciclo_for;
		END LOOP;
	ELSE
		SET realizar_commit = FALSE;
	END IF;
	IF realizar_commit = TRUE THEN
        COMMIT;
    ELSE
        ROLLBACK;
    END IF;
END //
DELIMITER ;



DELIMITER //
CREATE PROCEDURE insertar_receta(
	IN	inombre VARCHAR(255),
	IN  icantidad INT,
	IN  iprecio FLOAT,
	IN	iruta_imagen VARCHAR(255),
	IN	iarr_receta TEXT
)
BEGIN
	DECLARE did_receta INT;
	DECLARE dfk_materia_prima INT;
	DECLARE dcantidad FLOAT;
	DECLARE dposicion_ingrediente INT;
	DECLARE dobjeto_ingrediente JSON;
	
     INSERT INTO receta ( nombre, cantidad, precio, ruta_imagen)
 		VALUES ( inombre, icantidad, iprecio, iruta_imagen);
     SET did_receta = LAST_INSERT_ID();
	SET dposicion_ingrediente = json_length(iarr_receta);
	ciclo_for: LOOP
		IF dposicion_ingrediente = 0 THEN
			LEAVE ciclo_for;
		END IF;
		SET dobjeto_ingrediente = JSON_EXTRACT(iarr_receta, CONCAT('$[',dposicion_ingrediente - 1,']'));
		SET dfk_materia_prima = JSON_EXTRACT(dobjeto_ingrediente, CONCAT('$[0]'));
		SET dcantidad = JSON_EXTRACT(dobjeto_ingrediente, CONCAT('$[1]'));
 		INSERT detalle_materia_prima_receta (fk_receta, cantidad, fk_materia_prima)
 			VALUES (did_receta, dcantidad, dfk_materia_prima);

		SET dposicion_ingrediente = dposicion_ingrediente - 1;
		ITERATE ciclo_for;
	END LOOP;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE actualizar_receta(
	IN	iid_receta INT,
	IN	inombre VARCHAR(255),
	IN  icantidad INT,
	IN  iprecio FLOAT,
	IN	iruta_imagen VARCHAR(255),
	IN	iarr_receta TEXT
)
BEGIN
	DECLARE dfk_materia_prima INT;
	DECLARE dcantidad FLOAT;
	DECLARE dposicion_ingrediente INT;
	DECLARE dobjeto_ingrediente JSON;
	UPDATE receta SET
		nombre = inombre,
        cantidad = icantidad,
        precio = iprecio,
        ruta_imagen = iruta_imagen,
		fecha_actualizacion = NOW()
	WHERE id_receta = iid_receta;
    DELETE FROM detalle_materia_prima_receta WHERE fk_receta = iid_receta;
	SET dposicion_ingrediente = json_length(iarr_receta);
	ciclo_for: LOOP
		IF dposicion_ingrediente = 0 THEN
			LEAVE ciclo_for;
		END IF;
		SET dobjeto_ingrediente = JSON_EXTRACT(iarr_receta, CONCAT('$[',dposicion_ingrediente - 1,']'));
		SET dfk_materia_prima = JSON_EXTRACT(dobjeto_ingrediente, CONCAT('$[0]'));
		SET dcantidad = JSON_EXTRACT(dobjeto_ingrediente, CONCAT('$[1]'));
 		INSERT detalle_materia_prima_receta (fk_receta, cantidad, fk_materia_prima)
 			VALUES (iid_receta, dcantidad, dfk_materia_prima);

		SET dposicion_ingrediente = dposicion_ingrediente - 1;
		ITERATE ciclo_for;
	END LOOP;
END //
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE eliminar_receta(	/* Datos Receta */
									IN iid_receta INT   -- 1
				)
	BEGIN
		UPDATE receta SET  estatus = false,
							fecha_actualizacion = NOW()
        WHERE id_receta = iid_receta;
    END
$$
DELIMITER ;

DELIMITER //
CREATE PROCEDURE insertar_proveedor(	/* Datos Personales */
                                    IN	inombre          VARCHAR(50),     -- 1
                                    IN  iapaterno		 VARCHAR(50),	  -- 2
                                    IN  iamaterno		 VARCHAR(50),	  -- 3
                                    IN	itelefono 		 VARCHAR(10),     -- 4
                                    IN  icodigo_postal   VARCHAR(6),      -- 5
                                    IN	inumero_interior VARCHAR(6),   	  -- 6
                                    IN	inumero_exterior VARCHAR(6),   	  -- 7
                                    IN	icalle       	 VARCHAR(255),    -- 8
                                    IN	icolonia         VARCHAR(100),    -- 9
                                    
                                    /* Datos de Proveedor */
                                    IN	icorreo   		VARCHAR(100),    -- 10

                                    /* Valores de Retorno */
                                    OUT	iid_persona      INT,            -- 11
                                    OUT	iid_proveedor      INT           -- 12
				)                                    
    BEGIN        
    
        -- Insertando los datos de la Persona:
        INSERT INTO persona ( nombre, apaterno, amaterno, telefono, codigo_postal, numero_interior, 
							  numero_exterior, calle, colonia) 
					 VALUES ( inombre, iapaterno, iamaterno, itelefono, icodigo_postal, inumero_interior, 
							  inumero_exterior,  icalle, icolonia);
        -- Obtenemos el ID de Persona que se generó:
        SET iid_persona = LAST_INSERT_ID();

        -- Insertamos en la tabla Proveedores:
        INSERT INTO proveedor (correo, fk_persona) VALUES(icorreo, iid_persona);
        -- Obtenemos el ID del Proveedores que se generó:
        SET iid_proveedor = LAST_INSERT_ID();
    END
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE actualizar_proveedor(	/* Datos Personales */
                                    IN	inombre          VARCHAR(50),     -- 1
                                    IN  iapaterno		 VARCHAR(50),	  -- 2
                                    IN  iamaterno		 VARCHAR(50),	  -- 3
                                    IN	itelefono 		 VARCHAR(10),     -- 4
                                    IN  icodigo_postal   VARCHAR(6),      -- 5
                                    IN	inumero_interior VARCHAR(6),   	  -- 6
                                    IN	inumero_exterior VARCHAR(6), 	  -- 7
                                    IN	icalle       	 VARCHAR(255),    -- 8
                                    IN	icolonia         VARCHAR(100),    -- 9
                                    
                                    /* Datos de Proveedor */
                                    IN	icorreo   		VARCHAR(100),     -- 10
                                    
                                    /* ID's de las tablas relacionadas con el Proveedor */
                                    IN	iid_persona       INT,            -- 11
                                    IN  iid_proveedor 	  INT			  -- 12
				)                                    
    BEGIN        
    
	 -- Datos Persona del Proveedor:
        UPDATE persona  SET     nombre = inombre,
								apaterno = iapaterno,
                                amaterno = iamaterno,
                                telefono = itelefono,
                                codigo_postal = icodigo_postal,
                                numero_interior = inumero_interior,
                                numero_exterior = inumero_exterior,
                                calle = icalle, 
                                colonia = icolonia,
                                fecha_actualizacion = NOW()
                        WHERE   id_persona = iid_persona;

        -- Actualizamos los datos de Proveedor:
        UPDATE proveedor  SET    correo = icorreo
                        WHERE   id_proveedor = iid_proveedor;
        
    END
//
DELIMITER ;


-- Stored Procedure para eliminar Proveedor.
DELIMITER //
CREATE PROCEDURE eliminar_proveedor(	/* Datos Persona */
									IN iid_persona INT   -- 1
				)
	BEGIN
		UPDATE persona SET  estatus = false,
							fecha_actualizacion = NOW()
        WHERE id_persona = iid_persona;
    END
//
DELIMITER ;




DELIMITER //
CREATE PROCEDURE consultar_materia_prima()
BEGIN
	SELECT id_materia_prima, nombre, materia_prima.estatus AS materia_prima_estatus, unidad_medida.descripcion, unidad_medida.estatus AS unidad_medida_estatus
	FROM materia_prima
	INNER JOIN unidad_medida
	ON fk_unidad_medida = id_unidad_medida;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE consultar_materia_prima_por_id( IN iid_materia_prima INT )
BEGIN
	SELECT id_materia_prima, nombre, materia_prima.estatus AS materia_prima_estatus, unidad_medida.descripcion, unidad_medida.estatus AS unidad_medida_estatus
	FROM materia_prima
	INNER JOIN unidad_medida
	ON fk_unidad_medida = id_unidad_medida
    WHERE id_materia_prima = iid_materia_prima;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE insertar_materia_prima(
    IN inombre VARCHAR(255),
    IN ifk_unidad_medida INT
)
BEGIN
	INSERT INTO materia_prima ( nombre, fk_unidad_medida)
		VALUES (inombre, ifk_unidad_medida);
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE actualizar_materia_prima(
    IN iid_materia_prima INT,
    IN inombre VARCHAR(255),
    IN iestatus BOOLEAN,
    IN ifk_unidad_medida INT
)
BEGIN
	IF iestatus = NULL THEN
		SET iestatus = FALSE;
	END IF;
	UPDATE materia_prima SET
		nombre = inombre,
		estatus = iestatus,
		fk_unidad_medida = ifk_unidad_medida,
        fecha_actualizacion = NOW()
	WHERE id_materia_prima = iid_materia_prima;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE eliminar_materia_prima(
    IN iid_materia_prima INT
)
BEGIN
	UPDATE materia_prima SET
		estatus = FALSE,
        fecha_actualizacion = NOW()
	WHERE id_materia_prima = iid_materia_prima;
END //
DELIMITER ;



DELIMITER //
CREATE PROCEDURE insertar_envio(	/* Datos Envio*/
                                    IN	ifk_venta     INT,			-- 1
                                    IN	ifk_empleado  INT,			-- 2

                                    /* Valor de Retorno */
                                    OUT	iid_envio     INT			-- 3
                                    
                                    
				)                                    
    BEGIN        
    
        -- Insertando los datos del Envio:
        INSERT INTO envio ( fk_venta, fk_empleado) 
					 VALUES ( ifk_venta, ifk_empleado);
        -- Obtenemos el ID del Envio que se generó:
        SET iid_envio = LAST_INSERT_ID();

    END
//
DELIMITER ;


DELIMITER //
CREATE PROCEDURE actualizar_envio(	/* Datos Envio */
                                    IN	ifecha_entrega	DATETIME,	-- 1
                                    IN	ifk_venta     INT,			-- 2
                                    IN	ifk_empleado  INT,			-- 3
                                    
                                    /* ID de la tabla Envio*/
                                    IN	iid_envio     INT			-- 4
				)                                    
    BEGIN        
    
	 -- Datos Envio:
        UPDATE envio  SET 	fecha_entrega = ifecha_entrega,
							fk_venta = ifk_venta,
							fk_empleado = ifk_empleado,
                            fecha_actualizacion = NOW()
                        WHERE   id_envio = iid_envio;
    END
//
DELIMITER ;


DELIMITER //
CREATE PROCEDURE entregar_envio(	/* Datos Envio */
									IN iid_envio INT,    -- 1
									IN ifk_usuario INT -- 2
				)
	BEGIN
		UPDATE envio SET  entregado = true,
						fecha_actualizacion = NOW(),
                        entregado = TRUE,
						fk_empleado = (SELECT id_empleado FROM empleado WHERE fk_usuario = ifk_usuario LIMIT 1)
        WHERE id_envio = iid_envio;
    END
//
DELIMITER ;


DELIMITER //
CREATE PROCEDURE insertar_empleado(	/* Datos Personales */
                                    IN	inombre          VARCHAR(255),     -- 1
                                    IN  iapaterno		 VARCHAR(255),	  -- 2
                                    IN  iamaterno		 VARCHAR(255),	  -- 3
                                    IN	itelefono 		 VARCHAR(255),     -- 4
                                    IN  icodigo_postal   INT,      -- 5
                                    IN	inumero_interior VARCHAR(255),   	  -- 6
                                    IN	inumero_exterior VARCHAR(255),   	  -- 7
                                    IN	icalle       	 VARCHAR(255),    -- 8
                                    IN	icolonia         VARCHAR(255),    -- 9
                                    
                                    /* Datos de Usuario */
                                    IN	icorreo   		VARCHAR(255),    -- 10
                                    IN	icontrasenia    VARCHAR(255),    -- 11
                                    
                                    /* Datos rol_usuario*/
                                    IN iid_roles 		VARCHAR(255),	 -- 12

                                    /* Valores de Retorno */
                                    OUT	iid_persona      INT,           -- 13
                                    OUT	iid_usuario   	 INT,           -- 14
                                    OUT	iid_empleado     INT            -- 15
				)                                    
    BEGIN        
	DECLARE posicion INT;
	DECLARE id_rol INT;
        
        -- Insertando los datos de la Persona:
        INSERT INTO persona ( nombre, apaterno, amaterno, telefono, codigo_postal, numero_interior, 
							  numero_exterior, calle, colonia) 
					 VALUES ( inombre, iapaterno, iamaterno, itelefono, icodigo_postal, inumero_interior, 
							  inumero_exterior,  icalle, icolonia);
        -- Obtenemos el ID de Persona que se generó:
        SET iid_persona = LAST_INSERT_ID();

        -- Insertamos los datos de seguridad del Empleado:
        INSERT INTO usuario  (correo, contrasenia) VALUES(icorreo, icontrasenia);
        -- Obtenemos el ID de Usuario que se generó:
        SET iid_usuario = LAST_INSERT_ID();  
        
		SET posicion = json_length(iid_roles);
			ciclo_for: LOOP
			IF posicion = 0 THEN
				LEAVE ciclo_for;
			END IF;
		SET id_rol = JSON_EXTRACT(iid_roles, CONCAT('$[',posicion - 1,']'));
		
        INSERT INTO rol_usuario (fk_usuario, fk_rol) VALUES (iid_usuario, id_rol);
		SET posicion = posicion - 1;
			ITERATE ciclo_for;
		END LOOP;
        
        -- Insertamos en la tabla Empleado:
        INSERT INTO empleado (fk_persona, fk_usuario) VALUES(iid_persona, iid_usuario);
        -- Obtenemos el ID del Empleado que se generó:
        SET iid_empleado = LAST_INSERT_ID();
    END
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE actualizar_empleado(	/* Datos Personales */
                                    IN	inombre         VARCHAR(255),     -- 1
                                    IN  iapaterno		VARCHAR(255),	 -- 2
                                    IN  iamaterno		VARCHAR(255),	 -- 3
                                    IN	itelefono 		VARCHAR(255),     -- 4
                                    IN  icodigo_postal  INT,      -- 5
                                    IN	inumero_interior VARCHAR(255),   	 -- 6
                                    IN	inumero_exterior VARCHAR(255), 	 -- 7
                                    IN	icalle       	VARCHAR(255),    -- 8
                                    IN	icolonia        VARCHAR(255),    -- 9
                                    
                                    /* Datos de Usuario */
                                    IN	icorreo   		VARCHAR(255),    -- 10
                                    IN	icontrasenia     VARCHAR(255),   -- 11
                                    
                                    /* Datos rol_usuario*/
                                    IN iid_roles 		VARCHAR(25),	 -- 12
                                    
                                    /* ID's de las tablas relacionadas con el Empleado */
                                    IN	iid_persona       INT,            -- 13
                                    IN	iid_usuario       INT             -- 14
				)                                    
    BEGIN        
    
    DECLARE posicion INT;
	DECLARE id_rol INT;
		
	DELETE FROM rol_usuario WHERE fk_usuario = iid_usuario;  
    
	 -- Datos Persona del Empleado:
        UPDATE persona  SET     nombre = inombre,
								apaterno = iapaterno,
                                amaterno = iamaterno,
                                telefono = itelefono,
                                codigo_postal = icodigo_postal,
                                numero_interior = inumero_interior,
                                numero_exterior = inumero_exterior,
                                calle = icalle, 
                                colonia = icolonia,
                                fecha_actualizacion = NOW()
                        WHERE   id_persona = iid_persona;

        -- Actualizamos los datos de Seguridad:
        UPDATE usuario  SET     correo = icorreo,
                                contrasenia = icontrasenia
                        WHERE   id_usuario = iid_usuario;
                        
		SET posicion = json_length(iid_roles);
		ciclo_for: LOOP
			IF posicion = 0 THEN
				LEAVE ciclo_for;
			END IF;
			SET id_rol = JSON_EXTRACT(iid_roles, CONCAT('$[',posicion - 1,']'));
            
            INSERT INTO rol_usuario (fk_usuario, fk_rol) VALUES (iid_usuario, id_rol);
			SET posicion = posicion - 1;
			ITERATE ciclo_for;
		END LOOP;
        
    END
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE eliminar_empleado(	/* Datos Persona */
									IN iid_persona INT   -- 1
				)
	BEGIN
		UPDATE persona SET estatus = false,
							fecha_actualizacion = NOW()
        WHERE id_persona = iid_persona;
        UPDATE usuario SET estatus = false
            WHERE id_usuario = (SELECT fk_usuario FROM empleado
                INNER JOIN persona ON id_persona = fk_persona
                WHERE id_persona = iid_persona LIMIT 1);
    END
//
DELIMITER ;


DELIMITER //
CREATE PROCEDURE insertar_compra(
	IN iarr_compras TEXT,
	IN ifk_proveedor INT,
	IN ifk_empleado INT
)
BEGIN
	DECLARE dtotal FLOAT;
	DECLARE dposicion_almacen INT;
	DECLARE dobjeto_almacen TEXT;
	DECLARE dcantidad INT;
	DECLARE dcaducidad DATETIME;
	DECLARE dfk_materia_prima INT;
    DECLARE dprecio FLOAT;
	DECLARE destatus BOOLEAN;
	DECLARE dduplicado INT;
	DECLARE did_duplicado INT;
	DECLARE dcantidad_duplicado INT;
    
	DECLARE did_almacen INT;
	DECLARE did_compra INT;
    
	SET dtotal = 0;
	INSERT INTO compra ( total, fk_proveedor, fk_empleado )
		VALUES ( dtotal, ifk_proveedor, ifk_empleado );
	SET did_compra = LAST_INSERT_ID();
    
	SET dposicion_almacen = json_length(iarr_compras);
	ciclo_for: LOOP
		IF dposicion_almacen = 0 THEN
			LEAVE ciclo_for;
		END IF;
		SET dobjeto_almacen = JSON_EXTRACT(iarr_compras, CONCAT('$[',dposicion_almacen - 1,']'));
		SET dcantidad = JSON_EXTRACT(dobjeto_almacen, CONCAT('$[0]'));
		SET dcaducidad = JSON_EXTRACT(dobjeto_almacen, CONCAT('$[1]'));
		SET dfk_materia_prima = JSON_EXTRACT(dobjeto_almacen, CONCAT('$[2]'));
		SET dprecio = JSON_EXTRACT(dobjeto_almacen, CONCAT('$[3]'));
        SET destatus = TRUE;
		SET dduplicado = (SELECT COUNT(*)
			FROM almacen
			WHERE
				caducidad = dcaducidad AND
				fk_materia_prima = dfk_materia_prima
		);
		IF dduplicado > 0 THEN
			SET did_duplicado = (SELECT id_almacen
				FROM almacen
				WHERE
					caducidad = dcaducidad AND
					fk_materia_prima = dfk_materia_prima
			);
			SET dcantidad_duplicado = (SELECT cantidad
				FROM almacen
				WHERE
					caducidad = dcaducidad AND
					fk_materia_prima = dfk_materia_prima
			);
			UPDATE almacen SET
				cantidad = (dcantidad + dcantidad_duplicado),
				estatus = TRUE,
				fecha_actualizacion = NOW()
			WHERE id_almacen = did_duplicado;
            SET did_almacen = did_duplicado;
		ELSE
			INSERT INTO almacen (cantidad, caducidad, estatus, fk_materia_prima)
				VALUES (dcantidad, dcaducidad, destatus, dfk_materia_prima);
            SET did_almacen = LAST_INSERT_ID();
		END IF;
        INSERT INTO detalle_compra ( cantidad, precio, fk_almacen, fk_compra )
			VALUES (dcantidad, dprecio, did_almacen, did_compra);
		SET dposicion_almacen = dposicion_almacen - 1;
		ITERATE ciclo_for;
	END LOOP;
	SET dtotal = (SELECT SUM(precio) FROM detalle_compra WHERE fk_compra = did_compra);
	UPDATE compra SET
		total = dtotal
	WHERE id_compra = did_compra;
END //
DELIMITER ;



-- Stored Procedure para insertar nuevos Clientes.
DELIMITER //
CREATE PROCEDURE insertar_cliente(	/* Datos Personales */
                                    IN	inombre          VARCHAR(255),     -- 1
                                    IN  iapaterno		 VARCHAR(255),	  -- 2
                                    IN  iamaterno		 VARCHAR(255),	  -- 3
                                    IN	itelefono 		 VARCHAR(255),     -- 4
                                    IN  icodigo_postal   INT,      -- 5
                                    IN	inumero_interior VARCHAR(255),   	  -- 6
                                    IN	inumero_exterior VARCHAR(255),   	  -- 7
                                    IN	icalle       	 VARCHAR(255),    -- 8
                                    IN	icolonia         VARCHAR(255),    -- 9
                                    
                                    /* Datos de Usuario */
                                    IN	icorreo   		VARCHAR(255),    -- 10
                                    IN	icontrasenia    VARCHAR(255),    -- 11

                                    /* Valores de Retorno */
                                    OUT	iid_persona      INT,           -- 12
                                    OUT	iid_usuario   	 INT,           -- 13
                                    OUT	iid_cliente      INT            -- 14
				)                                    
    BEGIN        
        IF (SELECT COUNT(*) FROM usuario WHERE correo = icorreo) = 0 THEN
            -- Insertando los datos de la Persona:
            INSERT INTO persona ( nombre, apaterno, amaterno, telefono, codigo_postal, numero_interior, 
                                numero_exterior, calle, colonia) 
                        VALUES ( inombre, iapaterno, iamaterno, itelefono, icodigo_postal, inumero_interior, 
                                inumero_exterior,  icalle, icolonia);
            -- Obtenemos el ID de Persona que se generó:
            SET iid_persona = LAST_INSERT_ID();

            -- Insertamos los datos de seguridad del Cliente:
            INSERT INTO usuario  (correo, contrasenia) VALUES(icorreo, icontrasenia);
            -- Obtenemos el ID de Usuario que se generó:
            SET iid_usuario = LAST_INSERT_ID();  
            
            INSERT INTO rol_usuario (fk_usuario, fk_rol) VALUES (iid_usuario, 2);
            
            -- Insertamos en la tabla Cliente:
            INSERT INTO cliente (fk_persona, fk_usuario) VALUES(iid_persona, iid_usuario);
            -- Obtenemos el ID del Cliente que se generó:
            SET iid_cliente = LAST_INSERT_ID();
        END IF;
    END
//
DELIMITER ;


DELIMITER //
CREATE PROCEDURE actualizar_cliente(	/* Datos Personales */
                                    IN	inombre          VARCHAR(255),     -- 1
                                    IN  iapaterno		 VARCHAR(255),	  -- 2
                                    IN  iamaterno		 VARCHAR(255),	  -- 3
                                    IN	itelefono 		 VARCHAR(255),     -- 4
                                    IN  icodigo_postal   INT,      -- 5
                                    IN	inumero_interior VARCHAR(255),   	  -- 6
                                    IN	inumero_exterior VARCHAR(255), 	  -- 7
                                    IN	icalle       	 VARCHAR(255),    -- 8
                                    IN	icolonia         VARCHAR(255),    -- 9
                                    
                                    /* Datos de Usuario */
                                    IN	icorreo   		VARCHAR(100),    -- 10
                                    IN	icontrasenia    VARCHAR(100),    -- 11
                                    
                                    /* ID's de las tablas relacionadas con el Cliente */
                                    IN	iid_persona       INT,            -- 12
                                    IN	iid_usuario       INT             -- 13
				)                                    
    BEGIN        
    
	 -- Datos Persona del Cliente:
        UPDATE persona  SET     nombre = inombre,
								apaterno = iapaterno,
                                amaterno = iamaterno,
                                telefono = itelefono,
                                codigo_postal = icodigo_postal,
                                numero_interior = inumero_interior,
                                numero_exterior = inumero_exterior,
                                calle = icalle, 
                                colonia = icolonia, 
                                fecha_actualizacion =  NOW()
                        WHERE   id_persona = iid_persona;

        -- Actualizamos los datos de Seguridad:
        UPDATE usuario  SET     correo = icorreo,
                                contrasenia = icontrasenia
                        WHERE   id_usuario = iid_usuario;
        
    END
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE eliminar_clientes(	/* Datos Persona */
									IN iid_persona INT    -- 1
				)
	BEGIN
		UPDATE persona SET  estatus = false,
							fecha_actualizacion = NOW()
        WHERE id_persona = iid_persona;
    END
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE buscar_cliente_id(IN p_id_cliente INT)
BEGIN
SELECT c.id_cliente, p.nombre, p.apaterno, p.amaterno, p.telefono, p.codigo_postal,
p.numero_exterior, p.numero_interior, p.calle, p.colonia, u.correo, u.contrasenia, u.estatus,p.id_persona,u.id_usuario
FROM cliente c
INNER JOIN persona p ON c.fk_persona = p.id_persona
INNER JOIN usuario u ON c.fk_usuario = u.id_usuario
WHERE c.id_cliente = p_id_cliente;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE buscar_empleado_id(
									IN p_id_empleado INT
)
BEGIN

  SELECT e.id_empleado, p.nombre, p.apaterno, p.amaterno, p.telefono, p.codigo_postal, 
         p.numero_exterior, p.numero_interior, p.calle, p.colonia, 
         rol.id_usuario, rol.correo, rol.estatus, rol.roles,p.id_persona,rol.id_usuario FROM empleado e
				INNER JOIN (SELECT id_usuario,
						correo,
						estatus,
						(SELECT JSON_ARRAYAGG(fk_rol)
							FROM rol_usuario
							WHERE fk_usuario = id_usuario)
						AS roles
					FROM usuario
					WHERE id_usuario = id_usuario
				) AS rol
                ON fk_usuario = id_usuario
                INNER JOIN persona p ON e.fk_persona = p.id_persona
                WHERE id_empleado = p_id_empleado;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE buscar_proveedor_id(IN p_id_proveedor INT)
BEGIN
  SELECT pr.id_proveedor, pr.correo, p.nombre, p.apaterno, p.amaterno, p.telefono, p.codigo_postal, 
         p.numero_exterior, p.numero_interior, p.calle, p.colonia, p.id_persona
  FROM proveedor pr
  INNER JOIN persona p ON pr.fk_persona = p.id_persona
  WHERE pr.id_proveedor = p_id_proveedor;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE buscar_receta_id(IN p_id_receta INT)
BEGIN
  SELECT r.id_receta, r.nombre, r.cantidad, r.precio, r.ruta_imagen, CONCAT("[", GROUP_CONCAT(t1.lista_receta SEPARATOR ','), "]") AS lista_receta
  FROM receta r
  INNER JOIN (
      SELECT CONCAT("[",mp.id_materia_prima,",'", mp.nombre,"',",dmpr.cantidad,"]") AS lista_receta, dmpr.fk_receta
      FROM detalle_materia_prima_receta dmpr
      INNER JOIN materia_prima mp ON mp.id_materia_prima = dmpr.fk_materia_prima
  ) t1 ON r.id_receta = t1.fk_receta
  WHERE r.id_receta = p_id_receta
  GROUP BY r.id_receta;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE buscar_envio_id(IN p_id_envio INT)
BEGIN
  SELECT en.id_envio, fecha_entrega, entregado, v.total, 
		CONCAT(p1.nombre, ' ' ,p1.apaterno, ' ', p1.amaterno) AS nombre_cliente, 
		CONCAT(p1.calle, ' ', p1.colonia, ' ', p1.numero_exterior, ' ' , IFNULL(p1.numero_interior, '')) AS direccion, 
        p1.codigo_postal, p1.telefono,
        CONCAT(p2.nombre, ' ' ,p2.apaterno, ' ' ,p2.amaterno) AS nombre_empleado, p2.telefono
  FROM envio en
  INNER JOIN venta v ON en.fk_venta = v.id_venta
  INNER JOIN cliente c ON v.fk_cliente = c.id_cliente
  INNER JOIN persona p1 ON c.fk_persona = p1.id_persona
  INNER JOIN empleado e ON en.fk_empleado = e.id_empleado
  INNER JOIN persona p2 ON e.fk_persona = p2.id_persona
  
  WHERE en.id_envio = p_id_envio;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE buscar_materia_prima_id(IN p_id_materia_prima INT)
BEGIN
  SELECT mp.id_materia_prima, mp.nombre, um.descripcion AS unidad_medida
  FROM materia_prima mp
  INNER JOIN unidad_medida um ON mp.fk_unidad_medida = um.id_unidad_medida
  WHERE id_materia_prima = p_id_materia_prima;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE consultar_recetas_posibles( OUT oids JSON )
BEGIN
	DECLARE dposicion_receta INT;
	DECLARE dtotal_receta INT;
	DECLARE dtotal_posibles_receta INT;
	DECLARE dtotal_posibles_receta_arreglos INT;
    DECLARE did_receta INT;
    DECLARE ids_resultados JSON;
	SET ids_resultados = JSON_ARRAY();
    SET dposicion_receta = (SELECT COUNT(DISTINCT fk_receta) FROM detalle_materia_prima_receta);
    ciclo_recetas: LOOP
		IF dposicion_receta = 0 THEN
			LEAVE ciclo_recetas;
		END IF;
        SET dtotal_posibles_receta_arreglos = dposicion_receta - 1;
        SET did_receta = (SELECT fk_receta
			FROM detalle_materia_prima_receta
			GROUP BY fk_receta
			LIMIT dtotal_posibles_receta_arreglos,1);
        SET dtotal_posibles_receta = (
			SELECT COUNT(*) FROM (
				SELECT dmpr.cantidad, dmpr.fk_materia_prima, SUM(cantidad_usable) AS cantidad_usable
					FROM detalle_materia_prima_receta dmpr
					INNER JOIN
						(SELECT fk_materia_prima,
							   CASE WHEN cantidad_total IS NULL THEN cantidad ELSE cantidad_total END AS cantidad_usable
						FROM (
							SELECT a.id_almacen, a.fk_materia_prima, a.cantidad, (a.cantidad - SUM(das.cantidad)) AS cantidad_total, a.caducidad
							FROM almacen a
							LEFT JOIN detalle_almacen_stock das
							ON id_almacen = fk_almacen
							WHERE estatus = TRUE
							AND DATE(caducidad) > DATE(NOW())
							GROUP BY a.id_almacen, a.caducidad, a.estatus, a.fk_materia_prima
							HAVING cantidad_total IS NULL OR cantidad_total > 0
							ORDER BY a.caducidad
						) AS t) AS t2
					ON t2.fk_materia_prima = dmpr.fk_materia_prima
				WHERE fk_receta = did_receta
				GROUP BY cantidad, fk_materia_prima
			) AS t3
		);
        SET dtotal_receta = (SELECT COUNT(*) FROM detalle_materia_prima_receta WHERE fk_receta = did_receta);
		IF dtotal_posibles_receta = dtotal_receta THEN
			SET ids_resultados = JSON_ARRAY_APPEND(ids_resultados, '$', did_receta);
        END IF;
		SET dposicion_receta = dposicion_receta - 1;
        ITERATE ciclo_recetas;
	END LOOP;
    SET oids = ids_resultados;
END //
DELIMITER ;


CALL insertar_empleado('admin','Apataerno_admin','Amataerno_admin','4770000000','9999','99999','NA','admin_calle','admin_colonia','admin@gmail.com','pbkdf2:sha256:260000$EpZIXt9LhK7BmwOq$d1c3f62d0180bcd2cb88a44bc3753246607450ce370ae557cce10a8c87a58f50','[1,2,3,4,5,6,7]',@iid_persona,@iid_usuario,@iid_empleado);

DELIMITER //
CREATE PROCEDURE consultar_recetas_posibles_tabla()
BEGIN
	DECLARE dposicion_receta INT;
	DECLARE dtotal_receta INT;
	DECLARE dtotal_posibles_receta INT;
	DECLARE dtotal_posibles_receta_arreglos INT;
    DECLARE did_receta INT;
    DECLARE ids_resultados JSON;
	SET ids_resultados = JSON_ARRAY();
    SET dposicion_receta = (SELECT COUNT(DISTINCT fk_receta) FROM detalle_materia_prima_receta);
    ciclo_recetas: LOOP
		IF dposicion_receta = 0 THEN
			LEAVE ciclo_recetas;
		END IF;
        SET dtotal_posibles_receta_arreglos = dposicion_receta - 1;
        SET did_receta = (SELECT fk_receta
			FROM detalle_materia_prima_receta
			GROUP BY fk_receta
			LIMIT dtotal_posibles_receta_arreglos,1);
        SET dtotal_posibles_receta = (
			SELECT COUNT(*) FROM (
				SELECT dmpr.cantidad, dmpr.fk_materia_prima, SUM(cantidad_usable) AS cantidad_usable
					FROM detalle_materia_prima_receta dmpr
					INNER JOIN
						(SELECT fk_materia_prima,
							   CASE WHEN cantidad_total IS NULL THEN cantidad ELSE cantidad_total END AS cantidad_usable
						FROM (
							SELECT a.id_almacen, a.fk_materia_prima, a.cantidad, (a.cantidad - SUM(das.cantidad)) AS cantidad_total, a.caducidad
							FROM almacen a
							LEFT JOIN detalle_almacen_stock das
							ON id_almacen = fk_almacen
							WHERE estatus = TRUE
							AND DATE(caducidad) > DATE(NOW())
							GROUP BY a.id_almacen, a.caducidad, a.estatus, a.fk_materia_prima
							HAVING cantidad_total IS NULL OR cantidad_total > 0
							ORDER BY a.caducidad
						) AS t) AS t2
					ON t2.fk_materia_prima = dmpr.fk_materia_prima
				WHERE fk_receta = did_receta
				GROUP BY cantidad, fk_materia_prima
			) AS t3
		);
        SET dtotal_receta = (SELECT COUNT(*) FROM detalle_materia_prima_receta WHERE fk_receta = did_receta);
		IF dtotal_posibles_receta = dtotal_receta THEN
			SET ids_resultados = JSON_ARRAY_APPEND(ids_resultados, '$', did_receta);
        END IF;
		SET dposicion_receta = dposicion_receta - 1;
        ITERATE ciclo_recetas;
	END LOOP;
    SELECT ids_resultados;
END //
DELIMITER ;
