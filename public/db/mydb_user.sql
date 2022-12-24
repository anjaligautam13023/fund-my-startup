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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `descrip` varchar(255) DEFAULT NULL,
  `mobile` int DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `tagline` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Ghajal Alagh','Ghajal3023@gmail.com','ghajal1234','Investor','One of the famous businesswomen cofounded MamaEarth. ',783464659,'/uploads/ghajal.jpg','Mumbai','Co-founder MamaEarth'),(2,'Anupam Mittal','anupam@gmail.com','anupam1234','Investor','Founder and CEO of shadi.com ,the world&#x27;s oldest and successful matrimonial service.',4896875,'/uploads/anupam.jpg','Mumbai','Founder of Shadi.com'),(3,'Gautam Adani','adani@gmail.com','adani1234','Investor','Adani started a diamond trading business for a while and turned into a millionaire at 20.',545356934,'/uploads/Adani.jpg','Ahemdabad','Chairperson of Adani group '),(4,'vandana buddy','vandana@gmail.com','vanadan1234','Entreprenaur','Stepping in the field of business. Founded dogTrail to gives services for dogs and puppies.',7846533,'/uploads/vandana.jpg','Mathura','ceo of dogTrail'),(8,'Vidhan Dixit','vidhan@gmail.com','vidhan1234','Investor','An young enthusiastic leader and keynote speaker,rider,poet. ',673471389,'/uploads/vidhan.jpeg','Mathura','Founder of Bigstore '),(11,'Dhirubhai ambani','ambani@gmail.com','bharti1234','Entreprenaur','He is an Indian buissness tycoon.',6577,'/uploads/ambani.png','fdfh','founder of reliance'),(12,'Deepak Gautam','deepak@gmail.com','deepak1234','Entreprenaur','Started tiffin to provide lunch to those who are away from their homes .It helped a lot of people to get lunch on time due to tiffin.',74653849,'/uploads/tiffin.jpg','Gwalior','CEO of Tifffin'),(13,'Aman Gautam','aman@gmail.com','aman1234','Entreprenaur','A young entreprenaur who co founded the authority application that is a place to show writing skills. ',745446893,'/uploads/aman.jpg','Banglore','CEO of Authority'),(14,'Anjali Gautam','anjaligautam13023@gmail.com','anjali1234','Investor','stepped into the field buissness by introducing a web appllication fund my startup that connect entreprenaurs with Investors',746576907,'/uploads/anjali.png','Mathura','Founder of fund my startup '),(15,'gopal sharma','gopal@gmail.com','gopal123','Entreprenaur','Introduced a speech recognition system that recognises speech and helps to do a lot of work.',934589345,'/uploads/gopal.jpg','Mathura','Founder of Brother'),(16,'Bharti','bharti@gmail.com','bharti1234','Entreprenaur','Tourister is a tourist place recommendation sysytem that recommends places to people based on their inetrest',756804753,'/uploads/bharti.jpg','Mathura','Co founder of tourister'),(18,'Rajan Anandan','rajan@gmail.com','rajan1234','Investor','Rajan Anandan has been one of the most active angel investors in 2017. Currently investing in startups spread across India and Sri Lanka, Rajan is also the co-founder of Blue Ocean Ventures, the first seed fund in Sri Lanka.',475246084,'/uploads/rajan.webp','India','Managing Director – Sequoia Capital'),(19,'T.V. Mohandas Pai','rai@gmail.com','rai1234','Investor','A former chief financial officer of Infosys, Mohandas Pai is a prolifically active angel investor. His focus has mostly been on early-stage investments in technology startups.',455397509,'/uploads/T.V-Mohandas-Pai.webp','India','Chairman – Manipal Global Education, Former Director, Infosys'),(20,'Girish Mathrubootham','girish@gmail.com','girish1234','Entreprenaur','A self-confessed enthusiast of customer support, Girish Mathrubootham is the founder and CEO of India’s most successful Customer support software provider, startup FreshWorks. ',475692007,'/uploads/girish.webp','India','CEO – FreshWorks');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-22 19:41:24
