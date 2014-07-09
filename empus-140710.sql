-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.37-0ubuntu0.13.10.1 - (Ubuntu)
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             8.3.0.4736
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table empus.berita
CREATE TABLE IF NOT EXISTS `berita` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.berita: ~7 rows (approximately)
/*!40000 ALTER TABLE `berita` DISABLE KEYS */;
INSERT INTO `berita` (`id`, `title`, `created_at`, `updated_at`) VALUES
	(1, 'xcvbhjkl', '2014-06-15 06:38:05', '2014-06-15 06:38:05'),
	(2, 'xcvbhjkl', '2014-06-15 06:38:36', '2014-06-15 06:38:36'),
	(3, 'xcvbhjkl', '2014-06-15 06:39:14', '2014-06-15 06:39:14'),
	(4, 'xcvbhjkl', '2014-06-15 06:39:41', '2014-06-15 06:39:41'),
	(5, 'xcvbhjkl', '2014-06-15 06:40:35', '2014-06-15 06:40:35'),
	(6, 'xcvbhjkl', '2014-06-15 06:44:05', '2014-06-15 06:44:06'),
	(7, 'Gitu Deh', '2014-06-15 06:44:38', '2014-07-05 04:55:00');
/*!40000 ALTER TABLE `berita` ENABLE KEYS */;


-- Dumping structure for table empus.berita_desc
CREATE TABLE IF NOT EXISTS `berita_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `berita_id` int(11) NOT NULL,
  `desc` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `berita_id` (`berita_id`),
  CONSTRAINT `berita_desc_ibfk_1` FOREIGN KEY (`berita_id`) REFERENCES `berita` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.berita_desc: ~5 rows (approximately)
/*!40000 ALTER TABLE `berita_desc` DISABLE KEYS */;
INSERT INTO `berita_desc` (`id`, `berita_id`, `desc`) VALUES
	(1, 3, 'sdfghjkl'),
	(2, 4, 'sdfghjkl'),
	(3, 5, 'sdfghjkl'),
	(4, 6, 'sdfghjkl'),
	(5, 7, 'sdfghjkl');
/*!40000 ALTER TABLE `berita_desc` ENABLE KEYS */;


-- Dumping structure for table empus.berita_img
CREATE TABLE IF NOT EXISTS `berita_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `berita_id` int(11) NOT NULL,
  `img` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `berita_id` (`berita_id`),
  CONSTRAINT `berita_img_ibfk_1` FOREIGN KEY (`berita_id`) REFERENCES `berita` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.berita_img: ~6 rows (approximately)
/*!40000 ALTER TABLE `berita_img` DISABLE KEYS */;
INSERT INTO `berita_img` (`id`, `berita_id`, `img`) VALUES
	(1, 2, '2.jpg'),
	(2, 3, '3.jpg'),
	(3, 4, '4.jpg'),
	(4, 5, '5.jpg'),
	(5, 6, '6.jpg'),
	(6, 7, '7.JPG');
/*!40000 ALTER TABLE `berita_img` ENABLE KEYS */;


-- Dumping structure for table empus.berita_instansi
CREATE TABLE IF NOT EXISTS `berita_instansi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `berita_id` int(11) NOT NULL,
  `instansi_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `berita_id` (`berita_id`,`instansi_id`),
  KEY `instansi_id` (`instansi_id`),
  CONSTRAINT `berita_instansi_ibfk_1` FOREIGN KEY (`berita_id`) REFERENCES `berita` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `berita_instansi_ibfk_2` FOREIGN KEY (`instansi_id`) REFERENCES `instansi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.berita_instansi: ~4 rows (approximately)
/*!40000 ALTER TABLE `berita_instansi` DISABLE KEYS */;
INSERT INTO `berita_instansi` (`id`, `berita_id`, `instansi_id`) VALUES
	(1, 5, 6),
	(15, 7, 6),
	(16, 7, 7),
	(17, 7, 8);
/*!40000 ALTER TABLE `berita_instansi` ENABLE KEYS */;


-- Dumping structure for table empus.berita_pelayanan
CREATE TABLE IF NOT EXISTS `berita_pelayanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pelayanan_id` int(11) NOT NULL,
  `berita_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pelayanan_id` (`pelayanan_id`,`berita_id`),
  KEY `berita_id` (`berita_id`),
  CONSTRAINT `berita_pelayanan_ibfk_1` FOREIGN KEY (`pelayanan_id`) REFERENCES `pelayanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `berita_pelayanan_ibfk_2` FOREIGN KEY (`berita_id`) REFERENCES `berita` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.berita_pelayanan: ~3 rows (approximately)
