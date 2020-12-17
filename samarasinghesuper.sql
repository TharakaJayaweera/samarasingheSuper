-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Dec 17, 2020 at 08:21 PM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `abc`
--
CREATE DATABASE IF NOT EXISTS `abc` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `abc`;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `name` varchar(52) NOT NULL,
  `mobile` char(10) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
--
-- Database: `banana`
--
CREATE DATABASE IF NOT EXISTS `banana` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `banana`;
--
-- Database: `db1questions`
--
CREATE DATABASE IF NOT EXISTS `db1questions` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db1questions`;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `duration` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lecturer`
--

DROP TABLE IF EXISTS `lecturer`;
CREATE TABLE IF NOT EXISTS `lecturer` (
  `lno` int(11) NOT NULL AUTO_INCREMENT,
  `lname` varchar(45) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  PRIMARY KEY (`lno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `training_session`
--

DROP TABLE IF EXISTS `training_session`;
CREATE TABLE IF NOT EXISTS `training_session` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(45) DEFAULT NULL,
  `scancel` varchar(45) DEFAULT NULL,
  `cid` int(11) NOT NULL,
  `lno` int(11) NOT NULL,
  PRIMARY KEY (`sno`),
  KEY `fk_training_session_Course_idx` (`cid`),
  KEY `fk_training_session_lecturer1_idx` (`lno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `training_session`
--
ALTER TABLE `training_session`
  ADD CONSTRAINT `fk_training_session_Course` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`),
  ADD CONSTRAINT `fk_training_session_lecturer1` FOREIGN KEY (`lno`) REFERENCES `lecturer` (`lno`);
--
-- Database: `db1qusestions`
--
CREATE DATABASE IF NOT EXISTS `db1qusestions` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `db1qusestions`;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `duration` varchar(12) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lecturer`
--

DROP TABLE IF EXISTS `lecturer`;
CREATE TABLE IF NOT EXISTS `lecturer` (
  `lno` int(10) NOT NULL AUTO_INCREMENT,
  `lname` int(45) NOT NULL,
  `salary` decimal(45,0) NOT NULL,
  PRIMARY KEY (`lno`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `training_session`
--

DROP TABLE IF EXISTS `training_session`;
CREATE TABLE IF NOT EXISTS `training_session` (
  `sno` int(10) NOT NULL,
  `cid` int(10) NOT NULL,
  `date` date NOT NULL,
  `lno` int(10) NOT NULL,
  `scancel` varchar(45) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
--
-- Database: `employee_management`
--
CREATE DATABASE IF NOT EXISTS `employee_management` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `employee_management`;

-- --------------------------------------------------------

--
-- Table structure for table `banana`
--

DROP TABLE IF EXISTS `banana`;
CREATE TABLE IF NOT EXISTS `banana` (
  `bid` char(5) NOT NULL,
  `name` varchar(200) NOT NULL DEFAULT 'Kankan',
  `class` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`bid`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `depId` char(5) NOT NULL,
  `depname` varchar(255) DEFAULT NULL,
  `empNo` char(4) DEFAULT NULL,
  PRIMARY KEY (`depId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department1`
--

DROP TABLE IF EXISTS `department1`;
CREATE TABLE IF NOT EXISTS `department1` (
  `id` char(5) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `genid` char(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `empNo` char(4) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `gender` char(7) DEFAULT NULL,
  `mobile` char(10) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `basic_sal` float(10,2) DEFAULT NULL,
  `OT` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`empNo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`empNo`, `Name`, `gender`, `mobile`, `city`, `age`, `basic_sal`, `OT`) VALUES
('3', 'Sumanalatha', 'female', '0762541225', 'Gampaha', 22, 75000.00, 2000.00),
('4', 'Tharaka', 'female', '0752541325', 'Gampaha', 22, 20000.00, 2000.00),
('7', 'Chamalki', 'female', '0774521245', 'Gampaha', 22, 60000.00, 2000.00),
('8', 'Kanthi', 'female', '0705234186', 'Gampaha', 22, 70000.00, 5000.00);

-- --------------------------------------------------------

--
-- Table structure for table `lecturer`
--

DROP TABLE IF EXISTS `lecturer`;
CREATE TABLE IF NOT EXISTS `lecturer` (
  `id` char(3) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderpro`
--

DROP TABLE IF EXISTS `orderpro`;
CREATE TABLE IF NOT EXISTS `orderpro` (
  `proid` char(4) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `genid` int(2) DEFAULT NULL,
  PRIMARY KEY (`proid`),
  KEY `genid` (`genid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `proNo` char(4) NOT NULL,
  `proName` varchar(100) DEFAULT NULL,
  `proLocation` varchar(100) DEFAULT NULL,
  `unit_price` float(5,2) DEFAULT NULL,
  PRIMARY KEY (`proNo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productorder`
--

DROP TABLE IF EXISTS `productorder`;
CREATE TABLE IF NOT EXISTS `productorder` (
  `oderNo` char(4) NOT NULL,
  `oderdate` date DEFAULT NULL,
  `customername` varchar(100) DEFAULT NULL,
  `customermobile` char(10) DEFAULT NULL,
  `orderammount` float(8,2) DEFAULT NULL,
  PRIMARY KEY (`oderNo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `productorder`
--

INSERT INTO `productorder` (`oderNo`, `oderdate`, `customername`, `customermobile`, `orderammount`) VALUES
('1', '2020-01-06', 'Vimala', '0701235241', 2050.00),
('2', '2020-08-08', 'Nimal', '0764521241', 500.00),
('3', '2020-08-09', 'Siril', '0775456321', 3500.00),
('4', '2020-08-12', 'Piyumi', '0705656321', 600.00),
('5', '2020-08-13', 'Kanishka', '0752656321', 1550.00),
('6', '2020-09-01', 'Kanishka', '0752656321', 2000.00);

-- --------------------------------------------------------

--
-- Table structure for table `student1`
--

DROP TABLE IF EXISTS `student1`;
CREATE TABLE IF NOT EXISTS `student1` (
  `id` char(3) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `student1`
--

INSERT INTO `student1` (`id`, `name`) VALUES
('1', 'Kamal'),
('2', 'Nimal'),
('3', 'Sumanalatha'),
('4', 'Piyumi');

-- --------------------------------------------------------

--
-- Table structure for table `student2`
--

DROP TABLE IF EXISTS `student2`;
CREATE TABLE IF NOT EXISTS `student2` (
  `id` char(3) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `student2`
--

INSERT INTO `student2` (`id`, `name`) VALUES
('1', 'Kamal'),
('2', 'Dias'),
('3', 'Silva'),
('4', 'Sumanalatha'),
('5', 'Ashali'),
('6', 'Ruwini');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE IF NOT EXISTS `supplier` (
  `supNo` char(4) NOT NULL,
  `supName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`supNo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supNo`, `supName`) VALUES
('1', 'Maliban'),
('2', 'Munchee'),
('3', 'Ritzbury'),
('4', 'Kandos');

-- --------------------------------------------------------

--
-- Table structure for table `supply`
--

DROP TABLE IF EXISTS `supply`;
CREATE TABLE IF NOT EXISTS `supply` (
  `proNo` char(4) NOT NULL,
  `supNo` char(4) NOT NULL,
  `quntity` int(5) DEFAULT NULL,
  PRIMARY KEY (`proNo`,`supNo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test1`
--

DROP TABLE IF EXISTS `test1`;
CREATE TABLE IF NOT EXISTS `test1` (
  `id` char(2) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `test1`
--

INSERT INTO `test1` (`id`, `name`) VALUES
('1', 'A'),
('2', 'B'),
('3', 'C'),
('4', 'D');

-- --------------------------------------------------------

--
-- Table structure for table `test2`
--

DROP TABLE IF EXISTS `test2`;
CREATE TABLE IF NOT EXISTS `test2` (
  `id` char(3) DEFAULT NULL,
  `name` varchar(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `test2`
--

INSERT INTO `test2` (`id`, `name`) VALUES
('1', 'A'),
('2', 'B'),
('3', 'C'),
('4', 'E');
--
-- Database: `join_question`
--
CREATE DATABASE IF NOT EXISTS `join_question` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `join_question`;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id` char(3) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`) VALUES
('1', 'kanishka'),
('2', 'Piyumi'),
('3', 'hansi'),
('4', 'Prasad');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `departmentId` int(3) DEFAULT NULL,
  `departmentName` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentId`, `departmentName`) VALUES
(31, 'Sales'),
(33, 'Engineering'),
(34, 'Clerical'),
(35, 'Marketing');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `lastname` varchar(30) DEFAULT NULL,
  `departmentId` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`lastname`, `departmentId`) VALUES
('Rafferty', 31),
('Jones', 33),
('Haisenberg', 33),
('Robinson', 34),
('Smith', 34),
('Williams', 0);

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
CREATE TABLE IF NOT EXISTS `gender` (
  `id` char(2) NOT NULL,
  `name` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`id`, `name`) VALUES
('1', 'male'),
('2', 'female');
--
-- Database: `prison`
--
CREATE DATABASE IF NOT EXISTS `prison` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `prison`;

-- --------------------------------------------------------

--
-- Table structure for table `commendation`
--

DROP TABLE IF EXISTS `commendation`;
CREATE TABLE IF NOT EXISTS `commendation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `offence_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `blood_group` varchar(255) DEFAULT NULL,
  `calling_name` varchar(255) DEFAULT NULL,
  `civil_status` varchar(255) DEFAULT NULL,
  `date_of_assignment` date DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `department_id_number` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `employee_status` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `land` varchar(255) DEFAULT NULL,
  `mobile_one` varchar(10) DEFAULT NULL,
  `mobile_two` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nic` varchar(12) DEFAULT NULL,
  `office_email` varchar(255) DEFAULT NULL,
  `pay_role_number` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jfk5lm7km0hiihwy31v38lwn1` (`department_id_number`),
  UNIQUE KEY `UK_fopic1oh5oln2khj8eat6ino0` (`email`),
  UNIQUE KEY `UK_dihajhqd7lkqn3lhsawly3t9r` (`nic`),
  UNIQUE KEY `UK_ldqrk7j96ef2tqxsonr4dqf0r` (`office_email`),
  UNIQUE KEY `UK_p4cii54303gpy9dt5ia7wo6c5` (`pay_role_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_files`
--

DROP TABLE IF EXISTS `employee_files`;
CREATE TABLE IF NOT EXISTS `employee_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `new_id` varchar(255) DEFAULT NULL,
  `new_name` varchar(255) DEFAULT NULL,
  `pic` longblob,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5eob6je5op1e4m7v20v5i01p2` (`new_id`),
  KEY `FKolualpa5dydj5r06txltc1y6d` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `institute`
--

DROP TABLE IF EXISTS `institute`;
CREATE TABLE IF NOT EXISTS `institute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `land` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `prison_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_lhi2pib6w2sila0htss9uy8km` (`email`),
  UNIQUE KEY `UK_4vio7xcac4evp60kfioyud3x9` (`land`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offence`
--

DROP TABLE IF EXISTS `offence`;
CREATE TABLE IF NOT EXISTS `offence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `offence_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `punishment`
--

DROP TABLE IF EXISTS `punishment`;
CREATE TABLE IF NOT EXISTS `punishment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `punishment_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qualification`
--

DROP TABLE IF EXISTS `qualification`;
CREATE TABLE IF NOT EXISTS `qualification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `complete_date` date DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `institute` varchar(255) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3r1dqywujwsb4fxx6dfqn8fv6` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_iubw515ff0ugtm28p8g3myt0h` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`),
  KEY `FK211dk0pe7l3aibwce8yy61ota` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  KEY `FK859n2jvi8ivhui0rl0esws6o` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_session_log`
--

DROP TABLE IF EXISTS `user_session_log`;
CREATE TABLE IF NOT EXISTS `user_session_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `failure_attempts` int(11) NOT NULL,
  `user_session_log_status` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrhb4wune1hnnhdsbiah2ojo5l` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee_files`
--
ALTER TABLE `employee_files`
  ADD CONSTRAINT `FKolualpa5dydj5r06txltc1y6d` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `qualification`
--
ALTER TABLE `qualification`
  ADD CONSTRAINT `FK3r1dqywujwsb4fxx6dfqn8fv6` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK211dk0pe7l3aibwce8yy61ota` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `user_session_log`
--
ALTER TABLE `user_session_log`
  ADD CONSTRAINT `FKrhb4wune1hnnhdsbiah2ojo5l` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
--
-- Database: `question`
--
CREATE DATABASE IF NOT EXISTS `question` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `question`;

-- --------------------------------------------------------

--
-- Table structure for table `t1`
--

DROP TABLE IF EXISTS `t1`;
CREATE TABLE IF NOT EXISTS `t1` (
  `col1` char(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t1`
--

INSERT INTO `t1` (`col1`) VALUES
('Amal'),
('Amaya'),
('Gamini'),
('Kamala'),
('Kamal'),
('Piyal'),
('xyz'),
('shifaz'),
('rtz'),
('Hafaz'),
('Hasaz'),
('Basaz');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v1`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `v1`;
CREATE TABLE IF NOT EXISTS `v1` (
`col1` char(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v2`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `v2`;
CREATE TABLE IF NOT EXISTS `v2` (
`col1` char(10)
);

-- --------------------------------------------------------

--
-- Structure for view `v1`
--
DROP TABLE IF EXISTS `v1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v1`  AS  select `t1`.`col1` AS `col1` from `t1` where (`t1`.`col1` like 'A%') ;

-- --------------------------------------------------------

--
-- Structure for view `v2`
--
DROP TABLE IF EXISTS `v2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v2`  AS  select `v1`.`col1` AS `col1` from `v1` where (`v1`.`col1` like '%Z') WITH LOCAL CHECK OPTION ;
--
-- Database: `samarasinghesuper`
--
CREATE DATABASE IF NOT EXISTS `samarasinghesuper` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `samarasinghesuper`;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
CREATE TABLE IF NOT EXISTS `branch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `active_or_inactive` varchar(255) DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `land` varchar(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_q5alqrisfvpjk2t07gw4sofe` (`email`),
  UNIQUE KEY `UK_qhj0ftjq5ilvwcag1hoxd587f` (`land`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active_or_inactive` varchar(255) DEFAULT NULL,
  `main_category` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `live_or_dead` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `active_or_inactive`, `main_category`, `name`, `live_or_dead`) VALUES
(1, 'ACTIVE', 'MILK_POWDER', 'Maliban', NULL),
(2, 'ACTIVE', 'MILK_POWDER', 'Anchor', NULL),
(3, 'ACTIVE', 'RICE_PULSES', 'Nadu', NULL),
(4, 'ACTIVE', 'RICE_PULSES', 'Araliya', NULL),
(5, 'ACTIVE', 'DAIRY_PRODUCTS', 'Youghert', NULL),
(6, 'ACTIVE', 'DAIRY_PRODUCTS', 'Ice Cream', NULL),
(7, 'ACTIVE', 'DAIRY_PRODUCTS', 'Curd', NULL),
(8, 'ACTIVE', 'BABY_PRODUCTS', 'Soap', NULL),
(9, 'ACTIVE', 'BABY_PRODUCTS', 'Shampoo', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `active_or_inactive` varchar(255) DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nic` varchar(12) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `live_or_dead` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_rm1bp9bhtiih5foj17t8l500j` (`code`),
  UNIQUE KEY `UK_dwk6cx0afu8bs9o4t536v1j5v` (`email`),
  UNIQUE KEY `UK_4h6a5iro7ibjn1v8g2n7pktiw` (`mobile`),
  UNIQUE KEY `UK_9st6x9trhf0s27g0vgpcaeu3m` (`nic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_ratio`
--

DROP TABLE IF EXISTS `discount_ratio`;
CREATE TABLE IF NOT EXISTS `discount_ratio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `active_or_inactive` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `name` varchar(45) NOT NULL,
  `live_or_dead` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `active_or_inactive` varchar(255) DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `calling_name` varchar(255) DEFAULT NULL,
  `civil_status` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `date_of_assignment` date DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `employee_status` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `land` varchar(10) DEFAULT NULL,
  `mobile_one` varchar(10) DEFAULT NULL,
  `mobile_two` varchar(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nic` varchar(12) DEFAULT NULL,
  `office_email` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `live_or_dead` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_nbyivu8qgmx0r7wtbplf01gf8` (`code`),
  UNIQUE KEY `UK_dihajhqd7lkqn3lhsawly3t9r` (`nic`),
  UNIQUE KEY `UK_ldqrk7j96ef2tqxsonr4dqf0r` (`office_email`),
  KEY `FKcvhlsx8tao1rxt7mpxrot61jt` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `active_or_inactive`, `address`, `calling_name`, `civil_status`, `code`, `date_of_assignment`, `date_of_birth`, `designation`, `employee_status`, `gender`, `land`, `mobile_one`, `mobile_two`, `name`, `nic`, `office_email`, `title`, `branch_id`, `live_or_dead`) VALUES
(1, '2020-12-17 22:15:51.218665', 'anonymousUser', '2020-12-17 22:15:51.218665', 'anonymousUser', 'ACTIVE', NULL, 'Admin', 'UNMARRIED', '11111111', '2020-12-17', '2002-12-17', 'ADMIN', 'WORKING', 'MALE', NULL, '0750000000', NULL, '908670000V', NULL, NULL, 'MR', NULL, NULL),
(2, '2020-12-17 22:36:59.919763', 'admin', '2020-12-17 22:59:23.076270', 'admin', NULL, 'Kandy', 'Nuwan', 'MARRIED', 'SSEP200000', '2020-12-16', '1994-11-02', 'MANAGER', 'WORKING', 'MALE', '0117894125', '0701817980', '0701417980', 'Nuwan Bandara', '943072515V', 'keerthinuwan12345@gmail.com', 'MR', NULL, NULL),
(3, '2020-12-17 22:40:38.045884', 'admin', '2020-12-17 22:40:38.045884', 'admin', 'ACTIVE', 'Kadawatha', 'Kamal', 'MARRIED', 'GRIE200001', '2020-12-16', '1985-04-29', 'PROCUREMENT_MANAGER', 'LEAVE', 'MALE', '0112978451', '0708817980', '0708817980', 'Kamal mallwarachchi', '851206214V', 'kamal123@gmail.com', 'MR', NULL, NULL),
(4, '2020-12-17 22:42:00.122004', 'admin', '2020-12-17 22:42:00.122004', 'admin', 'ACTIVE', 'Kurunegala', 'Asanka', 'MARRIED', 'GRIE200002', '2020-12-16', '1990-05-04', 'HR_MANAGER', 'WORKING', 'MALE', '0334563217', '0775412547', '0745412547', 'Asanka Kahatapitiya', '901253645V', 'asahhhahatapitiya@gmail.com', 'MR', NULL, NULL),
(5, '2020-12-17 22:43:25.110378', 'admin', '2020-12-17 22:43:25.110378', 'admin', 'ACTIVE', 'Kaduwela', 'Nimali', 'UNMARRIED', 'GRIE200003', '2020-12-16', '1982-02-10', 'CASHIER', 'WORKING', 'FEMALE', '0115789654', '0712457854', '0714596321', 'Nimali Jayawardana', '825412724V', 'nimali@gmail.com', 'MRS', NULL, NULL),
(6, '2020-12-17 22:45:11.222352', 'admin', '2020-12-17 22:45:11.222352', 'admin', 'ACTIVE', 'Jaela', 'Dananjaya', 'MARRIED', 'GRIE200004', '2020-12-16', '1998-09-10', 'CASHIER', 'WORKING', 'MALE', '0335487541', '0714562145', '0714562145', 'Dananjaya Nonis', '982541253V', 'dananjaya@gmail.com', 'MR', NULL, NULL),
(7, '2020-12-17 22:46:49.092988', 'admin', '2020-12-17 22:46:49.092988', 'admin', 'ACTIVE', 'Gampaha', 'Susith', 'MARRIED', 'GRIE200005', '2020-12-15', '1990-05-02', 'ADMIN', 'WORKING', 'MALE', '0335412478', '0772330520', '0745145666', 'Susith Senasuma', '901232412V', 'susithsenasuma@gmail.com', 'MR', NULL, NULL),
(8, '2020-12-17 23:01:09.323440', 'admin', '2020-12-17 23:01:09.323440', 'admin', 'ACTIVE', 'Veyangoda', 'Tharaka', 'MARRIED', 'SSEP200006', '2020-12-16', '1994-01-08', 'HR_MANAGER', 'WORKING', 'FEMALE', '0332155555', '0761817940', '0761817940', 'Tharaka Jayaweera', '945082526V', 'jtnjayaweera@gmail.com', 'MRS', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_files`
--

DROP TABLE IF EXISTS `employee_files`;
CREATE TABLE IF NOT EXISTS `employee_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `new_id` varchar(255) DEFAULT NULL,
  `new_name` varchar(255) DEFAULT NULL,
  `pic` longblob,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5eob6je5op1e4m7v20v5i01p2` (`new_id`),
  KEY `FKolualpa5dydj5r06txltc1y6d` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employee_files`
--

INSERT INTO `employee_files` (`id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `mime_type`, `name`, `new_id`, `new_name`, `pic`, `employee_id`) VALUES
(1, '2020-12-17 22:37:00.105802', 'admin', '2020-12-17 22:59:23.237839', 'admin', 'image/jpeg', '150-1503387_moana-wallpaper-33-moana-hd-wallpapers-moana-wallpaper.jpg', 'ae74c373-ceca-416f-8c89-265dbc220357employee', '943072515V-2020-12-17T22:36:59.972621100', '', 2),
(2, '2020-12-17 22:40:38.116705', 'admin', '2020-12-17 22:40:38.116705', 'admin', 'application/octet-stream', '', '3b0e0d08-376a-4632-9472-89434e460644employee', '851206214V-2020-12-17T22:40:38.110713400', '', 3),
(3, '2020-12-17 22:42:00.152785', 'admin', '2020-12-17 22:42:00.152785', 'admin', 'application/octet-stream', '', 'd0ebf792-2781-4b8a-9b40-cc060fcf039demployee', '901253645V-2020-12-17T22:42:00.145723800', '', 4),
(4, '2020-12-17 22:43:25.142294', 'admin', '2020-12-17 22:43:25.142294', 'admin', 'application/octet-stream', '', 'c58ecb3c-3059-4198-802e-6f10bea6be91employee', '825412724V-2020-12-17T22:43:25.131318300', '', 5),
(5, '2020-12-17 22:45:11.246288', 'admin', '2020-12-17 22:45:11.246288', 'admin', 'application/octet-stream', '', '58d40c6d-c34f-4c8d-a9ec-8d922fc1568femployee', '982541253V-2020-12-17T22:45:11.241301', '', 6),
(6, '2020-12-17 22:46:49.125899', 'admin', '2020-12-17 22:46:49.125899', 'admin', 'application/octet-stream', '', 'e97bb2c9-161f-4085-859f-c5ae72e6e82cemployee', '901232412V-2020-12-17T22:46:49.120912900', '', 7),
(7, '2020-12-17 23:01:09.354357', 'admin', '2020-12-17 23:01:09.354357', 'admin', 'application/octet-stream', '', '399ff18d-50e0-42a6-8839-349008cf3760employee', '945082526V-2020-12-17T23:01:09.342388500', '', 8);

-- --------------------------------------------------------

--
-- Table structure for table `good_received_note`
--

DROP TABLE IF EXISTS `good_received_note`;
CREATE TABLE IF NOT EXISTS `good_received_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `active_or_inactive` varchar(255) DEFAULT NULL,
  `good_received_note_state` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `purchase_order_id` int(11) DEFAULT NULL,
  `live_or_dead` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl2ij2erc8mi59decwkp0fj4b4` (`purchase_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `good_received_note`
--

INSERT INTO `good_received_note` (`id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `active_or_inactive`, `good_received_note_state`, `remarks`, `total_amount`, `purchase_order_id`, `live_or_dead`) VALUES
(1, '2020-12-18 01:39:15.618578', 'admin', '2020-12-18 01:39:15.618578', 'admin', NULL, 'NOT_PAID', NULL, '26000.00', 1, 'ACTIVE'),
(2, '2020-12-18 01:48:43.073400', 'admin', '2020-12-18 01:48:43.073400', 'admin', NULL, 'NOT_PAID', NULL, '7100.00', 2, 'ACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `active_or_inactive` varchar(255) DEFAULT NULL,
  `amount_tendered` decimal(10,2) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `card_number` varchar(255) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `invoice_print_or_not` varchar(255) DEFAULT NULL,
  `invoice_valid_or_not` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `discount_ratio_id` int(11) DEFAULT NULL,
  `live_or_dead` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_7jq4q4t65on0ftpce6rjb17m9` (`code`),
  KEY `FK5e32ukwo9uknwhylogvta4po6` (`customer_id`),
  KEY `FKaqmv80i9p25a4fsj8x0e60shi` (`discount_ratio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_item`
--

DROP TABLE IF EXISTS `invoice_item`;
CREATE TABLE IF NOT EXISTS `invoice_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `active_or_inactive` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) NOT NULL,
  `sell_price` decimal(10,2) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbu6tmpd0mtgu9wrw5bj5uv09v` (`invoice_id`),
  KEY `FK4985co9rso0r7m8qsemxsf60i` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_ledger`
--

DROP TABLE IF EXISTS `invoice_ledger`;
CREATE TABLE IF NOT EXISTS `invoice_ledger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `live_or_dead` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) NOT NULL,
  `sell_price` decimal(10,2) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `ledger_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK65qvs2i9symtxe2qgon4r5shh` (`invoice_id`),
  KEY `FK9qknplcs4oc7oii5b6d1o5rpg` (`ledger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `active_or_inactive` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `item_status` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rop` varchar(255) DEFAULT NULL,
  `sell_price` decimal(10,2) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `live_or_dead` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6cgogdarkq48dlg1lbnv4q1oq` (`code`),
  KEY `FK2n9w8d0dp4bsfra9dcg0046l4` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `active_or_inactive`, `code`, `item_status`, `name`, `rop`, `sell_price`, `category_id`, `live_or_dead`) VALUES
(1, '2020-12-18 00:22:46.631865', 'admin', '2020-12-18 00:22:46.631865', 'admin', NULL, 'SSIN200000', NULL, 'Nadu Samba 5Kg', '20', '500.00', 3, 'ACTIVE'),
(2, '2020-12-18 00:23:25.587744', 'admin', '2020-12-18 00:23:25.587744', 'admin', NULL, 'SSIN200001', NULL, 'Malian 400g', '100', '380.00', 1, 'ACTIVE'),
(3, '2020-12-18 00:23:49.829130', 'admin', '2020-12-18 00:23:49.829130', 'admin', NULL, 'SSIN200002', NULL, 'Anchor 400g', '100', '400.00', 2, 'ACTIVE'),
(4, '2020-12-18 00:24:14.091262', 'admin', '2020-12-18 00:24:14.091262', 'admin', NULL, 'SSIN200003', NULL, 'Maliban 1Kg', '100', '900.00', 1, 'ACTIVE'),
(5, '2020-12-18 00:25:01.148664', 'admin', '2020-12-18 00:25:01.148664', 'admin', NULL, 'SSIN200004', NULL, 'Anchor 1Kg', '100', '1000.00', 2, 'ACTIVE'),
(6, '2020-12-18 00:25:22.361498', 'admin', '2020-12-18 00:25:22.361498', 'admin', NULL, 'SSIN200005', NULL, 'Kothmale', '200', '35.00', 5, 'ACTIVE'),
(7, '2020-12-18 00:25:43.158140', 'admin', '2020-12-18 00:25:43.158140', 'admin', NULL, 'SSIN200006', NULL, 'Newdale', '100', '40.00', 5, 'ACTIVE'),
(8, '2020-12-18 00:26:08.513444', 'admin', '2020-12-18 00:26:08.513444', 'admin', NULL, 'SSIN200007', NULL, 'Baby cherami', '200', '50.00', 8, 'ACTIVE'),
(9, '2020-12-18 00:26:42.079243', 'admin', '2020-12-18 00:26:42.079243', 'admin', NULL, 'SSIN200008', NULL, 'Pears Baby', '200', '300.00', 8, 'ACTIVE'),
(10, '2020-12-18 00:27:16.504024', 'admin', '2020-12-18 00:27:16.504024', 'admin', NULL, 'SSIN200009', NULL, 'Baby Cheramy Sahampo', '20', '180.00', 9, 'ACTIVE'),
(11, '2020-12-18 00:27:51.743187', 'admin', '2020-12-18 00:27:51.743187', 'admin', NULL, 'SSIN200010', NULL, 'Araliya keeri Samba 5Kg', '50', '200.00', 4, 'ACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `ledger`
--

DROP TABLE IF EXISTS `ledger`;
CREATE TABLE IF NOT EXISTS `ledger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `active_or_inactive` varchar(255) DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `manufacture_date` date DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `sell_price` decimal(10,2) NOT NULL,
  `good_received_note_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `live_or_dead` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcykmvuwc8wn9n91rknufwli25` (`good_received_note_id`),
  KEY `FKe8g4swnkywn8be1ut2j8e8x3w` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ledger`
--

INSERT INTO `ledger` (`id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `active_or_inactive`, `expired_date`, `manufacture_date`, `quantity`, `sell_price`, `good_received_note_id`, `item_id`, `live_or_dead`) VALUES
(1, '2020-12-18 01:39:15.663457', 'admin', '2020-12-18 01:39:15.663457', 'admin', NULL, '2020-12-31', '2020-12-17', '10', '380.00', 1, 2, NULL),
(2, '2020-12-18 01:39:15.706342', 'admin', '2020-12-18 01:39:15.706342', 'admin', NULL, '2021-01-08', '2020-12-17', '20', '900.00', 1, 4, NULL),
(3, '2020-12-18 01:48:43.084369', 'admin', '2020-12-18 01:48:43.084369', 'admin', NULL, '2021-01-07', '2020-12-17', '2', '400.00', 2, 3, NULL),
(4, '2020-12-18 01:48:43.096338', 'admin', '2020-12-18 01:48:43.096338', 'admin', NULL, '2020-12-25', '2020-12-17', '5', '1000.00', 2, 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `active_or_inactive` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `purchase_order_id` int(11) DEFAULT NULL,
  `live_or_dead` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_opor0kv54jt58n364jog9bu2i` (`code`),
  KEY `FK66h63qkt7xfa0xiwv4xgel9na` (`purchase_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order`
--

DROP TABLE IF EXISTS `purchase_order`;
CREATE TABLE IF NOT EXISTS `purchase_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `active_or_inactive` varchar(255) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `purchase_order_priority` varchar(255) DEFAULT NULL,
  `purchase_order_status` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `live_or_dead` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_lyhuui3e3rh2a6itktx3rwrpe` (`code`),
  KEY `FK4traogu3jriq9u7e8rvm86k7i` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `purchase_order`
--

INSERT INTO `purchase_order` (`id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `active_or_inactive`, `code`, `price`, `purchase_order_priority`, `purchase_order_status`, `remark`, `supplier_id`, `live_or_dead`) VALUES
(1, '2020-12-18 01:30:20.729943', 'admin', '2020-12-18 01:39:15.564253', 'admin', NULL, 'SSPO200000', '26000.00', 'HIGH', 'NOT_PROCEED', '', 1, 'ACTIVE'),
(2, '2020-12-18 01:47:40.229442', 'admin', '2020-12-18 01:48:43.058439', 'admin', NULL, 'SSPO200001', '7100.00', 'HIGH', 'NOT_PROCEED', '', 3, 'ACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_item`
--

DROP TABLE IF EXISTS `purchase_order_item`;
CREATE TABLE IF NOT EXISTS `purchase_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `active_or_inactive` varchar(255) DEFAULT NULL,
  `buying_price` decimal(10,2) NOT NULL,
  `line_total` decimal(10,2) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `purchase_order_id` int(11) DEFAULT NULL,
  `live_or_dead` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6hnf77cwyb21thxqtphoatybv` (`item_id`),
  KEY `FKmj122necubadvuquvjoq967y7` (`purchase_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `purchase_order_item`
--

INSERT INTO `purchase_order_item` (`id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `active_or_inactive`, `buying_price`, `line_total`, `quantity`, `item_id`, `purchase_order_id`, `live_or_dead`) VALUES
(1, '2020-12-18 01:30:20.760870', 'admin', '2020-12-18 01:30:20.760870', 'admin', NULL, '400.00', '4000.00', '10', 2, 1, NULL),
(2, '2020-12-18 01:30:20.771834', 'admin', '2020-12-18 01:30:20.771834', 'admin', NULL, '1100.00', '22000.00', '20', 4, 1, NULL),
(3, '2020-12-18 01:47:40.242421', 'admin', '2020-12-18 01:47:40.242421', 'admin', NULL, '800.00', '1600.00', '2', 3, 2, NULL),
(4, '2020-12-18 01:47:40.250383', 'admin', '2020-12-18 01:47:40.250383', 'admin', NULL, '1100.00', '5500.00', '5', 5, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `active_or_inactive` varchar(255) DEFAULT NULL,
  `role_name` varchar(255) NOT NULL,
  `live_or_dead` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_iubw515ff0ugtm28p8g3myt0h` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `active_or_inactive`, `role_name`, `live_or_dead`) VALUES
(1, '2020-12-17 22:15:50.990273', 'anonymousUser', '2020-12-17 22:15:50.990273', 'anonymousUser', 'ACTIVE', 'ADMIN', NULL),
(4, '2020-12-17 22:28:21.797242', 'admin', '2020-12-17 22:28:21.797242', 'admin', 'ACTIVE', 'MANAGER', NULL),
(5, '2020-12-17 22:28:38.930802', 'admin', '2020-12-17 22:38:45.049517', 'admin', NULL, 'PROCUREMENT_MANAGER', NULL),
(6, '2020-12-17 22:28:49.433375', 'admin', '2020-12-17 22:28:49.433375', 'admin', 'ACTIVE', 'CASHIER', NULL),
(7, '2020-12-17 22:37:52.779353', 'admin', '2020-12-17 22:38:32.405108', 'admin', NULL, 'HR_MANAGER', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE IF NOT EXISTS `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `active_or_inactive` varchar(255) DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `brn` varchar(255) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `contact_one` varchar(10) DEFAULT NULL,
  `contact_two` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `item_supplier_status` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `live_or_dead` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_u0lh6hby20ok7au7646wrewl` (`code`),
  UNIQUE KEY `UK_g7qiwwu4vpciysmeeyme9gg1d` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `active_or_inactive`, `address`, `brn`, `code`, `contact_one`, `contact_two`, `email`, `item_supplier_status`, `name`, `live_or_dead`) VALUES
(1, '2020-12-18 00:36:32.161798', 'admin', '2020-12-18 00:36:32.161798', 'admin', NULL, 'Gampaha', '1122', 'SS200000', '0772354214', '0774354214', 'maliban@gmail.com', 'CURRENTLY_BUYING', 'Maliban', 'ACTIVE'),
(2, '2020-12-18 00:37:06.456831', 'admin', '2020-12-18 00:37:06.456831', 'admin', NULL, 'Colombo', '5544', 'JNS200000', '0754554224', '0754554224', 'munchee123@gmail.com', 'CURRENTLY_BUYING', 'Munchee Biscuits', 'ACTIVE'),
(3, '2020-12-18 00:37:57.464820', 'admin', '2020-12-18 00:37:57.464820', 'admin', NULL, 'Kadawatha', '8788', 'JNS200001', '0754554244', '0774554244', 'anchor@gmail.com', 'CURRENTLY_BUYING', 'Anchor', 'ACTIVE'),
(4, '2020-12-18 00:38:54.946142', 'admin', '2020-12-18 00:47:12.498740', 'admin', NULL, 'Polonnaruwa', '1233333', 'JNS200002', '0712354214', '0772354214', 'araliya123@gmail.com', 'CURRENTLY_BUYING', 'Araliya', 'STOP'),
(5, '2020-12-18 00:39:33.223095', 'admin', '2020-12-18 00:39:33.223095', 'admin', NULL, 'Colombo', '9855', 'JNS200003', '0712364125', '0785421111', 'unileaverplc@gmail.com', 'CURRENTLY_BUYING', 'Uni Levers', 'ACTIVE'),
(8, '2020-12-18 00:52:11.358715', 'admin', '2020-12-18 00:52:11.358715', 'admin', NULL, 'Kolonnawa', '7854', 'JNS200004', '0702354784', '0702354784', 'mr1887@gmail.com', 'CURRENTLY_BUYING', 'Maradgahamula', 'ACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_item`
--

DROP TABLE IF EXISTS `supplier_item`;
CREATE TABLE IF NOT EXISTS `supplier_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `active_or_inactive` varchar(255) DEFAULT NULL,
  `item_supplier_status` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `live_or_dead` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK62ijb79q9ef3djeen9r48pal8` (`item_id`),
  KEY `FKlyx7pcth25eowl5u49n4ayos0` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `supplier_item`
--

INSERT INTO `supplier_item` (`id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `active_or_inactive`, `item_supplier_status`, `price`, `item_id`, `supplier_id`, `live_or_dead`) VALUES
(1, '2020-12-18 00:43:37.006427', 'admin', '2020-12-18 00:43:37.006427', 'admin', NULL, 'CURRENTLY_BUYING', '400.00', 2, 1, 'ACTIVE'),
(2, '2020-12-18 00:43:37.030425', 'admin', '2020-12-18 00:43:37.030425', 'admin', NULL, 'CURRENTLY_BUYING', '1100.00', 4, 1, 'ACTIVE'),
(3, '2020-12-18 00:44:12.892280', 'admin', '2020-12-18 00:44:12.892280', 'admin', NULL, 'CURRENTLY_BUYING', '800.00', 3, 3, 'ACTIVE'),
(4, '2020-12-18 00:44:12.905332', 'admin', '2020-12-18 00:44:12.905332', 'admin', NULL, 'CURRENTLY_BUYING', '1100.00', 5, 3, 'ACTIVE'),
(5, '2020-12-18 00:44:52.747860', 'admin', '2020-12-18 00:44:52.747860', 'admin', NULL, 'CURRENTLY_BUYING', '250.00', 1, 4, 'ACTIVE'),
(6, '2020-12-18 00:44:52.761826', 'admin', '2020-12-18 00:44:52.761826', 'admin', NULL, 'CURRENTLY_BUYING', '800.00', 11, 4, 'ACTIVE'),
(7, '2020-12-18 00:45:55.302447', 'admin', '2020-12-18 00:45:55.302447', 'admin', NULL, 'CURRENTLY_BUYING', '220.00', 10, 5, 'ACTIVE'),
(8, '2020-12-18 00:45:55.318398', 'admin', '2020-12-18 00:45:55.318398', 'admin', NULL, 'CURRENTLY_BUYING', '45.00', 8, 5, 'ACTIVE'),
(9, '2020-12-18 00:45:55.338344', 'admin', '2020-12-18 00:45:55.338344', 'admin', NULL, 'CURRENTLY_BUYING', '70.00', 9, 5, 'ACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `active_or_inactive` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `live_or_dead` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`),
  KEY `FK211dk0pe7l3aibwce8yy61ota` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `active_or_inactive`, `enabled`, `password`, `username`, `employee_id`, `live_or_dead`) VALUES
(1, '2020-12-17 22:15:51.660517', 'anonymousUser', '2020-12-17 22:15:51.660517', 'anonymousUser', 'ACTIVE', b'1', '$2a$10$ZlJYLtinEvbWRZsm3GEmyOhsrKy16aRFCMiPLUbadKocztvvUPzni', 'admin', 1, NULL),
(2, '2020-12-17 22:51:29.731289', 'admin', '2020-12-17 22:51:29.731289', 'admin', 'ACTIVE', b'1', '$2a$10$b987ISiFoRTgF5Db/f2jeuDILNcnq.RyDokZbCEPBDLuDe2mtft0q', 'nuwan', 2, NULL),
(3, '2020-12-17 22:53:10.844370', 'admin', '2020-12-17 22:53:10.844370', 'admin', 'ACTIVE', b'1', '$2a$10$nKa6a/hHSXmExY0iXDZ9iu2ipF43emTDwBk6WmX5dKJ4erXwLcfjy', 'kamal', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  KEY `FK859n2jvi8ivhui0rl0esws6o` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 4),
(3, 7);

-- --------------------------------------------------------

--
-- Table structure for table `user_session_log`
--

DROP TABLE IF EXISTS `user_session_log`;
CREATE TABLE IF NOT EXISTS `user_session_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `failure_attempts` int(11) NOT NULL,
  `user_session_log_status` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrhb4wune1hnnhdsbiah2ojo5l` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_session_log`
--

INSERT INTO `user_session_log` (`id`, `created_at`, `failure_attempts`, `user_session_log_status`, `user_id`) VALUES
(1, '2020-12-17 22:17:19.095644', 0, 'LOGGED', 1),
(2, '2020-12-17 22:35:49.468332', 0, 'LOGGED', 1),
(3, '2020-12-17 22:56:19.270036', 0, 'LOGGED', 2),
(4, '2020-12-17 22:58:40.439757', 0, 'LOGGED', 1),
(5, '2020-12-17 23:53:48.137148', 0, 'LOGGED', 1),
(6, '2020-12-18 00:13:45.387705', 0, 'LOGGED', 1),
(7, '2020-12-18 00:22:04.208200', 0, 'LOGGED', 1),
(8, '2020-12-18 01:08:05.133673', 0, 'LOGGED', 1),
(9, '2020-12-18 01:15:07.147266', 0, 'LOGGED', 1),
(10, '2020-12-18 01:17:08.202546', 0, 'LOGGED', 1),
(11, '2020-12-18 01:17:32.562755', 0, 'LOGGED', 1),
(12, '2020-12-18 01:24:17.688802', 0, 'LOGGED', 1),
(13, '2020-12-18 01:28:58.493016', 0, 'LOGGED', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `FKcvhlsx8tao1rxt7mpxrot61jt` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`);

--
-- Constraints for table `employee_files`
--
ALTER TABLE `employee_files`
  ADD CONSTRAINT `FKolualpa5dydj5r06txltc1y6d` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `good_received_note`
--
ALTER TABLE `good_received_note`
  ADD CONSTRAINT `FKl2ij2erc8mi59decwkp0fj4b4` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_order` (`id`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `FK5e32ukwo9uknwhylogvta4po6` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `FKaqmv80i9p25a4fsj8x0e60shi` FOREIGN KEY (`discount_ratio_id`) REFERENCES `discount_ratio` (`id`);

--
-- Constraints for table `invoice_item`
--
ALTER TABLE `invoice_item`
  ADD CONSTRAINT `FK4985co9rso0r7m8qsemxsf60i` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FKbu6tmpd0mtgu9wrw5bj5uv09v` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`);

--
-- Constraints for table `invoice_ledger`
--
ALTER TABLE `invoice_ledger`
  ADD CONSTRAINT `FK65qvs2i9symtxe2qgon4r5shh` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`),
  ADD CONSTRAINT `FK9qknplcs4oc7oii5b6d1o5rpg` FOREIGN KEY (`ledger_id`) REFERENCES `ledger` (`id`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK2n9w8d0dp4bsfra9dcg0046l4` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `ledger`
--
ALTER TABLE `ledger`
  ADD CONSTRAINT `FKcykmvuwc8wn9n91rknufwli25` FOREIGN KEY (`good_received_note_id`) REFERENCES `good_received_note` (`id`),
  ADD CONSTRAINT `FKe8g4swnkywn8be1ut2j8e8x3w` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FK66h63qkt7xfa0xiwv4xgel9na` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_order` (`id`);

--
-- Constraints for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD CONSTRAINT `FK4traogu3jriq9u7e8rvm86k7i` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`);

--
-- Constraints for table `purchase_order_item`
--
ALTER TABLE `purchase_order_item`
  ADD CONSTRAINT `FK6hnf77cwyb21thxqtphoatybv` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FKmj122necubadvuquvjoq967y7` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_order` (`id`);

--
-- Constraints for table `supplier_item`
--
ALTER TABLE `supplier_item`
  ADD CONSTRAINT `FK62ijb79q9ef3djeen9r48pal8` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FKlyx7pcth25eowl5u49n4ayos0` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK211dk0pe7l3aibwce8yy61ota` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `user_session_log`
--
ALTER TABLE `user_session_log`
  ADD CONSTRAINT `FKrhb4wune1hnnhdsbiah2ojo5l` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
--
-- Database: `student`
--
CREATE DATABASE IF NOT EXISTS `student` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `student`;
--
-- Database: `studentmanagement`
--
CREATE DATABASE IF NOT EXISTS `studentmanagement` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `studentmanagement`;

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
CREATE TABLE IF NOT EXISTS `gender` (
  `id` int(1) NOT NULL,
  `name` varchar(6),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`id`, `name`) VALUES
(1, 'Male'),
(2, 'Male'),
(3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `id` int(3) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `mobile` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
--
-- Database: `student_management`
--
CREATE DATABASE IF NOT EXISTS `student_management` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `student_management`;
--
-- Database: `w3`
--
CREATE DATABASE IF NOT EXISTS `w3` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `w3`;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `student_id` int(11) NOT NULL,
  `firstname` varchar(120) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `age` int(2) NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `firstname`, `lastname`, `age`) VALUES
(1, 'Tharaka', 'Nethmini', 25),
(2, 'Hansi', 'Munasinghe', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
