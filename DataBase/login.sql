-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2020 at 08:13 PM
-- Server version: 8.0.18
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `login`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root1`@`localhost` PROCEDURE `test` ()  begin
	DROP TABLE IF EXISTS `advisor`;
    CREATE TABLE `advisor` (
  `s_ID` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  `i_ID` varchar(5) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`s_ID`),
  KEY `i_ID` (`i_ID`),
  CONSTRAINT `advisor_ibfk_1` FOREIGN KEY (`i_ID`) REFERENCES `instructor` (`ID`) ON DELETE SET NULL,
  CONSTRAINT `advisor_ibfk_2` FOREIGN KEY (`s_ID`) REFERENCES `student` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `classroom`;
CREATE TABLE `classroom` (
  `building` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `room_number` varchar(7) COLLATE utf8mb4_general_ci NOT NULL,
  `capacity` decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (`building`,`room_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `course_id` varchar(8) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dept_name` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `credits` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `dept_name` (`dept_name`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE SET NULL,
  CONSTRAINT `course_chk_1` CHECK ((`credits` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `dept_name` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `building` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `budget` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`dept_name`),
  CONSTRAINT `department_chk_1` CHECK ((`budget` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `instructor`;
CREATE TABLE `instructor` (
  `ID` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `dept_name` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `dept_name` (`dept_name`),
  CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE SET NULL,
  CONSTRAINT `instructor_chk_1` CHECK ((`salary` > 29000))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `new_view`;


DROP TABLE IF EXISTS `prereq`;

CREATE TABLE `prereq` (
  `course_id` varchar(8) COLLATE utf8mb4_general_ci NOT NULL,
  `prereq_id` varchar(8) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`course_id`,`prereq_id`),
  KEY `prereq_id` (`prereq_id`),
  CONSTRAINT `prereq_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE,
  CONSTRAINT `prereq_ibfk_2` FOREIGN KEY (`prereq_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `section`;

CREATE TABLE `section` (
  `course_id` varchar(8) COLLATE utf8mb4_general_ci NOT NULL,
  `sec_id` varchar(8) COLLATE utf8mb4_general_ci NOT NULL,
  `semester` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
  `year` decimal(4,0) NOT NULL,
  `building` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `room_number` varchar(7) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `time_slot_id` varchar(4) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`course_id`,`sec_id`,`semester`,`year`),
  KEY `building` (`building`,`room_number`),
  CONSTRAINT `section_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE,
  CONSTRAINT `section_ibfk_2` FOREIGN KEY (`building`, `room_number`) REFERENCES `classroom` (`building`, `room_number`) ON DELETE SET NULL,
  CONSTRAINT `section_chk_1` CHECK ((`semester` in (_utf8mb4'Fall',_utf8mb4'Winter',_utf8mb4'Spring',_utf8mb4'Summer'))),
  CONSTRAINT `section_chk_2` CHECK (((`year` > 1701) and (`year` < 2100)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `ID` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `dept_name` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tot_cred` decimal(3,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `dept_name` (`dept_name`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE SET NULL,
  CONSTRAINT `student_chk_1` CHECK ((`tot_cred` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `takes`;

CREATE TABLE `takes` (
  `ID` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  `course_id` varchar(8) COLLATE utf8mb4_general_ci NOT NULL,
  `sec_id` varchar(8) COLLATE utf8mb4_general_ci NOT NULL,
  `semester` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
  `year` decimal(4,0) NOT NULL,
  `grade` varchar(2) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`,`course_id`,`sec_id`,`semester`,`year`),
  KEY `course_id` (`course_id`,`sec_id`,`semester`,`year`),
  CONSTRAINT `takes_ibfk_1` FOREIGN KEY (`course_id`, `sec_id`, `semester`, `year`) REFERENCES `section` (`course_id`, `sec_id`, `semester`, `year`) ON DELETE CASCADE,
  CONSTRAINT `takes_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `student` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



DROP TABLE IF EXISTS `teaches`;

CREATE TABLE `teaches` (
  `ID` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  `course_id` varchar(8) COLLATE utf8mb4_general_ci NOT NULL,
  `sec_id` varchar(8) COLLATE utf8mb4_general_ci NOT NULL,
  `semester` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
  `year` decimal(4,0) NOT NULL,
  PRIMARY KEY (`ID`,`course_id`,`sec_id`,`semester`,`year`),
  KEY `course_id` (`course_id`,`sec_id`,`semester`,`year`),
  CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`course_id`, `sec_id`, `semester`, `year`) REFERENCES `section` (`course_id`, `sec_id`, `semester`, `year`) ON DELETE CASCADE,
  CONSTRAINT `teaches_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `instructor` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `time_slot`;

CREATE TABLE `time_slot` (
  `time_slot_id` varchar(4) COLLATE utf8mb4_general_ci NOT NULL,
  `day` varchar(1) COLLATE utf8mb4_general_ci NOT NULL,
  `start_hr` decimal(2,0) NOT NULL,
  `start_min` decimal(2,0) NOT NULL,
  `end_hr` decimal(2,0) DEFAULT NULL,
  `end_min` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`time_slot_id`,`day`,`start_hr`,`start_min`),
  CONSTRAINT `time_slot_chk_1` CHECK (((`start_hr` >= 0) and (`start_hr` < 24))),
  CONSTRAINT `time_slot_chk_2` CHECK (((`start_min` >= 0) and (`start_min` < 60))),
  CONSTRAINT `time_slot_chk_3` CHECK (((`end_hr` >= 0) and (`end_hr` < 24))),
  CONSTRAINT `time_slot_chk_4` CHECK (((`end_min` >= 0) and (`end_min` < 60)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`) VALUES
('john', 'pass1234');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
