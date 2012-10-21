# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.27)
# Database: hbbnext-idm2_development
# Generation Time: 2012-10-21 21:16:57 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table consumers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `consumers`;

CREATE TABLE `consumers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_digest` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `access_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `consumers` WRITE;
/*!40000 ALTER TABLE `consumers` DISABLE KEYS */;

INSERT INTO `consumers` (`id`, `email`, `password_digest`, `created_at`, `updated_at`, `access_token`)
VALUES
	(1,'seb.schumann@gmail.com','$2a$10$2y/o23lWtC2OnKdJkZQhuOTE2xwFNDjpjlrCrhIID4ksgX94Jkp1a','2012-10-20 16:20:42','2012-10-20 16:20:42','3aba961559f9000a097ff94e2433f23d');

/*!40000 ALTER TABLE `consumers` ENABLE KEYS */;
UNLOCK TABLES;


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
	(2,'friends','friends','2012-10-17 13:30:31','2012-10-17 13:30:31','6F01FFE3-EEA9-4266-B421-3893E7F3F49A'),
	(3,'moTa','moTa','2012-10-19 21:50:04','2012-10-19 21:50:04','ed48a493-48fe-44ff-afd9-4f96453070eb');

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
	(26,'2012-10-19 11:17:20','2012-10-19 20:51:58',1,2,'family:father:tv',0,'6eeaddba-4194-4c65-8dcf-45e483dfd68c'),
	(27,'2012-10-19 11:17:20','2012-10-19 20:51:58',1,3,'family:mother:tv',0,'6f9feb45-8712-4756-96dc-56e369788047'),
	(28,'2012-10-19 11:17:20','2012-10-19 20:51:58',1,5,'family:mother:familyTablet',0,'0fa5b588-73f7-402c-a2cc-332139666444'),
	(29,'2012-10-19 11:17:20','2012-10-19 20:51:58',1,6,'family:son:tv',0,'248d2687-fcd3-47b2-a611-a3ff05ceebc5'),
	(30,'2012-10-19 11:17:20','2012-10-19 20:51:58',1,7,'family:son:mobileSon',0,'9e88d1ac-7be0-4327-9da6-ff8093164d2e'),
	(31,'2012-10-19 11:17:20','2012-10-19 20:51:58',1,8,'family:son:familyTablet',0,'d9126a98-0860-446c-8441-a7fbfde155f5'),
	(33,'2012-10-19 11:17:48','2012-10-19 20:54:36',2,6,'friends:son:tv',0,'6ca4cfb2-e0b5-4d95-8950-efd564815f81'),
	(34,'2012-10-19 11:17:48','2012-10-19 20:54:36',2,7,'friends:son:mobileSon',0,'9215bc1c-8dfe-405e-a6d3-a32ccc43ee6a'),
	(35,'2012-10-19 11:17:48','2012-10-19 20:54:36',2,9,'friends:friend1:tv',0,'5cf875ea-2bf0-4a68-8b95-aeef00c643da'),
	(36,'2012-10-19 11:17:48','2012-10-19 20:54:36',2,10,'friends:friend1:mobileFriend1',0,'b3ab96b9-b37c-4253-a58d-8362aa43a598'),
	(37,'2012-10-19 11:17:48','2012-10-19 20:54:36',2,11,'friends:friend2:tv',0,'60f5c7e6-6a51-49e4-8ad4-fd05db6ddc09'),
	(38,'2012-10-19 11:17:48','2012-10-19 20:54:36',2,12,'friends:friend2:mobileFriend2',0,'f5ce9faa-e0c3-432b-bf82-640b500da8eb'),
	(39,'2012-10-19 21:50:04','2012-10-19 21:50:04',3,5,'moTa:mother:familyTablet',0,'f79e4279-ac8e-4d69-a930-fff959005705');

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


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `uuid`, `created_at`, `updated_at`, `name`)
VALUES
	(1,'C05E6C3B-274E-4B71-82C7-AD111E2D95EB','2012-10-19 16:40:10','2012-10-19 16:40:10','admin'),
	(2,'377A3D8D-5440-48D2-B7F3-D1682B04FBD2','2012-10-19 16:40:11','2012-10-19 16:40:11','user'),
	(3,'177748BC-3624-46FF-9D50-4A025103D15F','2012-10-19 16:40:12','2012-10-19 16:40:12','guest'),
	(4,'867596ED-8013-4D64-A6C5-8EB0A5B24FBB','2012-10-19 20:45:00','2012-10-19 20:45:00','n/a');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
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
	('20121017194647'),
	('20121019141627'),
	('20121019143429'),
	('20121019143903'),
	('20121020161051'),
	('20121021204634');

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
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `udrs` WRITE;
/*!40000 ALTER TABLE `udrs` DISABLE KEYS */;

INSERT INTO `udrs` (`id`, `created_at`, `updated_at`, `user_id`, `device_id`, `name`, `uuid`, `role_id`)
VALUES
	(2,'2012-10-17 13:29:04','2012-10-19 13:05:37',2,2,'father:tv','1DA23C3E-A469-4DBA-ABC3-5880DA884563',1),
	(3,'2012-10-17 13:29:04','2012-10-19 13:05:42',3,2,'mother:tv','27E583B5-931E-4C7D-AAFA-198A97489981',2),
	(5,'2012-10-17 13:29:17','2012-10-19 13:05:42',3,4,'mother:familyTablet','76A31089-0530-4610-A74F-DB79CD657665',2),
	(6,'2012-10-18 09:30:04','2012-10-19 13:05:46',4,2,'son:tv','E9BEAD2C-C647-4854-B158-5E771F0781A9',2),
	(7,'2012-10-18 09:30:04','2012-10-19 13:05:46',4,3,'son:mobileSon','2CA95477-D921-4476-B71A-5C1E69AE25EC',1),
	(8,'2012-10-18 09:30:04','2012-10-19 13:05:46',4,4,'son:familyTablet','4CDE9322-4DE4-4C1B-9DDE-CC11BAF13033',1),
	(9,'2012-10-18 09:31:26','2012-10-19 13:05:50',5,2,'friend1:tv','E18657BF-5288-4417-B18E-6A09C32A828C',3),
	(10,'2012-10-18 09:31:26','2012-10-19 13:05:50',5,5,'friend1:mobileFriend1','9E99353A-26DA-4F0C-8BAE-80C09EFE60D3',1),
	(11,'2012-10-18 09:31:38','2012-10-19 13:05:54',6,2,'friend2:tv','BD868B2F-D502-4340-9F29-BEA1046C0AE8',3),
	(12,'2012-10-18 09:31:38','2012-10-19 13:05:54',6,6,'friend2:mobileFriend2','217B283E-2469-4ADF-AE18-BAD4D3916E14',1);

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
	(2,'father','father','','1234','2012-10-17 13:27:50','2012-10-19 13:05:37','5FC0DCF3-54D4-40BF-BC9B-12F53ECD5898'),
	(3,'mother','mother','','1234','2012-10-17 13:28:09','2012-10-19 13:05:42','76D63428-A396-4FAB-A631-4D275913D0F4'),
	(4,'son','son','','1234','2012-10-17 21:21:09','2012-10-19 13:05:46','c63fd962-21c5-44b7-8fdc-dd1c993da2fe'),
	(5,'friend1','friend1','','1234','2012-10-18 09:31:26','2012-10-19 13:05:50','ce18f5ba-ab5b-4843-9454-03c5f3b695cb'),
	(6,'friend2','friend2','','1234','2012-10-18 09:31:38','2012-10-19 13:05:54','2328331b-3d8c-444f-9d5f-dfd7a2a581d5');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
