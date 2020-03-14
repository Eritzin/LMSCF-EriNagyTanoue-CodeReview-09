-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2020 at 02:04 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_eri_nagytanoue_delivery`
--

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_code` varchar(5) NOT NULL,
  `country_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_code`, `country_name`) VALUES
('AT', 'Austria'),
('HU', 'Hungary'),
('IT', 'Italy'),
('JP', 'Japan'),
('PL', 'Poland');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `delivery_id` int(20) NOT NULL,
  `fk_emp_id` int(11) NOT NULL,
  `delivery_timedate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_item_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`delivery_id`, `fk_emp_id`, `delivery_timedate`, `fk_item_id`) VALUES
(1, 2, '2020-03-14 12:55:04', 2),
(2, 3, '2020-03-14 13:00:03', 4),
(3, 4, '2020-03-14 13:00:03', 5),
(4, 5, '2020-03-14 13:00:03', 6);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` int(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `fk_branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `fk_branch_id`) VALUES
(1, 'Melissa', 'Banks', 1),
(2, 'Anna', 'Morales', 2),
(3, 'Vincent', 'Martinez', 3),
(4, 'Jerry', 'Morales', 1),
(5, 'Joan', 'Gardner', 2),
(6, 'Larry', 'Kelley', 3),
(7, 'Kathryn', ' Gilbert', 1);

-- --------------------------------------------------------

--
-- Table structure for table `package_mail`
--

CREATE TABLE `package_mail` (
  `item_id` int(20) NOT NULL,
  `fk_type_id` int(11) DEFAULT NULL,
  `fk_recipient_id` int(11) DEFAULT NULL,
  `international` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `package_mail`
--

INSERT INTO `package_mail` (`item_id`, `fk_type_id`, `fk_recipient_id`, `international`) VALUES
(1, 1, 2, 1),
(2, 3, 1, 0),
(3, 2, 3, 1),
(4, 2, 1, 0),
(5, 4, 1, 0),
(6, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `post_code`
--

CREATE TABLE `post_code` (
  `post_code` varchar(20) NOT NULL,
  `city_name` varchar(30) NOT NULL,
  `fk_country_code` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post_code`
--

INSERT INTO `post_code` (`post_code`, `city_name`, `fk_country_code`) VALUES
('1010', 'Vienna', 'AT'),
('1030', 'Vienna', 'AT'),
('1070', 'Vienna', 'AT'),
('1110', 'Vienna', 'AT'),
('810-0051', 'FUKUOKA', 'JP'),
('860-0001', 'FUKUOKA', 'JP'),
('861-4604', 'KUMAMOTO', 'JP');

-- --------------------------------------------------------

--
-- Table structure for table `post_office_branch`
--

CREATE TABLE `post_office_branch` (
  `branch_id` int(10) NOT NULL,
  `branch_name` varchar(20) NOT NULL,
  `fk_post_code` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post_office_branch`
--

INSERT INTO `post_office_branch` (`branch_id`, `branch_name`, `fk_post_code`, `address`) VALUES
(1, 'postoffice_center', '1010', 'street1/10'),
(2, 'postoffice_meidling', '1030', 'street3/19'),
(3, 'postoffice_south', '1070', 'street8/10');

-- --------------------------------------------------------

--
-- Table structure for table `recipient`
--

CREATE TABLE `recipient` (
  `recipient_id` int(20) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `fk_post_code` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recipient`
--

INSERT INTO `recipient` (`recipient_id`, `first_name`, `last_name`, `fk_post_code`, `address`) VALUES
(1, 'Kathryn', 'Gordon', '1030', 'street 3/5/11'),
(2, 'Miho', 'Nakamura', '861-4604', 'Machi 656'),
(3, 'Ichiro', 'Murakami', '860-0001', 'Michi 788');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `registration_id` int(20) NOT NULL,
  `fk_item` int(11) DEFAULT NULL,
  `fk_reg_emp_id` int(11) DEFAULT NULL,
  `fk_delivery_branch_id` int(11) DEFAULT NULL,
  `deposit_timedate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`registration_id`, `fk_item`, `fk_reg_emp_id`, `fk_delivery_branch_id`, `deposit_timedate`) VALUES
(1, 1, 1, 1, '2020-03-14 12:52:41'),
(2, 2, 1, 2, '2020-03-14 12:52:41'),
(3, 3, 1, 1, '2020-03-14 12:52:41');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `type_id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`type_id`, `type`) VALUES
(1, 'postcard'),
(2, 'letter'),
(3, 'package 1kg'),
(4, 'package 5kg'),
(5, 'package 10kg'),
(6, 'package big');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_code`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `fk_emp_id` (`fk_emp_id`),
  ADD KEY `fk_item_id` (`fk_item_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `fk_branch_id` (`fk_branch_id`);

--
-- Indexes for table `package_mail`
--
ALTER TABLE `package_mail`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `fk_type_id` (`fk_type_id`),
  ADD KEY `fk_recipient_id` (`fk_recipient_id`);

--
-- Indexes for table `post_code`
--
ALTER TABLE `post_code`
  ADD PRIMARY KEY (`post_code`),
  ADD KEY `fk_country_code` (`fk_country_code`);

--
-- Indexes for table `post_office_branch`
--
ALTER TABLE `post_office_branch`
  ADD PRIMARY KEY (`branch_id`),
  ADD KEY `fk_post_code` (`fk_post_code`);

--
-- Indexes for table `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`recipient_id`),
  ADD KEY `fk_post_code` (`fk_post_code`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`registration_id`),
  ADD KEY `fk_item` (`fk_item`),
  ADD KEY `fk_reg_emp_id` (`fk_reg_emp_id`),
  ADD KEY `fk_delivery_branch_id` (`fk_delivery_branch_id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `delivery_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `emp_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `package_mail`
--
ALTER TABLE `package_mail`
  MODIFY `item_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `post_office_branch`
--
ALTER TABLE `post_office_branch`
  MODIFY `branch_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `recipient`
--
ALTER TABLE `recipient`
  MODIFY `recipient_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `registration_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`fk_emp_id`) REFERENCES `employee` (`emp_id`),
  ADD CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`fk_item_id`) REFERENCES `package_mail` (`item_id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fk_branch_id`) REFERENCES `post_office_branch` (`branch_id`);

