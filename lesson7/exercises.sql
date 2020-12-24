'''
1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
'''

mysql> SELECT * FROM `orders`; -- на скорую руку заполнила таблицу orders
+----+---------+---------------------+---------------------+
| id | user_id | created_at          | updated_at          |
+----+---------+---------------------+---------------------+
|  1 |       7 | 2020-08-18 13:18:44 | 2020-12-24 05:50:30 |
|  2 |      12 | 2020-04-19 22:39:05 | 2020-12-24 05:50:30 |
|  3 |       9 | 2020-04-26 02:40:45 | 2020-12-24 05:50:30 |
|  4 |      11 | 2020-08-05 15:04:15 | 2020-12-24 05:50:30 |
|  5 |       7 | 2020-06-23 14:26:38 | 2020-12-24 05:50:30 |
+----+---------+---------------------+---------------------+
5 rows in set (0.00 sec)

mysql> SELECT `user_id`, COUNT(*) AS `orders_count` FROM `orders` GROUP BY `user_id`;
+---------+--------------+
| user_id | orders_count |
+---------+--------------+
|       7 |            2 |
|       9 |            1 |
|      11 |            1 |
|      12 |            1 |
+---------+--------------+
4 rows in set (0.00 sec)

mysql> SELECT `users`.* FROM `users` WHERE `id` IN (SELECT `user_id` FROM `orders` GROUP BY `user_id` HAVING COUNT(*) >= 1);
+----+--------------------+-------------+---------------------+---------------------+
| id | name               | birthday_at | created_at          | updated_at          |
+----+--------------------+-------------+---------------------+---------------------+
|  7 | Геннадий           | 1990-10-05  | 2020-12-24 05:34:34 | 2020-12-24 05:34:34 |
|  9 | Александр          | 1985-05-20  | 2020-12-24 05:34:34 | 2020-12-24 05:34:34 |
| 11 | Иван               | 1998-01-12  | 2020-12-24 05:34:34 | 2020-12-24 05:34:34 |
| 12 | Мария              | 1992-08-29  | 2020-12-24 05:34:34 | 2020-12-24 05:34:34 |
+----+--------------------+-------------+---------------------+---------------------+
4 rows in set (0.00 sec)

mysql> SELECT 
      `u`.`id` AS `user_id`, `u`.`name` AS `user_name`,
      `op`.`order_id` AS `order_id`, 
      (SELECT `name` FROM `products` WHERE `id` = `op`.`product_id`) AS `product_name`, `op`.`total`
    FROM 
        `users` AS `u` RIGHT JOIN `orders` AS `o`
     ON `u`.`id` = `o`.`user_id` RIGHT JOIN `orders`_`products` AS `op`
     ON `o`.`id` = `op`.`order_id`
    ORDER BY `u`.`name`, `op`.`order_id;`
+---------+--------------------+----------+-------------------------+-------+
| user_id | user_name          | order_id | product_name            | total |
+---------+--------------------+----------+-------------------------+-------+
|       9 | Александр          |        3 | Gigabyte H310M S2H      |     8 |
|       7 | Геннадий           |        1 | AMD FX-8320E            |     2 |
|       7 | Геннадий           |        5 | Intel Core i5-7400      |     7 |
|      11 | Иван               |        4 | ASUS ROG MAXIMUS X HERO |     6 |
|      12 | Мария              |        2 | AMD FX-8320E            |     2 |
+---------+--------------------+----------+-------------------------+-------+
5 rows in set (0.01 sec)

'''
2. Выведите список товаров products и разделов catalogs, который соответствует товару.
'''
mysql> SELECT `p`.`id`, `p`.`name`, `p`.`price`, `c`.`id`, `c`.`name` 
    -> FROM `products` AS `p` JOIN `catalogs` AS `c` 
    -> ON `p`.`catalog_id` = `c`.`id`;
+----+-------------------------+----------+----+-----------------------------------+
| id | name                    | price    | id | name                              |
+----+-------------------------+----------+----+-----------------------------------+
|  1 | Intel Core i3-8100      |  7890.00 |  1 | Процессоры                        |
|  2 | Intel Core i5-7400      | 12700.00 |  1 | Процессоры                        |
|  3 | AMD FX-8320E            |  4780.00 |  1 | Процессоры                        |
|  4 | AMD FX-8320             |  7120.00 |  1 | Процессоры                        |
|  5 | ASUS ROG MAXIMUS X HERO | 19310.00 |  2 | Материнские платы                 |
|  6 | Gigabyte H310M S2H      |  4790.00 |  2 | Материнские платы                 |
|  7 | MSI B250M GAMING PRO    |  5060.00 |  2 | Материнские платы                 |
+----+-------------------------+----------+----+-----------------------------------+
7 rows in set (0.00 sec)

'''
3. (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.
'''
DROP TABLE IF EXISTS `catalogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название раздела',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`(10))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Разделы интернет-магазина';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogs`
--

