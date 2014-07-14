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
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instansi`
--

LOCK TABLES `instansi` WRITE;
/*!40000 ALTER TABLE `instansi` DISABLE KEYS */;
INSERT INTO `instansi` VALUES (11,'Tegalgundil',39,'2014-07-11 16:31:41'),(12,'Balungbangjaya',NULL,'2014-07-14 13:06:01'),(13,'Bubulak',NULL,'2014-07-14 13:06:51'),(14,'Cilendek Barat',NULL,'2014-07-14 13:07:21'),(15,'Cilendek Timur',NULL,'2014-07-14 13:07:38'),(16,'Curug',NULL,'2014-07-14 13:08:08'),(17,'Curug Mekar',NULL,'2014-07-14 13:08:28'),(18,'Gunungbatu',NULL,'2014-07-14 13:08:44'),(19,'Loji',NULL,'2014-07-14 13:09:43'),(20,'Margajaya',NULL,'2014-07-14 13:10:03'),(21,'Menteng',NULL,'2014-07-14 13:10:21'),(22,'Pasirjaya',NULL,'2014-07-14 13:10:41'),(23,'Pasirkuda',NULL,'2014-07-14 13:10:59'),(24,'Pasirmulya',NULL,'2014-07-14 13:11:15'),(25,'Semplak',NULL,'2014-07-14 13:11:30'),(26,'Sindangbarang',NULL,'2014-07-14 13:11:46'),(27,'Situgede',NULL,'2014-07-14 13:12:02'),(28,'Batutulis',NULL,'2014-07-14 13:12:18'),(29,'Bojongkerta',NULL,'2014-07-14 13:12:35'),(30,'Bondongan',NULL,'2014-07-14 13:12:52'),(31,'Cikaret',NULL,'2014-07-14 13:13:23'),(32,'Cipaku',NULL,'2014-07-14 13:13:44'),(33,'Empang',NULL,'2014-07-14 13:14:03'),(34,'Genteng',NULL,'2014-07-14 13:15:43'),(35,'Harjasari',NULL,'2014-07-14 13:16:01'),(36,'Kertamaya',NULL,'2014-07-14 13:16:18'),(37,'Lawanggintung',NULL,'2014-07-14 13:16:35'),(38,'Muarasari',NULL,'2014-07-14 13:16:54'),(39,'Mulyaharja',NULL,'2014-07-14 13:17:10'),(40,'Pakuan',NULL,'2014-07-14 13:17:27'),(41,'Pamoyanan',NULL,'2014-07-14 13:17:42'),(42,'Rancamaya',NULL,'2014-07-14 13:17:58'),(43,'Ranggamekar',NULL,'2014-07-14 13:18:29'),(44,'Babakan',NULL,'2014-07-14 13:18:42'),(45,'Babakanpasar',NULL,'2014-07-14 13:18:59'),(46,'Cibogor',NULL,'2014-07-14 13:19:16'),(47,'Ciwaringin',NULL,'2014-07-14 13:19:33'),(48,'Gudang',NULL,'2014-07-14 13:19:46'),(49,'Kebonkelapa',NULL,'2014-07-14 13:20:02'),(50,'Pabaton',NULL,'2014-07-14 13:20:17'),(51,'Paledang',NULL,'2014-07-14 13:20:32'),(52,'Panaragan',NULL,'2014-07-14 13:20:47'),(53,'Sempur',NULL,'2014-07-14 13:21:02'),(54,'Tegallega',NULL,'2014-07-14 13:21:19'),(55,'Baranangsiang',NULL,'2014-07-14 13:21:34'),(56,'Katulampa',NULL,'2014-07-14 13:21:49'),(57,'Sindangrasa',NULL,'2014-07-14 13:22:05'),(58,'Sindangsari',NULL,'2014-07-14 13:22:28'),(59,'Sukasari',NULL,'2014-07-14 13:22:40'),(60,'Tajur',NULL,'2014-07-14 13:22:51'),(61,'Bantarjati',NULL,'2014-07-14 13:23:06'),(62,'Cibuluh',NULL,'2014-07-14 13:23:18'),(63,'Ciluar',NULL,'2014-07-14 13:23:29'),(64,'Cimahpar',NULL,'2014-07-14 13:23:42'),(65,'Ciparigi',NULL,'2014-07-14 13:23:54'),(66,'Kedunghalang',NULL,'2014-07-14 13:24:07'),(67,'Tanahbaru',NULL,'2014-07-14 13:24:29'),(68,'Cibadak',NULL,'2014-07-14 13:25:16'),(69,'Kayumanis',NULL,'2014-07-14 13:25:27'),(70,'Kebonpedes',NULL,'2014-07-14 13:25:55'),(71,'Kedungbadak',NULL,'2014-07-14 13:26:10'),(72,'Kedungjaya',NULL,'2014-07-14 13:26:23'),(73,'Kedungwaringin',NULL,'2014-07-14 13:26:34'),(74,'Kencana',NULL,'2014-07-14 13:26:46'),(75,'Mekarwangin',NULL,'2014-07-14 13:27:01'),(76,'Sukadamai',NULL,'2014-07-14 13:27:13'),(77,'Sukaresmi',NULL,'2014-07-14 13:27:31'),(78,'Tanahsareal',NULL,'2014-07-14 13:27:53');
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
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instansi_desc`
--