/*!40000 ALTER TABLE `berita_pelayanan` DISABLE KEYS */;
INSERT INTO `berita_pelayanan` (`id`, `pelayanan_id`, `berita_id`) VALUES
	(20, 2, 7),
	(1, 3, 5),
	(21, 3, 7);
/*!40000 ALTER TABLE `berita_pelayanan` ENABLE KEYS */;


-- Dumping structure for view empus.berita_tag
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `berita_tag` (
	`id` INT(11) NOT NULL,
	`berita_id` INT(11) NOT NULL,
	`tag_id` INT(11) NOT NULL,
	`type` VARCHAR(9) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Dumping structure for table empus.instansi
CREATE TABLE IF NOT EXISTS `instansi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `person_id` int(11) NOT NULL,
  `ts_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`person_id`),
  KEY `FK_instansi_person` (`person_id`),
  CONSTRAINT `FK_instansi_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.instansi: ~3 rows (approximately)
/*!40000 ALTER TABLE `instansi` DISABLE KEYS */;
INSERT INTO `instansi` (`id`, `name`, `person_id`, `ts_created`) VALUES
	(6, 'Tegalgundil Bro', 31, '2014-06-06 21:09:24'),
	(7, 'Kelurahan lagi', 31, '2014-06-15 04:19:38'),
	(8, 'sdfghjksdfghj', 31, '2014-06-16 10:53:00');
/*!40000 ALTER TABLE `instansi` ENABLE KEYS */;


-- Dumping structure for table empus.instansi_berita
CREATE TABLE IF NOT EXISTS `instansi_berita` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instansi_id` int(11) NOT NULL,
  `berita_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instansi_id` (`instansi_id`,`berita_id`),
  KEY `berita_id` (`berita_id`),
  CONSTRAINT `instansi_berita_ibfk_1` FOREIGN KEY (`instansi_id`) REFERENCES `instansi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `instansi_berita_ibfk_2` FOREIGN KEY (`berita_id`) REFERENCES `berita` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table empus.instansi_berita: ~0 rows (approximately)
/*!40000 ALTER TABLE `instansi_berita` DISABLE KEYS */;
/*!40000 ALTER TABLE `instansi_berita` ENABLE KEYS */;


-- Dumping structure for table empus.instansi_desc
CREATE TABLE IF NOT EXISTS `instansi_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instansi_id` int(11) NOT NULL,
  `desc` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instansi_id` (`instansi_id`),
  CONSTRAINT `instansi_desc_ibfk_1` FOREIGN KEY (`instansi_id`) REFERENCES `instansi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.instansi_desc: ~3 rows (approximately)
/*!40000 ALTER TABLE `instansi_desc` DISABLE KEYS */;
INSERT INTO `instansi_desc` (`id`, `instansi_id`, `desc`) VALUES
	(4, 6, 'Tegalgundil adalah salah satu kelurahan di Kecamatan Bogor Utara, Kota Bogor, Jawa Barat, Indonesia. Bro'),
	(5, 7, 'lagi dan lagi\r\nItu deh pokonyamah'),
	(6, 8, 'asdfghjkl;sdfghjk');
/*!40000 ALTER TABLE `instansi_desc` ENABLE KEYS */;


-- Dumping structure for table empus.instansi_img
CREATE TABLE IF NOT EXISTS `instansi_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instansi_id` int(11) NOT NULL,
  `img` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instansi_id` (`instansi_id`),
  CONSTRAINT `instansi_img_ibfk_1` FOREIGN KEY (`instansi_id`) REFERENCES `instansi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.instansi_img: ~3 rows (approximately)
/*!40000 ALTER TABLE `instansi_img` DISABLE KEYS */;
INSERT INTO `instansi_img` (`id`, `instansi_id`, `img`) VALUES
	(4, 6, '6.JPG'),
	(5, 7, '7.JPG'),
	(6, 8, '8.jpg');
/*!40000 ALTER TABLE `instansi_img` ENABLE KEYS */;


-- Dumping structure for table empus.instansi_pelayanan
CREATE TABLE IF NOT EXISTS `instansi_pelayanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instansi_id` int(11) NOT NULL,
  `pelayanan_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instansi_id` (`instansi_id`,`pelayanan_id`),
  KEY `pelayanan_id` (`pelayanan_id`),
  CONSTRAINT `instansi_pelayanan_ibfk_1` FOREIGN KEY (`instansi_id`) REFERENCES `instansi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `instansi_pelayanan_ibfk_2` FOREIGN KEY (`pelayanan_id`) REFERENCES `pelayanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.instansi_pelayanan: ~4 rows (approximately)
/*!40000 ALTER TABLE `instansi_pelayanan` DISABLE KEYS */;
INSERT INTO `instansi_pelayanan` (`id`, `instansi_id`, `pelayanan_id`) VALUES
	(8, 6, 2),
	(9, 7, 2),
	(11, 7, 3),
	(10, 8, 3);
/*!40000 ALTER TABLE `instansi_pelayanan` ENABLE KEYS */;


-- Dumping structure for table empus.instansi_profile
CREATE TABLE IF NOT EXISTS `instansi_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instansi_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`instansi_id`,`profile_id`),
  UNIQUE KEY `id` (`id`),
  KEY `profile_id` (`profile_id`),
  CONSTRAINT `instansi_profile_ibfk_1` FOREIGN KEY (`instansi_id`) REFERENCES `instansi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `instansi_profile_ibfk_2` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.instansi_profile: ~4 rows (approximately)
/*!40000 ALTER TABLE `instansi_profile` DISABLE KEYS */;
INSERT INTO `instansi_profile` (`id`, `instansi_id`, `profile_id`, `text`) VALUES
	(5, 6, 1, '09876543'),
	(3, 6, 4, 'Ya itu, di tegal gundil.\r\n\r\nYeeey!!!'),
	(7, 7, 1, '9876543'),
	(8, 7, 4, 'Dimana Hayooo\r\nAdaaa');
/*!40000 ALTER TABLE `instansi_profile` ENABLE KEYS */;


-- Dumping structure for table empus.komentar
CREATE TABLE IF NOT EXISTS `komentar` (
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.komentar: ~5 rows (approximately)
/*!40000 ALTER TABLE `komentar` DISABLE KEYS */;
INSERT INTO `komentar` (`id`, `opini_id`, `person_id`, `created_at`, `updated_at`) VALUES
	(1, 11, 30, '2014-06-11 07:34:57', '2014-06-11 07:34:57'),
	(2, 11, 30, '2014-06-11 07:38:17', '2014-06-11 07:38:18'),
	(3, 9, 31, '2014-07-09 18:38:08', '2014-07-09 18:38:09'),
	(4, 9, 31, '2014-07-09 18:46:21', '2014-07-09 18:46:21'),
	(5, 16, 31, '2014-07-09 20:03:40', '2014-07-09 20:03:40'),
	(6, 10, 31, '2014-07-09 21:55:45', '2014-07-09 21:55:45');
/*!40000 ALTER TABLE `komentar` ENABLE KEYS */;


-- Dumping structure for table empus.komentar_desc
CREATE TABLE IF NOT EXISTS `komentar_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `komentar_id` int(11) NOT NULL,
  `desc` text NOT NULL,
  PRIMARY KEY (`komentar_id`),
  UNIQUE KEY `id` (`id`),
  CONSTRAINT `komentar_desc_ibfk_1` FOREIGN KEY (`komentar_id`) REFERENCES `komentar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.komentar_desc: ~4 rows (approximately)
/*!40000 ALTER TABLE `komentar_desc` DISABLE KEYS */;
INSERT INTO `komentar_desc` (`id`, `komentar_id`, `desc`) VALUES
	(1, 2, 'afdaffffffffffffff'),
	(2, 3, 'kijuhgfokijhg'),
	(3, 4, 'kijuhgfokijhg'),
	(4, 5, 'okijhnbikjhbv'),
	(5, 6, 'adfadadf');
/*!40000 ALTER TABLE `komentar_desc` ENABLE KEYS */;


-- Dumping structure for table empus.opini
CREATE TABLE IF NOT EXISTS `opini` (
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.opini: ~16 rows (approximately)
/*!40000 ALTER TABLE `opini` DISABLE KEYS */;
INSERT INTO `opini` (`id`, `title`, `type`, `status`, `person_id`, `created_at`, `updated_at`) VALUES
	(5, 'SDSD', 1, 1, 17, '2014-06-08 18:18:49', NULL),
	(6, 'SDSD', 1, 1, 17, '2014-06-08 18:19:53', NULL),
	(7, 'abcde', 1, 1, 17, '2014-06-09 00:29:28', NULL),
	(9, 'abcde', 1, 1, 17, '2014-06-09 00:30:31', NULL),
	(10, 'abcde', 1, 3, 17, '2014-06-09 00:30:35', NULL),
	(11, 'Apa aja', 1, 1, 17, '2014-06-11 00:05:48', NULL),
	(13, 'lkjhgvbjhgf', 1, 1, 18, '2014-07-08 22:36:29', NULL),
	(16, 'lkjhgvbjhgf', 2, 1, 18, '2014-07-08 23:05:54', NULL),
	(17, 'ijuhgvf bnjuhygfc', 2, 1, 18, '2014-07-08 23:36:00', NULL),
	(18, 'ijuhgvf bnjuAkfadfkj', 3, 1, 18, '2014-07-08 23:36:32', NULL),
	(19, 'rgsfgfsgfsgsfg', 1, 1, 18, '2014-07-09 00:59:32', NULL),
	(20, 'hyehtehteh', 2, 1, 18, '2014-07-09 00:59:48', NULL),
	(21, 'adfadfadda', 2, 1, 18, '2014-07-09 01:00:55', NULL),
	(22, 'lkhjgvcfxikjhgfc', 2, 1, 18, '2014-07-09 16:00:42', NULL),
	(23, 'oijhygfcd', 3, 1, 31, '2014-07-09 17:08:27', NULL),
	(24, 'testi', 3, 1, 31, '2014-07-09 17:09:01', NULL);
/*!40000 ALTER TABLE `opini` ENABLE KEYS */;


-- Dumping structure for table empus.opini_desc
CREATE TABLE IF NOT EXISTS `opini_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opini_id` int(11) NOT NULL,
  `desc` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `opini_id` (`opini_id`),
  CONSTRAINT `opini_desc_ibfk_1` FOREIGN KEY (`opini_id`) REFERENCES `opini` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.opini_desc: ~16 rows (approximately)
/*!40000 ALTER TABLE `opini_desc` DISABLE KEYS */;
INSERT INTO `opini_desc` (`id`, `opini_id`, `desc`) VALUES
	(4, 5, 'adADFADFDA'),
	(5, 6, 'adADFADFDA'),
	(6, 7, 'saaaaaaaaaa'),
	(8, 9, 'saaaaaaaaaadddddddddd'),
	(9, 10, 'sfadddddddddd'),
	(10, 11, 'ya gitu ...\r\n\r\napa lagi yaa ... '),
	(11, 13, 'kjhbv nmkjhgvfc bnjnhbc'),
	(14, 16, 'kjhbv nmkjhgvfc bnjnhbc'),
	(15, 17, 'kjhbgv njnhgfv bnjmhgf'),
	(16, 18, 'adfljafda lmadfa dd kjhbgv njnhgfv bnjmhgf'),
	(17, 19, 'qrtwrtwtrwtrwtrwt'),
	(18, 20, 'sfsgwtgrwgrw2'),
	(19, 21, '4geqgg4qg2qt'),
	(20, 22, 'lkjnhbvkjnhbv'),
	(21, 23, 'okijhb jkijhygv bnmkjhgv nmk,juhbgv nk,mhbgv '),
	(22, 24, 'testi testi testi');
/*!40000 ALTER TABLE `opini_desc` ENABLE KEYS */;


-- Dumping structure for table empus.opini_img
CREATE TABLE IF NOT EXISTS `opini_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opini_id` int(11) NOT NULL,
  `img` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `opini_id` (`opini_id`),
  CONSTRAINT `opini_img_ibfk_1` FOREIGN KEY (`opini_id`) REFERENCES `opini` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.opini_img: ~9 rows (approximately)
/*!40000 ALTER TABLE `opini_img` DISABLE KEYS */;
INSERT INTO `opini_img` (`id`, `opini_id`, `img`) VALUES
	(1, 13, '13.jpg'),
	(4, 16, '16.jpg'),
	(5, 18, '18.jpg'),
	(6, 19, '19.jpg'),
	(7, 20, '20.jpg'),
	(8, 21, '21.jpg'),
	(9, 22, '22.jpg'),
	(10, 23, '23.jpg'),
	(11, 24, '24.jpg');
/*!40000 ALTER TABLE `opini_img` ENABLE KEYS */;


-- Dumping structure for table empus.opini_instansi
CREATE TABLE IF NOT EXISTS `opini_instansi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opini_id` int(11) NOT NULL,
  `instansi_id` int(11) NOT NULL,
  PRIMARY KEY (`opini_id`),
  UNIQUE KEY `id` (`id`),
  KEY `instansi_id` (`instansi_id`),
  CONSTRAINT `opini_instansi_ibfk_1` FOREIGN KEY (`opini_id`) REFERENCES `opini` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `opini_instansi_ibfk_2` FOREIGN KEY (`instansi_id`) REFERENCES `instansi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table empus.opini_instansi: ~0 rows (approximately)
