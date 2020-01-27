#(по желанию) Пусть имеется любая таблица с календарным 
# полем created_at. Создайте запрос, который удаляет устаревшие 
# записи из таблицы, оставляя только 5 самых свежих записей.

START TRANSACTION;
USE `geekbrains_shop`;
CREATE VIEW `temp_table` AS SELECT `id` FROM `geekbrains_shop`.`orders` ORDER BY `created_at` DESC LIMIT 5;
DELETE FROM `geekbrains_shop`.`orders` WHERE `id` NOT IN (SELECT `id` FROM `geekbrains_shop`.`temp_table`);
DROP VIEW `temp_table`;
COMMIT;


#Логика данного запроса такая:
#Создаем временную таблицу(временное представление), которое содержит последние 5
#записей. А затем удаляем данные из исходной таблицы исключая записи, которые есть во
#временном представлении и затем удаляем и само представление. А чтобы была
#целостность оборачивает это все в транзакции.