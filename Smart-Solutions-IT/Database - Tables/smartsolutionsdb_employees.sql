-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: smartsolutionsdb
-- ------------------------------------------------------
-- Server version	5.7.15-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `EmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `JobPosition` varchar(50) DEFAULT NULL,
  `DepartmentID` int(11) NOT NULL,
  `GenderID` int(11) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `PhoneNumber` varchar(50) DEFAULT NULL,
  `EmailAddress` varchar(50) NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `uniqueEmail` (`EmailAddress`),
  KEY `DepartmentID` (`DepartmentID`),
  KEY `GenderID` (`GenderID`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`),
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`GenderID`) REFERENCES `genders` (`GenderID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Ivan','Ivanov','.Net Developer',1,1,'1990-02-22','0881331','ivan@abv.bg'),(2,'Hristo','Dekov','',1,1,'1972-04-13','','hd@gmail.com'),(3,'Maria','Petrova','Vice President',4,2,'1980-10-22','089913','maria@gmail.com'),(4,'Stoyan','Stefanov','Production Technician',6,1,'1988-05-06','','ss@mail.com'),(5,'Kiril','Dimitrov','',7,1,'1970-12-22','','kiro@yahoo.com'),(6,'Tanya','Petkova','Stocker',3,2,'1986-06-05','000131','tanya@petkova.com'),(7,'Nikolay','Veselinov','CEO',8,1,'1963-11-11','','niki@gmail.com'),(8,'Gergana','Kasheva','QA Technician',9,2,'1971-11-17','','geri@gmail.com'),(9,'Kosta','Kostov','.Net Developer',1,1,'1990-02-22','0881331','kostov@abv.bg'),(10,'Plamen','Ivanov','.Net Developer',1,1,'1990-02-22','0881331','ivanov@abv.bg'),(11,'Alexandra','Gateva','Administrator',1,2,'1980-10-22','089913','alex@gmail.com'),(12,'Spas','Spasov','',6,1,'1988-05-06','','spas@mail.com'),(13,'Boris','Bokov','Trainee',7,1,'1999-12-22','','boris@yahoo.com'),(14,'Tanya','Tosheva','Trainee',3,2,'1996-06-05','13012301','tosheva@petkova.com'),(15,'Kiril','Veselinov','',8,1,'1963-11-11','','kveselinov@gmail.com'),(16,'Greta','Bratova','JavaScript Developer',9,2,'1971-11-17','','greta@gmail.com');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-18 15:22:03
