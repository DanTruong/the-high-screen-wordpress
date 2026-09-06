-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Sep 06, 2026 at 04:45 AM
-- Server version: 12.3.3-MariaDB-ubu2404
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wordpress`
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$wp$2y$10$QpY0iH0siy9S4K9JZlac6eK/bNCSFAiUs/pEyO.3WYZmCdWW53c8u', 'admin', 'test@gmail.com', 'http://localhost:8080', '2026-08-26 19:11:52', '', 0, 'admin'),
(10, 'taylornigrelli', '!', 'taylornigrelli', 'taylornigrelli@ths.us', '', '2014-09-01 00:00:00', '', 0, 'Taylor Nigrelli'),
(11, 'elliottaltland', '!', 'elliottaltland', 'elliottaltland@ths.us', '', '2014-10-06 00:00:00', '', 0, 'Elliott Altland'),
(12, 'taylorpangman', '!', 'taylorpangman', 'taylorpangman@ths.us', '', '2014-09-01 00:00:00', '', 0, 'Taylor Pangman'),
(13, 'alainpierrelys', '!', 'alainpierrelys', 'alainpierrelys@ths.us', '', '2014-08-29 00:00:00', '', 0, 'Alain Pierre-Lys'),
(14, 'navzaddabu', '!', 'navzaddabu', 'navzaddabu@ths.us', '', '2014-11-07 00:00:00', '', 0, 'Navzad Dabu'),
(15, 'joemags', '!', 'joemags', 'joemags@ths.us', '', '2014-09-01 00:00:00', '', 0, 'Joe Mags'),
(16, 'rossbentley', '!', 'rossbentley', 'rossbentley@ths.us', '', '2014-10-21 00:00:00', '', 0, 'Ross Bentley'),
(17, 'moraimacapellanpichardo', '!', 'moraimacapellanpichardo', 'moraimacapellanpichardo@ths.us', '', '2014-09-15 00:00:00', '', 0, 'Moraima Capellán Pichardo'),
(18, 'zachtennen', '!', 'zachtennen', 'zachtennen@ths.us', '', '2014-08-29 00:00:00', '', 0, 'Zach Tennen'),
(19, 'timmullhaupt', '!', 'timmullhaupt', 'timmullhaupt@ths.us', '', '2014-08-28 00:00:00', '', 0, 'Tim Mullhaupt'),
(20, 'thsstaff', '!', 'thsstaff', 'thsstaff@ths.us', '', '2014-09-11 00:00:00', '', 0, 'THS Staff'),
(21, 'colefrederick', '!', 'colefrederick', 'colefrederick@ths.us', '', '2014-08-02 00:00:00', '', 0, 'Cole Frederick'),
(22, 'celinabonifacio', '!', 'celinabonifacio', 'celinabonifacio@ths.us', '', '2014-08-29 00:00:00', '', 0, 'Celina Bonifacio'),
(23, 'stuartseidel', '!', 'stuartseidel', 'stuartseidel@ths.us', '', '2014-10-08 00:00:00', '', 0, 'Stuart Seidel'),
(24, 'kwamebelle', '!', 'kwamebelle', 'kwamebelle@ths.us', '', '2014-08-29 00:00:00', '', 0, 'Kwame Belle'),
(25, 'danilizcapellanpichardo', '!', 'danilizcapellanpichardo', 'danilizcapellanpichardo@ths.us', '', '2014-09-09 00:00:00', '', 0, 'Daniliz Capellán Pichardo'),
(26, 'danieltruong', '!', 'danieltruong', 'danieltruong@ths.us', '', '2026-08-26 19:32:33', '', 0, 'Daniel Truong');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
