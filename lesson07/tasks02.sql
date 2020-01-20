# Выведите список товаров products и разделов catalogs, который соответствует товару.

SELECT 
	`geekbrains_shop`.`products`.`id`, 
	`geekbrains_shop`.`products`.`title` AS product,
	`geekbrains_shop`.`catalogs`.`name` AS catalog
FROM 
	`geekbrains_shop`.`products`
JOIN 
	`geekbrains_shop`.`catalogs` ON `geekbrains_shop`.`catalogs`.`id` = `geekbrains_shop`.`products`.`category_id`;
