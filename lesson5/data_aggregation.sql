# Подсчитайте средний возраст пользователей в таблице users

SELECT ROUND(AVG((TO_DAYS(NOW()) - TO_DAYS(`birthday`)) DIV 365.25), 2) AS `average_age` FROM `users`; 
-- в моей таблице получился средний возраст 24.44

# Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения.
    # (по желанию) Подсчитайте произведение чисел в столбце таблицы.

SELECT DAYNAME(`birthday`) AS `bd_weekday`, COUNT(*) as `count` FROM `users` GROUP BY DAYNAME(`birthday`) ;
+------------+-------+
| bd_weekday | count |
+------------+-------+
| Friday     |     7 |
| Monday     |    13 |
| Saturday   |     5 |
| Sunday     |    12 |
| Thursday   |     8 |
| Tuesday    |     8 |
| Wednesday  |    11 |
+------------+-------+
8 rows in set (0.00 sec)

