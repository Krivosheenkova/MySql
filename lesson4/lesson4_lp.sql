CREATE TABLE IF NOT EXISTS `smth` (
	smth_id int NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	column1 varchar(8) NOT NULL);
INSERT INTO `smth` (`column1`)
VALUES ('456'), ('000'), ('123');
DELETE FROM `my_vk_schema`.`smth` WHERE `column1` = 000;
-- SELECT * FROM `smth`;
DROP TABLE `smth`;

ALTER TABLE `my_vk_schema`.`friend_requests` 
CHANGE COLUMN `created_ad` `created_at` DATETIME NOT NULL DEFAULT NOW();

UPDATE `my_vk_schema`.`friend_requests`  
SET `friend_requests`.`updated_at` = DEFAULT 
WHERE YEAR(`friend_requests`.`updated_at`) = 0000;
SELECT * FROM `my_vk_schema`.`friend_requests`;

UPDATE `my_vk_schema`.`friend_requests`
SET `updated_at` = '2006-10-10 16:12:30'
WHERE YEAR(`updated_at`) BETWEEN 1970 AND 2006;

UPDATE `my_vk_schema`.`messages`
SET `updated_at` = DEFAULT, `deleted_at` = DEFAULT
WHERE YEAR(`updated_at`) = 0000 AND YEAR(`deleted_at`) = 0000;
-- SELECT * FROM `my_vk_schema`.`messages`;

/* VK birth day */ 
UPDATE `my_vk_schema`.`profiles`, `my_vk_schema`.`posts`
SET `profiles`.`created_at` = '2006-10-10 06:10:10',
	`posts`.`created_at` =  '2006-10-10 06:10:10'
WHERE YEAR(`profiles`.`created_at`) BETWEEN 1970 AND 2006 AND
      YEAR(`posts`.`created_at`) BETWEEN 1970 AND 2006;
SELECT * FROM `my_vk_schema`.`profiles`, `my_vk_schema`.`posts`;
