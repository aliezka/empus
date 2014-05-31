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
  `ts_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table empus.berita: ~0 rows (approximately)
/*!40000 ALTER TABLE `berita` DISABLE KEYS */;
/*!40000 ALTER TABLE `berita` ENABLE KEYS */;


-- Dumping structure for table empus.berita_desc
CREATE TABLE IF NOT EXISTS `berita_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `berita_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `berita_id` (`berita_id`),
  CONSTRAINT `berita_desc_ibfk_1` FOREIGN KEY (`berita_id`) REFERENCES `berita` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table empus.berita_desc: ~0 rows (approximately)
/*!40000 ALTER TABLE `berita_desc` DISABLE KEYS */;
/*!40000 ALTER TABLE `berita_desc` ENABLE KEYS */;


-- Dumping structure for table empus.berita_img
CREATE TABLE IF NOT EXISTS `berita_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `berita_id` int(11) NOT NULL,
  `img` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `berita_id` (`berita_id`),
  CONSTRAINT `berita_img_ibfk_1` FOREIGN KEY (`berita_id`) REFERENCES `berita` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table empus.berita_img: ~0 rows (approximately)
/*!40000 ALTER TABLE `berita_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `berita_img` ENABLE KEYS */;


-- Dumping structure for table empus.instansi
CREATE TABLE IF NOT EXISTS `instansi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `ts_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table empus.instansi: ~0 rows (approximately)
/*!40000 ALTER TABLE `instansi` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table empus.instansi_desc: ~0 rows (approximately)
/*!40000 ALTER TABLE `instansi_desc` DISABLE KEYS */;
/*!40000 ALTER TABLE `instansi_desc` ENABLE KEYS */;


-- Dumping structure for table empus.instansi_img
CREATE TABLE IF NOT EXISTS `instansi_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instansi_id` int(11) NOT NULL,
  `img` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instansi_id` (`instansi_id`),
  CONSTRAINT `instansi_img_ibfk_1` FOREIGN KEY (`instansi_id`) REFERENCES `instansi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table empus.instansi_img: ~0 rows (approximately)
/*!40000 ALTER TABLE `instansi_img` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table empus.instansi_pelayanan: ~0 rows (approximately)
/*!40000 ALTER TABLE `instansi_pelayanan` DISABLE KEYS */;
/*!40000 ALTER TABLE `instansi_pelayanan` ENABLE KEYS */;


-- Dumping structure for table empus.instansi_pelayanan_berita
CREATE TABLE IF NOT EXISTS `instansi_pelayanan_berita` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instansi_pelayanan_id` int(11) NOT NULL,
  `berita_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instansi_pelayanan_id` (`instansi_pelayanan_id`,`berita_id`),
  KEY `berita_id` (`berita_id`),
  CONSTRAINT `instansi_pelayanan_berita_ibfk_1` FOREIGN KEY (`instansi_pelayanan_id`) REFERENCES `instansi_pelayanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `instansi_pelayanan_berita_ibfk_2` FOREIGN KEY (`berita_id`) REFERENCES `berita` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table empus.instansi_pelayanan_berita: ~0 rows (approximately)
/*!40000 ALTER TABLE `instansi_pelayanan_berita` DISABLE KEYS */;
/*!40000 ALTER TABLE `instansi_pelayanan_berita` ENABLE KEYS */;


-- Dumping structure for table empus.opini
CREATE TABLE IF NOT EXISTS `opini` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `ts_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table empus.opini: ~0 rows (approximately)
/*!40000 ALTER TABLE `opini` DISABLE KEYS */;
/*!40000 ALTER TABLE `opini` ENABLE KEYS */;


-- Dumping structure for table empus.opini_desc
CREATE TABLE IF NOT EXISTS `opini_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opini_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `opini_id` (`opini_id`),
  CONSTRAINT `opini_desc_ibfk_1` FOREIGN KEY (`opini_id`) REFERENCES `opini` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table empus.opini_desc: ~0 rows (approximately)
/*!40000 ALTER TABLE `opini_desc` DISABLE KEYS */;
/*!40000 ALTER TABLE `opini_desc` ENABLE KEYS */;


