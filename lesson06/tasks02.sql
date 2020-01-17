# Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..

SELECT 
	`users`.`id`,
    `profiles`.`birthday`,
    COUNT(`likes`.`id`) AS count_likes
FROM 
	`users`
JOIN 
	`profiles` ON `users`.`id` = `profiles`.`user_id`
JOIN 
	`likes` ON `likes`.`user_id` = `users`.`id`
WHERE 
	TIMESTAMPDIFF(YEAR, `profiles`.`birthday`, CURDATE()) <= 10
GROUP BY
	`likes`.`user_id`
ORDER BY 
	`profiles`.`birthday`

