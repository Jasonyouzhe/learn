-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: learn
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `t_files`
--

DROP TABLE IF EXISTS `t_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `file_description` varchar(200) DEFAULT NULL,
  `file_type` varchar(45) DEFAULT NULL,
  `file_path` varchar(200) DEFAULT NULL,
  `file_dzone` varchar(45) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `shrinkage_path` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_files`
--

LOCK TABLES `t_files` WRITE;
/*!40000 ALTER TABLE `t_files` DISABLE KEYS */;
INSERT INTO `t_files` VALUES (30,'2','jason','01 荧惑守心_标清','2','151179204067501 荧惑守心_标清.mp4','0','2017-11-27 22:14:06','2017-11-27 22:14:06','151179204067501 荧惑守心_标清.jpg'),(31,'2','jason','02 合纵连横_标清','2','151179213479202 合纵连横_标清.mp4','0','2017-11-27 22:15:35','2017-11-27 22:15:35','151179213479202 合纵连横_标清.jpg'),(32,'2','jason','03 妙法阴阳_标清','2','151179216530203 妙法阴阳_标清.mp4','0','2017-11-27 22:16:06','2017-11-27 22:16:06','151179216530203 妙法阴阳_标清.jpg'),(33,'2','jason','04 大梦初晓_标清','2','151179218118704 大梦初晓_标清.mp4','0','2017-11-27 22:16:22','2017-11-27 22:16:22','151179218118704 大梦初晓_标清.jpg'),(34,'2','jason','[斗破苍穹]第05集_bd','2','1511792204365[斗破苍穹]第05集_bd.mp4','0','2017-11-27 22:16:46','2017-11-27 22:16:46','1511792204365[斗破苍穹]第05集_bd.jpg');
/*!40000 ALTER TABLE `t_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_permissions`
--

DROP TABLE IF EXISTS `t_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissions_name` varchar(45) NOT NULL,
  `permissions_description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_permissions`
--

LOCK TABLES `t_permissions` WRITE;
/*!40000 ALTER TABLE `t_permissions` DISABLE KEYS */;
INSERT INTO `t_permissions` VALUES (1,'user:create','创建'),(2,'user:delete','删除'),(3,'user:update','更新'),(4,'user:select','查询');
/*!40000 ALTER TABLE `t_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role`
--

DROP TABLE IF EXISTS `t_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) NOT NULL,
  `role_description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role`
--

LOCK TABLES `t_role` WRITE;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
INSERT INTO `t_role` VALUES (1,'admin','admin'),(2,'manage','管理员'),(3,'user','普通用户');
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role_permissions`
--

DROP TABLE IF EXISTS `t_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(45) NOT NULL,
  `permissions_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role_permissions`
--

LOCK TABLES `t_role_permissions` WRITE;
/*!40000 ALTER TABLE `t_role_permissions` DISABLE KEYS */;
INSERT INTO `t_role_permissions` VALUES (1,'1','1'),(2,'1','2'),(3,'1','3'),(4,'1','4'),(5,'2','1'),(6,'2','3'),(7,'2','4'),(8,'3','1');
/*!40000 ALTER TABLE `t_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `photo_path` varchar(45) DEFAULT NULL,
  `user_dzone` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'No.1','admin','123','../resources/image/photo.jpg',0),(2,'No.2','jason','123',NULL,0),(3,'No.3','jack','123',NULL,0),(6,'No.4','june','123qwe',NULL,0),(8,'No.5','app','123qwe',NULL,0),(12,'No.6','babay','123qwe',NULL,0),(13,'No.7','dav','123qwe',NULL,0),(14,'No.8','tony','123qwe',NULL,0),(15,'No.9','grren','123qwe',NULL,0),(16,'No.10','user','123qwe',NULL,0),(17,'No.10','hony','123qwe',NULL,0),(18,'No.10','teer','123qwe',NULL,1),(19,'No.10','tom','123qwe',NULL,0),(20,'No.11','keer','123qwe',NULL,0),(21,'No.12','张三123','123qwe',NULL,0);
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_role`
--

DROP TABLE IF EXISTS `t_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) NOT NULL,
  `role_id` varchar(45) NOT NULL DEFAULT '3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_role`
--

LOCK TABLES `t_user_role` WRITE;
/*!40000 ALTER TABLE `t_user_role` DISABLE KEYS */;
INSERT INTO `t_user_role` VALUES (1,'1','1'),(2,'2','2'),(3,'3','3'),(4,'6','3'),(5,'8','3'),(8,'12','3'),(9,'13','3'),(10,'14','3'),(11,'15','3'),(12,'16','3'),(13,'17','3'),(14,'18','3'),(15,'19','3'),(16,'20','3'),(17,'21','3');
/*!40000 ALTER TABLE `t_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-29 15:44:57
