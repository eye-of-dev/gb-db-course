#1. Подсчитайте средний возраст пользователей в таблице users.
SELECT 
	AVG(TIMESTAMPDIFF(YEAR, `birthdate`, CURDATE())) 
FROM `geekbrains_vk`.`users`;

#Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
#Следует учесть, что необходимы дни недели текущего года, а не года рождения.
SELECT 
	COUNT(`id`),
	DATE_FORMAT(concat_ws('-', YEAR(NOW()), SUBSTRING(`birthdate`, 6, 10)), '%W') as week_day 
FROM `geekbrains_vk`.`users` 
GROUP BY week_day;

#(по желанию) Подсчитайте произведение чисел в столбце таблицы
SELECT 
	ROUND(exp(sum(log(`id`)))) 
FROM `geekbrains_vk`.`users`;
