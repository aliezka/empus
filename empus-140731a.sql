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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table empus.berita_desc
CREATE TABLE IF NOT EXISTS `berita_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `berita_id` int(11) NOT NULL,
  `desc` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `berita_id` (`berita_id`),
  CONSTRAINT `berita_desc_ibfk_1` FOREIGN KEY (`berita_id`) REFERENCES `berita` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table empus.berita_img
CREATE TABLE IF NOT EXISTS `berita_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `berita_id` int(11) NOT NULL,
  `img` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `berita_id` (`berita_id`),
  CONSTRAINT `berita_img_ibfk_1` FOREIGN KEY (`berita_id`) REFERENCES `berita` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


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
  `person_id` int(11) DEFAULT NULL,
  `ts_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`person_id`),
  KEY `FK_instansi_person` (`person_id`),
  CONSTRAINT `FK_instansi_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


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

-- Data exporting was unselected.


-- Dumping structure for table empus.instansi_desc
CREATE TABLE IF NOT EXISTS `instansi_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instansi_id` int(11) NOT NULL,
  `desc` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instansi_id` (`instansi_id`),
  CONSTRAINT `instansi_desc_ibfk_1` FOREIGN KEY (`instansi_id`) REFERENCES `instansi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table empus.instansi_img
CREATE TABLE IF NOT EXISTS `instansi_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instansi_id` int(11) NOT NULL,
  `img` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instansi_id` (`instansi_id`),
  CONSTRAINT `instansi_img_ibfk_1` FOREIGN KEY (`instansi_id`) REFERENCES `instansi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


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

-- Data exporting was unselected.


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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table empus.involved_as
CREATE TABLE IF NOT EXISTS `involved_as` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `involved_as` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `involved_as` (`involved_as`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table empus.komentar_desc
CREATE TABLE IF NOT EXISTS `komentar_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `komentar_id` int(11) NOT NULL,
  `desc` text NOT NULL,
  PRIMARY KEY (`komentar_id`),
  UNIQUE KEY `id` (`id`),
  CONSTRAINT `komentar_desc_ibfk_1` FOREIGN KEY (`komentar_id`) REFERENCES `komentar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table empus.notification
CREATE TABLE IF NOT EXISTS `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(350) NOT NULL,
  `opini_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`opini_id`,`id`),
  UNIQUE KEY `id` (`id`),
  CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`opini_id`) REFERENCES `opini` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table empus.notification_history
CREATE TABLE IF NOT EXISTS `notification_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `notified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`notification_id`,`person_id`),
  UNIQUE KEY `id` (`id`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `notification_history_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `notification` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notification_history_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table empus.notification_involved
CREATE TABLE IF NOT EXISTS `notification_involved` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `involved_as_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`notification_id`,`person_id`),
  UNIQUE KEY `id` (`id`),
  KEY `person_id` (`person_id`),
  KEY `FK_notification_involved_involved_as` (`involved_as_id`),
  CONSTRAINT `FK_notification_involved_involved_as` FOREIGN KEY (`involved_as_id`) REFERENCES `involved_as` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notification_involved_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `notification` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notification_involved_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table empus.notification_opini
IF NOT EXISTS ;

-- Data exporting was unselected.


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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table empus.opini_desc
CREATE TABLE IF NOT EXISTS `opini_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opini_id` int(11) NOT NULL,
  `desc` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `opini_id` (`opini_id`),
  CONSTRAINT `opini_desc_ibfk_1` FOREIGN KEY (`opini_id`) REFERENCES `opini` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table empus.opini_img
CREATE TABLE IF NOT EXISTS `opini_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opini_id` int(11) NOT NULL,
  `img` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `opini_id` (`opini_id`),
  CONSTRAINT `opini_img_ibfk_1` FOREIGN KEY (`opini_id`) REFERENCES `opini` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


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

-- Data exporting was unselected.


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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table empus.pelayanan_desc
CREATE TABLE IF NOT EXISTS `pelayanan_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pelayanan_id` int(11) NOT NULL,
  `desc` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pelayanan_id` (`pelayanan_id`),
  CONSTRAINT `pelayanan_desc_ibfk_1` FOREIGN KEY (`pelayanan_id`) REFERENCES `pelayanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table empus.person
CREATE TABLE IF NOT EXISTS `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table empus.person_img
CREATE TABLE IF NOT EXISTS `person_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `img` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `person_id` (`person_id`),
  CONSTRAINT `person_img_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table empus.persyaratan_desc
CREATE TABLE IF NOT EXISTS `persyaratan_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persyaratan_id` int(11) NOT NULL,
  `desc` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persyaratan_id` (`persyaratan_id`),
  CONSTRAINT `persyaratan_desc_ibfk_1` FOREIGN KEY (`persyaratan_id`) REFERENCES `persyaratan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table empus.persyaratan_img
CREATE TABLE IF NOT EXISTS `persyaratan_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persyaratan_id` int(11) NOT NULL,
  `img` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persyaratan_id` (`persyaratan_id`),
  CONSTRAINT `persyaratan_img_ibfk_1` FOREIGN KEY (`persyaratan_id`) REFERENCES `persyaratan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table empus.profile
CREATE TABLE IF NOT EXISTS `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile` (`profile`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table empus.prosedur_desc
CREATE TABLE IF NOT EXISTS `prosedur_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prosedur_id` int(11) NOT NULL,
  `desc` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prosedur_id` (`prosedur_id`),
  CONSTRAINT `prosedur_desc_ibfk_1` FOREIGN KEY (`prosedur_id`) REFERENCES `prosedur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table empus.prosedur_img
CREATE TABLE IF NOT EXISTS `prosedur_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prosedur_id` int(11) NOT NULL,
  `img` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prosedur_id` (`prosedur_id`),
  CONSTRAINT `prosedur_img_ibfk_1` FOREIGN KEY (`prosedur_id`) REFERENCES `prosedur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table empus.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


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
