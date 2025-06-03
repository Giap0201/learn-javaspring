-- Create the database if it does not exist
CREATE DATABASE IF NOT EXISTS `estatebasic` 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

-- Use the database
USE `estatebasic`;

-- Set SQL modes and disable checks temporarily for data insertion
SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT;
SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS;
SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION;
SET NAMES utf8mb4;
SET @OLD_TIME_ZONE=@@TIME_ZONE;
SET TIME_ZONE='+00:00';
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0;

-- Table structure for table `district`
DROP TABLE IF EXISTS `district`;
CREATE TABLE `district` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `district`
INSERT INTO `district` (`id`, `code`, `name`) VALUES
(1, 'Q1', 'Quận 1'),
(2, 'Q2', 'Quận 2'),
(3, 'Q4', 'Quận 4');

-- Table structure for table `renttype`
DROP TABLE IF EXISTS `renttype`;
CREATE TABLE `renttype` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `renttype`
INSERT INTO `renttype` (`id`, `code`, `name`) VALUES
(1, 'tang-tret', 'Tầng trệt'),
(2, 'nguyen-can', 'Nguyên căn'),
(3, 'noi-that', 'Nội thất');

-- Table structure for table `role`
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `code` VARCHAR(255) NOT NULL,
  `createddate` DATETIME DEFAULT NULL,
  `modifieddate` DATETIME DEFAULT NULL,
  `createdby` VARCHAR(255) DEFAULT NULL,
  `modifiedby` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `role`
INSERT INTO `role` (`id`, `name`, `code`) VALUES
(1, 'Quản lý', 'manager'),
(2, 'Nhân viên', 'staff');

-- Table structure for table `user`
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `fullname` VARCHAR(255) DEFAULT NULL,
  `phone` VARCHAR(255) DEFAULT NULL,
  `email` VARCHAR(255) DEFAULT NULL,
  `status` INT(11) NOT NULL,
  `createddate` DATETIME DEFAULT NULL,
  `modifieddate` DATETIME DEFAULT NULL,
  `createdby` VARCHAR(255) DEFAULT NULL,
  `modifiedby` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `user`
INSERT INTO `user` (`id`, `username`, `password`, `fullname`, `status`) VALUES
(1, 'nguyenvana', '123456', 'nguyen van a', 1),
(2, 'nguyenvanb', '123456', 'nguyen van b', 1),
(3, 'nguyenvanc', '123456', 'nguyen van c', 1),
(4, 'nguyenvand', '123456', 'nguyen van d', 1);

-- Table structure for table `user_role`
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `roleid` BIGINT(20) NOT NULL,
  `userid` BIGINT(20) NOT NULL,
  `createddate` DATETIME DEFAULT NULL,
  `modifieddate` DATETIME DEFAULT NULL,
  `createdby` VARCHAR(255) DEFAULT NULL,
  `modifiedby` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role` (`userid`),
  KEY `fk_role_user` (`roleid`),
  CONSTRAINT `fk_role_user` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_role` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `user_role`
INSERT INTO `user_role` (`id`, `roleid`, `userid`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 2, 3),
(4, 2, 4);

-- Table structure for table `building`
DROP TABLE IF EXISTS `building`;
CREATE TABLE `building` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `street` VARCHAR(255) DEFAULT NULL,
  `ward` VARCHAR(255) DEFAULT NULL,
  `districtid` BIGINT(20) NOT NULL,
  `structure` VARCHAR(255) DEFAULT NULL,
  `numberofbasement` INT(11) DEFAULT NULL,
  `floorarea` INT(11) DEFAULT NULL,
  `direction` VARCHAR(255) DEFAULT NULL,
  `level` VARCHAR(255) DEFAULT NULL,
  `rentprice` INT(11) NOT NULL,
  `rentpricedescription` TEXT,
  `servicefee` VARCHAR(255) DEFAULT NULL,
  `carfee` VARCHAR(255) DEFAULT NULL,
  `motorbikefee` VARCHAR(255) DEFAULT NULL,
  `overtimefee` VARCHAR(255) DEFAULT NULL,
  `waterfee` VARCHAR(255) DEFAULT NULL,
  `electricityfee` VARCHAR(255) DEFAULT NULL,
  `deposit` VARCHAR(255) DEFAULT NULL,
  `payment` VARCHAR(255) DEFAULT NULL,
  `renttime` VARCHAR(255) DEFAULT NULL,
  `decorationtime` VARCHAR(255) DEFAULT NULL,
  `brokeragefee` DECIMAL(13,2) DEFAULT NULL,
  `note` VARCHAR(255) DEFAULT NULL,
  `linkofbuilding` VARCHAR(255) DEFAULT NULL,
  `map` VARCHAR(255) DEFAULT NULL,
  `image` VARCHAR(255) DEFAULT NULL,
  `createddate` DATETIME DEFAULT NULL,
  `modifieddate` DATETIME DEFAULT NULL,
  `createdby` VARCHAR(255) DEFAULT NULL,
  `modifiedby` VARCHAR(255) DEFAULT NULL,
  `managername` VARCHAR(255) DEFAULT NULL,
  `managerphonenumber` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_building_district` (`districtid`),
  CONSTRAINT `fk_building_district` FOREIGN KEY (`districtid`) REFERENCES `district` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `building`
INSERT INTO `building` (`id`, `name`, `street`, `ward`, `districtid`, `numberofbasement`, `floorarea`, `rentprice`, `rentpricedescription`, `managername`, `managerphonenumber`) VALUES
(1, 'Nam Giao Building Tower', '59 phan xích long', 'Phường 2', 1, 2, 500, 15, '15 triệu/m2', 'Anh Nam-Chị Linh', '0915354727'),
(2, 'ACM Tower', '96 cao thắng', 'Phường 4', 2, 2, 650, 18, '18 triệu/m2', 'Chú Thuận', '0173546263'),
(3, 'Alpha 2 Building Tower', '153 nguyễn đình chiểu', 'Phường 6', 1, 1, 200, 20, '20 triệu/m2', 'Cô Lý', '0555532578'),
(4, 'IDD 1 Building', '111 Lý Chính Thắng', 'Phường 7', 3, 1, 200, 12, '12 triệu/m2', 'Anh Long', '017345253');

-- Table structure for table `assignmentbuilding`
DROP TABLE IF EXISTS `assignmentbuilding`;
CREATE TABLE `assignmentbuilding` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `staffid` BIGINT(20) NOT NULL,
  `buildingid` BIGINT(20) NOT NULL,
  `createddate` DATETIME DEFAULT NULL,
  `modifieddate` DATETIME DEFAULT NULL,
  `createdby` VARCHAR(255) DEFAULT NULL,
  `modifiedby` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_building` (`staffid`),
  KEY `fk_building_user` (`buildingid`),
  CONSTRAINT `fk_building_user` FOREIGN KEY (`buildingid`) REFERENCES `building` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_building` FOREIGN KEY (`staffid`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `assignmentbuilding`
INSERT INTO `assignmentbuilding` (`id`, `staffid`, `buildingid`) VALUES
(1, 2, 1),
(2, 2, 3),
(3, 3, 1),
(4, 3, 4);

-- Table structure for table `buildingrenttype`
DROP TABLE IF EXISTS `buildingrenttype`;
CREATE TABLE `buildingrenttype` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `buildingid` BIGINT(20) NOT NULL,
  `renttypeid` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_buildingtype_building` (`buildingid`),
  KEY `fk_buildingtype_renttype` (`renttypeid`),
  CONSTRAINT `fk_buildingtype_building` FOREIGN KEY (`buildingid`) REFERENCES `building` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_buildingtype_renttype` FOREIGN KEY (`renttypeid`) REFERENCES `renttype` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `buildingrenttype`
INSERT INTO `buildingrenttype` (`id`, `buildingid`, `renttypeid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 3, 3),
(5, 4, 1),
(6, 4, 2),
(7, 4, 3);

