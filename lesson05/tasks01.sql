# Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
ALTER TABLE `geekbrains_vk`.`users` 
	ADD `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `phone`, 
    ADD `updated_at` DATETIME on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `created_at`;
    
UPDATE 
	`geekbrains_vk`.`users` 
SET 
	`geekbrains_vk`.`users`.`created_at`=NOW(), 
	`geekbrains_vk`.`users`.`updated_at`=NOW();

#Таблица users была неудачно спроектирована. Записи created_at и updated_at 
#были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". 
#Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.
UPDATE 
	`geekbrains_vk`.`users` 
SET 
	`created_at`=STR_TO_DATE( `created_at`, '%d.%m.%Y %h:%i');

ALTER TABLE `geekbrains_vk`.`users` CHANGE `created_at` `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP;

#В таблице складских запасов storehouses_products в поле value могут встречаться самые разные 
#цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать 
#записи таким образом, чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы 
#должны выводиться в конце, после всех записей.
SELECT * FROM `geekbrains_vk`.`storehouses_products` ORDER BY `value` = 0, `value` ASC;

#(по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
#Месяцы заданы в виде списка английских названий ('may', 'august')
SELECT * FROM `geekbrains_vk`.`users` WHERE LOWER(DATE_FORMAT(`birthdate`, '%M')) in ('may', 'august');

#(по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. 
#SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.
#P.S. т.к. таблицы catalogs нет, пример сделан на таблице users
SELECT * FROM `geekbrains_vk`.`users` WHERE id IN (5, 1, 2) ORDER BY FIELD(ID, 5,1,2);
