# Создайте хранимую функцию hello(), которая будет возвращать 
# приветствие, в зависимости от текущего времени суток. 
# С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 
# 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
# с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

DELIMITER //
DROP FUNCTION IF EXISTS hello//
CREATE FUNCTION hello ()
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
	DECLARE `time` INT;
	SET `time` = HOUR(NOW());
    CASE
		WHEN `time` >= 6 && 12 > `time` THEN RETURN 'Доброе утро';
        WHEN `time` >= 12 && 18 > `time` THEN RETURN 'Добрый день';
        WHEN `time` >= 18 && 24 >= `time` THEN RETURN 'Добрый вечер';
        ELSE RETURN 'Доброй ночи';
	END CASE;
END//
SELECT hello()//
DELIMITER ;