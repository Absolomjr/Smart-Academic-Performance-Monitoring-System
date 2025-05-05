-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: academicperformancemonitoringsystem
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Temporary view structure for view `adminreportsview`
--

DROP TABLE IF EXISTS `adminreportsview`;
/*!50001 DROP VIEW IF EXISTS `adminreportsview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `adminreportsview` AS SELECT 
 1 AS `AdminID`,
 1 AS `AdminName`,
 1 AS `ReportID`,
 1 AS `ReportDate`,
 1 AS `PerformanceSummary`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `AdminID` varchar(30) NOT NULL,
  `UserID` varchar(30) DEFAULT NULL,
  `RoleDescription` text,
  PRIMARY KEY (`AdminID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES ('A001','U001','Responsible for overseeing the entire academic management system and ensuring smooth operations.'),('A002','U002','Responsible for coordinating academic policies and handling administrative functions for students and staff.');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;

--
-- Temporary view structure for view `alert_type_count`
--

DROP TABLE IF EXISTS `alert_type_count`;
/*!50001 DROP VIEW IF EXISTS `alert_type_count`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `alert_type_count` AS SELECT 
 1 AS `Type`,
 1 AS `total_alerts`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alerts` (
  `AlertID` varchar(30) NOT NULL,
  `StudentID` varchar(30) DEFAULT NULL,
  `Type` enum('Low Performance','Absenteeism') NOT NULL,
  `Message` text,
  `Timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`AlertID`),
  KEY `StudentID` (`StudentID`),
  CONSTRAINT `alerts_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`) ON DELETE CASCADE,
  CONSTRAINT `alerts_message_length` CHECK ((length(`Message`) > 5)),
  CONSTRAINT `alerts_type_check` CHECK ((`Type` in (_utf8mb4'Low Performance',_utf8mb4'Absenteeism')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
INSERT INTO `alerts` VALUES ('AL001','ST001','Low Performance','Student is underperforming. Immediate academic support needed.','2025-04-01 13:14:56'),('AL002','ST002','Absenteeism','Student has been absent frequently. Parent intervention required.','2025-04-01 13:14:56'),('AL003','ST003','Low Performance','Student is underperforming. Immediate academic support needed.','2025-04-01 13:14:56'),('AL004','ST004','Absenteeism','Student has been absent frequently. Parent intervention required.','2025-04-01 13:14:56'),('AL005','ST005','Low Performance','Student is underperforming. Immediate academic support needed.','2025-04-01 13:14:56'),('AL006','ST006','Absenteeism','Student has been absent frequently. Parent intervention required.','2025-04-01 13:14:56'),('AL007','ST007','Low Performance','Student is underperforming. Immediate academic support needed.','2025-04-01 13:14:56');
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `AttendanceID` varchar(30) NOT NULL,
  `StudentID` varchar(30) DEFAULT NULL,
  `Date` date NOT NULL,
  `Status` enum('Present','Absent') NOT NULL,
  PRIMARY KEY (`AttendanceID`),
  KEY `StudentID` (`StudentID`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`) ON DELETE CASCADE,
  CONSTRAINT `attendance_status_check` CHECK ((`Status` in (_utf8mb4'Present',_utf8mb4'Absent')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES ('AT001','ST001','2024-06-15','Present'),('AT002','ST002','2024-06-15','Absent'),('AT003','ST003','2024-06-16','Present'),('AT004','ST004','2024-06-16','Absent'),('AT005','ST005','2024-06-17','Present'),('AT006','ST006','2024-06-17','Present'),('AT007','ST007','2024-06-18','Absent');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Generate_Alert_Absenteeism` AFTER INSERT ON `attendance` FOR EACH ROW BEGIN
    IF NEW.Status = 'Absent' THEN
        INSERT INTO Alerts (AlertID, StudentID, Type, Message)
        VALUES (UUID(), NEW.StudentID, 'Absenteeism', 'Student was absent on ' || NEW.Date);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `attendancerecords`
--

DROP TABLE IF EXISTS `attendancerecords`;
/*!50001 DROP VIEW IF EXISTS `attendancerecords`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `attendancerecords` AS SELECT 
 1 AS `AttendanceID`,
 1 AS `StudentID`,
 1 AS `Date`,
 1 AS `Status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `case_alerts_urgency`
--

DROP TABLE IF EXISTS `case_alerts_urgency`;
/*!50001 DROP VIEW IF EXISTS `case_alerts_urgency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `case_alerts_urgency` AS SELECT 
 1 AS `AlertID`,
 1 AS `StudentID`,
 1 AS `Type`,
 1 AS `Message`,
 1 AS `Timestamp`,
 1 AS `UrgencyLevel`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `case_student_performance`
--

DROP TABLE IF EXISTS `case_student_performance`;
/*!50001 DROP VIEW IF EXISTS `case_student_performance`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `case_student_performance` AS SELECT 
 1 AS `GradeID`,
 1 AS `StudentID`,
 1 AS `SubjectID`,
 1 AS `Score`,
 1 AS `PerformanceCategory`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grades` (
  `GradeID` varchar(30) NOT NULL,
  `StudentID` varchar(30) DEFAULT NULL,
  `SubjectID` varchar(30) DEFAULT NULL,
  `Score` decimal(5,2) DEFAULT NULL,
  `ExamDate` date DEFAULT NULL,
  PRIMARY KEY (`GradeID`),
  KEY `StudentID` (`StudentID`),
  KEY `SubjectID` (`SubjectID`),
  CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`) ON DELETE CASCADE,
  CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`SubjectID`) REFERENCES `subjects` (`SubjectID`) ON DELETE CASCADE,
  CONSTRAINT `grades_chk_1` CHECK ((`Score` between 0 and 100)),
  CONSTRAINT `grades_score_range` CHECK ((`Score` between 0 and 100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
INSERT INTO `grades` VALUES ('G001','ST001','S001',85.50,'2024-06-15'),('G002','ST002','S002',35.00,'2024-06-16'),('G003','ST003','S003',78.20,'2024-06-17'),('G004','ST004','S004',82.30,'2024-06-18'),('G005','ST005','S005',88.50,'2023-06-15'),('G006','ST006','S006',91.00,'2023-06-16'),('G007','ST007','S001',34.50,'2024-06-19');
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Generate_Alert_Low_Performance` AFTER INSERT ON `grades` FOR EACH ROW BEGIN
    IF NEW.Score < 40 THEN
        INSERT INTO Alerts (AlertID, StudentID, Type, Message)
        VALUES (UUID(), NEW.StudentID, 'Low Performance', 'Student scored below 40%. Immediate attention required.');
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `high_absenteeism_students`
--

DROP TABLE IF EXISTS `high_absenteeism_students`;
/*!50001 DROP VIEW IF EXISTS `high_absenteeism_students`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `high_absenteeism_students` AS SELECT 
 1 AS `StudentID`,
 1 AS `total_absences`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `low_performance_students`
--

DROP TABLE IF EXISTS `low_performance_students`;
/*!50001 DROP VIEW IF EXISTS `low_performance_students`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `low_performance_students` AS SELECT 
 1 AS `total_low_performance_students`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `parentdetails`
--

DROP TABLE IF EXISTS `parentdetails`;
/*!50001 DROP VIEW IF EXISTS `parentdetails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `parentdetails` AS SELECT 
 1 AS `ParentID`,
 1 AS `UserID`,
 1 AS `ContactInfo`,
 1 AS `Occupation`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `parents`
--

DROP TABLE IF EXISTS `parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parents` (
  `ParentID` varchar(30) NOT NULL,
  `UserID` varchar(30) DEFAULT NULL,
  `Occupation` varchar(100) DEFAULT NULL,
  `ContactInfo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ParentID`),
  UNIQUE KEY `parents_contact_unique` (`ContactInfo`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `parents_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE,
  CONSTRAINT `parents_occupation_not_empty` CHECK ((`Occupation` <> _utf8mb4''))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parents`
--

/*!40000 ALTER TABLE `parents` DISABLE KEYS */;
INSERT INTO `parents` VALUES ('P001','U016','Business Owner','+256716789012'),('P002','U017','Engineer','+256717890123'),('P003','U018','Teacher','+256718901234'),('P004','U019','Doctor','+256719012345'),('P005','U020','Journalist','+256720123456'),('P006','U021','Social Worker','+256721234567');
/*!40000 ALTER TABLE `parents` ENABLE KEYS */;