/*!40000 ALTER TABLE `opini_instansi` DISABLE KEYS */;
/*!40000 ALTER TABLE `opini_instansi` ENABLE KEYS */;


-- Dumping structure for table empus.opini_instansi_pelayanan
CREATE TABLE IF NOT EXISTS `opini_instansi_pelayanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opini_id` int(11) NOT NULL,
  `instansi_pelayanan_id` int(11) NOT NULL,
  PRIMARY KEY (`opini_id`),
  UNIQUE KEY `id` (`id`),
  KEY `instansi_pelayanan_id` (`instansi_pelayanan_id`),
  CONSTRAINT `opini_instansi_pelayanan_ibfk_1` FOREIGN KEY (`opini_id`) REFERENCES `opini` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `opini_instansi_pelayanan_ibfk_2` FOREIGN KEY (`instansi_pelayanan_id`) REFERENCES `instansi_pelayanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.opini_instansi_pelayanan: ~13 rows (approximately)
/*!40000 ALTER TABLE `opini_instansi_pelayanan` DISABLE KEYS */;
INSERT INTO `opini_instansi_pelayanan` (`id`, `opini_id`, `instansi_pelayanan_id`) VALUES
	(1, 9, 8),
	(2, 10, 8),
	(3, 11, 8),
	(4, 13, 8),
	(5, 16, 8),
	(6, 17, 8),
	(7, 18, 8),
	(8, 19, 8),
	(9, 20, 8),
	(10, 21, 10),
	(11, 22, 11),
	(12, 23, 8),
	(13, 24, 8);
/*!40000 ALTER TABLE `opini_instansi_pelayanan` ENABLE KEYS */;


-- Dumping structure for view empus.opini_tag
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `opini_tag` (
	`id` INT(11) NOT NULL,
	`opini_id` INT(11) NOT NULL,
	`tag_id` INT(11) NOT NULL,
	`instansi_id` INT(11) NULL,
	`type` VARCHAR(18) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Dumping structure for table empus.pelayanan
CREATE TABLE IF NOT EXISTS `pelayanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `ts_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.pelayanan: ~2 rows (approximately)
/*!40000 ALTER TABLE `pelayanan` DISABLE KEYS */;
INSERT INTO `pelayanan` (`id`, `name`, `ts_created`) VALUES
	(2, 'Pembuatan Kartu Tanda Penduduk', '2014-06-07 00:53:44'),
	(3, 'pelayanan lagi', '2014-06-15 04:20:44');
/*!40000 ALTER TABLE `pelayanan` ENABLE KEYS */;


-- Dumping structure for table empus.pelayanan_desc
CREATE TABLE IF NOT EXISTS `pelayanan_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pelayanan_id` int(11) NOT NULL,
  `desc` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pelayanan_id` (`pelayanan_id`),
  CONSTRAINT `pelayanan_desc_ibfk_1` FOREIGN KEY (`pelayanan_id`) REFERENCES `pelayanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.pelayanan_desc: ~2 rows (approximately)
/*!40000 ALTER TABLE `pelayanan_desc` DISABLE KEYS */;
INSERT INTO `pelayanan_desc` (`id`, `pelayanan_id`, `desc`) VALUES
	(2, 2, 'Kartu Tanda Penduduk (KTP) adalah identitas resmi Penduduk sebagai bukti diri yang diterbitkan oleh Instansi Pelaksana yang berlaku di seluruh wilayah Negara Kesatuan Republik Indonesia. Kartu ini wajib dimiliki bagi Warga Negara Indonesia (WNI) dan Warga Negara Asing (WNA) yang memiliki Izin Tinggal Tetap (ITAP) yang sudah berumur 17 tahun atau sudah pernah kawin atau telah kawin. Anak dari orang tua WNA yang memiliki ITAP dan sudah berumur 17 tahun juga wajib memilki KTP. KTP bagi WNI berlaku selama lima tahun dan tanggal berakhirnya disesuaikan dengan tanggal dan bulan kelahiran yang bersangkutan. \r\n\r\nKTP bagi WNA berlaku sesuai dengan masa Izin Tinggal Tetap. Khusus warga yang telah berusia 60 tahun dan ke atas, mendapat KTP seumur hidup yang tidak perlu diperpanjang setiap lima tahun sekali.'),
	(3, 3, 'deskripsi ajah');
/*!40000 ALTER TABLE `pelayanan_desc` ENABLE KEYS */;


-- Dumping structure for table empus.person
CREATE TABLE IF NOT EXISTS `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.person: ~20 rows (approximately)
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(12, 'Reza', '2014-05-22 20:07:23', '2014-05-22 20:07:23'),
	(13, 'Reza', '2014-05-22 23:12:32', '2014-05-22 23:12:32'),
	(14, 'Reza', '2014-05-22 23:15:18', '2014-05-22 23:15:18'),
	(15, 'Reza', '2014-05-22 23:15:21', '2014-05-22 23:15:21'),
	(16, 'Reza', '2014-05-22 23:17:30', '2014-05-22 23:17:30'),
	(17, 'Reza', '2014-05-22 23:17:37', '2014-05-22 23:17:37'),
	(18, 'reza', '2014-05-22 23:35:54', '2014-05-22 23:35:54'),
	(19, 'akdufafdky', '2014-05-23 07:28:43', '2014-05-23 07:28:43'),
	(20, 'Reza', '2014-05-24 09:45:35', '2014-05-24 09:45:35'),
	(21, 'reza', '2014-05-30 03:31:15', '2014-05-30 03:31:15'),
	(22, 'reza yo', '2014-05-30 03:43:16', '2014-05-30 03:43:16'),
	(23, 'Reza Firmansyah', '2014-05-30 08:25:42', '2014-05-30 08:25:42'),
	(24, 'Reza', '2014-06-02 02:08:15', '2014-06-02 02:08:15'),
	(25, 'reza', '2014-06-02 02:13:41', '2014-06-02 02:13:41'),
	(26, 'reza', '2014-06-02 03:57:10', '2014-06-02 03:57:10'),
	(27, 'Admin', '2014-06-05 10:02:59', '2014-06-05 10:02:59'),
	(28, 'Reza', '2014-06-05 10:24:32', '2014-06-05 10:24:32'),
	(29, 'reza', '2014-06-05 10:40:48', '2014-06-05 10:40:48'),
	(30, 'Reza Firmansyah', '2014-06-06 16:01:03', '2014-06-06 16:01:03'),
	(31, 'Reza F', '2014-07-08 09:01:17', '2014-07-08 09:01:17');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;