LOCK TABLES `catalogs` WRITE;
/*!40000 ALTER TABLE `catalogs` DISABLE KEYS */;
INSERT INTO `catalogs` VALUES (1,'Процессоры'),(2,'Материнские платы'),(3,'Видеокарты'),(4,'Жесткие диски'),(5,'Оперативная память');
/*!40000 ALTER TABLE `catalogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES ('moscow','Москва'),('irkutsk','Иркутск'),('novgorod','Новгород'),('kazan','Казань'),('omsk','Омск');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `discount` float unsigned DEFAULT NULL COMMENT 'Величина скидки от 0.0 до 1.0',
  `started_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_of_user_id` (`user_id`),
  KEY `index_of_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Скидки';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flights`
--

LOCK TABLES `flights` WRITE;
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
INSERT INTO `flights` VALUES (1,'moscow','omsk'),(2,'novgorod','kazan'),(3,'irkutsk','moscow'),(4,'omsk','irkutsk'),(5,'moscow','kazan');
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_of_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Заказы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products`
--

DROP TABLE IF EXISTS `orders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `total` int(10) unsigned DEFAULT 1 COMMENT 'Количество заказанных товарных позиций',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Состав заказа';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название',
  `desription` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Описание',
  `price` decimal(11,2) DEFAULT NULL COMMENT 'Цена',
  `catalog_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_of_catalog_id` (`catalog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Товарные позиции';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Intel Core i3-8100','Процессор для настольных персональных компьютеров, основанных на платформе Intel.',7890.00,1,'2020-12-24 03:53:09','2020-12-24 03:53:09'),(2,'Intel Core i5-7400','Процессор для настольных персональных компьютеров, основанных на платформе Intel.',12700.00,1,'2020-12-24 03:53:09','2020-12-24 03:53:09'),(3,'AMD FX-8320E','Процессор для настольных персональных компьютеров, основанных на платформе AMD.',4780.00,1,'2020-12-24 03:53:09','2020-12-24 03:53:09'),(4,'AMD FX-8320','Процессор для настольных персональных компьютеров, основанных на платформе AMD.',7120.00,1,'2020-12-24 03:53:09','2020-12-24 03:53:09'),(5,'ASUS ROG MAXIMUS X HERO','Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX',2.00,19310,'2020-12-24 03:53:09','2020-12-24 03:53:09'),(6,'Gigabyte H310M S2H','Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX',4790.00,2,'2020-12-24 03:53:09','2020-12-24 03:53:09'),(7,'MSI B250M GAMING PRO','Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX',5060.00,2,'2020-12-24 03:53:09','2020-12-24 03:53:09');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rubrics`
--

DROP TABLE IF EXISTS `rubrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rubrics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название раздела',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Разделы интернет-магазина';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rubrics`
--

LOCK TABLES `rubrics` WRITE;
/*!40000 ALTER TABLE `rubrics` DISABLE KEYS */;
INSERT INTO `rubrics` VALUES (1,'Видеокарты'),(2,'Память');
/*!40000 ALTER TABLE `rubrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storehouses`
--

DROP TABLE IF EXISTS `storehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storehouses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Склады';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storehouses_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `storehouse_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `value` int(10) unsigned DEFAULT NULL COMMENT 'Запас товарной позиции на складе',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Запасы на складе';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouses_products`
--

LOCK TABLES `storehouses_products` WRITE;
/*!40000 ALTER TABLE `storehouses_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `storehouses_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl1`
--

DROP TABLE IF EXISTS `tbl1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl1` (
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl1`
--

LOCK TABLES `tbl1` WRITE;
/*!40000 ALTER TABLE `tbl1` DISABLE KEYS */;
INSERT INTO `tbl1` VALUES ('fst1'),('fst2'),('fst3');
/*!40000 ALTER TABLE `tbl1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl2`
--

DROP TABLE IF EXISTS `tbl2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl2` (
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl2`
--

LOCK TABLES `tbl2` WRITE;
/*!40000 ALTER TABLE `tbl2` DISABLE KEYS */;
INSERT INTO `tbl2` VALUES ('snd1'),('snd2'),('snd3');
/*!40000 ALTER TABLE `tbl2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `triangles`
--

DROP TABLE IF EXISTS `triangles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `triangles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `a` double NOT NULL COMMENT 'triangles side',
  `b` double NOT NULL,
  `angle` int(11) NOT NULL COMMENT 'triangles angle',
  `square` double GENERATED ALWAYS AS (round(`a` * `b` * sin(radians(`angle`)) / 2.0,4)) VIRTUAL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `triangles`
--

LOCK TABLES `triangles` WRITE;
/*!40000 ALTER TABLE `triangles` DISABLE KEYS */;
INSERT INTO `triangles` VALUES (1,1.414,1,45,0.4999),(2,2.707,2.104,60,2.4662),(3,2.088,2.112,56,1.828),(4,5.014,2.304,23,2.2569),(5,3.482,4.708,38,5.0463);
/*!40000 ALTER TABLE `triangles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Имя покупателя',
  `birthday_at` date DEFAULT NULL COMMENT 'Дата рождения',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Покупатели';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Геннадий','1990-10-05','2020-12-24 03:37:02','2020-12-24 03:37:02'),(2,'Наталья','1984-11-12','2020-12-24 03:37:02','2020-12-24 03:37:02'),(3,'Александр','1985-05-20','2020-12-24 03:37:02','2020-12-24 03:37:02'),(4,'Сергей','1988-02-14','2020-12-24 03:37:02','2020-12-24 03:37:02'),(5,'Иван','1998-01-12','2020-12-24 03:37:02','2020-12-24 03:37:02'),(6,'Мария','1992-08-29','2020-12-24 03:37:02','2020-12-24 03:37:02');
