"""
1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. 
Используйте транзакции.
"""
USE `shop`;

INSERT INTO `users` (`name`, `birthday_at`) 
VALUES ('Мыш', '2020-11-13'), ('Пек', '2019-04-10'), ('Илья', '1991-06-07'), ('Алина', '2000-08-25');

USE `example`;

Database changed
START TRANSACTION;

REPLACE INTO `users` SELECT * FROM `shop`.`users` WHERE `id` = 1;

SELECT * FROM `users`;
+----+--------------------+-------------+---------------------+---------------------+
| id | name               | birthday_at | created_at          | updated_at          |
+----+--------------------+-------------+---------------------+---------------------+
|  1 | Мыш                | 2020-11-13  | 2020-12-28 17:45:15 | 2020-12-28 17:45:15 |
|  2 | Наталья            | 1984-11-12  | 2020-12-28 16:30:23 | 2020-12-28 16:30:23 |
|  3 | Александр          | 1985-05-20  | 2020-12-28 16:30:23 | 2020-12-28 16:30:23 |
|  4 | Сергей             | 1988-02-14  | 2020-12-28 16:30:23 | 2020-12-28 16:30:23 |
|  5 | Иван               | 1998-01-12  | 2020-12-28 16:30:23 | 2020-12-28 16:30:23 |
|  6 | Мария              | 1992-08-29  | 2020-12-28 16:30:23 | 2020-12-28 16:30:23 |
+----+--------------------+-------------+---------------------+---------------------+
6 rows in set (0.00 sec)

SELECT * FROM `shop`.`users`;
+----+------------+-------------+---------------------+---------------------+
| id | name       | birthday_at | created_at          | updated_at          |
+----+------------+-------------+---------------------+---------------------+
|  2 | Пек        | 2019-04-10  | 2020-12-28 17:45:15 | 2020-12-28 17:45:15 |
|  3 | Илья       | 1991-06-07  | 2020-12-28 17:45:15 | 2020-12-28 17:45:15 |
|  4 | Алина      | 2000-08-25  | 2020-12-28 17:45:15 | 2020-12-28 17:45:15 |
+----+------------+-------------+---------------------+---------------------+
3 rows in set (0.00 sec)


"""
2. Создайте представление, которое выводит название name товарной позиции из таблицы products
и соответствующее название каталога name из таблицы catalogs.
"""

CREATE OR REPLACE VIEW `prod_cat`(`product_id`, `product_name`, `catalog_name`) AS 
  SELECT `p`.`id` AS `product_id`, `p`.`name`, `c`.`name` 
  FROM `products` AS `p` 
LEFT JOIN
  `catalogs` AS `c`
   ON `p`.`catalog_id` = `c`.`id`;

SELECT * FROM prod_cat;
+------------+-------------------------+-----------------------------------+
| product_id | product_name            | catalog_name                      |
+------------+-------------------------+-----------------------------------+
|          1 | Intel Core i3-8100      | Процессоры                        |
|          2 | Intel Core i5-7400      | Процессоры                        |
|          3 | AMD FX-8320E            | Процессоры                        |
|          4 | AMD FX-8320             | Процессоры                        |
|          5 | ASUS ROG MAXIMUS X HERO | Материнские платы                 |
|          6 | Gigabyte H310M S2H      | Материнские платы                 |
|          7 | MSI B250M GAMING PRO    | Материнские платы                 |
+------------+-------------------------+-----------------------------------+
7 rows in set (0.01 sec)

"""
3. (по желанию) Пусть имеется таблица с календарным полем created_at. 
В ней размещены разряженые календарные записи за август 2018 года '2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17. 
Составьте запрос, который выводит полный список дат за август, выставляя в соседнем поле значение 1, 
если дата присутствует в исходном таблице и 0, если она отсутствует.
"""
SELECT 
	period.selected_date AS day,
	(SELECT EXISTS(SELECT * FROM vk.profiles WHERE DATE(created_at) = day)) AS is_in_tbl
FROM
	(SELECT v.* FROM 
		(SELECT ADDDATE('2020-01-01',t4.i*10000 + t3.i*1000 + t2.i*100 + t1.i*10 + t0.i) selected_date FROM
			(SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t0,
		    (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t1,
		    (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t2,
		    (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t3,
		    (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t4) v
WHERE selected_date BETWEEN '2020-08-01' AND '2020-08-31') AS period ORDER BY day;
+------------+-----------+
| day        | is_in_tbl |
+------------+-----------+
| 2020-08-01 |         1 |
| 2020-08-02 |         0 |
| 2020-08-03 |         0 |
| 2020-08-04 |         0 |
| 2020-08-05 |         0 |
| 2020-08-06 |         0 |
| 2020-08-07 |         0 |
| 2020-08-08 |         0 |
| 2020-08-09 |         0 |
| 2020-08-10 |         1 |
| 2020-08-11 |         0 |
| 2020-08-12 |         0 |
| 2020-08-13 |         0 |
| 2020-08-14 |         0 |
| 2020-08-15 |         0 |
| 2020-08-16 |         0 |
| 2020-08-17 |         0 |
| 2020-08-18 |         0 |
| 2020-08-19 |         0 |
| 2020-08-20 |         0 |
| 2020-08-21 |         1 |
| 2020-08-22 |         0 |
| 2020-08-23 |         0 |
| 2020-08-24 |         0 |
| 2020-08-25 |         0 |
| 2020-08-26 |         1 |
| 2020-08-27 |         0 |
| 2020-08-28 |         0 |
| 2020-08-29 |         0 |
| 2020-08-30 |         1 |
| 2020-08-31 |         0 |
+------------+-----------+
31 rows in set (0.17 sec)

