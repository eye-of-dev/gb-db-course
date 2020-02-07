SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

CREATE DATABASE IF NOT EXISTS `geekbrains_course` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `geekbrains_course`;

DROP TABLE IF EXISTS `edu_courses`;
CREATE TABLE IF NOT EXISTS `edu_courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modules_id` int(11) DEFAULT NULL,
  `tests_id` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL COMMENT 'Название курса',
  `short_description` varchar(255) DEFAULT NULL COMMENT 'Аннотация к курсу',
  `description` text COMMENT 'Описание курса',
  `image` varchar(128) DEFAULT NULL COMMENT 'Обложка',
  `is_active` smallint(1) DEFAULT '0' COMMENT 'Статус',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата обновления',
  PRIMARY KEY (`id`),
  KEY `modules_id_index` (`modules_id`),
  KEY `tests_id_index` (`tests_id`),
  KEY `is_active_index` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Курсы';

DROP TABLE IF EXISTS `edu_lessons`;
CREATE TABLE IF NOT EXISTS `edu_lessons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courses_id` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL COMMENT 'Название урока',
  `short_description` varchar(255) DEFAULT NULL COMMENT 'Аннотация к уроку',
  `description` text COMMENT 'Описание урока',
  `image` varchar(128) DEFAULT NULL COMMENT 'Обложка',
  `timeout` smallint(6) DEFAULT NULL COMMENT 'Задержка открытия урока',
  `is_active` smallint(1) DEFAULT '0' COMMENT 'Статус',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата обновления',
  PRIMARY KEY (`id`),
  KEY `courses_id_index` (`courses_id`),
  KEY `is_active_index` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Уроки';