-- Dumping structure for table empus.opini_img
CREATE TABLE IF NOT EXISTS `opini_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opini_id` int(11) NOT NULL,
  `img` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `opini_id` (`opini_id`),
  CONSTRAINT `opini_img_ibfk_1` FOREIGN KEY (`opini_id`) REFERENCES `opini` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table empus.opini_img: ~0 rows (approximately)
/*!40000 ALTER TABLE `opini_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `opini_img` ENABLE KEYS */;


-- Dumping structure for table empus.pelayanan
CREATE TABLE IF NOT EXISTS `pelayanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `ts_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table empus.pelayanan: ~0 rows (approximately)
/*!40000 ALTER TABLE `pelayanan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pelayanan` ENABLE KEYS */;


-- Dumping structure for table empus.pelayanan_berita
CREATE TABLE IF NOT EXISTS `pelayanan_berita` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pelayanan_id` int(11) NOT NULL,
  `berita_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pelayanan_id` (`pelayanan_id`,`berita_id`),
  KEY `berita_id` (`berita_id`),
  CONSTRAINT `pelayanan_berita_ibfk_1` FOREIGN KEY (`pelayanan_id`) REFERENCES `pelayanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pelayanan_berita_ibfk_2` FOREIGN KEY (`berita_id`) REFERENCES `berita` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table empus.pelayanan_berita: ~0 rows (approximately)
/*!40000 ALTER TABLE `pelayanan_berita` DISABLE KEYS */;
/*!40000 ALTER TABLE `pelayanan_berita` ENABLE KEYS */;


-- Dumping structure for table empus.pelayanan_desc
CREATE TABLE IF NOT EXISTS `pelayanan_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pelayanan_id` int(11) NOT NULL,
  `desc` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pelayanan_id` (`pelayanan_id`),
  CONSTRAINT `pelayanan_desc_ibfk_1` FOREIGN KEY (`pelayanan_id`) REFERENCES `pelayanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table empus.pelayanan_desc: ~0 rows (approximately)
/*!40000 ALTER TABLE `pelayanan_desc` DISABLE KEYS */;
/*!40000 ALTER TABLE `pelayanan_desc` ENABLE KEYS */;


-- Dumping structure for table empus.pelayanan_img
CREATE TABLE IF NOT EXISTS `pelayanan_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pelayanan_id` int(11) NOT NULL,
  `img` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pelayanan_id` (`pelayanan_id`),
  CONSTRAINT `pelayanan_img_ibfk_1` FOREIGN KEY (`pelayanan_id`) REFERENCES `pelayanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table empus.pelayanan_img: ~0 rows (approximately)
/*!40000 ALTER TABLE `pelayanan_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `pelayanan_img` ENABLE KEYS */;


-- Dumping structure for table empus.person
CREATE TABLE IF NOT EXISTS `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.person: ~12 rows (approximately)
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
	(23, 'Reza Firmansyah', '2014-05-30 08:25:42', '2014-05-30 08:25:42');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;


-- Dumping structure for table empus.persyaratan
CREATE TABLE IF NOT EXISTS `persyaratan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` tinyint(4) NOT NULL,
  `title` varchar(250) NOT NULL,
  `pelayanan_id` int(11) NOT NULL,
  `ts_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order` (`order`,`pelayanan_id`),
  KEY `pelayanan_id` (`pelayanan_id`),
  CONSTRAINT `persyaratan_ibfk_1` FOREIGN KEY (`pelayanan_id`) REFERENCES `pelayanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table empus.persyaratan: ~0 rows (approximately)
/*!40000 ALTER TABLE `persyaratan` DISABLE KEYS */;
/*!40000 ALTER TABLE `persyaratan` ENABLE KEYS */;


-- Dumping structure for table empus.persyaratan_desc
CREATE TABLE IF NOT EXISTS `persyaratan_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persyaratan_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persyaratan_id` (`persyaratan_id`),
  CONSTRAINT `persyaratan_desc_ibfk_1` FOREIGN KEY (`persyaratan_id`) REFERENCES `persyaratan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table empus.persyaratan_desc: ~0 rows (approximately)
/*!40000 ALTER TABLE `persyaratan_desc` DISABLE KEYS */;
/*!40000 ALTER TABLE `persyaratan_desc` ENABLE KEYS */;


-- Dumping structure for table empus.persyaratan_img
CREATE TABLE IF NOT EXISTS `persyaratan_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persyaratan_id` int(11) NOT NULL,
  `img` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persyaratan_id` (`persyaratan_id`),
  CONSTRAINT `persyaratan_img_ibfk_1` FOREIGN KEY (`persyaratan_id`) REFERENCES `persyaratan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table empus.persyaratan_img: ~0 rows (approximately)
/*!40000 ALTER TABLE `persyaratan_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `persyaratan_img` ENABLE KEYS */;


