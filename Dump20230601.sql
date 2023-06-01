-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: cinema_last
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL,
  `user_username` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`,`user_username`),
  KEY `fk_ADMINS_user1_idx` (`user_username`),
  CONSTRAINT `fk_ADMINS_user1` FOREIGN KEY (`user_username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemas`
--

DROP TABLE IF EXISTS `cinemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL,
  `SEATS` varchar(45) NOT NULL,
  `3D` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemas`
--

LOCK TABLES `cinemas` WRITE;
/*!40000 ALTER TABLE `cinemas` DISABLE KEYS */;
INSERT INTO `cinemas` VALUES (1,'Kinepolis','76','yes'),(2,'AMC','174','yes'),(3,'Regal','93','no'),(4,'Cinemark','123','yes'),(5,'Cineplex','159','no'),(6,'Odeon','87','yes'),(7,'Vue','169','yes'),(8,'Pathé','64','yes'),(9,'Gaumont','153','yes'),(10,'Megaplex','157','no');
/*!40000 ALTER TABLE `cinemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_admin`
--

DROP TABLE IF EXISTS `content_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_admin` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL,
  `user_username` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`,`user_username`),
  KEY `fk_CONTENT_ADMIN_user1_idx` (`user_username`),
  CONSTRAINT `fk_CONTENT_ADMIN_user1` FOREIGN KEY (`user_username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_admin`
--

LOCK TABLES `content_admin` WRITE;
/*!40000 ALTER TABLE `content_admin` DISABLE KEYS */;
INSERT INTO `content_admin` VALUES (4,'Despoina','Thespian');
/*!40000 ALTER TABLE `content_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL,
  `user_username` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`,`user_username`),
  KEY `fk_CUSTOMERS_user1_idx` (`user_username`),
  CONSTRAINT `fk_CUSTOMERS_user1` FOREIGN KEY (`user_username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (10,'Saba','acumminsi'),(11,'Butch','afrow14'),(12,'Gwynne','agarlicke16'),(13,'Mallory','aradnedge1b'),(14,'Willa','areynalds1k'),(15,'Carmelia','awarrior11'),(16,'Myrilla','bdelayglesias2b'),(17,'Odette','bdonavang'),(18,'Jane','bfaireclougho'),(19,'Ellis','bganeq'),(20,'Kamillah','bkervin2i'),(21,'Giacinta','boger1f'),(22,'Cesya','cbartocci2r'),(23,'Bruce','cclapstonp'),(24,'Claudetta','cescalera19'),(25,'Miof mela','cimlock2o'),(26,'Karim','cmcpheek'),(27,'Charlton','corrobin2a'),(28,'Jacky','coscolleew'),(29,'Tybie','cpurbrick1c'),(30,'Juditha','ddeaton2j'),(31,'Gretta','ddymott18'),(32,'Eugine','dkment1a'),(33,'Trent','dpicoppy'),(34,'Vasily','dswindin1t'),(35,'Talia','ebeverstock2p'),(36,'Ammamaria','ecescoti2c'),(37,'Darb','egiffinz'),(38,'Ursola','emaddinon1g'),(39,'Vance','ewill3'),(40,'Sarina','ewykeyr'),(41,'Alanah','fgreenallu'),(42,'Petr','fnormanvillf'),(43,'Kassey','ggomersal4'),(44,'Yvette','glarive2n'),(45,'Geoffrey','gpavolillo23'),(46,'Erna','gruscoe8'),(47,'Carrol','gstawell9'),(48,'Dermot','hborne1s'),(49,'Bernardo','hcicchetto1m'),(50,'Case','hdelleschi12'),(51,'Kathrine','hhazelhurst1p'),(52,'Carolee','hshurlock15'),(53,'Bartel','iamner5'),(54,'Jamesy','ibartellt'),(55,'Rolando','jcartmer2f'),(56,'Brigham','jgrint27'),(57,'Filippo','jguilliatt10'),(58,'Perice','jnicely28'),(59,'Northrop','josment1d'),(60,'Delphinia','kcawdronx'),(61,'Whitby','kchristophers22'),(62,'Ronnica','kdelisle13'),(63,'Patin','kjosifovic2h'),(64,'Ailee','kscarcel'),(65,'Cordelie','latley2'),(66,'Garreth','lbumfrey25'),(67,'Ray','lcornill1w'),(68,'Tamera','lhoultham1z'),(69,'Gus','lkleis1v'),(70,'Rochelle','lmcmurty1l'),(71,'Sawyere','ltrendle29'),(72,'Gideon','mdunckley1u'),(73,'Erda','mecclestone0'),(74,'Iago','mhunnawill2d'),(75,'Rafferty','mpaddicka'),(76,'Edgar','mtrinemanj'),(77,'Amata','nbarstock1y'),(78,'Elli','ngarthshore6'),(79,'Clareta','nmoth1r'),(80,'Ronnie','ntidmas1x'),(81,'Clement','okix1q'),(82,'Mordecai','olanfere2m'),(83,'Morissa','pghost1i'),(84,'Alvinia','pkingsnoadc'),(85,'Lainey','ppraundlin1n'),(86,'Thorin','psharphurste'),(87,'Hershel','ptregaskis1j'),(88,'Doroteya','rbatten7'),(89,'Mace','rcarlisih'),(90,'Nanny','rcheesworth20'),(91,'Theobald','roldford17'),(92,'Dorian','rtregustv'),(93,'Cymbre','rwerendell2q'),(94,'Barby','scatterill2g'),(95,'Barnett','sdunckley1e'),(96,'Carly','shaggerstone1o'),(97,'Ula','ssellor2e'),(98,'Annaliese','ssmee2l'),(99,'Gretal','swetheraldb'),(100,'Wilhelm','tmattiam'),(101,'Peggy','tmustoo2k'),(102,'Danna','vcoomer1'),(103,'Clara','vgeldert24'),(104,'Ram','vpuzey1h'),(105,'Armstrong','vscarsbrooke26'),(106,'Tiphany','vvivyan21'),(107,'Evelina','wcostys'),(108,'Belva','whalesworthn'),(109,'Zachariah','wkohnertd');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL,
  `CONTENT` varchar(45) NOT NULL,
  `LENGTH` int NOT NULL,
  `TYPE` varchar(45) NOT NULL,
  `DIRECTOR` varchar(45) NOT NULL,
  `CONTENT_ADMIN_ID` int NOT NULL,
  PRIMARY KEY (`ID`,`NAME`,`CONTENT_ADMIN_ID`),
  KEY `fk_MOVIES_CONTENT_ADMIN1_idx` (`CONTENT_ADMIN_ID`),
  CONSTRAINT `fk_MOVIES_CONTENT_ADMIN1` FOREIGN KEY (`CONTENT_ADMIN_ID`) REFERENCES `content_admin` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (32,'Great Silence, The (Grande silenzio, Il)','Assimilated bifurcated extranet',168,'Drama|Western','Steven Spielberg',4),(33,'Toughest Man in the World','Advanced eco-centric open architecture',103,'Comedy|Drama','Christopher Nolan',4),(34,'Capital (Le capital)','Multi-tiered bottom-line matrix',185,'Drama','Martin Scorsese',4),(35,'Next Stop Wonderland','Intuitive upward-trending superstructure',93,'Comedy|Drama|Romance','Christopher Nolan',4),(36,'Two if by Sea','Organic 24/7 website',142,'Comedy|Romance','Francis Ford Coppola',4),(37,'Fork in the Road, A','Customizable regional policy',125,'Comedy|Crime','Francis Ford Coppola',4),(38,'Yesterday\'s Enemy','Face to face needs-based utilisation',194,'Drama|War','Alfred Hitchcock',4),(39,'Replicant','Streamlined 24/7 infrastructure',171,'Action|Sci-Fi|Thriller','Christopher Nolan',4),(40,'Heart of Dragon (Long de xin)','Phased multi-state structure',97,'Action|Comedy|Crime|Drama|War','Spike Lee',4),(41,'Heartbreak Kid, The','Upgradable zero administration application',174,'Comedy|Drama|Romance','Christopher Nolan',4),(42,'One Way Passage','Secured grid-enabled frame',194,'Drama|Romance','Woody Allen',4),(43,'Never Give a Sucker an Even Break','Universal foreground workforce',166,'Comedy|Musical','Akira Kurosawa',4),(44,'The Gamma People','Organic 6th generation implementation',91,'Horror|Sci-Fi','Steven Spielberg',4);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provoles`
--

DROP TABLE IF EXISTS `provoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provoles` (
  `MOVIES_ID` int NOT NULL,
  `MOVIES_NAME` varchar(45) NOT NULL,
  `CINEMAS_ID` int NOT NULL,
  `ID` varchar(45) NOT NULL,
  `CONTENT_ADMIN_ID` int NOT NULL,
  `TIME_DATE` varchar(45) NOT NULL,
  PRIMARY KEY (`MOVIES_ID`,`MOVIES_NAME`,`CINEMAS_ID`,`CONTENT_ADMIN_ID`),
  KEY `fk_MOVIES_has_CINEMAS_CINEMAS1_idx` (`CINEMAS_ID`),
  KEY `fk_MOVIES_has_CINEMAS_MOVIES_idx` (`MOVIES_ID`,`MOVIES_NAME`),
  KEY `fk_PROVOLES_CONTENT_ADMIN1_idx` (`CONTENT_ADMIN_ID`),
  CONSTRAINT `fk_MOVIES_has_CINEMAS_CINEMAS1` FOREIGN KEY (`CINEMAS_ID`) REFERENCES `cinemas` (`ID`),
  CONSTRAINT `fk_MOVIES_has_CINEMAS_MOVIES` FOREIGN KEY (`MOVIES_ID`, `MOVIES_NAME`) REFERENCES `movies` (`ID`, `NAME`),
  CONSTRAINT `fk_PROVOLES_CONTENT_ADMIN1` FOREIGN KEY (`CONTENT_ADMIN_ID`) REFERENCES `content_admin` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provoles`
--

LOCK TABLES `provoles` WRITE;
/*!40000 ALTER TABLE `provoles` DISABLE KEYS */;
INSERT INTO `provoles` VALUES (33,'Toughest Man in the World',5,'2zi8vrTmAb',4,'2022-09-05 11:04:24'),(34,'Capital (Le capital)',9,'sERIx3UVcq',4,'2023-05-01 01:25:28'),(35,'Next Stop Wonderland',2,'cCqUEmoVog',4,'2022-10-13 05:22:36'),(36,'Two if by Sea',2,'d9L8QXi8aU',4,'2022-09-02 16:28:20'),(38,'Yesterday\'s Enemy',2,'y2lFIs7I9j',4,'2022-06-13 16:21:21'),(39,'Replicant',9,'l5fq69Pb2o',4,'2022-06-20 20:51:01'),(40,'Heart of Dragon (Long de xin)',10,'777U8s8ydx',4,'2023-02-15 11:09:09'),(42,'One Way Passage',1,'gu63fG9PhH',4,'2023-03-27 06:03:22');
/*!40000 ALTER TABLE `provoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `PROVOLES_MOVIES_ID` int NOT NULL,
  `PROVOLES_MOVIES_NAME` varchar(45) NOT NULL,
  `PROVOLES_CINEMAS_ID` int NOT NULL,
  `CUSTOMERS_ID` int NOT NULL,
  `NUMBER_OF_SEATS` int NOT NULL,
  PRIMARY KEY (`PROVOLES_MOVIES_ID`,`PROVOLES_MOVIES_NAME`,`PROVOLES_CINEMAS_ID`,`CUSTOMERS_ID`),
  KEY `fk_PROVOLES_has_CUSTOMERS_CUSTOMERS1_idx` (`CUSTOMERS_ID`),
  KEY `fk_PROVOLES_has_CUSTOMERS_PROVOLES1_idx` (`PROVOLES_MOVIES_ID`,`PROVOLES_MOVIES_NAME`,`PROVOLES_CINEMAS_ID`),
  CONSTRAINT `fk_PROVOLES_has_CUSTOMERS_CUSTOMERS1` FOREIGN KEY (`CUSTOMERS_ID`) REFERENCES `customers` (`ID`),
  CONSTRAINT `fk_PROVOLES_has_CUSTOMERS_PROVOLES1` FOREIGN KEY (`PROVOLES_MOVIES_ID`, `PROVOLES_MOVIES_NAME`, `PROVOLES_CINEMAS_ID`) REFERENCES `provoles` (`MOVIES_ID`, `MOVIES_NAME`, `CINEMAS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(32) NOT NULL,
  `email` varchar(32) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('acumminsi','jcoldbreathi@google.cn','HLcHJ4','2022-12-17 04:28:55','CUSTOMER'),('afrow14','eallcroft14@cbsnews.com','yTNv6d','2022-07-30 10:21:04','CUSTOMER'),('agarlicke16','jinns16@macromedia.com','wnDIMSp','2022-10-26 17:53:39','CUSTOMER'),('aradnedge1b','pfranciotti1b@facebook.com','zjMFFsh','2022-06-26 07:20:19','CUSTOMER'),('areynalds1k','cyetman1k@nih.gov','0LezqjSSl','2022-07-01 15:38:01','CUSTOMER'),('awarrior11','mbyrth11@ibm.com','tNiqgLk7','2023-05-20 20:36:54','CUSTOMER'),('bdelayglesias2b','dbuttel2b@reverbnation.com','U8dWdnCh','2023-04-11 10:33:58','CUSTOMER'),('bdonavang','hwallworthg@merriam-webster.com','Vb7a8R7L','2023-03-06 22:44:06','CUSTOMER'),('bfaireclougho','dcowsero@utexas.edu','UKIzaTSMCdVF','2023-01-17 14:26:25','CUSTOMER'),('bganeq','tsawartq@themeforest.net','TxjJRcs','2022-08-11 15:38:35','CUSTOMER'),('bkervin2i','dbruckshaw2i@sfgate.com','wta4u1XgRSFE','2023-01-10 18:00:47','CUSTOMER'),('boger1f','mhembling1f@marketwatch.com','II9ZNhf','2022-07-09 11:42:45','CUSTOMER'),('cbartocci2r','frising2r@e-recht24.de','9oRz2M4U','2023-04-26 21:56:02','CUSTOMER'),('cclapstonp','cwranklingp@ovh.net','6XKeT601W','2023-01-08 08:33:09','CUSTOMER'),('cescalera19','jmellon19@creativecommons.org','HlBL4Wc1XeO','2022-09-22 02:54:51','CUSTOMER'),('cimlock2o','scosgrove2o@meetup.com','LnlDqrwORx','2022-08-28 13:12:21','CUSTOMER'),('cmcpheek','pflukesk@chronoengine.com','rfpcvS7','2022-10-14 02:03:47','CUSTOMER'),('corrobin2a','kbiaggetti2a@bravesites.com','grkrU7QDK','2023-03-10 01:09:51','CUSTOMER'),('coscolleew','wswindleyw@csmonitor.com','H5avJt7d3','2023-01-15 21:20:24','CUSTOMER'),('cpurbrick1c','fbutcher1c@google.de','AUFBso','2023-03-15 04:16:41','CUSTOMER'),('ddeaton2j','hboissier2j@fda.gov','p8fVDg','2022-09-18 03:05:00','CUSTOMER'),('ddymott18','rmedforth18@baidu.com','Lc6j1xIVuy','2022-12-02 18:17:52','CUSTOMER'),('dkment1a','ndeyenhardt1a@uol.com.br','pojjfbyYco','2022-09-15 15:01:33','CUSTOMER'),('dpicoppy','nolennachainy@phpbb.com','jyR41zkh7','2022-06-18 05:39:23','CUSTOMER'),('dswindin1t','scutchee1t@quantcast.com','8efbBn4q','2022-10-17 16:34:47','CUSTOMER'),('ebeverstock2p','trodgers2p@bandcamp.com','FQVdGunj7','2023-04-19 17:32:09','CUSTOMER'),('ecescoti2c','gboldecke2c@gnu.org','TQGW5Y91bPxt','2022-08-15 12:06:53','CUSTOMER'),('egiffinz','mcolumbellz@google.ru','yBMtJcm','2022-08-12 11:31:23','CUSTOMER'),('emaddinon1g','loquin1g@huffingtonpost.com','q5TpbmVfccs','2022-09-16 14:36:36','CUSTOMER'),('ewill3','oscorer3@taobao.com','Zd44yqKbT','2022-06-13 19:58:52','CUSTOMER'),('ewykeyr','jawinr@pinterest.com','YEJ1XCTv','2022-09-08 18:30:49','CUSTOMER'),('fgreenallu','hbarrowcloughu@netlog.com','J1RwBux63','2022-08-01 21:33:42','CUSTOMER'),('fnormanvillf','ybabalolaf@baidu.com','WTNkVBklqzE','2022-09-07 03:21:17','CUSTOMER'),('ggomersal4','fmorales4@china.com.cn','0ZDAut7f','2023-02-06 07:43:32','CUSTOMER'),('glarive2n','codby2n@issuu.com','Hu6yGkihz','2022-11-13 14:24:53','CUSTOMER'),('gpavolillo23','gmccarle23@photobucket.com','CjmU5oFoa','2022-11-06 09:49:25','CUSTOMER'),('gruscoe8','soxnam8@shareasale.com','OiqVCeU4XCI','2022-09-27 01:02:25','CUSTOMER'),('gstawell9','klavigne9@myspace.com','CCV9honptN','2022-06-11 22:04:39','CUSTOMER'),('hborne1s','kfrobisher1s@naver.com','4Tlg62','2023-01-31 04:12:07','CUSTOMER'),('hcicchetto1m','bpalffy1m@nhs.uk','YFFGlS11TDld','2023-03-12 01:39:11','CUSTOMER'),('hdelleschi12','krounsefell12@wordpress.com','F3F2WVk0','2023-02-09 17:30:11','CUSTOMER'),('hhazelhurst1p','eheadington1p@wiley.com','9J1lR5y4S','2022-07-17 21:22:07','CUSTOMER'),('hshurlock15','vstruys15@soundcloud.com','Dy6h6YL3','2023-04-08 22:16:50','CUSTOMER'),('iamner5','lgreensitt5@t.co','TzfRnUItIH','2023-05-13 12:08:04','CUSTOMER'),('ibartellt','dslatet@google.com.au','R0V0SK','2022-11-21 10:47:12','CUSTOMER'),('jcartmer2f','bdingate2f@irs.gov','fPO6KnrV2','2022-09-01 17:25:41','CUSTOMER'),('jgrint27','rhadcroft27@godaddy.com','n2f1suX4Ov5E','2023-01-29 05:23:26','CUSTOMER'),('jguilliatt10','dceschelli10@woothemes.com','kqAk50Y1Wfgl','2022-10-20 10:55:24','CUSTOMER'),('jnicely28','stremellan28@example.com','QnRIo6','2022-07-19 13:59:40','CUSTOMER'),('josment1d','pstraw1d@bloomberg.com','0mf535MHqGSv','2022-06-17 03:12:03','CUSTOMER'),('kcawdronx','lhanrettyx@princeton.edu','SE3B78k','2023-05-14 13:12:27','CUSTOMER'),('kchristophers22','farchdeckne22@storify.com','uXEVRt','2023-03-11 20:21:46','CUSTOMER'),('kdelisle13','cfulham13@nytimes.com','lFhXnni','2022-08-14 07:09:30','CUSTOMER'),('kjosifovic2h','tlubman2h@businesswire.com','TpzhGP4Z','2022-12-05 19:50:18','CUSTOMER'),('kscarcel','npeacopl@wsj.com','YdzDuQ','2022-12-09 10:02:33','CUSTOMER'),('latley2','ahake2@clickbank.net','qd5WMfhDMkV','2023-01-29 17:09:45','CUSTOMER'),('lbumfrey25','psyseland25@pbs.org','wpbNK9EY7H','2022-10-21 15:24:24','CUSTOMER'),('lcornill1w','kshallo1w@flickr.com','fo5erKogA','2022-10-02 14:13:43','CUSTOMER'),('lhoultham1z','lpadefield1z@globo.com','8KI0867uvQ','2022-12-06 08:24:43','CUSTOMER'),('lkleis1v','mmottley1v@naver.com','C1KZ68','2023-04-12 00:17:14','CUSTOMER'),('lmcmurty1l','wcahani1l@gov.uk','86EO9Cf4p7Z','2023-02-14 16:36:39','CUSTOMER'),('ltrendle29','wtrower29@dailymotion.com','3NDav4I','2022-08-29 15:24:04','CUSTOMER'),('mdunckley1u','espurr1u@blogger.com','dLe06OTYjuy','2023-02-06 16:48:05','CUSTOMER'),('mecclestone0','enayer0@sitemeter.com','xhMzVQ29','2023-01-03 06:11:32','CUSTOMER'),('mhunnawill2d','abeilby2d@mysql.com','vGjD5dY5gesR','2022-08-18 07:47:00','CUSTOMER'),('mpaddicka','efransecoa@nsw.gov.au','vlimoeM61k8r','2022-07-26 18:26:52','CUSTOMER'),('mtrinemanj','fhupkaj@wordpress.org','8PGjwRDloTzW','2022-07-08 09:54:53','CUSTOMER'),('nbarstock1y','mmarzele1y@mediafire.com','r59oyj','2022-12-09 04:14:10','CUSTOMER'),('ngarthshore6','sfuzzard6@mashable.com','DC02LcyGi','2023-04-05 15:43:31','CUSTOMER'),('nmoth1r','agemmill1r@xrea.com','cIfy5GlgL65','2023-05-19 05:46:31','CUSTOMER'),('ntidmas1x','ilabarre1x@cocolog-nifty.com','NyMjr5','2022-08-11 01:13:24','CUSTOMER'),('okix1q','caldwinckle1q@bbb.org','eIqleJXz','2023-05-26 00:39:12','CUSTOMER'),('olanfere2m','hflamank2m@cam.ac.uk','K42GhD','2022-12-15 04:01:50','CUSTOMER'),('pghost1i','clampaert1i@printfriendly.com','d6DJH6A','2022-06-29 05:12:49','CUSTOMER'),('pkingsnoadc','msorroc@loc.gov','4fn6oeXv','2022-10-26 16:04:51','CUSTOMER'),('ppraundlin1n','rjobb1n@biblegateway.com','Tn9S9PVu2sIM','2023-05-24 14:24:44','CUSTOMER'),('psharphurste','djaycocke@about.me','gfv8N3Qi','2023-03-14 06:51:16','CUSTOMER'),('ptregaskis1j','mleads1j@multiply.com','WC7zBl','2022-08-15 10:57:09','CUSTOMER'),('rbatten7','dmowat7@g.co','gmjhJoEKrG','2023-01-21 18:32:30','CUSTOMER'),('rcarlisih','yhamelh@springer.com','4XlxT6fBy6','2022-12-26 15:55:09','CUSTOMER'),('rcheesworth20','ytillerton20@gnu.org','qc8J7qnr','2023-04-28 04:52:14','CUSTOMER'),('roldford17','mitscowics17@ucla.edu','MgDIJQ7f','2023-01-16 13:26:12','CUSTOMER'),('rtregustv','kboverv@macromedia.com','q2y0Awvt','2023-01-26 12:23:48','CUSTOMER'),('rwerendell2q','mjowle2q@dyndns.org','DR7N43ReoM','2022-06-25 10:16:46','CUSTOMER'),('scatterill2g','apollastrino2g@bravesites.com','zmvfOhk4Cj','2023-04-04 15:28:24','CUSTOMER'),('sdunckley1e','mrolling1e@artisteer.com','kRqlBFbLOt','2022-06-19 13:16:21','CUSTOMER'),('shaggerstone1o','pmcgonigal1o@google.it','A71Z2SFN71','2023-04-21 12:56:11','CUSTOMER'),('ssellor2e','mbertl2e@infoseek.co.jp','fFr2hatZk9Og','2023-02-14 19:21:43','CUSTOMER'),('ssmee2l','ctwentyman2l@blinklist.com','FKl64Et','2023-02-27 14:34:53','CUSTOMER'),('swetheraldb','vivimeyb@tiny.cc','2viIIFkaAEt2','2023-03-20 09:28:17','CUSTOMER'),('Thespian','despkontopoulou@gmail.com','ImContentAdmin123','2023-06-01 14:50:17','CONTENT_ADMIN'),('tmattiam','jgilliganm@parallels.com','wE8Xm2kS3w','2023-05-14 20:14:30','CUSTOMER'),('tmustoo2k','spallant2k@example.com','FTtOReomdYz','2022-12-12 18:44:19','CUSTOMER'),('vcoomer1','tcasserley1@bravesites.com','44ePPYLZR','2023-03-02 11:44:48','CUSTOMER'),('vgeldert24','vgalbraeth24@paypal.com','jimmqxF','2022-12-17 01:36:34','CUSTOMER'),('vpuzey1h','vcatto1h@amazon.com','bjJKV5omk4J','2023-03-12 02:28:43','CUSTOMER'),('vscarsbrooke26','twillars26@unc.edu','R0VDzMpljxK','2023-03-20 14:38:20','CUSTOMER'),('vvivyan21','smoehler21@census.gov','OQ85r3kn','2022-10-15 14:51:37','CUSTOMER'),('wcostys','jshorrocks@elegantthemes.com','YNJYaq8U98','2023-03-17 11:23:34','CUSTOMER'),('whalesworthn','yglasgown@mapy.cz','OwwrYp5jf','2023-02-08 11:32:49','CUSTOMER'),('wkohnertd','ssawyerd@noaa.gov','otEWF3','2022-10-13 12:19:12','CUSTOMER');
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

-- Dump completed on 2023-06-01 15:56:38