LOCK TABLES `instansi_desc` WRITE;
/*!40000 ALTER TABLE `instansi_desc` DISABLE KEYS */;
INSERT INTO `instansi_desc` VALUES (7,11,'Tegalgundil adalah salah satu kelurahan di Kecamatan Bogor Utara, Kota Bogor, Jawa Barat, Indonesia.'),(8,12,'Balungbangjaya adalah salahsatu desa di Kecamatan Bogor Barat, Kota Bogor, Jawa Barat, Indonesia.'),(9,13,'Bubulak adalah salah satu desa di Kecamatan Bogor Barat, Kota Bogor, Jawa Barat, Indonesia.'),(10,14,'Cilendek Barat adalah salah satu desa di Kecamatan Bogor Barat, Kota Bogor, Jawa Barat, Indonesia.'),(11,15,'Cilendek Timur adalah salah satu desa di Kecamatan Bogor Barat, Kota Bogor, Jawa Barat, Indonesia.'),(12,16,'Curug adalah salah satu desa di Kecamatan Bogor Barat, Kota Bogor, Jawa Barat, Indonesia.'),(13,17,'Curug Mekar adalah salah satu kelurahan di Kecamatan Bogor Barat, Kota Bogor, Jawa Barat, Indonesia. Pada tahun 1995 Desa Curug Mekar masuk kedalam wilayah administrasi Kota Bogor, yang sebelumnya masuk wilayah administrasi Kabupaten Bogor. Pada era Walikota Iswara Natanegara, ( 1999 – 2004) pengganti Eddy Gunardi, status Desa secara keseluruhan berubah menjadi wilayah administratif kelurahan, sehingga status Curug Mekar sebagai desa berubah menjadi kelurahan. Kelurahan Curug Mekar dibagi menjadi 10 Rukun Warga (RW). Di kelurahan ini terdapat salah satu perumahan favorit di Bogor yaitu Taman Yasmin. Taman Yasmin memiliki fasilitas yang lengkap seperti ruko, Yasmin Centre, RSIA Hermina, Giant hypermarket, showroom Daihatsu, dan masih banyak lagi.'),(14,18,'Gunungbatu adalah salah satu desa di Kecamatan Bogor Barat, Kota Bogor, Jawa Barat, Indonesia.'),(15,19,'Loji adalah salah satu desa di Kecamatan Bogor Barat, Kota Bogor, Jawa Barat, Indonesia.'),(16,20,'Margajaya adalah salah satu desa di Kecamatan Bogor Barat, Kota Bogor, Jawa Barat, Indonesia. Di Margajaya terdapat sekolah Bina Bangsa Sejahtera (BBS), Bina Sejahtera, dan Perguruan Aliya. Disini juga terdapat beberapa perumahan seperti Pakuan Regency, Delima Residence, Ziara Valley, dan Cluster Kencana. Akses dan infrastruktur cukup baik meski terkenal dengan kawasan macet. Lokasi Margajaya relatif dekat dengan Institut Pertanian Bogor Dramaga.'),(17,21,'Menteng adalah salah satu kelurahan di Kecamatan Bogor Barat, Kota Bogor, Jawa Barat, Indonesia.'),(18,22,'Pasirjaya adalah salah satu desa di Kecamatan Bogor Barat, Kota Bogor, Jawa Barat, Indonesia.'),(19,23,'Pasirkuda adalah salah satu desa di Kecamatan Bogor Barat, Kota Bogor, Jawa Barat, Indonesia.'),(20,24,'Pasirmulya adalah salah satu Kelurahan di Kecamatan Bogor Barat, Kota Bogor, Jawa Barat, Indonesia.'),(21,25,'Semplak adalah salah satu kelurahan di Kecamatan Bogor Barat, Kota Bogor, Jawa Barat, Indonesia.'),(22,26,'Sindangbarang adalah salah satu desa di Kecamatan Bogor Barat, Kota Bogor, Jawa Barat, Indonesia.'),(23,27,'Situgede adalah salah satu kelurahan di Kecamatan Bogor Barat, Kota Bogor, Jawa Barat, Indonesia. Dinamai Situgede karena memang di desa ini terdapat sebuah situ atau setu (Sd., yang berarti telaga, danau kecil) yang bernama Situ Gede.'),(24,28,'Batutulis adalah salah satu kelurahan di Kecamatan Bogor Selatan, Kota Bogor, Jawa Barat, Indonesia.'),(25,29,'Bojongkerta adalah salah satu kelurahan di Kecamatan Bogor Selatan, Kota Bogor, Jawa Barat, Indonesia.\r\n\r\nDahulu, Bojongkerta adalah salah satu desa di Kecamatan Ciawi, Kabupaten Bogor, Jawa Barat, Indonesia. Namun, sejak tahun 2005, desa ini secara resmi masuk ke dalam wilayah Kecamatan Bogor Selatan. Pada tahun 2008, desa ini ditingkatkan statusnya menjadi kelurahan sehingga menjadi Kelurahan Bojongkerta.'),(26,30,'Bondongan adalah salah satu kelurahan di Kecamatan Bogor Selatan, Kota Bogor, Jawa Barat, Indonesia.'),(27,31,'Cikaret adalah salah satu kelurahan di Kecamatan Bogor Selatan, Kota Bogor, Jawa Barat, Indonesia.\r\n\r\nDahulu, Cikaret adalah salah satu desa di Kecamatan Ciomas, Kabupaten Bogor, Jawa Barat, Indonesia. Namun, sejak tahun 2005, desa ini secara resmi masuk ke dalam wilayah Kecamatan Bogor Selatan dengan kode pos 16610. Pada tahun 2008, desa ini ditingkatkan statusnya menjadi kelurahan sehingga menjadi Kelurahan Cikaret dengan kode pos 16132.'),(28,32,'Cipaku adalah salah satu kelurahan di Kecamatan Bogor Selatan, Kota Bogor, Jawa Barat, Indonesia.\r\n\r\nDahulu, Cipaku adalah salah satu desa di Kecamatan Ciawi, Kabupaten Bogor, Jawa Barat, Indonesia. Namun, sejak tahun 2005, desa ini secara resmi masuk ke dalam wilayah Kecamatan Bogor Selatan. Pada tahun 2008, desa ini ditingkatkan statusnya menjadi kelurahan sehingga menjadi Kelurahan Cipaku.'),(29,33,'Empang adalah salah satu kelurahan di Kecamatan Bogor Selatan, Kota Bogor, Jawa Barat, Indonesia.'),(30,34,'Genteng adalah salah satu kelurahan di Kecamatan Bogor Selatan, Kota Bogor, Jawa Barat, Indonesia.\r\n\r\nDahulu, Genteng adalah salah satu desa di Kecamatan Ciawi, Kabupaten Bogor, Jawa Barat, Indonesia. Namun, sejak tahun 2005, desa ini secara resmi masuk ke dalam wilayah Kecamatan Bogor Selatan. Pada tahun 2008, desa ini ditingkatkan statusnya menjadi kelurahan sehingga menjadi Kelurahan Genteng.'),(31,35,'Harjasari adalah salah satu kelurahan di Kecamatan Bogor Selatan, Kota Bogor, Jawa Barat, Indonesia.\r\n\r\nDahulu, Harjasari adalah salah satu desa di Kecamatan Ciawi, Kabupaten Bogor, Jawa Barat, Indonesia. Namun, sejak tahun 2005, desa ini secara resmi masuk ke dalam wilayah Kecamatan Bogor Selatan. Pada tahun 2008, desa ini ditingkatkan statusnya menjadi kelurahan sehingga menjadi Kelurahan Harjasari.'),(32,36,'Kertamaya adalah salah satu kelurahan di Kecamatan Bogor Selatan, Kota Bogor, Jawa Barat, Indonesia.\r\n\r\nDahulu, Kertamaya adalah salah satu desa di Kecamatan Ciawi, Kabupaten Bogor, Jawa Barat, Indonesia. Namun, sejak tahun 2005, desa ini secara resmi masuk ke dalam wilayah Kecamatan Bogor Selatan. Pada tahun 2008, desa ini ditingkatkan statusnya menjadi kelurahan sehingga menjadi Kelurahan Kertamaya.'),(33,37,'Lawanggintung adalah salah satu kelurahan di Kecamatan Bogor Selatan, Kota Bogor, Jawa Barat, Indonesia.'),(34,38,'Muarasari adalah salah satu kelurahan di Kecamatan Bogor Selatan, Kota Bogor, Jawa Barat, Indonesia.\r\n\r\nDahulu, Muarasari adalah salah satu desa di Kecamatan Ciawi, Kabupaten Bogor, Jawa Barat, Indonesia. Namun, sejak tahun 2005, desa ini secara resmi masuk ke dalam wilayah Kecamatan Bogor Selatan. Pada tahun 2008, desa ini ditingkatkan statusnya menjadi kelurahan sehingga menjadi Kelurahan Muarasari.'),(35,39,'Mulyaharja adalah salah satu kelurahan di Kecamatan Bogor Selatan, Kota Bogor, Jawa Barat, Indonesia.\r\n\r\nDahulu, Mulyaharja adalah salah satu desa di Kecamatan Cijeruk, Kabupaten Bogor, Jawa Barat, Indonesia. Namun, sejak tahun 2005, desa ini secara resmi masuk ke dalam wilayah Kecamatan Bogor Selatan. Pada tahun 2008, desa ini ditingkatkan statusnya menjadi kelurahan sehingga menjadi Kelurahan Mulyaharja.'),(36,40,'Pakuan adalah salah satu kelurahan di Kecamatan Bogor Selatan, Kota Bogor, Jawa Barat, Indonesia.\r\n\r\nDahulu, Pakuan adalah salah satu desa di Kecamatan Ciawi, Kabupaten Bogor, Jawa Barat, Indonesia. Namun, sejak tahun 2005, desa ini secara resmi masuk ke dalam wilayah Kecamatan Bogor Selatan. Pada tahun 2008, desa ini ditingkatkan statusnya menjadi kelurahan sehingga menjadi Kelurahan Pakuan.'),(37,41,'Pamoyanan adalah salah satu kelurahan di Kecamatan Bogor Selatan, Kota Bogor, Jawa Barat, Indonesia.\r\n\r\nDahulu, Pamoyanan adalah salah satu desa di Kecamatan Cijeruk, Kabupaten Bogor, Jawa Barat, Indonesia. Namun, sejak tahun 2005, desa ini secara resmi masuk ke dalam wilayah Kecamatan Bogor Selatan dengan kode pos 16740. Pada tahun 2008, desa ini ditingkatkan statusnya menjadi kelurahan sehingga menjadi Kelurahan Pamoyanan dengan kode pos 16136.'),(38,42,'Rancamaya adalah salah satu kelurahan di Kecamatan Bogor Selatan, Kota Bogor, Jawa Barat, Indonesia.\r\n\r\nDahulu, Rancamaya adalah salah satu desa di Kecamatan Ciawi, Kabupaten Bogor, Jawa Barat, Indonesia. Namun, sejak tahun 2005, desa ini secara resmi masuk ke dalam wilayah Kecamatan Bogor Selatan. Pada tahun 2008, desa ini ditingkatkan statusnya menjadi kelurahan sehingga menjadi Kelurahan Rancamaya.'),(39,43,'Ranggamekar adalah salah satu kelurahan di Kecamatan Bogor Selatan, Kota Bogor, Jawa Barat, Indonesia.\r\n\r\nDahulu, Ranggamekar adalah salah satu desa di Kecamatan Cijeruk, Kabupaten Bogor, Jawa Barat, Indonesia. Namun, sejak tahun 2005, desa ini secara resmi masuk ke dalam wilayah Kecamatan Bogor Selatan. Pada tahun 2008, desa ini ditingkatkan statusnya menjadi kelurahan sehingga menjadi Kelurahan Ranggamekar.'),(40,44,'Babakan adalah salah satu kelurahan di Kecamatan Bogor Tengah, Kota Bogor, Jawa Barat, Indonesia.'),(41,45,'Babakanpasar adalah salah satu kelurahan di Kecamatan Bogor Tengah, Kota Bogor, Jawa Barat, Indonesia.'),(42,46,'Cibogor adalah salah satu kelurahan di Kecamatan Bogor Tengah, Kota Bogor, Jawa Barat, Indonesia.'),(43,47,'Ciwaringin adalah salah satu kelurahan di Kecamatan Bogor Tengah, Kota Bogor, Jawa Barat, Indonesia.'),(44,48,'Gudang adalah salah satu kelurahan di Kecamatan Bogor Tengah, Kota Bogor, Jawa Barat, Indonesia.'),(45,49,'Kebonkelapa adalah salah satu kelurahan di Kecamatan Bogor Tengah, Kota Bogor, Jawa Barat, Indonesia. Kelurahan ini berbatasan dengan Kelurahan Menteng, Panaragan, Gunungbatu, dan Ciwaringin.'),(46,50,'Pabaton adalah salah satu kelurahan di Kecamatan Bogor Tengah, Kota Bogor, Jawa Barat, Indonesia.'),(47,51,'Paledang adalah salah satu kelurahan di Kecamatan Bogor Tengah, Kota Bogor, Jawa Barat, Indonesia. Di kelurahan ini terdapat stasiun kereta api Bogor Paledang yang melayani rute Bogor-Sukabumi.'),(48,52,'Panaragan adalah salah satu kelurahan di Kecamatan Bogor Tengah, Kota Bogor, Jawa Barat, Indonesia.'),(49,53,'Sempur adalah salah satu kelurahan di Kecamatan Bogor Tengah, Kota Bogor, Jawa Barat, Indonesia.'),(50,54,'Tegallega adalah salah satu kelurahan di Kecamatan Bogor Tengah, Kota Bogor, Jawa Barat, Indonesia.'),(51,55,'Baranangsiang adalah salah satu kelurahan di Kecamatan Bogor Timur, Kota Bogor, Jawa Barat, Indonesia. Kelurahan ini merupakan salah satu kelurahan vital di Bogor karena di sinilah, terminal bus utama kota Bogor, Terminal Bus Baranangsiang berada.'),(52,56,'Katulampa adalah salah satu kelurahan di Kecamatan Bogor Timur, Kota Bogor, Jawa Barat, Indonesia.'),(53,57,'Sindangrasa adalah salah satu desa di Kecamatan Bogor Timur, Kota Bogor, Jawa Barat, Indonesia.'),(54,58,'Sindangsari adalah salah satu desa di Kecamatan Bogor Timur, Kota Bogor, Jawa Barat, Indonesia.'),(55,59,'Sukasari adalah salah satu kelurahan di Kecamatan Bogor Timur, Kota Bogor, Jawa Barat, Indonesia.'),(56,60,'Tajur adalah salah satu kelurahan di Kecamatan Bogor Timur, Kota Bogor, Jawa Barat, Indonesia.'),(57,61,'Bantarjati adalah salah satu kelurahan di Kecamatan Bogor Utara, Kota Bogor, Jawa Barat, Indonesia.'),(58,62,'Cibuluh adalah salah satu desa di Kecamatan Bogor Utara, Kota Bogor, Jawa Barat, Indonesia.'),(59,63,'Ciluar adalah salah satu desa di Kecamatan Bogor Utara, Kota Bogor, Jawa Barat, Indonesia.'),(60,64,'Cimahpar adalah salah satu desa di Kecamatan Bogor Utara, Kota Bogor, Jawa Barat, Indonesia.'),(61,65,'Ciparigi adalah salah satu desa di Kecamatan Bogor Utara, Kota Bogor, Jawa Barat, Indonesia.'),(62,66,'Kedunghalang adalah salah satu desa di Kecamatan Bogor Utara, Kota Bogor, Jawa Barat, Indonesia.'),(63,67,'Tanahbaru adalah salah satu desa di Kecamatan Bogor Utara, Kota Bogor, Jawa Barat, Indonesia.'),(64,68,'Cibadak adalah salah satu desa di Kecamatan Tanah Sareal, Kota Bogor, Jawa Barat, Indonesia.'),(65,69,'Kayumanis adalah salah satu desa di Kecamatan Tanah Sareal, Kota Bogor, Jawa Barat, Indonesia.'),(66,70,'Kebonpedes adalah salah satu kelurahan di Kecamatan Tanah Sareal, Kota Bogor, Jawa Barat, Indonesia.'),(67,71,'Kedungbadak adalah salah satu desa di Kecamatan Tanah Sareal, Kota Bogor, Jawa Barat, Indonesia.'),(68,72,'Kedungjaya adalah salah satu desa di Kecamatan Tanah Sareal, Kota Bogor, Jawa Barat, Indonesia.'),(69,73,'Kedungwaringin adalah salah satu desa di Kecamatan Tanah Sareal, Kota Bogor, Jawa Barat, Indonesia.'),(70,74,'Kencana adalah salah satu desa di Kecamatan Tanah Sareal, Kota Bogor, Jawa Barat, Indonesia.'),(71,75,'Mekarwangi adalah salah satu desa di Kecamatan Tanah Sareal, Kota Bogor, Jawa Barat, Indonesia.'),(72,76,'Sukadamai adalah salah satu desa di Kecamatan Tanah Sareal, Kota Bogor, Jawa Barat, Indonesia.'),(73,77,'Sukaresmi adalah salah satu desa di Kecamatan Tanah Sareal, Kota Bogor, Jawa Barat, Indonesia.'),(74,78,'Tanahsareal adalah salah satu desa di Kecamatan Tanah Sareal, Kota Bogor, Jawa Barat, Indonesia.');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelayanan`
--

LOCK TABLES `pelayanan` WRITE;
/*!40000 ALTER TABLE `pelayanan` DISABLE KEYS */;
INSERT INTO `pelayanan` VALUES (4,'Kartu Kelurga Baru','2014-07-11 16:39:31'),(5,'Kartu Keluarga Perpanjangan','2014-07-14 10:51:27'),(6,'Kartu Keluarga Hilang','2014-07-14 10:51:58'),(7,'Kartu Tanda Penduduk Baru','2014-07-14 10:52:28'),(8,'Kartu Tanda Penduduk Perpanjangan','2014-07-14 10:52:53'),(9,'Kartu Tanda Penduduk Hilang','2014-07-14 10:53:21'),(10,'Akta Lahir','2014-07-14 10:53:43'),(11,'Surat Nikah','2014-07-14 10:54:01'),(12,'Akta Kematian','2014-07-14 10:54:19'),(13,'Surat Pindah Masuk Daerah','2014-07-14 10:54:46'),(14,'Surat Pindah Keluar Daerah','2014-07-14 10:55:15'),(15,'Pengesahan Anak','2014-07-14 10:55:35'),(16,'Pengakuan Anak','2014-07-14 12:09:20'),(17,'Akta Perceraian','2014-07-14 12:53:49'),(18,'Pencacatan Perubahan Nama','2014-07-14 12:57:55');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelayanan_desc`
--

