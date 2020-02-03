# Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, 
# catalogs и products в таблицу logs помещается время и дата создания записи, название таблицы, 
# идентификатор первичного ключа и содержимое поля name.

CREATE TABLE `logs` (
	`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `table_name` varchar(128) DEFAULT NULL COMMENT 'название таблицы',
    `table_field_id` int(10) UNSIGNED NOT NULL COMMENT 'идентификатор первичного ключа',
    `table_field_name` varchar(255) NOT NULL COMMENT ',содержимое поля name',
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COMMENT='Таблица логов';


DELIMITER //
DROP TRIGGER IF EXISTS add_logs_from_users//
CREATE TRIGGER add_logs_from_users AFTER INSERT ON `users`
FOR EACH ROW
BEGIN  
	INSERT INTO `logs` (`table_name`, `table_field_id`, `table_field_name`) VALUES('users', NEW.`id`, NEW.`name`);
END//

DROP TRIGGER IF EXISTS add_logs_from_catalogs//
CREATE TRIGGER add_logs_from_catalogs AFTER INSERT ON `catalogs`
FOR EACH ROW
BEGIN 
	INSERT INTO `logs` (`table_name`, `table_field_id`, `table_field_name`) VALUES('catalogs', NEW.`id`, NEW.`name`);
END//

DROP TRIGGER IF EXISTS add_logs_from_products//
CREATE TRIGGER add_logs_from_products AFTER INSERT ON `products`
FOR EACH ROW
BEGIN  
	INSERT INTO `logs` (`table_name`, `table_field_id`, `table_field_name`) VALUES('products', NEW.`id`, NEW.`name`);
END//
DELIMITER ;
