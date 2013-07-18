DROP TABLE IF EXISTS `Users`;
CREATE TABLE IF NOT EXISTS `Users` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) DEFAULT NULL,
  `PasswordHash` char(32) DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `Forename` varchar(50) DEFAULT NULL,
  `Surname` varchar(50) DEFAULT NULL,
  `JobTitle` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Mobile` varchar(50) DEFAULT NULL,
  `Tel` varchar(50) DEFAULT NULL,
  `Fax` varchar(50) DEFAULT NULL,
  `Website` varchar(200) DEFAULT NULL,
  `ProfilePic` varchar(250) DEFAULT NULL,
  `CreatedAt` int(11) NOT NULL DEFAULT '0',
  `UpdatedAt` int(11) DEFAULT NULL,
  `LastLoggedInAt` int(11) DEFAULT NULL,
  `IsActive` tinyint(4) NOT NULL DEFAULT '1',
  `AddressLine1` varchar(100) DEFAULT NULL,
  `AddressLine2` varchar(100) DEFAULT NULL,
  `AddressLine3` varchar(100) DEFAULT NULL,
  `AddressLine4` varchar(100) DEFAULT NULL,
  `Town` varchar(100) DEFAULT NULL,
  `County` varchar(100) DEFAULT NULL,
  `Postcode` varchar(100) DEFAULT NULL,
  `Department` varchar(100) DEFAULT NULL,
  `Role` varchar(100) DEFAULT NULL,
  `AdditionalData` text,
  `LoginAttempt` int(11) DEFAULT '0',
  `LastLoginAttemptedAt` int(11) DEFAULT NULL,
  `UpdatedDetails` text,
  `PasswordSetAt` int(11) DEFAULT NULL,
  `ProfileText` blob,
  `TwitterName` varchar(15) DEFAULT NULL,
  `FacebookProfile` varchar(15) DEFAULT NULL,
  `ColorTag` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Users_Username` (`Username`)
  ) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `Leaves`;
CREATE TABLE IF NOT EXISTS `Leaves` (
  `LeaveID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `Allowance` int(11) NOT NULL DEFAULT '0',
  `HolidayLeft` int(11) NOT NULL DEFAULT '0',
  `HolidayTaken` int(11) NOT NULL DEFAULT '0',
  `CreatedAt` int(11) NOT NULL DEFAULT '0',
  `UpdatedAt` int(11) NOT NULL DEFAULT '0',
   PRIMARY KEY (`LeaveID`)
   ) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `Requests`;
CREATE TABLE IF NOT EXISTS `Requests` (
  `RequestID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `RequestType` varchar(100) DEFAULT NULL,
  `DateFrom` int(11) NOT NULL DEFAULT '0',
  `DateTo` int(11) NOT NULL DEFAULT '0',
  `Description` varchar(100) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT '1',
  `CreatedAt` int(11) NOT NULL DEFAULT '0',
  `UpdatedAt` int(11) NOT NULL DEFAULT '0',
   PRIMARY KEY (`RequestID`)  
   ) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `Messages`;
CREATE TABLE IF NOT EXISTS `Messages` (
  `MessageID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `Message` varchar(250) DEFAULT NULL,
  `SentAt` int(11) NOT NULL DEFAULT '0',
  `SentTo` varchar(250) DEFAULT NULL,
  `State` tinyint(4) NOT NULL DEFAULT '1',
  `CreatedAt` int(11) NOT NULL DEFAULT '0',
  `UpdatedAt` int(11) NOT NULL DEFAULT '0',
   PRIMARY KEY (`MessageID`)
  ) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `Notifications`;
CREATE TABLE IF NOT EXISTS `Notifications` (
  `NotificationsID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `status` varchar(250) DEFAULT NULL,
  `State` tinyint(4) NOT NULL DEFAULT '1',
  `CreatedAt` int(11) NOT NULL DEFAULT '0',
  `UpdatedAt` int(11) NOT NULL DEFAULT '0',
   PRIMARY KEY (`NotificationsID`)
  ) ENGINE=MyISAM DEFAULT CHARSET=utf8;