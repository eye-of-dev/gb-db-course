select 
	`users_edu_modules`.`users_id` AS `users_id`,
	`users_edu_modules`.`modules_id` AS `modules_id`,
    `users_edu_modules`.`status` AS `modules_status`,
    `users_edu_courses`.`courses_id` AS `courses_id`,
    `users_edu_courses`.`status` AS `courses_status`,
    `users_edu_lessons`.`lessons_id` AS `lessons_id`,
    `users_edu_lessons`.`start_date` AS `start_date`,
    `users_edu_lessons`.`status` AS `lessons_status`,
    `users_edu_lessons_tests`.`tests_id` AS `tests_id`,
    `users_edu_lessons_tests`.`description` AS `description` 
from 
	`users_edu_modules` 
join `users_edu_courses` on `users_edu_courses`.`users_edu_modules_id` = `users_edu_modules`.`id`  
join `users_edu_lessons` on `users_edu_lessons`.`users_edu_courses_id` = `users_edu_courses`.`id` 
join `users_edu_lessons_tests` on `users_edu_lessons_tests`.`users_edu_lessons_id` = `users_edu_lessons`.`id` 