--
-- Temporary view structure for view `parentstudentview`
--

DROP TABLE IF EXISTS `parentstudentview`;
/*!50001 DROP VIEW IF EXISTS `parentstudentview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `parentstudentview` AS SELECT 
 1 AS `ParentID`,
 1 AS `ParentName`,
 1 AS `ContactInfo`,
 1 AS `StudentID`,
 1 AS `StudentName`,
 1 AS `Class`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `ReportID` varchar(30) NOT NULL,
  `StudentID` varchar(30) DEFAULT NULL,
  `GeneratedBy` varchar(30) DEFAULT NULL,
  `ReportDate` date DEFAULT (curdate()),
  `PerformanceSummary` text,
  PRIMARY KEY (`ReportID`),
  KEY `StudentID` (`StudentID`),
  KEY `GeneratedBy` (`GeneratedBy`),
  CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`) ON DELETE CASCADE,
  CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`GeneratedBy`) REFERENCES `admins` (`AdminID`) ON DELETE CASCADE,
  CONSTRAINT `reports_performance_summary_length` CHECK ((length(`PerformanceSummary`) > 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES ('RP001','ST001','A001','2025-04-01','Student has shown excellent performance in all subjects.'),('RP002','ST002','A002','2025-04-01','Student needs improvement in mathematics and science.'),('RP003','ST003','A001','2025-04-01','Student has been consistent with good performance.'),('RP004','ST004','A002','2025-04-01','Student has been absent frequently, affecting performance.'),('RP005','ST005','A001','2025-04-01','Student is improving but requires extra attention in physics.'),('RP006','ST006','A002','2025-04-01','Student has outstanding grades and great participation in class.'),('RP007','ST007','A001','2025-04-01','Student is at risk of failing due to poor performance in multiple subjects.');
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Update_Report_Date` BEFORE UPDATE ON `reports` FOR EACH ROW BEGIN
    SET NEW.ReportDate = CURDATE();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `reports_per_admin`
--

DROP TABLE IF EXISTS `reports_per_admin`;
/*!50001 DROP VIEW IF EXISTS `reports_per_admin`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `reports_per_admin` AS SELECT 
 1 AS `GeneratedBy`,
 1 AS `total_reports`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `score_stats`
--

DROP TABLE IF EXISTS `score_stats`;
/*!50001 DROP VIEW IF EXISTS `score_stats`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `score_stats` AS SELECT 
 1 AS `highest_score`,
 1 AS `lowest_score`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `studentattendanceview`
--

DROP TABLE IF EXISTS `studentattendanceview`;
/*!50001 DROP VIEW IF EXISTS `studentattendanceview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `studentattendanceview` AS SELECT 
 1 AS `StudentID`,
 1 AS `StudentName`,
 1 AS `AttendanceID`,
 1 AS `Date`,
 1 AS `Status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `studentdetails`
--

DROP TABLE IF EXISTS `studentdetails`;
/*!50001 DROP VIEW IF EXISTS `studentdetails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `studentdetails` AS SELECT 
 1 AS `StudentID`,
 1 AS `UserID`,
 1 AS `Class`,
 1 AS `EnrollmentYear`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `studentgrades`
--

DROP TABLE IF EXISTS `studentgrades`;
/*!50001 DROP VIEW IF EXISTS `studentgrades`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `studentgrades` AS SELECT 
 1 AS `GradeID`,
 1 AS `StudentID`,
 1 AS `SubjectID`,
 1 AS `Score`,
 1 AS `ExamDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `studentgradesview`
--

DROP TABLE IF EXISTS `studentgradesview`;
/*!50001 DROP VIEW IF EXISTS `studentgradesview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `studentgradesview` AS SELECT 
 1 AS `StudentID`,
 1 AS `StudentName`,
 1 AS `GradeID`,
 1 AS `SubjectID`,
 1 AS `Score`,
 1 AS `ExamDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `studentparentview`
--

DROP TABLE IF EXISTS `studentparentview`;
/*!50001 DROP VIEW IF EXISTS `studentparentview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `studentparentview` AS SELECT 
 1 AS `StudentID`,
 1 AS `StudentName`,
 1 AS `ParentID`,
 1 AS `ParentName`,
 1 AS `ParentContact`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `StudentID` varchar(30) NOT NULL,
  `UserID` varchar(30) DEFAULT NULL,
  `Class` varchar(50) NOT NULL,
  `ParentID` varchar(30) DEFAULT NULL,
  `EnrollmentYear` year NOT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `UserID` (`UserID`),
  KEY `ParentID` (`ParentID`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE,
  CONSTRAINT `students_ibfk_2` FOREIGN KEY (`ParentID`) REFERENCES `parents` (`ParentID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES ('ST001','U009','Year 1 - Computer Science','P001',2024),('ST002','U010','Year 1 - Engineering','P002',2024),('ST003','U011','Year 1 - Business','P003',2024),('ST004','U012','Year 1 - Journalism','P004',2024),('ST005','U013','Year 2 - Medicine','P005',2023),('ST006','U014','Year 2 - Social Work','P006',2023),('ST007','U015','Year 1 - Computing','P001',2024);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;

--
-- Temporary view structure for view `students_per_class`
--

DROP TABLE IF EXISTS `students_per_class`;
/*!50001 DROP VIEW IF EXISTS `students_per_class`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `students_per_class` AS SELECT 
 1 AS `Class`,
 1 AS `total_students`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `studentuserview`
--

DROP TABLE IF EXISTS `studentuserview`;
/*!50001 DROP VIEW IF EXISTS `studentuserview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `studentuserview` AS SELECT 
 1 AS `StudentID`,
 1 AS `StudentName`,
 1 AS `Email`,
 1 AS `Contact`,
 1 AS `Class`,
 1 AS `EnrollmentYear`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `subject_avg_score`
--

DROP TABLE IF EXISTS `subject_avg_score`;
/*!50001 DROP VIEW IF EXISTS `subject_avg_score`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `subject_avg_score` AS SELECT 
 1 AS `SubjectID`,
 1 AS `avg_score`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `SubjectID` varchar(30) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `TeacherID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`SubjectID`),
  UNIQUE KEY `subjects_name_unique` (`Name`),
  KEY `TeacherID` (`TeacherID`),
  CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`TeacherID`) REFERENCES `teachers` (`TeacherID`) ON DELETE CASCADE,
  CONSTRAINT `subjects_name_not_empty` CHECK ((`Name` <> _utf8mb4''))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES ('S001','Introduction to Computing','T001'),('S002','Advanced Engineering Mathematics','T002'),('S003','Principles of Business','T003'),('S004','Journalism and Media Studies','T004'),('S005','Medical Terminology','T005'),('S006','Social Work and Welfare','T006');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;

--
-- Temporary view structure for view `subjectteacherdetails`
--

DROP TABLE IF EXISTS `subjectteacherdetails`;
/*!50001 DROP VIEW IF EXISTS `subjectteacherdetails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `subjectteacherdetails` AS SELECT 
 1 AS `SubjectID`,
 1 AS `SubjectName`,
 1 AS `TeacherID`,
 1 AS `TeacherName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `subjectteacherview`
--

DROP TABLE IF EXISTS `subjectteacherview`;
/*!50001 DROP VIEW IF EXISTS `subjectteacherview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `subjectteacherview` AS SELECT 
 1 AS `TeacherID`,
 1 AS `TeacherName`,
 1 AS `SubjectID`,
 1 AS `SubjectName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `teacherdepartmentview`
--

DROP TABLE IF EXISTS `teacherdepartmentview`;
/*!50001 DROP VIEW IF EXISTS `teacherdepartmentview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `teacherdepartmentview` AS SELECT 
 1 AS `TeacherID`,
 1 AS `TeacherName`,
 1 AS `Department`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `teacherdetails`
--

DROP TABLE IF EXISTS `teacherdetails`;
/*!50001 DROP VIEW IF EXISTS `teacherdetails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `teacherdetails` AS SELECT 
 1 AS `TeacherID`,
 1 AS `UserID`,
 1 AS `Department`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `TeacherID` varchar(30) NOT NULL,
  `UserID` varchar(30) DEFAULT NULL,
  `Department` varchar(100) NOT NULL,
  PRIMARY KEY (`TeacherID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE,
  CONSTRAINT `teachers_department_not_empty` CHECK ((`Department` <> _utf8mb4''))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES ('T001','U003','Computing'),('T002','U004','Engineering'),('T003','U005','Business'),('T004','U006','Journalism'),('T005','U007','Medicine'),('T006','U008','Social Work');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;

--
-- Temporary view structure for view `total_subjects`
--

DROP TABLE IF EXISTS `total_subjects`;
/*!50001 DROP VIEW IF EXISTS `total_subjects`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `total_subjects` AS SELECT 
 1 AS `distinct_subjects`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `total_users`
--

DROP TABLE IF EXISTS `total_users`;
/*!50001 DROP VIEW IF EXISTS `total_users`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `total_users` AS SELECT 
 1 AS `total_users`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_role_count`
--

DROP TABLE IF EXISTS `user_role_count`;
/*!50001 DROP VIEW IF EXISTS `user_role_count`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_role_count` AS SELECT 
 1 AS `Role`,
 1 AS `total_users`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UserID` varchar(30) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Role` enum('Admin','Teacher','Student','Parent') NOT NULL,
  `Contact` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `users_email_unique` (`Email`),
  UNIQUE KEY `users_contact_unique` (`Contact`),
  CONSTRAINT `users_email_format` CHECK ((`Email` like _utf8mb4'%@%')),
  CONSTRAINT `users_name` CHECK ((`name` = upper(`name`))),
  CONSTRAINT `users_role_check` CHECK ((`Role` in (_utf8mb4'Admin',_utf8mb4'Teacher',_utf8mb4'Student',_utf8mb4'Parent')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('U001','Solomy Sanyu','solomy.sanyu@gmail.com','hashedpassword123','Admin','+256701234567'),('U002','Dorcus Kaggoya','dorcus.kaggoya@gmail.com','hashedpassword456','Admin','+256702345678'),('U003','James Okello','james.okello@gmail.com','hashedpassword111','Teacher','+256703456789'),('U004','Grace Nabwire','grace.nabwire@gmail.com','hashedpassword222','Teacher','+256704567890'),('U005','Daniel Mugisha','daniel.mugisha@gmail.com','hashedpassword333','Teacher','+256705678901'),('U006','Harriet Namubiru','harriet.namubiru@gmail.com','hashedpassword444','Teacher','+256706789012'),('U007','Robert Ssenyonga','robert.ssenyonga@gmail.com','hashedpassword555','Teacher','+256707890123'),('U008','Brenda Nakato','brenda.nakato@gmail.com','hashedpassword666','Teacher','+256708901234'),('U009','Travis Lufene','travis.lufene@gmail.com','hashedpassword777','Student','+256709012345'),('U010','Lynn Amoit','lynn.amoit@gmail.com','hashedpassword888','Student','+256710123456'),('U011','Humphrey Mubiru','humphrey.mubiru@gmail.com','hashedpassword999','Student','+256711234567'),('U012','Denise Priscilla','denise.priscilla@gmail.com','hashedpassword101','Student','+256712345678'),('U013','Allan Ssebatta','allan.ssebatta@gmail.com','hashedpassword202','Student','+256713456789'),('U014','Nicole Mbabazi','nicole.mbabazi@gmail.com','hashedpassword303','Student','+256714567890'),('U015','Emmanuel Kizito','emmanuel.kizito@gmail.com','hashedpassword404','Student','+256715678901'),('U016','Margaret Tumwine','margaret.tumwine@gmail.com','hashedpassword505','Parent','+256716789012'),('U017','Joseph Lwanga','joseph.lwanga@gmail.com','hashedpassword606','Parent','+256717890123'),('U018','Beatrice Namaganda','beatrice.namaganda@gmail.com','hashedpassword707','Parent','+256718901234'),('U019','Fredrick Mugerwa','fredrick.mugerwa@gmail.com','hashedpassword808','Parent','+256719012345'),('U020','Annet Nakiyingi','annet.nakiyingi@gmail.com','hashedpassword909','Parent','+256720123456'),('U021','John Kateregga','john.kateregga@gmail.com','hashedpassword010','Parent','+256721234567'),('U022','John Doe','john@gmail.com','securepassword','Teacher','0754610909');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Default_User_Password` BEFORE INSERT ON `users` FOR EACH ROW BEGIN
    IF NEW.Password IS NULL OR NEW.Password = '' THEN
        SET NEW.Password = SHA2('ChangeMe123', 256);
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Prevent_Admin_Deletion` BEFORE DELETE ON `users` FOR EACH ROW BEGIN
    IF OLD.Role = 'Admin' THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Admins cannot be deleted!';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'academicperformancemonitoringsystem'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddUser`(
    IN p_UserID VARCHAR(30),
    IN p_Name VARCHAR(100),
    IN p_Email VARCHAR(100),
    IN p_Password VARCHAR(255),
    IN p_Role ENUM('Admin', 'Teacher', 'Student', 'Parent'),
    IN p_Contact VARCHAR(50)
)
BEGIN
    INSERT INTO Users (UserID, Name, Email, Password, Role, Contact)
    VALUES (p_UserID, p_Name, p_Email, p_Password, p_Role, p_Contact);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CountUsersByRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CountUsersByRole`(IN p_Role ENUM('Admin', 'Teacher', 'Student', 'Parent'))
BEGIN
    SELECT COUNT(*) AS TotalUsers FROM Users WHERE Role = p_Role;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetReportsByAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetReportsByAdmin`(IN p_AdminID VARCHAR(30))
BEGIN
    SELECT r.ReportID, r.StudentID, u.Name AS StudentName, r.ReportDate, r.PerformanceSummary
    FROM Reports r
    INNER JOIN Students s ON r.StudentID = s.StudentID
    INNER JOIN Users u ON s.UserID = u.UserID
    WHERE r.GeneratedBy = p_AdminID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetStudentAlerts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetStudentAlerts`(IN p_StudentID VARCHAR(30))
BEGIN
    SELECT AlertID, Type, Message, Timestamp
    FROM Alerts
    WHERE StudentID = p_StudentID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetStudentPerformance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetStudentPerformance`(IN p_StudentID VARCHAR(30))
BEGIN
    SELECT s.Name AS Subject, g.Score, g.ExamDate
    FROM Grades g
    INNER JOIN Subjects s ON g.SubjectID = s.SubjectID
    WHERE g.StudentID = p_StudentID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetStudentsByClass` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetStudentsByClass`(IN p_Class VARCHAR(50))
BEGIN
    SELECT u.UserID, u.Name, s.StudentID, s.Class, s.EnrollmentYear
    FROM Students s
    INNER JOIN Users u ON s.UserID = u.UserID
    WHERE s.Class = p_Class;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetSubjectsByTeacher` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetSubjectsByTeacher`(IN p_TeacherID VARCHAR(30))
BEGIN
    SELECT s.SubjectID, s.Name AS SubjectName, t.TeacherID, u.Name AS TeacherName
    FROM Subjects s
    INNER JOIN Teachers t ON s.TeacherID = t.TeacherID
    INNER JOIN Users u ON t.UserID = u.UserID
    WHERE t.TeacherID = p_TeacherID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateStudentReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateStudentReport`(
    IN p_ReportID VARCHAR(30),
    IN p_NewPerformanceSummary TEXT
)
BEGIN
    UPDATE Reports 
    SET PerformanceSummary = p_NewPerformanceSummary, ReportDate = CURDATE()
    WHERE ReportID = p_ReportID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `adminreportsview`
--

/*!50001 DROP VIEW IF EXISTS `adminreportsview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `adminreportsview` AS select `a`.`AdminID` AS `AdminID`,`u`.`Name` AS `AdminName`,`r`.`ReportID` AS `ReportID`,`r`.`ReportDate` AS `ReportDate`,`r`.`PerformanceSummary` AS `PerformanceSummary` from (`users` `u` left join (`admins` `a` left join `reports` `r` on((`r`.`GeneratedBy` = `a`.`AdminID`))) on((`a`.`UserID` = `u`.`UserID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `alert_type_count`
--

/*!50001 DROP VIEW IF EXISTS `alert_type_count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `alert_type_count` AS select `alerts`.`Type` AS `Type`,count(`alerts`.`AlertID`) AS `total_alerts` from `alerts` group by `alerts`.`Type` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `attendancerecords`
--

/*!50001 DROP VIEW IF EXISTS `attendancerecords`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `attendancerecords` AS select `attendance`.`AttendanceID` AS `AttendanceID`,`attendance`.`StudentID` AS `StudentID`,`attendance`.`Date` AS `Date`,`attendance`.`Status` AS `Status` from `attendance` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `case_alerts_urgency`
--

/*!50001 DROP VIEW IF EXISTS `case_alerts_urgency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `case_alerts_urgency` AS select `alerts`.`AlertID` AS `AlertID`,`alerts`.`StudentID` AS `StudentID`,`alerts`.`Type` AS `Type`,`alerts`.`Message` AS `Message`,`alerts`.`Timestamp` AS `Timestamp`,(case when (`alerts`.`Type` = 'Low Performance') then 'High Urgency' when (`alerts`.`Type` = 'Absenteeism') then 'Medium Urgency' else 'Unknown' end) AS `UrgencyLevel` from `alerts` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `case_student_performance`
--

/*!50001 DROP VIEW IF EXISTS `case_student_performance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `case_student_performance` AS select `g`.`GradeID` AS `GradeID`,`g`.`StudentID` AS `StudentID`,`g`.`SubjectID` AS `SubjectID`,`g`.`Score` AS `Score`,(case when (`g`.`Score` >= 85) then 'Excellent' when (`g`.`Score` >= 70) then 'Good' when (`g`.`Score` >= 50) then 'Average' when (`g`.`Score` >= 40) then 'Needs Improvement' else 'Fail' end) AS `PerformanceCategory` from `grades` `g` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `high_absenteeism_students`
--

/*!50001 DROP VIEW IF EXISTS `high_absenteeism_students`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `high_absenteeism_students` AS select `attendance`.`StudentID` AS `StudentID`,count(`attendance`.`AttendanceID`) AS `total_absences` from `attendance` where (`attendance`.`Status` = 'Absent') group by `attendance`.`StudentID` having (count(`attendance`.`AttendanceID`) > (select (count(`attendance`.`AttendanceID`) / 2) from `attendance` where (`attendance`.`Status` = 'Present'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `low_performance_students`
--

/*!50001 DROP VIEW IF EXISTS `low_performance_students`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `low_performance_students` AS select count(`grades`.`StudentID`) AS `total_low_performance_students` from `grades` where (`grades`.`Score` < 50) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `parentdetails`
--

/*!50001 DROP VIEW IF EXISTS `parentdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `parentdetails` AS select `parents`.`ParentID` AS `ParentID`,`parents`.`UserID` AS `UserID`,`parents`.`ContactInfo` AS `ContactInfo`,`parents`.`Occupation` AS `Occupation` from `parents` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `parentstudentview`
--

/*!50001 DROP VIEW IF EXISTS `parentstudentview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `parentstudentview` AS select `p`.`ParentID` AS `ParentID`,`pu`.`Name` AS `ParentName`,`p`.`ContactInfo` AS `ContactInfo`,`s`.`StudentID` AS `StudentID`,`u`.`Name` AS `StudentName`,`s`.`Class` AS `Class` from (((`parents` `p` join `users` `pu` on((`p`.`UserID` = `pu`.`UserID`))) join `students` `s` on((`p`.`ParentID` = `s`.`ParentID`))) join `users` `u` on((`s`.`UserID` = `u`.`UserID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reports_per_admin`
--

/*!50001 DROP VIEW IF EXISTS `reports_per_admin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reports_per_admin` AS select `reports`.`GeneratedBy` AS `GeneratedBy`,count(`reports`.`ReportID`) AS `total_reports` from `reports` group by `reports`.`GeneratedBy` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `score_stats`
--

/*!50001 DROP VIEW IF EXISTS `score_stats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `score_stats` AS select max(`grades`.`Score`) AS `highest_score`,min(`grades`.`Score`) AS `lowest_score` from `grades` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `studentattendanceview`
--

/*!50001 DROP VIEW IF EXISTS `studentattendanceview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `studentattendanceview` AS select `s`.`StudentID` AS `StudentID`,`u`.`Name` AS `StudentName`,`a`.`AttendanceID` AS `AttendanceID`,`a`.`Date` AS `Date`,`a`.`Status` AS `Status` from ((`students` `s` left join `users` `u` on((`s`.`UserID` = `u`.`UserID`))) left join `attendance` `a` on((`s`.`StudentID` = `a`.`StudentID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `studentdetails`
--

/*!50001 DROP VIEW IF EXISTS `studentdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `studentdetails` AS select `students`.`StudentID` AS `StudentID`,`students`.`UserID` AS `UserID`,`students`.`Class` AS `Class`,`students`.`EnrollmentYear` AS `EnrollmentYear` from `students` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `studentgrades`
--

/*!50001 DROP VIEW IF EXISTS `studentgrades`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `studentgrades` AS select `grades`.`GradeID` AS `GradeID`,`grades`.`StudentID` AS `StudentID`,`grades`.`SubjectID` AS `SubjectID`,`grades`.`Score` AS `Score`,`grades`.`ExamDate` AS `ExamDate` from `grades` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `studentgradesview`
--

/*!50001 DROP VIEW IF EXISTS `studentgradesview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `studentgradesview` AS select `s`.`StudentID` AS `StudentID`,`u`.`Name` AS `StudentName`,`g`.`GradeID` AS `GradeID`,`g`.`SubjectID` AS `SubjectID`,`g`.`Score` AS `Score`,`g`.`ExamDate` AS `ExamDate` from ((`students` `s` left join `users` `u` on((`s`.`UserID` = `u`.`UserID`))) left join `grades` `g` on((`s`.`StudentID` = `g`.`StudentID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `studentparentview`
--

/*!50001 DROP VIEW IF EXISTS `studentparentview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `studentparentview` AS select `s`.`StudentID` AS `StudentID`,`u`.`Name` AS `StudentName`,`p`.`ParentID` AS `ParentID`,`pu`.`Name` AS `ParentName`,`p`.`ContactInfo` AS `ParentContact` from (((`students` `s` left join `users` `u` on((`s`.`UserID` = `u`.`UserID`))) left join `parents` `p` on((`s`.`ParentID` = `p`.`ParentID`))) left join `users` `pu` on((`p`.`UserID` = `pu`.`UserID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `students_per_class`
--

/*!50001 DROP VIEW IF EXISTS `students_per_class`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `students_per_class` AS select `students`.`Class` AS `Class`,count(`students`.`StudentID`) AS `total_students` from `students` group by `students`.`Class` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `studentuserview`
--

/*!50001 DROP VIEW IF EXISTS `studentuserview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `studentuserview` AS select `students`.`StudentID` AS `StudentID`,`users`.`Name` AS `StudentName`,`users`.`Email` AS `Email`,`users`.`Contact` AS `Contact`,`students`.`Class` AS `Class`,`students`.`EnrollmentYear` AS `EnrollmentYear` from (`students` join `users` on((`students`.`UserID` = `users`.`UserID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `subject_avg_score`
--

/*!50001 DROP VIEW IF EXISTS `subject_avg_score`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `subject_avg_score` AS select `grades`.`SubjectID` AS `SubjectID`,avg(`grades`.`Score`) AS `avg_score` from `grades` group by `grades`.`SubjectID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `subjectteacherdetails`
--

/*!50001 DROP VIEW IF EXISTS `subjectteacherdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `subjectteacherdetails` AS select `s`.`SubjectID` AS `SubjectID`,`s`.`Name` AS `SubjectName`,`t`.`TeacherID` AS `TeacherID`,`u`.`Name` AS `TeacherName` from ((`subjects` `s` join `teachers` `t` on((`s`.`TeacherID` = `t`.`TeacherID`))) join `users` `u` on((`t`.`UserID` = `u`.`UserID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `subjectteacherview`
--

/*!50001 DROP VIEW IF EXISTS `subjectteacherview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `subjectteacherview` AS select `t`.`TeacherID` AS `TeacherID`,`u`.`Name` AS `TeacherName`,`s`.`SubjectID` AS `SubjectID`,`s`.`Name` AS `SubjectName` from (`users` `u` left join (`teachers` `t` left join `subjects` `s` on((`s`.`TeacherID` = `t`.`TeacherID`))) on((`t`.`UserID` = `u`.`UserID`))) where (`u`.`Role` = 'Teacher') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `teacherdepartmentview`
--

/*!50001 DROP VIEW IF EXISTS `teacherdepartmentview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `teacherdepartmentview` AS select `teachers`.`TeacherID` AS `TeacherID`,`users`.`Name` AS `TeacherName`,`teachers`.`Department` AS `Department` from (`teachers` join `users` on((`teachers`.`UserID` = `users`.`UserID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `teacherdetails`
--

/*!50001 DROP VIEW IF EXISTS `teacherdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `teacherdetails` AS select `teachers`.`TeacherID` AS `TeacherID`,`teachers`.`UserID` AS `UserID`,`teachers`.`Department` AS `Department` from `teachers` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total_subjects`
--

/*!50001 DROP VIEW IF EXISTS `total_subjects`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total_subjects` AS select count(distinct `subjects`.`SubjectID`) AS `distinct_subjects` from `subjects` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total_users`
--

/*!50001 DROP VIEW IF EXISTS `total_users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total_users` AS select count(`users`.`UserID`) AS `total_users` from `users` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_role_count`
--

/*!50001 DROP VIEW IF EXISTS `user_role_count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_role_count` AS select `users`.`Role` AS `Role`,count(`users`.`UserID`) AS `total_users` from `users` group by `users`.`Role` */;
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

-- Dump completed on 2025-04-15 17:58:10