--
-- Constraints for table `package_mail`
--
ALTER TABLE `package_mail`
  ADD CONSTRAINT `package_mail_ibfk_1` FOREIGN KEY (`fk_type_id`) REFERENCES `type` (`type_id`),
  ADD CONSTRAINT `package_mail_ibfk_2` FOREIGN KEY (`fk_recipient_id`) REFERENCES `recipient` (`recipient_id`);

--
-- Constraints for table `post_code`
--
ALTER TABLE `post_code`
  ADD CONSTRAINT `post_code_ibfk_1` FOREIGN KEY (`fk_country_code`) REFERENCES `country` (`country_code`);

--
-- Constraints for table `post_office_branch`
--
ALTER TABLE `post_office_branch`
  ADD CONSTRAINT `post_office_branch_ibfk_1` FOREIGN KEY (`fk_post_code`) REFERENCES `post_code` (`post_code`);

--
-- Constraints for table `recipient`
--
ALTER TABLE `recipient`
  ADD CONSTRAINT `recipient_ibfk_1` FOREIGN KEY (`fk_post_code`) REFERENCES `post_code` (`post_code`);

--
-- Constraints for table `registration`
--
ALTER TABLE `registration`
  ADD CONSTRAINT `registration_ibfk_1` FOREIGN KEY (`fk_item`) REFERENCES `package_mail` (`item_id`),
  ADD CONSTRAINT `registration_ibfk_2` FOREIGN KEY (`fk_reg_emp_id`) REFERENCES `employee` (`emp_id`),
  ADD CONSTRAINT `registration_ibfk_3` FOREIGN KEY (`fk_delivery_branch_id`) REFERENCES `post_office_branch` (`branch_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
