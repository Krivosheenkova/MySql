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
CREATE TABLE IF NOT EXISTS`cities` (`label` VARCHAR(100) PRIMARY KEY,
	               `name` VARCHAR(100) NOT NULL);
INSERT INTO `cities` 
VALUES ('moscow', 'Москва'), 
       ('irkutsk', 'Иркутск'), 
       ('novgorod', 'Новгород'), 
       ('kazan', 'Казань'), 
       ('omsk', 'Омск');
       
INSERT INTO `flights` (`from`, `to`) 
VALUES ('moscow', 'omsk'), 
       ('novgorod','kazan'), 
       ('irkutsk', 'moscow'), 
       ('omsk', 'irkutsk'), 
       ('moscow', 'kazan');

CREATE TABLE `flights` (`id` SERIAL PRIMARY KEY,
	                  `from` VARCHAR(100) NOT NULL,
	                  `to` VARCHAR(100) NOT NULL);
                        
ALTER TABLE `flights` ADD CONSTRAINT `fk_from`
FOREIGN KEY (`from`) REFERENCES `cities` (`label`)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `flights` ADD CONSTRAINT `fk_to`
FOREIGN KEY (`to`) REFERENCES `cities` (`label`)
ON DELETE CASCADE ON UPDATE CASCADE;


SELECT `c`.`name` AS `from`, `c1`.`name` AS `to`
FROM `flights` AS `f`
INNER JOIN `cities` AS `c` ON `c`.`label` = `f`.`from`
INNER JOIN `cities` AS `c1` ON `c1`.`label` = `f`.`to`
ORDER BY `f`.`id`;
+------------------+----------------+
| from             | to             |
+------------------+----------------+
| Москва           | Омск           |
| Новгород         | Казань         |
| Иркутск          | Москва         |
| Омск             | Иркутск        |
| Москва           | Казань         |
+------------------+----------------+
5 rows in set (0.01 sec)
