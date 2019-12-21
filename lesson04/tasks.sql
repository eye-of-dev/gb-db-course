#ii. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке
SELECT DISTINCT `firstname` FROM `users` ORDER BY `firstname` ASC;
#iii. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = true). 
#При необходимости предварительно добавить такое поле в таблицу profiles со значением по умолчанию = false (или 0)
ALTER TABLE `profiles` ADD `is_active` TINYINT(1) NOT NULL DEFAULT '0';
UPDATE `profiles` SET `is_active`=1 WHERE TIMESTAMPDIFF(YEAR, `birthday`, CURDATE()) < 18;
#iv. Написать скрипт, удаляющий сообщения «из будущего» (дата позже сегодняшней)
DELETE FROM `messages` WHERE DATE(`created_at`) > CURDATE();