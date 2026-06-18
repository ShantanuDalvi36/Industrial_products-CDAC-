-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: industry_products
-- ------------------------------------------------------
-- Server version	9.7.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '67cc8e92-5fca-11f1-99c7-60452e7e1cc8:1-128';

--
-- Table structure for table `challan`
--

DROP TABLE IF EXISTS `challan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `challan` (
  `ChallanID` int NOT NULL AUTO_INCREMENT,
  `ChallanNo` varchar(30) NOT NULL,
  `VendorID` int NOT NULL,
  `ChallanDate` date NOT NULL,
  `TransporterID` int NOT NULL,
  `Remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ChallanID`),
  UNIQUE KEY `ChallanNo` (`ChallanNo`),
  KEY `VendorID` (`VendorID`),
  KEY `TransporterID` (`TransporterID`),
  CONSTRAINT `challan_ibfk_1` FOREIGN KEY (`VendorID`) REFERENCES `vendor` (`VendorID`),
  CONSTRAINT `challan_ibfk_2` FOREIGN KEY (`TransporterID`) REFERENCES `transporter` (`TransporterID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challan`
--

LOCK TABLES `challan` WRITE;
/*!40000 ALTER TABLE `challan` DISABLE KEYS */;
INSERT INTO `challan` VALUES (1,'CH001',1,'2026-01-11',1,'On time delivery'),(2,'CH002',2,'2026-01-14',2,'Material received'),(3,'CH003',3,'2026-01-19',3,'Good condition'),(4,'CH004',6,'2026-01-21',1,'Copper shipment'),(5,'CH005',8,'2026-01-24',4,'Plastic material'),(6,'CH006',7,'2026-01-27',5,'Rubber items'),(7,'CH007',9,'2026-02-01',2,'Bearing delivery'),(8,'CH008',10,'2026-02-04',3,'Finished parts'),(9,'CH009',5,'2026-02-07',4,'Additional stock'),(10,'CH010',4,'2026-02-11',5,'Drive shaft delivery');
/*!40000 ALTER TABLE `challan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challandetail`
--

DROP TABLE IF EXISTS `challandetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `challandetail` (
  `ChallanDetailID` int NOT NULL AUTO_INCREMENT,
  `ChallanID` int NOT NULL,
  `PartID` int NOT NULL,
  `ChallanQty` int NOT NULL,
  PRIMARY KEY (`ChallanDetailID`),
  UNIQUE KEY `uk_challan_part` (`ChallanID`,`PartID`),
  KEY `PartID` (`PartID`),
  CONSTRAINT `challandetail_ibfk_1` FOREIGN KEY (`ChallanID`) REFERENCES `challan` (`ChallanID`),
  CONSTRAINT `challandetail_ibfk_2` FOREIGN KEY (`PartID`) REFERENCES `part` (`PartID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challandetail`
--

LOCK TABLES `challandetail` WRITE;
/*!40000 ALTER TABLE `challandetail` DISABLE KEYS */;
INSERT INTO `challandetail` VALUES (1,1,1,200),(2,1,7,25),(3,2,1,150),(4,2,2,120),(5,3,2,200),(6,3,3,500),(7,4,3,600),(8,5,4,300),(9,6,5,800),(10,7,6,300),(11,8,6,400),(12,8,8,20),(13,9,4,250),(14,9,5,600),(15,10,9,100);
/*!40000 ALTER TABLE `challandetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grr`
--

DROP TABLE IF EXISTS `grr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grr` (
  `GRRID` int NOT NULL AUTO_INCREMENT,
  `GRRNo` varchar(30) NOT NULL,
  `ChallanID` int NOT NULL,
  `POID` int NOT NULL,
  `VendorID` int NOT NULL,
  `TransporterID` int NOT NULL,
  `GRRDate` date NOT NULL,
  `Remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`GRRID`),
  UNIQUE KEY `GRRNo` (`GRRNo`),
  KEY `ChallanID` (`ChallanID`),
  KEY `POID` (`POID`),
  KEY `VendorID` (`VendorID`),
  KEY `TransporterID` (`TransporterID`),
  CONSTRAINT `grr_ibfk_1` FOREIGN KEY (`ChallanID`) REFERENCES `challan` (`ChallanID`),
  CONSTRAINT `grr_ibfk_2` FOREIGN KEY (`POID`) REFERENCES `purchaseorder` (`POID`),
  CONSTRAINT `grr_ibfk_3` FOREIGN KEY (`VendorID`) REFERENCES `vendor` (`VendorID`),
  CONSTRAINT `grr_ibfk_4` FOREIGN KEY (`TransporterID`) REFERENCES `transporter` (`TransporterID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grr`
--

LOCK TABLES `grr` WRITE;
/*!40000 ALTER TABLE `grr` DISABLE KEYS */;
INSERT INTO `grr` VALUES (1,'GRR001',1,1,1,1,'2026-01-11','Inspection completed'),(2,'GRR002',2,2,2,2,'2026-01-14','Material received'),(3,'GRR003',3,3,3,3,'2026-01-19','Accepted after inspection'),(4,'GRR004',4,4,6,1,'2026-01-21','Copper wire received'),(5,'GRR005',5,5,8,4,'2026-01-24','Plastic material received'),(6,'GRR006',6,6,7,5,'2026-01-27','Rubber items received'),(7,'GRR007',7,7,9,2,'2026-02-01','Bearing stock received'),(8,'GRR008',8,8,10,3,'2026-02-04','Finished goods received'),(9,'GRR009',9,9,5,4,'2026-02-07','Additional stock'),(10,'GRR010',10,10,4,5,'2026-02-11','Drive shafts received');
/*!40000 ALTER TABLE `grr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grrdetail`
--

DROP TABLE IF EXISTS `grrdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grrdetail` (
  `GRRDetailID` int NOT NULL AUTO_INCREMENT,
  `GRRID` int NOT NULL,
  `PartID` int NOT NULL,
  `ReceivedQty` int NOT NULL,
  PRIMARY KEY (`GRRDetailID`),
  UNIQUE KEY `uk_grr_part` (`GRRID`,`PartID`),
  KEY `PartID` (`PartID`),
  CONSTRAINT `grrdetail_ibfk_1` FOREIGN KEY (`GRRID`) REFERENCES `grr` (`GRRID`),
  CONSTRAINT `grrdetail_ibfk_2` FOREIGN KEY (`PartID`) REFERENCES `part` (`PartID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grrdetail`
--

LOCK TABLES `grrdetail` WRITE;
/*!40000 ALTER TABLE `grrdetail` DISABLE KEYS */;
INSERT INTO `grrdetail` VALUES (1,1,1,200),(2,1,7,25),(3,2,1,150),(4,2,2,120),(5,3,2,200),(6,3,3,500),(7,4,3,600),(8,5,4,300),(9,6,5,800),(10,7,6,300),(11,8,6,400),(12,8,8,20),(13,9,4,250),(14,9,5,600),(15,10,9,100);
/*!40000 ALTER TABLE `grrdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mir`
--

DROP TABLE IF EXISTS `mir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mir` (
  `MIRID` int NOT NULL AUTO_INCREMENT,
  `MIRNo` varchar(30) NOT NULL,
  `MIRDate` date NOT NULL,
  `DepartmentName` enum('Production','Assembly','Quality Control','Packaging','Maintenance') DEFAULT NULL,
  PRIMARY KEY (`MIRID`),
  UNIQUE KEY `MIRNo` (`MIRNo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mir`
--

LOCK TABLES `mir` WRITE;
/*!40000 ALTER TABLE `mir` DISABLE KEYS */;
INSERT INTO `mir` VALUES (1,'MIR001','2026-02-15','Production'),(2,'MIR002','2026-02-16','Assembly'),(3,'MIR003','2026-02-17','Production'),(4,'MIR004','2026-02-18','Packaging'),(5,'MIR005','2026-02-19','Production'),(6,'MIR006','2026-02-20','Quality Control'),(7,'MIR007','2026-02-21','Assembly'),(8,'MIR008','2026-02-22','Production'),(9,'MIR009','2026-02-23','Maintenance'),(10,'MIR010','2026-02-24','Packaging');
/*!40000 ALTER TABLE `mir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mirdetail`
--

DROP TABLE IF EXISTS `mirdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mirdetail` (
  `MIRDetailID` int NOT NULL AUTO_INCREMENT,
  `MIRID` int NOT NULL,
  `PartID` int NOT NULL,
  `IssuedQty` int NOT NULL,
  PRIMARY KEY (`MIRDetailID`),
  UNIQUE KEY `uk_mir_part` (`MIRID`,`PartID`),
  KEY `PartID` (`PartID`),
  CONSTRAINT `mirdetail_ibfk_1` FOREIGN KEY (`MIRID`) REFERENCES `mir` (`MIRID`),
  CONSTRAINT `mirdetail_ibfk_2` FOREIGN KEY (`PartID`) REFERENCES `part` (`PartID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mirdetail`
--

LOCK TABLES `mirdetail` WRITE;
/*!40000 ALTER TABLE `mirdetail` DISABLE KEYS */;
INSERT INTO `mirdetail` VALUES (1,1,1,50),(2,1,3,100),(3,2,6,75),(4,3,2,80),(5,3,5,150),(6,4,4,120),(7,5,1,60),(8,5,3,200),(9,6,6,25),(10,7,5,100),(11,8,2,90),(12,8,4,150),(13,9,6,30),(14,10,4,80),(15,10,5,120);
/*!40000 ALTER TABLE `mirdetail` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_validate_mir_qty` BEFORE INSERT ON `mirdetail` FOR EACH ROW BEGIN
    IF NEW.IssuedQty <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'Issued quantity must be greater than zero';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `part`
--

DROP TABLE IF EXISTS `part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `part` (
  `PartID` int NOT NULL AUTO_INCREMENT,
  `PartNo` varchar(20) NOT NULL,
  `CategoryID` int NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `UnitOfMeasure` varchar(20) DEFAULT NULL,
  `UnitRate` decimal(10,2) DEFAULT NULL,
  `OpeningStock` int DEFAULT NULL,
  `MinimumStock` int DEFAULT NULL,
  `ReorderLevel` int DEFAULT NULL,
  `ReorderQuantity` int DEFAULT NULL,
  `PartType` enum('Raw Material','Finished Part') DEFAULT NULL,
  PRIMARY KEY (`PartID`),
  UNIQUE KEY `PartNo` (`PartNo`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `part_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `partcategory` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part`
--

LOCK TABLES `part` WRITE;
/*!40000 ALTER TABLE `part` DISABLE KEYS */;
INSERT INTO `part` VALUES (1,'RM001',1,'Steel Rod','Kg',120.00,500,100,150,300,'Raw Material'),(2,'RM002',1,'Aluminium Sheet','Kg',180.00,400,80,120,250,'Raw Material'),(3,'RM003',1,'Copper Wire','Meter',50.00,1000,200,300,500,'Raw Material'),(4,'RM004',1,'Plastic Granules','Kg',90.00,600,120,180,300,'Raw Material'),(5,'RM005',1,'Rubber Seal','Nos',15.00,800,150,250,400,'Raw Material'),(6,'RM006',1,'Bearing','Nos',60.00,700,100,150,300,'Raw Material'),(7,'FP001',2,'Gear Assembly','Nos',450.00,100,20,30,50,'Finished Part'),(8,'FP002',2,'Motor Housing','Nos',700.00,80,15,25,40,'Finished Part'),(9,'FP003',2,'Drive Shaft','Nos',350.00,120,25,40,60,'Finished Part'),(10,'FP004',2,'Pump Assembly','Nos',950.00,50,10,20,30,'Finished Part');
/*!40000 ALTER TABLE `part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partcategory`
--

DROP TABLE IF EXISTS `partcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partcategory` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(50) NOT NULL,
  `CategoryDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partcategory`
--

LOCK TABLES `partcategory` WRITE;
/*!40000 ALTER TABLE `partcategory` DISABLE KEYS */;
INSERT INTO `partcategory` VALUES (1,'Raw Material','Materials used in manufacturing'),(2,'Finished Part','Finished manufactured products');
/*!40000 ALTER TABLE `partcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentterm`
--

DROP TABLE IF EXISTS `paymentterm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentterm` (
  `PaymentTermID` int NOT NULL AUTO_INCREMENT,
  `PaymentDescription` varchar(255) DEFAULT NULL,
  `CreditDays` int DEFAULT NULL,
  PRIMARY KEY (`PaymentTermID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentterm`
--

LOCK TABLES `paymentterm` WRITE;
/*!40000 ALTER TABLE `paymentterm` DISABLE KEYS */;
INSERT INTO `paymentterm` VALUES (1,'Immediate Payment',0),(2,'Net 15 Days',15),(3,'Net 30 Days',30),(4,'Net 45 Days',45),(5,'Net 60 Days',60);
/*!40000 ALTER TABLE `paymentterm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseorder`
--

DROP TABLE IF EXISTS `purchaseorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchaseorder` (
  `POID` int NOT NULL AUTO_INCREMENT,
  `PONumber` varchar(30) NOT NULL,
  `VendorID` int NOT NULL,
  `PODate` date DEFAULT NULL,
  `ExpectedDeliveryDate` date DEFAULT NULL,
  `TotalAmount` decimal(12,2) DEFAULT NULL,
  `Status` enum('Pending','Partially Received','Received','Cancelled') DEFAULT NULL,
  PRIMARY KEY (`POID`),
  UNIQUE KEY `PONumber` (`PONumber`),
  KEY `VendorID` (`VendorID`),
  CONSTRAINT `purchaseorder_ibfk_1` FOREIGN KEY (`VendorID`) REFERENCES `vendor` (`VendorID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseorder`
--

LOCK TABLES `purchaseorder` WRITE;
/*!40000 ALTER TABLE `purchaseorder` DISABLE KEYS */;
INSERT INTO `purchaseorder` VALUES (1,'PO001',1,'2026-01-05','2026-01-12',NULL,'Received'),(2,'PO002',2,'2026-01-08','2026-01-15',NULL,'Received'),(3,'PO003',3,'2026-01-12','2026-01-20',NULL,'Received'),(4,'PO004',6,'2026-01-15','2026-01-22',NULL,'Received'),(5,'PO005',8,'2026-01-18','2026-01-25',NULL,'Received'),(6,'PO006',7,'2026-01-20','2026-01-28',NULL,'Received'),(7,'PO007',9,'2026-01-25','2026-02-02',NULL,'Received'),(8,'PO008',10,'2026-01-28','2026-02-05',NULL,'Received'),(9,'PO009',5,'2026-02-01','2026-02-08',NULL,'Received'),(10,'PO010',4,'2026-02-05','2026-02-12',NULL,'Received');
/*!40000 ALTER TABLE `purchaseorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseorderdetail`
--

DROP TABLE IF EXISTS `purchaseorderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchaseorderdetail` (
  `PODetailID` int NOT NULL AUTO_INCREMENT,
  `POID` int NOT NULL,
  `PartID` int NOT NULL,
  `OrderedQty` int DEFAULT NULL,
  `UnitRate` decimal(10,2) DEFAULT NULL,
  `LineAmount` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`PODetailID`),
  UNIQUE KEY `uk_po_part` (`POID`,`PartID`),
  KEY `PartID` (`PartID`),
  CONSTRAINT `purchaseorderdetail_ibfk_1` FOREIGN KEY (`POID`) REFERENCES `purchaseorder` (`POID`),
  CONSTRAINT `purchaseorderdetail_ibfk_2` FOREIGN KEY (`PartID`) REFERENCES `part` (`PartID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseorderdetail`
--

LOCK TABLES `purchaseorderdetail` WRITE;
/*!40000 ALTER TABLE `purchaseorderdetail` DISABLE KEYS */;
INSERT INTO `purchaseorderdetail` VALUES (1,1,1,200,118.00,23600.00),(2,1,7,25,440.00,11000.00),(3,2,1,150,119.00,17850.00),(4,2,2,120,178.00,21360.00),(5,3,2,200,180.00,36000.00),(6,3,3,500,49.00,24500.00),(7,4,3,600,48.00,28800.00),(8,5,4,300,88.00,26400.00),(9,6,5,800,14.00,11200.00),(10,7,6,300,58.00,17400.00),(11,8,6,400,59.00,23600.00),(12,8,8,20,690.00,13800.00),(13,9,4,250,89.00,22250.00),(14,9,5,600,15.00,9000.00),(15,10,9,100,345.00,34500.00);
/*!40000 ALTER TABLE `purchaseorderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualityinspection`
--

DROP TABLE IF EXISTS `qualityinspection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qualityinspection` (
  `InspectionID` int NOT NULL AUTO_INCREMENT,
  `GRRDetailID` int NOT NULL,
  `InspectionDate` date NOT NULL,
  `AcceptedQty` int NOT NULL,
  `RejectedQty` int NOT NULL,
  `InspectionStatus` enum('Accepted','Partially Accepted','Rejected') DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`InspectionID`),
  KEY `GRRDetailID` (`GRRDetailID`),
  CONSTRAINT `qualityinspection_ibfk_1` FOREIGN KEY (`GRRDetailID`) REFERENCES `grrdetail` (`GRRDetailID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualityinspection`
--

LOCK TABLES `qualityinspection` WRITE;
/*!40000 ALTER TABLE `qualityinspection` DISABLE KEYS */;
INSERT INTO `qualityinspection` VALUES (1,1,'2026-01-11',200,0,'Accepted','Fully accepted'),(2,2,'2026-01-11',25,0,'Accepted','Passed quality test'),(3,3,'2026-01-14',145,5,'Partially Accepted','Minor surface defects'),(4,4,'2026-01-14',120,0,'Accepted','Accepted'),(5,5,'2026-01-19',195,5,'Partially Accepted','Minor scratches'),(6,6,'2026-01-19',500,0,'Accepted','Accepted'),(7,7,'2026-01-21',590,10,'Partially Accepted','Insulation issue'),(8,8,'2026-01-24',300,0,'Accepted','Accepted'),(9,9,'2026-01-27',780,20,'Partially Accepted','Few damaged seals'),(10,10,'2026-02-01',300,0,'Accepted','Accepted'),(11,11,'2026-02-04',390,10,'Partially Accepted','Dimension mismatch'),(12,12,'2026-02-04',20,0,'Accepted','Accepted'),(13,13,'2026-02-07',245,5,'Partially Accepted','Minor contamination'),(14,14,'2026-02-07',600,0,'Accepted','Accepted'),(15,15,'2026-02-11',0,100,'Rejected','Completely rejected batch'),(16,1,'2026-01-11',200,0,'Accepted','Fully accepted'),(17,2,'2026-01-11',25,0,'Accepted','Passed quality test'),(18,3,'2026-01-14',145,5,'Partially Accepted','Minor surface defects'),(19,4,'2026-01-14',120,0,'Accepted','Accepted'),(20,5,'2026-01-19',195,5,'Partially Accepted','Minor scratches'),(21,6,'2026-01-19',500,0,'Accepted','Accepted'),(22,7,'2026-01-21',590,10,'Partially Accepted','Insulation issue'),(23,8,'2026-01-24',300,0,'Accepted','Accepted'),(24,9,'2026-01-27',780,20,'Partially Accepted','Few damaged seals'),(25,10,'2026-02-01',300,0,'Accepted','Accepted'),(26,11,'2026-02-04',390,10,'Partially Accepted','Dimension mismatch'),(27,12,'2026-02-04',20,0,'Accepted','Accepted'),(28,13,'2026-02-07',245,5,'Partially Accepted','Minor contamination'),(29,14,'2026-02-07',600,0,'Accepted','Accepted'),(30,15,'2026-02-11',0,100,'Rejected','Completely rejected batch');
/*!40000 ALTER TABLE `qualityinspection` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_validate_inspection` BEFORE INSERT ON `qualityinspection` FOR EACH ROW BEGIN
    DECLARE received_qty INT;

    SELECT ReceivedQty
    INTO received_qty
    FROM GRRDetail
    WHERE GRRDetailID = NEW.GRRDetailID;

    IF NEW.AcceptedQty + NEW.RejectedQty <> received_qty THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'AcceptedQty + RejectedQty must equal ReceivedQty';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_auto_inspection_status` BEFORE INSERT ON `qualityinspection` FOR EACH ROW BEGIN

    IF NEW.RejectedQty = 0 THEN
        SET NEW.InspectionStatus = 'Accepted';

    ELSEIF NEW.AcceptedQty = 0 THEN
        SET NEW.InspectionStatus = 'Rejected';

    ELSE
        SET NEW.InspectionStatus = 'Partially Accepted';

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `transporter`
--

DROP TABLE IF EXISTS `transporter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transporter` (
  `TransporterID` int NOT NULL AUTO_INCREMENT,
  `TransporterName` varchar(100) NOT NULL,
  `ContactNo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`TransporterID`),
  UNIQUE KEY `uk_transporter` (`TransporterName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transporter`
--

LOCK TABLES `transporter` WRITE;
/*!40000 ALTER TABLE `transporter` DISABLE KEYS */;
INSERT INTO `transporter` VALUES (1,'Blue Dart Logistics','9811111111'),(2,'FastTrack Transport','9822222222'),(3,'Express Cargo','9833333333'),(4,'National Freight','9844444444'),(5,'Swift Movers','9855555555');
/*!40000 ALTER TABLE `transporter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor` (
  `VendorID` int NOT NULL AUTO_INCREMENT,
  `VendorCode` varchar(20) NOT NULL,
  `VendorName` varchar(100) NOT NULL,
  `AddressLine1` varchar(255) DEFAULT NULL,
  `AddressLine2` varchar(255) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Pincode` varchar(10) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`VendorID`),
  UNIQUE KEY `VendorCode` (`VendorCode`),
  CONSTRAINT `chk_vendor_email` CHECK ((`Email` like _utf8mb4'%@%')),
  CONSTRAINT `chk_vendor_phone` CHECK (regexp_like(`Phone`,_utf8mb4'^[0-9]{10}$'))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (1,'V001','ABC Metals','MIDC Area',NULL,'Pune','Maharashtra','411001','9876543210','abc@vendor.com'),(2,'V002','XYZ Industries','Industrial Estate',NULL,'Mumbai','Maharashtra','400001','9876543211','xyz@vendor.com'),(3,'V003','Prime Suppliers','Sector 10',NULL,'Nashik','Maharashtra','422001','9876543212','prime@vendor.com'),(4,'V004','SteelCorp','MIDC Zone',NULL,'Nagpur','Maharashtra','440001','9876543213','steelcorp@vendor.com'),(5,'V005','MetalWorks','Industrial Park',NULL,'Aurangabad','Maharashtra','431001','9876543214','metalworks@vendor.com'),(6,'V006','CopperTech','Sector 5',NULL,'Pune','Maharashtra','411045','9876543215','copper@vendor.com'),(7,'V007','RubberLine','Industrial Hub',NULL,'Thane','Maharashtra','400601','9876543216','rubber@vendor.com'),(8,'V008','PolyChem','MIDC Road',NULL,'Kolhapur','Maharashtra','416003','9876543217','polychem@vendor.com'),(9,'V009','Bearing House','Industrial Area',NULL,'Solapur','Maharashtra','413001','9876543218','bearing@vendor.com'),(10,'V010','Mega Components','Tech Park',NULL,'Pune','Maharashtra','411057','9876543219','mega@vendor.com');
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendorpart`
--

DROP TABLE IF EXISTS `vendorpart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendorpart` (
  `VendorPartID` int NOT NULL AUTO_INCREMENT,
  `VendorID` int NOT NULL,
  `PartID` int NOT NULL,
  `VendorRate` decimal(10,2) DEFAULT NULL,
  `MinimumOrderQty` int DEFAULT NULL,
  `LeadTimeDays` int DEFAULT NULL,
  `PaymentTermID` int DEFAULT NULL,
  `EffectiveFrom` date DEFAULT NULL,
  `EffectiveTo` date DEFAULT NULL,
  PRIMARY KEY (`VendorPartID`),
  KEY `VendorID` (`VendorID`),
  KEY `PartID` (`PartID`),
  KEY `PaymentTermID` (`PaymentTermID`),
  CONSTRAINT `vendorpart_ibfk_1` FOREIGN KEY (`VendorID`) REFERENCES `vendor` (`VendorID`),
  CONSTRAINT `vendorpart_ibfk_2` FOREIGN KEY (`PartID`) REFERENCES `part` (`PartID`),
  CONSTRAINT `vendorpart_ibfk_3` FOREIGN KEY (`PaymentTermID`) REFERENCES `paymentterm` (`PaymentTermID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendorpart`
--

LOCK TABLES `vendorpart` WRITE;
/*!40000 ALTER TABLE `vendorpart` DISABLE KEYS */;
INSERT INTO `vendorpart` VALUES (1,1,1,118.00,100,7,3,NULL,NULL),(2,2,1,119.00,150,10,4,NULL,NULL),(3,2,2,178.00,100,6,3,NULL,NULL),(4,3,2,180.00,150,8,4,NULL,NULL),(5,6,3,48.00,500,5,2,NULL,NULL),(6,3,3,49.00,400,6,3,NULL,NULL),(7,8,4,88.00,200,7,3,NULL,NULL),(8,5,4,89.00,300,9,4,NULL,NULL),(9,7,5,14.00,500,4,2,NULL,NULL),(10,5,5,15.00,400,6,3,NULL,NULL),(11,9,6,58.00,200,5,3,NULL,NULL),(12,10,6,59.00,250,7,4,NULL,NULL),(13,1,7,440.00,20,10,4,NULL,NULL),(14,10,8,690.00,15,12,5,NULL,NULL),(15,4,9,345.00,30,8,3,NULL,NULL);
/*!40000 ALTER TABLE `vendorpart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'industry_products'
--
/*!50003 DROP FUNCTION IF EXISTS `GetPartValue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetPartValue`(
    p_partid INT
) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN

    DECLARE stock INT;
    DECLARE rate DECIMAL(10,2);

    SELECT OpeningStock, UnitRate
    INTO stock, rate
    FROM Part
    WHERE PartID = p_partid;

    RETURN stock * rate;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreatePurchaseOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreatePurchaseOrder`(
    IN p_ponumber VARCHAR(30),
    IN p_vendorid INT,
    IN p_podate DATE,
    IN p_expected DATE
)
BEGIN

    INSERT INTO PurchaseOrder
    (
        PONumber,
        VendorID,
        PODate,
        ExpectedDeliveryDate,
        Status
    )
    VALUES
    (
        p_ponumber,
        p_vendorid,
        p_podate,
        p_expected,
        'Pending'
    );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IssueMaterial` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IssueMaterial`(
    IN p_mirid INT,
    IN p_partid INT,
    IN p_qty INT
)
BEGIN

    INSERT INTO MIRDetail
    (
        MIRID,
        PartID,
        IssuedQty
    )
    VALUES
    (
        p_mirid,
        p_partid,
        p_qty
    );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-18 10:23:38
