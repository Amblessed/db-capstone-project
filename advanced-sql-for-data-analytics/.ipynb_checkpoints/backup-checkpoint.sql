-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: db_window_fxn
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_customers`
--

DROP TABLE IF EXISTS `tbl_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_customers` (
  `CustomerID` int NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `Score` int DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_customers`
--

LOCK TABLES `tbl_customers` WRITE;
/*!40000 ALTER TABLE `tbl_customers` DISABLE KEYS */;
INSERT INTO `tbl_customers` VALUES (1,'Jossef','Goldberg','Germany',350),(2,'Kevin','Brown','USA',900),(3,'Mary',NULL,'USA',750),(4,'Mark','Schwarz','Germany',500),(5,'Anna','Adams','USA',NULL);
/*!40000 ALTER TABLE `tbl_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_employees`
--

DROP TABLE IF EXISTS `tbl_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_employees` (
  `EmployeeID` int NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Department` varchar(50) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Salary` int DEFAULT NULL,
  `ManagerID` int DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_employees`
--

LOCK TABLES `tbl_employees` WRITE;
/*!40000 ALTER TABLE `tbl_employees` DISABLE KEYS */;
INSERT INTO `tbl_employees` VALUES (1,'Frank','Lee','Marketing','1988-12-05','M',55000,NULL),(2,'Kevin','Brown','Marketing','1972-11-25','M',65000,1),(3,'Mary',NULL,'Sales','1986-01-05','F',75000,1),(4,'Michael','Ray','Sales','1977-02-10','M',90000,2),(5,'Carol','Baker','Sales','1982-02-11','F',55000,3);
/*!40000 ALTER TABLE `tbl_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_orders`
--

DROP TABLE IF EXISTS `tbl_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_orders` (
  `OrderID` int NOT NULL,
  `ProductID` int DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  `SalesPersonID` int DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `ShipDate` date DEFAULT NULL,
  `OrderStatus` varchar(50) DEFAULT NULL,
  `ShipAddress` varchar(255) DEFAULT NULL,
  `BillAddress` varchar(255) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Sales` int DEFAULT NULL,
  `CreationTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_orders`
--

LOCK TABLES `tbl_orders` WRITE;
/*!40000 ALTER TABLE `tbl_orders` DISABLE KEYS */;
INSERT INTO `tbl_orders` VALUES (1,101,2,3,'2025-01-01','2025-01-05','Delivered','9833 Mt. Dias Blv.','1226 Shoe St.',1,10,'2025-01-01 11:34:56'),(2,102,3,3,'2025-01-05','2025-01-10','Shipped','250 Race Court',NULL,1,15,'2025-01-05 22:22:04'),(3,101,1,5,'2025-01-10','2025-01-25','Delivered','8157 W. Book','8157 W. Book',2,20,'2025-01-10 17:24:08'),(4,105,1,3,'2025-01-20','2025-01-25','Shipped','5724 Victory Lane','',2,60,'2025-01-20 04:50:33'),(5,104,2,5,'2025-02-01','2025-02-05','Delivered',NULL,NULL,1,25,'2025-02-01 13:02:41'),(6,104,3,5,'2025-02-05','2025-02-10','Delivered','1792 Belmont Rd.',NULL,2,50,'2025-02-06 14:34:57'),(7,102,1,1,'2025-02-15','2025-02-27','Delivered','136 Balboa Court','',2,30,'2025-02-16 05:22:01'),(8,101,4,3,'2025-02-18','2025-02-27','Shipped','2947 Vine Lane','4311 Clay Rd',3,90,'2025-02-18 09:45:22'),(9,101,2,3,'2025-03-10','2025-03-15','Shipped','3768 Door Way','',2,20,'2025-03-10 11:59:04'),(10,102,3,5,'2025-03-15','2025-03-20','Shipped',NULL,NULL,0,60,'2025-03-16 22:25:15');
/*!40000 ALTER TABLE `tbl_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_orders_archive`
--

DROP TABLE IF EXISTS `tbl_orders_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_orders_archive` (
  `OrderID` int NOT NULL,
  `ProductID` int DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  `SalesPersonID` int DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `ShipDate` date DEFAULT NULL,
  `OrderStatus` varchar(50) DEFAULT NULL,
  `ShipAddress` varchar(255) DEFAULT NULL,
  `BillAddress` varchar(255) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Sales` int DEFAULT NULL,
  `CreationTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_orders_archive`
--

LOCK TABLES `tbl_orders_archive` WRITE;
/*!40000 ALTER TABLE `tbl_orders_archive` DISABLE KEYS */;
INSERT INTO `tbl_orders_archive` VALUES (1,101,2,3,'2025-01-01','2025-01-05','Delivered','9833 Mt. Dias Blv.','1226 Shoe St.',1,10,'2025-01-01 11:34:56'),(2,102,3,3,'2025-01-05','2025-01-10','Shipped','250 Race Court',NULL,1,15,'2025-01-05 22:22:04'),(3,101,1,5,'2025-01-10','2025-01-25','Delivered','8157 W. Book','8157 W. Book',2,20,'2025-01-10 17:24:08'),(4,105,1,3,'2025-01-20','2025-01-25','Shipped','5724 Victory Lane','',2,60,'2025-01-20 04:50:33'),(4,104,2,5,'2025-02-01','2025-02-05','Delivered',NULL,NULL,1,25,'2025-02-01 13:02:41'),(5,104,3,5,'2025-02-05','2025-02-10','Delivered','1792 Belmont Rd.',NULL,2,50,'2025-02-06 14:34:57'),(6,102,1,1,'2025-02-15','2025-02-27','Delivered','136 Balboa Court','',2,30,'2025-02-16 05:22:01'),(6,101,4,3,'2025-02-18','2025-02-27','Shipped','2947 Vine Lane','4311 Clay Rd',3,90,'2025-02-18 09:45:22'),(6,101,2,3,'2025-03-10','2025-03-15','Shipped','3768 Door Way','',2,20,'2025-03-10 11:59:04'),(7,102,3,5,'2025-03-15','2025-03-20','Shipped',NULL,NULL,0,60,'2025-03-16 22:25:15');
/*!40000 ALTER TABLE `tbl_orders_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_products`
--

DROP TABLE IF EXISTS `tbl_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_products` (
  `ProductID` int NOT NULL,
  `Product` varchar(50) DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `Price` int DEFAULT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_products`
--

LOCK TABLES `tbl_products` WRITE;
/*!40000 ALTER TABLE `tbl_products` DISABLE KEYS */;
INSERT INTO `tbl_products` VALUES (101,'Bottle','Accessories',10),(102,'Tire','Accessories',15),(103,'Socks','Clothing',20),(104,'Caps','Clothing',25),(105,'Gloves','Clothing',30);
/*!40000 ALTER TABLE `tbl_products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-20 14:52:40
