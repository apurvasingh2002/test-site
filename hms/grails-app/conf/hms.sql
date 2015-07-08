-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2015 at 03:24 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `version`, `description`, `name`) VALUES
(1, 0, 'abc', 'dept1'),
(2, 0, 'def', 'dept2');

-- --------------------------------------------------------

--
-- Table structure for table `departments_unit`
--

CREATE TABLE IF NOT EXISTS `departments_unit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `department_id` bigint(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_csko30ci9mdcipm2ix1px8vo` (`department_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `departments_unit`
--

INSERT INTO `departments_unit` (`id`, `version`, `department_id`, `description`, `name`) VALUES
(1, 0, 1, 'abc', 'unit1'),
(2, 0, 1, 'def', 'unit2');

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE IF NOT EXISTS `designation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`id`, `version`, `description`, `name`) VALUES
(1, 0, 'abc', 'desig1'),
(2, 0, 'def', 'de2');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `alter_email` varchar(255) DEFAULT NULL,
  `country` varchar(255) NOT NULL,
  `date_of_birth` datetime NOT NULL,
  `departments_id` bigint(20) NOT NULL,
  `designation_id` bigint(20) NOT NULL,
  `effective_date` datetime NOT NULL,
  `email` varchar(255) NOT NULL,
  `employee_id` varchar(255) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `home_phone` varchar(255) NOT NULL,
  `join_date` datetime NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `marital_status` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `permanent_address` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `supervisor_id` bigint(20) DEFAULT NULL,
  `temporary_address` varchar(255) DEFAULT NULL,
  `terminated_date` datetime DEFAULT NULL,
  `updated_by_id` bigint(20) DEFAULT NULL,
  `work_phone` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5qiraqya4xn4xxuekiar4o6h0` (`departments_id`),
  KEY `FK_fvanju2gyowte98s1drrw2g2s` (`designation_id`),
  KEY `FK_prk26n14tsxfnjuygd7ri9k0e` (`supervisor_id`),
  KEY `FK_6jmm3iovfjm7t63bwegg0atfq` (`updated_by_id`),
  KEY `FK_mpps3d3r9pdvyjx3iqixi96fi` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `version`, `alter_email`, `country`, `date_of_birth`, `departments_id`, `designation_id`, `effective_date`, `email`, `employee_id`, `filename`, `first_name`, `gender`, `home_phone`, `join_date`, `last_name`, `marital_status`, `middle_name`, `mobile`, `nationality`, `permanent_address`, `status`, `supervisor_id`, `temporary_address`, `terminated_date`, `updated_by_id`, `work_phone`, `user_id`) VALUES
(1, 0, NULL, 'nepal', '2015-06-27 00:00:00', 1, 1, '2015-06-27 00:00:00', 'nis@gmail.com', '23', NULL, 'nischal', 'M', '6876', '2015-06-27 00:00:00', 'sharma', 'single', NULL, '9869', 'nepal', 'banke', 'PERMANENT', NULL, NULL, NULL, NULL, NULL, 1),
(3, 0, 'ra@ra.com', 'dsa', '2015-06-30 00:00:00', 1, 2, '2015-06-30 00:00:00', 'ram@ram.com', 'ram123', '34', 'ram', 'm', '3434', '2015-06-30 00:00:00', 'shah', 'SINGLE', 'ra', '343434', 'ne', 'sdadsad', 'PERMANENT', 1, 'dsa', NULL, 1, '3', 2),
(4, 0, NULL, 'er', '2015-06-30 00:00:00', 1, 2, '2015-06-30 00:00:00', 'er@23.com', 'sita123', NULL, 'er', 'm', '23', '2015-06-30 00:00:00', 'er', 'SINGLE', NULL, '334', '23', 'we', 'PERMANENT', NULL, NULL, NULL, NULL, NULL, 4),
(5, 0, 's@d.com', 'sd', '2015-07-04 00:00:00', 1, 2, '2015-07-04 00:00:00', 'a@yahoo.com', 'asingh001', NULL, 'apurva', 'f', '23', '2015-07-04 00:00:00', 'singh', 'MARRIED', NULL, '23', 'nepal', 'asas', 'PERMANENT', 3, NULL, NULL, 1, NULL, 6);

-- --------------------------------------------------------

--
-- Table structure for table `leave_setting`
--

CREATE TABLE IF NOT EXISTS `leave_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `approve_by_id` bigint(20) DEFAULT NULL,
  `days` double NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `from_date` datetime NOT NULL,
  `reason` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `to_date` datetime NOT NULL,
  `type` varchar(255) NOT NULL,
  `duration` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_f91mthd4ctsu73fdhgf7500yl` (`approve_by_id`),
  KEY `FK_c6mqwnl6wri6eyhbc8ygxp29v` (`employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `leave_setting`
--

INSERT INTO `leave_setting` (`id`, `version`, `approve_by_id`, `days`, `employee_id`, `from_date`, `reason`, `status`, `to_date`, `type`, `duration`) VALUES
(6, 0, NULL, 0, 1, '2015-06-30 00:00:00', 'dsdad', 'UNAPPROVED', '2015-06-30 00:00:00', 'PERSONAL', 0.5),
(7, 0, NULL, 0, 1, '2015-07-04 00:00:00', 'asas', 'UNAPPROVED', '2015-07-04 00:00:00', 'SICK', 0);

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

