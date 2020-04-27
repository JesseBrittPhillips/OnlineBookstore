-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: bookstore
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add auth group',8,'add_authgroup'),(26,'Can change auth group',8,'change_authgroup'),(27,'Can delete auth group',8,'delete_authgroup'),(28,'Can view auth group',8,'view_authgroup'),(29,'Can add auth group permissions',9,'add_authgrouppermissions'),(30,'Can change auth group permissions',9,'change_authgrouppermissions'),(31,'Can delete auth group permissions',9,'delete_authgrouppermissions'),(32,'Can view auth group permissions',9,'view_authgrouppermissions'),(33,'Can add auth permission',10,'add_authpermission'),(34,'Can change auth permission',10,'change_authpermission'),(35,'Can delete auth permission',10,'delete_authpermission'),(36,'Can view auth permission',10,'view_authpermission'),(37,'Can add auth user',11,'add_authuser'),(38,'Can change auth user',11,'change_authuser'),(39,'Can delete auth user',11,'delete_authuser'),(40,'Can view auth user',11,'view_authuser'),(41,'Can add auth user groups',12,'add_authusergroups'),(42,'Can change auth user groups',12,'change_authusergroups'),(43,'Can delete auth user groups',12,'delete_authusergroups'),(44,'Can view auth user groups',12,'view_authusergroups'),(45,'Can add auth user user permissions',13,'add_authuseruserpermissions'),(46,'Can change auth user user permissions',13,'change_authuseruserpermissions'),(47,'Can delete auth user user permissions',13,'delete_authuseruserpermissions'),(48,'Can view auth user user permissions',13,'view_authuseruserpermissions'),(49,'Can add coverpictures',14,'add_coverpictures'),(50,'Can change coverpictures',14,'change_coverpictures'),(51,'Can delete coverpictures',14,'delete_coverpictures'),(52,'Can view coverpictures',14,'view_coverpictures'),(53,'Can add customers',7,'add_customers'),(54,'Can change customers',7,'change_customers'),(55,'Can delete customers',7,'delete_customers'),(56,'Can view customers',7,'view_customers'),(57,'Can add django admin log',15,'add_djangoadminlog'),(58,'Can change django admin log',15,'change_djangoadminlog'),(59,'Can delete django admin log',15,'delete_djangoadminlog'),(60,'Can view django admin log',15,'view_djangoadminlog'),(61,'Can add django content type',16,'add_djangocontenttype'),(62,'Can change django content type',16,'change_djangocontenttype'),(63,'Can delete django content type',16,'delete_djangocontenttype'),(64,'Can view django content type',16,'view_djangocontenttype'),(65,'Can add django migrations',17,'add_djangomigrations'),(66,'Can change django migrations',17,'change_djangomigrations'),(67,'Can delete django migrations',17,'delete_djangomigrations'),(68,'Can view django migrations',17,'view_djangomigrations'),(69,'Can add django session',18,'add_djangosession'),(70,'Can change django session',18,'change_djangosession'),(71,'Can delete django session',18,'delete_djangosession'),(72,'Can view django session',18,'view_djangosession'),(73,'Can add inventory',19,'add_inventory'),(74,'Can change inventory',19,'change_inventory'),(75,'Can delete inventory',19,'delete_inventory'),(76,'Can view inventory',19,'view_inventory'),(77,'Can add orders',20,'add_orders'),(78,'Can change orders',20,'change_orders'),(79,'Can delete orders',20,'delete_orders'),(80,'Can view orders',20,'view_orders'),(81,'Can add payment info',21,'add_paymentinfo'),(82,'Can change payment info',21,'change_paymentinfo'),(83,'Can delete payment info',21,'delete_paymentinfo'),(84,'Can view payment info',21,'view_paymentinfo'),(85,'Can add promotions',22,'add_promotions'),(86,'Can change promotions',22,'change_promotions'),(87,'Can delete promotions',22,'delete_promotions'),(88,'Can view promotions',22,'view_promotions'),(89,'Can add shopping cart',23,'add_shoppingcart'),(90,'Can change shopping cart',23,'change_shoppingcart'),(91,'Can delete shopping cart',23,'delete_shoppingcart'),(92,'Can view shopping cart',23,'view_shoppingcart'),(93,'Can add book',24,'add_book'),(94,'Can change book',24,'change_book'),(95,'Can delete book',24,'delete_book'),(96,'Can view book',24,'view_book');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `promotions` tinyint(1) NOT NULL DEFAULT '0',
  `state` varchar(45) DEFAULT NULL,
  `cart_id` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `zipcode` varchar(45) DEFAULT NULL,
  `card_type` varchar(45) DEFAULT NULL,
  `card_number` varchar(150) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$uZSMs0m3P7pS$DqLy1ecy50NvwTkk9YK00KpJSlpNZU7pG662gXiJ/5g=','2020-04-16 18:11:22.760822',1,'admin','','',1,1,'2020-04-14 20:28:35.178618','',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),(4,'pbkdf2_sha256$150000$Z0oUe5vHXOzJ$QcYAXxMNMv565uq+8ZdB/D+9ffUMbHbW6QnfzgetuJ4=',NULL,0,'Trey','','',0,1,'2020-04-16 18:53:38.205817',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),(5,'pbkdf2_sha256$150000$DvrOlChocRPq$YM6x8CfR/I04T5KYLb6LcXVcA/te+IMsksXPFyejj+U=',NULL,0,'Jesse','','',0,1,'2020-04-16 18:55:51.350442',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coverpictures`
