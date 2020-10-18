-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.5.4-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for bbbm
DROP DATABASE IF EXISTS `bbbm`;
CREATE DATABASE IF NOT EXISTS `bbbm` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bbbm`;

-- Dumping structure for table bbbm.contact
DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `ContactID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(256) NOT NULL,
  `EMAIL` varchar(256) NOT NULL,
  `Message` varchar(256) NOT NULL,
  `ModifiedDate` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`ContactID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- Dumping data for table bbbm.contact: ~26 rows (approximately)
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
REPLACE INTO `contact` (`ContactID`, `NAME`, `EMAIL`, `Message`, `ModifiedDate`) VALUES
	(2, 'Ryan Satchell', 'rsatch24@gmail.com', 'testing', '2020-08-27 22:01:52'),
	(3, 'Josh Richardson', 'jr@gmail.com', 'message', '2020-08-27 22:40:31'),
	(4, 'Jim Jacon', 'jjn@gmail.com', 'Were you able to get in contact as requested? ', '2020-08-29 11:06:36'),
	(5, 'Janter Jump', 'jju@gmail.com', 'Looking to get in touch!', '2020-08-29 15:19:57'),
	(6, 'Richardo Mayorga', 'rmmm@yahoo.com', 'Will this save everything? ', '2020-08-29 16:13:21'),
	(7, '', '', '', '2020-08-29 16:13:28'),
	(8, 'Widney Saintil', 'wsizCUTE@gmail.com', 'I think Ryan is the best... is this love? is this real? ', '2020-08-29 23:26:04'),
	(9, 'Christian Lavorgna', 'ccc@yahoo.com', 'Testing the toastr!', '2020-09-01 21:13:37'),
	(10, 'Dondre Champ', 'ddre@yahoo.com', 'Please come speak for us this friday!', '2020-09-01 21:52:09'),
	(11, 'Jacob Herring', 'jj@gmail.com', 'Hey just wanted to reach out to you once more. Thanks!', '2020-09-01 21:54:39'),
	(12, 'Teyona Taylor', 'tta@yahoo.com', 'Please help!', '2020-09-01 22:03:34'),
	(13, 'Nick Vena', 'nva@yahoo.com', 'Hello', '2020-09-01 22:09:13'),
	(14, 'Will Barton', 'wb@yahoo.com', 'Hello Joshua, would love to get in contact with you!', '2020-09-19 12:53:27'),
	(15, 'Lebron James', 'lbj@yahoo.com', 'Would love to connect!', '2020-09-19 13:08:44'),
	(16, 'Christopher Wallace', 'cw@biggie.com', 'would love to connect with you!', '2020-09-19 13:11:20'),
	(17, 'Kyrie Irving', 'kyirv@yahoo.com', 'Testing DB connection with different user. ', '2020-09-20 09:25:25'),
	(18, 'Christian Lavorgna', 'Lavorgna3@gmail.com', '', '2020-09-20 09:32:05'),
	(19, 'Derrick Henry', 'dh@yahoo.com', 'Hi Joshua, would love to get in contact with you!', '2020-09-20 13:42:15'),
	(20, 'Hype Man', 'hym@yahoo.com', 'Hi, I would love to speak further concerning nutrition. ', '2020-09-22 20:06:18'),
	(21, 'spooky williamss', 'sw@yahoo.com', 'hello', '2020-09-23 22:29:32'),
	(22, 'Satch McGoo', 'smmg@yahoo.com', 'select * from contact', '2020-09-23 23:31:20'),
	(23, 'Snack ish', 'snd@yahoo.com', 'Ummm select *& sdo #%#$%^', '2020-09-23 23:34:47'),
	(24, 'Dwight Howard', 'dh@yahoo.com', 'Hello there sir', '2020-10-02 21:19:20'),
	(25, 'Sasquatch  Spool', 'ssp@yahoo.com', 'hello sir', '2020-10-03 00:45:32'),
	(26, 'Ampere Herty', 'amhty@gmail.com', 'Asphalt', '2020-10-03 01:07:24'),
	(27, 'Hampton Brown', 'hb@yahoo.com', 'Please contact me. ', '2020-10-07 19:51:19'),
	(28, 'josh jacobs', 'jj@fmail.com', 'Good day to you sir. ', '2020-10-07 22:17:50'),
	(29, 'Widny Saintil', 'wIzNotASaint@yahoo.com', 'Ryan is the best boyfriend ever. ', '2020-10-10 16:42:46');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;

-- Dumping structure for table bbbm.contactreasons
DROP TABLE IF EXISTS `contactreasons`;
CREATE TABLE IF NOT EXISTS `contactreasons` (
  `ContactReasonID` int(11) NOT NULL AUTO_INCREMENT,
  `ContactID` int(11) NOT NULL,
  `ReasonID` int(11) NOT NULL,
  `ModifiedDate` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`ContactReasonID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table bbbm.contactreasons: ~11 rows (approximately)
/*!40000 ALTER TABLE `contactreasons` DISABLE KEYS */;
REPLACE INTO `contactreasons` (`ContactReasonID`, `ContactID`, `ReasonID`, `ModifiedDate`) VALUES
	(1, 6, 1, '2020-08-29 16:13:21'),
	(2, 6, 3, '2020-08-29 16:13:21'),
	(3, 8, 1, '2020-08-29 23:26:04'),
	(4, 9, 3, '2020-09-01 21:13:37'),
	(5, 10, 4, '2020-09-01 21:52:09'),
	(6, 11, 2, '2020-09-01 21:54:39'),
	(7, 12, 3, '2020-09-01 22:03:34'),
	(8, 13, 3, '2020-09-01 22:09:13'),
	(9, 14, 1, '2020-09-19 12:53:27'),
	(10, 14, 3, '2020-09-19 12:53:27'),
	(11, 15, 3, '2020-09-19 13:08:44'),
	(12, 16, 3, '2020-09-19 13:11:20');
/*!40000 ALTER TABLE `contactreasons` ENABLE KEYS */;

-- Dumping structure for table bbbm.reasons
DROP TABLE IF EXISTS `reasons`;
CREATE TABLE IF NOT EXISTS `reasons` (
  `ReasonID` int(11) NOT NULL,
  `Reason` varchar(256) NOT NULL,
  `ModifiedDate` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`ReasonID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table bbbm.reasons: ~3 rows (approximately)
/*!40000 ALTER TABLE `reasons` DISABLE KEYS */;
REPLACE INTO `reasons` (`ReasonID`, `Reason`, `ModifiedDate`) VALUES
	(1, 'Nutrition - Initial Consultation', '2020-08-29 10:54:43'),
	(2, 'Nutrition - Follow-up Consultation', '2020-08-29 10:54:43'),
	(3, 'Consultant Services', '2020-08-29 10:54:43');
/*!40000 ALTER TABLE `reasons` ENABLE KEYS */;

-- Dumping structure for procedure bbbm.sp_createContact
DROP PROCEDURE IF EXISTS `sp_createContact`;
DELIMITER //
CREATE PROCEDURE `sp_createContact`(
	IN user_Name VARCHAR(50),
    IN Email VARCHAR(100),
    IN Message LONGTEXT,
    OUT out_id INT(10)
	 )
BEGIN
        		INSERT INTO contact(Name, Email, Message) 
				  VALUES(user_Name, Email, Message);
        	SET out_id = LAST_INSERT_ID();
		  END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
