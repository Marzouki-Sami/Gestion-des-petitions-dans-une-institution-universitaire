-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 30, 2022 at 12:00 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `petition`
--

DROP TABLE IF EXISTS `petition`;
CREATE TABLE IF NOT EXISTS `petition` (
  `petition_id` int(8) NOT NULL AUTO_INCREMENT,
  `petition_titre` text NOT NULL,
  `petition_text` text NOT NULL,
  `petition_date` date NOT NULL,
  `avec` int(10) DEFAULT '0',
  `contre` int(10) DEFAULT '0',
  `user_id` int(8) NOT NULL,
  PRIMARY KEY (`petition_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `petuser`
--

DROP TABLE IF EXISTS `petuser`;
CREATE TABLE IF NOT EXISTS `petuser` (
  `user_id` int(8) NOT NULL,
  `petition_id` int(8) NOT NULL,
  `choix` varchar(10) NOT NULL,
  `commentaire` text NOT NULL,
  PRIMARY KEY (`user_id`,`petition_id`),
  KEY `user_id` (`user_id`),
  KEY `petition_id` (`petition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `table_img`
--

DROP TABLE IF EXISTS `table_img`;
CREATE TABLE IF NOT EXISTS `table_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `taille` int(11) NOT NULL,
  `bin` longblob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mail` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_img`
--

INSERT INTO `table_img` (`id`, `mail`, `type`, `taille`, `bin`) VALUES
(1, 'Joe@gmail.com', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `user_id` int(8) NOT NULL AUTO_INCREMENT,
  `user_nom` varchar(100) NOT NULL,
  `user_pnom` varchar(100) NOT NULL,
  `user_mail` varchar(100) NOT NULL,
  `user_mdp` varchar(100) NOT NULL,
  `user_profession` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_mail` (`user_mail`)
) ENGINE=InnoDB AUTO_INCREMENT=1251 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`user_id`, `user_nom`, `user_pnom`, `user_mail`, `user_mdp`, `user_profession`) VALUES
(1249, 'Marzouki', 'Sami', 'samymarzouki502@gmail.com', '00000000', 'admin'),
(1250, 'Triki', 'Joe', 'Joe@gmail.com', '00000000', 'etudiant');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `petition`
--
ALTER TABLE `petition`
  ADD CONSTRAINT `petition_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `utilisateur` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `petuser`
--
ALTER TABLE `petuser`
  ADD CONSTRAINT `petuser_ibfk_1` FOREIGN KEY (`petition_id`) REFERENCES `petition` (`petition_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `petuser_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `utilisateur` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `table_img`
--
ALTER TABLE `table_img`
  ADD CONSTRAINT `fk11` FOREIGN KEY (`mail`) REFERENCES `utilisateur` (`user_mail`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
