# Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.

INSERT INTO `users` (`created_at`, `updated_at`) VALUES (NOW(), NOW()); 

# Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате 20.10.2017 8:10. 
# Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.

ALTER TABLE `users` MODIFY `created_at` DATETIME DEFAULT(NOW());
ALTER TABLE `users` CHANGE COLUMN `updated_at` `updated_at` DATETIME ON UPDATE CURRENT_TIMESTAMP;
-- Как изменить колонки пакетом?

# В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. 
# Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. Однако нулевые запасы должны выводиться в конце, после всех записей.

SELECT * FROM `storehouses_products` ORDER BY CASE WHEN value = 0 THEN 9999999 ELSE value END;

# (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. Месяцы заданы в виде списка английских названий (may, august)

SELECT `name` FROM `users` WHERE MONTHNAME(`birthday`) IN ('August', 'May'); -- абстракция с видеоурока

SELECT `firstname` /*, MONTHNAME(`birthday`) AS `month_name` */ 
  FROM `my_vk_schema`.`users`, `my_vk_schema`.`profiles`                     -- для моей базы 
  WHERE MONTHNAME(`birthday`) IN ('August', 'May');

# (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.

SELECT * FROM `catalogs` WHERE id IN (5, 1, 2) ORDER BY FIELD(id, 5, 1, 2);
