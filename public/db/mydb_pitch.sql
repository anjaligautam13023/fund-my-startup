-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
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
-- Table structure for table `pitch`
--

DROP TABLE IF EXISTS `pitch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pitch` (
  `PitchID` int NOT NULL AUTO_INCREMENT,
  `UserId` int DEFAULT NULL,
  `ProductId` int DEFAULT NULL,
  `Staus` int DEFAULT NULL,
  `investorid` int DEFAULT NULL,
  `percent` int DEFAULT NULL,
  `descrip` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `demand` int DEFAULT NULL,
  PRIMARY KEY (`PitchID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pitch`
--

LOCK TABLES `pitch` WRITE;
/*!40000 ALTER TABLE `pitch` DISABLE KEYS */;
INSERT INTO `pitch` VALUES (1,4,NULL,1,2,3,'pls give me fund','https://www.youtube.com/embed/34MADBWC9WU',1000000),(2,4,1,2,2,7,'hbsicksdk','https://www.youtube.com/embed/34MADBWC9WU',27681),(3,4,1,2,2,8,'thd','https://www.youtube.com/embed/_gBIKdZ1Kj4',7),(7,11,4,2,1,2,'dbjffjgbsbdhjfghl','https://www.youtube.com/embed/_gBIKdZ1Kj4',74),(8,11,4,2,11,3,'it is very good product','https://www.youtube.com/embed/Lg2lQIqGPXk',1000000),(9,4,1,2,4,100,'it is a good soap than other soap.','https://www.youtube.com/embed/jRkZ4GoCNeg',1868769),(10,4,1,2,3,5,'good product','https://www.youtube.com/embed/yj3lm00cZSg',46535),(12,4,1,2,1,57,'rtw','regs',4564),(13,4,1,2,2,3,'hjkl,lnjkbhjlkkl','https://www.youtube.com/embed/jRkZ4GoCNeg&t=2s',645782495),(14,4,1,1,18,3,'gfhsir','vhgclae',7476590);
/*!40000 ALTER TABLE `pitch` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-22 19:41:23
