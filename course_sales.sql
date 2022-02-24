-- MySQL dump 10.13  Distrib 8.0.28, for macos11.6 (x86_64)
--
-- Host: localhost    Database: course_sales
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content` (
  `content_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int DEFAULT NULL,
  `module_id` int DEFAULT NULL,
  PRIMARY KEY (`content_id`),
  KEY `module_id` (`module_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `content_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`),
  CONSTRAINT `content_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,1,1),(2,1,2),(3,2,3),(4,2,4),(5,2,5),(6,2,6),(7,3,7),(8,3,8),(9,3,9),(10,3,10);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(100) NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Health and Safety'),(2,'Cybersecurity'),(3,'New Starter');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `coursecontent`
--

DROP TABLE IF EXISTS `coursecontent`;
/*!50001 DROP VIEW IF EXISTS `coursecontent`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `coursecontent` AS SELECT 
 1 AS `course_id`,
 1 AS `course_name`,
 1 AS `module_id`,
 1 AS `module_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `member_name` varchar(50) NOT NULL,
  `member_email` varchar(100) NOT NULL,
  `parent_organisation_id` int NOT NULL,
  `admin_permissions` bit(1) DEFAULT b'0',
  `enrollment_date` date DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `parent_organisation_id` (`parent_organisation_id`),
  CONSTRAINT `member_ibfk_1` FOREIGN KEY (`parent_organisation_id`) REFERENCES `organisation` (`organisation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'Bob Smith','bob@trilateral.com',1,_binary '\0',NULL),(2,'Angela Bobs','Angela@trilateral.com',1,_binary '\0',NULL),(3,'Robert Adams','robert@trilateral.com',1,_binary '\0',NULL),(4,'Jeremy Hunt','jeremy@trilateral.com',1,_binary '\0',NULL),(5,'Lorraine Hall','Lorraine@trilateral.com',1,_binary '',NULL),(6,'Chris Borough','Chris@trilateral.com',1,_binary '\0',NULL),(7,'Ryan Reynolds','ryan@TB.com',2,_binary '\0',NULL),(8,'Andres Boyd','Andes@TB.com',2,_binary '\0',NULL),(9,'Chris Hampson','chris@TB.com',2,_binary '\0',NULL);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module` (
  `module_id` int NOT NULL AUTO_INCREMENT,
  `module_name` varchar(100) NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` VALUES (1,'Health and Safety Basics'),(2,'Fire Safety'),(3,'Phishing Attacks'),(4,'Internet Safety'),(5,'Using the VPN'),(6,'Enabling 2FA'),(7,'Welcome to the company'),(8,'How to book leave'),(9,'Your induction process'),(10,'Your probation review');
/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organisation`
--

DROP TABLE IF EXISTS `organisation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organisation` (
  `organisation_id` int NOT NULL AUTO_INCREMENT,
  `organisation_name` varchar(50) NOT NULL,
  `places_purchased` int DEFAULT NULL,
  `places_used` int DEFAULT NULL,
  PRIMARY KEY (`organisation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organisation`
--

LOCK TABLES `organisation` WRITE;
/*!40000 ALTER TABLE `organisation` DISABLE KEYS */;
INSERT INTO `organisation` VALUES (1,'Trilateral',10,8),(2,'Bot Platform',1540,360),(3,'Macdonals',88,22),(4,'Money Matters',15,4),(5,'Air Travel UK',10,0),(6,'SCDC',8,8);
/*!40000 ALTER TABLE `organisation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `organisationlist`
--

DROP TABLE IF EXISTS `organisationlist`;
/*!50001 DROP VIEW IF EXISTS `organisationlist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `organisationlist` AS SELECT 
 1 AS `organisation_id`,
 1 AS `organisation_name`,
 1 AS `member_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `relationships`
--

DROP TABLE IF EXISTS `relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relationships` (
  `relationship_id` int NOT NULL AUTO_INCREMENT,
  `member_rel_id` int DEFAULT NULL,
  `line_manager_id` int DEFAULT NULL,
  `direct_reports_id` int DEFAULT NULL,
  PRIMARY KEY (`relationship_id`),
  KEY `member_rel_id` (`member_rel_id`),
  KEY `line_manager_id` (`line_manager_id`),
  KEY `direct_reports_id` (`direct_reports_id`),
  CONSTRAINT `relationships_ibfk_1` FOREIGN KEY (`member_rel_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `relationships_ibfk_2` FOREIGN KEY (`line_manager_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `relationships_ibfk_3` FOREIGN KEY (`direct_reports_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationships`
--

LOCK TABLES `relationships` WRITE;
/*!40000 ALTER TABLE `relationships` DISABLE KEYS */;
INSERT INTO `relationships` VALUES (1,1,6,2),(2,2,1,NULL),(3,3,6,NULL),(4,1,NULL,4),(5,5,6,NULL);
/*!40000 ALTER TABLE `relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `results` (
  `result_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `module_id` int DEFAULT NULL,
  `student_module_score` int DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `student_passed` bit(1) DEFAULT NULL,
  PRIMARY KEY (`result_id`),
  KEY `student_id` (`student_id`),
  KEY `module_id` (`module_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `results_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `results_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`),
  CONSTRAINT `results_ibfk_3` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `results_chk_1` CHECK (((`student_module_score` >= 0) and (`student_module_score` <= 100)))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (1,1,1,95,NULL,NULL),(2,1,2,90,NULL,NULL),(3,1,NULL,NULL,1,_binary ''),(4,3,1,95,NULL,NULL),(5,3,2,10,NULL,NULL),(6,3,NULL,NULL,1,_binary '\0'),(7,2,5,75,NULL,NULL),(8,5,5,95,NULL,NULL),(9,5,6,95,NULL,NULL),(10,5,7,95,NULL,NULL),(11,5,8,95,NULL,NULL),(12,5,9,95,NULL,NULL);
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `trilateralscores`
--

DROP TABLE IF EXISTS `trilateralscores`;
/*!50001 DROP VIEW IF EXISTS `trilateralscores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `trilateralscores` AS SELECT 
 1 AS `member_name`,
 1 AS `module_id`,
 1 AS `module_name`,
 1 AS `student_module_score`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `trilateralstaff`
--

DROP TABLE IF EXISTS `trilateralstaff`;
/*!50001 DROP VIEW IF EXISTS `trilateralstaff`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `trilateralstaff` AS SELECT 
 1 AS `organisation_id`,
 1 AS `member_id`,
 1 AS `member_name`,
 1 AS `course_id`,
 1 AS `course_name`,
 1 AS `module_id`,
 1 AS `module_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `coursecontent`
--

/*!50001 DROP VIEW IF EXISTS `coursecontent`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `coursecontent` (`course_id`,`course_name`,`module_id`,`module_name`) AS select `content`.`course_id` AS `course_id`,`content`.`module_id` AS `module_id`,`course`.`course_name` AS `course_name`,`module`.`module_name` AS `module_name` from ((`content` join `course`) join `module`) where ((`content`.`course_id` = `course`.`course_id`) and (`content`.`module_id` = `module`.`module_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `organisationlist`
--

/*!50001 DROP VIEW IF EXISTS `organisationlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `organisationlist` (`organisation_id`,`organisation_name`,`member_name`) AS select `organisation`.`organisation_id` AS `organisation_id`,`organisation`.`organisation_name` AS `organisation_name`,`member`.`member_name` AS `member_name` from (`organisation` join `member`) where (`organisation`.`organisation_id` = `member`.`parent_organisation_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `trilateralscores`
--

/*!50001 DROP VIEW IF EXISTS `trilateralscores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `trilateralscores` (`member_name`,`module_id`,`module_name`,`student_module_score`) AS select `member`.`member_name` AS `member_name`,`results`.`module_id` AS `module_id`,`module`.`module_name` AS `module_name`,`results`.`student_module_score` AS `student_module_score` from (((`organisation` join `results`) join `module`) join `member`) where ((`organisation`.`organisation_id` = 1) and (`member`.`member_id` = `results`.`student_id`) and (`results`.`student_module_score` is not null) and (`module`.`module_id` = `results`.`module_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `trilateralstaff`
--

/*!50001 DROP VIEW IF EXISTS `trilateralstaff`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `trilateralstaff` (`organisation_id`,`member_id`,`member_name`,`course_id`,`course_name`,`module_id`,`module_name`) AS select `organisation`.`organisation_id` AS `organisation_id`,`member`.`member_id` AS `member_id`,`member`.`member_name` AS `member_name`,`course`.`course_id` AS `course_id`,`course`.`course_name` AS `course_name`,`module`.`module_id` AS `module_id`,`module`.`module_name` AS `module_name` from ((((`organisation` join `member`) join `content`) join `course`) join `module`) where ((`organisation`.`organisation_id` = 1) and (`organisation`.`organisation_id` = `member`.`parent_organisation_id`) and (`content`.`course_id` = `course`.`course_id`) and (`content`.`module_id` = `module`.`module_id`)) */;
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

-- Dump completed on 2022-02-24 17:27:54
