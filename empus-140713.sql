-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: empus
-- ------------------------------------------------------
-- Server version	5.5.37-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `berita`
--

DROP TABLE IF EXISTS `berita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `berita` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `berita`
--

LOCK TABLES `berita` WRITE;
/*!40000 ALTER TABLE `berita` DISABLE KEYS */;
/*!40000 ALTER TABLE `berita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `berita_desc`
--

DROP TABLE IF EXISTS `berita_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `berita_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `berita_id` int(11) NOT NULL,
  `desc` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `berita_id` (`berita_id`),
  CONSTRAINT `berita_desc_ibfk_1` FOREIGN KEY (`berita_id`) REFERENCES `berita` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `berita_desc`
--

LOCK TABLES `berita_desc` WRITE;
/*!40000 ALTER TABLE `berita_desc` DISABLE KEYS */;
/*!40000 ALTER TABLE `berita_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `berita_img`
--

DROP TABLE IF EXISTS `berita_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `berita_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `berita_id` int(11) NOT NULL,
  `img` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `berita_id` (`berita_id`),
  CONSTRAINT `berita_img_ibfk_1` FOREIGN KEY (`berita_id`) REFERENCES `berita` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `berita_img`
--

LOCK TABLES `berita_img` WRITE;
/*!40000 ALTER TABLE `berita_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `berita_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `berita_instansi`
--

DROP TABLE IF EXISTS `berita_instansi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `berita_instansi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `berita_id` int(11) NOT NULL,
  `instansi_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `berita_id` (`berita_id`,`instansi_id`),
  KEY `instansi_id` (`instansi_id`),
  CONSTRAINT `berita_instansi_ibfk_1` FOREIGN KEY (`berita_id`) REFERENCES `berita` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `berita_instansi_ibfk_2` FOREIGN KEY (`instansi_id`) REFERENCES `instansi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `berita_instansi`
--

LOCK TABLES `berita_instansi` WRITE;
/*!40000 ALTER TABLE `berita_instansi` DISABLE KEYS */;
/*!40000 ALTER TABLE `berita_instansi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `berita_pelayanan`
--

DROP TABLE IF EXISTS `berita_pelayanan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `berita_pelayanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pelayanan_id` int(11) NOT NULL,
  `berita_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pelayanan_id` (`pelayanan_id`,`berita_id`),
  KEY `berita_id` (`berita_id`),
  CONSTRAINT `berita_pelayanan_ibfk_1` FOREIGN KEY (`pelayanan_id`) REFERENCES `pelayanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `berita_pelayanan_ibfk_2` FOREIGN KEY (`berita_id`) REFERENCES `berita` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `berita_pelayanan`
--

LOCK TABLES `berita_pelayanan` WRITE;
/*!40000 ALTER TABLE `berita_pelayanan` DISABLE KEYS */;
/*!40000 ALTER TABLE `berita_pelayanan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `berita_tag`
--

DROP TABLE IF EXISTS `berita_tag`;
/*!50001 DROP VIEW IF EXISTS `berita_tag`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `berita_tag` (
  `id` tinyint NOT NULL,
  `berita_id` tinyint NOT NULL,
  `tag_id` tinyint NOT NULL,
  `type` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `instansi`
--

DROP TABLE IF EXISTS `instansi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instansi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `ts_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`person_id`),
  KEY `FK_instansi_person` (`person_id`),
  CONSTRAINT `FK_instansi_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instansi`
--

LOCK TABLES `instansi` WRITE;
/*!40000 ALTER TABLE `instansi` DISABLE KEYS */;
INSERT INTO `instansi` VALUES (11,'Kelurahan Tegal Gundil',39,'2014-07-11 16:31:41');
/*!40000 ALTER TABLE `instansi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instansi_berita`
--

DROP TABLE IF EXISTS `instansi_berita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instansi_berita` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instansi_id` int(11) NOT NULL,
  `berita_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instansi_id` (`instansi_id`,`berita_id`),
  KEY `berita_id` (`berita_id`),
  CONSTRAINT `instansi_berita_ibfk_1` FOREIGN KEY (`instansi_id`) REFERENCES `instansi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `instansi_berita_ibfk_2` FOREIGN KEY (`berita_id`) REFERENCES `berita` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instansi_berita`
--

LOCK TABLES `instansi_berita` WRITE;
/*!40000 ALTER TABLE `instansi_berita` DISABLE KEYS */;
/*!40000 ALTER TABLE `instansi_berita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instansi_desc`
--

DROP TABLE IF EXISTS `instansi_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instansi_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instansi_id` int(11) NOT NULL,
  `desc` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instansi_id` (`instansi_id`),
  CONSTRAINT `instansi_desc_ibfk_1` FOREIGN KEY (`instansi_id`) REFERENCES `instansi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instansi_desc`
--

LOCK TABLES `instansi_desc` WRITE;
/*!40000 ALTER TABLE `instansi_desc` DISABLE KEYS */;
INSERT INTO `instansi_desc` VALUES (7,11,'Kelurahan tegal gundil');
/*!40000 ALTER TABLE `instansi_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instansi_img`
--

DROP TABLE IF EXISTS `instansi_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instansi_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instansi_id` int(11) NOT NULL,
  `img` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instansi_id` (`instansi_id`),
  CONSTRAINT `instansi_img_ibfk_1` FOREIGN KEY (`instansi_id`) REFERENCES `instansi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instansi_img`
--

LOCK TABLES `instansi_img` WRITE;
/*!40000 ALTER TABLE `instansi_img` DISABLE KEYS */;
INSERT INTO `instansi_img` VALUES (7,11,'11.png');
/*!40000 ALTER TABLE `instansi_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instansi_pelayanan`
--

DROP TABLE IF EXISTS `instansi_pelayanan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instansi_pelayanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instansi_id` int(11) NOT NULL,
  `pelayanan_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instansi_id` (`instansi_id`,`pelayanan_id`),
  KEY `pelayanan_id` (`pelayanan_id`),
  CONSTRAINT `instansi_pelayanan_ibfk_1` FOREIGN KEY (`instansi_id`) REFERENCES `instansi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `instansi_pelayanan_ibfk_2` FOREIGN KEY (`pelayanan_id`) REFERENCES `pelayanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instansi_pelayanan`
--

LOCK TABLES `instansi_pelayanan` WRITE;
/*!40000 ALTER TABLE `instansi_pelayanan` DISABLE KEYS */;
INSERT INTO `instansi_pelayanan` VALUES (13,11,4);
/*!40000 ALTER TABLE `instansi_pelayanan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instansi_profile`
--

DROP TABLE IF EXISTS `instansi_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instansi_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instansi_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`instansi_id`,`profile_id`),
  UNIQUE KEY `id` (`id`),
  KEY `profile_id` (`profile_id`),
  CONSTRAINT `instansi_profile_ibfk_1` FOREIGN KEY (`instansi_id`) REFERENCES `instansi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `instansi_profile_ibfk_2` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instansi_profile`
--

LOCK TABLES `instansi_profile` WRITE;
/*!40000 ALTER TABLE `instansi_profile` DISABLE KEYS */;
INSERT INTO `instansi_profile` VALUES (10,11,1,'0251-8376340'),(9,11,4,'Jl. Arztimar II No.3 ');
/*!40000 ALTER TABLE `instansi_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komentar`
--

DROP TABLE IF EXISTS `komentar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komentar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opini_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `opini_id` (`opini_id`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `komentar_ibfk_1` FOREIGN KEY (`opini_id`) REFERENCES `opini` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `komentar_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komentar`
--

LOCK TABLES `komentar` WRITE;
/*!40000 ALTER TABLE `komentar` DISABLE KEYS */;
INSERT INTO `komentar` VALUES (13,25,36,'2014-07-12 00:17:39','2014-07-12 00:17:39'),(14,25,36,'2014-07-12 00:17:48','2014-07-12 00:17:48'),(15,25,38,'2014-07-13 00:39:44','2014-07-13 00:39:44'),(16,26,38,'2014-07-13 00:40:30','2014-07-13 00:40:30'),(17,26,39,'2014-07-13 00:41:32','2014-07-13 00:41:33');
/*!40000 ALTER TABLE `komentar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komentar_desc`
--

DROP TABLE IF EXISTS `komentar_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komentar_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `komentar_id` int(11) NOT NULL,
  `desc` text NOT NULL,
  PRIMARY KEY (`komentar_id`),
  UNIQUE KEY `id` (`id`),
  CONSTRAINT `komentar_desc_ibfk_1` FOREIGN KEY (`komentar_id`) REFERENCES `komentar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komentar_desc`
--

LOCK TABLES `komentar_desc` WRITE;
/*!40000 ALTER TABLE `komentar_desc` DISABLE KEYS */;
INSERT INTO `komentar_desc` VALUES (12,13,'Kometar ah'),(13,14,'Komentar lagi yo'),(14,15,'test'),(15,16,'komentar\" guweh'),(16,17,'test');
/*!40000 ALTER TABLE `komentar_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opini`
--

DROP TABLE IF EXISTS `opini`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opini` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `person_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_opini_person` (`person_id`),
  CONSTRAINT `FK_opini_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opini`
--

LOCK TABLES `opini` WRITE;
/*!40000 ALTER TABLE `opini` DISABLE KEYS */;
INSERT INTO `opini` VALUES (25,'Opini',1,1,36,'2014-07-12 07:17:03',NULL),(26,'Opini',1,1,38,'2014-07-13 07:40:19',NULL);
/*!40000 ALTER TABLE `opini` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opini_desc`
--

DROP TABLE IF EXISTS `opini_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opini_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opini_id` int(11) NOT NULL,
  `desc` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `opini_id` (`opini_id`),
  CONSTRAINT `opini_desc_ibfk_1` FOREIGN KEY (`opini_id`) REFERENCES `opini` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opini_desc`
--

LOCK TABLES `opini_desc` WRITE;
/*!40000 ALTER TABLE `opini_desc` DISABLE KEYS */;
INSERT INTO `opini_desc` VALUES (23,25,'Pelayanan nya asoy'),(24,26,'opiqw');
/*!40000 ALTER TABLE `opini_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opini_img`
--

DROP TABLE IF EXISTS `opini_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opini_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opini_id` int(11) NOT NULL,
  `img` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `opini_id` (`opini_id`),
  CONSTRAINT `opini_img_ibfk_1` FOREIGN KEY (`opini_id`) REFERENCES `opini` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opini_img`
--

LOCK TABLES `opini_img` WRITE;
/*!40000 ALTER TABLE `opini_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `opini_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opini_instansi`
--

DROP TABLE IF EXISTS `opini_instansi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opini_instansi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opini_id` int(11) NOT NULL,
  `instansi_id` int(11) NOT NULL,
  PRIMARY KEY (`opini_id`),
  UNIQUE KEY `id` (`id`),
  KEY `instansi_id` (`instansi_id`),
  CONSTRAINT `opini_instansi_ibfk_1` FOREIGN KEY (`opini_id`) REFERENCES `opini` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `opini_instansi_ibfk_2` FOREIGN KEY (`instansi_id`) REFERENCES `instansi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opini_instansi`
--

LOCK TABLES `opini_instansi` WRITE;
/*!40000 ALTER TABLE `opini_instansi` DISABLE KEYS */;
INSERT INTO `opini_instansi` VALUES (1,26,11);
/*!40000 ALTER TABLE `opini_instansi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opini_instansi_pelayanan`
--

DROP TABLE IF EXISTS `opini_instansi_pelayanan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opini_instansi_pelayanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opini_id` int(11) NOT NULL,
  `instansi_pelayanan_id` int(11) NOT NULL,
  PRIMARY KEY (`opini_id`),
  UNIQUE KEY `id` (`id`),
  KEY `instansi_pelayanan_id` (`instansi_pelayanan_id`),
  CONSTRAINT `opini_instansi_pelayanan_ibfk_1` FOREIGN KEY (`opini_id`) REFERENCES `opini` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `opini_instansi_pelayanan_ibfk_2` FOREIGN KEY (`instansi_pelayanan_id`) REFERENCES `instansi_pelayanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opini_instansi_pelayanan`
--

LOCK TABLES `opini_instansi_pelayanan` WRITE;
/*!40000 ALTER TABLE `opini_instansi_pelayanan` DISABLE KEYS */;
INSERT INTO `opini_instansi_pelayanan` VALUES (14,25,13);
/*!40000 ALTER TABLE `opini_instansi_pelayanan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `opini_tag`
--

DROP TABLE IF EXISTS `opini_tag`;
/*!50001 DROP VIEW IF EXISTS `opini_tag`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `opini_tag` (
  `id` tinyint NOT NULL,
  `opini_id` tinyint NOT NULL,
  `tag_id` tinyint NOT NULL,
  `instansi_id` tinyint NOT NULL,
  `type` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pelayanan`
--

DROP TABLE IF EXISTS `pelayanan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelayanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `ts_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelayanan`
--

LOCK TABLES `pelayanan` WRITE;
/*!40000 ALTER TABLE `pelayanan` DISABLE KEYS */;
INSERT INTO `pelayanan` VALUES (4,'Kartu Kelurga Baru','2014-07-11 16:39:31');
/*!40000 ALTER TABLE `pelayanan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelayanan_desc`
--

DROP TABLE IF EXISTS `pelayanan_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelayanan_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pelayanan_id` int(11) NOT NULL,
  `desc` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pelayanan_id` (`pelayanan_id`),
  CONSTRAINT `pelayanan_desc_ibfk_1` FOREIGN KEY (`pelayanan_id`) REFERENCES `pelayanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelayanan_desc`
--

LOCK TABLES `pelayanan_desc` WRITE;
/*!40000 ALTER TABLE `pelayanan_desc` DISABLE KEYS */;
INSERT INTO `pelayanan_desc` VALUES (4,4,'Kartu Keluarga adalah Kartu Identitas Keluarga yang memuat data tentang susunan, hubungan dan jumlah anggota keluarga. Kartu Keluarga wajib dimiliki oleh setiap keluarga. Kartu ini berisi data lengkap tentang identitas Kepala Keluarga dan anggota keluarganya.\r\n\r\nKartu keluarga dicetak rangkap 3 yang masing-masing dipegang oleh Kepala Keluarga, Ketua RT dan Kantor Kelurahan. Kartu Keluarga (KK) adalah Dokumen milik Pemda Provinsi setempat dan karena itu tidak boleh mencoret, mengubah, mengganti, menambah isi data yang tercantum dalam Kartu Keluarga.\r\n\r\nSetiap terjadi perubahan karena Mutasi Data dan Mutasi Biodata, wajib dilaporkan kepada Lurah dan akan diterbitkan Kartu Keluarga (KK) yang baru. Pendatang baru yang belum mendaftarkan diri atau belum berstatus penduduk setempat, nama dan identitasnya tidak boleh dicantumkan dalan Kartu Keluarga.');
/*!40000 ALTER TABLE `pelayanan_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (36,'Tegal Gundil','2014-07-11 08:54:00','2014-07-12 02:12:54'),(37,'Tegal Gundil','2014-07-12 01:40:12','2014-07-12 01:40:12'),(38,'Segi Henggana','2014-07-13 00:37:06','2014-07-13 00:37:06'),(39,'Admin Kelurahan Sindansari','2014-07-13 00:37:39','2014-07-13 00:37:39'),(40,'Admin Kelurahan Tegalgundil','2014-07-13 00:38:09','2014-07-13 07:32:22'),(41,'Admin Kelurahan Tegalgundil','2014-07-13 01:23:54','2014-07-13 01:23:54'),(42,'Administrator','2014-07-13 08:17:12','2014-07-13 08:17:12'),(43,'Kelurahan Tegalgundil','2014-07-13 08:17:52','2014-07-13 08:17:52'),(44,'User','2014-07-13 08:18:14','2014-07-13 08:18:14');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_img`
--

DROP TABLE IF EXISTS `person_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `img` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `person_id` (`person_id`),
  CONSTRAINT `person_img_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_img`
--

LOCK TABLES `person_img` WRITE;
/*!40000 ALTER TABLE `person_img` DISABLE KEYS */;
INSERT INTO `person_img` VALUES (3,41,'41.png');
/*!40000 ALTER TABLE `person_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persyaratan`
--

DROP TABLE IF EXISTS `persyaratan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persyaratan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` tinyint(4) NOT NULL,
  `title` varchar(250) NOT NULL,
  `pelayanan_id` int(11) NOT NULL,
  `ts_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_pelayanan_id` (`order`,`pelayanan_id`),
  KEY `pelayanan_id` (`pelayanan_id`),
  CONSTRAINT `persyaratan_ibfk_1` FOREIGN KEY (`pelayanan_id`) REFERENCES `pelayanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persyaratan`
--

LOCK TABLES `persyaratan` WRITE;
/*!40000 ALTER TABLE `persyaratan` DISABLE KEYS */;
INSERT INTO `persyaratan` VALUES (12,1,'Surat pengantar RT',4,'2014-07-11 16:40:08'),(13,2,'Mengisi Form permohonan',4,'2014-07-11 16:40:27'),(14,3,'Fotokopi Surat Nikah 2 lembar',4,'2014-07-11 16:41:02'),(15,4,'Fotokopi Akta Anak 2 lembar',4,'2014-07-11 16:41:43');
/*!40000 ALTER TABLE `persyaratan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persyaratan_desc`
--

DROP TABLE IF EXISTS `persyaratan_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persyaratan_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persyaratan_id` int(11) NOT NULL,
  `desc` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persyaratan_id` (`persyaratan_id`),
  CONSTRAINT `persyaratan_desc_ibfk_1` FOREIGN KEY (`persyaratan_id`) REFERENCES `persyaratan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persyaratan_desc`
--

LOCK TABLES `persyaratan_desc` WRITE;
/*!40000 ALTER TABLE `persyaratan_desc` DISABLE KEYS */;
INSERT INTO `persyaratan_desc` VALUES (6,12,''),(7,13,''),(8,14,''),(9,15,'Bila ada');
/*!40000 ALTER TABLE `persyaratan_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persyaratan_img`
--

DROP TABLE IF EXISTS `persyaratan_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persyaratan_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persyaratan_id` int(11) NOT NULL,
  `img` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persyaratan_id` (`persyaratan_id`),
  CONSTRAINT `persyaratan_img_ibfk_1` FOREIGN KEY (`persyaratan_id`) REFERENCES `persyaratan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persyaratan_img`
--

LOCK TABLES `persyaratan_img` WRITE;
/*!40000 ALTER TABLE `persyaratan_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `persyaratan_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile` (`profile`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (4,'Alamat'),(3,'Email'),(2,'Fax'),(1,'Telepon');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prosedur`
--

DROP TABLE IF EXISTS `prosedur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prosedur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` tinyint(4) NOT NULL,
  `title` varchar(250) NOT NULL,
  `pelayanan_id` int(11) NOT NULL,
  `ts_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_pelayanan_id` (`order`,`pelayanan_id`),
  KEY `pelayanan_id` (`pelayanan_id`),
  CONSTRAINT `prosedur_ibfk_1` FOREIGN KEY (`pelayanan_id`) REFERENCES `pelayanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prosedur`
--

LOCK TABLES `prosedur` WRITE;
/*!40000 ALTER TABLE `prosedur` DISABLE KEYS */;
INSERT INTO `prosedur` VALUES (4,1,'Pemohon membuat surat pengantar dari kelurahan dengan membawa surat pengantar dari RT dan persyaratan yang di tentukan.',4,'2014-07-11 16:44:14'),(5,2,'Pemohon membawa surat pengantar dari kelurahan dan persyaratan yang sudah di periksa kelurahan ke Dinas Kependudukan dan Pencacatan sipil untuk di buatkan KK Baru',4,'2014-07-11 16:46:31');
/*!40000 ALTER TABLE `prosedur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prosedur_desc`
--

DROP TABLE IF EXISTS `prosedur_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prosedur_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prosedur_id` int(11) NOT NULL,
  `desc` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prosedur_id` (`prosedur_id`),
  CONSTRAINT `prosedur_desc_ibfk_1` FOREIGN KEY (`prosedur_id`) REFERENCES `prosedur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prosedur_desc`
--

LOCK TABLES `prosedur_desc` WRITE;
/*!40000 ALTER TABLE `prosedur_desc` DISABLE KEYS */;
INSERT INTO `prosedur_desc` VALUES (2,4,'Fotokopi Surat Nikah 2 lembar\r\nFotokopi Akta Anak 2 lembar'),(3,5,'');
/*!40000 ALTER TABLE `prosedur_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prosedur_img`
--

DROP TABLE IF EXISTS `prosedur_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prosedur_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prosedur_id` int(11) NOT NULL,
  `img` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prosedur_id` (`prosedur_id`),
  CONSTRAINT `prosedur_img_ibfk_1` FOREIGN KEY (`prosedur_id`) REFERENCES `prosedur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prosedur_img`
--

LOCK TABLES `prosedur_img` WRITE;
/*!40000 ALTER TABLE `prosedur_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `prosedur_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Administrator'),(2,'Citizen'),(3,'Government');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `password` varchar(64) NOT NULL,
  `email` varchar(150) NOT NULL,
  `person_id` int(11) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`,`username`,`person_id`),
  UNIQUE KEY `email` (`email`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (29,'admin@te.st','$2y$10$0BDtzus6y35RWg23MhGoO.5yBLOp1h3uZCvWemvN4yeDOrXGl/aTa','admin@te.st',42,NULL,'2014-07-13 08:17:13','2014-07-13 08:21:30'),(30,'kelurahan@te.st','$2y$10$2YngJs6q62QoEa9XVPVczemEF1rAERv86dirdPTpS9ktsPlfPHf5.','kelurahan@te.st',43,'rLneR2YNrlpKfsZoS6dLN4vZKPUvzLatAGyOZCR0vbJm7ixIwwUd77OyOQiy','2014-07-13 08:17:52','2014-07-13 08:19:05'),(31,'user@te.st','$2y$10$XqmNB0gQWeIT.eqg8NgPHux3XTK9vFS/6VnCat8oHCv7dhT3gXCwK','user@te.st',44,'d1OJdyuzuDCVAIS5eFxAsLk9pBe9MSp9Pj5lUBeHq6Kd4c5U9UJt76GW4DBj','2014-07-13 08:18:15','2014-07-13 08:18:46');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  UNIQUE KEY `id` (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (43,29,1),(44,30,3),(45,31,2),(46,29,2),(47,29,3);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `berita_tag`
--

/*!50001 DROP TABLE IF EXISTS `berita_tag`*/;
/*!50001 DROP VIEW IF EXISTS `berita_tag`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `berita_tag` AS select `berita_instansi`.`id` AS `id`,`berita_instansi`.`berita_id` AS `berita_id`,`berita_instansi`.`instansi_id` AS `tag_id`,if((`berita_instansi`.`instansi_id` = NULL),NULL,'instansi') AS `type` from `berita_instansi` union all select `berita_pelayanan`.`id` AS `id`,`berita_pelayanan`.`berita_id` AS `berita_id`,`berita_pelayanan`.`pelayanan_id` AS `tag_id`,if((`berita_pelayanan`.`pelayanan_id` = NULL),NULL,'pelayanan') AS `type` from `berita_pelayanan` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `opini_tag`
--

/*!50001 DROP TABLE IF EXISTS `opini_tag`*/;
/*!50001 DROP VIEW IF EXISTS `opini_tag`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `opini_tag` AS select `oi`.`id` AS `id`,`oi`.`opini_id` AS `opini_id`,`oi`.`instansi_id` AS `tag_id`,if((`oi`.`instansi_id` = NULL),NULL,`oi`.`instansi_id`) AS `instansi_id`,if((`oi`.`instansi_id` = NULL),NULL,'instansi') AS `type` from `opini_instansi` `oi` union all select `oip`.`id` AS `id`,`oip`.`opini_id` AS `opini_id`,`oip`.`instansi_pelayanan_id` AS `tag_id`,if((`oip`.`instansi_pelayanan_id` = NULL),NULL,(select `ip`.`instansi_id` from `instansi_pelayanan` `ip` where (`ip`.`id` = `oip`.`instansi_pelayanan_id`))) AS `instansi_id`,if((`oip`.`instansi_pelayanan_id` = NULL),NULL,'instansi_pelayanan') AS `type` from `opini_instansi_pelayanan` `oip` */;
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

-- Dump completed on 2014-07-13 22:22:49
