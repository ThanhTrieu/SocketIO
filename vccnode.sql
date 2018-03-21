-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 21, 2018 at 03:07 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vccnode`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addAdmin` (IN `_username` VARCHAR(200), IN `_email` VARCHAR(200))  NO SQL
INSERT INTO Admins(username,email,password,money,status,role,createdAt,updatedAt) VALUES(_username, _email,'13456',10000,1,-1,NULL,NULL)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllDataAdmins` ()  NO SQL
SELECT a.id,a.username, a.email FROM Admins AS a$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllDataChats` ()  NO SQL
SELECT * FROM chats$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getDataMessagerUser` ()  NO SQL
SELECT * FROM chats$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getDataRainByIdCities` (IN `_id` INT UNSIGNED)  NO SQL
SELECT a.nameCity, b.rainfall FROM cities AS a INNER JOIN rains AS b ON a.id = b.id_cities WHERE a.id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getDataRainfall` ()  NO SQL
SELECT a.nameCity, b.rainfall FROM cities AS a INNER JOIN rains AS b ON a.id = b.id_cities$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getDataUserById` (IN `user_id` INT UNSIGNED)  NO SQL
SELECT * FROM Admins AS a WHERE a.id = user_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertDataMessagerUser` (IN `_username` VARCHAR(1000) CHARSET utf8, IN `_message` TEXT CHARSET utf8, IN `_time` DATETIME)  NO SQL
INSERT INTO chats(username,message,time) VALUES(_username, _message, _time)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateMoneyAdminById` (IN `_id` INT, IN `_money` FLOAT)  NO SQL
UPDATE Admins AS a SET a.money =  _money WHERE a.id = _id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Admins`
--

CREATE TABLE `Admins` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `money` float UNSIGNED DEFAULT '10000',
  `status` int(11) DEFAULT '1',
  `role` int(11) DEFAULT '-1',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Admins`
--

INSERT INTO `Admins` (`id`, `username`, `email`, `password`, `money`, `status`, `role`, `createdAt`, `updatedAt`) VALUES
(1, 'i love you123', 'admin@gmail.com', '13456', 10000, 1, -1, NULL, NULL),
(2, 'i love you', 'admin@gmail.com', '13456', 10000, 1, -1, NULL, NULL),
(3, 'admin', 'admin99999@gmail.com', '13456', 10000, 1, -1, NULL, NULL),
(4, 'admin', 'admin99999@gmail.com', '13456', 10000, 1, -1, NULL, NULL),
(5, 'admin', 'admin99999@gmail.com', '13456', 10000, 1, -1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Articles`
--

CREATE TABLE `Articles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `username`, `message`, `time`) VALUES
(1, 'trieu', 'hi', '2018-03-21 14:58:07');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(10) UNSIGNED NOT NULL,
  `nameCity` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `nameCity`, `create_time`, `update_time`) VALUES
(1, 'Tokyo', '2018-01-16 00:00:00', NULL),
(2, 'NewYork', '2018-01-16 00:00:00', NULL),
(3, 'London', '2018-01-16 00:00:00', NULL),
(4, 'Berlin', '2018-01-16 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rains`
--

CREATE TABLE `rains` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_cities` int(10) UNSIGNED NOT NULL,
  `rainfall` float NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rains`
--

INSERT INTO `rains` (`id`, `id_cities`, `rainfall`, `create_time`, `update_time`) VALUES
(1, 1, 71.89, NULL, NULL),
(2, 2, 83.6, NULL, NULL),
(3, 3, 47, NULL, NULL),
(4, 4, 52.6, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_logged_in` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Admins`
--
ALTER TABLE `Admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Articles`
--
ALTER TABLE `Articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rains`
--
ALTER TABLE `rains`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Admins`
--
ALTER TABLE `Admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `Articles`
--
ALTER TABLE `Articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `rains`
--
ALTER TABLE `rains`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
