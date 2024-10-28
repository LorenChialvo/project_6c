-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: labquim_db
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
  `id` bigint NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add estado estudio',7,'add_estadoestudio'),(26,'Can change estado estudio',7,'change_estadoestudio'),(27,'Can delete estado estudio',7,'delete_estadoestudio'),(28,'Can view estado estudio',7,'view_estadoestudio'),(29,'Can add estado solicitud',8,'add_estadosolicitud'),(30,'Can change estado solicitud',8,'change_estadosolicitud'),(31,'Can delete estado solicitud',8,'delete_estadosolicitud'),(32,'Can view estado solicitud',8,'view_estadosolicitud'),(33,'Can add estudios',9,'add_estudios'),(34,'Can change estudios',9,'change_estudios'),(35,'Can delete estudios',9,'delete_estudios'),(36,'Can view estudios',9,'view_estudios'),(37,'Can add extraccionista',10,'add_extraccionista'),(38,'Can change extraccionista',10,'change_extraccionista'),(39,'Can delete extraccionista',10,'delete_extraccionista'),(40,'Can view extraccionista',10,'view_extraccionista'),(41,'Can add medico',11,'add_medico'),(42,'Can change medico',11,'change_medico'),(43,'Can delete medico',11,'delete_medico'),(44,'Can view medico',11,'view_medico'),(45,'Can add metodo',12,'add_metodo'),(46,'Can change metodo',12,'change_metodo'),(47,'Can delete metodo',12,'delete_metodo'),(48,'Can view metodo',12,'view_metodo'),(49,'Can add muestra',13,'add_muestra'),(50,'Can change muestra',13,'change_muestra'),(51,'Can delete muestra',13,'delete_muestra'),(52,'Can view muestra',13,'view_muestra'),(53,'Can add paciente',14,'add_paciente'),(54,'Can change paciente',14,'change_paciente'),(55,'Can delete paciente',14,'delete_paciente'),(56,'Can view paciente',14,'view_paciente'),(57,'Can add tipo documento',15,'add_tipodocumento'),(58,'Can change tipo documento',15,'change_tipodocumento'),(59,'Can delete tipo documento',15,'delete_tipodocumento'),(60,'Can view tipo documento',15,'view_tipodocumento'),(61,'Can add unidad med',16,'add_unidadmed'),(62,'Can change unidad med',16,'change_unidadmed'),(63,'Can delete unidad med',16,'delete_unidadmed'),(64,'Can view unidad med',16,'view_unidadmed'),(65,'Can add solicitud analisis',17,'add_solicitudanalisis'),(66,'Can change solicitud analisis',17,'change_solicitudanalisis'),(67,'Can delete solicitud analisis',17,'delete_solicitudanalisis'),(68,'Can view solicitud analisis',17,'view_solicitudanalisis'),(69,'Can add resultados',18,'add_resultados'),(70,'Can change resultados',18,'change_resultados'),(71,'Can delete resultados',18,'delete_resultados'),(72,'Can view resultados',18,'view_resultados'),(73,'Can add historial solicitud',19,'add_historialsolicitud'),(74,'Can change historial solicitud',19,'change_historialsolicitud'),(75,'Can delete historial solicitud',19,'delete_historialsolicitud'),(76,'Can view historial solicitud',19,'view_historialsolicitud'),(77,'Can add historial estudios',20,'add_historialestudios'),(78,'Can change historial estudios',20,'change_historialestudios'),(79,'Can delete historial estudios',20,'delete_historialestudios'),(80,'Can view historial estudios',20,'view_historialestudios'),(81,'Can add u ser form',21,'add_userform'),(82,'Can change u ser form',21,'change_userform'),(83,'Can delete u ser form',21,'delete_userform'),(84,'Can view u ser form',21,'view_userform');
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
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
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
  `id` bigint NOT NULL AUTO_INCREMENT,
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
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'labquim','estadoestudio'),(8,'labquim','estadosolicitud'),(9,'labquim','estudios'),(10,'labquim','extraccionista'),(20,'labquim','historialestudios'),(19,'labquim','historialsolicitud'),(11,'labquim','medico'),(12,'labquim','metodo'),(13,'labquim','muestra'),(14,'labquim','paciente'),(18,'labquim','resultados'),(17,'labquim','solicitudanalisis'),(15,'labquim','tipodocumento'),(16,'labquim','unidadmed'),(21,'labquim','userform'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-10-28 11:36:26.785934'),(2,'auth','0001_initial','2024-10-28 11:36:28.499257'),(3,'admin','0001_initial','2024-10-28 11:36:28.859669'),(4,'admin','0002_logentry_remove_auto_add','2024-10-28 11:36:28.876880'),(5,'admin','0003_logentry_add_action_flag_choices','2024-10-28 11:36:28.891587'),(6,'contenttypes','0002_remove_content_type_name','2024-10-28 11:36:29.055054'),(7,'auth','0002_alter_permission_name_max_length','2024-10-28 11:36:29.210721'),(8,'auth','0003_alter_user_email_max_length','2024-10-28 11:36:29.254010'),(9,'auth','0004_alter_user_username_opts','2024-10-28 11:36:29.270248'),(10,'auth','0005_alter_user_last_login_null','2024-10-28 11:36:29.394972'),(11,'auth','0006_require_contenttypes_0002','2024-10-28 11:36:29.405905'),(12,'auth','0007_alter_validators_add_error_messages','2024-10-28 11:36:29.418428'),(13,'auth','0008_alter_user_username_max_length','2024-10-28 11:36:29.578279'),(14,'auth','0009_alter_user_last_name_max_length','2024-10-28 11:36:29.729350'),(15,'auth','0010_alter_group_name_max_length','2024-10-28 11:36:29.764702'),(16,'auth','0011_update_proxy_permissions','2024-10-28 11:36:29.781729'),(17,'auth','0012_alter_user_first_name_max_length','2024-10-28 11:36:29.935914'),(18,'labquim','0001_initial','2024-10-28 11:36:32.798389'),(19,'sessions','0001_initial','2024-10-28 11:36:32.895988'),(20,'labquim','0002_userform','2024-10-28 11:47:15.414758');
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
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labquim_estadoestudio`
--

DROP TABLE IF EXISTS `labquim_estadoestudio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labquim_estadoestudio` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(255) NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labquim_estadoestudio`
--

LOCK TABLES `labquim_estadoestudio` WRITE;
/*!40000 ALTER TABLE `labquim_estadoestudio` DISABLE KEYS */;
/*!40000 ALTER TABLE `labquim_estadoestudio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labquim_estadosolicitud`
--

DROP TABLE IF EXISTS `labquim_estadosolicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labquim_estadosolicitud` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(255) NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labquim_estadosolicitud`
--

LOCK TABLES `labquim_estadosolicitud` WRITE;
/*!40000 ALTER TABLE `labquim_estadosolicitud` DISABLE KEYS */;
/*!40000 ALTER TABLE `labquim_estadosolicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labquim_estudios`
--

DROP TABLE IF EXISTS `labquim_estudios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labquim_estudios` (
  `id_estudio` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `valor_minimo` double NOT NULL,
  `valor_maximo` double NOT NULL,
  `cod_unidad_med_id` int NOT NULL,
  `id_metodo_id` int NOT NULL,
  PRIMARY KEY (`id_estudio`),
  KEY `labquim_estudios_cod_unidad_med_id_2dbb95bb_fk_labquim_u` (`cod_unidad_med_id`),
  KEY `labquim_estudios_id_metodo_id_269809f9_fk_labquim_m` (`id_metodo_id`),
  CONSTRAINT `labquim_estudios_cod_unidad_med_id_2dbb95bb_fk_labquim_u` FOREIGN KEY (`cod_unidad_med_id`) REFERENCES `labquim_unidadmed` (`cod_unidad_med`),
  CONSTRAINT `labquim_estudios_id_metodo_id_269809f9_fk_labquim_m` FOREIGN KEY (`id_metodo_id`) REFERENCES `labquim_metodo` (`id_metodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labquim_estudios`
--

LOCK TABLES `labquim_estudios` WRITE;
/*!40000 ALTER TABLE `labquim_estudios` DISABLE KEYS */;
/*!40000 ALTER TABLE `labquim_estudios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labquim_extraccionista`
--

DROP TABLE IF EXISTS `labquim_extraccionista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labquim_extraccionista` (
  `id_extraccionista` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `numero_documento` int NOT NULL,
  `id_tipo_documento_id` int NOT NULL,
  PRIMARY KEY (`id_extraccionista`),
  KEY `labquim_extraccionis_id_tipo_documento_id_c0f64efd_fk_labquim_t` (`id_tipo_documento_id`),
  CONSTRAINT `labquim_extraccionis_id_tipo_documento_id_c0f64efd_fk_labquim_t` FOREIGN KEY (`id_tipo_documento_id`) REFERENCES `labquim_tipodocumento` (`id_tipo_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labquim_extraccionista`
--

LOCK TABLES `labquim_extraccionista` WRITE;
/*!40000 ALTER TABLE `labquim_extraccionista` DISABLE KEYS */;
/*!40000 ALTER TABLE `labquim_extraccionista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labquim_historialestudios`
--

DROP TABLE IF EXISTS `labquim_historialestudios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labquim_historialestudios` (
  `id_historial_estu` int NOT NULL AUTO_INCREMENT,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `id_estado_id` int NOT NULL,
  `id_estudio_id` int NOT NULL,
  PRIMARY KEY (`id_historial_estu`),
  KEY `labquim_historialest_id_estado_id_9ecc652a_fk_labquim_e` (`id_estado_id`),
  KEY `labquim_historialest_id_estudio_id_d852fb0e_fk_labquim_e` (`id_estudio_id`),
  CONSTRAINT `labquim_historialest_id_estado_id_9ecc652a_fk_labquim_e` FOREIGN KEY (`id_estado_id`) REFERENCES `labquim_estadoestudio` (`id_estado`),
  CONSTRAINT `labquim_historialest_id_estudio_id_d852fb0e_fk_labquim_e` FOREIGN KEY (`id_estudio_id`) REFERENCES `labquim_estudios` (`id_estudio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labquim_historialestudios`
--

LOCK TABLES `labquim_historialestudios` WRITE;
/*!40000 ALTER TABLE `labquim_historialestudios` DISABLE KEYS */;
/*!40000 ALTER TABLE `labquim_historialestudios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labquim_historialsolicitud`
--

DROP TABLE IF EXISTS `labquim_historialsolicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labquim_historialsolicitud` (
  `id_historial_soli` int NOT NULL AUTO_INCREMENT,
  `fecha_recepcion` date NOT NULL,
  `fecha_finalizacion` date NOT NULL,
  `fecha_receta` date NOT NULL,
  `id_estado_id` int NOT NULL,
  `id_soli_analisis_id` int NOT NULL,
  PRIMARY KEY (`id_historial_soli`),
  KEY `labquim_historialsol_id_estado_id_d33d5a3e_fk_labquim_e` (`id_estado_id`),
  KEY `labquim_historialsol_id_soli_analisis_id_b6efbf29_fk_labquim_s` (`id_soli_analisis_id`),
  CONSTRAINT `labquim_historialsol_id_estado_id_d33d5a3e_fk_labquim_e` FOREIGN KEY (`id_estado_id`) REFERENCES `labquim_estadosolicitud` (`id_estado`),
  CONSTRAINT `labquim_historialsol_id_soli_analisis_id_b6efbf29_fk_labquim_s` FOREIGN KEY (`id_soli_analisis_id`) REFERENCES `labquim_solicitudanalisis` (`id_soli_analisis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labquim_historialsolicitud`
--

LOCK TABLES `labquim_historialsolicitud` WRITE;
/*!40000 ALTER TABLE `labquim_historialsolicitud` DISABLE KEYS */;
/*!40000 ALTER TABLE `labquim_historialsolicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labquim_medico`
--

DROP TABLE IF EXISTS `labquim_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labquim_medico` (
  `id_medico` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `especializacion` varchar(255) NOT NULL,
  PRIMARY KEY (`id_medico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labquim_medico`
--

LOCK TABLES `labquim_medico` WRITE;
/*!40000 ALTER TABLE `labquim_medico` DISABLE KEYS */;
/*!40000 ALTER TABLE `labquim_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labquim_metodo`
--

DROP TABLE IF EXISTS `labquim_metodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labquim_metodo` (
  `id_metodo` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id_metodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labquim_metodo`
--

LOCK TABLES `labquim_metodo` WRITE;
/*!40000 ALTER TABLE `labquim_metodo` DISABLE KEYS */;
/*!40000 ALTER TABLE `labquim_metodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labquim_muestra`
--

DROP TABLE IF EXISTS `labquim_muestra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labquim_muestra` (
  `id_muestra` int NOT NULL AUTO_INCREMENT,
  `tipo_muestra` varchar(255) NOT NULL,
  PRIMARY KEY (`id_muestra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labquim_muestra`
--

LOCK TABLES `labquim_muestra` WRITE;
/*!40000 ALTER TABLE `labquim_muestra` DISABLE KEYS */;
/*!40000 ALTER TABLE `labquim_muestra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labquim_paciente`
--

DROP TABLE IF EXISTS `labquim_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labquim_paciente` (
  `id_paciente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `numero_documento` int NOT NULL,
  `id_tipo_documento_id` int NOT NULL,
  PRIMARY KEY (`id_paciente`),
  KEY `labquim_paciente_id_tipo_documento_id_0ab82167_fk_labquim_t` (`id_tipo_documento_id`),
  CONSTRAINT `labquim_paciente_id_tipo_documento_id_0ab82167_fk_labquim_t` FOREIGN KEY (`id_tipo_documento_id`) REFERENCES `labquim_tipodocumento` (`id_tipo_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labquim_paciente`
--

LOCK TABLES `labquim_paciente` WRITE;
/*!40000 ALTER TABLE `labquim_paciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `labquim_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labquim_resultados`
--

DROP TABLE IF EXISTS `labquim_resultados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labquim_resultados` (
  `id_resultados` int NOT NULL AUTO_INCREMENT,
  `valor_hallado` double NOT NULL,
  `observaciones` longtext NOT NULL,
  `id_estado_id` int NOT NULL,
  `id_muestra_id` int NOT NULL,
  `id_soli_analisis_id` int NOT NULL,
  PRIMARY KEY (`id_resultados`),
  KEY `labquim_resultados_id_estado_id_33eb248f_fk_labquim_e` (`id_estado_id`),
  KEY `labquim_resultados_id_muestra_id_505e1c6b_fk_labquim_m` (`id_muestra_id`),
  KEY `labquim_resultados_id_soli_analisis_id_8f900430_fk_labquim_s` (`id_soli_analisis_id`),
  CONSTRAINT `labquim_resultados_id_estado_id_33eb248f_fk_labquim_e` FOREIGN KEY (`id_estado_id`) REFERENCES `labquim_estadoestudio` (`id_estado`),
  CONSTRAINT `labquim_resultados_id_muestra_id_505e1c6b_fk_labquim_m` FOREIGN KEY (`id_muestra_id`) REFERENCES `labquim_muestra` (`id_muestra`),
  CONSTRAINT `labquim_resultados_id_soli_analisis_id_8f900430_fk_labquim_s` FOREIGN KEY (`id_soli_analisis_id`) REFERENCES `labquim_solicitudanalisis` (`id_soli_analisis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labquim_resultados`
--

LOCK TABLES `labquim_resultados` WRITE;
/*!40000 ALTER TABLE `labquim_resultados` DISABLE KEYS */;
/*!40000 ALTER TABLE `labquim_resultados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labquim_solicitudanalisis`
--

DROP TABLE IF EXISTS `labquim_solicitudanalisis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labquim_solicitudanalisis` (
  `id_soli_analisis` int NOT NULL AUTO_INCREMENT,
  `hora` time(6) NOT NULL,
  `nombre_archivo` varchar(255) NOT NULL,
  `id_extraccionista_id` int NOT NULL,
  `id_medico_id` int NOT NULL,
  `id_paciente_id` int NOT NULL,
  PRIMARY KEY (`id_soli_analisis`),
  KEY `labquim_solicitudana_id_extraccionista_id_656765be_fk_labquim_e` (`id_extraccionista_id`),
  KEY `labquim_solicitudana_id_medico_id_f896e776_fk_labquim_m` (`id_medico_id`),
  KEY `labquim_solicitudana_id_paciente_id_0fdd0310_fk_labquim_p` (`id_paciente_id`),
  CONSTRAINT `labquim_solicitudana_id_extraccionista_id_656765be_fk_labquim_e` FOREIGN KEY (`id_extraccionista_id`) REFERENCES `labquim_extraccionista` (`id_extraccionista`),
  CONSTRAINT `labquim_solicitudana_id_medico_id_f896e776_fk_labquim_m` FOREIGN KEY (`id_medico_id`) REFERENCES `labquim_medico` (`id_medico`),
  CONSTRAINT `labquim_solicitudana_id_paciente_id_0fdd0310_fk_labquim_p` FOREIGN KEY (`id_paciente_id`) REFERENCES `labquim_paciente` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labquim_solicitudanalisis`
--

LOCK TABLES `labquim_solicitudanalisis` WRITE;
/*!40000 ALTER TABLE `labquim_solicitudanalisis` DISABLE KEYS */;
/*!40000 ALTER TABLE `labquim_solicitudanalisis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labquim_tipodocumento`
--

DROP TABLE IF EXISTS `labquim_tipodocumento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labquim_tipodocumento` (
  `id_tipo_documento` int NOT NULL AUTO_INCREMENT,
  `tipo_documento` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tipo_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labquim_tipodocumento`
--

LOCK TABLES `labquim_tipodocumento` WRITE;
/*!40000 ALTER TABLE `labquim_tipodocumento` DISABLE KEYS */;
/*!40000 ALTER TABLE `labquim_tipodocumento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labquim_unidadmed`
--

DROP TABLE IF EXISTS `labquim_unidadmed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labquim_unidadmed` (
  `cod_unidad_med` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`cod_unidad_med`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labquim_unidadmed`
--

LOCK TABLES `labquim_unidadmed` WRITE;
/*!40000 ALTER TABLE `labquim_unidadmed` DISABLE KEYS */;
/*!40000 ALTER TABLE `labquim_unidadmed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labquim_userform`
--

DROP TABLE IF EXISTS `labquim_userform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labquim_userform` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dni` varchar(100) NOT NULL,
  `cap` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labquim_userform`
--

LOCK TABLES `labquim_userform` WRITE;
/*!40000 ALTER TABLE `labquim_userform` DISABLE KEYS */;
/*!40000 ALTER TABLE `labquim_userform` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-28  8:55:15