DROP TABLE IF EXISTS `edu_lessons_tests`;
CREATE TABLE IF NOT EXISTS `edu_lessons_tests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lessons_id` int(11) DEFAULT NULL COMMENT 'Урок',
  `title` varchar(128) DEFAULT NULL COMMENT 'Название задания',
  `video` varchar(128) DEFAULT NULL COMMENT 'Видео-инструкция',
  `description` text COMMENT 'Текст задания',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата обновления',
  PRIMARY KEY (`id`),
  KEY `lessons_id_index` (`lessons_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Задания к урокам';

DROP TABLE IF EXISTS `edu_modules`;
CREATE TABLE IF NOT EXISTS `edu_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tests_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT 'Название модуля',
  `description` text COMMENT 'Описание модуля',
  `image` varchar(128) DEFAULT NULL COMMENT 'Обложка',
  `is_active` smallint(1) DEFAULT '0' COMMENT 'Статус',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата обновления',
  PRIMARY KEY (`id`),
  KEY `is_active_index` (`is_active`),
  KEY `tests_id_index` (`tests_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Модуль/Набор курсов';

DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(64) DEFAULT NULL COMMENT 'Имя',
  `last_name` varchar(64) DEFAULT NULL COMMENT 'Фамилия',
  `birthday` date DEFAULT NULL COMMENT 'Дата рождения',
  `phone` varchar(32) DEFAULT NULL COMMENT 'Телефон',
  UNIQUE KEY `user_id` (`user_id`),
  KEY `user_id_2` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Данные пользователей';
DROP VIEW IF EXISTS `studying_proccess_view`;
CREATE TABLE IF NOT EXISTS `studying_proccess_view` (
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

DROP TABLE IF EXISTS `tests`;
CREATE TABLE IF NOT EXISTS `tests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL COMMENT 'Название теста',
  `short_description` varchar(255) DEFAULT NULL COMMENT 'Короткое описание',
  `description` text COMMENT 'Описание теста',
  `is_active` smallint(1) DEFAULT '0' COMMENT 'Статус',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата обновления',
  PRIMARY KEY (`id`),
  KEY `is_active_index` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Тесты';

DROP TABLE IF EXISTS `tests_questions`;
CREATE TABLE IF NOT EXISTS `tests_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) DEFAULT NULL COMMENT 'Тест',
  `title` varchar(255) DEFAULT NULL COMMENT 'Вопрос',
  `is_active` smallint(6) DEFAULT '0' COMMENT 'Статус',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата обновления',
  PRIMARY KEY (`id`),
  KEY `test_id` (`test_id`),
  KEY `active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Вопросы к тестам';

DROP TABLE IF EXISTS `tests_questions_answers`;
CREATE TABLE IF NOT EXISTS `tests_questions_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL COMMENT 'Вопрос',
  `title` varchar(255) DEFAULT NULL COMMENT 'Ответ',
  `is_correct` smallint(1) DEFAULT '0' COMMENT 'Корректный/Не*',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата обновления',
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  KEY `is_correct` (`is_correct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ответы к вопросам';

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL COMMENT 'Пароль',
  `email` varchar(128) DEFAULT NULL COMMENT 'E-mail',
  `is_active` smallint(1) DEFAULT '1' COMMENT 'Статус',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `is_active_index` (`is_active`),
  KEY `email_index` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Пользователи';
DROP TRIGGER IF EXISTS `add_profile_data`;
DELIMITER $$
CREATE TRIGGER `add_profile_data` AFTER INSERT ON `users` FOR EACH ROW BEGIN
	INSERT INTO `profile`(`user_id`) VALUES (NEW.id);
END
$$
DELIMITER ;
DROP VIEW IF EXISTS `users_data_view`;
CREATE TABLE IF NOT EXISTS `users_data_view` (
`id` int(11)
,`email` varchar(128)
,`first_name` varchar(64)
,`last_name` varchar(64)
,`phone` varchar(32)
,`birthday` date
);

DROP TABLE IF EXISTS `users_edu_courses`;
CREATE TABLE IF NOT EXISTS `users_edu_courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_edu_modules_id` int(11) DEFAULT NULL,
  `courses_id` int(11) DEFAULT NULL COMMENT 'Курс',
  `status` smallint(1) DEFAULT '0' COMMENT 'Статус',
  PRIMARY KEY (`id`),
  KEY `courses_id_index` (`courses_id`),
  KEY `status_index` (`status`),
  KEY `users_edu_modules_id_index` (`users_edu_modules_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `users_edu_lessons`;
CREATE TABLE IF NOT EXISTS `users_edu_lessons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_edu_courses_id` int(11) DEFAULT NULL,
  `lessons_id` int(11) DEFAULT NULL COMMENT 'Урок',
  `status` smallint(1) DEFAULT '0' COMMENT 'Статус',
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата начала урока',
  PRIMARY KEY (`id`),
  KEY `lessons_id_index` (`lessons_id`),
  KEY `status_index` (`status`),
  KEY `users_edu_courses_id_index` (`users_edu_courses_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `users_edu_lessons_tests`;
CREATE TABLE IF NOT EXISTS `users_edu_lessons_tests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_edu_lessons_id` int(11) DEFAULT NULL,
  `tests_id` int(11) DEFAULT NULL COMMENT 'Задание',
  `description` varchar(255) DEFAULT NULL COMMENT 'Ответ на задание',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата обновления',
  PRIMARY KEY (`id`),
  KEY `tests_id_index` (`tests_id`),
  KEY `users_edu_lessons_id_index` (`users_edu_lessons_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DROP TRIGGER IF EXISTS `log_users_tests`;
DELIMITER $$
CREATE TRIGGER `log_users_tests` AFTER UPDATE ON `users_edu_lessons_tests` FOR EACH ROW BEGIN
	INSERT INTO 
		`users_edu_lessons_tests_logs`(`users_edu_lessons_tests_id`, `description`) 
	VALUES (OLD.`id`, OLD.`description`);
END
$$
DELIMITER ;

DROP TABLE IF EXISTS `users_edu_lessons_tests_logs`;
CREATE TABLE IF NOT EXISTS `users_edu_lessons_tests_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_edu_lessons_tests_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL COMMENT 'Ответ на задание',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания',
  PRIMARY KEY (`id`),
  KEY `users_edu_lessons_tests` (`users_edu_lessons_tests_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Таблица логов';

DROP TABLE IF EXISTS `users_edu_modules`;
CREATE TABLE IF NOT EXISTS `users_edu_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) DEFAULT NULL COMMENT 'Пользователь',
  `modules_id` int(11) DEFAULT NULL COMMENT 'Модуль',
  `status` smallint(1) DEFAULT '0' COMMENT 'Статус',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата обновления',
  PRIMARY KEY (`id`),
  KEY `users_id_index` (`users_id`),
  KEY `modules_id_index` (`modules_id`),
  KEY `status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `studying_proccess_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `studying_proccess_view`  AS  select `users_edu_modules`.`users_id` AS `users_id`,`users_edu_modules`.`modules_id` AS `modules_id`,`users_edu_modules`.`status` AS `modules_status`,`users_edu_courses`.`courses_id` AS `courses_id`,`users_edu_courses`.`status` AS `courses_status`,`users_edu_lessons`.`lessons_id` AS `lessons_id`,`users_edu_lessons`.`start_date` AS `start_date`,`users_edu_lessons`.`status` AS `lessons_status`,`users_edu_lessons_tests`.`tests_id` AS `tests_id`,`users_edu_lessons_tests`.`description` AS `description` from (((`users_edu_modules` join `users_edu_courses` on((`users_edu_courses`.`users_edu_modules_id` = `users_edu_modules`.`id`))) join `users_edu_lessons` on((`users_edu_lessons`.`users_edu_courses_id` = `users_edu_courses`.`id`))) join `users_edu_lessons_tests` on((`users_edu_lessons_tests`.`users_edu_lessons_id` = `users_edu_lessons`.`id`))) ;
DROP TABLE IF EXISTS `users_data_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `users_data_view`  AS  select `users`.`id` AS `id`,`users`.`email` AS `email`,`profile`.`first_name` AS `first_name`,`profile`.`last_name` AS `last_name`,`profile`.`phone` AS `phone`,`profile`.`birthday` AS `birthday` from (`users` join `profile` on((`profile`.`user_id` = `users`.`id`))) ;


ALTER TABLE `edu_courses`
  ADD CONSTRAINT `edu_courses_ibfk_1` FOREIGN KEY (`modules_id`) REFERENCES `edu_modules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `edu_courses_ibfk_2` FOREIGN KEY (`tests_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

ALTER TABLE `edu_lessons`
  ADD CONSTRAINT `edu_lessons_ibfk_1` FOREIGN KEY (`courses_id`) REFERENCES `edu_courses` (`id`) ON DELETE CASCADE;

ALTER TABLE `edu_lessons_tests`
  ADD CONSTRAINT `edu_lessons_tests_ibfk_1` FOREIGN KEY (`lessons_id`) REFERENCES `edu_lessons` (`id`) ON DELETE CASCADE;

ALTER TABLE `edu_modules`
  ADD CONSTRAINT `edu_modules_ibfk_1` FOREIGN KEY (`tests_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

ALTER TABLE `tests_questions`
  ADD CONSTRAINT `tests_questions_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE;

ALTER TABLE `tests_questions_answers`
  ADD CONSTRAINT `tests_questions_answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `tests_questions` (`id`) ON DELETE CASCADE;

ALTER TABLE `users_edu_courses`
  ADD CONSTRAINT `users_edu_courses_ibfk_1` FOREIGN KEY (`users_edu_modules_id`) REFERENCES `users_edu_modules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_edu_courses_ibfk_2` FOREIGN KEY (`courses_id`) REFERENCES `edu_courses` (`id`) ON DELETE CASCADE;

ALTER TABLE `users_edu_lessons`
  ADD CONSTRAINT `users_edu_lessons_ibfk_1` FOREIGN KEY (`users_edu_courses_id`) REFERENCES `users_edu_courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_edu_lessons_ibfk_2` FOREIGN KEY (`lessons_id`) REFERENCES `edu_lessons` (`id`) ON DELETE CASCADE;

ALTER TABLE `users_edu_lessons_tests`
  ADD CONSTRAINT `users_edu_lessons_tests_ibfk_1` FOREIGN KEY (`users_edu_lessons_id`) REFERENCES `users_edu_lessons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_edu_lessons_tests_ibfk_2` FOREIGN KEY (`tests_id`) REFERENCES `edu_lessons_tests` (`id`) ON DELETE CASCADE;

ALTER TABLE `users_edu_lessons_tests_logs`
  ADD CONSTRAINT `users_edu_lessons_tests_logs_ibfk` FOREIGN KEY (`users_edu_lessons_tests_id`) REFERENCES `users_edu_lessons_tests` (`id`) ON DELETE CASCADE;

ALTER TABLE `users_edu_modules`
  ADD CONSTRAINT `users_edu_modules_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_edu_modules_ibfk_2` FOREIGN KEY (`modules_id`) REFERENCES `edu_modules` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
