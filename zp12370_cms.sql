-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 21, 2021 at 11:02 AM
-- Server version: 5.7.33-log
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zp12370_cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `aaa`
--

CREATE TABLE `aaa` (
  `aaa` int(11) NOT NULL,
  `bbb` int(11) NOT NULL,
  `ccc` int(11) NOT NULL,
  `ddd` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `published_at` datetime DEFAULT NULL,
  `image_file` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `title`, `content`, `published_at`, `image_file`) VALUES
(1, 'First post', 'aaaaaaaaaaaaaaaaaaaaaaa', '2021-10-07 09:41:35', NULL),
(2, 'Second post', 'Another interesting post aaaaa', NULL, 'ScreenHunter_1321.png'),
(3, 'An interesting post', 'Well this is interesting', '2018-12-19 23:58:55', NULL),
(4, 'Read this!', 'You must read all about this now', '2019-01-10 23:58:55', NULL),
(5, 'An interesting post', 'Yet more interesting information', '2019-12-13 23:58:55', NULL),
(6, 'Another article', 'Some content', NULL, NULL),
(7, 'Yet another', 'more content', NULL, NULL),
(8, 'And another', 'event more content', NULL, 'PICT0005.JPG'),
(300, '10 0\'clock', 'the content', NULL, NULL),
(301, 'aaa', 'xxxxx', '2021-09-13 23:09:00', NULL),
(304, '', '', '0000-00-00 00:00:00', NULL),
(306, 'A new article', 'This contains <strong>HTML</strong> code.', '0000-00-00 00:00:00', NULL),
(307, 'aaa', 'bbbbbccccccccccc', NULL, NULL),
(310, 'oiuysdfdsfsd', 'l,masfdgdsfdsfsd', NULL, 'ScreenHunter_1176.png'),
(311, 'rtwywetye', 'ytkjytkmtu', '0000-00-00 00:00:00', 'PICT0002.JPG'),
(312, 'llllllllllllll', 'kkkkkkkkkkkkkggggggggg', NULL, NULL),
(316, 'lkljkj', ';;lkkkk', NULL, NULL),
(317, 'sdfsafsdfsd', 'xxxx', NULL, NULL),
(318, 'asfdskj.;jkl;', 'kjlhj.l;jku,mkljhlutiljklgmml', '2021-09-30 00:23:00', NULL),
(319, 'l;l;jhklkjljk', 'kjlhjlkkjlhjklj', '2021-10-10 06:49:02', NULL),
(320, 'ertyuiop\'', ';lkmnbvcxx\r\nภาษาไทยใช้ได้ไหม', '2021-09-15 00:31:00', NULL),
(325, 'ffffffffffffffff', 'fffffffffffffffff', NULL, NULL),
(326, 'klklklklklkl', 'klklklklklklklk', '2021-10-08 19:29:00', NULL),
(327, 'tatatatatat', 'tatatatatat', '2021-10-21 12:08:00', NULL),
(328, 'tatatatatat', 'tatatatatat', '2021-10-08 12:08:00', NULL),
(329, 'abababababababab', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `article_category`
--

CREATE TABLE `article_category` (
  `article_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `article_category`
--

INSERT INTO `article_category` (`article_id`, `category_id`) VALUES
(1, 1),
(2, 1),
(300, 1),
(311, 1),
(327, 1),
(328, 1),
(329, 1),
(1, 2),
(2, 2),
(5, 2),
(300, 2),
(310, 2),
(327, 2),
(329, 2),
(312, 3),
(325, 3),
(326, 3),
(328, 3),
(2, 4),
(4, 4),
(319, 4),
(325, 4);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(3, 'education'),
(1, 'news'),
(4, 'products'),
(2, 'technology');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'aaaa', '70c881d4a26984ddce795f6f71817c9cf4480e79'),
(3, 'bbbb', '$2y$10$5pdlMoZO2Io3uWtWIH3Scu8NpYLJwPXUTnhMpQ6cPdj9WXkOI5L36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aaa`
--
ALTER TABLE `aaa`
  ADD PRIMARY KEY (`aaa`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `article_category`
--
ALTER TABLE `article_category`
  ADD PRIMARY KEY (`article_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aaa`
--
ALTER TABLE `aaa`
  MODIFY `aaa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=330;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `article_category`
--
ALTER TABLE `article_category`
  ADD CONSTRAINT `article_category_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `article_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
