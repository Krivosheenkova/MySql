'''
2. Пусть задан некоторый пользователь. 
Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

'''
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

'''
3. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
'''

"""messages_likes"""
SELECT `id` FROM `messages` -- выбери id сообщения и id его отправителя из таблицы сообщений
WHERE `id` IN (SELECT `messages_id` FROM `likes`) -- где id в таблице лайкнутых сообщений
AND `from_users_id` IN -- и где id отправителя в 
(SELECT * FROM 
	(SELECT `users_id` FROM `my_vk_schema`.`profiles` -- id юзера из т. профилей, отсортированные по дате рождения
ORDER BY TIMESTAMPDIFF(YEAR, `birthday`, NOW()) LIMIT 10) AS `t`
); -- output: 5 сообщений 10 молодых юзеров, принадлежащих т. лайков
+--------------------+
| COUNT(messages.id) |
+--------------------+
|                  5 |
+--------------------+
1 row in set (0.00 sec)

 
"""posts_likes"""
SELECT `id` FROM `posts` -- выбери id поста и id его создателя из таблицы постов
WHERE `id` IN (SELECT `posts_id` FROM `likes`) -- где id в таблице лайкнутых постов
AND `users_id` IN -- и где id создателя в 
(SELECT * FROM 
	(SELECT `users_id` FROM `my_vk_schema`.`profiles` -- id юзера из т. профилей, отсортированные по дате рождения
ORDER BY TIMESTAMPDIFF(YEAR, `birthday`, NOW()) LIMIT 10) AS `t`
); -- output: 8 лайкнутых постов 10 молодых юзеров
+-----------------+
| COUNT(posts.id) |
+-----------------+
|               8 |
+-----------------+
1 row in set (0.00 sec)

 
"""media_likes""" 
SELECT `id` FROM `media` -- выбери id медиа и id его отправителя из таблицы медиа
WHERE `id` IN (SELECT `media_id` FROM `likes`) -- где id в таблице лайкнутых медиа
AND `users_id` IN -- и где id отправителя в 
(SELECT * FROM 
	(SELECT `users_id` FROM `my_vk_schema`.`profiles` -- id юзера из т. профилей, отсортированные по дате рождения
ORDER BY TIMESTAMPDIFF(YEAR, `birthday`, NOW()) LIMIT 10) AS `t`
); -- output: 11 лайкнутых медиафайлов, принадлежащих 10 молодым юзерам
+-----------------+
| COUNT(media.id) |
+-----------------+
|              11 |
+-----------------+
1 row in set (0.00 sec)
 
-- что-то я так и не поняла как собрать уже этого франкенштейна покороче, попробую просто склеить...
SELECT COUNT(*) FROM
	(SELECT media.id FROM media 
		WHERE id IN (SELECT media_id FROM likes) 
		AND users_id IN 
		(SELECT * FROM 
			(SELECT users_id FROM my_vk_schema.profiles 
		ORDER BY timestampdiff(year, birthday, NOW()) limit 10) as t)
UNION
		SELECT posts.id FROM posts 
		WHERE id IN (SELECT posts_id FROM likes)
		AND users_id IN
		(SELECT * FROM 
			(SELECT users_id FROM my_vk_schema.profiles
		ORDER BY timestampdiff(year, birthday, NOW()) limit 10) as t)
UNION 
		SELECT messages.id FROM messages
		WHERE id IN (SELECT messages_id FROM likes)
		AND from_users_id IN
		(SELECT * FROM 
			(SELECT users_id FROM my_vk_schema.profiles
		ORDER BY timestampdiff(year, birthday, NOW()) limit 10) as t)) 
as t;
+-------------------------+
| total_likes_to_youngers |
+-------------------------+
|                      21 |
+-------------------------+
1 row in set (0.00 sec)

'''
4. Определить кто больше поставил лайков (всего) - мужчины или женщины?
'''
SELECT `gender`, `total_likes` FROM (
		SELECT "M" AS `gender`, COUNT(*) AS `total_likes` FROM `likes` WHERE `users_id` IN (SELECT `users_id` FROM `profiles` WHERE `gender`='m')
	UNION
		SELECT "F" AS `gender`, COUNT(*) AS `total_likes` FROM `likes` WHERE `users_id` IN (SELECT `users_id` FROM `profiles` WHERE `gender`='f')
        UNION 
        	SELECT "X" AS `gender`, COUNT(*) AS `total_likes` FROM `likes` WHERE `users_id` IN (SELECT `users_id` FROM `profiles` WHERE `gender`='x')
) AS `t`
ORDER BY `total_likes` DESC LIMIT 1;
+--------+-------------+
| gender | total_likes |
+--------+-------------+
| F      |          23 |
+--------+-------------+
1 row in set (0.00 sec)
			 
"""
5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.			 
"""
SELECT `id`, SUM(`activity`) AS `total_activity`
FROM (
	SELECT * FROM
	(SELECT `id`, 0 AS `activity` FROM `users` WHERE `id` NOT IN (SELECT DISTINCT `users_id` FROM `media`)
	UNION
	SELECT `users_id`, COUNT(*) AS activity FROM `media` GROUP by `users_id`) AS `media`
UNION
	SELECT * FROM (
	(SELECT `id`, 0 AS `activity` FROM `users` WHERE `id` NOT IN (SELECT DISTINCT `users_id` FROM `posts`)
	UNION
	SELECT `users_id`, COUNT(*) AS `activity` FROM `posts` GROUP BY `users_id`)) AS `posts`
UNION
	SELECT * FROM (
	(SELECT `id`, 0 AS `activity` FROM `users` WHERE `id` NOT IN (SELECT DISTINCT `from_users_id` FROM `messages`)
	UNION 
	SELECT `from_users_id`, COUNT(*) AS `activity` FROM `messages` GROUP BY `from_users_id`)) AS `messages`
UNION
	SELECT * FROM (
	(SELECT `id`, 0 AS `activity` FROM `users` WHERE `id` NOT IN (SELECT DISTINCT `users_id` FROM `likes`)
	UNION
	SELECT `users_id`, COUNT(*) AS `activity` FROM `likes` GROUP BY `users_id`)) AS `likes`
UNION
	SELECT * FROM (
	(SELECT `id`, 0 AS `activity` FROM `users` WHERE `id` NOT IN (SELECT DISTINCT `admin_id` FROM `communities`)
	UNION
	SELECT `admin_id`, COUNT(*) AS `activity` FROM `communities` GROUP BY `admin_id`)) AS `admins`
    ) AS `t`
GROUP BY `id`
ORDER BY `total_activity`
LIMIT 10;	
+-----+----------------+
| id  | total_activity |
+-----+----------------+
| 130 |              0 |
| 158 |              1 |
| 198 |              1 |
| 190 |              1 |
| 200 |              1 |
| 134 |              1 |
| 183 |              1 |
| 125 |              1 |
| 140 |              1 |
| 168 |              1 |
+-----+----------------+
10 rows in set (0.00 sec)

