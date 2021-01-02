"""
1. Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users,
catalogs и products в таблицу logs помещается время и дата создания записи, название таблицы, 
идентификатор первичного ключа и содержимое поля name.
"""
DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
		   `insert_created_at` DATETIME DEFAULT NOW(),
		   `table_name` VARCHAR(45) NOT NULL,
                   `pk_id` INT NOT NULL,
                   `insert_name` VARCHAR(45) NOT NULL
				  ) ENGINE=ARCHIVE;


DROP TRIGGER IF EXISTS `users_log_trigger`;
DELIMITER !
CREATE TRIGGER `users_log_trigger` 
AFTER INSERT ON `users` 
FOR EACH ROW
	BEGIN
		 INSERT INTO `logs` (`table_name`, `pk_id`, `insert_name`)
			     VALUES ('users', NEW.`id`, NEW.`name`);
	END!
    
INSERT INTO `users` SET `name` = 'Alyosha', 
                        `birthday_at` = '2008.10.22'!


DROP TRIGGER IF EXISTS `catalogs_log_trigger`;
CREATE TRIGGER `catalogs_log_trigger` 
AFTER INSERT ON `catalogs` 
FOR EACH ROW
	BEGIN
		 INSERT INTO `logs` (`table_name`, `pk_id`, `insert_name`)
			     VALUES ('catalogs', NEW.`id`, NEW.`name`);
	END!

INSERT INTO `catalogs` SET `name` = 'Power'!

DROP TRIGGER IF EXISTS `products_log_trigger`;
CREATE TRIGGER `products_log_trigger`
AFTER INSERT ON `products` 
FOR EACH ROW
	BEGIN
		 INSERT INTO `logs` (`table_name`, `pk_id`, `insert_name`)
			     VALUES ('products', NEW.`id`, NEW.`name`);
	END!
    
INSERT INTO `products` SET `name` = 'Seasonic Prime PX-650 650W', 
                           `price` = 14000, 
                           `catalog_id` = 8!

SELECT * FROM `logs`;
+---------------------+------------+-------+----------------------------+
| insert_created_at   | table_name | pk_id | insert_name                |
+---------------------+------------+-------+----------------------------+
| 2021-01-02 15:34:58 | users      |    14 | Alyosha                    |
| 2021-01-02 15:36:08 | catalogs   |     8 | Power                      |
| 2021-01-02 15:45:27 | products   |    12 | Seasonic Prime PX-650 650W |
+---------------------+------------+-------+----------------------------+
3 rows in set (0.00 sec)



"""
2. (по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.
"""
