-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: adventuretravels
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `Address` text,
  `Preferences` text,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Nettie','Stein','nettie.stein@example.com','1234567890','123 Elm Street, Springfield','Window seat, No spicy food'),(2,'Kai','Limar','kai.limar@example.com','9876543210','456 Maple Avenue, Shelbyville','Aisle seat, Vegan meals'),(3,'Arthur','Read','arthur.read@example.com','5551234567','789 Oak Lane, Capital City','Extra legroom, No peanuts'),(4,'Farida','Farazi','farida.farazi@example.com','2223334444','101 Pine Court, Metropolis','Window seat, Gluten-free meals'),(5,'Shiela','Ark','shiela.ark@example.com','4445556666','202 Birch Drive, Gotham','Aisle seat, Extra blankets'),(6,'Niel','Shah','niel.shah@example.com','8889990000','303 Cedar Street, Starling City','No preference'),(7,'Maria','Blackford','maria.blackford@example.com','6667778888','404 Walnut Road, Central City','Extra legroom, Vegetarian meals'),(8,'Nora','Kabir','nora.kabir@example.com','7778889999','505 Palm Drive, Coast City','Window seat, No seafood'),(9,'Leah','Kint','leah.kint@example.com','1112223333','606 Cherry Avenue, Blüdhaven','Aisle seat, Kosher meals'),(10,'Eltisi','Nur','eltisi.nur@example.com','9990001111','707 Aspen Lane, Smallville','No spicy food, Extra pillows');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destination`
--

DROP TABLE IF EXISTS `destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destination` (
  `DestinationID` int NOT NULL AUTO_INCREMENT,
  `DestinationName` varchar(100) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `Description` text,
  PRIMARY KEY (`DestinationID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destination`
--

LOCK TABLES `destination` WRITE;
/*!40000 ALTER TABLE `destination` DISABLE KEYS */;
INSERT INTO `destination` VALUES (1,'Paris','France','The city of lights, known for its iconic Eiffel Tower and rich culture.'),(2,'New York City','USA','The bustling metropolitan hub of art, commerce, and entertainment.'),(3,'Tokyo','Japan','A vibrant city blending traditional culture with cutting-edge technology.'),(4,'Dubai','UAE','A city known for luxury shopping, ultramodern architecture, and a lively nightlife scene.'),(5,'Rome','Italy','A historic city with ancient ruins and delicious Italian cuisine.');
/*!40000 ALTER TABLE `destination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `BookingID` int NOT NULL,
  `PaymentDate` date NOT NULL,
  `PaymentAmount` decimal(10,2) NOT NULL,
  `PaymentMethod` enum('Down Payment','Full','Installment') NOT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `BookingID` (`BookingID`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`BookingID`) REFERENCES `travelbooking` (`BookingID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,'2024-11-15',600.00,'Down Payment'),(2,1,'2024-12-01',600.00,'Installment'),(3,2,'2024-11-20',1300.00,'Full'),(4,3,'2024-11-10',400.00,'Down Payment'),(5,3,'2024-11-20',400.00,'Installment'),(6,5,'2024-11-12',900.00,'Full'),(7,7,'2024-12-05',850.00,'Full'),(8,4,'2024-11-05',700.00,'Down Payment'),(9,4,'2024-11-20',700.00,'Installment'),(10,8,'2024-11-12',1600.00,'Full'),(11,10,'2024-12-01',1700.00,'Full'),(12,6,'2024-11-25',1000.00,'Down Payment'),(13,6,'2024-12-05',1000.00,'Installment'),(14,9,'2024-12-01',2100.00,'Full'),(15,8,'2024-11-18',800.00,'Down Payment'),(16,8,'2024-12-02',800.00,'Installment'),(17,9,'2024-12-15',2100.00,'Full');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportation`
--

DROP TABLE IF EXISTS `transportation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transportation` (
  `TransportationModeID` int NOT NULL AUTO_INCREMENT,
  `TransportationType` enum('Train','Bus','Flight') NOT NULL,
  `CompanyName` varchar(100) DEFAULT NULL,
  `CostPerPerson` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`TransportationModeID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportation`
--

LOCK TABLES `transportation` WRITE;
/*!40000 ALTER TABLE `transportation` DISABLE KEYS */;
INSERT INTO `transportation` VALUES (1,'Flight','Air France',350.00),(2,'Flight','Delta Airlines',400.00),(3,'Train','Eurostar',150.00),(4,'Train','Shinkansen',200.00),(5,'Bus','Greyhound',50.00),(6,'Bus','FlixBus',70.00),(7,'Flight','Japan Airlines',500.00);
/*!40000 ALTER TABLE `transportation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelbooking`
--

DROP TABLE IF EXISTS `travelbooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travelbooking` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `DestinationID` int NOT NULL,
  `BookingDate` date NOT NULL,
  `TransportationModeID` int NOT NULL,
  `TotalCost` decimal(10,2) NOT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `DestinationID` (`DestinationID`),
  KEY `TransportationModeID` (`TransportationModeID`),
  CONSTRAINT `travelbooking_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE,
  CONSTRAINT `travelbooking_ibfk_2` FOREIGN KEY (`DestinationID`) REFERENCES `destination` (`DestinationID`) ON DELETE CASCADE,
  CONSTRAINT `travelbooking_ibfk_3` FOREIGN KEY (`TransportationModeID`) REFERENCES `transportation` (`TransportationModeID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelbooking`
--

LOCK TABLES `travelbooking` WRITE;
/*!40000 ALTER TABLE `travelbooking` DISABLE KEYS */;
INSERT INTO `travelbooking` VALUES (1,1,1,'2024-12-01',1,1200.00),(2,2,1,'2024-12-03',1,1300.00),(3,3,2,'2024-11-15',3,800.00),(4,5,2,'2024-11-18',3,900.00),(5,7,2,'2024-12-10',3,850.00),(6,4,3,'2024-11-20',7,1400.00),(7,8,3,'2024-11-18',4,1600.00),(8,10,3,'2024-12-15',7,1700.00),(9,6,4,'2024-12-05',2,2000.00),(10,9,4,'2024-12-08',2,2100.00),(11,8,5,'2024-11-18',4,1600.00),(12,9,5,'2024-11-28',4,2100.00);
/*!40000 ALTER TABLE `travelbooking` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-29 16:13:32
