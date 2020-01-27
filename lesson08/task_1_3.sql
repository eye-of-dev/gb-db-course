# (по желанию) Пусть имеется таблица с календарным полем created_at. 
# В ней размещены разряженые календарные записи за 
# август 2018 года '2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17. 
# Составьте запрос, который выводит полный список дат за август, 
# выставляя в соседнем поле значение 1, если дата присутствует 
# в исходном таблице и 0, если она отсутствует.

SELECT 
	`geekbrains_shop`.`range_dates`.`date`,
	IF(
		(
			SELECT 
				`geekbrains_shop`.`dates`.`id` 
			FROM 
				`geekbrains_shop`.`dates` 
			WHERE 
				`geekbrains_shop`.`range_dates`.`date` = `geekbrains_shop`.`dates`.`date`
		),'1','0') AS `count`
FROM 
	`geekbrains_shop`.`range_dates`;
