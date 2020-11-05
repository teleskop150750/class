-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 05 2020 г., 15:41
-- Версия сервера: 8.0.19
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `class`
--

-- --------------------------------------------------------

--
-- Структура таблицы `disciplines`
--

CREATE TABLE `disciplines` (
  `discipline_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `disciplines`
--

INSERT INTO `disciplines` (`discipline_name`) VALUES
('математика'),
('русский'),
('физика');

-- --------------------------------------------------------

--
-- Структура таблицы `groups`
--

CREATE TABLE `groups` (
  `group_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `groups`
--

INSERT INTO `groups` (`group_name`) VALUES
('3-в-1'),
('4-п-1');

-- --------------------------------------------------------

--
-- Структура таблицы `lessons`
--

CREATE TABLE `lessons` (
  `lesson_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lesson_date` date NOT NULL,
  `teacher_login` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discipline_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `lessons`
--

INSERT INTO `lessons` (`lesson_desc`, `lesson_date`, `teacher_login`, `discipline_name`, `group_name`) VALUES
('89', '2020-10-28', 'ф', 'физика', '4-п-1'),
('классный час', '2020-11-01', 'р', 'русский', '4-п-1'),
('сложение', '2020-11-01', 'ф', 'математика', '3-в-1'),
('сила тяжести', '2020-11-01', 'ф', 'физика', '3-в-1'),
('сила тяжести', '2020-11-01', 'ф', 'физика', '4-п-1'),
('диктант', '2020-11-02', 'р', 'русский', '4-п-1'),
('тема', '2020-11-04', 'р', 'русский', '3-в-1'),
('урок', '2020-11-05', 'ф', 'физика', '3-в-1'),
('тема 2', '2020-11-06', 'р', 'русский', '3-в-1'),
('умножение', '2020-11-13', 'ф', 'математика', '3-в-1');

-- --------------------------------------------------------

--
-- Структура таблицы `students`
--

CREATE TABLE `students` (
  `student_id` int NOT NULL,
  `student_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `students`
--

INSERT INTO `students` (`student_id`, `student_name`, `group_name`) VALUES
(1, 'Вася', '3-в-1'),
(2, 'Дима', '3-в-1'),
(3, 'Миша', '4-п-1'),
(4, 'Оля', '4-п-1'),
(5, 'Лера', '3-в-1');

-- --------------------------------------------------------

--
-- Структура таблицы `students_lessons`
--

CREATE TABLE `students_lessons` (
  `student_id` int NOT NULL,
  `lesson_mark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lesson_date` date NOT NULL,
  `teacher_login` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discipline_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `students_lessons`
--

INSERT INTO `students_lessons` (`student_id`, `lesson_mark`, `lesson_date`, `teacher_login`, `discipline_name`, `group_name`) VALUES
(1, '2', '2020-11-01', 'ф', 'математика', '3-в-1'),
(1, '3', '2020-11-01', 'ф', 'физика', '3-в-1'),
(1, '2', '2020-11-04', 'р', 'русский', '3-в-1'),
(1, '2', '2020-11-05', 'ф', 'физика', '3-в-1'),
(1, '2', '2020-11-06', 'р', 'русский', '3-в-1'),
(1, '', '2020-11-13', 'ф', 'математика', '3-в-1'),
(2, '5', '2020-11-01', 'ф', 'математика', '3-в-1'),
(2, '', '2020-11-01', 'ф', 'физика', '3-в-1'),
(2, '3', '2020-11-04', 'р', 'русский', '3-в-1'),
(2, '4', '2020-11-05', 'ф', 'физика', '3-в-1'),
(2, '', '2020-11-06', 'р', 'русский', '3-в-1'),
(2, '2', '2020-11-13', 'ф', 'математика', '3-в-1'),
(3, '2', '2020-10-28', 'ф', 'физика', '4-п-1'),
(3, '2', '2020-11-01', 'р', 'русский', '4-п-1'),
(3, '5', '2020-11-01', 'ф', 'физика', '4-п-1'),
(3, '7', '2020-11-02', 'р', 'русский', '4-п-1'),
(4, '2', '2020-10-28', 'ф', 'физика', '4-п-1'),
(4, '1', '2020-11-01', 'р', 'русский', '4-п-1'),
(4, '', '2020-11-01', 'ф', 'физика', '4-п-1'),
(4, '3', '2020-11-02', 'р', 'русский', '4-п-1'),
(5, '3', '2020-11-01', 'ф', 'математика', '3-в-1'),
(5, 'нб', '2020-11-01', 'ф', 'физика', '3-в-1'),
(5, '', '2020-11-04', 'р', 'русский', '3-в-1'),
(5, '5', '2020-11-05', 'ф', 'физика', '3-в-1'),
(5, '5', '2020-11-06', 'р', 'русский', '3-в-1'),
(5, '2', '2020-11-13', 'ф', 'математика', '3-в-1');

-- --------------------------------------------------------

--
-- Структура таблицы `teachers`
--

CREATE TABLE `teachers` (
  `teacher_login` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `teachers`
--

INSERT INTO `teachers` (`teacher_login`, `teacher_name`) VALUES
('р', 'Руссичка'),
('ф', 'Физичка');

-- --------------------------------------------------------

--
-- Структура таблицы `teachers_disciplines`
--

CREATE TABLE `teachers_disciplines` (
  `teacher_login` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discipline_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `teachers_disciplines`
--

INSERT INTO `teachers_disciplines` (`teacher_login`, `discipline_name`) VALUES
('ф', 'математика'),
('р', 'русский'),
('ф', 'физика');

-- --------------------------------------------------------

--
-- Структура таблицы `teachers_disciplines_groups`
--

CREATE TABLE `teachers_disciplines_groups` (
  `teacher_login` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discipline_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `teachers_disciplines_groups`
--

INSERT INTO `teachers_disciplines_groups` (`teacher_login`, `discipline_name`, `group_name`) VALUES
('р', 'русский', '3-в-1'),
('ф', 'математика', '3-в-1'),
('ф', 'физика', '3-в-1'),
('р', 'русский', '4-п-1'),
('ф', 'физика', '4-п-1');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `disciplines`
--
ALTER TABLE `disciplines`
  ADD PRIMARY KEY (`discipline_name`);

--
-- Индексы таблицы `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`group_name`);

--
-- Индексы таблицы `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`lesson_date`,`teacher_login`,`discipline_name`,`group_name`),
  ADD KEY `group_name` (`group_name`),
  ADD KEY `teacher_login` (`teacher_login`,`discipline_name`,`group_name`);

--
-- Индексы таблицы `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `students_ibfk_1` (`group_name`);

--
-- Индексы таблицы `students_lessons`
--
ALTER TABLE `students_lessons`
  ADD PRIMARY KEY (`student_id`,`lesson_date`,`teacher_login`,`discipline_name`,`group_name`),
  ADD KEY `teacher_login` (`teacher_login`,`discipline_name`,`group_name`,`lesson_date`);

--
-- Индексы таблицы `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacher_login`);

--
-- Индексы таблицы `teachers_disciplines`
--
ALTER TABLE `teachers_disciplines`
  ADD PRIMARY KEY (`teacher_login`,`discipline_name`),
  ADD KEY `discipline_name` (`discipline_name`);

--
-- Индексы таблицы `teachers_disciplines_groups`
--
ALTER TABLE `teachers_disciplines_groups`
  ADD PRIMARY KEY (`teacher_login`,`discipline_name`,`group_name`),
  ADD KEY `group_name` (`group_name`),
  ADD KEY `discipline_name` (`discipline_name`,`teacher_login`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`teacher_login`,`discipline_name`,`group_name`) REFERENCES `teachers_disciplines_groups` (`teacher_login`, `discipline_name`, `group_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`group_name`) REFERENCES `groups` (`group_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `students_lessons`
--
ALTER TABLE `students_lessons`
  ADD CONSTRAINT `students_lessons_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `students_lessons_ibfk_2` FOREIGN KEY (`teacher_login`,`discipline_name`,`group_name`,`lesson_date`) REFERENCES `lessons` (`teacher_login`, `discipline_name`, `group_name`, `lesson_date`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `teachers_disciplines`
--
ALTER TABLE `teachers_disciplines`
  ADD CONSTRAINT `teachers_disciplines_ibfk_1` FOREIGN KEY (`teacher_login`) REFERENCES `teachers` (`teacher_login`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teachers_disciplines_ibfk_2` FOREIGN KEY (`discipline_name`) REFERENCES `disciplines` (`discipline_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `teachers_disciplines_groups`
--
ALTER TABLE `teachers_disciplines_groups`
  ADD CONSTRAINT `teachers_disciplines_groups_ibfk_1` FOREIGN KEY (`group_name`) REFERENCES `groups` (`group_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teachers_disciplines_groups_ibfk_2` FOREIGN KEY (`discipline_name`,`teacher_login`) REFERENCES `teachers_disciplines` (`discipline_name`, `teacher_login`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
