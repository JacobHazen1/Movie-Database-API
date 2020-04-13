CREATE DATABASE  IF NOT EXISTS `movieapi` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `movieapi`;
-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: localhost    Database: movieapi
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
-- Table structure for table `ADMIN`
--

DROP TABLE IF EXISTS `ADMIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN` (
  `Admin_ID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(15) NOT NULL,
  `Password` varchar(15) NOT NULL,
  PRIMARY KEY (`Admin_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN`
--

LOCK TABLES `ADMIN` WRITE;
/*!40000 ALTER TABLE `ADMIN` DISABLE KEYS */;
INSERT INTO `ADMIN` VALUES (1,'bobo','bobo'),(2,'jacob','jacob'),(3,'everest','everest'),(4,'albert','albert'),(5,'sarhan','sarhan'),(6,'tanuja','tanuja');
/*!40000 ALTER TABLE `ADMIN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BANS`
--

DROP TABLE IF EXISTS `BANS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BANS` (
  `Admin_ID` int NOT NULL,
  `User_ID` int NOT NULL,
  PRIMARY KEY (`Admin_ID`,`User_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `BANS_ibfk_1` FOREIGN KEY (`Admin_ID`) REFERENCES `ADMIN` (`Admin_ID`),
  CONSTRAINT `BANS_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `User` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BANS`
--

LOCK TABLES `BANS` WRITE;
/*!40000 ALTER TABLE `BANS` DISABLE KEYS */;
/*!40000 ALTER TABLE `BANS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CHARACTER`
--

DROP TABLE IF EXISTS `CHARACTER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CHARACTER` (
  `Performer_ID` int NOT NULL,
  `Movie_ID` int NOT NULL,
  `Character_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Performer_ID`,`Movie_ID`),
  KEY `Movie_ID` (`Movie_ID`),
  CONSTRAINT `CHARACTER_ibfk_1` FOREIGN KEY (`Performer_ID`) REFERENCES `FILM_WORKER` (`Worker_ID`),
  CONSTRAINT `CHARACTER_ibfk_2` FOREIGN KEY (`Movie_ID`) REFERENCES `Movie` (`Movie_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHARACTER`
--

LOCK TABLES `CHARACTER` WRITE;
/*!40000 ALTER TABLE `CHARACTER` DISABLE KEYS */;
INSERT INTO `CHARACTER` VALUES (2,1,'Frank Sheeran'),(3,1,'Jimmy Hoffa'),(5,2,'Ki Taek'),(7,3,'Queen Anne'),(8,3,'Abigail'),(10,4,'Billi'),(13,6,'Jo March'),(14,6,'Amy March'),(17,7,'Steve Rogers / Captain America'),(18,7,'Tony Stark / Iron Man');
/*!40000 ALTER TABLE `CHARACTER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DIRECTS`
--

DROP TABLE IF EXISTS `DIRECTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DIRECTS` (
  `Director_ID` int NOT NULL,
  `Movie_ID` int NOT NULL,
  PRIMARY KEY (`Director_ID`,`Movie_ID`),
  KEY `Movie_ID` (`Movie_ID`),
  CONSTRAINT `DIRECTS_ibfk_1` FOREIGN KEY (`Director_ID`) REFERENCES `FILM_WORKER` (`Worker_ID`),
  CONSTRAINT `DIRECTS_ibfk_2` FOREIGN KEY (`Movie_ID`) REFERENCES `Movie` (`Movie_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DIRECTS`
--

LOCK TABLES `DIRECTS` WRITE;
/*!40000 ALTER TABLE `DIRECTS` DISABLE KEYS */;
INSERT INTO `DIRECTS` VALUES (1,1),(4,2),(6,3),(9,4),(11,5),(12,6),(15,7),(16,7);
/*!40000 ALTER TABLE `DIRECTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FILM_WORKER`
--

DROP TABLE IF EXISTS `FILM_WORKER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FILM_WORKER` (
  `Worker_ID` int NOT NULL AUTO_INCREMENT,
  `First_name` varchar(60) DEFAULT NULL,
  `Middle_name` varchar(60) DEFAULT NULL,
  `Last_name` varchar(60) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `bDate` date DEFAULT NULL,
  `Director_flag` binary(1) DEFAULT NULL,
  `Performer_flag` binary(1) DEFAULT NULL,
  `Added_by_admin` int DEFAULT NULL,
  PRIMARY KEY (`Worker_ID`),
  KEY `Added_by_admin` (`Added_by_admin`),
  CONSTRAINT `FILM_WORKER_ibfk_1` FOREIGN KEY (`Added_by_admin`) REFERENCES `ADMIN` (`Admin_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FILM_WORKER`
--

LOCK TABLES `FILM_WORKER` WRITE;
/*!40000 ALTER TABLE `FILM_WORKER` DISABLE KEYS */;
INSERT INTO `FILM_WORKER` VALUES (1,'Martin','Charles','Scorsese',77,'1942-11-17',_binary '1',_binary '0',3),(2,'Robert','Anthony','De Niro',76,'1943-08-17',_binary '0',_binary '1',3),(3,'Al','James','Pacino',79,'1940-04-25',_binary '0',_binary '1',3),(4,'Bong','','Joon-ho',50,'1969-09-14',_binary '1',_binary '0',3),(5,'Kang-ho Song','','Song',53,'1967-01-17',_binary '0',_binary '1',3),(6,'Georgios','Yorgos','Lanthimos',46,'1973-05-27',_binary '1',_binary '0',3),(7,'Olivia','','Colman',46,'1974-01-30',_binary '0',_binary '1',3),(8,'Emma','Jean','Stone',31,'1988-11-06',_binary '0',_binary '1',3),(9,'Lulu','','Wang',37,'1983-02-25',_binary '1',_binary '0',3),(10,'Awkwafina','','',31,'1988-06-02',_binary '0',_binary '1',3),(11,'Hirokazu','','Koreeda',57,'1962-06-06',_binary '1',_binary '0',3),(12,'Greta','Celeste','Gerwig',36,'1983-08-04',_binary '1',_binary '0',3),(13,'Saoirse','Una','Ronan',25,'1994-04-12',_binary '0',_binary '1',3),(14,'Florence','','Pugh',24,'1996-01-03',_binary '0',_binary '1',3),(15,'Joe','','Russo',48,'1971-07-18',_binary '1',_binary '0',3),(16,'Anthony','','Russo',50,'1970-02-03',_binary '1',_binary '0',3),(17,'Chris','Robert','Evans',38,'1981-06-13',_binary '0',_binary '1',3),(18,'Robert','John','Downey Jr.',55,'1965-04-04',_binary '0',_binary '1',3);
/*!40000 ALTER TABLE `FILM_WORKER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MOVIE_CREATOR`
--

DROP TABLE IF EXISTS `MOVIE_CREATOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MOVIE_CREATOR` (
  `Movie_Creator_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(60) DEFAULT NULL,
  `Description` text,
  `Creator_type` varchar(15) DEFAULT NULL,
  `Added_by_admin` int DEFAULT NULL,
  PRIMARY KEY (`Movie_Creator_ID`),
  KEY `Added_by_admin` (`Added_by_admin`),
  CONSTRAINT `MOVIE_CREATOR_ibfk_1` FOREIGN KEY (`Added_by_admin`) REFERENCES `ADMIN` (`Admin_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MOVIE_CREATOR`
--

LOCK TABLES `MOVIE_CREATOR` WRITE;
/*!40000 ALTER TABLE `MOVIE_CREATOR` DISABLE KEYS */;
INSERT INTO `MOVIE_CREATOR` VALUES (1,'Albert Studios','Albert Studios is a mid-size movie publisher in Calgary',' studio',1),(2,'Bobo Studios','Bobo Studios is a mid-size movie publisher in Calgary',' studio',2),(3,'Jacob Studios','Jacob Studios is a mid-size movie publisher in Calgary','studio',3),(4,'Everest & co.','Everest Studios is a mid-size movie publisher in Calgary','independent',4),(5,'Sarhan & co.','Sarhan Studios is a mid-size movie publisher in Calgary','independent',5),(6,'Tanuja & co.','T Studios is a mid-size movie publisher in Calgary','independent',6);
/*!40000 ALTER TABLE `MOVIE_CREATOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MOVIE_GENRE`
--

DROP TABLE IF EXISTS `MOVIE_GENRE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MOVIE_GENRE` (
  `Movie_ID` int NOT NULL,
  `Genre` varchar(50) NOT NULL,
  PRIMARY KEY (`Movie_ID`,`Genre`),
  CONSTRAINT `MOVIE_GENRE_ibfk_1` FOREIGN KEY (`Movie_ID`) REFERENCES `Movie` (`Movie_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MOVIE_GENRE`
--

LOCK TABLES `MOVIE_GENRE` WRITE;
/*!40000 ALTER TABLE `MOVIE_GENRE` DISABLE KEYS */;
INSERT INTO `MOVIE_GENRE` VALUES (1,'biography'),(1,'crime'),(1,'drama'),(2,'comedy'),(2,'drama'),(2,'thriller'),(3,'biography'),(3,'comedy'),(3,'drama'),(4,'comedy'),(4,'drama'),(5,'crime'),(5,'drama'),(6,'drama'),(6,'romance'),(7,'action'),(7,'adventure'),(7,'drama'),(8,'action'),(8,'adventure'),(8,'mystery'),(9,'drama'),(9,'war'),(10,'drama'),(11,'comedy'),(11,'drama'),(11,'romance'),(12,'comedy'),(13,'drama'),(13,'fantasy'),(13,'horror'),(14,'action'),(14,'adventure'),(14,'comedy');
/*!40000 ALTER TABLE `MOVIE_GENRE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MOVIE_LANGUAGE`
--

DROP TABLE IF EXISTS `MOVIE_LANGUAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MOVIE_LANGUAGE` (
  `Movie_ID` int NOT NULL,
  `Language` varchar(50) NOT NULL,
  PRIMARY KEY (`Movie_ID`,`Language`),
  CONSTRAINT `MOVIE_LANGUAGE_ibfk_1` FOREIGN KEY (`Movie_ID`) REFERENCES `Movie` (`Movie_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MOVIE_LANGUAGE`
--

LOCK TABLES `MOVIE_LANGUAGE` WRITE;
/*!40000 ALTER TABLE `MOVIE_LANGUAGE` DISABLE KEYS */;
INSERT INTO `MOVIE_LANGUAGE` VALUES (1,'English'),(1,'Spanish'),(2,'Korean'),(3,'English'),(4,'English'),(5,'English'),(6,'English'),(7,'English'),(8,'English'),(9,'English'),(10,'English'),(11,'English'),(12,'English'),(13,'English'),(14,'English');
/*!40000 ALTER TABLE `MOVIE_LANGUAGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MOVIE_SHOWING_INSTANCE`
--

DROP TABLE IF EXISTS `MOVIE_SHOWING_INSTANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MOVIE_SHOWING_INSTANCE` (
  `Theater_ID` int NOT NULL,
  `Room_no` int NOT NULL,
  `Movie_ID` int NOT NULL,
  `Showing_ID` int NOT NULL,
  `Start_time` datetime DEFAULT NULL,
  `End_time` datetime DEFAULT NULL,
  PRIMARY KEY (`Theater_ID`,`Room_no`,`Movie_ID`,`Showing_ID`),
  KEY `Room_no` (`Room_no`),
  CONSTRAINT `MOVIE_SHOWING_INSTANCE_ibfk_1` FOREIGN KEY (`Theater_ID`) REFERENCES `THEATER` (`Theater_ID`),
  CONSTRAINT `MOVIE_SHOWING_INSTANCE_ibfk_2` FOREIGN KEY (`Room_no`) REFERENCES `Showing_Room` (`Room_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MOVIE_SHOWING_INSTANCE`
--

LOCK TABLES `MOVIE_SHOWING_INSTANCE` WRITE;
/*!40000 ALTER TABLE `MOVIE_SHOWING_INSTANCE` DISABLE KEYS */;
INSERT INTO `MOVIE_SHOWING_INSTANCE` VALUES (1,1,6,1,'2020-04-04 14:00:00','2020-04-04 17:00:00'),(1,2,7,2,'2020-04-04 15:00:00','2020-04-04 18:00:00'),(1,3,8,3,'2020-04-04 16:00:00','2020-04-04 19:00:00'),(2,1,9,4,'2020-04-04 17:00:00','2020-04-04 20:00:00'),(3,1,10,5,'2020-04-04 18:00:00','2020-04-04 21:00:00'),(6,1,1,1,'2020-04-04 09:00:00','2020-04-04 12:00:00'),(6,2,2,2,'2020-04-04 10:00:00','2020-04-04 13:00:00'),(6,3,3,3,'2020-04-04 11:00:00','2020-04-04 14:00:00'),(6,4,4,4,'2020-04-04 12:00:00','2020-04-04 15:00:00'),(6,5,5,5,'2020-04-04 13:00:00','2020-04-04 16:00:00');
/*!40000 ALTER TABLE `MOVIE_SHOWING_INSTANCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Movie`
--

DROP TABLE IF EXISTS `Movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Movie` (
  `Movie_ID` int NOT NULL AUTO_INCREMENT,
  `Description` text,
  `Overall_rating` float DEFAULT NULL,
  `Length` int DEFAULT NULL,
  `MPAA_rating` varchar(10) DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `Release` date DEFAULT NULL,
  `Movie_Creator_ID` int DEFAULT NULL,
  `Gross` bigint DEFAULT NULL,
  PRIMARY KEY (`Movie_ID`),
  KEY `Movie_Creator_ID` (`Movie_Creator_ID`),
  CONSTRAINT `Movie_ibfk_1` FOREIGN KEY (`Movie_Creator_ID`) REFERENCES `MOVIE_CREATOR` (`Movie_Creator_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movie`
--

LOCK TABLES `Movie` WRITE;
/*!40000 ALTER TABLE `Movie` DISABLE KEYS */;
INSERT INTO `Movie` VALUES (1,'An aging hitman recalls his time with the mob and the intersecting events with his friend, Jimmy Hoffa, through the 1950-70s.',7.9,209,'R','The Irishman','2019-11-27',1,8000000),(2,'A poor family, the Kims, con their way into becoming the servants of a rich family, the Parks. But their easy life gets complicated when their deception is threatened with exposure.',8.6,132,'R','Parasite','2019-11-08',1,266900000),(3,'In early 18th century England, a frail Queen Anne occupies the throne and her close friend, Lady Sarah, governs the country in her stead. When a new servant, Abigail, arrives, her charm endears her to Sarah.',7.6,119,'R','The Favourite','2018-12-21',2,95900000),(4,'A Chinese family discovers their grandmother has only a short while left to live and decide to keep her in the dark, scheduling a wedding to gather before she dies.',7.6,100,'PG','The Farewell I','2019-08-09',2,22500000),(5,'A family of small-time crooks take in a child they find outside in the cold.',8,121,'R','Shoplifters','2018-11-23',3,72700000),(6,'Jo March (Saoirse Ronan) reflects back and forth on her life, telling the beloved story of the March sisters - four young women each determined to live life on her own terms.',7.9,135,'PG',' Little Women','2019-12-05',3,206000000),(7,'After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos\' actions and restore balance to the universe.',8.4,181,'PG-13','Avengers: Endgame','2019-04-26',4,2800000000),(8,'After the death of her grandmother, Teresa comes home to her matriarchal village in a near-future Brazil to find a succession of sinister events that mobilizes all of its residents.',7.7,131,'R','Bacurau','2020-03-19',4,3400000),(9,'April 6th, 1917. As a regiment assembles to wage war deep in enemy territory, two soldiers are assigned to race against time and deliver a message that will stop 1,600 men from walking straight into a deadly trap.',8.4,119,'R','1917','2020-10-01',5,368300000),(10,'Kept apart by a terrible lie and a conservative society, two sisters born in Rio de Janeiro make their way through life each believing the other is living out her dreams half a world away.',8,139,'R','Invisible Life','2020-04-03',5,1700000),(11,'Noah Baumbach\'s incisive and compassionate look at a marriage breaking up and a family staying together.',8,137,'R','Marriage Story','2019-12-06',6,2300000),(12,'On the eve of their high school graduation, two academic superstars and best friends realize they should have worked less and played more. Determined not to fall short of their peers, the girls try to cram four years of fun into one night.',7.2,102,'R','Booksmart','2019-05-24',6,24900000),(13,'A fantasy re-telling of the medieval story of Sir Gawain and the Green Knight.',7.2,125,'R','The Green Knight','2020-05-29',6,0),(14,'A bank teller discovers that hes actually an NPC inside a brutal, open world video game.',7.8,95,'PG-13','Free Guy','2020-12-11',6,0);
/*!40000 ALTER TABLE `Movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERFORMS_IN`
--

DROP TABLE IF EXISTS `PERFORMS_IN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PERFORMS_IN` (
  `Performer_ID` int NOT NULL,
  `Movie_ID` int NOT NULL,
  PRIMARY KEY (`Performer_ID`,`Movie_ID`),
  KEY `Movie_ID` (`Movie_ID`),
  CONSTRAINT `PERFORMS_IN_ibfk_1` FOREIGN KEY (`Performer_ID`) REFERENCES `FILM_WORKER` (`Worker_ID`),
  CONSTRAINT `PERFORMS_IN_ibfk_2` FOREIGN KEY (`Movie_ID`) REFERENCES `Movie` (`Movie_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERFORMS_IN`
--

LOCK TABLES `PERFORMS_IN` WRITE;
/*!40000 ALTER TABLE `PERFORMS_IN` DISABLE KEYS */;
INSERT INTO `PERFORMS_IN` VALUES (2,1),(3,1),(5,2),(7,3),(8,3),(10,4),(13,6),(14,6),(17,7),(18,7);
/*!40000 ALTER TABLE `PERFORMS_IN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REVIEW`
--

DROP TABLE IF EXISTS `REVIEW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REVIEW` (
  `Movie_ID` int NOT NULL,
  `Reviewer_ID` int NOT NULL,
  `Review_ID` int NOT NULL,
  `Rating` int DEFAULT NULL,
  `Description` text,
  PRIMARY KEY (`Movie_ID`,`Reviewer_ID`,`Review_ID`),
  KEY `Reviewer_ID` (`Reviewer_ID`),
  CONSTRAINT `REVIEW_ibfk_1` FOREIGN KEY (`Movie_ID`) REFERENCES `Movie` (`Movie_ID`),
  CONSTRAINT `REVIEW_ibfk_2` FOREIGN KEY (`Reviewer_ID`) REFERENCES `User` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REVIEW`
--

LOCK TABLES `REVIEW` WRITE;
/*!40000 ALTER TABLE `REVIEW` DISABLE KEYS */;
INSERT INTO `REVIEW` VALUES (1,1,1,6,'It was too long, I fell asleep!'),(2,2,3,10,'Truly a masterpiece.'),(4,3,4,8,'Pleasantly surprised me.'),(7,1,2,9,'It was the perfect length!'),(7,4,5,0,'No Batman, waste of time.');
/*!40000 ALTER TABLE `REVIEW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHOWS`
--

DROP TABLE IF EXISTS `SHOWS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHOWS` (
  `Theater_ID` int NOT NULL,
  `Movie_ID` int NOT NULL,
  PRIMARY KEY (`Theater_ID`,`Movie_ID`),
  KEY `Movie_ID` (`Movie_ID`),
  CONSTRAINT `SHOWS_ibfk_1` FOREIGN KEY (`Theater_ID`) REFERENCES `THEATER` (`Theater_ID`),
  CONSTRAINT `SHOWS_ibfk_2` FOREIGN KEY (`Movie_ID`) REFERENCES `Movie` (`Movie_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHOWS`
--

LOCK TABLES `SHOWS` WRITE;
/*!40000 ALTER TABLE `SHOWS` DISABLE KEYS */;
INSERT INTO `SHOWS` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(1,4),(2,4),(3,4),(4,4),(5,4),(6,4),(1,5),(2,5),(3,5),(4,5),(5,5),(6,5),(1,6),(2,6),(3,6),(4,6),(5,6),(6,6),(1,7),(2,7),(3,7),(4,7),(5,7),(6,7),(1,8),(2,8),(3,8),(4,8),(5,8),(6,8),(1,10),(2,10),(3,10),(4,10),(5,10),(6,10),(1,11),(2,11),(3,11),(4,11),(5,11),(6,11),(1,12),(2,12),(3,12),(4,12),(5,12),(6,12);
/*!40000 ALTER TABLE `SHOWS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Showing_Room`
--

DROP TABLE IF EXISTS `Showing_Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Showing_Room` (
  `Room_no` int NOT NULL,
  `Theater_ID` int NOT NULL,
  PRIMARY KEY (`Room_no`,`Theater_ID`),
  KEY `Theater_ID` (`Theater_ID`),
  CONSTRAINT `Showing_Room_ibfk_1` FOREIGN KEY (`Theater_ID`) REFERENCES `THEATER` (`Theater_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Showing_Room`
--

LOCK TABLES `Showing_Room` WRITE;
/*!40000 ALTER TABLE `Showing_Room` DISABLE KEYS */;
INSERT INTO `Showing_Room` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(2,2),(3,2),(4,2),(5,2),(1,3),(2,3),(3,3),(4,3),(5,3),(1,4),(2,4),(3,4),(4,4),(5,4),(1,5),(2,5),(3,5),(4,5),(5,5);
/*!40000 ALTER TABLE `Showing_Room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `THEATER`
--

DROP TABLE IF EXISTS `THEATER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `THEATER` (
  `Theater_ID` int NOT NULL AUTO_INCREMENT,
  `Phone_Number` varchar(15) DEFAULT NULL,
  `Zip_code` varchar(5) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `Name` varchar(60) DEFAULT NULL,
  `Opening_time` time DEFAULT NULL,
  `Closing_time` time DEFAULT NULL,
  `Registered_by_admin` int DEFAULT NULL,
  PRIMARY KEY (`Theater_ID`),
  KEY `Registered_by_admin` (`Registered_by_admin`),
  CONSTRAINT `THEATER_ibfk_1` FOREIGN KEY (`Registered_by_admin`) REFERENCES `ADMIN` (`Admin_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `THEATER`
--

LOCK TABLES `THEATER` WRITE;
/*!40000 ALTER TABLE `THEATER` DISABLE KEYS */;
INSERT INTO `THEATER` VALUES (1,'111-111-1111','ABC12','1 Hutington Drive','Calgary','jacob theatres','07:00:00','01:00:00',1),(2,'222-222-2222','BCD45','2 Hutington Drive','Edmonton','sarhan theatres','07:00:00','01:00:00',2),(3,'333-333-3333','EFG12','3 Hutington Drive','Vancouver','bobo theatres','07:00:00','01:00:00',3),(4,'444-444-4444','FGH12','4 Hutington Drive','Saskatoon','everest theatres','07:00:00','01:00:00',4),(5,'555-555-5555','T2MXZ','5 Hutington Drive','Nova Scotia','albert theatres','07:00:00','01:00:00',5),(6,'666-666-6666','HKL45','6 Hutington Drive','Victoria','abc movies','07:00:00','01:00:00',6);
/*!40000 ALTER TABLE `THEATER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UPDATES`
--

DROP TABLE IF EXISTS `UPDATES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UPDATES` (
  `Admin_ID` int NOT NULL,
  `Movie_ID` int NOT NULL,
  PRIMARY KEY (`Admin_ID`,`Movie_ID`),
  KEY `Movie_ID` (`Movie_ID`),
  CONSTRAINT `UPDATES_ibfk_1` FOREIGN KEY (`Admin_ID`) REFERENCES `ADMIN` (`Admin_ID`),
  CONSTRAINT `UPDATES_ibfk_2` FOREIGN KEY (`Movie_ID`) REFERENCES `Movie` (`Movie_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UPDATES`
--

LOCK TABLES `UPDATES` WRITE;
/*!40000 ALTER TABLE `UPDATES` DISABLE KEYS */;
/*!40000 ALTER TABLE `UPDATES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `User_ID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(15) NOT NULL,
  `Password` varchar(15) NOT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'John','Lennon'),(2,'Paul','McCartney'),(3,'George','Harrison'),(4,'Ringo','Starr');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'movieapi'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_director_to_movie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_director_to_movie`(Movie_ID INT, Director_ID INT)
BEGIN
    PREPARE statement FROM
        'INSERT INTO
            DIRECTS (Director_ID, Movie_ID)
        VALUES
            (?, ?)';
    SET @Movie_ID = Movie_ID;
    SET @Director_ID = Director_ID;
    EXECUTE statement USING @Director_ID, @Movie_ID;
    DEALLOCATE PREPARE statement;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_film_worker` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_film_worker`(First_name VARCHAR(60),
                                             Middle_name VARCHAR(60),
                                             Last_name VARCHAR(60),
                                             Director_flag BINARY,
                                             Performer_flag BINARY)
BEGIN
    PREPARE statement FROM
        'INSERT INTO
            FILM_WORKER (
                First_name,
                Middle_name,
                Last_name,
                Director_flag,
                Performer_flag
            )
        VALUES
            (?, ?, ?, ?, ?)';
    SET @First_name = First_name;
    SET @Middle_name = Middle_name;
    SET @Last_name = Last_name;
    SET @Director_flag = Director_flag;
    SET @Performer_flag = Performer_flag;
    EXECUTE statement USING @First_name, @Middle_name, @Last_name, @Director_flag, @Performer_flag;
    DEALLOCATE PREPARE statement;
    PREPARE statement FROM
    'SELECT LAST_INSERT_ID()';
    EXECUTE statement;
    DEALLOCATE PREPARE statement;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_genre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_genre`(Movie_ID INT, Genre VARCHAR(50))
BEGIN
    PREPARE statement FROM
        'INSERT INTO
            MOVIE_GENRE (Movie_ID, Genre)
        VALUES
            (?, ?)';
    SET @Movie_ID = Movie_ID;
    SET @Genre = Genre;
    EXECUTE statement USING @Movie_ID, @Genre;
    DEALLOCATE PREPARE statement;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_language` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_language`(Movie_ID INT, `language` VARCHAR(50))
BEGIN
    PREPARE statement FROM
        'INSERT INTO
            MOVIE_LANGUAGE (Movie_ID, Language)
        VALUES
            (?, ?)';
    SET @Movie_ID = Movie_ID;
    SET @language = `language`;
    EXECUTE statement USING @Movie_ID, @language;
    DEALLOCATE PREPARE statement;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_movie_endpoint` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_movie_endpoint`(title VARCHAR(50),
                                             release_date DATE,
                                             movie_length INT,
                                             description_text TEXT,
                                             mpaa_rating VARCHAR(10))
BEGIN
    PREPARE statement FROM
        'INSERT INTO
            Movie (
                `Description`,
                `Length`,
                MPAA_rating,
                Title,
                `Release`
            )
        VALUES
            (?, ?, ?, ?, ?)';
    SET @title = title;
    SET @release_date = release_date;
    SET @movie_length = movie_length;
    SET @description_text = description_text;
    SET @mpaa_rating = mpaa_rating;
    EXECUTE statement USING @description_text, @movie_length, @mpaa_rating, @title, @release_date;
    DEALLOCATE PREPARE statement;
    PREPARE statement FROM
    'SELECT LAST_INSERT_ID()';
    EXECUTE statement;
    DEALLOCATE PREPARE statement;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_performer_to_movie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_performer_to_movie`(Movie_ID INT, Performer_ID INT)
BEGIN
    PREPARE statement FROM
        'INSERT INTO
            PERFORMS_IN (Performer_ID, Movie_ID)
        VALUES
            (?, ?)';
    SET @Movie_ID = Movie_ID;
    SET @Performer_ID = Performer_ID;
    EXECUTE statement USING @Performer_ID, @Movie_ID;
    DEALLOCATE PREPARE statement;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `all_genre_for_movie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `all_genre_for_movie`(Movie_ID INT)
BEGIN
    PREPARE statement FROM
        'SELECT
            MG.genre
        FROM
            Movie AS M,
            MOVIE_GENRE AS MG
        WHERE
            M.Movie_ID = MG.Movie_ID
            AND M.Movie_ID = ?';
    SET @Movie_ID = Movie_ID;
    EXECUTE statement USING @Movie_ID;
    DEALLOCATE PREPARE statement;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `genre_endpoint` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `genre_endpoint`(genre VARCHAR(20))
BEGIN
    PREPARE statement FROM
        'SELECT
            DISTINCT M.Movie_ID,
            M.Title,
            MG.Genre,
            M.Description
        FROM
            movie AS M,
            movie_genre AS MG,
            shows AS S,
            theater AS T
        WHERE
            M.Movie_ID = MG.Movie_ID
            AND M.Movie_ID = S.Movie_ID
            AND S.Theater_ID = T.Theater_ID
            AND MG.Genre = ?';
    SET @genre = genre;
    EXECUTE statement USING @genre;
    DEALLOCATE PREPARE statement;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `give_rating_endpoint` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `give_rating_endpoint`(movie_title VARCHAR(50), username VARCHAR(15),
                                                                        rating INT, r_description TEXT)
BEGIN
        PREPARE statement FROM
            'INSERT INTO
                REVIEW
            VALUES (
                (SELECT Movie_ID FROM Movie WHERE Title = ?),
                (SELECT User_ID FROM User WHERE Username = ?),
                (SELECT MAX(R.Review_ID) FROM REVIEW as R) + 1, ?, ?)';
        SET @movie_title = movie_title;
        SET @username = username;
        SET @rating = rating;
        SET @r_description = r_description;
        EXECUTE statement USING @movie_title, @username, @rating, @r_description;
    DEALLOCATE PREPARE statement;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `language_endpoint` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `language_endpoint`(`language` VARCHAR(50))
BEGIN
    PREPARE statement FROM
        'SELECT
            DISTINCT M.Movie_ID,
            M.Title,
            M.Overall_rating,
            M.Release,
            M.Length,
            M.Description,
            M.Gross
        FROM
            Movie AS M,
            MOVIE_LANGUAGE AS ML,
            SHOWS AS S,
            THEATER AS T
        WHERE
            M.Movie_ID = S.Movie_ID
            AND S.Theater_ID = T.Theater_ID
            AND M.Movie_ID = ML.Movie_ID
            AND ML.Language = ?';
    SET @language = `language`;
    EXECUTE statement USING @language;
    DEALLOCATE PREPARE statement;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mpaa_rating_endpoint` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mpaa_rating_endpoint`(mpaa_rating VARCHAR(10))
BEGIN
    PREPARE statement FROM
        'SELECT
            DISTINCT M.Movie_ID,
            M.Title,
            M.MPAA_rating,
            M.Description
        FROM
            Movie AS M,
            SHOWS AS S,
            THEATER AS T
        WHERE
            M.Movie_ID = S.Movie_ID
            AND S.Theater_ID = T.Theater_ID
            AND M.MPAA_rating = ?';
    SET @mpaa_rating = mpaa_rating;
    EXECUTE statement USING @mpaa_rating;
    DEALLOCATE PREPARE statement;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_movies_endpoint` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_movies_endpoint`(r_date DATE)
BEGIN
        PREPARE statement FROM
            'SELECT
                M.Movie_ID,
                M.Overall_rating,
                M.Title,
                M.Description
            FROM
                Movie AS M
            WHERE
                M.Release <= ?
            ORDER BY
                M.Release DESC';
        SET @r_date = r_date;
        EXECUTE statement USING @r_date;
    DEALLOCATE PREPARE statement;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rank_endpoint` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rank_endpoint`(count INT)
BEGIN
    PREPARE statement FROM
        'SELECT
            M.Movie_ID,
            M.Overall_rating,
            M.Title,
            M.Description
        FROM
            Movie AS M
        ORDER BY
            M.Overall_rating DESC
        LIMIT
            ?';	
    SET @count = count;
    EXECUTE statement USING @count;
    DEALLOCATE PREPARE statement;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_performer_endpoint` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `search_performer_endpoint`(f_name VARCHAR(60), l_name VARCHAR(60))
BEGIN
    PREPARE statement FROM
        'SELECT
            M.Movie_ID,
            M.Overall_rating,
            M.Title,
            M.Description
        FROM
            Movie AS M,
            PERFORMS_IN AS P,
            FILM_WORKER AS F
        WHERE
            M.Movie_ID = P.Movie_ID
            AND P.Performer_ID = F.Worker_ID
            AND ? = F.First_name
            AND ? = F.Last_name';
    SET @f_name = f_name;
    SET @l_name = l_name;
    EXECUTE statement USING @f_name, @l_name;
    DEALLOCATE PREPARE statement;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `specific_movie_theater_endpoint` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `specific_movie_theater_endpoint`(theater_name VARCHAR(60), d_date DATE)
BEGIN
    PREPARE statement FROM
        'SELECT
            M.Movie_ID,
            M.Title,
            T.Name AS Theater_name,
            MSI.Start_time,
            MSI.End_time,
            M.Description,
            MSI.Room_no AS Theater_room_no
        FROM
            Movie AS M,
            MOVIE_SHOWING_INSTANCE AS MSI,
            THEATER AS T
        WHERE
            M.Movie_ID = MSI.Movie_ID
            AND T.Theater_ID = MSI.Theater_ID
            AND T.Name = ?
            AND MSI.Start_time >= ?
            AND MSI.End_time <= DATE_ADD(?, INTERVAL 24 HOUR)';
    SET @theater_name = theater_name;
    SET @d_date = d_date;
    EXECUTE statement USING @theater_name, @d_date, @d_date;
    DEALLOCATE PREPARE statement;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `timeslot_endpoint` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `timeslot_endpoint`(theater_name VARCHAR(60), 
                                      time_start DATETIME, time_end DATETIME)
BEGIN
    PREPARE statement FROM
        'SELECT
            M.Movie_ID,
            M.Title,
            T.Name AS Theater_name,
            MSI.Start_time,
            MSI.End_time,
            M.Description,
            MSI.Room_no AS Theater_room_no
        FROM
            Movie AS M,
            MOVIE_SHOWING_INSTANCE AS MSI,
            THEATER AS T
        WHERE
            M.Movie_ID = MSI.Movie_ID
            AND T.Theater_ID = MSI.Theater_ID
            AND T.Name = ?
            AND MSI.Start_time >= ?
            AND MSI.End_time <= ?';
    SET @theater_name = theater_name;
    SET @time_start = time_start;
    SET @time_end = time_end;
    EXECUTE statement USING @theater_name, @time_start, @time_end;
    DEALLOCATE PREPARE statement;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `top_gross_endpoint` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `top_gross_endpoint`(in_theatres BOOL, `count` INT)
BEGIN
    PREPARE statement FROM
        'SELECT
            DISTINCT M.Movie_ID,
            M.Overall_rating,
            M.Title,
            M.Description,
            M.gross
        FROM
            Movie AS M
            LEFT JOIN SHOWS AS S ON M.Movie_ID = S.Movie_ID
        WHERE
            (
                CASE
                    WHEN ? = TRUE THEN (M.Movie_ID = S.Movie_ID)
                ELSE (
                    S.Movie_ID IS NULL
                    AND M.Movie_ID IS NOT NULL
                )
                END
            )
            ORDER BY
                M.Gross DESC
            LIMIT
                ?';
    SET @in_theatres = in_theatres;
    SET @count = `count`;
    EXECUTE statement USING @in_theatres, @count;
DEALLOCATE PREPARE statement;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `upcoming_movies` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `upcoming_movies`()
BEGIN
    PREPARE statement FROM
        'SELECT
            M.Movie_ID,
            M.Title,
            M.Overall_rating,
            M.Length,
            M.Description,
            M.Release
        FROM
            Movie AS M
        WHERE
            M.Release > CURDATE()';
    EXECUTE statement;
    DEALLOCATE PREPARE statement;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-12 18:02:41
