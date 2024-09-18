-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2024 at 11:58 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `countPatientByAge` (IN `newAge` INT, OUT `res` INT)   begin
select count(*) into res from patient where age = newAge;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletePatient` (IN `searchId` INT)   begin 
delete from patient where p_id = searchId;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `patientInsertByDynamicValues` (IN `name` VARCHAR(50), IN `medical_issue` VARCHAR(1000), IN `age` INT, IN `ph_no` VARCHAR(15))   begin 
insert into patient (name,medical_problem,age,ph_no) values(name,medical_issue,age,ph_no);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `patientInsertByStatic` ()   begin
insert into patient (name,medical_problem,age,ph_no) values('abc','fever',23,'0343-4838949');
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `searchPatient` (IN `patientId` INT)   begin 
select * from patient where p_id = patientId;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePatient` (IN `searchId` INT, IN `newName` VARCHAR(50), IN `newMedical_problem` VARCHAR(1000), IN `newAge` INT, IN `newPh_no` VARCHAR(15))   begin 
update patient set name = newName, age = newAge, medical_problem = newMedical_problem, ph_no = newPh_no where p_id = searchId;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appoint_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(50) NOT NULL,
  `date_of_appoint` date NOT NULL,
  `doc_id` int(10) UNSIGNED NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bill_id` int(10) UNSIGNED NOT NULL,
  `appoint_id` int(10) UNSIGNED NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `payable_amount` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doc_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `qualification` varchar(500) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `salary` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `p_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `medical_problem` varchar(1000) NOT NULL,
  `age` int(10) UNSIGNED NOT NULL,
  `ph_no` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`p_id`, `name`, `medical_problem`, `age`, `ph_no`) VALUES
(1, 'abc', 'fever', 23, '0343-4838949'),
(2, 'thomas', 'fever', 51, '03171234567'),
(4, 'Tariq', 'fever', 30, '0343-7894566'),
(6, 'Zubair', 'Fever', 44, '0312-3343531');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appoint_id`),
  ADD KEY `fk_appointment_doctor` (`doc_id`),
  ADD KEY `fk_appointment_patient` (`patient_id`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `fk_bill_patient` (`patient_id`),
  ADD KEY `fk_bill_appointment` (`appoint_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doc_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`p_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appoint_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `bill_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doc_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `p_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `fk_appointment_doctor` FOREIGN KEY (`doc_id`) REFERENCES `doctor` (`doc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_appointment_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`p_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `fk_bill_appointment` FOREIGN KEY (`appoint_id`) REFERENCES `appointment` (`appoint_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bill_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`p_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
