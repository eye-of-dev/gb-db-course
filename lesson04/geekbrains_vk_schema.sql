-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Дек 21 2019 г., 16:58
-- Версия сервера: 5.7.28-0ubuntu0.18.04.4
-- Версия PHP: 7.1.33-3+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `geekbrains_vk`
--
CREATE DATABASE IF NOT EXISTS `geekbrains_vk` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `geekbrains_vk`;

-- --------------------------------------------------------

--
-- Структура таблицы `communities`
--

DROP TABLE IF EXISTS `communities`;
CREATE TABLE `communities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) UNSIGNED NOT NULL,
  `target_user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('requested','approved','unfriended','declined') DEFAULT NULL,
  `requested_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `confirmed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `games`
--

DROP TABLE IF EXISTS `games`;
CREATE TABLE `games` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(128) DEFAULT NULL COMMENT 'Название игры',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `likes`
--

DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `media_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `media_type_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `body` text,
  `filename` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `media_types`
--

DROP TABLE IF EXISTS `media_types`;
CREATE TABLE `media_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_user_id` bigint(20) UNSIGNED NOT NULL,
  `to_user_id` bigint(20) UNSIGNED NOT NULL,
  `body` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `photos`
--

DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `album_id` bigint(20) UNSIGNED NOT NULL,
  `media_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
CREATE TABLE `photo_albums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `profiles`
--

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `hometown` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL COMMENT 'Фамиль',
  `email` varchar(120) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `community_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `users_games`
--

DROP TABLE IF EXISTS `users_games`;
CREATE TABLE `users_games` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `users_games_logs`
--

DROP TABLE IF EXISTS `users_games_logs`;
CREATE TABLE `users_games_logs` (
  `users_games_id` bigint(20) UNSIGNED NOT NULL,
  `metadata` json DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `communities`
--
ALTER TABLE `communities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `communities_name_idx` (`name`);

--
-- Индексы таблицы `friend_requests`
--
ALTER TABLE `friend_requests`
  ADD PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  ADD KEY `initiator_user_id` (`initiator_user_id`),
  ADD KEY `target_user_id` (`target_user_id`);

--
-- Индексы таблицы `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `media_type_id` (`media_type_id`);

--
-- Индексы таблицы `media_types`
--
ALTER TABLE `media_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `messages_from_user_id` (`from_user_id`),
  ADD KEY `messages_to_user_id` (`to_user_id`);

--
-- Индексы таблицы `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `album_id` (`album_id`),
  ADD KEY `media_id` (`media_id`);

--
-- Индексы таблицы `photo_albums`
--
ALTER TABLE `photo_albums`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `users_phone_idx` (`phone`),
  ADD KEY `users_firstname_lastname_idx` (`firstname`,`lastname`);

--
-- Индексы таблицы `users_communities`
--
ALTER TABLE `users_communities`
  ADD PRIMARY KEY (`user_id`,`community_id`),
  ADD KEY `community_id` (`community_id`);

--
-- Индексы таблицы `users_games`
--
ALTER TABLE `users_games`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `game_id` (`game_id`);

--
-- Индексы таблицы `users_games_logs`
--
ALTER TABLE `users_games_logs`
  ADD PRIMARY KEY (`users_games_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `communities`
--
ALTER TABLE `communities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `games`
--
ALTER TABLE `games`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `media_types`
--
ALTER TABLE `media_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `photos`
--
ALTER TABLE `photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `photo_albums`
--
ALTER TABLE `photo_albums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `profiles`
--
ALTER TABLE `profiles`
  MODIFY `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `users_games`
--
ALTER TABLE `users_games`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `friend_requests`
--
ALTER TABLE `friend_requests`
  ADD CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `games_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`);

--
-- Ограничения внешнего ключа таблицы `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`),
  ADD CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`);

--
-- Ограничения внешнего ключа таблицы `photo_albums`
--
ALTER TABLE `photo_albums`
  ADD CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users_communities`
--
ALTER TABLE `users_communities`
  ADD CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`);

--
-- Ограничения внешнего ключа таблицы `users_games`
--
ALTER TABLE `users_games`
  ADD CONSTRAINT `users_games_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `users_games_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`);

--
-- Ограничения внешнего ключа таблицы `users_games_logs`
--
ALTER TABLE `users_games_logs`
  ADD CONSTRAINT `users_games_logs_ibfk_1` FOREIGN KEY (`users_games_id`) REFERENCES `users_games` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