--

DROP TABLE IF EXISTS `coverpictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coverpictures` (
  `PicID` int NOT NULL AUTO_INCREMENT,
  `Picture` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PicID`),
  UNIQUE KEY `PicID_UNIQUE` (`PicID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coverpictures`
--

LOCK TABLES `coverpictures` WRITE;
/*!40000 ALTER TABLE `coverpictures` DISABLE KEYS */;
/*!40000 ALTER TABLE `coverpictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '0',
  `phone_number` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `promotions` tinyint(1) NOT NULL DEFAULT '0',
  `state` varchar(45) DEFAULT NULL,
  `cart_id` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `zipcode` varchar(45) DEFAULT NULL,
  `card_type` varchar(45) DEFAULT NULL,
  `card_number` varchar(150) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (59,'pbkdf2_sha256$150000$32zYUSTj2pt5$hXEjgJJg+IQ6lCohPcR73GInjk7gfS4pZ6PdBzmqi/M=','trey','James','Hull',NULL,1,'4049848212','2375 South Lumpkin Street',0,'GA',NULL,'Athens','30606','','gAAAAABeoLoZCiFIPvKWgu6T9IiA_XGyerxNqvdVBKNAJWdrt4bv6BL8lNnw8YuLAKgnLUAUyWBF_GUi3uk8jkswiyAKUMIYeg==',NULL,'trey.hull3@gmail.com','2020-04-22 21:42:26.222741',0),(60,'pbkdf2_sha256$150000$CFvYQHSp3bZS$AlwLwfVDVSJyozBKeV0/aro07M85TzxQPHWlR/iyzFM=','jbpman','jesse','phillips',1,1,'777','',0,'',NULL,'',NULL,'','gAAAAABeoOSFBTfwFGDSRYqnF7DxKw22JJ3tU__WFHRxruo7XutTOmf8VzgzhVUmc5Oyi09iAOUkH9VnvPQAGChVcL2m_MMkLg==',NULL,'nookphillips@gmail.com','2020-04-26 19:59:39.323464',0),(61,'pbkdf2_sha256$150000$rLh9y9hE5MfP$zy06uJ3HTKs2VfQs8SuPW8Sg0ucbCDNe/8OpDm1O+mg=','xelarender','alex','payne',NULL,1,'770688','484 Stephanie Lane',1,'Georgia',NULL,'Jefferson','30549','Visa','gAAAAABephx9_3HCsKIWaATKTMhmS4dO8rJVqWp_Aj4cv7i-OyKU_9iy8v-onxDyE6btsAQopfHHEqctZu4Nkm2mtUsEdWcBXw==','2020-08-08','jessebrittphillips@gmail.com','2020-04-26 20:35:33.417315',0),(62,'pbkdf2_sha256$150000$A8AqAg8vKWrN$Wol+ZqPMz6n2QEK/Eoa34scuyaNxlANdtTKP6gr7YBc=','emberflam','Jacob','Wood',NULL,1,'7770','',1,'',NULL,'',NULL,'','gAAAAABepLWQak-5BSfmKp4al5wVr-7lhkEWWc_HNlPBBva5FaqBRRrNNyB0Mh9LgjpR-J-eT7LsIT-3kELWI5Ttdq-Vzjg3uA==',NULL,'pithole55555@gmail.com','2020-04-25 22:36:32.504011',0);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-04-14 20:29:10.130154','1','Customers object (1)',1,'[{\"added\": {}}]',7,1),(2,'2020-04-14 20:29:15.932216','1','Customers object (1)',2,'[]',7,1),(3,'2020-04-14 21:10:43.747872','2','Customers object (2)',1,'[{\"added\": {}}]',7,1),(4,'2020-04-14 22:20:15.849256','2','Customers object (2)',3,'',7,1),(5,'2020-04-14 22:20:18.993415','1','Customers object (1)',3,'',7,1),(6,'2020-04-14 22:49:26.551052','3','Customers object (3)',3,'',7,1),(7,'2020-04-14 22:49:33.067780','4','Customers object (4)',3,'',7,1),(8,'2020-04-14 22:49:36.050432','5','Customers object (5)',3,'',7,1),(9,'2020-04-14 22:50:20.003279','6','Customers object (6)',3,'',7,1),(10,'2020-04-14 22:52:30.646038','7','Customers object (7)',3,'',7,1),(11,'2020-04-15 01:35:53.277681','8','Customers object (8)',3,'',7,1),(12,'2020-04-15 01:35:56.459175','14','Customers object (14)',3,'',7,1),(13,'2020-04-15 01:35:59.808221','13','Customers object (13)',3,'',7,1),(14,'2020-04-15 01:36:02.927882','12','Customers object (12)',3,'',7,1),(15,'2020-04-15 01:36:06.125333','11','Customers object (11)',3,'',7,1),(16,'2020-04-15 01:36:09.818459','10','Customers object (10)',3,'',7,1),(17,'2020-04-15 01:36:15.345682','9','Customers object (9)',3,'',7,1),(18,'2020-04-15 01:38:25.591205','16','Customers object (16)',3,'',7,1),(19,'2020-04-15 01:38:28.787658','15','Customers object (15)',3,'',7,1),(20,'2020-04-15 01:41:32.754909','17','Customers object (17)',3,'',7,1),(21,'2020-04-15 01:42:57.767271','18','Customers object (18)',3,'',7,1),(22,'2020-04-15 01:50:21.603296','19','Customers object (19)',3,'',7,1),(23,'2020-04-15 01:50:28.149444','20','Customers object (20)',3,'',7,1),(24,'2020-04-15 01:50:32.465537','21','Customers object (21)',3,'',7,1),(25,'2020-04-15 01:50:37.285770','22','Customers object (22)',3,'',7,1),(26,'2020-04-15 01:50:41.780858','23','Customers object (23)',3,'',7,1),(27,'2020-04-15 01:50:44.685668','24','Customers object (24)',3,'',7,1),(28,'2020-04-15 01:50:48.761368','25','Customers object (25)',3,'',7,1),(29,'2020-04-15 02:01:26.134686','27','Customers object (27)',3,'',7,1),(30,'2020-04-15 02:01:28.888915','26','Customers object (26)',3,'',7,1),(31,'2020-04-15 02:05:19.911167','28','Customers object (28)',3,'',7,1),(32,'2020-04-15 02:14:53.639382','29','Customers object (29)',3,'',7,1),(33,'2020-04-15 14:33:31.813325','30','Customers object (30)',3,'',7,1),(34,'2020-04-15 14:33:35.442184','31','Customers object (31)',3,'',7,1),(35,'2020-04-15 14:33:39.158822','32','Customers object (32)',3,'',7,1),(36,'2020-04-15 16:56:03.200116','44','Customers object (44)',3,'',7,1),(37,'2020-04-15 16:56:03.205103','43','Customers object (43)',3,'',7,1),(38,'2020-04-15 16:56:03.207097','42','Customers object (42)',3,'',7,1),(39,'2020-04-15 16:56:03.214078','41','Customers object (41)',3,'',7,1),(40,'2020-04-15 16:56:03.216073','40','Customers object (40)',3,'',7,1),(41,'2020-04-15 16:56:03.219065','39','Customers object (39)',3,'',7,1),(42,'2020-04-15 16:56:03.222057','38','Customers object (38)',3,'',7,1),(43,'2020-04-15 16:56:03.225049','37','Customers object (37)',3,'',7,1),(44,'2020-04-15 16:56:03.227044','36','Customers object (36)',3,'',7,1),(45,'2020-04-15 16:56:03.230036','35','Customers object (35)',3,'',7,1),(46,'2020-04-15 16:56:03.232030','34','Customers object (34)',3,'',7,1),(47,'2020-04-15 16:56:03.237017','33','Customers object (33)',3,'',7,1),(48,'2020-04-15 18:37:43.528429','45','Customers object (45)',1,'[{\"added\": {}}]',7,1),(49,'2020-04-15 18:41:17.228614','45','Customers object (45)',3,'',7,1),(50,'2020-04-15 18:53:36.050974','46','Customers object (46)',3,'',7,1),(51,'2020-04-15 20:23:22.378259','48','Customers object (48)',1,'[{\"added\": {}}]',7,1),(52,'2020-04-16 18:08:03.940185','51','AuthUser object (51)',1,'[{\"added\": {}}]',11,1),(53,'2020-04-16 18:09:29.705400','51','AuthUser object (51)',3,'',11,1),(54,'2020-04-16 18:09:29.719362','50','AuthUser object (50)',3,'',11,1),(55,'2020-04-16 18:09:29.724349','49','AuthUser object (49)',3,'',11,1),(56,'2020-04-16 18:09:29.727345','48','AuthUser object (48)',3,'',11,1),(57,'2020-04-16 18:09:29.730337','47','AuthUser object (47)',3,'',11,1),(58,'2020-04-16 18:09:59.211614','52','AuthUser object (52)',1,'[{\"added\": {}}]',11,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(8,'storefront','authgroup'),(9,'storefront','authgrouppermissions'),(10,'storefront','authpermission'),(11,'storefront','authuser'),(12,'storefront','authusergroups'),(13,'storefront','authuseruserpermissions'),(24,'storefront','book'),(14,'storefront','coverpictures'),(7,'storefront','customers'),(15,'storefront','djangoadminlog'),(16,'storefront','djangocontenttype'),(17,'storefront','djangomigrations'),(18,'storefront','djangosession'),(19,'storefront','inventory'),(20,'storefront','orders'),(21,'storefront','paymentinfo'),(22,'storefront','promotions'),(23,'storefront','shoppingcart');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-04-10 18:23:40.607857'),(2,'auth','0001_initial','2020-04-10 18:23:40.804331'),(3,'admin','0001_initial','2020-04-10 18:23:41.416223'),(4,'admin','0002_logentry_remove_auto_add','2020-04-10 18:23:41.636635'),(5,'admin','0003_logentry_add_action_flag_choices','2020-04-10 18:23:41.651594'),(6,'contenttypes','0002_remove_content_type_name','2020-04-10 18:23:41.783243'),(7,'auth','0002_alter_permission_name_max_length','2020-04-10 18:23:41.877989'),(8,'auth','0003_alter_user_email_max_length','2020-04-10 18:23:41.899931'),(9,'auth','0004_alter_user_username_opts','2020-04-10 18:23:41.907909'),(10,'auth','0005_alter_user_last_login_null','2020-04-10 18:23:41.997669'),(11,'auth','0006_require_contenttypes_0002','2020-04-10 18:23:42.001660'),(12,'auth','0007_alter_validators_add_error_messages','2020-04-10 18:23:42.011633'),(13,'auth','0008_alter_user_username_max_length','2020-04-10 18:23:42.095409'),(14,'auth','0009_alter_user_last_name_max_length','2020-04-10 18:23:42.176192'),(15,'auth','0010_alter_group_name_max_length','2020-04-10 18:23:42.198133'),(16,'auth','0011_update_proxy_permissions','2020-04-10 18:23:42.205115'),(17,'sessions','0001_initial','2020-04-10 18:23:42.236032'),(18,'storefront','0001_initial','2020-04-14 21:00:28.356891'),(19,'storefront','0002_delete_passwords','2020-04-14 21:00:28.360880'),(20,'storefront','0003_auto_20200416_1322','2020-04-16 18:05:48.292815'),(21,'storefront','0004_auto_20200416_1444','2020-04-16 18:44:25.654410'),(22,'storefront','0005_book','2020-04-25 22:03:07.779224'),(23,'storefront','0006_delete_book','2020-04-25 22:20:59.780527');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('9oacbkyyzlh276ddjqepeh2r2n8aodzl','MWY3MzhiM2NmZGU3OTE4ZjM4MjhmYmI0Y2VlYTU4ZTczMmE3ODM5NDp7Il9hdXRoX3VzZXJfaWQiOiI2MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjlkNTkwNmUzYjQyOWIwNjZjMTlkMzY5Zjg3Mzk2ZjllMzY0MDFjMyJ9','2020-05-08 01:27:46.111690'),('bvpg5vn6r04pmussgqy1j57edr67hu24','MzQ5NTExMDc4NTRlZGI2ZTlhMjgzZmQzYjBmNGQwMmY2N2FjOTlhMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlNDY4ZWI2MDA4NWVmZjFmMmM1YjU3YzYwMTA2MjEzOGFjYjE5ZWM1In0=','2020-04-28 20:32:26.821195'),('du89ik3dr71gv06v8f4jmq5ip5ns3jwg','MWY3MzhiM2NmZGU3OTE4ZjM4MjhmYmI0Y2VlYTU4ZTczMmE3ODM5NDp7Il9hdXRoX3VzZXJfaWQiOiI2MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjlkNTkwNmUzYjQyOWIwNjZjMTlkMzY5Zjg3Mzk2ZjllMzY0MDFjMyJ9','2020-05-10 20:35:33.423299'),('mespj8j7847auw7ms3ud3wezbugv3itc','OGYwZGZlMjdlYWNkOTFkMzY4MzlhMzg2MjAxNTVhNDQxOTllZGNiNjp7Il9hdXRoX3VzZXJfaWQiOiI1OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzU4OTVlYWU1MTg2ZjQ4MTllYWFiNDc1OTk5OWE4M2UyYmVkYWM1YyJ9','2020-05-06 21:42:26.229724');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `bookid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `authors` varchar(45) DEFAULT NULL,
  `coverPicID` int DEFAULT NULL,
  `BuyPrice` decimal(6,2) DEFAULT NULL,
  `Sell Price` decimal(6,2) DEFAULT NULL,
  `minumum` int DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `number of copies` int DEFAULT NULL,
  `publisher` varchar(45) DEFAULT NULL,
  `editor` varchar(45) DEFAULT NULL,
  `ISBN` varchar(45) DEFAULT NULL,
  `datepublished` year DEFAULT NULL,
  `pic` varchar(100) NOT NULL,
  PRIMARY KEY (`bookid`),
  UNIQUE KEY `bookid_UNIQUE` (`bookid`),
  KEY `PicID_idx` (`coverPicID`),
  CONSTRAINT `PicID` FOREIGN KEY (`coverPicID`) REFERENCES `coverpictures` (`PicID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='This is where the manager can add and remove books in the inventory';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (4,'The Hobbit','J. R. R Tolkien',NULL,12.64,6.22,1,'Fantasy',42,'Houghton Mifflin Harcourt','Houghton Mifflin Harcourt','054792822X',2012,'images/Hobbit.jpg'),(5,'Harry Potter','J. K. Rowling',NULL,8.99,4.55,1,'Fantasy',42,'Pottermore Publishing','Pottermore Publishing','B0192CTMYG',2015,'images/HP.jpg');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `ordertime` time NOT NULL,
  `OrderDate` date DEFAULT NULL,
  `OrderStatus` varchar(45) DEFAULT NULL,
  `TotalPrice` decimal(10,2) DEFAULT NULL,
  `ShipAddress` varchar(200) DEFAULT NULL,
  `PaymentMethod` varchar(45) DEFAULT NULL,
  `Books` varchar(45) DEFAULT NULL,
  `Promotion` varchar(10) DEFAULT NULL,
  `CustID` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  UNIQUE KEY `OrderID_UNIQUE` (`OrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Data table for orders that have gone through\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (3,'20:05:16','2020-04-26','order confirmed',46.91,'484 Stephanie Lane, Jefferson, Georgia, 30549, ','Visa','The Hobbit(x3), Harry Potter(x1), ',NULL,61);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment info`
--

DROP TABLE IF EXISTS `payment info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment info` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `Card number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  UNIQUE KEY `PaymentID_UNIQUE` (`PaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment info`
--

LOCK TABLES `payment info` WRITE;
/*!40000 ALTER TABLE `payment info` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotions` (
  `PromoID` int NOT NULL AUTO_INCREMENT,
  `PromoCode` varchar(10) DEFAULT NULL,
  `Percentage` int DEFAULT NULL,
  `Start Date` varchar(50) DEFAULT NULL,
  `Expiration Date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PromoID`),
  UNIQUE KEY `PromoID_UNIQUE` (`PromoID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Data table for the admin to add promotions to';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions`
--

LOCK TABLES `promotions` WRITE;
/*!40000 ALTER TABLE `promotions` DISABLE KEYS */;
INSERT INTO `promotions` VALUES (1,'50off',50,'01/08/2020','12/31/2020');
/*!40000 ALTER TABLE `promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping cart`
--

DROP TABLE IF EXISTS `shopping cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping cart` (
  `cartID` int NOT NULL AUTO_INCREMENT,
  `CustID` int DEFAULT NULL,
  `invID` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`cartID`),
  UNIQUE KEY `cartID_UNIQUE` (`cartID`),
  KEY `CustID_idx` (`CustID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping cart`
--

LOCK TABLES `shopping cart` WRITE;
/*!40000 ALTER TABLE `shopping cart` DISABLE KEYS */;
INSERT INTO `shopping cart` VALUES (9,62,4,3),(11,62,5,1),(16,61,4,3),(17,61,5,1);
/*!40000 ALTER TABLE `shopping cart` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-26 20:12:04
