# Создайте представление, которое выводит название name товарной позиции 
# из таблицы products и соответствующее название каталога name из таблицы catalogs.

USE `geekbrains_shop`;
CREATE VIEW `products_view` AS
SELECT 
	`geekbrains_shop`.`products`.`title` AS `product_name`,
	`geekbrains_shop`.`catalogs`.`name` AS `catalog_name`
FROM 
	`geekbrains_shop`.`products`
JOIN 
	`geekbrains_shop`.`catalogs` ON `geekbrains_shop`.`products`.`category_id` = `geekbrains_shop`.`catalogs`.`id`;