CREATE TABLE IF NOT EXISTS `payroll` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `promotion_date` datetime NOT NULL,
  `salary` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_kfot01i7baasiwuerg4r5cxgp` (`employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `payroll`
--

INSERT INTO `payroll` (`id`, `version`, `employee_id`, `promotion_date`, `salary`) VALUES
(1, 0, 1, '2015-07-05 00:00:00', 3434);

-- --------------------------------------------------------

--
-- Table structure for table `request_map`
--

CREATE TABLE IF NOT EXISTS `request_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `config_attribute` varchar(255) NOT NULL,
  `http_method` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_url` (`http_method`,`url`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `request_map`
--

INSERT INTO `request_map` (`id`, `version`, `config_attribute`, `http_method`, `url`) VALUES
(2, 0, 'ROLE_ADMIN', NULL, '/employee/**'),
(3, 0, 'ROLE_ADMIN', NULL, '/leaveSetting/**'),
(4, 0, 'ROLE_ADMIN', NULL, '/payroll/**'),
(5, 0, 'permitAll', NULL, '/assets*//**'),
(6, 0, 'permitAll', NULL, '*//**//*js*//**'),
(7, 0, 'permitAll', NULL, '*//**//*css*//**'),
(8, 0, 'permitAll', NULL, '*//**//*images*//**'),
(9, 0, 'permitAll', NULL, '*//**//*favicon.ico'),
(14, 0, 'IS_AUTHENTICATED_REMEMBERED,IS_AUTHENTICATED_FULLY', NULL, '/logout/**'),
(15, 0, 'IS_AUTHENTICATED_ANONYMOUSLY', NULL, '/login/**'),
(17, 0, 'ROLE_ADMIN', NULL, '/dashboard/**'),
(18, 0, 'ROLE_ADMIN', NULL, '/'),
(19, 0, 'IS_AUTHENTICATED_ANONYMOUSLY', NULL, '/*'),
(20, 0, 'permitAll', NULL, '/js/**'),
(21, 0, 'permitAll', NULL, '/css/**'),
(22, 0, 'permitAll', NULL, '/fonts/**'),
(23, 0, 'permitAll', NULL, '/images/**'),
(24, 0, 'ROLE_ADMIN', NULL, '/user/**');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `authority` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_irsamgnera6angm0prq1kemt2` (`authority`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `version`, `authority`) VALUES
(1, 0, 'ROLE_ADMIN'),
(2, 0, 'ROLE_EMPLOYEE');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `account_expired` bit(1) NOT NULL,
  `account_locked` bit(1) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(255) NOT NULL,
  `password_expired` bit(1) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `version`, `account_expired`, `account_locked`, `enabled`, `password`, `password_expired`, `username`) VALUES
(1, 0, b'0', b'0', b'1', '$2a$10$wU1SsQHss6.PSPU6pzoP7Or7/L/37bYLST.ZPWrspBWaTexpSLhHS', b'0', 'admin'),
(2, 0, b'0', b'0', b'1', '$2a$10$4EaZespxaIkXD5q4nI1fV.BGAKuTQqiZYGuAigjmu5eMX7nyG7Q0C', b'0', 'aa'),
(3, 0, b'0', b'0', b'1', '$2a$10$XaR8xKlrxjrIrGkeJMI7COd2abQotUEK56V2vzzrqStR4d20O5hsm', b'0', 'sita'),
(4, 0, b'0', b'0', b'1', '$2a$10$1tggyWzulNf0tdv56Zql/.2lMtS6miKLjwxbLphhwpwSmkuHCkshW', b'0', 'user123'),
(5, 0, b'0', b'0', b'1', '$2a$10$GhKkGPuG.BqRnx9c9o0fgeGONF0YeZ0CUdqrGF6cdvmMjVM.1VYGe', b'0', 'asingh'),
(6, 0, b'0', b'0', b'1', '$2a$10$RbIn5VERSkSR6Vn3r/M0L.y13KK88dDFmsEhQZX2zkJwFC7J/Wc.u', b'0', 'sd');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK_it77eq964jhfqtu54081ebtio` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `departments_unit`
--
ALTER TABLE `departments_unit`
  ADD CONSTRAINT `FK_csko30ci9mdcipm2ix1px8vo` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `FK_5qiraqya4xn4xxuekiar4o6h0` FOREIGN KEY (`departments_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `FK_6jmm3iovfjm7t63bwegg0atfq` FOREIGN KEY (`updated_by_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `FK_fvanju2gyowte98s1drrw2g2s` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`id`),
  ADD CONSTRAINT `FK_mpps3d3r9pdvyjx3iqixi96fi` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_prk26n14tsxfnjuygd7ri9k0e` FOREIGN KEY (`supervisor_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `leave_setting`
--
ALTER TABLE `leave_setting`
  ADD CONSTRAINT `FK_c6mqwnl6wri6eyhbc8ygxp29v` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `FK_f91mthd4ctsu73fdhgf7500yl` FOREIGN KEY (`approve_by_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `payroll`
--
ALTER TABLE `payroll`
  ADD CONSTRAINT `FK_kfot01i7baasiwuerg4r5cxgp` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FK_apcc8lxk2xnug8377fatvbn04` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_it77eq964jhfqtu54081ebtio` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
