select 
	`users`.`id` AS `id`,
    `users`.`email` AS `email`,
    `profile`.`first_name` AS `first_name`,
    `profile`.`last_name` AS `last_name`,
    `profile`.`phone` AS `phone`,
    `profile`.`birthday` AS `birthday` 
from `users` 
join `profile` on `profile`.`user_id` = `users`.`id`