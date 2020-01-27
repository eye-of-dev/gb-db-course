# В таблице products есть два текстовых поля: name с названием 
# товара и description с его описанием. Допустимо присутствие 
# обоих полей или одно из них. Ситуация, когда оба поля принимают 
# неопределенное значение NULL неприемлема. Используя триггеры, добейтесь того, 
# чтобы одно из этих полей или оба поля были заполнены. 
# При попытке присвоить полям NULL-значение необходимо отменить операцию.

DELIMITER //
DROP TRIGGER IF EXISTS check_fields//
CREATE TRIGGER check_fields BEFORE INSERT ON geekbrains_shop.products
FOR EACH ROW
BEGIN
	IF NEW.title is NULL && NEW.description is NULL THEN
    SIGNAL SQLSTATE 45000 SET MESSAGE_TEXT = 'UPDATE canceled both paramets is null';    
    END IF;
END//
DELIMITER ;