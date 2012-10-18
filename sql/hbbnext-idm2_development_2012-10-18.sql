# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.27)
# Database: hbbnext-idm2_development
# Generation Time: 2012-10-18 09:18:46 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table contexts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contexts`;

CREATE TABLE `contexts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `contexts` WRITE;
/*!40000 ALTER TABLE `contexts` DISABLE KEYS */;

INSERT INTO `contexts` (`id`, `alias`, `display_name`, `created_at`, `updated_at`, `uuid`)
VALUES
	(1,'c1','c1','2012-10-17 13:30:24','2012-10-17 13:30:24','A8BCEEDB-1D4E-485E-8E2F-C3786B678AB4'),
	(2,'c2','c2','2012-10-17 13:30:31','2012-10-17 13:30:31','6F01FFE3-EEA9-4266-B421-3893E7F3F49A'),
	(3,'all_active','all_active','2012-10-17 14:05:06','2012-10-17 14:05:06','9B26368B-C067-40A1-9D22-D3D320FB8E62'),
	(6,'uuid','uuid','2012-10-17 21:18:05','2012-10-17 21:18:05','08400c0c-8f2b-40a2-9366-20d6207ce204');

/*!40000 ALTER TABLE `contexts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table crs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `crs`;

CREATE TABLE `crs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `context_id` int(11) DEFAULT NULL,
  `udr_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `crs` WRITE;
/*!40000 ALTER TABLE `crs` DISABLE KEYS */;

INSERT INTO `crs` (`id`, `created_at`, `updated_at`, `context_id`, `udr_id`, `name`, `active`, `uuid`)
VALUES
	(1,'2012-10-17 14:05:06','2012-10-17 14:05:06',3,1,'c3u1',0,'2C9E6F2F-AE37-44AC-B0AA-638D0E08E87A'),
	(2,'2012-10-17 14:05:06','2012-10-17 14:05:06',3,2,'c3u2',0,'43440C1D-AAC5-4707-BEC0-1BBCDCDBCE2B'),
	(3,'2012-10-17 14:05:06','2012-10-17 14:05:06',3,3,'c3u3',0,'B1B1DB3C-3471-4EB7-A314-65EAF9CB10A1'),
	(4,'2012-10-17 14:05:06','2012-10-17 14:05:06',3,4,'c3u4',0,'CA205F3E-6C63-4A40-ABD7-013F4D650165'),
	(5,'2012-10-17 14:05:06','2012-10-17 14:05:06',3,5,'c3u5',0,'E93F6C34-E80F-4A1D-AFFE-A018DC498F59'),
	(10,'2012-10-17 14:06:42','2012-10-17 14:06:42',2,1,'c2u1',0,'F749A773-41E7-470B-8E45-734189B3CCAB');

/*!40000 ALTER TABLE `crs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table devices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `devices`;

CREATE TABLE `devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;

INSERT INTO `devices` (`id`, `alias`, `display_name`, `address`, `created_at`, `updated_at`, `uuid`)
VALUES
	(2,'dev1','dev1','','2012-10-17 13:28:18','2012-10-17 13:29:04','118540FE-BB2C-4521-A95B-21DA0DB4FEA3'),
	(3,'dev2','dev2','','2012-10-17 13:28:23','2012-10-17 13:29:11','2A921330-131C-4915-90D7-9A079A2DCF89'),
	(4,'dev3','dev3','','2012-10-17 13:28:29','2012-10-17 13:29:17','8EC9082F-E850-4261-B2DF-692C1F533822'),
	(5,'uuid','uuid','','2012-10-17 21:20:53','2012-10-17 21:20:53','5ca7e837-154d-4e66-a504-22ce26a31340');

/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table schema_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schema_migrations`;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;

INSERT INTO `schema_migrations` (`version`)
VALUES
	('20121017120458'),
	('20121017120532'),
	('20121017120606'),
	('20121017120807'),
	('20121017120832'),
	('20121017121241'),
	('20121017122523'),
	('20121017142137'),
	('20121017142441'),
	('20121017194647');

/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table udrs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `udrs`;

CREATE TABLE `udrs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `udrs` WRITE;
/*!40000 ALTER TABLE `udrs` DISABLE KEYS */;

INSERT INTO `udrs` (`id`, `created_at`, `updated_at`, `user_id`, `device_id`, `name`, `role`, `uuid`)
VALUES
	(1,'2012-10-17 12:43:15','2012-10-17 12:43:15',1,1,'u1d1','admin','9CF14BF7-59F5-45D0-8BB0-1428E53CE4F7'),
	(2,'2012-10-17 13:29:04','2012-10-17 13:29:04',2,2,'u2d2','admin','1DA23C3E-A469-4DBA-ABC3-5880DA884563'),
	(3,'2012-10-17 13:29:04','2012-10-17 13:29:04',3,2,'u3d2','user','27E583B5-931E-4C7D-AAFA-198A97489981'),
	(4,'2012-10-17 13:29:11','2012-10-17 13:29:11',2,3,'u2d3','admin','668E701A-ED82-4CDB-BD9C-223B9DA324BC'),
	(5,'2012-10-17 13:29:17','2012-10-17 13:29:17',3,4,'u3d4','admin','76A31089-0530-4610-A74F-DB79CD657665');

/*!40000 ALTER TABLE `udrs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `alias`, `username`, `password`, `pin`, `created_at`, `updated_at`, `uuid`)
VALUES
	(2,'test1','test1','','','2012-10-17 13:27:50','2012-10-17 13:28:50','5FC0DCF3-54D4-40BF-BC9B-12F53ECD5898'),
	(3,'test2','test2','','','2012-10-17 13:28:09','2012-10-17 13:28:56','76D63428-A396-4FAB-A631-4D275913D0F4'),
	(4,'uuid','uuid','','','2012-10-17 21:21:09','2012-10-17 21:21:09','c63fd962-21c5-44b7-8fdc-dd1c993da2fe');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