-- Dumping structure for table empus.persyaratan
CREATE TABLE IF NOT EXISTS `persyaratan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` tinyint(4) NOT NULL,
  `title` varchar(250) NOT NULL,
  `pelayanan_id` int(11) NOT NULL,
  `ts_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_pelayanan_id` (`order`,`pelayanan_id`),
  KEY `pelayanan_id` (`pelayanan_id`),
  CONSTRAINT `persyaratan_ibfk_1` FOREIGN KEY (`pelayanan_id`) REFERENCES `pelayanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.persyaratan: ~4 rows (approximately)
/*!40000 ALTER TABLE `persyaratan` DISABLE KEYS */;
INSERT INTO `persyaratan` (`id`, `order`, `title`, `pelayanan_id`, `ts_created`) VALUES
	(6, 5, 'Afda', 2, '2014-06-07 01:20:22'),
	(7, 2, 'sdfaaf', 2, '2014-06-07 01:21:08'),
	(8, 1, 'fadfafdqer', 2, '2014-06-07 01:25:38'),
	(11, 8, 'okijhbg', 2, '2014-07-07 11:00:37');
/*!40000 ALTER TABLE `persyaratan` ENABLE KEYS */;


-- Dumping structure for table empus.persyaratan_desc
CREATE TABLE IF NOT EXISTS `persyaratan_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persyaratan_id` int(11) NOT NULL,
  `desc` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persyaratan_id` (`persyaratan_id`),
  CONSTRAINT `persyaratan_desc_ibfk_1` FOREIGN KEY (`persyaratan_id`) REFERENCES `persyaratan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.persyaratan_desc: ~4 rows (approximately)
/*!40000 ALTER TABLE `persyaratan_desc` DISABLE KEYS */;
INSERT INTO `persyaratan_desc` (`id`, `persyaratan_id`, `desc`) VALUES
	(1, 6, 'jkadfda'),
	(2, 7, 'adfaadfa'),
	(3, 8, 'eqrqerqr'),
	(5, 11, 'lkjhb kjhg');
/*!40000 ALTER TABLE `persyaratan_desc` ENABLE KEYS */;


-- Dumping structure for table empus.persyaratan_img
CREATE TABLE IF NOT EXISTS `persyaratan_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persyaratan_id` int(11) NOT NULL,
  `img` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persyaratan_id` (`persyaratan_id`),
  CONSTRAINT `persyaratan_img_ibfk_1` FOREIGN KEY (`persyaratan_id`) REFERENCES `persyaratan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.persyaratan_img: ~4 rows (approximately)
/*!40000 ALTER TABLE `persyaratan_img` DISABLE KEYS */;
INSERT INTO `persyaratan_img` (`id`, `persyaratan_id`, `img`) VALUES
	(2, 6, '6.jpg'),
	(3, 7, '7.png'),
	(4, 8, '8.jpg'),
	(6, 11, '11.JPG');
/*!40000 ALTER TABLE `persyaratan_img` ENABLE KEYS */;


-- Dumping structure for table empus.profile
CREATE TABLE IF NOT EXISTS `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile` (`profile`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.profile: ~4 rows (approximately)
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` (`id`, `profile`) VALUES
	(4, 'Alamat'),
	(3, 'Email'),
	(2, 'Fax'),
	(1, 'Telepon');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;


