# Пусть задан некоторый пользователь. Из всех друзей этого пользователя 
# найдите человека, который больше всех общался с нашим пользователем.

SELECT 
	b.`id`, 
	b.`firstname`, 
    b.`lastname`, 
    COUNT(`messages`.`id`) AS count_messages
FROM 
	`users` AS a
JOIN 
	`friend_requests` ON `friend_requests`.`target_user_id` = a.`id`
JOIN 
	`users` AS b ON b.`id` = `friend_requests`.`initiator_user_id`
JOIN 
	`messages` ON `messages`.`from_user_id` = `friend_requests`.`initiator_user_id` and `messages`.`to_user_id` = 2
WHERE 
	a.`id` = 2 and `friend_requests`.`status` like 'approved' 
GROUP BY 
	`messages`.`from_user_id`
ORDER BY 
	count_messages DESC, b.`id` DESC LIMIT 1

