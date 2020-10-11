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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Разделы интернет-магазина';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogs`
--

LOCK TABLES `catalogs` WRITE;
/*!40000 ALTER TABLE `catalogs` DISABLE KEYS */;
INSERT INTO `catalogs` VALUES (1,'Процессоры'),(2,'Материнские платы'),(3,'Видеокарты'),(4,'Жесткие диски'),(5,'Оперативная память'),(6,'natus'),(7,'sunt'),(8,'distinctio'),(9,'blanditiis'),(10,'voluptatum'),(11,'voluptatibus'),(12,'enim'),(13,'non'),(14,'voluptatem'),(15,'molestiae');
/*!40000 ALTER TABLE `catalogs` ENABLE KEYS */;
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
-- Table structure for table `distances`
--

DROP TABLE IF EXISTS `distances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distances` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `a` json NOT NULL,
  `b` json NOT NULL,
  `distance` double GENERATED ALWAYS AS (sqrt((pow((json_unquote(json_extract(`a`,_utf8mb4'$.x')) - json_unquote(json_extract(`b`,_utf8mb4'$.x'))),2) + pow((json_unquote(json_extract(`a`,_utf8mb4'$.y')) - json_unquote(json_extract(`b`,_utf8mb4'$.y'))),2)))) VIRTUAL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Расстояние между двумя точками';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distances`
--