-- Dumping structure for table empus.prosedur
CREATE TABLE IF NOT EXISTS `prosedur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` tinyint(4) NOT NULL,
  `title` varchar(250) NOT NULL,
  `pelayanan_id` int(11) NOT NULL,
  `ts_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_pelayanan_id` (`order`,`pelayanan_id`),
  KEY `pelayanan_id` (`pelayanan_id`),
  CONSTRAINT `prosedur_ibfk_1` FOREIGN KEY (`pelayanan_id`) REFERENCES `pelayanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.prosedur: ~2 rows (approximately)
/*!40000 ALTER TABLE `prosedur` DISABLE KEYS */;
INSERT INTO `prosedur` (`id`, `order`, `title`, `pelayanan_id`, `ts_created`) VALUES
	(2, 2, 'cghjkmda', 2, '2014-06-07 03:16:59'),
	(3, 1, 'okijhygfvghjkjuhgf', 2, '2014-07-07 10:29:18');
/*!40000 ALTER TABLE `prosedur` ENABLE KEYS */;


-- Dumping structure for table empus.prosedur_desc
CREATE TABLE IF NOT EXISTS `prosedur_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prosedur_id` int(11) NOT NULL,
  `desc` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prosedur_id` (`prosedur_id`),
  CONSTRAINT `prosedur_desc_ibfk_1` FOREIGN KEY (`prosedur_id`) REFERENCES `prosedur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.prosedur_desc: ~1 rows (approximately)
/*!40000 ALTER TABLE `prosedur_desc` DISABLE KEYS */;
INSERT INTO `prosedur_desc` (`id`, `prosedur_id`, `desc`) VALUES
	(1, 2, 'ghujandfada');
/*!40000 ALTER TABLE `prosedur_desc` ENABLE KEYS */;


-- Dumping structure for table empus.prosedur_img
CREATE TABLE IF NOT EXISTS `prosedur_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prosedur_id` int(11) NOT NULL,
  `img` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prosedur_id` (`prosedur_id`),
  CONSTRAINT `prosedur_img_ibfk_1` FOREIGN KEY (`prosedur_id`) REFERENCES `prosedur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.prosedur_img: ~1 rows (approximately)
/*!40000 ALTER TABLE `prosedur_img` DISABLE KEYS */;
INSERT INTO `prosedur_img` (`id`, `prosedur_id`, `img`) VALUES
	(1, 2, '2.jpg');
/*!40000 ALTER TABLE `prosedur_img` ENABLE KEYS */;


-- Dumping structure for table empus.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.role: ~3 rows (approximately)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `role`) VALUES
	(1, 'Administrator'),
	(2, 'Citizen'),
	(3, 'Government');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


-- Dumping structure for table empus.user
CREATE TABLE IF NOT EXISTS `user` (
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.user: ~8 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `password`, `email`, `person_id`, `remember_token`, `created_at`, `updated_at`) VALUES
	(10, 'alfa_benedict@yahoo.com', '$2y$10$gWPOKhoX.9vX2YR1RL6cA.sejCvb22dUCsDlvoIDK36q4iwtEfwii', 'alfa_benedict@yahoo.com', 23, NULL, '2014-05-30 08:25:42', '2014-05-30 08:25:42'),
	(12, 'a@a.c', '$2y$10$kWvdRlxBHExT3RYEd3fjR.pAIHMviSd1ablI0YnhAx399UM3qgWCm', 'a@a.c', 25, NULL, '2014-06-02 02:13:41', '2014-06-02 02:13:41'),
	(13, 'a@a.caw', '$2y$10$hQiUTHz4uDxKsx19nsnrcuWcqs4HzbHwfQYDttqdslqKWCMPe3uwq', 'a@a.caw', 26, NULL, '2014-06-02 03:57:11', '2014-06-02 03:57:11'),
	(14, 'aliezka@gmail.com', '$2y$10$bQw6W/YoPvw7mOMVdVvDtuULhhYCND6vFWzjYvy5bpTVbGpU3SqDy', 'aliezka@gmail.com', 27, NULL, '2014-06-05 10:03:00', '2014-06-05 10:03:00'),
	(15, 'adfkjadf@hjadfad.com', '$2y$10$Yqk3kUR1G4tWbaCvwcclqeYHj86yvg9IG/S9PCDKPsW66z8mRlC5.', 'adfkjadf@hjadfad.com', 28, NULL, '2014-06-05 10:24:32', '2014-06-05 10:24:32'),
	(16, 'admin@yukerja.com', '$2y$10$xUQJeW2CPbzVgH1o40tr8OtMJc3c3Why9y1Jj6x56OjjD6wCq2Fey', 'admin@yukerja.com', 29, NULL, '2014-06-05 10:40:48', '2014-06-05 10:40:48'),
	(17, 'reza@lo.cal', '$2y$10$gfnox2XRmvUOcBt6z0hf7erL1bkJHZM2KI3TDDXzzX4S6hTbLn07i', 'reza@lo.cal', 30, 'sFyuIcnJnajb0grf2Nxj4smmyx6tXbI9KE10KeVCvGygdvTmMdLbNiyYXe3n', '2014-06-06 16:01:04', '2014-07-08 17:59:00'),
	(18, 'a@b.c', '$2y$10$a.LhTqnAzYiDtvZRFMCGWOF6ycGUUMxEuL46dj/va.CZriXxhdRjq', 'a@b.c', 31, 'bgmY1tA88DlUPmWPEixbv5leyxr77lW6lSlpypEjOCI78VNKnP5wU43dHZch', '2014-07-08 09:01:17', '2014-07-09 19:30:39');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- Dumping structure for table empus.user_role
CREATE TABLE IF NOT EXISTS `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  UNIQUE KEY `id` (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.user_role: ~8 rows (approximately)
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`id`, `user_id`, `role_id`) VALUES
	(8, 10, 2),
	(10, 12, 2),
	(11, 13, 2),
	(12, 14, 2),
	(13, 15, 2),
	(14, 16, 2),
	(15, 17, 1),
	(16, 18, 3);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;


