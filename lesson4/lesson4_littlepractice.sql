-- MySQL dump 10.13  Distrib 5.7.32, for Linux (x86_64)
--
-- Host: localhost    Database: my_vk_schema
-- ------------------------------------------------------
-- Server version	5.7.32-0ubuntu0.16.04.1

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
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(145) COLLATE utf8_unicode_ci NOT NULL,
  `desc` varchar(245) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_communities_users1_idx` (`admin_id`),
  CONSTRAINT `fk_communities_users1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (11,'voluptas','Neque aut.',120),(12,'voluptatem','Ea nulla.',186),(13,'et','',189),(14,'incidunt','Ea est.',150),(15,'dolores','Tempora.',169),(16,'maxime','',192),(17,'iusto','Corrupti.',136),(18,'fugit','Error non.',157),(19,'adipisci','',169),(20,'omnis','',108);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_requests` (
  `from_users_id` int(10) unsigned NOT NULL,
  `to_users_id` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1 - отклонен, 0 - запрос, 1 - принят',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`from_users_id`,`to_users_id`),
  KEY `fk_friend_requests_users1_idx` (`from_users_id`),
  KEY `fk_friend_requests_users2_idx` (`to_users_id`),
  CONSTRAINT `fk_friend_requests_users1` FOREIGN KEY (`from_users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_friend_requests_users2` FOREIGN KEY (`to_users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (102,104,1,'2013-02-28 15:52:44','2012-02-11 21:20:59'),(104,166,1,'2006-10-10 06:10:10','2006-10-10 16:12:30'),(105,148,1,'2006-10-10 06:10:10','2006-10-10 16:12:30'),(106,147,0,'2006-10-10 06:10:10','2010-02-06 11:44:33'),(108,110,-1,'2006-10-10 06:10:10',NULL),(108,169,1,'2006-10-10 06:10:10','2006-10-10 16:12:30'),(109,154,0,'2012-05-23 11:28:00',NULL),(110,140,1,'2006-10-10 06:10:10','2012-09-20 20:46:31'),(114,111,1,'2006-10-10 06:10:10','2006-10-10 16:12:30'),(117,145,1,'2006-10-10 06:10:10',NULL),(120,169,-1,'2009-01-20 12:02:31','2006-10-10 16:12:30'),(121,140,-1,'2006-10-10 06:10:10','2006-10-10 16:12:30'),(121,165,-1,'2006-10-10 06:10:10','2006-10-10 16:12:30'),(122,155,1,'2008-05-16 18:45:00','2006-10-10 16:12:30'),(123,125,1,'2006-10-10 06:10:10','2006-10-10 16:12:30'),(124,199,-1,'2006-10-10 06:10:10',NULL),(126,120,1,'2019-04-04 11:48:51',NULL),(126,155,0,'2006-10-10 06:10:10','2006-10-10 16:12:30'),(128,145,0,'2006-10-10 06:10:10',NULL),(128,153,1,'2006-10-10 06:10:10','2006-10-10 16:12:30'),(130,118,-1,'2006-10-10 06:10:10',NULL),(131,123,-1,'2006-10-10 06:10:10','2010-10-24 13:28:03'),(132,173,-1,'2008-03-01 03:01:27',NULL),(134,101,1,'2006-10-10 06:10:10',NULL),(134,114,1,'2006-10-10 06:10:10',NULL),(134,160,0,'2006-10-10 06:10:10','2006-10-10 16:12:30'),(134,191,0,'2006-10-10 06:10:10','2006-10-10 16:12:30'),(136,131,0,'2020-09-05 23:49:01','2006-10-10 16:12:30'),(136,143,-1,'2016-01-28 05:24:47',NULL),(137,179,-1,'2013-08-21 03:48:18','2006-10-10 16:12:30'),(137,196,0,'2006-10-10 06:10:10',NULL),(140,188,1,'2006-10-10 06:10:10','2006-10-10 16:12:30'),(141,168,-1,'2006-10-10 06:10:10','2019-03-29 05:00:19'),(143,163,1,'2006-10-10 06:10:10',NULL),(145,131,-1,'2006-10-10 06:10:10','2006-10-10 16:12:30'),(145,193,0,'2006-10-10 06:10:10',NULL),(146,132,-1,'2006-10-10 06:10:10','2006-10-10 16:12:30'),(147,156,0,'2006-10-10 06:10:10',NULL),(148,101,0,'2011-01-12 15:38:18','2017-10-10 19:08:15'),(149,112,-1,'2006-10-10 06:10:10','2006-10-10 16:12:30'),(151,116,-1,'2017-08-08 02:55:56','2009-09-04 10:34:18'),(151,148,-1,'2013-07-18 14:38:44',NULL),(152,195,0,'2009-04-07 00:57:47',NULL),(153,159,-1,'2006-10-10 06:10:10','2006-10-10 16:12:30'),(154,119,0,'2006-10-10 06:10:10',NULL),(154,147,1,'2006-10-10 06:10:10',NULL),(155,168,-1,'2006-10-10 06:10:10','2006-10-10 16:12:30'),(156,184,0,'2006-10-10 06:10:10',NULL),(159,200,0,'2017-11-23 19:44:37','2009-01-14 03:33:42'),(162,162,0,'2006-10-10 06:10:10',NULL),(163,150,0,'2006-10-10 06:10:10','2006-10-10 16:12:30'),(164,107,0,'2006-10-10 06:10:10',NULL),(164,187,1,'2006-10-10 06:10:10','2018-08-22 09:29:27'),(165,178,-1,'2006-10-10 06:10:10',NULL),(166,192,1,'2009-05-06 00:58:22',NULL),(167,143,1,'2006-10-10 06:10:10','2012-09-03 02:33:34'),(167,146,1,'2010-10-29 12:41:30','2006-10-10 16:12:30'),(168,167,0,'2006-10-10 06:10:10',NULL),(169,150,1,'2006-10-10 06:10:10',NULL),(170,153,0,'2006-10-10 06:10:10','2006-10-10 16:12:30'),(172,117,-1,'1970-07-23 21:50:19','2006-10-10 16:12:30'),(172,128,0,'2006-10-10 06:10:10',NULL),(172,159,-1,'2006-10-10 06:10:10','2006-10-10 16:12:30'),(173,122,-1,'2006-10-10 06:10:10','2010-09-27 00:06:26'),(173,151,1,'2006-10-10 06:10:10','2011-03-13 22:46:32'),(173,197,-1,'2016-07-13 01:56:09','2006-10-10 16:12:30'),(174,110,0,'2006-10-10 06:10:10',NULL),(174,155,1,'2006-10-10 06:10:10','2013-09-05 14:07:52'),(175,178,-1,'2008-05-03 02:05:04',NULL),(175,183,0,'2006-10-10 06:10:10',NULL),(175,185,1,'2007-07-18 11:25:49',NULL),(176,125,-1,'2013-09-04 04:28:52','2006-10-10 16:12:30'),(176,162,0,'2009-05-20 23:50:21',NULL),(177,110,-1,'2006-10-10 06:10:10','2006-10-10 16:12:30'),(179,104,0,'2006-10-10 06:10:10',NULL),(180,142,0,'2014-11-15 19:16:45',NULL),(180,168,-1,'2019-01-28 20:26:05',NULL),(181,173,0,'2006-10-10 06:10:10',NULL),(181,180,-1,'2006-10-10 06:10:10','2016-06-15 23:43:59'),(182,118,1,'2008-05-12 07:55:20',NULL),(182,123,0,'2006-10-10 06:10:10',NULL),(182,154,0,'2006-10-10 06:10:10','2010-09-26 18:25:53'),(185,129,0,'2006-10-10 06:10:10',NULL),(185,151,-1,'2006-10-10 06:10:10',NULL),(187,101,1,'2006-10-10 06:10:10',NULL),(187,111,0,'2018-10-29 03:11:49','2006-10-10 16:12:30'),(188,136,1,'2006-10-10 06:10:10',NULL),(188,173,1,'2006-10-10 06:10:10',NULL),(190,135,-1,'2008-02-03 18:37:28',NULL),(190,160,0,'2006-10-10 06:10:10','2006-10-10 16:12:30'),(193,116,0,'2006-10-10 06:10:10','2006-10-10 16:12:30'),(193,188,-1,'2006-10-10 06:10:10',NULL),(194,161,0,'2006-10-10 06:10:10',NULL),(194,191,-1,'2014-05-23 15:24:44','2020-03-31 23:45:58'),(195,116,-1,'2015-02-03 19:22:17','2006-10-10 16:12:30'),(195,179,0,'2006-10-10 06:10:10','2017-11-29 12:19:36'),(197,108,1,'2006-10-10 06:10:10',NULL),(198,104,1,'2015-08-05 11:05:51','2006-10-10 16:12:30'),(198,127,1,'2006-10-10 06:10:10','2006-10-10 16:12:30'),(198,156,0,'2006-10-10 06:10:10',NULL);
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `users_id` int(10) unsigned NOT NULL,
  `media_id` int(10) unsigned DEFAULT NULL,
  `posts_id` int(10) unsigned DEFAULT NULL,
  `messages_id` int(10) unsigned DEFAULT NULL,
  UNIQUE KEY `index` (`users_id`,`media_id`),
  UNIQUE KEY `index2` (`users_id`,`posts_id`),
  UNIQUE KEY `index3` (`users_id`,`messages_id`),
  KEY `fk_likes_users1_idx` (`users_id`),
  KEY `fk_likes_media1_idx` (`media_id`),
  KEY `fk_likes_posts1_idx` (`posts_id`),
  KEY `fk_likes_messages1_idx` (`messages_id`),
  CONSTRAINT `fk_likes_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_likes_messages1` FOREIGN KEY (`messages_id`) REFERENCES `messages` (`id`),
  CONSTRAINT `fk_likes_posts1` FOREIGN KEY (`posts_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `fk_likes_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (113,176,117,118),(108,187,179,187),(146,199,116,164),(116,151,183,110),(172,130,160,188),(191,161,188,189),(107,146,150,129),(174,127,160,187),(102,176,104,110),(163,182,197,109),(181,113,172,197),(163,155,107,135),(184,166,122,175),(126,110,163,133),(155,113,161,129),(139,120,115,141),(196,119,151,158),(101,147,166,181),(159,138,177,122),(193,183,156,177),(149,177,151,175),(186,114,107,141),(126,167,169,164),(187,184,105,182),(102,155,140,103),(101,106,184,160),(144,160,181,136),(143,137,112,192),(113,163,166,199),(176,172,139,102),(139,108,165,125),(191,170,107,193),(124,147,196,125),(152,179,184,196),(138,165,131,181),(101,142,172,113),(104,138,112,180),(109,150,181,148),(158,146,173,149),(115,179,141,138),(125,136,162,177),(114,146,172,152),(110,103,133,110),(145,105,123,149),(142,134,128,150),(184,109,198,141),(154,170,189,169),(148,130,107,173),(166,169,150,180),(114,121,132,124),(124,164,134,168),(169,156,116,110),(190,143,160,173),(151,157,114,105),(126,103,173,174),(132,180,146,198),(148,196,177,162),(117,108,185,140),(172,118,107,140),(174,122,150,163),(165,109,136,116),(165,150,121,191),(152,194,164,184),(173,109,181,120),(104,158,182,120),(166,166,160,138),(188,127,120,152),(135,155,168,200),(105,188,190,156),(181,153,140,153),(162,121,173,166),(179,154,186,144),(120,145,182,103),(111,159,160,198),(185,179,150,120),(134,117,119,138),(104,109,194,184),(162,133,137,124),(163,175,176,183),(120,157,185,130),(116,144,128,200),(122,177,120,155),(194,139,193,198),(147,186,182,108),(119,118,131,173),(127,120,104,190),(195,180,172,114),(137,157,144,152),(200,171,152,122),(109,169,139,155),(155,120,163,173),(138,194,145,165),(113,149,155,108),(128,126,121,165),(182,164,116,182),(135,168,104,183),(138,180,125,147);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int(10) unsigned NOT NULL,
  `media_types_id` int(10) unsigned NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '/files/file.jpg',
  `blob` blob,
  `size` bigint(20) NOT NULL DEFAULT '0',
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  KEY `fk_media_users1_idx` (`users_id`),
  KEY `fk_media_media_types1_idx` (`media_types_id`),
  CONSTRAINT `fk_media_media_types1` FOREIGN KEY (`media_types_id`) REFERENCES `media_types` (`id`),
  CONSTRAINT `fk_media_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (101,115,5,'xspf',NULL,NULL,300184,NULL),(102,112,4,'yin',NULL,NULL,91,NULL),(103,187,5,'yang',NULL,NULL,37216261,NULL),(104,170,6,'xps',NULL,NULL,8226291,NULL),(105,192,6,'mxu',NULL,NULL,42666139,NULL),(106,135,6,'docm',NULL,NULL,7997,NULL),(107,189,4,'pre',NULL,NULL,5,NULL),(108,138,4,'spx',NULL,NULL,15902548,NULL),(109,194,4,'cap',NULL,NULL,712869946,NULL),(110,149,5,'geo',NULL,NULL,1570,NULL),(111,124,5,'umj',NULL,NULL,7971,NULL),(112,152,5,'xvm',NULL,NULL,601662072,NULL),(113,198,6,'jpeg',NULL,NULL,4796,NULL),(114,161,6,'djv',NULL,NULL,1,NULL),(115,184,6,'mdb',NULL,NULL,52538999,NULL),(116,171,6,'fvt',NULL,NULL,161,NULL),(117,138,6,'blb',NULL,NULL,56701,NULL),(118,123,4,'xenc',NULL,NULL,625480,NULL),(119,131,6,'dwg',NULL,NULL,5794,NULL),(120,102,4,'dart',NULL,NULL,8760,NULL),(121,161,5,'ims',NULL,NULL,801674,NULL),(122,106,5,'oti',NULL,NULL,91,NULL),(123,143,5,'vxml',NULL,NULL,1112,NULL),(124,150,5,'wspolicy',NULL,NULL,524694123,NULL),(125,164,6,'odf',NULL,NULL,8,NULL),(126,199,6,'ait',NULL,NULL,4367533,NULL),(127,146,5,'flx',NULL,NULL,4661805,NULL),(128,143,5,'ecma',NULL,NULL,0,NULL),(129,135,4,'xm',NULL,NULL,2739,NULL),(130,115,4,'sxd',NULL,NULL,66239401,NULL),(131,175,6,'chrt',NULL,NULL,9955745,NULL),(132,116,4,'sldm',NULL,NULL,3,NULL),(133,167,5,'cfs',NULL,NULL,56741713,NULL),(134,137,6,'wcm',NULL,NULL,96092699,NULL),(135,131,5,'xif',NULL,NULL,369,NULL),(136,119,6,'qxd',NULL,NULL,9376642,NULL),(137,175,4,'hdf',NULL,NULL,1190193,NULL),(138,140,4,'tpt',NULL,NULL,31107,NULL),(139,167,6,'udeb',NULL,NULL,516,NULL),(140,154,4,'nml',NULL,NULL,62174214,NULL),(141,188,5,'wmlsc',NULL,NULL,0,NULL),(142,118,4,'application',NULL,NULL,84,NULL),(143,103,5,'otp',NULL,NULL,22,NULL),(144,177,5,'woff',NULL,NULL,7276307,NULL),(145,163,6,'qwt',NULL,NULL,9582261,NULL),(146,154,5,'rdz',NULL,NULL,4243,NULL),(147,177,6,'msf',NULL,NULL,3602,NULL),(148,151,5,'xar',NULL,NULL,0,NULL),(149,107,6,'lostxml',NULL,NULL,72532858,NULL),(150,139,5,'lbe',NULL,NULL,1,NULL),(151,125,5,'kpr',NULL,NULL,582,NULL),(152,128,6,'pbm',NULL,NULL,50251159,NULL),(153,181,6,'sit',NULL,NULL,929824,NULL),(154,116,5,'dae',NULL,NULL,257987,NULL),(155,156,6,'ris',NULL,NULL,552307568,NULL),(156,177,5,'weba',NULL,NULL,14829837,NULL),(157,121,6,'gif',NULL,NULL,76954287,NULL),(158,177,4,'spot',NULL,NULL,0,NULL),(159,155,5,'pskcxml',NULL,NULL,94154620,NULL),(160,159,4,'sv4crc',NULL,NULL,788018657,NULL),(161,144,4,'odft',NULL,NULL,29828547,NULL),(162,156,4,'fli',NULL,NULL,585,NULL),(163,181,4,'ris',NULL,NULL,744131383,NULL),(164,163,6,'ivp',NULL,NULL,44,NULL),(165,192,4,'wtb',NULL,NULL,4,NULL),(166,124,4,'f4v',NULL,NULL,8,NULL),(167,159,5,'fvt',NULL,NULL,17,NULL),(168,115,5,'m13',NULL,NULL,45690477,NULL),(169,118,4,'pskcxml',NULL,NULL,3186,NULL),(170,186,6,'xdp',NULL,NULL,45,NULL),(171,199,5,'dd2',NULL,NULL,29560,NULL),(172,117,4,'xdp',NULL,NULL,0,NULL),(173,157,6,'lnk',NULL,NULL,811913,NULL),(174,142,4,'xpm',NULL,NULL,5655,NULL),(175,146,6,'dwg',NULL,NULL,582172,NULL),(176,129,6,'urls',NULL,NULL,13,NULL),(177,113,6,'tsv',NULL,NULL,5901,NULL),(178,110,6,'ppm',NULL,NULL,96263819,NULL),(179,189,6,'xlsm',NULL,NULL,71429988,NULL),(180,181,6,'xlsb',NULL,NULL,0,NULL),(181,173,4,'sid',NULL,NULL,8,NULL),(182,197,4,'uvh',NULL,NULL,41,NULL),(183,155,4,'dpg',NULL,NULL,53371,NULL),(184,170,6,'mks',NULL,NULL,4,NULL),(185,141,5,'eot',NULL,NULL,794788673,NULL),(186,147,5,'dotm',NULL,NULL,140,NULL),(187,117,5,'mka',NULL,NULL,36154201,NULL),(188,158,6,'mxl',NULL,NULL,3119,NULL),(189,157,6,'sfv',NULL,NULL,3575804,NULL),(190,184,4,'uvvv',NULL,NULL,72667,NULL),(191,199,4,'uoml',NULL,NULL,98,NULL),(192,191,4,'xdp',NULL,NULL,7,NULL),(193,196,6,'fpx',NULL,NULL,186885561,NULL),(194,105,6,'vtu',NULL,NULL,5,NULL),(195,172,6,'kia',NULL,NULL,927839654,NULL),(196,165,5,'nbp',NULL,NULL,1169155,NULL),(197,189,5,'opml',NULL,NULL,825868,NULL),(198,175,5,'tpt',NULL,NULL,0,NULL),(199,173,5,'uvp',NULL,NULL,844002228,NULL),(200,117,4,'fpx',NULL,NULL,2060,NULL);
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (4,' audio'),(5,' video'),(6,'image');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_users_id` int(10) unsigned NOT NULL,
  `to_users_id` int(10) unsigned NOT NULL,
  `text` varchar(245) COLLATE utf8_unicode_ci DEFAULT NULL,
  `media_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `from_users_idx` (`from_users_id`),
  KEY `fk_messages_users1_idx` (`to_users_id`),
  KEY `fk_messages_media1_idx` (`media_id`),
  CONSTRAINT `fk_messages_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_messages_users_from` FOREIGN KEY (`from_users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_messages_users_to` FOREIGN KEY (`to_users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (101,115,139,'I don\'t like it,.',184,'2006-10-10 06:10:10',NULL,NULL),(102,171,144,'They all returned.',173,'2006-10-10 06:10:10',NULL,'2007-12-13 22:49:00'),(103,145,101,'The only things in.',116,'2006-10-10 06:10:10',NULL,'2009-02-23 23:16:20'),(104,149,139,'ALICE\'S RIGHT.',115,'2006-10-10 06:10:10',NULL,NULL),(105,148,162,'Dodo solemnly.',196,'2006-10-10 06:10:10',NULL,NULL),(106,133,159,'Gryphon, \'you.',197,'2018-09-23 20:57:44',NULL,NULL),(107,171,134,'Pray how did you.',161,'2012-11-02 01:18:20',NULL,NULL),(108,164,193,'And she\'s such a.',126,'2017-09-26 07:53:14',NULL,NULL),(109,136,165,'Footman. \'That\'s.',178,'2006-10-10 06:10:10',NULL,NULL),(110,179,137,'I should like to.',196,'2010-11-06 22:50:49',NULL,NULL),(111,169,152,'Duck: \'it\'s.',135,'2006-10-10 06:10:10',NULL,'2008-12-27 23:28:59'),(112,153,123,'Alice quite hungry.',178,'2006-10-10 06:10:10',NULL,NULL),(113,125,167,'Rabbit\'s--\'Pat!.',178,'2006-10-10 06:10:10',NULL,NULL),(114,140,115,'Gryphon remarked:.',117,'2006-10-10 06:10:10',NULL,NULL),(115,155,163,'THAT. Then.',178,'2006-10-10 06:10:10',NULL,NULL),(116,151,196,'Mouse did not like.',137,'2006-10-10 06:10:10',NULL,NULL),(117,147,166,'Mouse, who was.',170,'2006-10-10 06:10:10',NULL,'2009-02-10 11:02:53'),(118,107,130,'Alice thought she.',162,'2006-10-10 06:10:10',NULL,NULL),(119,132,165,'CHAPTER II. The.',126,'2006-10-10 06:10:10',NULL,NULL),(120,110,143,'Duchess was VERY.',163,'2006-10-10 06:10:10',NULL,'2008-05-28 01:07:06'),(121,105,112,'I should think it.',115,'2006-10-10 06:10:10',NULL,NULL),(122,139,165,'Alice, \'we learned.',137,'2006-10-10 06:10:10','2012-12-03 21:48:03',NULL),(123,116,189,'Mouse\'s tail; \'but.',104,'2006-10-10 06:10:10',NULL,NULL),(124,194,129,'Dormouse say?\' one.',118,'2006-10-10 06:10:10',NULL,NULL),(125,110,184,'When the sands are.',181,'2006-10-10 06:10:10',NULL,NULL),(126,188,134,'I look like one,.',177,'2006-10-10 06:10:10',NULL,NULL),(127,124,181,'Gryphon, and the.',143,'2006-10-10 06:10:10',NULL,NULL),(128,193,188,'Alice. \'Well,.',172,'2006-10-10 06:10:10',NULL,'2019-09-29 05:18:51'),(129,155,119,'WOULD not remember.',136,'2006-10-10 06:10:10','2019-04-12 14:56:29',NULL),(130,181,129,'But do cats eat.',179,'2006-10-10 06:10:10',NULL,NULL),(131,144,133,'This was not here.',191,'2019-01-30 19:33:52','2020-01-14 15:51:50',NULL),(132,159,172,'Pennyworth only of.',155,'2008-03-08 07:37:48',NULL,'2017-03-31 21:09:24'),(133,195,188,'Caterpillar..',144,'2006-10-10 06:10:10',NULL,NULL),(134,199,181,'Who ever saw in my.',173,'2006-10-10 06:10:10',NULL,NULL),(135,117,191,'CHAPTER IV. The.',156,'2006-10-10 06:10:10',NULL,NULL),(136,197,178,'Dodo, pointing to.',190,'2006-10-10 06:10:10',NULL,NULL),(137,173,101,'She had not gone.',170,'2017-07-27 00:38:47',NULL,NULL),(138,115,194,'What would become.',157,'2006-10-10 06:10:10',NULL,NULL),(139,187,149,'However, I\'ve got.',176,'2018-07-25 08:49:55',NULL,NULL),(140,122,129,'Dormouse: \'not in.',104,'2006-10-10 06:10:10',NULL,NULL),(141,200,173,'England the nearer.',137,'2015-05-13 15:49:21',NULL,NULL),(142,191,131,'I must have been.',109,'2006-10-10 06:10:10',NULL,NULL),(143,145,126,'I\'ve got back to.',196,'2006-10-10 06:10:10',NULL,NULL),(144,188,124,'Queen say only.',177,'2006-10-10 06:10:10',NULL,NULL),(145,160,140,'Off--\' \'Nonsense!\'.',167,'2015-01-10 21:11:07',NULL,NULL),(146,115,137,'WOULD twist itself.',145,'2006-10-10 06:10:10',NULL,NULL),(147,105,110,'The Cat\'s head.',145,'2015-12-09 12:43:54',NULL,NULL),(148,174,125,'May it won\'t be.',139,'2006-10-10 06:10:10',NULL,NULL),(149,131,111,'Alice,) and round.',187,'2006-10-10 06:10:10',NULL,NULL),(150,107,132,'Gryphon.',116,'2019-04-25 13:51:31',NULL,'1970-03-02 11:42:55'),(151,111,132,'And how odd the.',189,'2014-07-13 22:40:23',NULL,'2019-02-07 23:52:03'),(152,147,122,'Alice thought she.',119,'2006-10-10 06:10:10',NULL,'2016-08-16 00:24:55'),(153,156,166,'Time, and round.',145,'2008-11-05 04:44:22',NULL,NULL),(154,151,154,'They had not.',168,'2016-07-24 19:07:34',NULL,NULL),(155,127,113,'Off with his.',108,'2019-02-11 07:38:14','2014-10-24 15:55:22','2007-03-13 19:32:39'),(156,194,128,'The jury all.',144,'2014-08-04 10:08:31',NULL,NULL),(157,138,133,'Yet you balanced.',153,'2006-10-10 06:10:10',NULL,NULL),(158,183,106,'Who for such.',177,'2006-10-10 06:10:10',NULL,NULL),(159,122,137,'Mercia and.',187,'2006-10-10 06:10:10',NULL,NULL),(160,108,143,'Alice\'s side as.',119,'2007-05-15 05:11:52',NULL,NULL),(161,124,154,'Hatter, \'or you\'ll.',150,'2016-04-05 19:14:56',NULL,NULL),(162,113,101,'I have to turn.',172,'2016-03-10 19:47:51',NULL,NULL),(163,131,156,'Alice like the.',137,'2015-11-26 10:51:09','2013-01-13 02:05:40',NULL),(164,175,106,'ME\' beautifully.',191,'2006-10-10 06:10:10',NULL,'2020-02-02 07:28:49'),(165,143,133,'Alice, feeling.',104,'2010-08-09 06:03:16',NULL,NULL),(166,150,126,'WAS a narrow.',131,'2006-10-10 06:10:10',NULL,NULL),(167,194,164,'Eaglet. \'I don\'t.',163,'2006-10-10 06:10:10',NULL,NULL),(168,146,146,'Alice ventured to.',169,'2006-10-10 06:10:10',NULL,NULL),(169,123,167,'The Queen had only.',106,'2006-10-10 06:10:10',NULL,NULL),(170,110,175,'King said to.',149,'2006-10-10 06:10:10',NULL,NULL),(171,128,199,'Mock Turtle.',102,'2006-10-10 06:10:10',NULL,NULL),(172,178,111,'I\'ve often seen.',102,'2016-07-09 07:40:58',NULL,NULL),(173,149,142,'Alice again, in a.',157,'2009-09-05 06:09:11',NULL,'2007-12-12 22:54:54'),(174,186,117,'I\'ll be jury,\".',163,'2006-10-10 06:10:10','2010-03-28 02:23:26',NULL),(175,176,160,'Mouse in the.',196,'2006-10-10 06:10:10','2008-02-09 13:15:47','2008-01-20 14:13:34'),(176,179,110,'On various.',122,'2018-10-26 14:35:57',NULL,NULL),(177,110,103,'Alice said very.',185,'2008-01-06 22:20:02',NULL,NULL),(178,173,148,'Queen, \'and take.',131,'2006-10-10 06:10:10','2019-05-30 01:50:21',NULL),(179,142,171,'Mock Turtle.',198,'2006-10-10 06:10:10',NULL,NULL),(180,147,180,'White Rabbit.',173,'2017-07-29 13:02:59','2007-01-03 15:23:44',NULL),(181,195,107,'Crab, a little.',171,'2006-10-10 06:10:10',NULL,NULL),(182,197,184,'You see, she came.',182,'2006-10-10 06:10:10',NULL,NULL),(183,198,133,'So she sat on,.',124,'2016-05-13 17:41:39',NULL,NULL),(184,155,118,'Alice again. \'No,.',141,'2006-10-10 06:10:10',NULL,NULL),(185,118,193,'I\'ll look first,\'.',200,'2006-10-10 06:10:10',NULL,NULL),(186,113,172,'White Rabbit, \'but.',109,'2006-10-10 06:10:10',NULL,NULL),(187,134,181,'Hatter. He had.',112,'2017-07-26 06:27:21','2016-06-02 01:34:28',NULL),(188,119,154,'Footman remarked,.',160,'2006-10-10 06:10:10',NULL,NULL),(189,150,195,'I get it home?\'.',130,'2007-06-05 14:14:07',NULL,NULL),(190,147,141,'Alice. It looked.',109,'2011-10-27 20:25:49',NULL,NULL),(191,119,136,'Dormouse, after.',116,'2006-10-10 06:10:10',NULL,NULL),(192,190,133,'March Hare took.',200,'2006-10-10 06:10:10',NULL,NULL),(193,172,130,'There seemed to.',132,'2011-07-27 16:26:39',NULL,NULL),(194,196,185,'The Queen turned.',149,'2009-06-08 14:11:37',NULL,'2017-02-08 23:57:59'),(195,136,103,'Dormouse, who was.',142,'2006-10-10 06:10:10',NULL,NULL),(196,136,115,'Gryphon. \'Well, I.',113,'2014-12-22 07:00:08',NULL,NULL),(197,145,149,'Cat, as soon as.',194,'2006-10-10 06:10:10',NULL,NULL),(198,156,168,'YOUR table,\' said.',147,'2006-10-10 06:10:10',NULL,NULL),(199,115,117,'Rabbit whispered.',141,'2006-10-10 06:10:10',NULL,NULL),(200,144,163,'I shall be late!\'.',182,'2006-10-10 06:10:10',NULL,NULL);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int(10) unsigned NOT NULL,
  `communities_id` int(10) unsigned DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `media_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_posts_users1_idx` (`users_id`),
  KEY `fk_posts_communities1_idx` (`communities_id`),
  KEY `fk_posts_media1_idx` (`media_id`),
  CONSTRAINT `fk_posts_communities1` FOREIGN KEY (`communities_id`) REFERENCES `communities` (`id`),
  CONSTRAINT `fk_posts_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_posts_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (101,146,14,'OF ITS WAISTCOAT-POCKET, and.',107,'2006-10-10 06:10:10'),(102,106,17,'Cat, as soon as the Rabbit,.',102,'2006-10-10 06:10:10'),(103,177,20,'I am! But I\'d better take.',158,'2007-11-06 14:29:04'),(104,116,12,'And in she went. Once more.',171,'2006-10-10 06:10:10'),(105,171,11,'Alice, \'it\'ll never do to.',155,'2006-10-10 06:10:10'),(106,168,14,'I must go and take it away!\'.',138,'2006-10-10 06:10:10'),(107,108,15,'Cheshire Cat sitting on the.',135,'2013-08-05 11:59:39'),(108,138,13,'Lizard\'s slate-pencil, and.',158,'2006-10-10 06:10:10'),(109,178,14,'I must go by the soldiers,.',185,'2006-10-10 06:10:10'),(110,110,13,'LITTLE larger, sir, if you.',108,'2006-10-10 06:10:10'),(111,161,18,'ME\' beautifully printed on.',141,'2006-10-10 06:10:10'),(112,167,18,'I won\'t, then!--Bill\'s to go.',107,'2006-10-10 06:10:10'),(113,169,16,'Duchess; \'I never thought.',197,'2006-10-10 06:10:10'),(114,127,18,'Who ever saw one that size?.',115,'2006-10-10 06:10:10'),(115,197,15,'But she went on, \'you see, a.',115,'2006-10-10 06:10:10'),(116,152,11,'The King turned pale, and.',150,'2011-06-29 19:10:00'),(117,189,12,'Dormouse indignantly..',198,'2006-10-10 06:10:10'),(118,124,16,'King put on his spectacles..',125,'2006-10-10 06:10:10'),(119,182,14,'King in a very grave voice,.',156,'2006-10-10 06:10:10'),(120,166,15,'Dormouse indignantly..',185,'2006-10-10 06:10:10'),(121,173,11,'And in she went. Once more.',160,'2006-10-10 06:10:10'),(122,114,17,'Let me see: four times six.',140,'2006-10-10 06:10:10'),(123,120,14,'I don\'t put my arm round.',195,'2012-12-08 05:56:18'),(124,116,17,'CHAPTER XII. Alice\'s.',167,'2006-10-10 06:10:10'),(125,131,17,'The Gryphon lifted up both.',109,'2006-10-10 06:10:10'),(126,145,12,'I THINK,\' said Alice. \'You.',119,'2006-10-10 06:10:10'),(127,194,11,'Conqueror, whose cause was.',136,'2015-10-17 14:14:02'),(128,191,13,'I wish you could keep it to.',191,'2006-10-10 06:10:10'),(129,116,11,'I\'ve tried banks, and I\'ve.',124,'2007-01-30 20:08:51'),(130,172,18,'Said the mouse doesn\'t get.',166,'2015-03-05 19:56:57'),(131,157,15,'Gryphon remarked: \'because.',169,'2020-11-07 09:35:06'),(132,116,16,'ME.\' \'You!\' said the voice..',138,'2017-04-09 13:47:47'),(133,155,18,'You know the meaning of half.',176,'2006-10-10 06:10:10'),(134,150,20,'White Rabbit, who said in a.',140,'2006-10-10 06:10:10'),(135,117,13,'Mouse was speaking, and this.',101,'2006-10-10 06:10:10'),(136,126,17,'Alice: \'besides, that\'s not.',114,'2006-10-10 06:10:10'),(137,144,17,'Go on!\' \'I\'m a poor man,.',115,'2006-10-10 06:10:10'),(138,180,16,'Alice. One of the wood to.',139,'2006-10-10 06:10:10'),(139,171,17,'Cat. \'Do you mean.',145,'2006-10-10 06:10:10'),(140,194,14,'Dormouse shall!\' they both.',116,'2006-10-10 06:10:10'),(141,159,20,'CAN all that green stuff.',159,'2006-10-10 06:10:10'),(142,127,12,'Mystery,\' the Mock Turtle.',116,'2006-10-10 06:10:10'),(143,165,17,'Duchess said after a few.',192,'2006-10-10 06:10:10'),(144,141,12,'March Hare had just begun.',184,'2015-12-26 15:02:23'),(145,181,14,'Tortoise--\' \'Why did they.',107,'2006-10-10 06:10:10'),(146,182,16,'Everything is so.',174,'2006-10-10 06:10:10'),(147,195,20,'Elsie, Lacie, and Tillie;.',134,'2006-10-10 06:10:10'),(148,109,18,'WOULD twist itself round and.',186,'2015-11-13 06:39:45'),(149,148,15,'Alice angrily. \'It wasn\'t.',153,'2006-10-10 06:10:10'),(150,193,15,'Rabbit\'s little white kid.',191,'2018-06-28 17:53:33'),(151,108,11,'But if I\'m Mabel, I\'ll stay.',186,'2006-10-10 06:10:10'),(152,167,13,'Queen had ordered. They very.',197,'2006-10-10 06:10:10'),(153,182,20,'Footman went on without.',162,'2006-10-10 06:10:10'),(154,174,14,'HE was.\' \'I never was so.',177,'2006-10-10 06:10:10'),(155,158,12,'Queen put on one side, to.',108,'2006-10-10 06:10:10'),(156,164,20,'Tortoise because he taught.',164,'2006-10-10 06:10:10'),(157,137,20,'The hedgehog was engaged in.',163,'2007-10-17 10:07:11'),(158,171,20,'Which shall sing?\' \'Oh, YOU.',143,'1970-01-03 22:39:52'),(159,156,15,'Alice did not venture to go.',193,'2006-10-10 06:10:10'),(160,108,14,'Let me see: I\'ll give them a.',136,'2006-10-10 06:10:10'),(161,199,15,'Alice noticed, had powdered.',138,'2006-10-10 06:10:10'),(162,185,12,'I shall ever see such a new.',167,'2006-10-10 06:10:10'),(163,181,20,'WILL do next! If they had at.',160,'2006-10-10 06:10:10'),(164,143,17,'She said it to make out.',194,'2006-10-10 06:10:10'),(165,119,13,'It was, no doubt: only Alice.',109,'1971-11-10 17:29:57'),(166,126,19,'In a little glass table..',105,'2006-10-10 06:10:10'),(167,190,13,'Alice thought to herself..',195,'2010-06-26 20:09:52'),(168,152,20,'Bill\'s place for a great.',194,'2006-10-10 06:10:10'),(169,195,16,'How puzzling all these.',140,'2017-09-28 03:56:15'),(170,187,16,'Gryphon replied very.',179,'2006-10-10 06:10:10'),(171,122,16,'Alice, and tried to curtsey.',126,'2006-10-10 06:10:10'),(172,159,15,'Alice. \'Anything you like,\'.',138,'2016-11-21 09:26:38'),(173,126,13,'This of course, to begin.',133,'2006-10-10 06:10:10'),(174,185,17,'Dormouse!\' And they pinched.',101,'2006-10-10 06:10:10'),(175,179,19,'Hatter, it woke up again.',126,'2006-10-10 06:10:10'),(176,188,12,'I shan\'t! YOU do it!--That I.',115,'2006-10-10 06:10:10'),(177,192,20,'Mock Turtle to sing.',141,'2006-10-10 06:10:10'),(178,186,16,'Alice)--\'and perhaps you.',137,'2006-10-10 06:10:10'),(179,179,15,'Hatter. This piece of.',189,'2006-10-10 06:10:10'),(180,119,14,'Dormouse sulkily remarked,.',149,'2006-10-10 06:10:10'),(181,198,16,'I shan\'t! YOU do it!--That I.',107,'2006-10-10 06:10:10'),(182,123,12,'Footman went on in a solemn.',149,'2017-04-07 15:50:37'),(183,161,14,'Alice in a thick wood. \'The.',173,'2006-10-10 06:10:10'),(184,193,13,'Oh my dear paws! Oh my dear.',139,'2006-10-10 06:10:10'),(185,193,11,'Mock Turtle in the same.',124,'2006-10-10 06:10:10'),(186,119,19,'HIS time of life. The King\'s.',135,'2006-10-10 06:10:10'),(187,134,18,'OURS they had been all the.',135,'2006-10-10 06:10:10'),(188,174,17,'They had a wink of sleep.',186,'2010-08-11 22:27:10'),(189,111,15,'Alice. \'Then it ought to be.',132,'2006-10-10 06:10:10'),(190,200,17,'Alice\'s side as she fell.',164,'2006-10-10 06:10:10'),(191,148,16,'Will you, won\'t you, will.',117,'2006-10-10 06:10:10'),(192,154,19,'Alice\'s head. \'Is that all?\'.',130,'2006-10-10 06:10:10'),(193,103,15,'King. \'Then it ought to be a.',167,'2006-10-10 06:10:10'),(194,175,14,'Duchess said after a minute.',190,'2006-10-10 06:10:10'),(195,114,13,'Mock Turtle sighed deeply,.',191,'2006-10-10 06:10:10'),(196,138,15,'Alice; \'only, as it\'s.',179,'2013-03-17 21:20:24'),(197,172,18,'Then the Queen to-day?\' \'I.',158,'2013-08-27 14:20:23'),(198,106,16,'Duchess began in a natural.',123,'2015-09-27 23:28:38'),(199,192,17,'Alice, \'to pretend to be an.',167,'2006-10-10 06:10:10'),(200,123,17,'King, going up to them to be.',129,'2013-03-31 17:27:47');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `users_id` int(10) unsigned NOT NULL,
  `gender` enum('m','f','x') COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `adress` varchar(245) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`users_id`),
  KEY `fk_profiles_users_idx` (`users_id`),
  KEY `fk_profiles_media1_idx` (`photo_id`),
  CONSTRAINT `fk_profiles_media1` FOREIGN KEY (`photo_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_profiles_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (101,'f','2000-10-29','161 Brakus Forks Suite 461\nHellerberg, ID 25616-8731',102,'2013-07-10 12:27:26'),(102,'f','1986-11-27','866 Kiehn Roads\nHilpertchester, GA 32745-4714',139,'2006-10-10 06:10:10'),(103,'f','1992-07-13','',182,'2006-10-10 06:10:10'),(104,'m','2004-01-21','',140,'2006-10-10 06:10:10'),(106,'m','2020-03-04','039 Karolann Shoal Suite 294\nRippinshire, MN 63590-8053',139,'2009-09-18 10:56:50'),(107,'m','1973-06-05','',136,'2018-03-08 20:30:58'),(108,'f','2011-07-11','',188,'2015-09-29 13:05:09'),(109,'f','1980-02-04','94303 Dallas Islands\nEast Korbintown, GA 18112-5162',177,'2006-10-10 06:10:10'),(110,'m','1977-01-12','8907 Prohaska Light Apt. 245\nCliffordport, NH 23444-0007',135,'2006-10-10 06:10:10'),(112,'x','1975-11-17','082 Janick Springs\nLake Jeanview, WA 76297-9048',143,'2006-10-10 06:10:10'),(113,'x','1976-11-04','',177,'2013-05-20 06:48:22'),(117,'x','1981-03-28','8348 Leon Ports\nFritschtown, NY 35619-2237',142,'2006-10-10 06:10:10'),(118,'m','1999-09-14','88384 Kiehn Gardens Apt. 230\nPort Harvey, SD 29976',171,'2006-10-10 06:10:10'),(119,'x','2001-04-15','96425 Saul Cape Apt. 677\nPort Stanley, NV 58499-6332',136,'2010-12-16 17:54:26'),(120,'m','1999-11-07','',183,'2006-10-10 06:10:10'),(122,'m','2018-08-31','',151,'2016-09-18 17:10:18'),(123,'x','1990-08-13','10715 Audra Place Apt. 119\nSouth Juanita, OR 68013',192,'2006-10-10 06:10:10'),(124,'f','2003-10-14','',143,'2013-04-28 11:05:27'),(127,'m','1995-02-13','',106,'2006-10-10 06:10:10'),(128,'m','2013-02-13','',174,'2006-10-10 06:10:10'),(130,'x','2017-03-08','4540 Rogahn Parkway Suite 497\nWest Evelynbury, WV 72092',132,'2006-10-10 06:10:10'),(131,'m','1989-11-22','589 Collier Ports\nSouth Roycestad, MS 09813-2342',159,'2017-02-01 22:46:56'),(132,'f','1996-11-02','7602 Renner Bridge\nNorth Kirkberg, VA 08623',122,'2006-10-10 06:10:10'),(133,'m','2001-12-10','',174,'2014-03-07 22:48:58'),(135,'x','1970-01-13','',137,'2015-02-08 10:40:53'),(136,'m','1982-09-20','9925 Labadie Centers Apt. 334\nPowlowskiburgh, MD 77657',143,'2006-10-10 06:10:10'),(138,'f','1977-12-25','',145,'2012-06-11 11:53:51'),(139,'x','1970-04-09','',185,'2007-12-04 02:43:32'),(143,'m','1984-07-29','',104,'2007-08-20 03:42:41'),(145,'x','1975-02-04','',170,'2006-10-10 06:10:10'),(146,'m','2003-08-03','245 Beulah Field\nDaniellaburgh, MS 63985',191,'2006-10-10 06:10:10'),(147,'m','2009-12-31','5626 Boyle Rue\nWest Linnea, SD 55462-1607',116,'2006-10-10 06:10:10'),(148,'f','2009-05-08','',120,'2006-10-10 06:10:10'),(149,'x','2008-08-13','',197,'2006-10-10 06:10:10'),(150,'f','2012-02-15','50302 Everardo Grove Suite 162\nWest Finnborough, TN 59697-3203',171,'2011-11-05 22:54:10'),(153,'m','1984-11-15','6175 Katherine Junctions Apt. 459\nNorth Adan, WA 93819-7200',162,'2007-01-20 01:02:41'),(156,'m','2019-05-02','47037 Marks Plains\nRaustad, CO 23762-2828',148,'2006-10-10 06:10:10'),(157,'x','2019-09-14','75586 Boehm Track\nKeelingborough, FL 07819',181,'2018-03-09 20:06:05'),(159,'m','2018-05-04','9753 Moriah Walk\nDickensberg, RI 13730',126,'2006-10-10 06:10:10'),(160,'x','1990-10-15','',180,'2006-10-10 06:10:10'),(164,'m','1995-07-07','7176 Ferry Pines Apt. 716\nMaryseburgh, WA 15841-3560',157,'2006-10-10 06:10:10'),(165,'x','1970-05-05','3285 Catherine Bypass Apt. 850\nNorth Cleo, WA 10254',151,'2006-10-10 06:10:10'),(166,'f','1993-10-15','',197,'2006-10-10 06:10:10'),(167,'x','1993-04-27','',175,'2016-10-29 01:40:48'),(168,'x','2008-05-31','475 Estel Island\nWest Anibalton, NC 84870',102,'2019-05-09 11:31:09'),(169,'f','1994-06-06','5503 Ruecker Trail Suite 161\nLake Catalina, RI 73565',115,'2006-10-10 06:10:10'),(174,'x','1981-09-09','',188,'2006-10-10 06:10:10'),(175,'m','1977-12-04','0324 Gutkowski Knoll\nNew Keyshawnmouth, MN 65912',162,'2006-10-10 06:10:10'),(176,'x','1980-05-11','',196,'2020-12-13 06:05:58'),(177,'m','2018-10-06','37405 Keeling Heights\nWindlerfurt, RI 77566-5050',150,'2006-10-10 06:10:10'),(181,'x','2020-11-01','61538 Kessler Junctions\nEnricomouth, DE 59286',166,'2006-10-10 06:10:10'),(182,'m','2020-07-13','',170,'2006-10-10 06:10:10'),(183,'m','2012-10-26','3651 Conroy Lock\nPort Modesto, LA 42406-2057',129,'2010-05-06 18:17:25'),(185,'f','1985-10-30','',192,'2013-10-22 20:13:12'),(186,'f','2001-02-02','922 Kobe Forks\nEast Holly, MI 71641',147,'2006-10-10 06:10:10'),(187,'f','1996-09-16','552 Hauck Lodge\nJaysonbury, KS 05762',110,'2006-10-10 06:10:10'),(189,'m','2003-06-25','',168,'2006-10-10 06:10:10'),(190,'f','2016-04-26','',167,'2008-07-01 20:12:45'),(191,'x','2015-12-17','',122,'2006-10-10 06:10:10'),(192,'x','1983-09-18','',142,'2006-10-10 06:10:10'),(194,'m','1970-07-30','',123,'2006-10-10 06:10:10'),(195,'m','1992-05-31','',145,'2006-10-10 06:10:10'),(198,'m','1984-12-16','',124,'2006-10-10 06:10:10'),(200,'m','1981-03-02','',152,'2011-10-16 14:02:18');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(145) COLLATE utf8_unicode_ci NOT NULL COMMENT 'имя',
  `lastname` varchar(145) COLLATE utf8_unicode_ci NOT NULL COMMENT 'фамилия',
  `email` varchar(245) COLLATE utf8_unicode_ci NOT NULL,
  `phone` bigint(20) NOT NULL,
  `password_hash` char(65) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (101,'Irwin','Oberbrunner','rpacocha@example.org',79463504898,'16ecc99b41d8d0ce36b9f320449e8f1c418224cd'),(102,'Kristina','Champlin','anderson.blake@example.org',79713435196,'cbbac6fc6f901ff46d4d0cb1745b3100e806e1b7'),(103,'Shakira','Dach','ao\'connell@example.org',79923447248,'d1907e924a4722572ac1ca09bf77ced6dc2d3907'),(104,'Kristy','Rogahn','witting.hal@example.org',79946211223,'477731f46d75f66d6cd10a11adb2a2e1d12402fd'),(105,'Edythe','Weber','hammes.nikki@example.org',79382798243,'e88e68f3e945dfe24eb67290b82503b0059cbc7a'),(106,'Haley','Witting','feeney.emmalee@example.com',79082098939,'35bf17ff9a38d960406f4469c807139e021cfa43'),(107,'Hugh','Buckridge','tklein@example.org',79681219389,'9b641d9f440d8bd1b9983a4a00b4c6e8eafb76b8'),(108,'Heloise','Beatty','yhaag@example.org',79006163226,'1506348a3477314448f2003e398b7d2c189510bc'),(109,'Emilia','O\'Keefe','gottlieb.shayna@example.net',79458172695,'e6a2fa6241b8591773152847e455a7f27185d3a0'),(110,'Nicklaus','Brown','layla.kirlin@example.org',79585013469,'05dab1a2acc6f538832a0284d567cd480b60cbf0'),(111,'Craig','Heidenreich','kiehn.rolando@example.com',79908441680,'fb9b20c5a0dee0e0788768eee3aff69e65c76773'),(112,'Dwight','Beier','berge.dillan@example.com',79888427568,'838e2902e4e4d1282311d4101b0fde950b5a56ca'),(113,'Magdalena','Walsh','shilll@example.com',79626086729,'180f8b4ecebc2ce2834f2546ea7671a11ec03c19'),(114,'Kaylee','Wolff','deron.towne@example.org',79200701837,'0fb8e2d20437e250484fbe11e3c509ade1737dc1'),(115,'Angel','Muller','mkub@example.com',79176235520,'cb95abc2d18611267f83183df1d98b52d4a5ecbc'),(116,'Citlalli','Weissnat','florence12@example.net',79813943050,'4bdb7e773cc0be79efbd3efac0a2587fe314e68f'),(117,'Leta','Kilback','xupton@example.net',79431636849,'1bb23153188e24463051cd4830bd2d2616271c17'),(118,'Haylie','Konopelski','rath.mckenna@example.org',79584572988,'1a09754585d12eb1f424cece290054355f8f05f0'),(119,'Brycen','Rohan','dschmeler@example.org',79320527703,'5433fa5868570b49184f8e20713ce2a0f603c54c'),(120,'Zion','Koss','kuhic.larissa@example.net',79018610198,'36d0713d6f845c8b38ad211c557589027b45fe59'),(121,'Deontae','Smitham','rupert.rohan@example.org',79180994158,'3eae3d71c4384deb2fd7fd31162cb7017f66bea6'),(122,'August','Jacobs','morar.maureen@example.net',79713019140,'ed8ccdd324a58c11549ab9fff1555d0e76916b49'),(123,'Eddie','Upton','chane@example.org',79797283953,'0294a0be3c87cbff331f31ebbc715bae2f3d88fc'),(124,'Rodrigo','Berge','benny.roob@example.org',79875689893,'9121d3f478ac902e107f74947d3eb4fef8e47ede'),(125,'Mina','Herzog','hoeger.greta@example.net',79812451732,'ce37f9c705517764aa3574fb0baca493c17bd6b0'),(126,'Jalyn','Breitenberg','lgreenholt@example.org',79517610700,'7edd8f686f6bb33b6be33a510c9f05c57c492187'),(127,'Damian','Marquardt','monserrat.gleason@example.net',79251599561,'e9523c9d18bd901b1c7e3d5c4cbd1fcafa4935ba'),(128,'Chad','Moen','paula20@example.net',79775931633,'ff81941d4797bdc56dcb33edb43460e6b47235ca'),(129,'Berneice','Lesch','conn.valentina@example.net',79857722581,'e4479f5aeb1c31f235c025535bb0812c94a0a2cf'),(130,'Angie','Aufderhar','nkunde@example.net',79400615554,'5c98495103b5a321dadb0dc67ca470682bf9a55d'),(131,'Maggie','Wolff','jonas.dibbert@example.net',79009607685,'b638130b65eb6e187bb1b72f034f817d3037576e'),(132,'Bert','Wunsch','yrodriguez@example.org',79539637828,'d11079fb2b3c9294fcaffcf1eaf1cd3572649d57'),(133,'Francesca','Labadie','hrempel@example.com',79838955007,'be86de210ab100e8f6406ac9da7becf5a44c95af'),(134,'Florencio','Rohan','lacey76@example.org',79520506887,'d6ea5b4352ba163023798f7971b20955e2b5b914'),(135,'Guido','O\'Hara','vivien00@example.org',79138667626,'6ba001df236e923bf194717e1864273200306a70'),(136,'Hulda','Schaefer','hoppe.kari@example.com',79022320659,'550314abf7a110cca55dc1ad40f31b8080b4b1f1'),(137,'Audie','Wiza','valentin69@example.com',79743004659,'37398c358c43436147e711ae81102408145dbe9c'),(138,'Celine','Wintheiser','guiseppe.gaylord@example.net',79393192958,'2ee0a4c915bdcf33e9c96c9c45b0d3e98868c3b0'),(139,'Johnny','Yost','syble.koelpin@example.com',79489862566,'8577493b18e327e645aca4e823f965e530a3a024'),(140,'Stephany','Dickinson','brekke.maxie@example.org',79328023739,'5b2762534e6ff276715b48259306a8e8ed323741'),(141,'Amely','Mertz','gulgowski.nicole@example.org',79530841698,'cf76b8acfe103ac7de218fb0445c968675297ac2'),(142,'Melyna','Schowalter','kariane.pouros@example.net',79034550049,'d22497c7576604c91de050a1f38c077c9ae2933d'),(143,'Camila','Schamberger','wintheiser.edwin@example.com',79723929258,'8de2770f4a89ff18295ab038cb8769a76afdef44'),(144,'Kieran','Marquardt','darrell10@example.com',79296184361,'6b43c2b91d43487e9a9ea09972326d729ef5096c'),(145,'Iva','Cartwright','qjohnston@example.org',79145656225,'84e1eae0c1ec2bd18b898f7262c0a770be4b9b71'),(146,'Carmela','Bogisich','meghan47@example.org',79218659916,'d10fba3f87f2759afc1236734cea644234b26c30'),(147,'Trevion','Weissnat','gpagac@example.net',79258003509,'57af2a94a91abc7c892c572d643d5328fcfcad4c'),(148,'Lia','Okuneva','johnston.beaulah@example.net',79486121686,'64a65e37f648cd34e373a5fbb3b60df603a6d26f'),(149,'Maxwell','Stark','rupert92@example.com',79323948243,'125f29fd3970c45839ba5b9a4daad277eef8e2f0'),(150,'Rhiannon','Monahan','lupe20@example.com',79287951203,'e137be2ce0edc3fa099dcc61a3db83777e94d901'),(151,'Winifred','Klocko','clair.wuckert@example.org',79340366626,'b07923c594ffb5fe56fd4e3ec96b38fd6ea006ce'),(152,'Enid','Prosacco','marcel10@example.net',79389054644,'7c090aa0144dfed58da241a6b63467cb674af4ca'),(153,'Mathew','Zboncak','christ.brown@example.org',79906415801,'213c1f23795a2ff169161af1cdb5526737c1b84b'),(154,'Rhianna','Effertz','connelly.elisha@example.org',79103959614,'9bc64dff5adc646450a5c681e6e0dc1254447079'),(155,'Adolphus','Keeling','lesly21@example.org',79129541751,'8f5c1eb92faaa58f5760324dd58a53787adc8048'),(156,'Kenton','Stiedemann','mervin41@example.com',79951677385,'b8158d42a4acc73ebe7bbd311e05cb115775d32d'),(157,'Amara','Leuschke','sipes.myah@example.net',79378337847,'9ca55ee167b3713e5887ab5fb68c29a2d571891a'),(158,'Mellie','Graham','vhuel@example.org',79688291469,'530643b134fa01db79bf3ab2d3a3cdda94e85d96'),(159,'Trisha','Kuphal','leland.dare@example.com',79463095443,'9bab742d9633acfc0116a62bb218a9c02fe846f2'),(160,'Allan','Weimann','cbarton@example.net',79540486508,'bbb84ebd06d87e45bc0ede499dddfce5c629e4d2'),(161,'Taryn','Weber','hkoepp@example.org',79044568495,'8ff2b8cfcb0452d433b2585ea85e4e2b842b8682'),(162,'Emie','Cassin','jjones@example.org',79809022348,'abd5331e0fcec602914d35a609666c5a844bc9c1'),(163,'Toney','Klein','nolan.kaleigh@example.org',79496029574,'0297c3a6a9e254364511481551ce2be89530c6c7'),(164,'Johnson','Cummings','guadalupe16@example.org',79353312259,'d5422d3606be295c86df3383e1b44513ee2afb22'),(165,'Floy','Bernhard','gladyce94@example.net',79242391558,'2e0e6550aeb1a3db517044e5a5041b6ab596977b'),(166,'Arthur','Herman','william.gorczany@example.org',79970427365,'e931b121dcc8a91d607ae5a58e94a9bf0226d570'),(167,'Vernon','Sanford','reichel.declan@example.com',79725298059,'e8ffff16e1cdcc4545c9015137157afb5003025a'),(168,'Krista','Treutel','elouise.goyette@example.org',79536750367,'e4ebb472a38f597ce65c5e41649103658e10c139'),(169,'Kim','Schroeder','jroberts@example.org',79952835240,'d9800c2d65205c60fc7313afca5432c7182effe7'),(170,'Dayton','Cummings','reva25@example.net',79990775142,'66121c3cf2d4707c00645dd1977a821f945b0252'),(171,'Jordyn','Harvey','douglas.magdalen@example.com',79459611156,'ae03cdfe0fa653629937c3be28aa2ba1c13e8549'),(172,'Naomie','Harvey','fpadberg@example.net',79717039407,'6b198d68396b4fa0a86e59ab417552dc0d07725a'),(173,'Marcia','Effertz','gaston.stehr@example.com',79071302961,'5f91a29ae8aca16f4ab2c0f520697b1fc144c986'),(174,'Emery','Hoppe','wnolan@example.net',79298276111,'085ea0ff46628e227f1f987863b55a154afc1df6'),(175,'Taya','West','allen49@example.org',79443110696,'a8bf9967ab3476e89df0a50a17bb96db630baa41'),(176,'Cicero','Gleichner','dmcclure@example.org',79842640828,'d0843a2c6f9426f84e262bc59260e00b541be38b'),(177,'Carolyne','Schmeler','kkeebler@example.net',79107024998,'dabe03842745a61ddcf9a13f33a25df7cb09b87f'),(178,'Marian','Buckridge','ftorphy@example.org',79380056320,'9b6136545586b9632aff3203ab76271160186274'),(179,'Zion','Adams','frederik34@example.org',79456495024,'9548c954a87031586939cfbe1b1a97ecf17a48ff'),(180,'Ella','Graham','abshire.lyric@example.org',79488993056,'ae2c288a8ca5041605525bb3ad35b74caa07b861'),(181,'Josianne','Wiegand','ludwig.jaskolski@example.net',79033777489,'d2ff6286178c51c5f9682c337ca96575f29bf140'),(182,'Nayeli','Hermann','clare04@example.com',79786708967,'1b0c45750b06b488bab934ba48983f9e5adc23d9'),(183,'Charles','Welch','merritt.pfeffer@example.com',79819934215,'3bc514da3797d0a90a75d42d60e7e14c89ba9d3b'),(184,'Mariela','Reinger','smcclure@example.net',79505196211,'b5f7a2b9f362676932c6e50edb5b24da173d1938'),(185,'Hosea','Abernathy','graham.esteban@example.com',79799164004,'e4645bc1989f9599530bdd667ddbdd60baf6d087'),(186,'Jamir','Marquardt','mfahey@example.net',79674422960,'07fe1c917ce562e1a865eb0812120bc6e0faa9e5'),(187,'Katharina','Batz','julian37@example.org',79793654725,'0598d0437c173213ff106234e72525a130a4dbb5'),(188,'Nico','Pacocha','kennedi.hoeger@example.net',79645267765,'6bb531b29da93a9c3fdccf2ece300461c19edf47'),(189,'Jayden','Stehr','casper.feest@example.net',79752104920,'865a347a5cf90df1b4a9a773e782112dc70bc3a4'),(190,'Morgan','Robel','hintz.taylor@example.org',79053483095,'b1353cb4b94f1a7e13399706a80e149840e477a2'),(191,'Lonie','Auer','rusty40@example.org',79544017322,'874262b34e603314aa5007ba5c43a2a8ec6cc0e9'),(192,'Kamron','Grimes','kharber@example.com',79514013079,'bd25664513fbde6533379db7c4717bec352ace11'),(193,'Kamryn','Johnston','kristy.price@example.com',79409163326,'27227519a0a4ba8fc862c7b5b659a36da30d7da5'),(194,'Carissa','Legros','rrowe@example.net',79763766712,'3c7243fdddd46d6dbb38d4a8875f8aa574f8eb4e'),(195,'Krystina','Jaskolski','markus.stiedemann@example.net',79512711699,'7ec6539b4532b4d13f68a4b5bc134e608a126078'),(196,'Sean','Stokes','everett.bashirian@example.com',79597824966,'da1d432ab1cfda5ad9f0bd77fbc1c5c4156cbe5d'),(197,'Francesca','Nader','pbode@example.org',79524734919,'efdfe07dcd62d9ee4fb4a2367e150319c25ee686'),(198,'Dallas','Schiller','omari97@example.com',79839749038,'eaf67cf1b2766964d507cce4b22ef5d6e6a35967'),(199,'Kasey','Smith','west.elissa@example.com',79915080145,'c6c914754cae16c7afdca02356308f769e1e8056'),(200,'Leonardo','Bins','bhalvorson@example.net',79429189410,'d36a89785b2477770d9fdceebe1353d0c6aee72f');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_communities` (
  `communities_id` int(10) unsigned NOT NULL,
  `users_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`communities_id`,`users_id`),
  KEY `fk_users_communities_communities1_idx` (`communities_id`),
  KEY `fk_users_communities_users1_idx` (`users_id`),
  CONSTRAINT `fk_users_communities_communities1` FOREIGN KEY (`communities_id`) REFERENCES `communities` (`id`),
  CONSTRAINT `fk_users_communities_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (11,105),(11,117),(11,126),(11,135),(11,154),(11,163),(11,167),(11,198),(12,118),(12,129),(12,137),(12,140),(12,148),(12,154),(12,161),(12,163),(12,171),(12,175),(12,186),(12,189),(12,196),(12,199),(13,111),(13,116),(13,140),(13,147),(13,149),(13,165),(13,167),(13,173),(13,186),(13,187),(14,103),(14,111),(14,116),(14,118),(14,126),(14,148),(14,174),(14,177),(14,181),(14,186),(14,198),(15,104),(16,106),(16,130),(16,135),(16,139),(16,145),(16,155),(16,158),(16,162),(16,174),(16,184),(16,188),(16,190),(16,196),(17,102),(17,107),(17,108),(17,123),(17,133),(17,138),(17,145),(17,148),(17,178),(17,185),(17,194),(18,122),(18,131),(18,150),(18,175),(18,178),(18,196),(18,197),(19,109),(19,120),(19,134),(19,164),(19,173),(19,175),(19,179),(19,181),(19,183),(19,199),(20,107),(20,122),(20,123),(20,128),(20,133),(20,138),(20,142),(20,160),(20,163),(20,186);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-16  1:33:58
