create view users_data_view as
select 
	`users`.`id`,
    `users`.`email`,
    `profile`.`first_name`,
    `profile`.`last_name`,
    `profile`.`phone`,
    `profile`.`birthday`
from 
	`users`
join 
	`profile` ON `profile`.`user_id` = `users`.`id`