-- Dumping structure for view empus.berita_tag
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `berita_tag`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `berita_tag` AS select `berita_instansi`.`id` AS `id`,`berita_instansi`.`berita_id` AS `berita_id`,`berita_instansi`.`instansi_id` AS `tag_id`,if((`berita_instansi`.`instansi_id` = NULL),NULL,'instansi') AS `type` from `berita_instansi` union all select `berita_pelayanan`.`id` AS `id`,`berita_pelayanan`.`berita_id` AS `berita_id`,`berita_pelayanan`.`pelayanan_id` AS `tag_id`,if((`berita_pelayanan`.`pelayanan_id` = NULL),NULL,'pelayanan') AS `type` from `berita_pelayanan`;


-- Dumping structure for view empus.opini_tag
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `opini_tag`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `opini_tag` AS select `oi`.`id` AS `id`,`oi`.`opini_id` AS `opini_id`,`oi`.`instansi_id` AS `tag_id`,if((`oi`.`instansi_id` = NULL),NULL,`oi`.`instansi_id`) AS `instansi_id`,if((`oi`.`instansi_id` = NULL),NULL,'instansi') AS `type` from `opini_instansi` `oi` union all select `oip`.`id` AS `id`,`oip`.`opini_id` AS `opini_id`,`oip`.`instansi_pelayanan_id` AS `tag_id`,if((`oip`.`instansi_pelayanan_id` = NULL),NULL,(select `ip`.`instansi_id` from `instansi_pelayanan` `ip` where (`ip`.`id` = `oip`.`instansi_pelayanan_id`))) AS `instansi_id`,if((`oip`.`instansi_pelayanan_id` = NULL),NULL,'instansi_pelayanan') AS `type` from `opini_instansi_pelayanan` `oip`;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
