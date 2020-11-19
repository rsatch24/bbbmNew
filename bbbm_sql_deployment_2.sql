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

-- Dumping structure for table bbbm.pages
DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `PageID` int(11) NOT NULL,
  `PageName` varchar(56) NOT NULL,
  `PageURL` varchar(64) NOT NULL,
  `ModifiedDate` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`PageID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table bbbm.pages: ~6 rows (approximately)
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
REPLACE INTO `pages` (`PageID`, `PageName`, `PageURL`, `ModifiedDate`) VALUES
	(1, 'Home', '/', '2020-10-31 14:03:24'),
	(2, 'About', '/Home/About', '2020-10-31 14:03:24'),
	(3, 'Integrative Nutrition', '/Home/IntegrativeNutrition', '2020-10-31 14:03:24'),
	(4, 'Contact', '/Contact/Index', '2020-10-31 14:06:00'),
	(5, 'Corporate Engagement', '/Home/CorporateEngagement', '2020-10-31 14:06:00'),
	(6, 'FAQ', '/Home/FAQ', '2020-10-31 14:06:00');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;

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
	(3, 'Functional Nutrition Consulting', '2020-08-29 10:54:43');
/*!40000 ALTER TABLE `reasons` ENABLE KEYS */;

-- Dumping structure for table bbbm.sections
DROP TABLE IF EXISTS `sections`;
CREATE TABLE IF NOT EXISTS `sections` (
  `SectionID` int(11) NOT NULL,
  `PageID` int(11) NOT NULL,
  `SectionName` varchar(64) NOT NULL,
  `SectionContent` text NOT NULL,
  `isIMG` bit(1) NOT NULL,
  `ModifiedDate` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`SectionID`),
  KEY `fk_section_page` (`PageID`),
  CONSTRAINT `fk_section_page` FOREIGN KEY (`PageID`) REFERENCES `pages` (`PageID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table bbbm.sections: ~33 rows (approximately)
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
REPLACE INTO `sections` (`SectionID`, `PageID`, `SectionName`, `SectionContent`, `isIMG`, `ModifiedDate`) VALUES
	(1, 1, 'Contact Button Name', 'Schedule', b'0', '2020-10-31 14:26:13'),
	(2, 1, 'Home Title', '<h3>Welcome</h3>', b'0', '2020-10-31 14:26:13'),
	(3, 1, 'Home Welcome Text', '<p class="mb-3 para-text" style="font-size: 16px; font-family: Roboto, arial, sans-serif; color: rgb(33, 37, 41); text-align: center; margin-bottom: 1rem !important;">In 2009 I was diagnosed with Crohn’s Disease: an autoimmune condition. By October, 2011 I had found my personal cure. Along the way my entire life changed. By 2014 I had left my Physics PhD track and completed my Master’s in Nutrition. I went through The Four Winds Lightbody Healing Program and along the way found myself starting studies with indigenous healers. You can read more about my journey if you’d like to know more about the path I took to healing.</p><p class="mb-3 para-text" style="font-size: 16px; font-family: Roboto, arial, sans-serif; color: rgb(33, 37, 41); text-align: center; margin-bottom: 1rem !important;">To me, being a guide means accepting the responsibility of taking you as far along your healing path as I can. My goal is to get you well quickly and efficiently. Insofar I have guided 100’s of people to health and wellness.</p><p class="mb-3 para-text" style="font-size: 16px; font-family: Roboto, arial, sans-serif; color: rgb(33, 37, 41); text-align: center; margin-bottom: 1rem !important;">As a guide I work to merge established with cutting edge science while sourcing from the ancient traditions. We craft an explanatory model large enough to encompass all of your present state in all of its simplicity or complexity while providing a clear, grounded path towards healing.</p><p class="mb-3 para-text" style="font-size: 16px; font-family: Roboto, arial, sans-serif; color: rgb(33, 37, 41); text-align: center; margin-bottom: 1rem !important;">To work with me you can submit an interest form found</p><p class="mb-3 para-text" style="font-size: 16px; font-family: Roboto, arial, sans-serif; color: rgb(33, 37, 41); text-align: center; margin-bottom: 1rem !important;"><a href="/Contact/Index"><font color="#212529" face="Roboto, arial, sans-serif"><span style="font-size: 16px; margin-bottom: 1rem !important;">here</span></font></a></p>', b'0', '2020-10-31 14:26:13'),
	(4, 3, 'Integrative Nutrition Title', '<h3 style="margin-bottom: 0.5rem; font-size: 1.75rem; color: rgb(87, 87, 87); font-family: &quot;EB Garamond&quot;, serif; text-align: center;">Integrative Nutrition</h3>', b'0', '2020-11-03 22:23:27'),
	(5, 3, 'Sub-Header', '<p class="mb-3 para-text" style="text-align: center; margin-bottom: 1rem !important;"><span class="font-italic" style="color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;">As an Integrative Nutritionist, I use Food as Medicine alongside targeted nutraceutical and herbal therapies and lab testing as needed for both an adult and pediatric population.</span><br style="color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;"><br style="color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;"><span style="color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;"><font color="#0366d6"><a href="/Home/CorporateEngagement"><span style="color:rgb(11,83,148);">Corporate Engagement Information</span></a></font></span><br></p>', b'0', '2020-11-03 22:23:27'),
	(6, 3, 'column-top-left', '', b'1', '2020-11-03 22:23:27'),
	(7, 3, 'column-top-right', '<h3 class="text-center" style="margin-bottom: 0.5rem; font-size: 20px; color: rgb(87, 87, 87); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;">Areas of Specialty</h3><p style="color: rgb(87, 87, 87); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;"><ul><li>Gastrointestinal Conditions: IBS &amp; SIBO + Managing Crohn’s, Colitis, Celiac, and Gastroparesis</li><li>Autoimmunity: Reducing Symptoms &amp; Medications (alongside your medical doctor)</li><li>Neurological Conditions: Reducing Symptoms from ADD, ADHD, &amp; Autism Spectrum Disorders</li><li>Chronic Symptoms of Unknown Origin</li></ul></p>', b'0', '2020-11-03 22:23:27'),
	(8, 3, 'column-bottom-left', '<h3 class="text-center" style="margin-bottom: 0.5rem; font-size: 20px; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;">Appointments Times &amp; Locations</h3><p style="text-align: center;">&nbsp;Friday: 1:00 - 5:00 PM<br style="text-align: center;"><br style="text-align: center;">&nbsp;Saturday : 11:00 AM – 5:00 PM<br style="text-align: center;"><br style="text-align: center;">&nbsp;All consultations are via phone or video call</p><p style="text-align: center;"><br style="text-align: center;"><span style="color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;">***After the consultation your follow up email will include a summary of the consultation and your personal root causes alongside all dietary recommendations and your therapeutic protocol.***</span><br style="text-align: center;"></p><p style="text-align: center;"><br></p><p></p>', b'0', '2020-11-03 22:23:27'),
	(9, 3, 'column-bottom-right', '<h3 class="text-center" style="margin-bottom: 0.5rem; font-size: 20px; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;">Scheduling</h3><p style="text-align: center;">Call: 845-544-9427<br style="text-align: left;">Use Contact Form:&nbsp;<a href="http://localhost:51860/Contact/Index" style="color: rgb(3, 102, 214); text-decoration-line: none; background-color: rgb(255, 255, 255);">here</a><br style="text-align: left;"></p><p style="text-align: left;"></p><p style="text-align: left;"></p><p></p><p class="text-center" style="color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;"></p><p style="text-align: center;"></p><h3 class="text-center" style="margin-bottom: 0.5rem; font-size: 20px; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;">Investment</h3><p class="text-center" style="color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;"></p><p style="text-align: center;">Initial Consultation (1.5 hours): $170.00<br style="text-align: center;">Follow Up Consultation (30 – 90 minutes): $100.00/hr<br style="text-align: center;"></p><p></p><h3 class="text-center" style="margin-bottom: 0.5rem; font-size: 20px; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;">Insurance</h3><p class="text-center" style="color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;"></p><p style="text-align: center;">I do not accept insurance<br style="text-align: center;">I provide upon request the form necessary to submit for reimbursement from an out-of-network provider.<br style="text-align: center;"></p><p></p>', b'0', '2020-11-03 22:23:27'),
	(10, 3, 'Frequently Asked Questions', '<h3 class="text-center" style="margin-bottom: 0.5rem; font-size: 20px; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;"><font color="#0056b3"><a href="/Home/FAQ"><span style="color:rgb(11,83,148);">Frequently Asked Questions</span></a></font></h3>', b'0', '2020-11-14 12:10:37'),
	(11, 2, 'About Header', '<h3 style="margin-bottom: 0.5rem; font-size: 1.75rem; color: rgb(87, 87, 87); font-family: &quot;EB Garamond&quot;, serif; text-align: center;">ABOUT</h3>', b'0', '2020-11-14 12:24:57'),
	(12, 2, 'column-top-left', '', b'1', '2020-11-14 12:24:57'),
	(13, 2, 'column-top-right', '<h3 style="margin-bottom: 0.5rem; font-size: 20px; color: rgb(87, 87, 87); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; text-align: center;"><p class="MsoNormal" align="center" style="line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span style="font-size:15.0pt;font-family:&quot;Segoe UI&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;color:#575757">Background</span></p><p class="MsoNormal" align="center" style="line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span style="font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;color:#575757">Joshua Nachman, MS, CNS, CPT is the owner of Balanced BodiesBalanced Minds, LLC and holds a Master of Science in Nutrition and IntegrativeHealth from Maryland University of Integrative Health.<o:p></o:p></span></p><p class="MsoNormal" align="center" style="line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span style="font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;color:#575757">He works as a consultant for precision nutrition and nutritionR&amp;D companies, a speaker for public and private companies and governmentorganizations.<o:p></o:p></span></p><p class="MsoNormal" align="center" style="line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span style="font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;color:#575757">Prior, Joshua worked as an integrative nutritionist at the&nbsp;<a href="https://www.hopkinsmedicine.org/integrative_medicine_digestive_center/" target="_blank"><span style="color:#0366D6">Johns Hopkins Integrative Medicineand Digestive Center&nbsp;</span></a>, as a member of the BCNS CertificationExam Writers Board, and instructed nutrition courses at Stratford Universityand Maryland University of Integrative Health.<o:p></o:p></span></p></h3>', b'0', '2020-11-14 12:24:57'),
	(14, 2, 'column-bottom-left', '<h3 style="margin-bottom: 0.5rem; font-size: 20px; color: rgb(87, 87, 87); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; text-align: center;"><p class="MsoNormal" align="center" style="line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span style="font-size:15.0pt;font-family:&quot;Segoe UI&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;color:#575757">Education</span><span style="font-size:12.0pt;font-family:&quot;Segoe UI&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;color:#575757"><br><!--[if !supportLineBreakNewLine]--><br><!--[endif]--></span><span style="font-size:15.0pt;font-family:&quot;Segoe UI&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;color:#575757"><o:p></o:p></span></p><p class="MsoNormal" align="center" style="line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span style="font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;color:#575757">As an energy medicine practitioner, Joshua has been privilegedto train in small groups with indigenous teachers. Over time he has immersedhimself in various traditions including Sivananda Yoga, Mystical Judaism, andpre-Egyptian Healing Schools among others.<o:p></o:p></span></p><p class="MsoNormal" align="center" style="line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span style="font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;color:#575757">Prior to studying nutrition, Joshua studied Applied Physics atthe University of Maryland Baltimore County where he completed his BS andMaster’s coursework. He has also worked as a personal trainer certified by theAmerican College of Sports Medicine<o:p></o:p></span></p><p class="MsoNormal" align="center" style="line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span style="font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;color:#575757">Through Joshua’s diagnosis in 2008 with Crohn’s Disease, hebegan to understand the transformative power of nutrition, lifestyle, andindigenous healing which culminated in his full healing from Crohn’s. It alsolaunched his current professional journey committed to guiding others towardshealing and finding balance.<o:p></o:p></span></p></h3><blockquote style="margin: 0 0 0 40px; border: none; padding: 0px;"><p></p></blockquote>', b'0', '2020-11-14 12:24:57'),
	(15, 2, 'column-bottom-right-header', '<h3 style="margin-bottom: 0.5rem; font-size: 20px; color: rgb(87, 87, 87); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; text-align: center;">Featured in</h3>', b'0', '2020-11-14 12:24:57'),
	(16, 4, 'Contact_title', '<h3 style="text-align: center;">Contact</h3>', b'0', '2020-11-14 13:25:24'),
	(17, 4, 'Interest_title', 'Interest:&nbsp;', b'0', '2020-11-14 13:25:24'),
	(18, 4, 'Contact_button', 'Send', b'0', '2020-11-14 13:25:24'),
	(19, 5, 'Corporate Engagement Title', '<h3 style="margin-bottom: 0.5rem; font-size: 1.75rem; color: rgb(87, 87, 87); font-family: &quot;EB Garamond&quot;, serif; text-align: center;">Nutrition Education Lectures</h3>', b'0', '2020-11-14 15:37:50'),
	(20, 5, 'Sub_header', '<font color="#0366d6" face="-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji"><span style="background-color: rgb(255, 255, 255); font-size: 16px; text-align: center;"><i><a href="/Contact/Index">Contact Me</a>&nbsp;</i></span></font><span style="color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: italic; text-align: center;">to schedule a talk or to create a specialized lecture to fit your audience.</span>', b'0', '2020-11-14 15:37:50'),
	(21, 5, 'left column: venues', '<h3 class="text-center" style="margin-bottom: 0.5rem; font-size: 20px; color: rgb(87, 87, 87); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;">Joshua has given lectures at multiple venues including:</h3><p style="color: rgb(87, 87, 87); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;"><ul><li>Johns Hopkins Applied Physics Lab</li><li>Johns Hopkins Wilmer Eye Institute</li><li>Maryland University of Integrative Health</li><li>Howard County Public School System</li><li>Howard Community College</li><li>ECO City Farms</li></ul></p>', b'0', '2020-11-14 15:37:50'),
	(22, 5, 'right column: topics', '<p style="color: rgb(87, 87, 87); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;"><h3 class="text-center" style="margin-bottom: 0.5rem; font-size: 20px;">Topics include:</h3><p><h5 style="margin-bottom: 0.5rem;">Food As Medicine</h5><p style="margin-bottom: 1rem;">Straight answers on common food questions, why food sensitivities exist, and how you can heal. Learn how Food as Medicine can help your health span equal your life span.</p></p></p><p style="color: rgb(87, 87, 87); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;"><h5 style="margin-bottom: 0.5rem;">The Paleo-Vegan Spectrum</h5><p style="margin-bottom: 1rem;">From the paleolithic to the raw foods diets, there are currently over 60 popular diets and 70,000 diet books written to date. In this talk we address the commonalities and contradictions, creating clear and actionable understandings around food. Topics include dairy, grains, optimizing intake, eating clean, meat and saturated fats, and tapping into your innate body wisdom.</p></p><p style="color: rgb(87, 87, 87); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;"><h5 style="margin-bottom: 0.5rem;">Physics, Nutrition, and Energetic Healing: Building the New Paradigm</h5><p style="margin-bottom: 1rem;">Using easy to understand concepts from cutting edge physics, nutrition is addressed as a way to enhance consciousness and promote mental/emotion healing. Practical energy healing techniques are taught to promote and sustain this process.</p></p>', b'0', '2020-11-14 15:37:50'),
	(23, 6, 'FAQ Title', '<h3 style="margin-bottom: 0.5rem; font-size: 1.75rem; color: rgb(87, 87, 87); font-family: &quot;EB Garamond&quot;, serif; text-align: center;">Frequently Asked Questions</h3>', b'0', '2020-11-14 15:56:40'),
	(24, 6, 'Question 1', 'How many clients have you successfully treated?&nbsp;', b'0', '2020-11-14 15:56:40'),
	(25, 6, 'Answer 1', '<p style="margin-bottom: 1rem; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;">Mid-100’s. I define success by at minimum accomplishing the client’s goals.</p><p style="margin-bottom: 1rem; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;">Can you put that in perspective?</p><p style="margin-bottom: 1rem; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;">Sure. I’ve had in the 10’s of people opt to drop out of care from personal choice due to not being ready to implement changes, sometimes due to investment requirements, and sometimes because we are just not a good fit on either end.</p><p style="margin-bottom: 1rem; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;">Most are successful.</p>', b'0', '2020-11-14 15:56:40'),
	(26, 6, 'Question 2', 'How many consults do I need to see the results?&nbsp;', b'0', '2020-11-14 15:56:40'),
	(27, 6, 'Answer 2', '<p style="margin-bottom: 1rem; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;">It only takes 1 consultation to see results within the subsequent 1-3 weeks of implementing the recommended changes.</p><p style="margin-bottom: 1rem; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;">Most people require 3-5 consults over the course of 6 months to accomplish their goals. Consults tend to be spaced 4-8 weeks apart.</p><p style="margin-bottom: 1rem; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;">If your current state includes multiple chronic diagnoses and symptoms preventing you from living life your healing process will likely take around 1 year. Such cases are usually facilitated by working alongside a functional medicine physician.</p>', b'0', '2020-11-14 15:56:40'),
	(28, 6, 'Question 3', 'What is food as medicine?&nbsp;', b'0', '2020-11-14 15:56:40'),
	(29, 6, 'Answer 3', '<span style="color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;">Food As Medicine is the practice of using foods and herbs in specific quantities for specific lengths of time to facilitate the healing process. Food As Medicine is best complimented by targeted herbal and nutraceutical therapies alongside lab testing to promote whole person healing.</span>', b'0', '2020-11-14 15:56:40'),
	(30, 6, 'Question 4', 'What does the initial consult cover?&nbsp;', b'0', '2020-11-14 15:56:40'),
	(31, 6, 'Answer 4', '<p style="margin-bottom: 1rem; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;">I ask that everyone fill out my Intake Form and return this to alongside any labs from the past 6 months at least 48 hours prior the consultation.</p><p style="margin-bottom: 1rem; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;">At the start of every consultation I offer the opportunity for you to voice your questions, concerns, and goals for the consultation. Once I understand where you want to go, we will spend the first 30-45 minutes going into a detailed discussion on your history and current symptoms as well as lifestyle if appropriate.</p><p style="margin-bottom: 1rem; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;">From here I will outline your path forward as well as detail the recommendations. These recommendations will include dietary changes and may include herbal or nutraceutical therapy, lifestyle modifications, and/or lab testing.</p><p style="margin-bottom: 1rem; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;">All supplements must be purchased post-consultation and are provided at the maximum possible discount allowed by the manufacturer. Labs will be run through your Primary Care or specialty Physician or prescribed by myself. Some labs including Genova, SpectraCell, and Parasitology Center have out-of-pocket costs regardless of the prescribing provider.</p><p style="margin-bottom: 1rem; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;">Throughout the consultation all questions are welcomed and answered.</p>', b'0', '2020-11-14 15:56:40'),
	(32, 6, 'Question 5', 'What is your practice philosophy?&nbsp;', b'0', '2020-11-14 15:56:40'),
	(33, 6, 'Answer 5', '<p style="margin-bottom: 1rem; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;">My job as a nutritionist is to utilize the most recent cutting edge science and work with you as a unique, evolving individual to help you find and maintain a state of wellness and balance.</p><p style="margin-bottom: 1rem; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;">In long form…</p><p style="margin-bottom: 1rem; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;">Our physical bodies are built from the food we eat, the water we drink, the air we breathe, all heavily influenced by our thoughts and emotions; creating a unique and interconnected system that is each one of us. Over the past several decades, revolutions have been made in our understanding of cell biology and chemistry which is largely placed under the context of Functional Medicine, Biochemical Individuality, Epigenetics, and Nutrigenomics. This knowledge base is expanding exponentially and daily. Ultimately, what works for one person may work very differently in another.</p><p style="margin-bottom: 1rem; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;">My job is to help you identify the root cause(s) of your symptoms. By tracing back your symptoms to their origin, we create a personalized pathway to healing. Oftentimes what you need changes as your body heals and shifts.</p><p style="margin-bottom: 1rem; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;">In my practice less tends to be more. Through using a combination of targeted foods and herbal therapies as and in conjunction with medicine, your body begins to make distinct shifts towards wellness. By following how your body responds, your healing path is optimized as you go until your goals are achieved.</p><p style="margin-bottom: 1rem; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;">For those who feel it will serve, this process is complimented with personalized lifestyle recommendations. Frequently our habits are created for a reason at some point during our life. By understanding how the habits you wish to change have served you, lasting and sustainable shifts can be created.</p>', b'0', '2020-11-14 15:56:40');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;

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

-- Dumping structure for table bbbm.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(256) NOT NULL,
  `PassWord` varchar(256) NOT NULL,
  `ModifiedDate` datetime DEFAULT current_timestamp(),
  `RoleName` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- Dumping data for table bbbm.users: ~1 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`UserID`, `UserName`, `PassWord`, `ModifiedDate`, `RoleName`) VALUES
	(33, 'JNachman', '1JNachman!', '2020-11-14 23:40:50', 'Admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