-- Dumping structure for table empus.profile
CREATE TABLE IF NOT EXISTS `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile` (`profile`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table empus.profile: ~0 rows (approximately)
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;


-- Dumping structure for table empus.prosedur
CREATE TABLE IF NOT EXISTS `prosedur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` tinyint(4) NOT NULL,
  `title` varchar(250) NOT NULL,
  `pelayanan_id` int(11) NOT NULL,
  `ts_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order` (`order`,`pelayanan_id`),
  KEY `pelayanan_id` (`pelayanan_id`),
  CONSTRAINT `prosedur_ibfk_1` FOREIGN KEY (`pelayanan_id`) REFERENCES `pelayanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table empus.prosedur: ~0 rows (approximately)
/*!40000 ALTER TABLE `prosedur` DISABLE KEYS */;
/*!40000 ALTER TABLE `prosedur` ENABLE KEYS */;


-- Dumping structure for table empus.prosedur_desc
CREATE TABLE IF NOT EXISTS `prosedur_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prosedur_id` int(11) NOT NULL,
  `desc` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prosedur_id` (`prosedur_id`),
  CONSTRAINT `prosedur_desc_ibfk_1` FOREIGN KEY (`prosedur_id`) REFERENCES `prosedur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table empus.prosedur_desc: ~0 rows (approximately)
/*!40000 ALTER TABLE `prosedur_desc` DISABLE KEYS */;
/*!40000 ALTER TABLE `prosedur_desc` ENABLE KEYS */;


-- Dumping structure for table empus.prosedur_img
CREATE TABLE IF NOT EXISTS `prosedur_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prosedur_id` int(11) NOT NULL,
  `img` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prosedur_id` (`prosedur_id`),
  CONSTRAINT `prosedur_img_ibfk_1` FOREIGN KEY (`prosedur_id`) REFERENCES `prosedur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table empus.prosedur_img: ~0 rows (approximately)
/*!40000 ALTER TABLE `prosedur_img` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.user: ~8 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `password`, `email`, `person_id`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'reza@abc.com', '123456', 'reza@abc.com', 14, NULL, '2014-05-22 23:15:18', '2014-05-22 23:15:18'),
	(3, 'reza@blablabla.com', '123456', 'reza@blablabla.com', 16, NULL, '2014-05-22 23:17:30', '2014-05-22 23:17:30'),
	(5, 'reza@klm.opq', '123456', 'reza@klm.opq', 18, NULL, '2014-05-22 23:35:54', '2014-05-22 23:35:54'),
	(6, 'abcde@akjdf.afe', 'adkfhadf', 'abcde@akjdf.afe', 19, NULL, '2014-05-23 07:28:43', '2014-05-23 07:28:43'),
	(7, 'aliezka@gmail.com', '123456', 'aliezka@gmail.com', 20, NULL, '2014-05-24 09:45:35', '2014-05-24 09:45:35'),
	(8, 'reza@about.me', '123456', 'reza@about.me', 21, NULL, '2014-05-30 03:31:15', '2014-05-30 03:31:15'),
	(9, 'reza@about.mes', '123456', 'reza@about.mes', 22, NULL, '2014-05-30 03:43:16', '2014-05-30 03:43:16'),
	(10, 'alfa_benedict@yahoo.com', '$2y$10$gWPOKhoX.9vX2YR1RL6cA.sejCvb22dUCsDlvoIDK36q4iwtEfwii', 'alfa_benedict@yahoo.com', 23, NULL, '2014-05-30 08:25:42', '2014-05-30 08:25:42');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table empus.user_role: ~8 rows (approximately)
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`id`, `user_id`, `role_id`) VALUES
	(1, 1, 2),
	(2, 3, 2),
	(3, 5, 2),
	(4, 6, 2),
	(5, 7, 2),
	(6, 8, 2),
	(7, 9, 2),
	(8, 10, 2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