LOCK TABLES `pelayanan_desc` WRITE;
/*!40000 ALTER TABLE `pelayanan_desc` DISABLE KEYS */;
INSERT INTO `pelayanan_desc` VALUES (4,4,'Kartu Keluarga adalah Kartu Identitas Keluarga yang memuat data tentang susunan, hubungan dan jumlah anggota keluarga. Kartu Keluarga wajib dimiliki oleh setiap keluarga. Kartu ini berisi data lengkap tentang identitas Kepala Keluarga dan anggota keluarganya.\r\n\r\nKartu keluarga dicetak rangkap 3 yang masing-masing dipegang oleh Kepala Keluarga, Ketua RT dan Kantor Kelurahan. Kartu Keluarga (KK) adalah Dokumen milik Pemda Provinsi setempat dan karena itu tidak boleh mencoret, mengubah, mengganti, menambah isi data yang tercantum dalam Kartu Keluarga.\r\n\r\nSetiap terjadi perubahan karena Mutasi Data dan Mutasi Biodata, wajib dilaporkan kepada Lurah dan akan diterbitkan Kartu Keluarga (KK) yang baru. Pendatang baru yang belum mendaftarkan diri atau belum berstatus penduduk setempat, nama dan identitasnya tidak boleh dicantumkan dalan Kartu Keluarga.'),(5,5,'Pelayanan perpanjangan Kartu Keluarga'),(6,6,'Pelayanan untuk yang kehilangan Kartu Keluarga'),(7,7,'Pelayanan pembuatan KTP baru'),(8,8,'Pelayanan untuk memperpanjang Kartu Tanda Penduduk'),(9,9,'Pelayanan apabila kehilangan Kartu Tanda Penduduk'),(10,10,'Pelayanan pembuatan Akta Lahir'),(11,11,'Pelayanan pembuatan Surat Nikah'),(12,12,'Pelayanan pembuatan Akta Kematian'),(13,13,'Pelayanan pembuatan Surat Pindah Masuk Daerah'),(14,14,'Pelayanan pembuatan Surat Pindah Keluar Daerah'),(15,15,'Pelayanan pembuatan Pengesahan Anak\r\n'),(16,16,'Pelayanan Pengakuan Anak'),(17,17,'Pelayanan pembuatan Akta Perceraian'),(18,18,'Pelayanan Pencatatan Perubahan Nama');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_img`
--

LOCK TABLES `person_img` WRITE;
/*!40000 ALTER TABLE `person_img` DISABLE KEYS */;
INSERT INTO `person_img` VALUES (3,41,'41.png'),(4,44,'44.png');
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
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persyaratan`
--

