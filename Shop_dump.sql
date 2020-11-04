-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `catalogs`
--

DROP TABLE IF EXISTS `catalogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'Название раздела',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `unique_name` (`name`(10))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Разделы интернет-магазина';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogs`
--

LOCK TABLES `catalogs` WRITE;
/*!40000 ALTER TABLE `catalogs` DISABLE KEYS */;
INSERT INTO `catalogs` VALUES (1,'Процессоры'),(2,'Материнские платы'),(3,'Видеокарты'),(4,'Жесткие диски'),(5,'Оперативная память'),(6,'Блок питания');
/*!40000 ALTER TABLE `catalogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` int unsigned NOT NULL,
  `Lable` varchar(255) NOT NULL,
  `Russian_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Moskow','Москва'),(2,'Amsterdam','Амстердам'),(3,'Berlin','Берлин'),(4,'Chicago','Чикаго'),(5,'Kiev','Киев'),(6,'Beijing','Пекин'),(7,'Barcelona','Барселона'),(8,'Budapest','Будапешт'),(9,'Dublin','Дублин'),(10,'Lisbon','Лиссабон');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `discount` float unsigned DEFAULT NULL COMMENT 'Величина скидки от 0.0 до 1.0',
  `started_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `index_of_user_id` (`user_id`),
  KEY `index_of_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Скидки';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flights` (
  `id` int NOT NULL AUTO_INCREMENT,
  `from` varchar(255) NOT NULL,
  `to` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flights`
--

LOCK TABLES `flights` WRITE;
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
INSERT INTO `flights` VALUES (1,'Moskow','Berlin'),(2,'Amsterdam','Barcelona'),(3,'Beijing','Budapest'),(4,'Chicago','Dublin'),(5,'Kiev','Lisbon');
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `created_at` datetime NOT NULL,
  `table_name` varchar(45) NOT NULL,
  `str_id` bigint NOT NULL,
  `name_value` varchar(45) NOT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES ('2020-11-02 20:34:00','products',8,'Intel Core i7-9100'),('2020-11-02 20:50:09','users',7,'Вавилов'),('2020-11-02 20:51:04','catalogs',6,'Блок питания');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `index_of_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Заказы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,2,'2020-10-18 19:55:15','2020-10-18 19:55:15'),(2,3,'2020-10-18 19:55:15','2020-10-18 19:55:15'),(3,4,'2020-10-18 19:55:15','2020-10-18 19:55:15'),(4,5,'2020-10-18 19:55:15','2020-10-18 19:55:15'),(5,2,'2020-10-18 19:55:15','2020-10-18 19:55:15');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products`
--

DROP TABLE IF EXISTS `orders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `total` int unsigned DEFAULT '1' COMMENT 'Количество заказанных товарных позиций',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Состав заказа';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products`
--

LOCK TABLES `orders_products` WRITE;
/*!40000 ALTER TABLE `orders_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'Название',
  `description` text COMMENT 'Описание',
  `price` decimal(11,2) DEFAULT NULL COMMENT 'Цена',
  `catalog_id` int unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `index_of_catalog_id` (`catalog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Товарные позиции';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Intel Core i3-8100','Процессор для настольных персональных компьютеров, основанных на платформе Intel.',7890.00,1,'2020-10-18 19:07:52','2020-10-18 19:07:52'),(2,'Intel Core i5-7400','Процессор для настольных персональных компьютеров, основанных на платформе Intel.',12700.00,1,'2020-10-18 19:07:52','2020-10-18 19:07:52'),(3,'AMD FX-8320E','Процессор для настольных персональных компьютеров, основанных на платформе AMD.',4780.00,1,'2020-10-18 19:07:52','2020-10-18 19:07:52'),(4,'AMD FX-8320','Процессор для настольных персональных компьютеров, основанных на платформе AMD.',7120.00,1,'2020-10-18 19:07:52','2020-10-18 19:07:52'),(5,'ASUS ROG MAXIMUS X HERO','Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX',19310.00,2,'2020-10-18 19:07:52','2020-10-18 19:07:52'),(6,'Gigabyte H310M S2H','Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX',4790.00,2,'2020-10-18 19:07:52','2020-10-18 19:07:52'),(7,'MSI B250M GAMING PRO','Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX',5060.00,2,'2020-10-18 19:07:52','2020-10-18 19:07:52'),(8,'Intel Core i7-9100','Процессор для настольных персональных компьютеров, основанных на платформе Intel.',15000.00,1,'2020-11-02 20:34:00','2020-11-02 20:34:00');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storehouses`
--

DROP TABLE IF EXISTS `storehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storehouses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'Название',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Склады';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouses`
--

LOCK TABLES `storehouses` WRITE;
/*!40000 ALTER TABLE `storehouses` DISABLE KEYS */;
/*!40000 ALTER TABLE `storehouses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storehouses_products`
--

DROP TABLE IF EXISTS `storehouses_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storehouses_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `storehouse_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `value` int unsigned DEFAULT NULL COMMENT 'Запас товарной позиции на складе',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Запасы на складе';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouses_products`
--

LOCK TABLES `storehouses_products` WRITE;
/*!40000 ALTER TABLE `storehouses_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `storehouses_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Имя покупателя',
  `lastname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `birthday_at` date DEFAULT NULL COMMENT 'Дата рождения',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_ru_0900_ai_ci COMMENT='Покупатели';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Геннадий','Иванов','1990-10-05','2020-10-18 19:07:51','2020-10-18 19:48:49'),(2,'Наталья','Петрова','1984-11-12','2020-10-18 19:07:51','2020-10-18 19:48:49'),(3,'Александр','Зубкин','1985-05-20','2020-10-18 19:07:51','2020-10-18 19:48:49'),(4,'Сергей','Пупкин','1988-02-14','2020-10-18 19:07:51','2020-10-18 19:48:49'),(5,'Иван','Миронов','1998-01-12','2020-10-18 19:07:51','2020-10-18 19:48:49'),(6,'Мария','Путина','1992-08-29','2020-10-18 19:07:51','2020-10-18 19:48:49'),(7,'Григорий','Вавилов','1989-09-01','2020-11-02 20:50:09','2020-11-02 20:50:09');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_for_test_million`
--

DROP TABLE IF EXISTS `users_for_test_million`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_for_test_million` (
  `id` bigint NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `birthday_at` date DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_for_test_million`
--

LOCK TABLES `users_for_test_million` WRITE;
/*!40000 ALTER TABLE `users_for_test_million` DISABLE KEYS */;
INSERT INTO `users_for_test_million` VALUES (1,'firstname_1','lastname_1','2020-11-02','2020-11-02 21:11:07','2020-11-02 21:11:07'),(2,'firstname_2','lastname_2','2020-11-02','2020-11-02 21:11:07','2020-11-02 21:11:07'),(3,'firstname_3','lastname_3','2020-11-02','2020-11-02 21:11:07','2020-11-02 21:11:07'),(4,'firstname_4','lastname_4','2020-11-02','2020-11-02 21:11:07','2020-11-02 21:11:07'),(5,'firstname_5','lastname_5','2020-11-02','2020-11-02 21:11:07','2020-11-02 21:11:07'),(6,'firstname_6','lastname_6','2020-11-02','2020-11-02 21:11:07','2020-11-02 21:11:07'),(7,'firstname_7','lastname_7','2020-11-02','2020-11-02 21:11:07','2020-11-02 21:11:07'),(8,'firstname_8','lastname_8','2020-11-02','2020-11-02 21:11:07','2020-11-02 21:11:07'),(9,'firstname_9','lastname_9','2020-11-02','2020-11-02 21:11:07','2020-11-02 21:11:07'),(10,'firstname_10','lastname_10','2020-11-02','2020-11-02 21:11:07','2020-11-02 21:11:07'),(11,'firstname_11','lastname_11','2020-11-02','2020-11-02 21:11:07','2020-11-02 21:11:07'),(12,'firstname_12','lastname_12','2020-11-02','2020-11-02 21:11:07','2020-11-02 21:11:07'),(13,'firstname_13','lastname_13','2020-11-02','2020-11-02 21:11:07','2020-11-02 21:11:07'),(14,'firstname_14','lastname_14','2020-11-02','2020-11-02 21:11:07','2020-11-02 21:11:07'),(15,'firstname_15','lastname_15','2020-11-02','2020-11-02 21:11:07','2020-11-02 21:11:07'),(16,'firstname_16','lastname_16','2020-11-02','2020-11-02 21:11:07','2020-11-02 21:11:07'),(17,'firstname_17','lastname_17','2020-11-02','2020-11-02 21:11:07','2020-11-02 21:11:07'),(18,'firstname_18','lastname_18','2020-11-02','2020-11-02 21:11:07','2020-11-02 21:11:07'),(19,'firstname_19','lastname_19','2020-11-02','2020-11-02 21:11:07','2020-11-02 21:11:07'),(20,'firstname_20','lastname_20','2020-11-02','2020-11-02 21:11:07','2020-11-02 21:11:07'),(21,'firstname_21','lastname_21','2020-11-02','2020-11-02 21:11:07','2020-11-02 21:11:07'),(22,'firstname_22','lastname_22','2020-11-02','2020-11-02 21:11:07','2020-11-02 21:11:07'),(23,'firstname_23','lastname_23','2020-11-02','2020-11-02 21:11:07','2020-11-02 21:11:07'),(24,'firstname_24','lastname_24','2020-11-02','2020-11-02 21:11:07','2020-11-02 21:11:07'),(25,'firstname_25','lastname_25','2020-11-02','2020-11-02 21:11:07','2020-11-02 21:11:07'),(26,'firstname_26','lastname_26','2020-11-02','2020-11-02 21:11:07','2020-11-02 21:11:07'),(27,'firstname_27','lastname_27','2020-11-02','2020-11-02 21:11:07','2020-11-02 21:11:07'),(28,'firstname_28','lastname_28','2020-11-02','2020-11-02 21:11:08','2020-11-02 21:11:08'),(29,'firstname_29','lastname_29','2020-11-02','2020-11-02 21:11:08','2020-11-02 21:11:08'),(30,'firstname_30','lastname_30','2020-11-02','2020-11-02 21:11:08','2020-11-02 21:11:08'),(31,'firstname_31','lastname_31','2020-11-02','2020-11-02 21:11:08','2020-11-02 21:11:08'),(32,'firstname_32','lastname_32','2020-11-02','2020-11-02 21:11:08','2020-11-02 21:11:08'),(33,'firstname_33','lastname_33','2020-11-02','2020-11-02 21:11:08','2020-11-02 21:11:08'),(34,'firstname_34','lastname_34','2020-11-02','2020-11-02 21:11:08','2020-11-02 21:11:08'),(35,'firstname_35','lastname_35','2020-11-02','2020-11-02 21:11:08','2020-11-02 21:11:08'),(36,'firstname_36','lastname_36','2020-11-02','2020-11-02 21:11:08','2020-11-02 21:11:08'),(37,'firstname_37','lastname_37','2020-11-02','2020-11-02 21:11:08','2020-11-02 21:11:08'),(38,'firstname_38','lastname_38','2020-11-02','2020-11-02 21:11:08','2020-11-02 21:11:08'),(39,'firstname_39','lastname_39','2020-11-02','2020-11-02 21:11:08','2020-11-02 21:11:08'),(40,'firstname_40','lastname_40','2020-11-02','2020-11-02 21:11:08','2020-11-02 21:11:08'),(41,'firstname_41','lastname_41','2020-11-02','2020-11-02 21:11:08','2020-11-02 21:11:08'),(42,'firstname_42','lastname_42','2020-11-02','2020-11-02 21:11:08','2020-11-02 21:11:08'),(43,'firstname_43','lastname_43','2020-11-02','2020-11-02 21:11:08','2020-11-02 21:11:08'),(44,'firstname_44','lastname_44','2020-11-02','2020-11-02 21:11:08','2020-11-02 21:11:08'),(45,'firstname_45','lastname_45','2020-11-02','2020-11-02 21:11:08','2020-11-02 21:11:08'),(46,'firstname_46','lastname_46','2020-11-02','2020-11-02 21:11:08','2020-11-02 21:11:08'),(47,'firstname_47','lastname_47','2020-11-02','2020-11-02 21:11:08','2020-11-02 21:11:08'),(48,'firstname_48','lastname_48','2020-11-02','2020-11-02 21:11:08','2020-11-02 21:11:08'),(49,'firstname_49','lastname_49','2020-11-02','2020-11-02 21:11:08','2020-11-02 21:11:08'),(50,'firstname_50','lastname_50','2020-11-02','2020-11-02 21:11:08','2020-11-02 21:11:08'),(51,'firstname_51','lastname_51','2020-11-02','2020-11-02 21:11:08','2020-11-02 21:11:08'),(52,'firstname_52','lastname_52','2020-11-02','2020-11-02 21:11:08','2020-11-02 21:11:08'),(53,'firstname_53','lastname_53','2020-11-02','2020-11-02 21:11:09','2020-11-02 21:11:09'),(54,'firstname_54','lastname_54','2020-11-02','2020-11-02 21:11:09','2020-11-02 21:11:09'),(55,'firstname_55','lastname_55','2020-11-02','2020-11-02 21:11:09','2020-11-02 21:11:09'),(56,'firstname_56','lastname_56','2020-11-02','2020-11-02 21:11:09','2020-11-02 21:11:09'),(57,'firstname_57','lastname_57','2020-11-02','2020-11-02 21:11:09','2020-11-02 21:11:09'),(58,'firstname_58','lastname_58','2020-11-02','2020-11-02 21:11:09','2020-11-02 21:11:09'),(59,'firstname_59','lastname_59','2020-11-02','2020-11-02 21:11:09','2020-11-02 21:11:09'),(60,'firstname_60','lastname_60','2020-11-02','2020-11-02 21:11:09','2020-11-02 21:11:09'),(61,'firstname_61','lastname_61','2020-11-02','2020-11-02 21:11:09','2020-11-02 21:11:09'),(62,'firstname_62','lastname_62','2020-11-02','2020-11-02 21:11:09','2020-11-02 21:11:09'),(63,'firstname_63','lastname_63','2020-11-02','2020-11-02 21:11:09','2020-11-02 21:11:09'),(64,'firstname_64','lastname_64','2020-11-02','2020-11-02 21:11:09','2020-11-02 21:11:09'),(65,'firstname_65','lastname_65','2020-11-02','2020-11-02 21:11:09','2020-11-02 21:11:09'),(66,'firstname_66','lastname_66','2020-11-02','2020-11-02 21:11:09','2020-11-02 21:11:09'),(67,'firstname_67','lastname_67','2020-11-02','2020-11-02 21:11:09','2020-11-02 21:11:09'),(68,'firstname_68','lastname_68','2020-11-02','2020-11-02 21:11:09','2020-11-02 21:11:09'),(69,'firstname_69','lastname_69','2020-11-02','2020-11-02 21:11:09','2020-11-02 21:11:09'),(70,'firstname_70','lastname_70','2020-11-02','2020-11-02 21:11:09','2020-11-02 21:11:09'),(71,'firstname_71','lastname_71','2020-11-02','2020-11-02 21:11:09','2020-11-02 21:11:09'),(72,'firstname_72','lastname_72','2020-11-02','2020-11-02 21:11:09','2020-11-02 21:11:09'),(73,'firstname_73','lastname_73','2020-11-02','2020-11-02 21:11:09','2020-11-02 21:11:09'),(74,'firstname_74','lastname_74','2020-11-02','2020-11-02 21:11:09','2020-11-02 21:11:09'),(75,'firstname_75','lastname_75','2020-11-02','2020-11-02 21:11:09','2020-11-02 21:11:09'),(76,'firstname_76','lastname_76','2020-11-02','2020-11-02 21:11:09','2020-11-02 21:11:09'),(77,'firstname_77','lastname_77','2020-11-02','2020-11-02 21:11:09','2020-11-02 21:11:09'),(78,'firstname_78','lastname_78','2020-11-02','2020-11-02 21:11:09','2020-11-02 21:11:09'),(79,'firstname_79','lastname_79','2020-11-02','2020-11-02 21:11:09','2020-11-02 21:11:09'),(80,'firstname_80','lastname_80','2020-11-02','2020-11-02 21:11:09','2020-11-02 21:11:09'),(81,'firstname_81','lastname_81','2020-11-02','2020-11-02 21:11:09','2020-11-02 21:11:09'),(82,'firstname_82','lastname_82','2020-11-02','2020-11-02 21:11:10','2020-11-02 21:11:10'),(83,'firstname_83','lastname_83','2020-11-02','2020-11-02 21:11:10','2020-11-02 21:11:10'),(84,'firstname_84','lastname_84','2020-11-02','2020-11-02 21:11:10','2020-11-02 21:11:10'),(85,'firstname_85','lastname_85','2020-11-02','2020-11-02 21:11:10','2020-11-02 21:11:10'),(86,'firstname_86','lastname_86','2020-11-02','2020-11-02 21:11:10','2020-11-02 21:11:10'),(87,'firstname_87','lastname_87','2020-11-02','2020-11-02 21:11:10','2020-11-02 21:11:10'),(88,'firstname_88','lastname_88','2020-11-02','2020-11-02 21:11:10','2020-11-02 21:11:10'),(89,'firstname_89','lastname_89','2020-11-02','2020-11-02 21:11:10','2020-11-02 21:11:10'),(90,'firstname_90','lastname_90','2020-11-02','2020-11-02 21:11:10','2020-11-02 21:11:10'),(91,'firstname_91','lastname_91','2020-11-02','2020-11-02 21:11:10','2020-11-02 21:11:10'),(92,'firstname_92','lastname_92','2020-11-02','2020-11-02 21:11:10','2020-11-02 21:11:10'),(93,'firstname_93','lastname_93','2020-11-02','2020-11-02 21:11:10','2020-11-02 21:11:10'),(94,'firstname_94','lastname_94','2020-11-02','2020-11-02 21:11:10','2020-11-02 21:11:10'),(95,'firstname_95','lastname_95','2020-11-02','2020-11-02 21:11:10','2020-11-02 21:11:10'),(96,'firstname_96','lastname_96','2020-11-02','2020-11-02 21:11:10','2020-11-02 21:11:10'),(97,'firstname_97','lastname_97','2020-11-02','2020-11-02 21:11:10','2020-11-02 21:11:10'),(98,'firstname_98','lastname_98','2020-11-02','2020-11-02 21:11:10','2020-11-02 21:11:10'),(99,'firstname_99','lastname_99','2020-11-02','2020-11-02 21:11:10','2020-11-02 21:11:10'),(100,'firstname_100','lastname_100','2020-11-02','2020-11-02 21:11:10','2020-11-02 21:11:10');
/*!40000 ALTER TABLE `users_for_test_million` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-02 21:12:08
