CREATE DATABASE  IF NOT EXISTS `db_dossier` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_dossier`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: db_dossier
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `tbl_accounts`
--

DROP TABLE IF EXISTS `tbl_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_accounts` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `emp_email` varchar(45) DEFAULT NULL,
  `emp_password` varchar(200) DEFAULT NULL,
  `emp_empnum` varchar(45) DEFAULT NULL,
  `emp_fname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `emp_empnum_UNIQUE` (`emp_empnum`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_accounts`
--

LOCK TABLES `tbl_accounts` WRITE;
/*!40000 ALTER TABLE `tbl_accounts` DISABLE KEYS */;
INSERT INTO `tbl_accounts` VALUES (1,'capinpinroland@gmail.com','$2a$10$6BWrYEjnL0REICoTSe38S.rbU88Xt0uMbzd1J5.gTt.Mk1a3fBE6C','9','ROLAND'),(2,'w@w','$2b$10$iWplg8rHrnondQtmWhLCle1WvtcE2kbCx2Z4kW14Y78DUQ9zM9HdS','6',NULL),(3,'capsi@yahoo.com','$2b$10$6Nvgiuvxc85Dyi95qQILtereQddcq/naUmgNi2w1Z4Zj6WIwjaceS','3',NULL),(4,'w@ww','$2b$10$0qA5m50p9jV8gxYAJjM7nO.z1QyJyjWJDNAn0VFL8LNR657u.1uzS',NULL,NULL),(5,'admin@a','$2a$10$2.ytE5vKx2/2Bcwed8mwluDLePOKNeVVtMxxev9SHw4tU9XjK7Z/K','010','Roland'),(6,'w@r','$2a$10$6Nc36wsviDYX2Z1oMZyaSOT.htYVh247HA96YnpWivORpQ7p8mzay',NULL,NULL);
/*!40000 ALTER TABLE `tbl_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_address`
--

DROP TABLE IF EXISTS `tbl_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_address` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `emp_phnum` varchar(100) DEFAULT NULL,
  `emp_pblocknum` varchar(100) DEFAULT NULL,
  `emp_pstreetname` varchar(100) DEFAULT NULL,
  `emp_pprovince` varchar(100) DEFAULT NULL,
  `emp_pmunicipal` varchar(45) DEFAULT NULL,
  `emp_pbarangay` varchar(100) DEFAULT NULL,
  `emp_zipcode` varchar(45) DEFAULT NULL,
  `emp_prehnum` varchar(100) DEFAULT NULL,
  `emp_preblocknum` varchar(100) DEFAULT NULL,
  `emp_prestreetname` varchar(100) DEFAULT NULL,
  `emp_preprovince` varchar(100) DEFAULT NULL,
  `emp_premunicipal` varchar(100) DEFAULT NULL,
  `emp_prebarangay` varchar(100) DEFAULT NULL,
  `emp_prezipcode` varchar(45) DEFAULT NULL,
  `emp_empnum` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `emp_empnum_UNIQUE` (`emp_empnum`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_address`
--

LOCK TABLES `tbl_address` WRITE;
/*!40000 ALTER TABLE `tbl_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_completed`
--

DROP TABLE IF EXISTS `tbl_completed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_completed` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `emp_position` varchar(45) DEFAULT NULL,
  `emp_num` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_completed`
--

LOCK TABLES `tbl_completed` WRITE;
/*!40000 ALTER TABLE `tbl_completed` DISABLE KEYS */;
INSERT INTO `tbl_completed` VALUES (1,'Roland Capinpin','Web Developer','009'),(2,'Jerwil Lapa','Web Developer','010'),(3,'Tyrone  Tyiaga','Web Developer','011'),(4,'Ej De Jesus','Web Developer','012');
/*!40000 ALTER TABLE `tbl_completed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contact`
--

DROP TABLE IF EXISTS `tbl_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_contact` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `emp_email` varchar(100) DEFAULT NULL,
  `emp_contactprefix` varchar(45) DEFAULT NULL,
  `emp_contactnum` varchar(100) DEFAULT NULL,
  `emp_landlinenumber` varchar(100) DEFAULT NULL,
  `emp_emcname` varchar(45) DEFAULT NULL,
  `emp_emcrelation` varchar(45) DEFAULT NULL,
  `emp_emergencycontact` varchar(100) DEFAULT NULL,
  `emp_empnum` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `emp_empnum_UNIQUE` (`emp_empnum`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_contact`
--

LOCK TABLES `tbl_contact` WRITE;
/*!40000 ALTER TABLE `tbl_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_educational`
--

DROP TABLE IF EXISTS `tbl_educational`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_educational` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `emp_educprimary` varchar(100) DEFAULT NULL,
  `emp_educprimadd` varchar(45) DEFAULT NULL,
  `emp_primaryeargrad` varchar(100) DEFAULT NULL,
  `emp_educsecond` varchar(100) DEFAULT NULL,
  `emp_secondaryadd` varchar(45) DEFAULT NULL,
  `emp_secondyeargrad` varchar(100) DEFAULT NULL,
  `emp_educytertiary` varchar(100) DEFAULT NULL,
  `emp_tadd` varchar(45) DEFAULT NULL,
  `emp_tercourse` varchar(100) DEFAULT NULL,
  `emp_tertiaryyeargrad` varchar(100) DEFAULT NULL,
  `emp_vocational` varchar(100) DEFAULT NULL,
  `emp_vadd` varchar(45) DEFAULT NULL,
  `emp_vocationalcourse` varchar(100) DEFAULT NULL,
  `emp_vocationalyeargrad` varchar(45) DEFAULT NULL,
  `emp_empnum` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `emp_empnum_UNIQUE` (`emp_empnum`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_educational`
--

LOCK TABLES `tbl_educational` WRITE;
/*!40000 ALTER TABLE `tbl_educational` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_educational` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_employee`
--

DROP TABLE IF EXISTS `tbl_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_employee` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `emp_fname` varchar(100) DEFAULT NULL,
  `emp_mname` varchar(100) DEFAULT NULL,
  `emp_lname` varchar(100) DEFAULT NULL,
  `emp_sufix` varchar(100) DEFAULT NULL,
  `emp_gender` varchar(100) DEFAULT NULL,
  `emp_cstatus` varchar(45) DEFAULT NULL,
  `emp_bday` varchar(100) DEFAULT NULL,
  `emp_birthplace` varchar(100) DEFAULT NULL,
  `emp_religion` varchar(100) DEFAULT NULL,
  `emp_nationality` varchar(100) DEFAULT NULL,
  `emp_vaccine` varchar(45) DEFAULT NULL,
  `emp_empnum` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8855 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_employee`
--

LOCK TABLES `tbl_employee` WRITE;
/*!40000 ALTER TABLE `tbl_employee` DISABLE KEYS */;
INSERT INTO `tbl_employee` VALUES (1,'ROLAND','ANTONIO','CAPINPIN','JR','MALE','SINGLE','12/01/1999','TARLAC TARLAC','POGI','FILIPINO','YES','1');
/*!40000 ALTER TABLE `tbl_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_events`
--

DROP TABLE IF EXISTS `tbl_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_events` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `event_title` varchar(255) DEFAULT NULL,
  `event_start` timestamp NULL DEFAULT NULL,
  `event_end` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_events`
--

LOCK TABLES `tbl_events` WRITE;
/*!40000 ALTER TABLE `tbl_events` DISABLE KEYS */;
INSERT INTO `tbl_events` VALUES (36,'dsad','2023-01-08 16:00:00','2023-01-09 16:00:00'),(37,'432','2023-01-08 16:00:00','2023-01-11 16:00:00'),(38,'roland','2023-01-16 16:00:00','2023-01-19 16:00:00'),(39,'dsadasd','2023-01-21 22:00:00','2023-01-22 00:00:00'),(40,'dasdasdsad','2023-01-02 16:00:00','2023-01-07 16:00:00'),(41,'f','2023-02-05 16:00:00','2023-02-15 16:00:00'),(42,'xzx','2023-02-13 16:00:00','2023-02-14 16:00:00'),(43,'birthday :)','2023-03-17 16:00:00','2023-03-18 16:00:00');
/*!40000 ALTER TABLE `tbl_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_govdetails`
--

DROP TABLE IF EXISTS `tbl_govdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_govdetails` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `emp_sss` varchar(45) DEFAULT NULL,
  `emp_tin` varchar(45) DEFAULT NULL,
  `emp_hdmr` varchar(45) DEFAULT NULL,
  `emp_phic` varchar(45) DEFAULT NULL,
  `emp_empnum` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `emp_empnum_UNIQUE` (`emp_empnum`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_govdetails`
--

LOCK TABLES `tbl_govdetails` WRITE;
/*!40000 ALTER TABLE `tbl_govdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_govdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_in`
--

DROP TABLE IF EXISTS `tbl_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_in` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `time_in` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `emp_fname` varchar(45) DEFAULT NULL,
  `emp_empnum` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_in`
--

LOCK TABLES `tbl_in` WRITE;
/*!40000 ALTER TABLE `tbl_in` DISABLE KEYS */;
INSERT INTO `tbl_in` VALUES (1,'2022-11-08 03:49:43','ROLAND','1'),(2,'2022-11-08 03:49:52','ANNE','2'),(3,'2022-11-08 04:02:32','ROLAND','1'),(4,'2022-11-15 02:13:57','ROLAND','1');
/*!40000 ALTER TABLE `tbl_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_onboadinginit`
--

DROP TABLE IF EXISTS `tbl_onboadinginit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_onboadinginit` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `onboard_name` varchar(45) DEFAULT NULL,
  `onboard_position` varchar(45) DEFAULT NULL,
  `onboard_started` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_onboadinginit`
--

LOCK TABLES `tbl_onboadinginit` WRITE;
/*!40000 ALTER TABLE `tbl_onboadinginit` DISABLE KEYS */;
INSERT INTO `tbl_onboadinginit` VALUES (1,'John Doe','Web Dev','March 20, 2022'),(2,'Anna Diaz','Web Dev','September 31, 2021'),(3,'Jay jay Macapagal','Trainee','January 03, 2020');
/*!40000 ALTER TABLE `tbl_onboadinginit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_out`
--

DROP TABLE IF EXISTS `tbl_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_out` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `time_out` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `emp_fname` varchar(45) DEFAULT NULL,
  `emp_empnum` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_out`
--

LOCK TABLES `tbl_out` WRITE;
/*!40000 ALTER TABLE `tbl_out` DISABLE KEYS */;
INSERT INTO `tbl_out` VALUES (1,'2022-11-08 03:49:47','ROLAND','1'),(2,'2022-11-15 02:14:21','ROLAND','1');
/*!40000 ALTER TABLE `tbl_out` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_request`
--

DROP TABLE IF EXISTS `tbl_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_request` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `req_type` varchar(45) DEFAULT NULL,
  `req_from` timestamp NULL DEFAULT NULL,
  `req_to` timestamp NULL DEFAULT NULL,
  `emp_empnum` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `emp_empnum_UNIQUE` (`emp_empnum`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_request`
--

LOCK TABLES `tbl_request` WRITE;
/*!40000 ALTER TABLE `tbl_request` DISABLE KEYS */;
INSERT INTO `tbl_request` VALUES (1,'VL','2021-09-09 16:00:00','2021-09-14 16:00:00','009'),(2,'SL','2022-09-14 16:00:00','2022-09-14 16:00:00','002'),(4,'SL','2022-08-08 16:00:00','2022-08-13 16:00:00','001');
/*!40000 ALTER TABLE `tbl_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_trainee`
--

DROP TABLE IF EXISTS `tbl_trainee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_trainee` (
  `ID` int NOT NULL,
  `trainee_name` varchar(45) DEFAULT NULL,
  `trainee_position` varchar(45) DEFAULT NULL,
  `trainee_dateofapp` varchar(255) DEFAULT NULL,
  `trainee_address` varchar(45) DEFAULT NULL,
  `trainee_course` varchar(45) DEFAULT NULL,
  `trainee_graduatedY` timestamp NULL DEFAULT NULL,
  `emp_emptraineenum` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `emp_emptraineenum_UNIQUE` (`emp_emptraineenum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_trainee`
--

LOCK TABLES `tbl_trainee` WRITE;
/*!40000 ALTER TABLE `tbl_trainee` DISABLE KEYS */;
INSERT INTO `tbl_trainee` VALUES (1,'Roland Capinpin','Web Developer','September 15, 2021','Tarlac,Victoria','IT','2022-02-11 16:00:00','34'),(2,'Jerwil Lapa','Web Developer','January 22, 2021','Caloocan X Cavite X Baclaran','IT','2022-12-08 16:00:00','533');
/*!40000 ALTER TABLE `tbl_trainee` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-26 19:03:20
