-- Написать крипт, добавляющий в БД vk, которую создали на занятии, 
-- 3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей)

-- Создаем таблицы
-- таблица `games` c играми. 
-- таблица `users_games` со связими пользователей и игр. 
-- таблица `users_games_logs` логирование "любых" событий, которые совершал пользователь с игрой и в игре
-- P.S. сделал минимальный набор таблиц и полей. Для реальных задач будет мало, но дорабатывать можно/нужно предметно под задачи

USE vk; #Локальное название `geekbrains_vk`

DROP TABLE IF EXISTS `games`;
CREATE TABLE `games` (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
    title VARCHAR(128) COMMENT 'Название игры', 
    `status` TINYINT(1),
    created_at DATETIME DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS `users_games`;
CREATE TABLE `users_games`(
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	game_id BIGINT UNSIGNED NOT NULL,
	INDEX (user_id),
    INDEX (game_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (game_id) REFERENCES games(id)
);

DROP TABLE IF EXISTS `users_games_logs`;
CREATE TABLE `users_games_logs`(
	users_games_id BIGINT UNSIGNED NOT NULL,
    metadata JSON,
	created_at DATETIME DEFAULT NOW(),
	PRIMARY KEY (users_games_id),
    FOREIGN KEY (users_games_id) REFERENCES users_games(id)
);