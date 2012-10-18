# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.27)
# Database: hbbnext-idm2_development
# Generation Time: 2012-10-18 09:44:28 +0000
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
	(1,'family','family','2012-10-17 13:30:24','2012-10-17 13:30:24','A8BCEEDB-1D4E-485E-8E2F-C3786B678AB4'),
	(2,'friends','friends','2012-10-17 13:30:31','2012-10-17 13:30:31','6F01FFE3-EEA9-4266-B421-3893E7F3F49A');

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
	(11,'2012-10-18 09:42:32','2012-10-18 09:42:32',1,2,NULL,NULL,NULL),
	(12,'2012-10-18 09:42:32','2012-10-18 09:42:32',1,3,NULL,NULL,NULL),
	(13,'2012-10-18 09:42:32','2012-10-18 09:42:32',1,5,NULL,NULL,NULL),
	(14,'2012-10-18 09:42:32','2012-10-18 09:42:32',1,6,NULL,NULL,NULL),
	(15,'2012-10-18 09:42:32','2012-10-18 09:42:32',1,7,NULL,NULL,NULL),
	(16,'2012-10-18 09:42:32','2012-10-18 09:42:32',1,8,NULL,NULL,NULL),
	(17,'2012-10-18 09:42:53','2012-10-18 09:42:53',2,6,NULL,NULL,NULL),
	(18,'2012-10-18 09:42:53','2012-10-18 09:42:53',2,8,NULL,NULL,NULL),
	(19,'2012-10-18 09:42:53','2012-10-18 09:42:53',2,9,NULL,NULL,NULL),
	(20,'2012-10-18 09:42:53','2012-10-18 09:42:53',2,10,NULL,NULL,NULL),
	(21,'2012-10-18 09:42:53','2012-10-18 09:42:53',2,11,NULL,NULL,NULL),
	(22,'2012-10-18 09:42:53','2012-10-18 09:42:53',2,12,NULL,NULL,NULL);

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
	(2,'tv','tv','udp:10.0.0.1:815','2012-10-17 13:28:18','2012-10-18 09:30:14','118540FE-BB2C-4521-A95B-21DA0DB4FEA3'),
	(3,'mobileSon','mobileSon','udp:10.0.0.2:815','2012-10-17 13:28:23','2012-10-18 09:30:30','2A921330-131C-4915-90D7-9A079A2DCF89'),
	(4,'familyTablet','familyTablet','udp:10.0.0.3:815','2012-10-17 13:28:29','2012-10-18 09:30:42','8EC9082F-E850-4261-B2DF-692C1F533822'),
	(5,'mobileFriend1','mobileFriend1','udp:10.0.0.4:815','2012-10-17 21:20:53','2012-10-18 09:30:58','5ca7e837-154d-4e66-a504-22ce26a31340'),
	(6,'mobileFriend2','mobileFriend2','udp:10.0.0.5:815','2012-10-18 09:31:09','2012-10-18 09:31:09','674ccfb2-5765-49e3-98d6-4eab4e4a05fa');

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
	(2,'2012-10-17 13:29:04','2012-10-17 13:29:04',2,2,'fatherTV','admin','1DA23C3E-A469-4DBA-ABC3-5880DA884563'),
	(3,'2012-10-17 13:29:04','2012-10-17 13:29:04',3,2,'motherTv','user','27E583B5-931E-4C7D-AAFA-198A97489981'),
	(5,'2012-10-17 13:29:17','2012-10-17 13:29:17',3,4,'motherTablet','user','76A31089-0530-4610-A74F-DB79CD657665'),
	(6,'2012-10-18 09:30:04','2012-10-18 09:30:04',4,2,'sonTv','user','E9BEAD2C-C647-4854-B158-5E771F0781A9'),
	(7,'2012-10-18 09:30:04','2012-10-18 09:30:04',4,3,'sonTablet','admin','2CA95477-D921-4476-B71A-5C1E69AE25EC'),
	(8,'2012-10-18 09:30:04','2012-10-18 09:30:04',4,4,'sonMobile','admin','4CDE9322-4DE4-4C1B-9DDE-CC11BAF13033'),
	(9,'2012-10-18 09:31:26','2012-10-18 09:31:26',5,2,'friend1Tv','guest','E18657BF-5288-4417-B18E-6A09C32A828C'),
	(10,'2012-10-18 09:31:26','2012-10-18 09:31:26',5,5,'friend1Mobile1','admin','9E99353A-26DA-4F0C-8BAE-80C09EFE60D3'),
	(11,'2012-10-18 09:31:38','2012-10-18 09:31:38',6,2,'friend2Tv','guest','BD868B2F-D502-4340-9F29-BEA1046C0AE8'),
	(12,'2012-10-18 09:31:38','2012-10-18 09:31:38',6,6,'friend2Mobile2','admin','217B283E-2469-4ADF-AE18-BAD4D3916E14');

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
	(2,'father','father','secret','1234','2012-10-17 13:27:50','2012-10-18 09:29:35','5FC0DCF3-54D4-40BF-BC9B-12F53ECD5898'),
	(3,'mother','mother','secret','1234','2012-10-17 13:28:09','2012-10-18 09:29:50','76D63428-A396-4FAB-A631-4D275913D0F4'),
	(4,'son','son','secret','1234','2012-10-17 21:21:09','2012-10-18 09:30:04','c63fd962-21c5-44b7-8fdc-dd1c993da2fe'),
	(5,'friend1','friend1','secret','1234','2012-10-18 09:31:26','2012-10-18 09:31:26','ce18f5ba-ab5b-4843-9454-03c5f3b695cb'),
	(6,'friend2','friend2','secret','1234','2012-10-18 09:31:38','2012-10-18 09:31:38','2328331b-3d8c-444f-9d5f-dfd7a2a581d5');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