LOCK TABLES `distances` WRITE;
/*!40000 ALTER TABLE `distances` DISABLE KEYS */;
INSERT INTO `distances` (`id`, `a`, `b`) VALUES (1,'{\"x\": 1, \"y\": 1}','{\"x\": 4, \"y\": 5}'),(2,'{\"x\": 4, \"y\": -1}','{\"x\": 3, \"y\": 2}'),(3,'{\"x\": -2, \"y\": 5}','{\"x\": 1, \"y\": 3}');
/*!40000 ALTER TABLE `distances` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Заказы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,7,'2002-08-08 18:10:56','2000-03-05 11:08:55'),(2,8,'1993-08-24 22:38:33','2007-12-18 21:35:32'),(3,9,'1988-04-03 12:26:38','1998-05-26 18:59:26'),(4,10,'2015-11-12 12:09:23','1986-08-07 13:34:01'),(5,11,'2016-10-23 12:50:06','2014-01-10 12:47:06'),(6,12,'2002-09-18 06:06:52','1970-02-19 13:52:55'),(7,13,'1979-09-01 23:36:53','1982-01-22 02:21:29'),(8,14,'2001-10-10 15:16:57','2008-09-16 09:50:11'),(9,15,'1987-11-23 19:56:28','1984-04-22 14:52:37'),(10,16,'2020-05-03 05:23:23','1977-01-28 00:28:31'),(11,17,'2007-10-22 11:35:42','1992-04-01 14:03:56'),(12,18,'1981-09-15 01:58:57','2002-11-28 04:43:11'),(13,19,'1973-02-24 15:51:10','1973-12-30 18:09:44'),(14,20,'1983-08-27 01:58:13','2000-10-01 00:33:06'),(15,21,'2017-08-01 04:18:57','1984-10-18 07:13:38'),(16,22,'1991-11-03 20:41:37','1986-06-06 01:58:25'),(17,23,'2020-01-24 21:08:24','2012-07-23 17:20:26'),(18,24,'2018-02-21 10:48:27','1980-07-17 18:15:07'),(19,25,'2019-09-15 15:52:22','1989-08-13 13:13:04'),(20,26,'1970-04-20 16:54:16','1989-07-07 20:02:27'),(21,27,'2017-02-09 06:36:21','1982-08-07 20:55:23'),(22,28,'1990-12-09 18:47:33','1986-09-08 20:49:40'),(23,29,'2010-04-26 23:00:18','1984-08-10 06:50:00'),(24,30,'2015-11-23 03:03:39','1995-01-12 01:11:15'),(25,31,'2010-01-26 15:15:31','1979-03-06 12:03:02'),(26,32,'2013-02-22 02:17:12','2013-08-24 14:16:14'),(27,33,'2011-05-31 00:38:38','1977-06-22 03:53:57'),(28,34,'1984-10-03 20:13:53','1970-05-27 10:39:08'),(29,35,'1984-10-25 04:43:30','1976-06-14 00:13:38'),(30,36,'1977-06-10 13:59:22','1978-07-13 19:19:57'),(31,37,'2016-10-30 05:59:13','2016-07-22 21:48:51'),(32,38,'1974-11-06 15:33:38','1980-03-04 17:55:28'),(33,39,'1991-02-04 18:31:59','1978-11-28 07:27:19'),(34,40,'1978-04-28 16:16:16','1975-05-03 12:10:32'),(35,41,'1993-11-30 19:59:02','1973-02-01 21:03:14'),(36,42,'1971-06-14 09:32:10','2001-11-10 19:33:21'),(37,43,'2016-12-02 10:53:24','1997-09-30 14:32:26'),(38,44,'2001-07-27 07:49:40','1986-11-22 23:26:00'),(39,45,'1984-08-30 02:15:27','2003-04-07 03:08:58'),(40,46,'1990-08-18 15:37:16','1978-02-25 17:46:00'),(41,47,'2000-11-14 19:50:54','1971-09-28 02:37:24'),(42,48,'2000-05-16 18:46:54','1983-09-04 12:13:59'),(43,49,'2005-06-16 07:32:01','1973-06-22 23:16:59'),(44,50,'2020-04-04 09:44:58','2019-08-18 17:40:03'),(45,51,'2010-07-24 16:08:55','1980-10-23 14:38:56'),(46,52,'1996-08-14 11:46:12','2018-04-08 05:51:47'),(47,53,'2000-11-28 03:22:02','2012-04-07 09:36:42'),(48,54,'1986-07-14 00:50:13','2020-02-18 14:26:05'),(49,55,'2012-02-16 02:12:14','2010-10-30 11:24:57'),(50,56,'2017-08-13 16:21:42','1971-11-06 05:52:11');
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Товарные позиции';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Intel Core i3-8100','Процессор для настольных персональных компьютеров, основанных на платформе Intel.',7890.00,1,'2020-10-07 21:43:17','2020-10-07 21:43:17'),(2,'Intel Core i5-7400','Процессор для настольных персональных компьютеров, основанных на платформе Intel.',12700.00,1,'2020-10-07 21:43:17','2020-10-07 21:43:17'),(3,'AMD FX-8320E','Процессор для настольных персональных компьютеров, основанных на платформе AMD.',4780.00,1,'2020-10-07 21:43:17','2020-10-07 21:43:17'),(4,'AMD FX-8320','Процессор для настольных персональных компьютеров, основанных на платформе AMD.',7120.00,1,'2020-10-07 21:43:17','2020-10-07 21:43:17'),(5,'ASUS ROG MAXIMUS X HERO','Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX',19310.00,2,'2020-10-07 21:43:17','2020-10-07 21:43:17'),(6,'Gigabyte H310M S2H','Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX',4790.00,2,'2020-10-07 21:43:17','2020-10-07 21:43:17'),(7,'MSI B250M GAMING PRO','Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX',5060.00,2,'2020-10-07 21:43:17','2020-10-07 21:43:17'),(8,'maxime','Id omnis qui labore modi aperiam saepe. Quod sit placeat officiis repellat sed ut magnam. Eos dolore incidunt sit.',16226.00,13,'1987-08-06 07:10:25','1980-09-26 14:22:40'),(9,'et','Ipsam eligendi quisquam eligendi esse recusandae excepturi et incidunt. Ut repudiandae eligendi fuga dolore sit. Nostrum culpa nesciunt distinctio culpa numquam aliquam.',11701.00,14,'2011-03-30 01:52:29','2018-02-07 02:04:25'),(10,'corrupti','Quibusdam et sequi mollitia quidem dolor. Et eum aut dolor eum labore voluptatibus. Praesentium est rem et aut aut recusandae. Vel fuga non assumenda omnis mollitia nisi. Dignissimos sunt deleniti quia voluptatem cumque iure vero.',6796.00,15,'2000-12-16 07:27:14','1988-04-14 12:23:42'),(11,'cum','Consequatur mollitia excepturi laudantium velit minima tempore explicabo iste. Dolores autem voluptates sit. Dolorum rem id mollitia maxime voluptatem maxime nam. Et a dolor dolor perspiciatis ducimus.',12542.00,6,'2018-09-18 19:15:04','1970-12-18 11:17:35'),(12,'nesciunt','Eum eum non esse ipsa. Ex eius tempore ad hic.',8240.00,7,'1991-10-25 07:09:28','2020-09-20 22:35:58'),(13,'quo','Quidem ab possimus eligendi doloremque soluta. Atque et inventore saepe qui odio. Cum non sed nobis ut animi totam.',11438.00,8,'1978-02-07 00:44:37','1973-01-10 05:14:37'),(14,'velit','Unde aliquid minima nisi assumenda ut. Alias quisquam natus quas sint laboriosam. Error dolore quia est quia autem vitae quaerat est.',18215.00,9,'1993-10-01 08:02:10','1982-02-16 22:19:36'),(15,'eum','Provident maxime perferendis commodi earum reiciendis incidunt molestiae. Laudantium reiciendis illum et necessitatibus omnis iure. Aut quidem consequuntur rerum qui et libero occaecati laborum.',8101.00,10,'1971-02-01 04:11:25','1974-09-09 15:01:24'),(16,'sit','Debitis in in vitae debitis officia sequi occaecati. Debitis minima temporibus blanditiis cumque. Voluptates molestias ut ab aut eveniet. Quasi iure quod ratione dolore.',11268.00,11,'2006-07-18 18:23:44','1976-11-07 10:07:26'),(17,'totam','Non perferendis quae maxime impedit rerum animi. Nihil excepturi earum tempora et. Illo necessitatibus quos est ut facilis.',12008.00,12,'1971-02-11 09:21:48','1993-01-10 11:45:22'),(18,'asperiores','Praesentium soluta est cumque deleniti suscipit. Corporis ut libero error est et porro eveniet.',2452.00,13,'1989-07-03 16:09:48','2001-09-20 18:36:42'),(19,'sapiente','Qui vero aut distinctio soluta nihil voluptatum sunt. Facere fuga et aut fuga inventore debitis rerum.',1784.00,14,'1990-10-29 06:52:40','2017-11-10 13:17:07'),(20,'tempore','Aut aliquam culpa ea sunt. Dignissimos est quidem optio suscipit qui dolore ut. Et repudiandae animi dolor natus aliquam qui neque atque.',14884.00,15,'1998-01-31 04:01:17','2001-05-23 04:41:22'),(21,'soluta','Eius omnis enim et eos sequi. Eum illum ea voluptates qui et.',19180.00,6,'1978-05-04 19:45:46','1978-05-27 16:30:56'),(22,'consequatur','Illo eos voluptatem quidem repellat et nihil fugiat. Ut nam id quisquam consequatur ut hic excepturi sunt. Eligendi iure et architecto consequatur possimus natus hic. Et consequatur labore impedit enim quis occaecati.',3813.00,7,'2009-06-09 06:03:30','2006-03-22 04:21:41'),(23,'quis','Aliquam minima excepturi doloribus aut ut quasi doloremque. Minus praesentium blanditiis quis velit consequatur. Ex ut qui vero quibusdam soluta. Dolorem provident aliquam ut ducimus et deserunt placeat aut.',3731.00,8,'1982-08-02 06:40:58','1986-05-05 15:34:06'),(24,'et','Explicabo ut officia maxime et ipsa numquam. Repudiandae sint dolorem reprehenderit voluptatem officia consequatur voluptatibus quidem. Et autem voluptatem iusto unde pariatur aut laboriosam. Velit temporibus reprehenderit vero ut iusto ad magnam. Inventore eligendi atque nulla corporis dolorum.',4956.00,9,'1988-09-17 20:18:29','1982-08-16 05:43:57'),(25,'dolorem','Excepturi architecto praesentium omnis. Repellendus consequatur rerum eaque quia perspiciatis quaerat. Velit in sint sint dolor nobis. Saepe repellendus accusamus molestiae.',5494.00,10,'1980-07-22 06:21:39','1971-02-21 19:04:54'),(26,'beatae','Possimus aut dolores libero ullam sed accusantium reiciendis. Quo qui et eveniet porro nostrum. Officia quo quas vel dolor est error cumque quos.',1695.00,11,'1979-04-05 10:51:44','2004-07-23 01:11:29'),(27,'est','Culpa quasi odit sit esse. Facere qui tempore autem aut repellendus dolor. Voluptas reiciendis in magnam. Doloremque et fugiat est vero voluptas ratione.',5894.00,12,'1970-11-17 20:57:14','1974-01-18 15:57:33'),(28,'deserunt','Eius eum quidem accusantium deleniti quia. Qui nisi qui aut.',6555.00,13,'1990-09-02 06:30:17','1971-07-19 04:17:28'),(29,'neque','Sed laborum inventore ratione nam quo. Officiis quaerat omnis voluptas. Iure quasi fugiat id velit et provident voluptates. Debitis voluptas quae qui eum modi a. Quis porro nemo impedit est.',4648.00,14,'2012-08-03 09:32:36','2006-07-19 10:43:19'),(30,'sit','Distinctio et voluptatem minus quis quia explicabo. Qui distinctio nam dolore iusto. Fugiat maxime harum repudiandae. Est iste qui perspiciatis dolor id eaque.',11528.00,15,'2019-02-28 14:43:53','2019-08-20 12:03:28'),(31,'ut','Vel molestiae aliquam corporis earum voluptas minima omnis. Repellendus perspiciatis aperiam provident autem dignissimos voluptatem. Ut at ut molestiae qui voluptatem aut.',16348.00,6,'1982-05-08 22:37:16','1978-09-11 16:06:15'),(32,'laboriosam','Nulla enim est qui fuga illum qui aut. Sunt accusamus neque distinctio occaecati voluptatibus aliquam voluptatem. Quod libero quas quia. Dolorem laudantium quisquam eos quidem placeat.',2748.00,7,'2005-07-15 12:29:00','1996-08-15 23:05:14'),(33,'officiis','Quia dolor quisquam vel nostrum ut. Vel cupiditate tenetur quisquam quaerat aut quo nulla quam. Reprehenderit quod quasi nobis culpa nostrum. Et nisi suscipit blanditiis voluptatem consequatur quod nemo.',7005.00,8,'1981-10-27 09:21:54','2020-08-29 23:57:37'),(34,'et','Culpa adipisci sed non eum sapiente. Nesciunt voluptate expedita non sed.',14282.00,9,'1975-12-01 07:47:59','2001-09-16 21:50:05'),(35,'non','Culpa et est dolorem inventore sapiente. Aspernatur culpa perferendis id natus cumque. Harum enim incidunt voluptatem qui quia. Et sed molestias iusto illo illum in rerum.',10865.00,10,'2001-01-20 11:43:05','2002-04-03 05:35:04'),(36,'quo','Magnam et eos repellat corporis et. Reprehenderit molestias vero sed rerum perferendis minima. Quo et officiis optio sunt. Voluptates sed omnis blanditiis quam at consectetur voluptatibus.',10134.00,11,'1979-11-18 14:04:31','1987-05-03 11:23:45'),(37,'aut','Perspiciatis sequi iste nesciunt inventore veniam itaque. Modi quam saepe inventore est fugiat. Distinctio rerum atque debitis delectus.',3310.00,12,'1983-11-29 12:40:18','1990-10-14 12:31:18'),(38,'blanditiis','Sit vel earum nihil at dolores fugit dolores. Quasi assumenda inventore dolore consectetur maxime vel atque. Repudiandae harum quo ea. Numquam nihil maiores delectus ab ut sed.',3357.00,13,'1981-08-13 15:42:18','1991-10-27 15:16:09'),(39,'nihil','Eaque qui voluptas debitis fugit ducimus sed ut. Quo est quia optio nesciunt iure aliquid maxime consequatur. Odit sunt consequatur sit maxime est blanditiis.',4393.00,14,'1994-01-10 15:30:55','1999-07-14 21:26:18'),(40,'perspiciatis','Voluptatem maiores fugiat ut sit ut rerum. Aut officiis consequatur dolor rerum est in. Nostrum et quisquam repudiandae sunt exercitationem eos. Blanditiis quod repellat ipsa dolorem. Fugiat ea consequatur veniam natus.',3819.00,15,'1977-10-01 12:51:56','1999-11-29 20:29:21'),(41,'distinctio','Minima quae dolore nihil non. Minima praesentium maxime tempora vitae blanditiis cupiditate. Itaque adipisci et maiores ipsam maiores. Esse distinctio odit eveniet quo quibusdam sint.',14444.00,6,'2010-12-07 02:54:48','1991-01-07 22:02:19'),(42,'consequatur','Est velit corrupti accusantium et earum reprehenderit. Repellat aut quo ut dolorum. Est culpa earum error ipsam similique odit.',5685.00,7,'1985-11-14 01:33:33','1979-03-11 19:56:39'),(43,'rerum','Repellendus voluptatibus magni nihil autem. Et et suscipit dolor non velit. Maiores occaecati et iste sapiente quisquam quo voluptas. Doloremque nobis consequatur qui ipsa explicabo. Aliquam et consectetur rerum veniam ducimus et.',17994.00,8,'2019-12-24 12:47:12','2019-11-16 03:31:16'),(44,'minima','Quis neque totam rem quasi. Deserunt excepturi error in sed. Voluptate minus dolores aut qui corrupti.',10671.00,9,'2020-09-25 13:15:10','2006-10-09 03:11:43'),(45,'rerum','Officia blanditiis exercitationem maiores quia molestiae. Aut itaque veniam natus recusandae atque. Tempore commodi autem rerum voluptas est perspiciatis.',16935.00,10,'2019-01-24 05:06:37','2016-06-13 09:02:06'),(46,'alias','Nihil necessitatibus optio voluptas consequuntur deleniti vitae. Reiciendis vel et nemo. Porro quia iusto iusto ullam. Ea non nemo doloribus veniam sunt quibusdam doloremque consequuntur.',13010.00,11,'1977-05-02 12:43:49','1997-03-14 00:44:20'),(47,'sapiente','Aspernatur dolor molestiae delectus commodi. Explicabo alias et adipisci adipisci ut atque. Alias rerum saepe repellat doloribus est mollitia. Et architecto qui possimus totam et.',19107.00,12,'1995-10-09 04:48:29','2001-12-09 18:20:57'),(48,'quas','Voluptates nobis dolorem ea dolores. Molestiae similique explicabo voluptatum nostrum fugit et iste. Eaque maiores vel earum voluptatum ut laudantium et.',11791.00,13,'2010-12-29 18:38:14','2019-06-01 16:32:45'),(49,'commodi','Minima rem ex sint harum sequi ipsam fugit. Excepturi reprehenderit sed consequatur animi nisi dicta veniam. Quia officia suscipit dolores.',16025.00,14,'1981-02-17 05:24:24','1981-03-29 22:22:24'),(50,'esse','Est ipsum odio beatae ad nemo sed assumenda. Aspernatur perspiciatis voluptas animi. Et distinctio necessitatibus omnis quia temporibus.',18611.00,15,'2008-07-05 19:40:10','1970-04-06 19:58:13');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainbow`
--

DROP TABLE IF EXISTS `rainbow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rainbow` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Цвета радуги';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainbow`
--

LOCK TABLES `rainbow` WRITE;
/*!40000 ALTER TABLE `rainbow` DISABLE KEYS */;
INSERT INTO `rainbow` VALUES (1,'red'),(2,'orange'),(3,'yellow'),(4,'green'),(5,'blue'),(6,'indigo'),(7,'violet');
/*!40000 ALTER TABLE `rainbow` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Склады';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouses`
--

LOCK TABLES `storehouses` WRITE;
/*!40000 ALTER TABLE `storehouses` DISABLE KEYS */;
INSERT INTO `storehouses` VALUES (1,'mollitia','1993-08-13 05:22:23','2017-09-11 13:26:39'),(2,'deleniti','1970-01-02 17:42:50','2010-04-05 18:51:18'),(3,'error','2008-11-18 16:49:53','2005-04-13 03:35:54'),(4,'sit','1978-01-27 17:34:24','2003-11-14 18:07:42'),(5,'similique','1978-10-31 10:48:33','1979-03-10 14:44:53'),(6,'soluta','1994-08-09 04:56:06','1970-09-07 09:23:58'),(7,'et','2012-04-17 08:20:33','1999-03-12 16:03:32'),(8,'vel','1999-12-12 06:34:37','1997-01-20 09:51:27'),(9,'quidem','1970-09-06 14:20:02','2014-09-26 07:00:08'),(10,'nesciunt','1989-08-25 05:58:26','2009-08-28 06:19:05'),(11,'eveniet','2014-06-14 04:15:59','1997-01-31 04:38:55'),(12,'maxime','2020-03-21 20:05:36','2020-03-27 08:52:58'),(13,'quam','1994-03-26 07:15:20','1992-11-01 01:21:20'),(14,'aut','2018-07-28 17:40:10','2011-03-09 22:32:45'),(15,'id','1981-06-13 00:00:15','1991-12-05 04:42:48'),(16,'perferendis','2003-05-23 10:48:40','2006-12-30 14:12:49'),(17,'cum','1974-02-18 21:11:43','1977-01-25 02:57:46'),(18,'corrupti','2013-04-26 14:02:05','2009-12-09 09:26:08'),(19,'omnis','1990-03-04 08:16:02','1980-01-07 09:00:49'),(20,'dolorum','1975-01-25 23:53:13','1992-03-04 04:31:26'),(21,'occaecati','2010-06-01 01:54:30','1981-05-15 18:48:26'),(22,'non','1983-03-05 22:47:37','1985-03-05 07:38:46'),(23,'perspiciatis','1985-02-11 03:28:54','2019-04-11 11:08:18'),(24,'et','1973-09-14 19:49:57','1973-08-05 09:08:26'),(25,'qui','2001-10-18 22:48:45','1984-06-02 07:07:01'),(26,'et','2007-11-11 15:50:30','2016-04-27 09:54:56'),(27,'et','2002-06-06 07:07:10','1992-05-19 14:22:14'),(28,'quas','1993-01-22 13:20:52','1979-03-18 18:58:08'),(29,'rerum','1988-06-29 08:19:58','1992-02-29 03:47:22'),(30,'omnis','2000-10-10 04:05:26','2002-10-09 13:37:41'),(31,'recusandae','2015-02-18 20:32:15','1978-11-17 21:12:14'),(32,'voluptas','1977-01-12 04:23:54','1978-05-25 13:47:03'),(33,'incidunt','1975-11-14 22:25:04','2004-10-15 15:01:00'),(34,'sunt','1998-03-05 09:46:43','1993-07-11 00:01:05'),(35,'fugiat','1992-01-30 04:45:34','1991-02-03 01:51:51'),(36,'ipsum','2017-04-15 14:10:05','1989-06-17 15:08:53'),(37,'ut','1988-07-29 21:29:26','1995-06-10 00:25:56'),(38,'nesciunt','1972-09-17 23:00:15','1999-12-20 23:55:27'),(39,'culpa','2008-02-21 20:26:39','1999-09-20 00:20:14'),(40,'ipsum','1987-12-28 21:56:01','1996-09-22 15:08:30'),(41,'est','2012-12-15 17:37:21','1970-02-12 23:11:48'),(42,'quam','1983-09-14 00:55:04','1974-08-05 11:38:33'),(43,'vel','1985-06-29 02:13:59','2011-03-10 07:22:16'),(44,'voluptas','2004-11-03 10:19:21','1970-12-03 00:09:16'),(45,'sint','1988-07-30 07:04:21','1998-08-19 02:36:37'),(46,'repellat','2010-07-23 16:02:53','2017-12-26 20:17:44'),(47,'quibusdam','2018-08-27 06:33:15','1976-05-21 00:09:18'),(48,'placeat','2006-12-28 04:02:42','1990-08-18 22:57:40'),(49,'ea','1990-06-04 11:13:45','1990-11-09 02:44:52'),(50,'doloribus','1984-01-26 14:55:00','1999-09-18 08:12:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Запасы на складе';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouses_products`
--

LOCK TABLES `storehouses_products` WRITE;
/*!40000 ALTER TABLE `storehouses_products` DISABLE KEYS */;
INSERT INTO `storehouses_products` VALUES (1,1,1,95,'2005-10-03 16:18:55','1986-12-24 21:35:47'),(2,2,2,65,'2015-03-25 03:40:35','2005-10-05 05:50:19'),(3,3,3,45,'1990-03-20 20:20:05','2007-06-14 02:23:54'),(4,4,4,63,'1973-09-11 13:51:48','1996-01-16 20:38:24'),(5,5,5,82,'2017-07-23 15:36:38','1997-04-04 06:36:20'),(6,6,6,54,'1984-04-04 23:26:20','2011-04-18 07:52:07'),(7,7,7,62,'1994-11-10 22:39:24','1972-04-02 05:34:12'),(8,8,8,67,'2000-10-17 01:07:01','1997-08-02 06:55:49'),(9,9,9,78,'2009-02-04 11:21:57','2016-06-20 21:17:58'),(10,10,10,39,'1988-08-01 20:38:33','1992-08-28 10:45:41'),(11,11,11,4,'1987-08-19 20:11:49','2008-12-09 07:58:17'),(12,12,12,77,'1995-04-01 03:53:31','2010-01-05 06:58:43'),(13,13,13,58,'2001-06-03 12:55:44','1999-05-20 23:54:03'),(14,14,14,85,'1994-05-08 10:09:22','1999-02-26 04:51:17'),(15,15,15,9,'1990-07-10 17:54:59','1984-11-30 08:38:34'),(16,16,16,79,'2003-07-07 04:25:10','1996-11-07 13:29:23'),(17,17,17,71,'1972-01-15 06:46:44','2006-01-30 15:00:47'),(18,18,18,23,'2015-06-02 14:02:20','1987-05-16 04:54:37'),(19,19,19,54,'2016-07-19 04:18:50','2011-04-10 01:56:03'),(20,20,20,11,'2011-12-11 20:12:10','2009-03-07 01:02:03'),(21,21,21,7,'2012-11-21 07:23:07','1976-12-25 01:36:31'),(22,22,22,34,'1971-04-06 20:52:11','1976-06-29 23:21:39'),(23,23,23,100,'1982-10-10 23:05:42','2010-05-24 19:35:13'),(24,24,24,6,'2016-09-06 15:59:52','2011-07-13 04:36:35'),(25,25,25,46,'1990-12-30 09:58:08','1998-06-12 12:27:59'),(26,26,26,25,'1973-05-07 20:14:05','1998-07-20 13:12:36'),(27,27,27,18,'1981-09-15 13:47:43','1989-07-13 13:48:18'),(28,28,28,14,'1988-02-28 20:00:12','1997-10-12 12:03:50'),(29,29,29,55,'2008-02-11 05:30:06','1984-07-27 00:23:27'),(30,30,30,57,'1995-07-23 22:45:40','1970-08-22 16:31:20'),(31,31,31,29,'2018-10-02 11:27:53','1985-08-25 12:50:38'),(32,32,32,95,'1978-08-07 04:52:49','1978-05-25 12:45:27'),(33,33,33,36,'2012-04-22 13:29:26','2003-03-15 17:16:02'),(34,34,34,81,'1981-05-03 18:02:07','1981-03-17 15:57:31'),(35,35,35,6,'1995-09-10 16:46:31','2017-12-03 23:00:53'),(36,36,36,29,'2002-03-20 06:09:21','1994-07-23 03:47:49'),(37,37,37,30,'1971-11-04 16:37:41','1970-09-27 02:12:05'),(38,38,38,53,'1981-05-14 09:13:14','2008-10-04 19:10:04'),(39,39,39,82,'2004-07-09 09:33:02','2003-09-06 14:52:41'),(40,40,40,80,'2001-08-13 00:35:47','1999-07-21 17:09:00'),(41,41,41,83,'1983-01-30 16:20:02','2020-04-16 11:04:47'),(42,42,42,88,'2014-08-01 17:03:36','1993-10-07 01:28:16'),(43,43,43,79,'1984-09-07 05:33:19','1989-07-06 13:50:56'),(44,44,44,8,'1986-08-18 05:32:25','2001-04-19 21:17:28'),(45,45,45,19,'1974-02-21 23:41:13','1995-12-26 05:31:50'),(46,46,46,31,'2017-06-30 07:58:28','1978-09-30 05:50:51'),(47,47,47,48,'1980-06-09 00:15:47','2009-11-25 07:18:00'),(48,48,48,89,'2000-08-17 13:10:45','1972-02-07 04:39:24'),(49,49,49,16,'1985-04-12 15:53:39','1994-12-26 01:14:30'),(50,50,50,30,'1987-03-02 12:00:39','1980-07-19 19:32:36');
/*!40000 ALTER TABLE `storehouses_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl`
--

DROP TABLE IF EXISTS `tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl` (
  `id` int NOT NULL,
  `value` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl`
--

LOCK TABLES `tbl` WRITE;
/*!40000 ALTER TABLE `tbl` DISABLE KEYS */;
INSERT INTO `tbl` VALUES (1,230),(2,NULL),(3,405),(4,NULL);
/*!40000 ALTER TABLE `tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `triangles`
--

DROP TABLE IF EXISTS `triangles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `triangles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `a` double NOT NULL COMMENT 'Сторона треугольника',
  `b` double NOT NULL COMMENT 'Сторона треугольника',
  `angle` int NOT NULL COMMENT 'Угол треугольника в градусах',
  `square` double GENERATED ALWAYS AS ((((`a` * `b`) * sin(radians(`angle`))) / 2.0)) VIRTUAL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Площадь треугольника';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `triangles`
--

LOCK TABLES `triangles` WRITE;
/*!40000 ALTER TABLE `triangles` DISABLE KEYS */;
INSERT INTO `triangles` (`id`, `a`, `b`, `angle`) VALUES (1,1.414,1,45),(2,2.707,2.104,60),(3,2.088,2.112,56),(4,5.014,2.304,23),(5,3.482,4.708,38);
/*!40000 ALTER TABLE `triangles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'Имя покупателя',
  `birthday_at` date DEFAULT NULL COMMENT 'Дата рождения',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Покупатели';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Геннадий','1990-10-05','2020-10-07 21:43:16','2020-10-07 21:43:16'),(2,'Наталья','1984-11-12','2020-10-07 21:43:16','2020-10-07 21:43:16'),(3,'Александр','1985-05-20','2020-10-07 21:43:16','2020-10-07 21:43:16'),(4,'Сергей','1988-02-14','2020-10-07 21:43:16','2020-10-07 21:43:16'),(5,'Иван','1998-01-12','2020-10-07 21:43:16','2020-10-07 21:43:16'),(6,'Мария','1992-08-29','2020-10-07 21:43:16','2020-10-07 21:43:16'),(7,'Prof. Willard Maggio','1987-08-21','1987-04-04 15:15:33','1985-01-10 04:53:58'),(8,'Ms. Vivien Herzog V','2017-12-28','1970-04-01 01:57:26','1983-12-20 21:36:48'),(9,'Tillman Langworth PhD','2008-04-29','1995-09-19 08:22:19','1973-12-01 04:35:12'),(10,'Brionna Mitchell','1990-05-09','1985-02-15 11:33:52','2015-06-09 14:46:20'),(11,'Robbie Bechtelar','1994-05-13','1975-09-13 16:00:08','1972-05-25 01:13:45'),(12,'Eliane Dickens','2010-03-23','2009-07-28 17:01:40','2015-06-22 14:33:57'),(13,'Prof. Cathrine Labadie V','2006-11-02','1983-11-10 19:07:04','1971-10-10 06:26:42'),(14,'Roselyn Mann','2018-08-02','1994-04-23 22:39:37','1996-08-29 18:27:13'),(15,'Malvina Vandervort','1983-04-24','2015-02-14 05:31:02','2016-08-18 07:28:12'),(16,'Earlene Willms','1977-04-02','1984-12-09 03:46:11','1989-06-23 19:17:05'),(17,'Eliezer Senger','2006-10-18','2005-02-03 22:18:07','2009-09-05 07:21:02'),(18,'Dr. Beaulah Schmeler','1985-04-19','2006-04-06 15:20:56','1986-08-30 15:02:01'),(19,'Berenice Shields','1990-05-10','1984-04-20 21:27:48','1982-11-30 21:23:20'),(20,'Noemi Feeney','2008-11-18','2009-12-05 14:27:29','1972-02-18 23:23:39'),(21,'Dr. Rigoberto Fay III','1993-08-08','1992-10-11 20:44:41','2015-03-28 13:52:51'),(22,'Nils Rau','1972-09-10','2016-07-17 06:17:53','2017-11-09 12:12:32'),(23,'Chris O\'Hara','1997-06-26','2000-10-11 13:16:23','2013-01-26 08:08:54'),(24,'Ramon Stoltenberg','1974-10-02','1986-08-20 05:58:21','2010-02-04 04:38:53'),(25,'Sienna Medhurst','1975-11-28','1976-01-15 14:21:27','1988-03-19 13:26:21'),(26,'Jena Jones','1994-10-19','2007-12-06 22:39:43','2011-01-07 12:24:19'),(27,'Samara Stokes','2011-03-26','1993-03-14 07:59:42','1972-11-12 18:33:56'),(28,'Precious Jaskolski','1983-09-28','1970-10-19 17:08:44','1974-12-31 05:04:32'),(29,'Blake Gutmann','2000-04-18','2014-07-22 10:58:13','1989-05-13 13:44:03'),(30,'Elmo Ziemann','2002-09-03','2014-02-14 13:25:30','2002-09-30 02:36:36'),(31,'Jonatan Hilll IV','1995-12-19','1993-06-28 05:26:06','2011-01-28 03:34:28'),(32,'Madonna Wyman','1998-04-02','2009-04-20 23:33:33','1990-03-10 21:19:05'),(33,'Mazie Upton','2017-09-27','2004-03-21 01:21:45','2014-10-19 13:02:24'),(34,'Delfina Moore','1974-04-02','1986-07-04 17:33:04','2013-12-11 16:39:34'),(35,'Terrence Braun','2004-09-19','1971-01-14 01:17:10','2005-09-22 19:36:38'),(36,'Deshaun Walker','2015-10-30','2015-08-10 11:42:46','1983-12-19 17:42:29'),(37,'Abraham Collins','2009-02-11','2011-02-04 19:04:11','2017-11-22 21:10:06'),(38,'Watson Kessler','2015-10-17','1975-10-07 09:34:58','1989-06-20 22:02:03'),(39,'Louie Jenkins','2005-03-26','2005-07-18 14:07:30','2016-11-17 13:36:33'),(40,'Dr. Reynold Pouros','1984-10-25','1991-02-21 05:52:02','1992-03-03 07:56:11'),(41,'Dr. Mathew Connelly','2001-06-25','1991-11-28 19:09:04','1982-05-13 06:56:39'),(42,'Keaton Kovacek','1975-08-18','1973-11-12 18:36:52','1970-05-13 01:40:52'),(43,'Ms. Tiffany Gislason','1990-03-01','2000-08-04 16:29:42','1981-11-12 12:00:20'),(44,'Wilfred Tremblay','2017-09-23','2017-01-14 19:56:47','1980-10-18 04:38:03'),(45,'Darrick Spinka','1986-11-27','1981-12-10 09:48:14','1986-01-02 13:55:30'),(46,'Santina Mueller','2016-12-25','2001-06-09 22:18:39','2008-05-12 07:35:13'),(47,'Makayla Sporer Jr.','1996-03-01','2010-07-28 02:33:31','1982-09-30 07:05:18'),(48,'Prof. Felicia Stamm','2016-10-12','2011-09-17 19:46:28','1987-06-17 22:04:18'),(49,'Lyla Ledner V','1997-07-24','1971-12-22 16:08:03','1978-08-14 06:41:50'),(50,'Bryon Dickens III','1979-11-28','1979-10-09 17:03:10','1972-04-10 03:40:24'),(51,'Dr. Gaetano Smith Jr.','2011-09-03','1991-08-30 13:13:10','1985-09-16 22:06:02'),(52,'Mr. Sim Kirlin DDS','1975-06-07','1970-02-23 13:50:13','1994-02-14 01:39:49'),(53,'Rodrick Kilback','1983-04-12','1988-05-02 03:03:39','1973-11-19 02:28:40'),(54,'Elmira Strosin','2000-02-26','2003-12-20 06:47:27','2013-08-22 15:28:54'),(55,'Matilda Batz','2012-12-19','2019-12-13 03:12:27','1984-08-08 01:20:09'),(56,'Terrence Wisozk DVM','1972-11-11','2017-09-20 02:43:16','2002-03-23 10:05:04');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-08 22:00:40
