"""
Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток.
С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
"""
DELIMITER !
DROP FUNCTION IF EXISTS hello!
CREATE FUNCTION hello ()
RETURNS TEXT DETERMINISTIC
BEGIN
SET @h := HOUR(NOW());
	CASE
		WHEN @h BETWEEN 0 AND 5 THEN
			RETURN "Доброй ночи";
		WHEN @h BETWEEN 6 AND 11 THEN
			RETURN "Доброе утро";
		WHEN @h BETWEEN 12 AND 17 THEN
			RETURN "Добрый день";
		WHEN @h BETWEEN 18 AND 23 THEN
			RETURN "Добрый вечер";
	END CASE;
END!

SELECT NOW(), hello()!

"""
2. В таблице products есть два текстовых поля: name с названием товара и description с его описанием.
Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема.
Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены.
При попытке присвоить полям NULL-значение необходимо отменить операцию.
"""
DELIMITER !
DROP TRIGGER IF EXISTS `both_isnull`!
CREATE TRIGGER `both_isnull` 
	BEFORE INSERT ON `products`
FOR EACH ROW
BEGIN
	IF(ISNULL(NEW.`name`) AND ISNULL(NEW.`desc`)) THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'It is unacceptable for both fields to be nullable.';
	END IF;
END !

DELIMITER ;
INSERT INTO `products` (`name`, `desc`, `price`, `catalog_id`)
	VALUES (NULL, NULL, 42324, 1); -- Error Code: 1644. Trigger Warning! NULL in both fields!

INSERT INTO `products` (`name`, `desc`, `price`, `catalog_id`)
	VALUES (NULL, 'The Core i3 ranging from 1.30 GHz up to 3.50 GHz, and features either 4 MB of cache.', 7594, 1); -- 1 row(s) affected

SELECT * FROM `products`;

"""
3. (по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи. 
Числами Фибоначчи называется последовательность в которой число равно сумме двух предыдущих чисел.
Вызов функции FIBONACCI(10) должен возвращать число 55.	 
"""
DELIMITER !
DROP FUNCTION IF EXISTS FIBONACCI!
					 
CREATE FUNCTION FIBONACCI (D INTEGER)
	RETURNS INTEGER DETERMINISTIC
BEGIN
	SET @NXT = 1;
	
	IF D > 2 THEN
		BEGIN
			SET @COUNTER = 3;
			SET @FST = 1;
			
			WHILE D >= @COUNTER DO
				BEGIN
					SET @NXT = @FST + @NXT;
					SET @FST = @NXT - @FST;
					SET @COUNTER = @COUNTER + 1;
				END;
			END WHILE;
		END;
	END IF;
	RETURN @NXT;
END!
					 
DELIMITER ;
SELECT FIBONACCI(1), FIBONACCI(3), FIBONACCI(10), FIBONACCI(15), FIBONACCI(20);
+--------------+--------------+---------------+---------------+---------------+
| FIBONACCI(1) | FIBONACCI(3) | FIBONACCI(10) | FIBONACCI(15) | FIBONACCI(20) |
+--------------+--------------+---------------+---------------+---------------+
|            1 |            2 |            55 |           610 |          6765 |
+--------------+--------------+---------------+---------------+---------------+
		 
					 
