-- phpMyAdmin SQL Dump
-- version 4.9.1deb2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Янв 24 2020 г., 19:27
-- Версия сервера: 5.7.28-0ubuntu0.18.04.4
-- Версия PHP: 7.1.33-4+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `geekbrains_course`
--
CREATE DATABASE IF NOT EXISTS `geekbrains_course` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `geekbrains_course`;

-- --------------------------------------------------------

--
-- Структура таблицы `edu_courses`
--

DROP TABLE IF EXISTS `edu_courses`;
CREATE TABLE `edu_courses` (
  `id` int(11) NOT NULL,
  `modules_id` int(11) DEFAULT NULL,
  `tests_id` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL COMMENT 'Название курса',
  `short_description` varchar(255) DEFAULT NULL COMMENT 'Аннотация к курсу',
  `description` text COMMENT 'Описание курса',
  `image` varchar(128) DEFAULT NULL COMMENT 'Обложка',
  `is_active` smallint(1) DEFAULT '0' COMMENT 'Статус',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата обновления'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Курсы';

-- --------------------------------------------------------

--
-- Структура таблицы `edu_lessons`
--

DROP TABLE IF EXISTS `edu_lessons`;
CREATE TABLE `edu_lessons` (
  `id` int(11) NOT NULL,
  `courses_id` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL COMMENT 'Название урока',
  `short_description` varchar(255) DEFAULT NULL COMMENT 'Аннотация к уроку',
  `description` text COMMENT 'Описание урока',
  `image` varchar(128) DEFAULT NULL COMMENT 'Обложка',
  `timeout` varchar(255) DEFAULT NULL COMMENT 'Задержка открытия урока',
  `is_active` smallint(1) DEFAULT '0' COMMENT 'Статус',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата обновления'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Уроки';

-- --------------------------------------------------------

--
-- Структура таблицы `edu_lessons_tests`
--

DROP TABLE IF EXISTS `edu_lessons_tests`;
CREATE TABLE `edu_lessons_tests` (
  `id` int(11) NOT NULL,
  `lessons_id` int(11) DEFAULT NULL COMMENT 'Урок',
  `title` varchar(128) DEFAULT NULL COMMENT 'Название задания',
  `video` varchar(128) DEFAULT NULL COMMENT 'Видео-инструкция',
  `description` text COMMENT 'Текст задания',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата обновления'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Задания к урокам';

-- --------------------------------------------------------

--
-- Структура таблицы `edu_modules`
--

DROP TABLE IF EXISTS `edu_modules`;
CREATE TABLE `edu_modules` (
  `id` int(11) NOT NULL,
  `tests_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT 'Название модуля',
  `description` text COMMENT 'Описание модуля',
  `image` varchar(128) DEFAULT NULL COMMENT 'Обложка',
  `is_active` smallint(1) DEFAULT '0' COMMENT 'Статус',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата обновления'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Модуль/Набор курсов';

-- --------------------------------------------------------

--
-- Структура таблицы `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(64) DEFAULT NULL COMMENT 'Имя',
  `last_name` varchar(64) DEFAULT NULL COMMENT 'Фамилия',
  `birthday` date DEFAULT NULL COMMENT 'Дата рождения',
  `phone` varchar(32) DEFAULT NULL COMMENT 'Телефон'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Данные пользователей';

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `studying_proccess_view`
-- (См. Ниже фактическое представление)
--
DROP VIEW IF EXISTS `studying_proccess_view`;
CREATE TABLE `studying_proccess_view` (
`users_id` int(11)
,`modules_id` int(11)
,`modules_status` smallint(1)
,`courses_id` int(11)
,`courses_status` smallint(1)
,`lessons_id` int(11)
,`start_date` timestamp
,`lessons_status` smallint(1)
,`tests_id` int(11)
,`description` varchar(255)
);

-- --------------------------------------------------------

--
-- Структура таблицы `tests`
--

DROP TABLE IF EXISTS `tests`;
CREATE TABLE `tests` (
  `id` int(11) NOT NULL,
  `title` varchar(128) DEFAULT NULL COMMENT 'Название теста',
  `short_description` varchar(255) DEFAULT NULL COMMENT 'Короткое описание',
  `description` text COMMENT 'Описание теста',
  `is_active` smallint(1) DEFAULT '0' COMMENT 'Статус',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата обновления'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Тесты';

-- --------------------------------------------------------

--
-- Структура таблицы `tests_questions`
--

DROP TABLE IF EXISTS `tests_questions`;
CREATE TABLE `tests_questions` (
  `id` int(11) NOT NULL,
  `test_id` int(11) DEFAULT NULL COMMENT 'Тест',
  `title` varchar(255) DEFAULT NULL COMMENT 'Вопрос',
  `is_active` smallint(6) DEFAULT '0' COMMENT 'Статус',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата обновления'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Вопросы к тестам';

-- --------------------------------------------------------

--
-- Структура таблицы `tests_questions_answers`
--

DROP TABLE IF EXISTS `tests_questions_answers`;
CREATE TABLE `tests_questions_answers` (
  `id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL COMMENT 'Вопрос',
  `title` varchar(255) DEFAULT NULL COMMENT 'Ответ',
  `is_correct` smallint(1) DEFAULT '0' COMMENT 'Корректный/Не*',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата обновления'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ответы к вопросам';

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `password` varchar(255) NOT NULL COMMENT 'Пароль',
  `email` varchar(128) DEFAULT NULL COMMENT 'E-mail',
  `is_active` smallint(1) DEFAULT '1' COMMENT 'Статус',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Пользователи';

--
-- Триггеры `users`
--
DROP TRIGGER IF EXISTS `add_profile_data`;
DELIMITER $$
CREATE TRIGGER `add_profile_data` AFTER INSERT ON `users` FOR EACH ROW BEGIN
	INSERT INTO `profile`(`user_id`) VALUES (NEW.id);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `users_data_view`
-- (См. Ниже фактическое представление)
--
DROP VIEW IF EXISTS `users_data_view`;
CREATE TABLE `users_data_view` (
`id` int(11)
,`email` varchar(128)
,`first_name` varchar(64)
,`last_name` varchar(64)
,`phone` varchar(32)
,`birthday` date
);

-- --------------------------------------------------------

--
-- Структура таблицы `users_edu_courses`
--

DROP TABLE IF EXISTS `users_edu_courses`;
CREATE TABLE `users_edu_courses` (
  `id` int(11) NOT NULL,
  `users_edu_modules_id` int(11) DEFAULT NULL,
  `courses_id` int(11) DEFAULT NULL COMMENT 'Курс',
  `status` smallint(1) DEFAULT '0' COMMENT 'Статус'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users_edu_lessons`
--

DROP TABLE IF EXISTS `users_edu_lessons`;
CREATE TABLE `users_edu_lessons` (
  `id` int(11) NOT NULL,
  `users_edu_courses_id` int(11) DEFAULT NULL,
  `lessons_id` int(11) DEFAULT NULL COMMENT 'Урок',
  `status` smallint(1) DEFAULT '0' COMMENT 'Статус',
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата начала урока'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users_edu_lessons_tests`
--

DROP TABLE IF EXISTS `users_edu_lessons_tests`;
CREATE TABLE `users_edu_lessons_tests` (
  `id` int(11) NOT NULL,
  `users_edu_lessons_id` int(11) DEFAULT NULL,
  `tests_id` int(11) DEFAULT NULL COMMENT 'Задание',
  `description` varchar(255) DEFAULT NULL COMMENT 'Ответ на задание',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата обновления'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Триггеры `users_edu_lessons_tests`
--
DROP TRIGGER IF EXISTS `log_users_tests`;
DELIMITER $$
CREATE TRIGGER `log_users_tests` AFTER UPDATE ON `users_edu_lessons_tests` FOR EACH ROW BEGIN
	INSERT INTO 
		`users_edu_lessons_tests_logs`(`users_edu_lessons_tests_id`, `description`) 
	VALUES (OLD.`id`, OLD.`description`);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `users_edu_lessons_tests_logs`
--

DROP TABLE IF EXISTS `users_edu_lessons_tests_logs`;
CREATE TABLE `users_edu_lessons_tests_logs` (
  `id` int(11) NOT NULL,
  `users_edu_lessons_tests_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL COMMENT 'Ответ на задание',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Таблица логов';

-- --------------------------------------------------------

--
-- Структура таблицы `users_edu_modules`
--

DROP TABLE IF EXISTS `users_edu_modules`;
CREATE TABLE `users_edu_modules` (
  `id` int(11) NOT NULL,
  `users_id` int(11) DEFAULT NULL COMMENT 'Пользователь',
  `modules_id` int(11) DEFAULT NULL COMMENT 'Модуль',
  `status` smallint(1) DEFAULT '0' COMMENT 'Статус',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата обновления'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура для представления `studying_proccess_view`
--
DROP TABLE IF EXISTS `studying_proccess_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `studying_proccess_view`  AS  select `users_edu_modules`.`users_id` AS `users_id`,`users_edu_modules`.`modules_id` AS `modules_id`,`users_edu_modules`.`status` AS `modules_status`,`users_edu_courses`.`courses_id` AS `courses_id`,`users_edu_courses`.`status` AS `courses_status`,`users_edu_lessons`.`lessons_id` AS `lessons_id`,`users_edu_lessons`.`start_date` AS `start_date`,`users_edu_lessons`.`status` AS `lessons_status`,`users_edu_lessons_tests`.`tests_id` AS `tests_id`,`users_edu_lessons_tests`.`description` AS `description` from (((`users_edu_modules` join `users_edu_courses` on((`users_edu_courses`.`users_edu_modules_id` = `users_edu_modules`.`id`))) join `users_edu_lessons` on((`users_edu_lessons`.`users_edu_courses_id` = `users_edu_courses`.`id`))) join `users_edu_lessons_tests` on((`users_edu_lessons_tests`.`users_edu_lessons_id` = `users_edu_lessons`.`id`))) ;

-- --------------------------------------------------------

--
-- Структура для представления `users_data_view`
--
DROP TABLE IF EXISTS `users_data_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `users_data_view`  AS  select `users`.`id` AS `id`,`users`.`email` AS `email`,`profile`.`first_name` AS `first_name`,`profile`.`last_name` AS `last_name`,`profile`.`phone` AS `phone`,`profile`.`birthday` AS `birthday` from (`users` join `profile` on((`profile`.`user_id` = `users`.`id`))) ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `edu_courses`
--
ALTER TABLE `edu_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modules_id_index` (`modules_id`),
  ADD KEY `tests_id_index` (`tests_id`),
  ADD KEY `is_active_index` (`is_active`);

--
-- Индексы таблицы `edu_lessons`
--
ALTER TABLE `edu_lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_id_index` (`courses_id`),
  ADD KEY `is_active_index` (`is_active`);

--
-- Индексы таблицы `edu_lessons_tests`
--
ALTER TABLE `edu_lessons_tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lessons_id_index` (`lessons_id`);

--
-- Индексы таблицы `edu_modules`
--
ALTER TABLE `edu_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_active_index` (`is_active`),
  ADD KEY `tests_id_index` (`tests_id`);

--
-- Индексы таблицы `profile`
--
ALTER TABLE `profile`
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `user_id_2` (`user_id`);

--
-- Индексы таблицы `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_active_index` (`is_active`);

--
-- Индексы таблицы `tests_questions`
--
ALTER TABLE `tests_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_id` (`test_id`),
  ADD KEY `active` (`is_active`);

--
-- Индексы таблицы `tests_questions_answers`
--
ALTER TABLE `tests_questions_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `is_correct` (`is_correct`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_active_index` (`is_active`),
  ADD KEY `email_index` (`email`) USING BTREE;

--
-- Индексы таблицы `users_edu_courses`
--
ALTER TABLE `users_edu_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_id_index` (`courses_id`),
  ADD KEY `status_index` (`status`),
  ADD KEY `users_edu_modules_id_index` (`users_edu_modules_id`);

--
-- Индексы таблицы `users_edu_lessons`
--
ALTER TABLE `users_edu_lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lessons_id_index` (`lessons_id`),
  ADD KEY `status_index` (`status`),
  ADD KEY `users_edu_courses_id_index` (`users_edu_courses_id`);

--
-- Индексы таблицы `users_edu_lessons_tests`
--
ALTER TABLE `users_edu_lessons_tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tests_id_index` (`tests_id`),
  ADD KEY `users_edu_lessons_id_index` (`users_edu_lessons_id`);

--
-- Индексы таблицы `users_edu_lessons_tests_logs`
--
ALTER TABLE `users_edu_lessons_tests_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_edu_lessons_tests` (`users_edu_lessons_tests_id`);

--
-- Индексы таблицы `users_edu_modules`
--
ALTER TABLE `users_edu_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id_index` (`users_id`),
  ADD KEY `modules_id_index` (`modules_id`),
  ADD KEY `status_index` (`status`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `edu_courses`
--
ALTER TABLE `edu_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `edu_lessons`
--
ALTER TABLE `edu_lessons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `edu_lessons_tests`
--
ALTER TABLE `edu_lessons_tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `edu_modules`
--
ALTER TABLE `edu_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `tests`
--
ALTER TABLE `tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `tests_questions`
--
ALTER TABLE `tests_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `tests_questions_answers`
--
ALTER TABLE `tests_questions_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users_edu_courses`
--
ALTER TABLE `users_edu_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users_edu_lessons`
--
ALTER TABLE `users_edu_lessons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users_edu_lessons_tests`
--
ALTER TABLE `users_edu_lessons_tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users_edu_lessons_tests_logs`
--
ALTER TABLE `users_edu_lessons_tests_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users_edu_modules`
--
ALTER TABLE `users_edu_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `edu_courses`
--
ALTER TABLE `edu_courses`
  ADD CONSTRAINT `edu_courses_ibfk_1` FOREIGN KEY (`modules_id`) REFERENCES `edu_modules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `edu_courses_ibfk_2` FOREIGN KEY (`tests_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Ограничения внешнего ключа таблицы `edu_lessons`
--
ALTER TABLE `edu_lessons`
  ADD CONSTRAINT `edu_lessons_ibfk_1` FOREIGN KEY (`courses_id`) REFERENCES `edu_courses` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `edu_lessons_tests`
--
ALTER TABLE `edu_lessons_tests`
  ADD CONSTRAINT `edu_lessons_tests_ibfk_1` FOREIGN KEY (`lessons_id`) REFERENCES `edu_lessons` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `edu_modules`
--
ALTER TABLE `edu_modules`
  ADD CONSTRAINT `edu_modules_ibfk_1` FOREIGN KEY (`tests_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Ограничения внешнего ключа таблицы `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tests_questions`
--
ALTER TABLE `tests_questions`
  ADD CONSTRAINT `tests_questions_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tests_questions_answers`
--
ALTER TABLE `tests_questions_answers`
  ADD CONSTRAINT `tests_questions_answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `tests_questions` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users_edu_courses`
--
ALTER TABLE `users_edu_courses`
  ADD CONSTRAINT `users_edu_courses_ibfk_1` FOREIGN KEY (`users_edu_modules_id`) REFERENCES `users_edu_modules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_edu_courses_ibfk_2` FOREIGN KEY (`courses_id`) REFERENCES `edu_courses` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users_edu_lessons`
--
ALTER TABLE `users_edu_lessons`
  ADD CONSTRAINT `users_edu_lessons_ibfk_1` FOREIGN KEY (`users_edu_courses_id`) REFERENCES `users_edu_courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_edu_lessons_ibfk_2` FOREIGN KEY (`lessons_id`) REFERENCES `edu_lessons` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users_edu_lessons_tests`
--
ALTER TABLE `users_edu_lessons_tests`
  ADD CONSTRAINT `users_edu_lessons_tests_ibfk_1` FOREIGN KEY (`users_edu_lessons_id`) REFERENCES `users_edu_lessons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_edu_lessons_tests_ibfk_2` FOREIGN KEY (`tests_id`) REFERENCES `edu_lessons_tests` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users_edu_lessons_tests_logs`
--
ALTER TABLE `users_edu_lessons_tests_logs`
  ADD CONSTRAINT `users_edu_lessons_tests_logs_ibfk` FOREIGN KEY (`users_edu_lessons_tests_id`) REFERENCES `users_edu_lessons_tests` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users_edu_modules`
--
ALTER TABLE `users_edu_modules`
  ADD CONSTRAINT `users_edu_modules_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_edu_modules_ibfk_2` FOREIGN KEY (`modules_id`) REFERENCES `edu_modules` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
