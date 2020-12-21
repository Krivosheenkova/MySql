USE `my_vk_schema`;
SELECT `from_users_id`
FROM `my_vk_schema`.`messages` 
WHERE `to_users_id` = 101 
	AND `from_users_id` IN (
		SELECT `from_users_id` 
		FROM `my_vk_schema`.`friend_requests` 
		WHERE (`to_users_id` = `to_users_id`) AND STATUS = 1)
	AND (SELECT COUNT(*) AS `count` FROM `my_vk_schema`.`messages` WHERE `to_users_id` = `to_users_id` GROUP BY `from_users_id` ORDER BY `count` DESC LIMIT 1)
  GROUP BY `from_users_id` ORDER BY COUNT(*) DESC LIMIT 1;
+---------------+
| from_users_id |
+---------------+
|           145 |
+---------------+
1 row in set (0.00 sec)
