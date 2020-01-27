# В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
# Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.

START TRANSACTION;
INSERT INTO 
	`geekbrains_sample`.`users`
SELECT 
	* 
FROM 
	`geekbrains_shop`.`users` 
WHERE 
	`geekbrains_shop`.`users`.`id` = 1;
DELETE FROM 
	`geekbrains_shop`.`users` 
WHERE 
	`geekbrains_shop`.`users`.`id` = 1;
COMMIT;