-- Table structure for table `rentarea`
DROP TABLE IF EXISTS `rentarea`;
CREATE TABLE `rentarea` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `value` INT(11) DEFAULT NULL,
  `buildingid` BIGINT(20) NOT NULL,
  `createddate` DATETIME DEFAULT NULL,
  `modifieddate` DATETIME DEFAULT NULL,
  `createdby` VARCHAR(255) DEFAULT NULL,
  `modifiedby` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rentarea_building` (`buildingid`),
  CONSTRAINT `rentarea_building` FOREIGN KEY (`buildingid`) REFERENCES `building` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `rentarea`
INSERT INTO `rentarea` (`id`, `value`, `buildingid`) VALUES
(1, 100, 1),
(2, 200, 1),
(3, 200, 2),
(4, 300, 2),
(5, 400, 2),
(6, 300, 3),
(7, 400, 3),
(8, 500, 3),
(9, 100, 4),
(10, 400, 4),
(11, 250, 4);

-- Table structure for table `customer`
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `fullname` VARCHAR(255) DEFAULT NULL,
  `phone` VARCHAR(255) DEFAULT NULL,
  `email` VARCHAR(255) DEFAULT NULL,
  `createddate` DATETIME DEFAULT NULL,
  `modifieddate` DATETIME DEFAULT NULL,
  `createdby` VARCHAR(255) DEFAULT NULL,
  `modifiedby` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table structure for table `transactiontype`
DROP TABLE IF EXISTS `transactiontype`;
CREATE TABLE `transactiontype` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `code` VARCHAR(255) NOT NULL,
  `createddate` TIMESTAMP NULL DEFAULT NULL,
  `modifieddate` TIMESTAMP NULL DEFAULT NULL,
  `createdby` VARCHAR(255) DEFAULT NULL,
  `modifiedby` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table structure for table `transaction`
DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `note` VARCHAR(255) DEFAULT NULL,
  `customerid` BIGINT(20) NOT NULL,
  `createddate` DATETIME DEFAULT NULL,
  `modifieddate` DATETIME DEFAULT NULL,
  `createdby` VARCHAR(255) DEFAULT NULL,
  `modifiedby` VARCHAR(255) DEFAULT NULL,
  `type` BIGINT(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer_transaction` (`customerid`),
  KEY `fk_transactiontype_transaction` (`type`),
  CONSTRAINT `fk_customer_transaction` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_transactiontype_transaction` FOREIGN KEY (`type`) REFERENCES `transactiontype` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table structure for table `assignmentcustomer`
DROP TABLE IF EXISTS `assignmentcustomer`;
CREATE TABLE `assignmentcustomer` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `staffid` BIGINT(20) NOT NULL,
  `customerid` BIGINT(20) NOT NULL,
  `createddate` DATETIME DEFAULT NULL,
  `modifieddate` DATETIME DEFAULT NULL,
  `createdby` VARCHAR(255) DEFAULT NULL,
  `modifiedby` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_customer` (`staffid`),
  KEY `fk_customer_user` (`customerid`),
  CONSTRAINT `fk_customer_user` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_customer` FOREIGN KEY (`staffid`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Restore SQL modes and checks
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT;
SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS;
SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION;
SET SQL_NOTES=@OLD_SQL_NOTES;


select * from customer;
select * from buildingrenttype;
select * from building;
select * from assignmentcustomer;
select * from assignmentbuilding;
select * from buildingrenttype;
select * from district;
select * from rentarea;
select * from renttype;
select * from role;
select * from transaction;
select * from transactiontype;
select * from user;
select * from user_role;


