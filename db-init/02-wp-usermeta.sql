-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Sep 06, 2026 at 02:32 PM
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
-- Table structure for table `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'infinite_scrolling', 'true'),
(8, 1, 'comment_shortcuts', 'false'),
(9, 1, 'admin_color', 'modern'),
(10, 1, 'use_ssl', '0'),
(11, 1, 'show_admin_bar_front', 'true'),
(12, 1, 'locale', ''),
(13, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(14, 1, 'wp_user_level', '10'),
(15, 1, 'dismissed_wp_pointers', ''),
(16, 1, 'show_welcome_panel', '1'),
(17, 1, 'session_tokens', 'a:2:{s:64:\"07c75034b2a6b9227d99627b7ee60b6e3a9004aaa1bd07503d5d4425dcf2a40d\";a:4:{s:10:\"expiration\";i:1788846063;s:2:\"ip\";s:12:\"192.168.65.1\";s:2:\"ua\";s:80:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:155.0) Gecko/20100101 Firefox/155.0\";s:5:\"login\";i:1788673263;}s:64:\"29214d1ec2a4040b75396ae64f924bf4ccb93f1cafaf832635da99c0b94b8b8b\";a:4:{s:10:\"expiration\";i:1788877336;s:2:\"ip\";s:10:\"172.18.0.1\";s:2:\"ua\";s:80:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:155.0) Gecko/20100101 Firefox/155.0\";s:5:\"login\";i:1788704536;}}'),
(18, 1, 'wp_dashboard_quick_press_last_post_id', '5'),
(19, 1, 'community-events-location', 'a:1:{s:2:\"ip\";s:10:\"172.18.0.0\";}'),
(50, 10, 'nickname', 'taylornigrelli'),
(51, 10, 'first_name', 'Taylor'),
(52, 10, 'last_name', 'Nigrelli'),
(53, 10, 'description', ''),
(54, 10, 'rich_editing', 'true'),
(55, 10, 'syntax_highlighting', 'true'),
(56, 10, 'comment_shortcuts', 'false'),
(57, 10, 'admin_color', 'modern'),
(58, 10, 'use_ssl', '0'),
(59, 10, 'show_admin_bar_front', 'true'),
(60, 10, 'locale', ''),
(61, 10, 'wp_capabilities', 'a:1:{s:11:\"contributor\";b:1;}'),
(62, 10, 'wp_user_level', '1'),
(63, 11, 'nickname', 'elliottaltland'),
(64, 11, 'first_name', 'Elliott'),
(65, 11, 'last_name', 'Altland'),
(66, 11, 'description', ''),
(67, 11, 'rich_editing', 'true'),
(68, 11, 'syntax_highlighting', 'true'),
(69, 11, 'comment_shortcuts', 'false'),
(70, 11, 'admin_color', 'modern'),
(71, 11, 'use_ssl', '0'),
(72, 11, 'show_admin_bar_front', 'true'),
(73, 11, 'locale', ''),
(74, 11, 'wp_capabilities', 'a:1:{s:11:\"contributor\";b:1;}'),
(75, 11, 'wp_user_level', '1'),
(76, 12, 'nickname', 'taylorpangman'),
(77, 12, 'first_name', 'Taylor'),
(78, 12, 'last_name', 'Pangman'),
(79, 12, 'description', ''),
(80, 12, 'rich_editing', 'true'),
(81, 12, 'syntax_highlighting', 'true'),
(82, 12, 'comment_shortcuts', 'false'),
(83, 12, 'admin_color', 'modern'),
(84, 12, 'use_ssl', '0'),
(85, 12, 'show_admin_bar_front', 'true'),
(86, 12, 'locale', ''),
(87, 12, 'wp_capabilities', 'a:1:{s:11:\"contributor\";b:1;}'),
(88, 12, 'wp_user_level', '1'),
(89, 13, 'nickname', 'alainpierrelys'),
(90, 13, 'first_name', 'Alain'),
(91, 13, 'last_name', 'Pierre-Lys'),
(92, 13, 'description', ''),
(93, 13, 'rich_editing', 'true'),
(94, 13, 'syntax_highlighting', 'true'),
(95, 13, 'comment_shortcuts', 'false'),
(96, 13, 'admin_color', 'modern'),
(97, 13, 'use_ssl', '0'),
(98, 13, 'show_admin_bar_front', 'true'),
(99, 13, 'locale', ''),
(100, 13, 'wp_capabilities', 'a:1:{s:11:\"contributor\";b:1;}'),
(101, 13, 'wp_user_level', '1'),
(102, 14, 'nickname', 'navzaddabu'),
(103, 14, 'first_name', 'Navzad'),
(104, 14, 'last_name', 'Dabu'),
(105, 14, 'description', ''),
(106, 14, 'rich_editing', 'true'),
(107, 14, 'syntax_highlighting', 'true'),
(108, 14, 'comment_shortcuts', 'false'),
(109, 14, 'admin_color', 'modern'),
(110, 14, 'use_ssl', '0'),
(111, 14, 'show_admin_bar_front', 'true'),
(112, 14, 'locale', ''),
(113, 14, 'wp_capabilities', 'a:1:{s:11:\"contributor\";b:1;}'),
(114, 14, 'wp_user_level', '1'),
(115, 15, 'nickname', 'joemags'),
(116, 15, 'first_name', 'Joe'),
(117, 15, 'last_name', 'Mags'),
(118, 15, 'description', ''),
(119, 15, 'rich_editing', 'true'),
(120, 15, 'syntax_highlighting', 'true'),
(121, 15, 'comment_shortcuts', 'false'),
(122, 15, 'admin_color', 'modern'),
(123, 15, 'use_ssl', '0'),
(124, 15, 'show_admin_bar_front', 'true'),
(125, 15, 'locale', ''),
(126, 15, 'wp_capabilities', 'a:1:{s:11:\"contributor\";b:1;}'),
(127, 15, 'wp_user_level', '1'),
(128, 16, 'nickname', 'rossbentley'),
(129, 16, 'first_name', 'Ross'),
(130, 16, 'last_name', 'Bentley'),
(131, 16, 'description', ''),
(132, 16, 'rich_editing', 'true'),
(133, 16, 'syntax_highlighting', 'true'),
(134, 16, 'comment_shortcuts', 'false'),
(135, 16, 'admin_color', 'modern'),
(136, 16, 'use_ssl', '0'),
(137, 16, 'show_admin_bar_front', 'true'),
(138, 16, 'locale', ''),
(139, 16, 'wp_capabilities', 'a:1:{s:11:\"contributor\";b:1;}'),
(140, 16, 'wp_user_level', '1'),
(141, 17, 'nickname', 'moraimacapellanpichardo'),
(142, 17, 'first_name', 'Moraima'),
(143, 17, 'last_name', 'Capellán Pichardo'),
(144, 17, 'description', ''),
(145, 17, 'rich_editing', 'true'),
(146, 17, 'syntax_highlighting', 'true'),
(147, 17, 'comment_shortcuts', 'false'),
(148, 17, 'admin_color', 'modern'),
(149, 17, 'use_ssl', '0'),
(150, 17, 'show_admin_bar_front', 'true'),
(151, 17, 'locale', ''),
(152, 17, 'wp_capabilities', 'a:1:{s:11:\"contributor\";b:1;}'),
(153, 17, 'wp_user_level', '1'),
(154, 18, 'nickname', 'zachtennen'),
(155, 18, 'first_name', 'Zach'),
(156, 18, 'last_name', 'Tennen'),
(157, 18, 'description', ''),
(158, 18, 'rich_editing', 'true'),
(159, 18, 'syntax_highlighting', 'true'),
(160, 18, 'comment_shortcuts', 'false'),
(161, 18, 'admin_color', 'modern'),
(162, 18, 'use_ssl', '0'),
(163, 18, 'show_admin_bar_front', 'true'),
(164, 18, 'locale', ''),
(165, 18, 'wp_capabilities', 'a:1:{s:11:\"contributor\";b:1;}'),
(166, 18, 'wp_user_level', '1'),
(167, 19, 'nickname', 'timmullhaupt'),
(168, 19, 'first_name', 'Tim'),
(169, 19, 'last_name', 'Mullhaupt'),
(170, 19, 'description', ''),
(171, 19, 'rich_editing', 'true'),
(172, 19, 'syntax_highlighting', 'true'),
(173, 19, 'comment_shortcuts', 'false'),
(174, 19, 'admin_color', 'modern'),
(175, 19, 'use_ssl', '0'),
(176, 19, 'show_admin_bar_front', 'true'),
(177, 19, 'locale', ''),
(178, 19, 'wp_capabilities', 'a:1:{s:11:\"contributor\";b:1;}'),
(179, 19, 'wp_user_level', '1'),
(180, 20, 'nickname', 'thsstaff'),
(181, 20, 'first_name', 'THS'),
(182, 20, 'last_name', 'Staff'),
(183, 20, 'description', ''),
(184, 20, 'rich_editing', 'true'),
(185, 20, 'syntax_highlighting', 'true'),
(186, 20, 'comment_shortcuts', 'false'),
(187, 20, 'admin_color', 'modern'),
(188, 20, 'use_ssl', '0'),
(189, 20, 'show_admin_bar_front', 'true'),
(190, 20, 'locale', ''),
(191, 20, 'wp_capabilities', 'a:1:{s:11:\"contributor\";b:1;}'),
(192, 20, 'wp_user_level', '1'),
(193, 21, 'nickname', 'colefrederick'),
(194, 21, 'first_name', 'Cole'),
(195, 21, 'last_name', 'Frederick'),
(196, 21, 'description', ''),
(197, 21, 'rich_editing', 'true'),
(198, 21, 'syntax_highlighting', 'true'),
(199, 21, 'comment_shortcuts', 'false'),
(200, 21, 'admin_color', 'modern'),
(201, 21, 'use_ssl', '0'),
(202, 21, 'show_admin_bar_front', 'true'),
(203, 21, 'locale', ''),
(204, 21, 'wp_capabilities', 'a:1:{s:11:\"contributor\";b:1;}'),
(205, 21, 'wp_user_level', '1'),
(206, 22, 'nickname', 'celinabonifacio'),
(207, 22, 'first_name', 'Celina'),
(208, 22, 'last_name', 'Bonifacio'),
(209, 22, 'description', ''),
(210, 22, 'rich_editing', 'true'),
(211, 22, 'syntax_highlighting', 'true'),
(212, 22, 'comment_shortcuts', 'false'),
(213, 22, 'admin_color', 'modern'),
(214, 22, 'use_ssl', '0'),
(215, 22, 'show_admin_bar_front', 'true'),
(216, 22, 'locale', ''),
(217, 22, 'wp_capabilities', 'a:1:{s:11:\"contributor\";b:1;}'),
(218, 22, 'wp_user_level', '1'),
(219, 23, 'nickname', 'stuartseidel'),
(220, 23, 'first_name', 'Stuart'),
(221, 23, 'last_name', 'Seidel'),
(222, 23, 'description', ''),
(223, 23, 'rich_editing', 'true'),
(224, 23, 'syntax_highlighting', 'true'),
(225, 23, 'comment_shortcuts', 'false'),
(226, 23, 'admin_color', 'modern'),
(227, 23, 'use_ssl', '0'),
(228, 23, 'show_admin_bar_front', 'true'),
(229, 23, 'locale', ''),
(230, 23, 'wp_capabilities', 'a:1:{s:11:\"contributor\";b:1;}'),
(231, 23, 'wp_user_level', '1'),
(232, 24, 'nickname', 'kwamebelle'),
(233, 24, 'first_name', 'Kwame'),
(234, 24, 'last_name', 'Belle'),
(235, 24, 'description', ''),
(236, 24, 'rich_editing', 'true'),
(237, 24, 'syntax_highlighting', 'true'),
(238, 24, 'comment_shortcuts', 'false'),
(239, 24, 'admin_color', 'modern'),
(240, 24, 'use_ssl', '0'),
(241, 24, 'show_admin_bar_front', 'true'),
(242, 24, 'locale', ''),
(243, 24, 'wp_capabilities', 'a:1:{s:11:\"contributor\";b:1;}'),
(244, 24, 'wp_user_level', '1'),
(245, 25, 'nickname', 'danilizcapellanpichardo'),
(246, 25, 'first_name', 'Daniliz'),
(247, 25, 'last_name', 'Capellán Pichardo'),
(248, 25, 'description', ''),
(249, 25, 'rich_editing', 'true'),
(250, 25, 'syntax_highlighting', 'true'),
(251, 25, 'comment_shortcuts', 'false'),
(252, 25, 'admin_color', 'modern'),
(253, 25, 'use_ssl', '0'),
(254, 25, 'show_admin_bar_front', 'true'),
(255, 25, 'locale', ''),
(256, 25, 'wp_capabilities', 'a:1:{s:11:\"contributor\";b:1;}'),
(257, 25, 'wp_user_level', '1'),
(258, 26, 'nickname', 'danieltruong'),
(259, 26, 'first_name', 'Daniel'),
(260, 26, 'last_name', 'Truong'),
(261, 26, 'description', ''),
(262, 26, 'rich_editing', 'true'),
(263, 26, 'syntax_highlighting', 'true'),
(264, 26, 'comment_shortcuts', 'false'),
(265, 26, 'admin_color', 'modern'),
(266, 26, 'use_ssl', '0'),
(267, 26, 'show_admin_bar_front', 'true'),
(268, 26, 'locale', ''),
(269, 26, 'wp_capabilities', 'a:1:{s:11:\"contributor\";b:1;}'),
(270, 26, 'wp_user_level', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
