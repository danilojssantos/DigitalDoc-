-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.26-MariaDB


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema digitaldoc
--

CREATE DATABASE IF NOT EXISTS digitaldoc;
USE digitaldoc;

--
-- Definition of table `document`
--

DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
  `document_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `document_type_id` int(10) unsigned NOT NULL,
  `document_date` date NOT NULL,
  `sucursal_id` int(10) unsigned NOT NULL,
  `sector_id` int(10) unsigned NOT NULL,
  `row` varchar(10) NOT NULL,
  `shelf` varchar(10) NOT NULL,
  `folder` varchar(10) NOT NULL,
  `date_add` datetime NOT NULL,
  `user_add_id` int(10) unsigned NOT NULL,
  `date_upd` datetime NOT NULL,
  `user_upd_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`document_id`),
  KEY `FK_document_1` (`document_type_id`),
  KEY `FK_document_2` (`sucursal_id`),
  KEY `FK_document_3` (`sector_id`),
  KEY `FK_document_4` (`user_add_id`),
  KEY `FK_document_5` (`user_upd_id`),
  CONSTRAINT `FK_document_1` FOREIGN KEY (`document_type_id`) REFERENCES `document_type` (`document_type_id`),
  CONSTRAINT `FK_document_2` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursal` (`sucursal_id`),
  CONSTRAINT `FK_document_3` FOREIGN KEY (`sector_id`) REFERENCES `sector` (`sector_id`),
  CONSTRAINT `FK_document_4` FOREIGN KEY (`user_add_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_document_5` FOREIGN KEY (`user_upd_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `document`
--

/*!40000 ALTER TABLE `document` DISABLE KEYS */;
/*!40000 ALTER TABLE `document` ENABLE KEYS */;


--
-- Definition of table `document_type`
--

DROP TABLE IF EXISTS `document_type`;
CREATE TABLE `document_type` (
  `document_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`document_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `document_type`
--

/*!40000 ALTER TABLE `document_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_type` ENABLE KEYS */;


--
-- Definition of table `email`
--

DROP TABLE IF EXISTS `email`;
CREATE TABLE `email` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email`
--

/*!40000 ALTER TABLE `email` DISABLE KEYS */;
/*!40000 ALTER TABLE `email` ENABLE KEYS */;


--
-- Definition of table `form`
--

DROP TABLE IF EXISTS `form`;
CREATE TABLE `form` (
  `form_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_name` varchar(45) NOT NULL,
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `form`
--

/*!40000 ALTER TABLE `form` DISABLE KEYS */;
/*!40000 ALTER TABLE `form` ENABLE KEYS */;


--
-- Definition of table `formgroup`
--

DROP TABLE IF EXISTS `formgroup`;
CREATE TABLE `formgroup` (
  `formgroup_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `insert` tinyint(1) unsigned NOT NULL,
  `update` tinyint(1) unsigned NOT NULL,
  `delete` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`formgroup_id`),
  KEY `FK_formgroup_1` (`form_id`),
  KEY `FK_formgroup_2` (`group_id`),
  CONSTRAINT `FK_formgroup_1` FOREIGN KEY (`form_id`) REFERENCES `form` (`form_id`),
  CONSTRAINT `FK_formgroup_2` FOREIGN KEY (`group_id`) REFERENCES `group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `formgroup`
--

/*!40000 ALTER TABLE `formgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `formgroup` ENABLE KEYS */;


--
-- Definition of table `group`
--

DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(45) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `group`
--

/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` (`group_id`,`group_name`) VALUES 
 (1,'Administrador');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;


--
-- Definition of table `image`
--

DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `image_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` int(10) unsigned NOT NULL,
  `image_name` varchar(60) NOT NULL,
  `sucursal_id` int(10) unsigned NOT NULL,
  `sector_id` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  `user_add_id` int(10) unsigned NOT NULL,
  `date_upd` datetime NOT NULL,
  `user_upd_id` int(10) unsigned NOT NULL,
  `sequence` smallint(5) unsigned NOT NULL,
  `tipo` varchar(3) NOT NULL,
  PRIMARY KEY (`image_id`),
  KEY `FK_image_1` (`document_id`),
  KEY `FK_image_2` (`sucursal_id`),
  KEY `FK_image_3` (`sector_id`),
  KEY `FK_image_4` (`user_add_id`),
  KEY `FK_image_5` (`user_upd_id`),
  CONSTRAINT `FK_image_1` FOREIGN KEY (`document_id`) REFERENCES `document` (`document_id`),
  CONSTRAINT `FK_image_2` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursal` (`sucursal_id`),
  CONSTRAINT `FK_image_3` FOREIGN KEY (`sector_id`) REFERENCES `sector` (`sector_id`),
  CONSTRAINT `FK_image_4` FOREIGN KEY (`user_add_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_image_5` FOREIGN KEY (`user_upd_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `image`
--

/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;


--
-- Definition of table `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `operation` varchar(45) NOT NULL,
  `objtype` varchar(45) NOT NULL,
  `object` varchar(160) NOT NULL,
  `date` datetime NOT NULL,
  `sucursal_id` int(10) unsigned NOT NULL,
  `sector_id` int(10) unsigned NOT NULL,
  `row` varchar(10) NOT NULL,
  `shelf` varchar(10) NOT NULL,
  `folder` varchar(10) NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `FK_log_1` (`user_id`),
  KEY `FK_log_2` (`sucursal_id`),
  KEY `FK_log_3` (`sector_id`),
  CONSTRAINT `FK_log_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_log_2` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursal` (`sucursal_id`),
  CONSTRAINT `FK_log_3` FOREIGN KEY (`sector_id`) REFERENCES `sector` (`sector_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `log`
--

/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;


--
-- Definition of table `sector`
--

DROP TABLE IF EXISTS `sector`;
CREATE TABLE `sector` (
  `sector_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sector_name` varchar(45) NOT NULL,
  PRIMARY KEY (`sector_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sector`
--

/*!40000 ALTER TABLE `sector` DISABLE KEYS */;
/*!40000 ALTER TABLE `sector` ENABLE KEYS */;


--
-- Definition of table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
CREATE TABLE `sucursal` (
  `sucursal_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sucursal_name` varchar(45) NOT NULL,
  PRIMARY KEY (`sucursal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sucursal`
--

/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(45) NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FK_user_1` (`group_id`),
  CONSTRAINT `FK_user_1` FOREIGN KEY (`group_id`) REFERENCES `group` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`,`user_name`,`password`,`email`,`group_id`,`status`) VALUES 
 (1,'Ricardo','123456','ricardo@pantheontec.com',1,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
