# (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и 
# таблица городов cities (label, name). Поля from, to и label содержат 
# английские названия городов, поле name — русское. 
# Выведите список рейсов flights с русскими названиями городов.

SELECT 
	`geekbrains_flights`.`flights`.`id`, 
	c1.`name` as `from`, 
    c2.`name` as `to`
FROM 
	`geekbrains_flights`.`flights`
JOIN 
	`geekbrains_flights`.`cities` c1 ON c1.`label` = `geekbrains_flights`.`flights`.`from`
JOIN 
	`geekbrains_flights`.`cities` c2 ON c2.`label` = `geekbrains_flights`.`flights`.`to`;
