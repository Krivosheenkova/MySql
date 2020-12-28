"""
1. Создайте двух пользователей которые имеют доступ к базе данных shop.
Первому пользователю shop_read должны быть доступны только запросы на чтение данных,
второму пользователю shop — любые операции в пределах базы данных shop.
"""

CREATE USER `shop_read`;
GRANT SELECT ON shop.* TO `shop_read`;

CREATE USER `shop`;
GRANT ALL ON `shop`.* TO `shop`;

SHOW GRANTS FOR `shop`;
+------------------------------------------------+
| Grants for shop@%                              |
+------------------------------------------------+
| GRANT USAGE ON *.* TO `shop`@`%`               |
| GRANT ALL PRIVILEGES ON `shop`.* TO `shop`@`%` |
+------------------------------------------------+

SHOW GRANTS FOR `shop_read`;
+---------------------------------------------+
| Grants for shop_read@%                      |
+---------------------------------------------+
| GRANT USAGE ON *.* TO `shop_read`@`%`       |
| GRANT SELECT ON `shop`.* TO `shop_read`@`%` |
+---------------------------------------------+

"""
2.(по желанию) Пусть имеется таблица accounts содержащая три столбца id, name, password, 
содержащие первичный ключ, имя пользователя и его пароль.
Создайте представление username таблицы accounts, предоставляющий доступ к столбцам id и name.
Создайте пользователя user_read,
который бы не имел доступа к таблице accounts, однако, мог бы извлекать 
записи из представления username.
"""
CREATE TABLE `accounts` (`id` INT PRIMARY KEY AUTO_INCREMENT, 
                       `name` VARCHAR(256), 
                       `password_hash` CHAR(65));
INSERT INTO `accounts` VALUES  (1, 'Pek', sha1('pekpek'),
                             (2, 'Mysh', sha1('myshmysh'),
                             (3, 'Brad', sha1('bradbrad');

CREATE OR REPLACE VIEW `username` AS SELECT `id`, `name` FROM `accounts`;

GRANT SELECT ON `shop`.`username` TO `user_read`;
SHOW GRANTS FOR `user_read`;
+------------------------------------------------------+
| Grants for user_read@%                               |
+------------------------------------------------------+
| GRANT USAGE ON *.* TO `user_read`@`%`                |
| GRANT SELECT ON `shop`.`username` TO `user_read`@`%` |
+------------------------------------------------------+

                              