LOCK TABLES `persyaratan` WRITE;
/*!40000 ALTER TABLE `persyaratan` DISABLE KEYS */;
INSERT INTO `persyaratan` VALUES (12,1,'Surat pengantar RT',4,'2014-07-11 16:40:08'),(13,2,'Mengisi Form permohonan',4,'2014-07-11 16:40:27'),(14,3,'Fotokopi Surat Nikah 2 lembar',4,'2014-07-11 16:41:02'),(15,4,'Fotokopi Akta Anak 2 lembar',4,'2014-07-11 16:41:43'),(16,1,'Surat Pengantar RT ',5,'2014-07-14 12:11:36'),(17,2,'Fotokopi Surat Nikah 2 Lembar',5,'2014-07-14 12:11:51'),(18,3,'Fotokopi Akta Anak 2 Lembar',5,'2014-07-14 12:12:05'),(19,4,'Kartu Keluarga Lama Asli dan Fotokopi 1 Lembar',5,'2014-07-14 12:12:29'),(20,1,'Surat Pengantar RT',6,'2014-07-14 12:19:20'),(21,2,'Mengisi Form permohonan',6,'2014-07-14 12:19:29'),(22,3,'Fotokopi Surat Nikah 2 lembar',6,'2014-07-14 12:19:36'),(23,4,'Fotokopi Akta Anak @2lembar',6,'2014-07-14 12:19:49'),(24,5,'Surat Keterangan Hilang dari Kelurahan',6,'2014-07-14 12:19:56'),(25,6,'Surat Keterangan Hilang dari Kepoloisian',6,'2014-07-14 12:20:05'),(26,1,'Surat Pengantar RT',7,'2014-07-14 12:20:34'),(27,2,'Mengisi Form Permohonan',7,'2014-07-14 12:20:40'),(28,3,'Fotokopi KK 2 lembar',7,'2014-07-14 12:20:47'),(29,4,'Pasfoto 3x4 4 lembar',7,'2014-07-14 12:20:58'),(30,5,'Surat Keterangan belum punya KTP dari kelurahan',7,'2014-07-14 12:21:05'),(31,1,'Surat Pengantar RT',8,'2014-07-14 12:21:21'),(32,2,'Mengisi Form Permohonan',8,'2014-07-14 12:21:27'),(33,3,'Fotokopi KK 2 lembar',8,'2014-07-14 12:21:34'),(34,4,'Pasfoto 3x4 4 lembar',8,'2014-07-14 12:21:45'),(35,5,'KTP lama asli dan Fotokopi 1 Lembar',8,'2014-07-14 12:21:57'),(36,1,'Surat Pengantar RT',9,'2014-07-14 12:22:10'),(37,2,'Mengisi Form Permohonan',9,'2014-07-14 12:22:17'),(38,3,'Fotokopi KK 2 lembar',9,'2014-07-14 12:22:35'),(39,4,'Pasfoto 3x4 4 lembar',9,'2014-07-14 12:22:40'),(40,5,'Surat Keterangan Hilang dari Kelurahan',9,'2014-07-14 12:22:49'),(41,6,'Surat Keterangan Hilang dari Kepoloisian',9,'2014-07-14 12:22:54'),(42,1,'Surat Pengantar RT',10,'2014-07-14 12:23:08'),(43,2,'Mengisi Form Permohonan',10,'2014-07-14 12:23:14'),(44,3,'Fotokopi Surat Nikah 2 lembar',10,'2014-07-14 12:23:24'),(45,4,'Fopokopi KTP orangtua @2 lembar',10,'2014-07-14 12:23:35'),(46,5,'Fotokopi KTP pelapor 2 lembar',10,'2014-07-14 12:23:42'),(47,6,'Fotokopi KTP 2 orang Saksi @2 lembar',10,'2014-07-14 12:23:48'),(48,7,'Apabila orangtua meninggal, surat nikah diganti dengan surat kematian',10,'2014-07-14 12:23:56'),(49,8,'Urat Keterangan lahir dari bidan, puskesmas atau rumahsakit',10,'2014-07-14 12:24:03'),(50,1,'Surat Pengantar RT',11,'2014-07-14 12:24:15'),(51,2,'Mengisi Form Model NC (surat pengumuman nikah)',11,'2014-07-14 12:24:20'),(52,3,'Surat Keterangan Hendak Nikah bermaterai',11,'2014-07-14 12:24:26'),(53,4,'Fotokopi KK 2 lembar',11,'2014-07-14 12:24:31'),(54,5,'Fotokopi KTP 2 lembar',11,'2014-07-14 12:24:36'),(55,6,'Fotokopi Akta Lahir 2 lembar',11,'2014-07-14 12:24:42'),(56,7,'Bila Janda atau Duda dilengkapi fotokopi surat cerai atau surat kematian pasangan',11,'2014-07-14 12:24:53'),(57,8,'Bila Orangtua Meninggal dilengkapi surat kematian',11,'2014-07-14 12:25:00'),(58,1,'Surat pengantar  RT',12,'2014-07-14 12:25:16'),(59,2,'Mengisi Form permohonan',12,'2014-07-14 12:25:22'),(60,3,'Surat Keterangan kematian dari puskesmas atau rumah sakit',12,'2014-07-14 12:25:27'),(61,4,'KTP yang bersangkutan Asli dan fotokopi 1 lembar',12,'2014-07-14 12:25:33'),(62,5,'KK yang bersangkutan Asli dan fotokopi  2 lembar',12,'2014-07-14 12:25:46'),(63,6,'Fotokopi KTP orangtua yang bersangkutan @2 lembar',12,'2014-07-14 12:25:55'),(64,7,'Fotokopi Pelapor 2 lembar',12,'2014-07-14 12:26:03'),(65,8,'Fotokopi KTP 2 orang saksi @2 lembar',12,'2014-07-14 12:26:21'),(66,9,'Fotokopi Surat NIkah yang bersangkutan 2 lembar',12,'2014-07-14 12:33:58'),(67,1,'Surat Pengantar RT',13,'2014-07-14 12:34:37'),(68,2,'Fotokopi KK 2 lembar',13,'2014-07-14 12:34:44'),(69,3,'Fotokopi Akta lahir anak @2 lembar',13,'2014-07-14 12:34:50'),(70,4,'Pasfoto 3x4 2 lembar',13,'2014-07-14 12:34:56'),(71,5,'Surat pengantar dari tempat asal',13,'2014-07-14 12:35:05'),(72,1,'Surat pengantar RT',14,'2014-07-14 12:36:54'),(73,2,'Fotokopi KK 2 lembar',14,'2014-07-14 12:37:51'),(74,3,'Fotokopi Akta lahir anak @2 lembar',14,'2014-07-14 12:38:01'),(75,4,'Fotokopi Surat Nikah 2 lembar',14,'2014-07-14 12:38:08'),(76,5,'Pasfoto 3x4 2 lembar',14,'2014-07-14 12:38:15'),(77,1,'Salinan putusan pengadilan yang telah memperoleh kekuatan hukum tetap',17,'2014-07-14 12:54:00'),(78,2,'Kutipan akta perkawinan',17,'2014-07-14 12:54:15'),(79,3,'Mengisi formulir pencatatan penceraian',17,'2014-07-14 12:54:20'),(80,4,'Fotokopi KK',17,'2014-07-14 12:54:28'),(81,5,'Fotokopi KTP',17,'2014-07-14 12:54:34'),(82,1,'Surat pengantar RT diketahui kelurahan',16,'2014-07-14 12:56:24'),(83,2,'Surat pengakuan anak dari ayah biologis yang disetujui oleh ibu kandung',16,'2014-07-14 12:56:32'),(84,3,'Kutipan akta kelahiran',16,'2014-07-14 12:56:41'),(85,4,'Fotokopi KK dan KTP ayah biologis dan ibu kandung',16,'2014-07-14 12:56:46'),(86,1,'Surat pengantar RT yang diketahui kelurahan',15,'2014-07-14 12:56:59'),(87,2,'Kutipan akta kelahiran',15,'2014-07-14 12:57:07'),(88,3,'Fotokopi kutipan akta kelahiran',15,'2014-07-14 12:57:15'),(89,4,'Fotokopi kutipan akta perkawinan',15,'2014-07-14 12:57:22'),(90,5,'Fotokopi KK dan KTP pemohon',15,'2014-07-14 12:57:29'),(91,1,'Salinan penetapan pengadilan negara tentang perubahan nama',18,'2014-07-14 12:58:07'),(92,2,'Kutipan akta catatan sipil',18,'2014-07-14 12:58:30'),(93,3,'Kutipan akta perkawinan bagi yang sudah kawin',18,'2014-07-14 12:58:37'),(94,4,'Fotokopi KK dan KTP pemohon',18,'2014-07-14 12:58:45');
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
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persyaratan_desc`
--

LOCK TABLES `persyaratan_desc` WRITE;
/*!40000 ALTER TABLE `persyaratan_desc` DISABLE KEYS */;
INSERT INTO `persyaratan_desc` VALUES (6,12,''),(7,13,''),(8,14,''),(9,15,'Bila ada'),(10,16,''),(11,17,''),(12,18,''),(13,19,''),(14,20,''),(15,21,''),(16,22,''),(17,23,'Fotokopi Akta Anak @2lembar'),(18,24,'Surat Keterangan Hilang dari Kelurahan'),(19,25,'Surat Keterangan Hilang dari Kepoloisian'),(20,26,'Surat Pengantar RT'),(21,27,'Mengisi Form Permohonan'),(22,28,'Fotokopi KK 2 lembar'),(23,29,'Pasfoto 3x4 4 lembar'),(24,30,'Surat Keterangan belum punya KTP dari kelurahan'),(25,31,'Surat Pengantar RT'),(26,32,'Mengisi Form Permohonan'),(27,33,'Fotokopi KK 2 lembar'),(28,34,''),(29,35,''),(30,36,''),(31,37,'Mengisi Form Permohonan'),(32,38,''),(33,39,''),(34,40,''),(35,41,''),(36,42,''),(37,43,''),(38,44,''),(39,45,''),(40,46,''),(41,47,''),(42,48,''),(43,49,''),(44,50,''),(45,51,''),(46,52,''),(47,53,''),(48,54,''),(49,55,''),(50,56,''),(51,57,''),(52,58,''),(53,59,''),(54,60,''),(55,61,''),(56,62,''),(57,63,''),(58,64,''),(59,65,''),(60,66,''),(61,67,''),(62,68,''),(63,69,''),(64,70,''),(65,71,''),(66,72,''),(67,73,''),(68,74,''),(69,75,''),(70,76,''),(71,77,''),(72,78,''),(73,79,''),(74,80,''),(75,81,''),(76,82,''),(77,83,''),(78,84,''),(79,85,''),(80,86,''),(81,87,''),(82,88,''),(83,89,''),(84,90,''),(85,91,''),(86,92,''),(87,93,''),(88,94,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prosedur`
--

