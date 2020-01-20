# Составьте список пользователей users, которые осуществили 
# хотя бы один заказ orders в интернет магазине.

SELECT 
	DISTINCT `geekbrains_shop`.`users`.*
FROM 
	`geekbrains_shop`.`users`
INNER JOIN 
	`geekbrains_shop`.`orders` ON `geekbrains_shop`.`orders`.`user_id` = `geekbrains_shop`.`users`.`id`;

# или так
SELECT 
	* 
FROM 
	`geekbrains_shop`.`users`
WHERE 
	`geekbrains_shop`.`users`.`id` IN (SELECT DISTINCT `geekbrains_shop`.`orders`.`user_id` FROM `geekbrains_shop`.`orders`);
    
# P.S. первый вариант предпочтительнее
