-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: bookstore
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `coverpictures`
--

DROP TABLE IF EXISTS `coverpictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coverpictures` (
  `PicID` int NOT NULL AUTO_INCREMENT,
  `Picture` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PicID`),
  UNIQUE KEY `PicID_UNIQUE` (`PicID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coverpictures`
--

LOCK TABLES `coverpictures` WRITE;
/*!40000 ALTER TABLE `coverpictures` DISABLE KEYS */;
/*!40000 ALTER TABLE `coverpictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customerID` int NOT NULL AUTO_INCREMENT,
  `First Name` varchar(45) DEFAULT NULL,
  `Last Name` varchar(45) DEFAULT NULL,
  `Phone#` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `registered` tinyint DEFAULT '0',
  `promotions` tinyint DEFAULT '0',
  `PassID` int DEFAULT NULL,
  `PaymentID` int DEFAULT NULL,
  `Admin` tinyint DEFAULT '0',
  `cartID` int DEFAULT NULL,
  PRIMARY KEY (`customerID`),
  UNIQUE KEY `customerID_UNIQUE` (`customerID`),
  KEY `PassID_idx` (`PassID`),
  KEY `PaymentID_idx` (`PaymentID`),
  KEY `CartID_idx` (`cartID`),
  CONSTRAINT `CartID` FOREIGN KEY (`cartID`) REFERENCES `shopping cart` (`cartID`),
  CONSTRAINT `PassID` FOREIGN KEY (`PassID`) REFERENCES `passwords` (`PassID`),
  CONSTRAINT `PaymentID` FOREIGN KEY (`PaymentID`) REFERENCES `payment info` (`PaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='these are the verified customers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `bookid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `authors` varchar(45) DEFAULT NULL,
  `coverPicID` int DEFAULT NULL,
  `BuyPrice` decimal(6,2) DEFAULT NULL,
  `Sell Price` decimal(6,2) DEFAULT NULL,
  `minumum` int DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `number of copies` int DEFAULT NULL,
  `publisher` varchar(45) DEFAULT NULL,
  `editor` varchar(45) DEFAULT NULL,
  `ISBN` varchar(45) DEFAULT NULL,
  `datepublished` year DEFAULT NULL,
  PRIMARY KEY (`bookid`),
  UNIQUE KEY `bookid_UNIQUE` (`bookid`),
  KEY `PicID_idx` (`coverPicID`),
  CONSTRAINT `PicID` FOREIGN KEY (`coverPicID`) REFERENCES `coverpictures` (`PicID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='This is where the manager can add and remove books in the inventory';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `CustID` int DEFAULT NULL,
  `ordertime` time NOT NULL,
  `OrderDate` date DEFAULT NULL,
  `OrderStatus` varchar(45) DEFAULT NULL,
  `TotalPrice` decimal(10,2) DEFAULT NULL,
  `ShipAddress` varchar(45) DEFAULT NULL,
  `PaymentMethod` varchar(45) DEFAULT NULL,
  `Books` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  UNIQUE KEY `OrderID_UNIQUE` (`OrderID`),
  KEY `CustID_idx` (`CustID`),
  CONSTRAINT `CustID` FOREIGN KEY (`CustID`) REFERENCES `customers` (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Data table for orders that have gone through\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passwords`
--

DROP TABLE IF EXISTS `passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passwords` (
  `PassID` int NOT NULL AUTO_INCREMENT,
  `Password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PassID`),
  UNIQUE KEY `PassID_UNIQUE` (`PassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passwords`
--

LOCK TABLES `passwords` WRITE;
/*!40000 ALTER TABLE `passwords` DISABLE KEYS */;
/*!40000 ALTER TABLE `passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment info`
--

DROP TABLE IF EXISTS `payment info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment info` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `Card number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  UNIQUE KEY `PaymentID_UNIQUE` (`PaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment info`
--

LOCK TABLES `payment info` WRITE;
/*!40000 ALTER TABLE `payment info` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotions` (
  `PromoID` int NOT NULL AUTO_INCREMENT,
  `PromoCode` varchar(10) DEFAULT NULL,
  `Percentage` int DEFAULT NULL,
  `Start Date` date DEFAULT NULL,
  `Expiration Date` date DEFAULT NULL,
  PRIMARY KEY (`PromoID`),
  UNIQUE KEY `PromoID_UNIQUE` (`PromoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Data table for the admin to add promotions to';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions`
--

LOCK TABLES `promotions` WRITE;
/*!40000 ALTER TABLE `promotions` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping cart`
--

DROP TABLE IF EXISTS `shopping cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping cart` (
  `cartID` int NOT NULL AUTO_INCREMENT,
  `CustID` int DEFAULT NULL,
  `Books` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cartID`),
  UNIQUE KEY `cartID_UNIQUE` (`cartID`),
  KEY `CustID_idx` (`CustID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping cart`
--

LOCK TABLES `shopping cart` WRITE;
/*!40000 ALTER TABLE `shopping cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping cart` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-10 14:08:02