LOCK TABLES `prosedur` WRITE;
/*!40000 ALTER TABLE `prosedur` DISABLE KEYS */;
INSERT INTO `prosedur` VALUES (4,1,'Pemohon membuat surat pengantar dari kelurahan dengan membawa surat pengantar dari RT dan persyaratan yang ditentukan.',4,'2014-07-11 16:44:14'),(5,2,'Pemohon membawa surat pengantar dari kelurahan dan persyaratan yang sudah di periksa kelurahan ke Dinas Kependudukan dan Pencacatan sipil untuk di buatkan KK Baru',4,'2014-07-11 16:46:31'),(6,1,'Pemohon membuat surat pengantar dari kelurahan dengan membawa surat pengantar dari RT dan Persyaratan yang di tentukan (Fotokopi Surat Nikah 2 lembar, Fotokopi Akta Anak @2lembar, KK Lama Asli dan Fotokopi 1 Lembar)',5,'2014-07-14 12:12:51'),(7,2,'Pemohon membawa surat pengantar dari kelurahan dan persyaratan yang sudah di periksa kelurahan ke Dinas Kependudukan dan Pencacatan sipil untuk di buatkan KK Baru',5,'2014-07-14 12:13:03'),(8,1,'Pemohon membuat surat pengantar dari kelurahan dengan membawa surat pengantar dari RT dan Persyaratan yang di tentukan (Fotokopi Surat Nikah 2 lembar, Fotokopi Akta Anak @2lembar, Surat Keterangan Hilang dari Desa, Surat Keterangan Hilang dari Kepolo',6,'2014-07-14 12:13:30'),(9,2,'Pemohon membawa surat pengantar dari kelurahan dan persyaratan yang sudah di periksa kelurahan ke Dinas Kependudukan dan Pencacatan sipil untuk di buatkan KK Baru',6,'2014-07-14 12:13:38'),(10,1,'Pemohon membuat surat pengantar dan Surat Keterangan belum punya KTP dari  kelurahan dengan membawa surat pengantar dari RT dan Persyaratan yang di tentukan (Fotokopi KK 2 lembar, Pasfoto 3x4 4 lembar)',7,'2014-07-14 12:13:55'),(11,2,'Pemohon membawa surat pengantar dari kelurahan dan persyaratan yang sudah di periksa kelurahan ke Dinas Kependudukan dan Pencacatan sipil untuk di buatkan KTP Baru',7,'2014-07-14 12:14:04'),(12,1,'Pemohon membuat surat pengantar dari  kelurahan dengan membawa surat pengantar dari RT dan Persyaratan yang di tentukan (Fotokopi KK 2 lembar, Pasfoto 3x4 4 lembar, KTP lama asli dan Fotokopi 1 Lembar)',8,'2014-07-14 12:14:25'),(13,2,'Pemohon membawa surat pengantar dari kelurahan dan persyaratan yang sudah di periksa kelurahan ke Dinas Kependudukan dan Pencacatan sipil untuk di buatkan KTP Baru',8,'2014-07-14 12:14:35'),(14,1,'Pemohon membuat surat pengantar dan Surat Keterangan Hilang dari Kelurahan dengan membawa surat pengantar dari RT dan Persyaratan yang di tentukan (Fotokopi KK 2 lembar, Pasfoto 3x4 4 lembar, Surat Keterangan Hilang dari Kepoloisian)',9,'2014-07-14 12:14:51'),(15,2,'Pemohon membawa surat pengantar dari kelurahan dan persyaratan yang sudah di periksa kelurahan ke Dinas Kependudukan dan Pencacatan sipil untuk di buatkan KTP Baru',9,'2014-07-14 12:15:01'),(16,1,'Pemohon membuat surat pengantar dari  kelurahan dengan membawa surat pengantar dari RT dan Persyaratan yang di tentukan (Fotokopi Surat Nikah 2 lembar, Fopokopi KTP orangtua @2 lembar, Fotokopi KTP pelapor 2 lembar, Fotokopi KTP 2 orang Saksi @2 lemb',10,'2014-07-14 12:15:20'),(17,2,'Pemohon membawa surat pengantar dari kelurahan dan persyaratan yang sudah di periksa kelurahan ke Dinas Kependudukan dan Pencacatan sipil untuk di buatkan Akta Lahir',10,'2014-07-14 12:15:31'),(18,1,'Pemohon membuat surat pengantar dari  kelurahan dengan membawa surat pengantar dari RT dan Persyaratan yang di tentukan (Surat Keterangan Hendak Nikah bermaterai, Fotokopi KK 2 lembar, Fotokopi KTP 2 lembar, Fotokopi Akta Lahir 2 lembar, Bila Janda a',11,'2014-07-14 12:15:49'),(19,2,'Pemohon membawa surat pengantar dari kelurahan dan persyaratan yang sudah di periksa kelurahan ke Dinas Kependudukan dan Pencacatan sipil untuk di buatkan Surat Nikah',11,'2014-07-14 12:15:58'),(20,1,'Pemohon membuat surat pengantar dari  kelurahan dengan membawa surat pengantar dari RT dan Persyaratan yang di tentukan',12,'2014-07-14 12:16:22'),(21,2,'Pemohon membawa surat pengantar dari kelurahan dan persyaratan yang sudah di periksa kelurahan ke Dinas Kependudukan dan Pencacatan sipil untuk di buatkan Akta Kelahiran',12,'2014-07-14 12:16:43'),(22,1,'Pemohon membuat surat pengantar dari  kelurahan dengan membawa surat pengantar dari RT, Surat pengantar dari tempat asal dan Persyaratan yang di tentukan (Fotokopi KK 2 lembar, Fotokopi Akta lahir anak @2 lembar, Pasfoto 3x4 2 lembar)',13,'2014-07-14 12:17:04'),(23,2,'Pemohon membawa surat pengantar dari kelurahan dan persyaratan yang sudah di periksa kelurahan ke Dinas Kependudukan dan Pencacatan sipil untuk dibuatkan surat pindah',13,'2014-07-14 12:17:16'),(24,1,'Pemohon membuat surat pengantar dari  kelurahan dengan membawa surat pengantar dari RT, Surat pengantar dari tempat asal dan Persyaratan yang di tentukan (Fotokopi KK 2 lembar, Fotokopi Akta lahir anak @2 lembar, Fotokopi Surat Nikah 2 lembar, Pasfot',14,'2014-07-14 12:17:29'),(25,2,'Pemohon membawa surat pengantar dari kelurahan dan persyaratan yang sudah di periksa kelurahan ke Dinas Kependudukan dan Pencacatan sipil untuk dibuatkan surat pindah',14,'2014-07-14 12:17:39'),(26,1,'Pemohon membuat surat pengantar dari  kelurahan dengan membawa surat pengantar dari RT dan Persyaratan yang di tentukan (Kutipan akta kelahiran, Fotokopi kutipan akta kelahiran, Fotokopi kutipan akta perkawinan, Fotokopi KK dan KTP pemohon)',15,'2014-07-14 12:17:56'),(27,2,'Pemohon membawa surat pengantar dari kelurahan dan persyaratan yang sudah di periksa kelurahan ke Dinas Kependudukan dan Pencacatan sipil untuk dibuatkan surat pengesahan',15,'2014-07-14 12:18:04'),(28,1,'Pemohon membuat surat pengantar dari  kelurahan dengan membawa Persyaratan yang di tentukan (Salinan penetapan pengadilan negara tentang perubahan nama, Kutipan akta catatan sipil, Kutipan akta perkawinan bagi yang sudah kawin, Fotokopi KK dan KTP pe',16,'2014-07-14 12:18:23'),(29,2,'Pemohon membawa surat pengantar dari kelurahan dan persyaratan yang sudah di periksa kelurahan ke Dinas Kependudukan dan Pencacatan sipil untuk dibuatkan surat pengesahan',16,'2014-07-14 12:18:38');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prosedur_desc`
--

LOCK TABLES `prosedur_desc` WRITE;
/*!40000 ALTER TABLE `prosedur_desc` DISABLE KEYS */;
INSERT INTO `prosedur_desc` VALUES (2,4,'Fotokopi Surat Nikah 2 lembar\r\nFotokopi Akta Anak 2 lembar'),(3,5,''),(4,6,'Pemohon membuat surat pengantar dari kelurahan dengan membawa surat pengantar dari RT dan Persyaratan yang di tentukan (Fotokopi Surat Nikah 2 lembar, Fotokopi Akta Anak @2lembar, KK Lama Asli dan Fotokopi 1 Lembar)'),(5,7,'Pemohon membawa surat pengantar dari kelurahan dan persyaratan yang sudah di periksa kelurahan ke Dinas Kependudukan dan Pencacatan sipil untuk di buatkan KK Baru'),(6,8,'Pemohon membuat surat pengantar dari kelurahan dengan membawa surat pengantar dari RT dan Persyaratan yang di tentukan (Fotokopi Surat Nikah 2 lembar, Fotokopi Akta Anak @2lembar, Surat Keterangan Hilang dari Desa, Surat Keterangan Hilang dari Kepoloisian)'),(7,9,'Pemohon membawa surat pengantar dari kelurahan dan persyaratan yang sudah di periksa kelurahan ke Dinas Kependudukan dan Pencacatan sipil untuk di buatkan KK Baru'),(8,10,'Pemohon membuat surat pengantar dan Surat Keterangan belum punya KTP dari  kelurahan dengan membawa surat pengantar dari RT dan Persyaratan yang di tentukan (Fotokopi KK 2 lembar, Pasfoto 3x4 4 lembar)'),(9,11,'Pemohon membawa surat pengantar dari kelurahan dan persyaratan yang sudah di periksa kelurahan ke Dinas Kependudukan dan Pencacatan sipil untuk di buatkan KTP Baru'),(10,12,'Pemohon membuat surat pengantar dari  kelurahan dengan membawa surat pengantar dari RT dan Persyaratan yang di tentukan (Fotokopi KK 2 lembar, Pasfoto 3x4 4 lembar, KTP lama asli dan Fotokopi 1 Lembar)'),(11,13,'Pemohon membawa surat pengantar dari kelurahan dan persyaratan yang sudah di periksa kelurahan ke Dinas Kependudukan dan Pencacatan sipil untuk di buatkan KTP Baru'),(12,14,'Pemohon membuat surat pengantar dan Surat Keterangan Hilang dari Kelurahan dengan membawa surat pengantar dari RT dan Persyaratan yang di tentukan (Fotokopi KK 2 lembar, Pasfoto 3x4 4 lembar, Surat Keterangan Hilang dari Kepoloisian)'),(13,15,'Pemohon membawa surat pengantar dari kelurahan dan persyaratan yang sudah di periksa kelurahan ke Dinas Kependudukan dan Pencacatan sipil untuk di buatkan KTP Baru'),(14,16,'Pemohon membuat surat pengantar dari  kelurahan dengan membawa surat pengantar dari RT dan Persyaratan yang di tentukan (Fotokopi Surat Nikah 2 lembar, Fopokopi KTP orangtua @2 lembar, Fotokopi KTP pelapor 2 lembar, Fotokopi KTP 2 orang Saksi @2 lembar, Apabila orangtua meninggal, surat nikah diganti dengan surat kematian, Urat Keterangan lahir dari bidan, puskesmas atau rumahsakit)'),(15,17,'Pemohon membawa surat pengantar dari kelurahan dan persyaratan yang sudah di periksa kelurahan ke Dinas Kependudukan dan Pencacatan sipil untuk di buatkan Akta Lahir'),(16,18,'Pemohon membuat surat pengantar dari  kelurahan dengan membawa surat pengantar dari RT dan Persyaratan yang di tentukan (Surat Keterangan Hendak Nikah bermaterai, Fotokopi KK 2 lembar, Fotokopi KTP 2 lembar, Fotokopi Akta Lahir 2 lembar, Bila Janda atau Duda dilengkapi fotokopi surat cerai atau surat kematian pasangan, Bila Orangtua Meninggal dilengkapi surat kematian)'),(17,19,'Pemohon membawa surat pengantar dari kelurahan dan persyaratan yang sudah di periksa kelurahan ke Dinas Kependudukan dan Pencacatan sipil untuk di buatkan Surat Nikah'),(18,20,'Pemohon membuat surat pengantar dari  kelurahan dengan membawa surat pengantar dari RT dan Persyaratan yang di tentukan (Surat Keterangan kematian dari puskesmas atau rumah sakit, KTP yang bersangkutan Asli dan fotokopi 1 lembar, KK yang bersangkutan Asli dan fotokopi  2 lembar, Fotokopi KTP orangtua yang bersangkutan @2 lembar, Fotokopi Pelapor 2 lembar, Fotokopi KTP 2 orang saksi @2 lembar, Fotokopi Surat NIkah yang bersangkutan 2 lembar)'),(19,21,'Pemohon membawa surat pengantar dari kelurahan dan persyaratan yang sudah di periksa kelurahan ke Dinas Kependudukan dan Pencacatan sipil untuk di buatkan Akta Kelahiran'),(20,22,'Pemohon membuat surat pengantar dari  kelurahan dengan membawa surat pengantar dari RT, Surat pengantar dari tempat asal dan Persyaratan yang di tentukan (Fotokopi KK 2 lembar, Fotokopi Akta lahir anak @2 lembar, Pasfoto 3x4 2 lembar)'),(21,23,'Pemohon membawa surat pengantar dari kelurahan dan persyaratan yang sudah di periksa kelurahan ke Dinas Kependudukan dan Pencacatan sipil untuk dibuatkan surat pindah'),(22,24,'Pemohon membuat surat pengantar dari  kelurahan dengan membawa surat pengantar dari RT, Surat pengantar dari tempat asal dan Persyaratan yang di tentukan (Fotokopi KK 2 lembar, Fotokopi Akta lahir anak @2 lembar, Fotokopi Surat Nikah 2 lembar, Pasfoto 3x4 2 lembar)'),(23,25,'Pemohon membawa surat pengantar dari kelurahan dan persyaratan yang sudah di periksa kelurahan ke Dinas Kependudukan dan Pencacatan sipil untuk dibuatkan surat pindah'),(24,26,'Pemohon membuat surat pengantar dari  kelurahan dengan membawa surat pengantar dari RT dan Persyaratan yang di tentukan (Kutipan akta kelahiran, Fotokopi kutipan akta kelahiran, Fotokopi kutipan akta perkawinan, Fotokopi KK dan KTP pemohon)'),(25,27,'Pemohon membawa surat pengantar dari kelurahan dan persyaratan yang sudah di periksa kelurahan ke Dinas Kependudukan dan Pencacatan sipil untuk dibuatkan surat pengesahan'),(26,28,'Pemohon membuat surat pengantar dari  kelurahan dengan membawa Persyaratan yang di tentukan (Salinan penetapan pengadilan negara tentang perubahan nama, Kutipan akta catatan sipil, Kutipan akta perkawinan bagi yang sudah kawin, Fotokopi KK dan KTP pemohon)'),(27,29,'Pemohon membawa surat pengantar dari kelurahan dan persyaratan yang sudah di periksa kelurahan ke Dinas Kependudukan dan Pencacatan sipil untuk dibuatkan surat pengesahan');
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
INSERT INTO `user` VALUES (29,'admin@te.st','$2y$10$0BDtzus6y35RWg23MhGoO.5yBLOp1h3uZCvWemvN4yeDOrXGl/aTa','admin@te.st',42,NULL,'2014-07-13 08:17:13','2014-07-13 08:21:30'),(30,'kelurahan@te.st','$2y$10$2YngJs6q62QoEa9XVPVczemEF1rAERv86dirdPTpS9ktsPlfPHf5.','kelurahan@te.st',43,'rLneR2YNrlpKfsZoS6dLN4vZKPUvzLatAGyOZCR0vbJm7ixIwwUd77OyOQiy','2014-07-13 08:17:52','2014-07-13 08:19:05'),(31,'user@te.st','$2y$10$XqmNB0gQWeIT.eqg8NgPHux3XTK9vFS/6VnCat8oHCv7dhT3gXCwK','user@te.st',44,'HpsIVsAMoB5gQpHB2qLBWKLXmqfiUXVOKkvwmp5VQzRM73A1BbdGTbE81y1k','2014-07-13 08:18:15','2014-07-13 18:03:52');
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (43,29,1),(44,30,3),(46,29,2),(47,29,3),(48,31,2);
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

-- Dump completed on 2014-07-15  6:26:59
