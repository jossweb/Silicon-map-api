-- MariaDB dump 10.19-11.8.3-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: siliconmap
-- ------------------------------------------------------
-- Server version       11.8.3-MariaDB-0+deb13u1 from Debian

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `Message`
--

DROP TABLE IF EXISTS `Message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `tickets` int(11) NOT NULL,
  `author` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ticket` (`tickets`),
  KEY `fk_author` (`author`),
  CONSTRAINT `fk_author` FOREIGN KEY (`author`) REFERENCES `staff` (`id`),
  CONSTRAINT `fk_ticket` FOREIGN KEY (`tickets`) REFERENCES `tickets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Message`
--

LOCK TABLES `Message` WRITE;
/*!40000 ALTER TABLE `Message` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `Message` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `api_login`
--

DROP TABLE IF EXISTS `api_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(250) NOT NULL,
  `hash_pass` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `api_token`
--

DROP TABLE IF EXISTS `api_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token` varchar(40) NOT NULL,
  `expiration` datetime NOT NULL,
  `use_time` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `idx_api_token_user` (`user_id`),
  CONSTRAINT `fk_api_token_user` FOREIGN KEY (`user_id`) REFERENCES `api_login` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `component_load`
--

DROP TABLE IF EXISTS `component_load`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `component_load` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `components_load` int(11) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT current_timestamp(),
  `component_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_load_component_id` (`component_id`),
  CONSTRAINT `fk_load_component_id` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=265280 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component_load`
--

LOCK TABLES `component_load` WRITE;
/*!40000 ALTER TABLE `component_load` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `component_load` VALUES
(1,72,'2025-12-13 22:37:10',1),
(2,81,'2025-12-13 22:37:10',2),
(3,68,'2025-12-13 22:37:10',3),
(4,74,'2025-12-13 22:37:10',4),
(5,55,'2025-12-13 22:37:10',5),
(6,65,'2025-12-13 22:37:10',6),
(7,77,'2025-12-13 22:37:10',7),
(8,61,'2025-12-13 22:37:10',8),
(9,69,'2025-12-13 22:37:10',9),
(10,52,'2025-12-13 22:37:10',10),
(11,70,'2025-12-13 22:37:10',11),
(12,78,'2025-12-13 22:37:10',12),
(13,66,'2025-12-13 22:37:10',13),
(14,71,'2025-12-13 22:37:10',14),
(15,50,'2025-12-13 22:37:10',15),
(16,64,'2025-12-13 22:37:10',16),
(17,73,'2025-12-13 22:37:10',17),
(18,59,'2025-12-13 22:37:10',18),
(19,67,'2025-12-13 22:37:10',19),
(20,48,'2025-12-13 22:37:10',20),
(21,82,'2025-12-13 22:37:10',21),
(22,80,'2025-12-13 22:37:10',22),
(23,62,'2025-12-13 22:37:10',23),
(24,76,'2025-12-13 22:37:10',24),
(25,53,'2025-12-13 22:37:10',25),
(26,91,'2025-12-13 22:37:10',26),
(27,98,'2025-12-13 22:37:10',27),
(28,88,'2025-12-13 22:37:10',28),
(29,74,'2025-12-13 22:37:10',29),
(30,85,'2025-12-13 22:37:10',30),
(31,68,'2025-12-13 22:37:10',31),
(32,76,'2025-12-13 22:37:10',32),
(33,82,'2025-12-13 22:37:10',33),
(34,71,'2025-12-13 22:37:10',34),
(35,66,'2025-12-13 22:37:10',35),
(36,73,'2025-12-13 22:37:10',36),
(37,60,'2025-12-13 22:37:10',37),
(38,69,'2025-12-13 22:37:10',38),
(39,74,'2025-12-13 22:37:10',39),
(40,58,'2025-12-13 22:37:10',40),
(41,67,'2025-12-13 22:37:10',41),
(42,49,'2025-12-13 22:37:10',42),
(43,71,'2025-12-13 22:37:10',43),
(44,76,'2025-12-13 22:37:10',44),
(45,61,'2025-12-13 22:37:10',45),
(46,70,'2025-12-13 22:37:10',46),
(47,52,'2025-12-13 22:37:10',47),
(48,45,'2025-12-13 22:37:10',48),
(49,84,'2025-12-14 20:51:51',1),
(50,90,'2025-12-14 20:51:51',2),
(51,78,'2025-12-14 20:51:51',3),
(52,86,'2025-12-14 20:51:51',4),
(53,68,'2025-12-14 20:51:51',5),
(54,80,'2025-12-14 20:51:51',6),
(55,88,'2025-12-14 20:51:51',7),
(56,75,'2025-12-14 20:51:51',8),
(57,83,'2025-12-14 20:51:51',9),
(58,65,'2025-12-14 20:51:51',10),
(59,82,'2025-12-14 20:51:51',11),
(60,89,'2025-12-14 20:51:51',12),
(61,77,'2025-12-14 20:51:51',13),
(62,85,'2025-12-14 20:51:51',14),
(63,66,'2025-12-14 20:51:51',15),
(64,79,'2025-12-14 20:51:51',16),
(65,86,'2025-12-14 20:51:51',17),
(66,73,'2025-12-14 20:51:51',18),
(67,81,'2025-12-14 20:51:51',19),
(68,64,'2025-12-14 20:51:51',20),
(69,91,'2025-12-14 20:51:51',21),
(70,88,'2025-12-14 20:51:51',22),
(71,76,'2025-12-14 20:51:51',23),
(72,89,'2025-12-14 20:51:51',24),
(73,70,'2025-12-14 20:51:51',25),
(74,95,'2025-12-14 20:51:51',26),
(75,99,'2025-12-14 20:51:51',27),
(76,94,'2025-12-14 20:51:51',28),
(77,87,'2025-12-14 20:51:51',29),
(78,92,'2025-12-14 20:51:51',30),
(79,78,'2025-12-14 20:51:51',31),
(80,88,'2025-12-14 20:51:51',32),
(81,93,'2025-12-14 20:51:51',33),
(82,90,'2025-12-14 20:51:51',34),
(83,82,'2025-12-14 20:51:51',35),
(84,89,'2025-12-14 20:51:51',36),
(85,74,'2025-12-14 20:51:51',37),
(86,83,'2025-12-14 20:51:51',38),
(87,88,'2025-12-14 20:51:51',39),
(88,72,'2025-12-14 20:51:51',40),
(89,84,'2025-12-14 20:51:51',41),
(90,67,'2025-12-14 20:51:51',42),
(91,85,'2025-12-14 20:51:51',43),
(92,90,'2025-12-14 20:51:51',44),
(93,74,'2025-12-14 20:51:51',45),
(94,87,'2025-12-14 20:51:51',46),
(95,69,'2025-12-14 20:51:51',47),
(96,63,'2025-12-14 20:51:51',48),
(97,72,'2025-12-23 16:22:40',1),
(98,75,'2025-12-23 16:22:50',1),
(99,78,'2025-12-23 16:23:00',1),
(100,80,'2025-12-23 16:23:10',1),
(101,77,'2025-12-23 16:23:20',1),
(102,68,'2025-12-23 16:22:40',2),
(103,70,'2025-12-23 16:22:50',2),
(104,73,'2025-12-23 16:23:00',2),
(105,75,'2025-12-23 16:23:10',2),
(106,72,'2025-12-23 16:23:20',2),
(107,81,'2025-12-23 16:22:40',3),
(108,83,'2025-12-23 16:22:50',3),
(109,85,'2025-12-23 16:23:00',3),
(110,88,'2025-12-23 16:23:10',3),
(111,86,'2025-12-23 16:23:20',3),
(112,64,'2025-12-23 16:22:40',4),
(113,66,'2025-12-23 16:22:50',4),
(114,69,'2025-12-23 16:23:00',4),
(115,71,'2025-12-23 16:23:10',4),
(116,70,'2025-12-23 16:23:20',4),
(117,90,'2025-12-23 16:22:40',5),
(118,92,'2025-12-23 16:22:50',5),
(119,94,'2025-12-23 16:23:00',5),
(120,96,'2025-12-23 16:23:10',5),
(121,93,'2025-12-23 16:23:20',5),
(122,70,'2025-12-23 16:22:40',6),
(123,72,'2025-12-23 16:22:50',6),
(124,74,'2025-12-23 16:23:00',6),
(125,76,'2025-12-23 16:23:10',6),
(126,73,'2025-12-23 16:23:20',6),
(127,71,'2025-12-23 16:22:40',7),
(128,73,'2025-12-23 16:22:50',7),
(129,75,'2025-12-23 16:23:00',7),
(130,77,'2025-12-23 16:23:10',7),
(131,74,'2025-12-23 16:23:20',7),
(132,72,'2025-12-23 16:22:40',8),
(133,74,'2025-12-23 16:22:50',8),
(134,76,'2025-12-23 16:23:00',8),
(135,78,'2025-12-23 16:23:10',8),
(136,75,'2025-12-23 16:23:20',8),
(137,73,'2025-12-23 16:22:40',9),
(138,75,'2025-12-23 16:22:50',9),
(139,77,'2025-12-23 16:23:00',9),
(140,79,'2025-12-23 16:23:10',9),
(141,76,'2025-12-23 16:23:20',9),
(142,74,'2025-12-23 16:22:40',10),
(143,76,'2025-12-23 16:22:50',10),
(144,78,'2025-12-23 16:23:00',10),
(145,80,'2025-12-23 16:23:10',10),
(146,77,'2025-12-23 16:23:20',10),
(147,75,'2025-12-23 16:22:40',11),
(148,77,'2025-12-23 16:22:50',11),
(149,79,'2025-12-23 16:23:00',11),
(150,81,'2025-12-23 16:23:10',11),
(151,78,'2025-12-23 16:23:20',11),
(152,76,'2025-12-23 16:22:40',12),
(153,78,'2025-12-23 16:22:50',12),
(154,80,'2025-12-23 16:23:00',12),
(155,82,'2025-12-23 16:23:10',12),
(156,79,'2025-12-23 16:23:20',12),
(157,77,'2025-12-23 16:22:40',13),
(158,79,'2025-12-23 16:22:50',13),
(159,81,'2025-12-23 16:23:00',13),
(160,83,'2025-12-23 16:23:10',13),
(161,80,'2025-12-23 16:23:20',13),
(162,78,'2025-12-23 16:22:40',14),
(163,80,'2025-12-23 16:22:50',14),
(164,82,'2025-12-23 16:23:00',14),
(165,84,'2025-12-23 16:23:10',14),
(166,81,'2025-12-23 16:23:20',14),
(167,79,'2025-12-23 16:22:40',15),
(168,81,'2025-12-23 16:22:50',15),
(169,83,'2025-12-23 16:23:00',15),
(170,85,'2025-12-23 16:23:10',15),
(171,82,'2025-12-23 16:23:20',15),
(172,80,'2025-12-23 16:22:40',16),
(173,82,'2025-12-23 16:22:50',16),
(174,84,'2025-12-23 16:23:00',16),
(175,86,'2025-12-23 16:23:10',16),
(176,83,'2025-12-23 16:23:20',16),
(177,81,'2025-12-23 16:22:40',17),
(178,83,'2025-12-23 16:22:50',17),
(179,85,'2025-12-23 16:23:00',17),
(180,87,'2025-12-23 16:23:10',17),
(181,84,'2025-12-23 16:23:20',17),
(182,82,'2025-12-23 16:22:40',18),
(183,84,'2025-12-23 16:22:50',18),
(184,86,'2025-12-23 16:23:00',18),
(185,88,'2025-12-23 16:23:10',18),
(186,85,'2025-12-23 16:23:20',18),
(187,83,'2025-12-23 16:22:40',19),
(188,85,'2025-12-23 16:22:50',19),
(189,87,'2025-12-23 16:23:00',19),
(190,89,'2025-12-23 16:23:10',19),
(191,86,'2025-12-23 16:23:20',19),
(192,84,'2025-12-23 16:22:40',20),
(193,86,'2025-12-23 16:22:50',20),
(194,88,'2025-12-23 16:23:00',20),
(195,90,'2025-12-23 16:23:10',20),
(196,87,'2025-12-23 16:23:20',20),
(197,85,'2025-12-23 16:22:40',21),
(198,87,'2025-12-23 16:22:50',21),
(199,89,'2025-12-23 16:23:00',21),
(200,91,'2025-12-23 16:23:10',21),
(201,88,'2025-12-23 16:23:20',21),
(202,86,'2025-12-23 16:22:40',22),
(203,88,'2025-12-23 16:22:50',22),
(204,90,'2025-12-23 16:23:00',22),
(205,92,'2025-12-23 16:23:10',22),
(206,89,'2025-12-23 16:23:20',22),
(207,87,'2025-12-23 16:22:40',23),
(208,89,'2025-12-23 16:22:50',23),
(209,91,'2025-12-23 16:23:00',23),
(210,93,'2025-12-23 16:23:10',23),
(211,90,'2025-12-23 16:23:20',23),
(212,88,'2025-12-23 16:22:40',24),
(213,90,'2025-12-23 16:22:50',24),
(214,92,'2025-12-23 16:23:00',24),
(215,94,'2025-12-23 16:23:10',24),
(216,91,'2025-12-23 16:23:20',24),
(217,89,'2025-12-23 16:22:40',25),
(218,91,'2025-12-23 16:22:50',25),
(219,93,'2025-12-23 16:23:00',25),
(220,95,'2025-12-23 16:23:10',25),
(221,92,'2025-12-23 16:23:20',25),
(222,90,'2025-12-23 16:22:40',26),
(223,92,'2025-12-23 16:22:50',26),
(224,94,'2025-12-23 16:23:00',26),
(225,96,'2025-12-23 16:23:10',26),
(226,93,'2025-12-23 16:23:20',26),
(227,91,'2025-12-23 16:22:40',27),
(228,93,'2025-12-23 16:22:50',27),
(229,95,'2025-12-23 16:23:00',27),
(230,97,'2025-12-23 16:23:10',27),
(231,94,'2025-12-23 16:23:20',27),
(232,92,'2025-12-23 16:22:40',28),
(233,94,'2025-12-23 16:22:50',28),
(234,96,'2025-12-23 16:23:00',28),
(235,98,'2025-12-23 16:23:10',28),
(236,95,'2025-12-23 16:23:20',28),
(237,93,'2025-12-23 16:22:40',29),
(238,95,'2025-12-23 16:22:50',29),
(239,97,'2025-12-23 16:23:00',29),
(240,99,'2025-12-23 16:23:10',29),
(241,96,'2025-12-23 16:23:20',29),
(242,94,'2025-12-23 16:22:40',30),
(243,96,'2025-12-23 16:22:50',30),
(244,98,'2025-12-23 16:23:00',30),
(245,99,'2025-12-23 16:23:10',30),
(246,97,'2025-12-23 16:23:20',30),
(247,95,'2025-12-23 16:22:40',31),
(248,96,'2025-12-23 16:22:50',31),
(249,97,'2025-12-23 16:23:00',31),
(250,98,'2025-12-23 16:23:10',31);
/*!40000 ALTER TABLE `component_load` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `components`
--

DROP TABLE IF EXISTS `components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(40) NOT NULL,
  `model` varchar(80) NOT NULL,
  `machine_id` int(11) DEFAULT NULL,
  `spec_value_primary` int(11) DEFAULT NULL,
  `spec_value_secondary` int(11) DEFAULT NULL,
  `type` enum('CPU','GPU','RAM','DISK','Power_supply','Chassis') DEFAULT NULL,
  `status` enum('actually_use','ready','maintenance','issue') DEFAULT NULL,
  `ticket` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_components_machine_id` (`machine_id`),
  KEY `fk_components_ticket` (`ticket`),
  CONSTRAINT `fk_components_machine_id` FOREIGN KEY (`machine_id`) REFERENCES `machines` (`id`),
  CONSTRAINT `fk_components_ticket` FOREIGN KEY (`ticket`) REFERENCES `tickets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components`
--

LOCK TABLES `components` WRITE;
/*!40000 ALTER TABLE `components` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `components` VALUES
(1,'AMD','EPYC 7313',2,16,512,'CPU','actually_use',NULL),
(2,'Kingston','DDR4 ECC',2,128,4,'RAM','actually_use',NULL),
(3,'Seagate','Exos X18',2,18000,NULL,'DISK','actually_use',NULL),
(4,'Seasonic','Prime TX-1000',2,1000,NULL,'Power_supply','actually_use',NULL),
(5,'Supermicro','4U Storage Chassis',2,4,NULL,'Chassis','actually_use',NULL),
(6,'AMD','EPYC 7282',3,16,512,'CPU','maintenance',NULL),
(7,'Kingston','DDR4 ECC',3,96,4,'RAM','actually_use',NULL),
(8,'Seagate','Exos X16',3,16000,NULL,'DISK','actually_use',NULL),
(9,'Corsair','RM850x',3,850,NULL,'Power_supply','actually_use',NULL),
(10,'Supermicro','4U Storage Chassis',3,4,NULL,'Chassis','actually_use',NULL),
(11,'Intel','Xeon Silver 4314',4,16,256,'CPU','actually_use',NULL),
(12,'Samsung','DDR4 ECC',4,64,4,'RAM','actually_use',NULL),
(13,'Samsung','PM9A3 NVMe',4,2000,NULL,'DISK','actually_use',NULL),
(14,'Seasonic','Focus GX-750',4,750,NULL,'Power_supply','actually_use',NULL),
(15,'Dell','2U Server Chassis',4,2,NULL,'Chassis','actually_use',NULL),
(16,'Intel','Xeon Silver 4210',5,10,192,'CPU','actually_use',NULL),
(17,'Samsung','DDR4 ECC',5,48,4,'RAM','actually_use',NULL),
(18,'Crucial','MX500 SSD',5,1000,NULL,'DISK','actually_use',NULL),
(19,'Corsair','RM750',5,750,NULL,'Power_supply','actually_use',NULL),
(20,'Dell','2U Server Chassis',5,2,NULL,'Chassis','actually_use',NULL),
(21,'AMD','EPYC 7302',6,16,256,'CPU','issue',NULL),
(22,'Kingston','DDR4 ECC',6,64,4,'RAM','actually_use',NULL),
(23,'Intel','DC S4510',6,2000,NULL,'DISK','actually_use',NULL),
(24,'Seasonic','Focus GX-650',6,650,NULL,'Power_supply','actually_use',NULL),
(25,'Supermicro','1U Server Chassis',6,1,NULL,'Chassis','actually_use',NULL),
(26,'AMD','EPYC 7402',7,24,512,'CPU','actually_use',NULL),
(27,'NVIDIA','A100',7,80,6912,'GPU','actually_use',NULL),
(28,'Samsung','DDR4 ECC',7,256,4,'RAM','actually_use',NULL),
(29,'Samsung','PM9A3 NVMe',7,4000,NULL,'DISK','actually_use',NULL),
(30,'Seasonic','Prime PX-1600',7,1600,NULL,'Power_supply','actually_use',NULL),
(31,'Supermicro','4U GPU Chassis',7,4,NULL,'Chassis','actually_use',NULL),
(32,'AMD','EPYC 7352',8,24,512,'CPU','maintenance',NULL),
(33,'NVIDIA','RTX 6000 Ada',8,48,18176,'GPU','ready',NULL),
(34,'Samsung','DDR4 ECC',8,128,4,'RAM','actually_use',NULL),
(35,'Samsung','PM9A3 NVMe',8,2000,NULL,'DISK','actually_use',NULL),
(36,'Corsair','AX1600i',8,1600,NULL,'Power_supply','actually_use',NULL),
(37,'Supermicro','4U GPU Chassis',8,4,NULL,'Chassis','actually_use',NULL),
(38,'AMD','EPYC 3251',10,8,64,'CPU','actually_use',NULL),
(39,'Kingston','DDR4 ECC',10,32,4,'RAM','actually_use',NULL),
(40,'Intel','SSD DC S3500',10,480,NULL,'DISK','actually_use',NULL),
(41,'Seasonic','Focus GX-550',10,550,NULL,'Power_supply','actually_use',NULL),
(42,'Netgate','1U Network Chassis',10,1,NULL,'Chassis','actually_use',NULL),
(43,'Intel','Xeon D-2146NT',11,8,128,'CPU','actually_use',NULL),
(44,'Samsung','DDR4 ECC',11,32,4,'RAM','actually_use',NULL),
(45,'Intel','SSD DC S3510',11,480,NULL,'DISK','actually_use',NULL),
(46,'Seasonic','Focus GX-650',11,650,NULL,'Power_supply','actually_use',NULL),
(47,'Netgate','1U Security Chassis',11,1,NULL,'Chassis','actually_use',NULL),
(48,'AMD','EPYC 7313',2,16,512,'CPU','actually_use',NULL),
(49,'NVIDIA','H100',NULL,96,16896,'Chassis','actually_use',NULL),
(56,'Nvidia','H200 ',NULL,141,16896,'GPU',NULL,NULL);
/*!40000 ALTER TABLE `components` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_uca1400_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `componentCheckInsert` BEFORE INSERT ON `components` FOR EACH ROW BEGIN
    IF NEW.ticket IS NOT NULL AND NEW.machine_id IS NOT NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'A component can’t be assigned to both a ticket and a machine at the same time!';
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
/*!50003 SET collation_connection  = utf8mb4_uca1400_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `machines_before_insert` BEFORE INSERT ON `components` FOR EACH ROW BEGIN
    IF NEW.machine_id IS NOT NULL THEN
        SET NEW.status = 'actually_use';
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
/*!50003 SET collation_connection  = utf8mb4_uca1400_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `componentCheckUpdate` BEFORE UPDATE ON `components` FOR EACH ROW BEGIN
    IF NEW.ticket IS NOT NULL AND NEW.machine_id IS NOT NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'A component can’t be assigned to both a ticket and a machine at the same time.';
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
/*!50003 SET collation_connection  = utf8mb4_uca1400_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `componentStatusGestion` BEFORE UPDATE ON `components` FOR EACH ROW BEGIN
    IF NEW.ticket IS NOT NULL OR NEW.machine_id IS NOT NULL THEN
        SET NEW.status = 'actually_use';
    ELSE
        SET NEW.status = 'ready';
    END IF ;
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
/*!50003 SET collation_connection  = utf8mb4_uca1400_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `componentTicketReassignCheck` BEFORE UPDATE ON `components` FOR EACH ROW BEGIN
    IF OLD.ticket IS NOT NULL
        AND NEW.ticket IS NOT NULL
        AND NEW.ticket <> OLD.ticket THEN

        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'You can’t change the ticket on a machine that is already used in another ticket';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `machines`
--

DROP TABLE IF EXISTS `machines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `machines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `mac_address` varchar(17) NOT NULL,
  `os` varchar(255) NOT NULL,
  `status` enum('Online','Offline','Maintenance') NOT NULL DEFAULT 'Offline',
  `type` enum('Storage','Compute','GPU_Compute','switch','router','firewall') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machines`
--

LOCK TABLES `machines` WRITE;
/*!40000 ALTER TABLE `machines` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `machines` VALUES
(2,'stor-01','10.0.0.10','00:1A:2B:3C:4D:10','TrueNAS SCALE','Online','Storage'),
(3,'stor-02','10.0.0.11','00:1A:2B:3C:4D:11','TrueNAS CORE','Online','Storage'),
(4,'compute-01','10.0.0.20','00:1A:2B:3C:4D:20','Ubuntu Server 22.04','Online','Compute'),
(5,'compute-02','10.0.0.21','00:1A:2B:3C:4D:21','Debian 12','Online','Compute'),
(6,'compute-03','10.0.0.22','00:1A:2B:3C:4D:22','Rocky Linux 9','Online','Compute'),
(7,'gpu-01','10.0.0.30','00:1A:2B:3C:4D:30','Ubuntu Server 22.04','Online','GPU_Compute'),
(8,'gpu-02','10.0.0.31','00:1A:2B:3C:4D:31','Ubuntu Server 22.04','Online','GPU_Compute'),
(9,'sw-core-01','10.0.0.2','00:1A:2B:3C:4D:02','Cisco IOS','Online','switch'),
(10,'rt-edge-01','10.0.0.1','00:1A:2B:3C:4D:01','VyOS','Online','router'),
(11,'fw-01','10.0.0.254','00:1A:2B:3C:4D:FE','OPNsense','Online','firewall');
/*!40000 ALTER TABLE `machines` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `role` enum('admin','technician') NOT NULL,
  `available` tinyint(4) NOT NULL DEFAULT 0,
  `hashpass` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_staff_user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `staff` VALUES
(13,'FIGUEIRAS','Jossua','contact@jossua.dev','admin',0,'$2a$12$i3YnMztVE//cal/DeACsmOffv5Z04hWTt1aTagW6m2FYSN0L5NeiC'),
(15,'FIGUEIRAS','Jossua','contact1@jossua.dev','technician',0,'$2a$12$7SyDAVjT4su6H0iENKhknu.i9twaFSMl141Ipak01AqlizL3yO5h6'),
(40,'Technicien','exemple','5Uj!=.s:uMI::&P3az@U9a1x,)z8T!7X','technician',0,'$2a$12$eZqq54azNVvHzElDb5mAnuPtx1ryEBJc1rzLq7Cw.gIekTRv8P7T6'),
(41,'Admin','exemple','3m)§?o?JgAS!@Ic§L3d9/T1+fx-9;gyN','admin',0,'$2a$12$8OG7R4Ptv.VmA86QEgirAuGdBFaKx09WAYNsqLQKb7s8.MJpeMkHu');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `temperature`
--

DROP TABLE IF EXISTS `temperature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `temperature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `temperature` int(11) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT current_timestamp(),
  `machine_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_temperature_machine_id` (`machine_id`),
  CONSTRAINT `fk_temperature_machine_id` FOREIGN KEY (`machine_id`) REFERENCES `machines` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53906 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temperature`
--

LOCK TABLES `temperature` WRITE;
/*!40000 ALTER TABLE `temperature` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `temperature` VALUES
(1,38,'2025-12-13 22:19:44',2),
(2,34,'2025-12-13 22:19:44',3),
(3,46,'2025-12-13 22:19:44',4),
(4,44,'2025-12-13 22:19:44',5),
(5,41,'2025-12-13 22:19:44',6);
/*!40000 ALTER TABLE `temperature` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `machine_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `title` varchar(40) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('open','in_progress','closed') DEFAULT 'open',
  `open_at` datetime DEFAULT current_timestamp(),
  `closed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tickets_machine_id` (`machine_id`),
  KEY `fk_tickets_created_by` (`created_by`),
  KEY `fk_tickets_assigned_to` (`assigned_to`),
  CONSTRAINT `fk_tickets_assigned_to` FOREIGN KEY (`assigned_to`) REFERENCES `staff` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tickets_created_by` FOREIGN KEY (`created_by`) REFERENCES `staff` (`id`),
  CONSTRAINT `fk_tickets_machine_id` FOREIGN KEY (`machine_id`) REFERENCES `machines` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_uca1400_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `ticketStatusGestion` BEFORE UPDATE ON `tickets` FOR EACH ROW BEGIN
    IF NEW.closed_at IS NOT NULL THEN
        SET NEW.status = 'Closed';
    END IF;
END */;;
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
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-01-11 14:26:05