-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 12, 2023 at 10:56 AM
-- Server version: 10.4.27-MariaDB-log
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `facebook implementation`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id_user` int(11) NOT NULL,
  `id_comment` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id_user`, `id_comment`, `id_post`, `content`, `created_at`) VALUES
(1, 1, 1, 'cool', '2023-11-29 12:00:11'),
(2, 2, 1, 'nice', '2023-11-29 12:05:29'),
(3, 3, 1, 'good', '2023-11-29 12:05:29'),
(3, 4, 6, 'nice', '2023-11-29 12:05:29'),
(3, 5, 10, 'you donot invited me', '2023-11-29 12:05:29'),
(4, 6, 10, 'up to 6am', '2023-11-29 12:05:29');

-- --------------------------------------------------------

--
-- Table structure for table `comment_commented`
--

CREATE TABLE `comment_commented` (
  `id_user` int(11) NOT NULL,
  `id_comment_commented` int(11) NOT NULL,
  `id_comment` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comment_like`
--

CREATE TABLE `comment_like` (
  `id_user` int(11) NOT NULL,
  `id_comment` int(11) NOT NULL,
  `reaction` varchar(45) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `id_follower` int(11) NOT NULL,
  `id_following` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id_images` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `path` varchar(45) NOT NULL,
  `id_post` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id_user` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `reaction` varchar(45) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id_post` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id_post`, `content`, `created_at`, `id_user`) VALUES
(1, 'hello', '2023-11-29 11:58:47', 1),
(2, 'Eating garri', '2023-11-29 11:58:47', 2),
(3, 'going to church', '2023-11-29 11:58:47', 1),
(4, 'going to school', '2023-11-29 11:58:47', 4),
(5, 'play football', '2023-11-29 11:58:47', 3),
(6, 'at the beach', '2023-11-29 11:58:47', 2),
(7, 'at the hosipital', '2023-11-29 11:58:47', 1),
(8, 'Eating rice', '2023-11-29 11:58:47', 2),
(9, 'party time', '2023-11-29 11:58:47', 2),
(10, 'doing mathematics', '2023-11-29 11:58:47', 4),
(11, '', '2023-11-29 11:58:47', 3);

--
-- Triggers `post`
--
DELIMITER $$
CREATE TRIGGER `post_BEFORE_INSERT` BEFORE INSERT ON `post` FOR EACH ROW BEGIN

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `post_BEFORE_INSERT_1` BEFORE INSERT ON `post` FOR EACH ROW BEGIN

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `id_user` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(200) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`id_user`, `name`, `email`, `password`, `phone`, `Age`) VALUES
(1, 'john', 'john@gmail.com', 'john123', NULL, NULL),
(2, 'peter', 'peter@gmail.com', 'peter123', NULL, NULL),
(3, 'paul', 'paul@gmail.com', 'paul123', NULL, NULL),
(4, 'jean', 'jean@gmail.com', 'jean123', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `fk_comment_2_idx` (`id_post`),
  ADD KEY `fk_comment_1` (`id_user`);

--
-- Indexes for table `comment_commented`
--
ALTER TABLE `comment_commented`
  ADD PRIMARY KEY (`id_comment_commented`),
  ADD KEY `fk_comment_commented_2_idx` (`id_comment`),
  ADD KEY `fk_comment_commented_1` (`id_user`);

--
-- Indexes for table `comment_like`
--
ALTER TABLE `comment_like`
  ADD PRIMARY KEY (`id_user`,`id_comment`),
  ADD KEY `fk_comment_like_2_idx` (`id_comment`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id_follower`,`id_following`),
  ADD KEY `fk_follow_2_idx` (`id_following`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id_images`),
  ADD KEY `fk_images_1_idx` (`id_post`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id_user`,`id_post`),
  ADD KEY `fk_like_2_idx` (`id_post`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id_post`),
  ADD KEY `fk_post_1_idx` (`id_user`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_1` FOREIGN KEY (`id_user`) REFERENCES `Users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comment_2` FOREIGN KEY (`id_post`) REFERENCES `post` (`id_post`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `comment_commented`
--
ALTER TABLE `comment_commented`
  ADD CONSTRAINT `fk_comment_commented_1` FOREIGN KEY (`id_user`) REFERENCES `Users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comment_commented_2` FOREIGN KEY (`id_comment`) REFERENCES `comment` (`id_comment`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `comment_like`
--
ALTER TABLE `comment_like`
  ADD CONSTRAINT `fk_comment_like_1` FOREIGN KEY (`id_user`) REFERENCES `Users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comment_like_2` FOREIGN KEY (`id_comment`) REFERENCES `comment` (`id_comment`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `fk_follow_1` FOREIGN KEY (`id_follower`) REFERENCES `Users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_follow_2` FOREIGN KEY (`id_following`) REFERENCES `Users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `fk_images_1` FOREIGN KEY (`id_post`) REFERENCES `post` (`id_post`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `fk_like_1` FOREIGN KEY (`id_user`) REFERENCES `Users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_like_2` FOREIGN KEY (`id_post`) REFERENCES `post` (`id_post`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `fk_post_1` FOREIGN KEY (`id_user`) REFERENCES `Users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
