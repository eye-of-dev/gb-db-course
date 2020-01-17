# Определить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT 
	IF(`profiles`.`gender` = 1, 'мужчины поставили больше лайков', 'женщины поставили больше лайков')
FROM 
	`users` 
JOIN
	`profiles` ON `users`.`id` = `profiles`.`user_id`
JOIN 
	`likes` ON `users`.`id` = `likes`.`user_id`
GROUP BY
	`profiles`.`gender`
ORDER BY 
	COUNT(`likes`.`id`) DESC LIMIT 1

