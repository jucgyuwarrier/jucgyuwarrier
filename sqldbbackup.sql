-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.6.7-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- sqldb 데이터베이스 구조 내보내기
DROP DATABASE IF EXISTS `sqldb`;
CREATE DATABASE IF NOT EXISTS `sqldb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `sqldb`;

-- 테이블 sqldb.buytbl 구조 내보내기
DROP TABLE IF EXISTS `buytbl`;
CREATE TABLE IF NOT EXISTS `buytbl` (
  `num` int(10) NOT NULL AUTO_INCREMENT,
  `userID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prodName` char(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `groupName` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(10) NOT NULL,
  `amount` smallint(5) NOT NULL,
  PRIMARY KEY (`num`) USING BTREE,
  KEY `userID` (`userID`) USING BTREE,
  CONSTRAINT `FK_buytbl_sqldb.USERTBL` FOREIGN KEY (`userID`) REFERENCES `usertbl` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 sqldb.buytbl:~13 rows (대략적) 내보내기
DELETE FROM `buytbl`;
/*!40000 ALTER TABLE `buytbl` DISABLE KEYS */;
INSERT INTO `buytbl` (`num`, `userID`, `prodName`, `groupName`, `price`, `amount`) VALUES
	(1, 'KHD', '운동화', NULL, 480, 2),
	(2, 'KHD', '노트북', '전자', 16000, 1),
	(3, 'KYM', '모니터', '전자', 3200, 1),
	(4, 'PSH', '모니터', '전자', 3200, 5),
	(5, 'KHD', '청바지', '의류', 800, 3),
	(6, 'PSH', '메모리', '전자', 1280, 10),
	(7, 'KJD', '책', '서적', 240, 5),
	(8, 'LHJ', '책', '서적', 240, 2),
	(9, 'LHJ', '청바지', '의류', 800, 1),
	(10, 'PSH', '운동화', NULL, 480, 2),
	(11, 'LHJ', '책', '서적', 240, 1),
	(12, 'PSH', '운동화', NULL, 480, 2),
	(18, 'BBQ', '황올', NULL, 480, 2);
/*!40000 ALTER TABLE `buytbl` ENABLE KEYS */;

-- 테이블 sqldb.usertbl 구조 내보내기
DROP TABLE IF EXISTS `usertbl`;
CREATE TABLE IF NOT EXISTS `usertbl` (
  `userID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userName` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthYear` int(10) NOT NULL,
  `addr` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile1` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile2` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `height` smallint(5) DEFAULT NULL,
  `mDate` date DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 sqldb.usertbl:~11 rows (대략적) 내보내기
DELETE FROM `usertbl`;
/*!40000 ALTER TABLE `usertbl` DISABLE KEYS */;
INSERT INTO `usertbl` (`userID`, `userName`, `birthYear`, `addr`, `mobile1`, `mobile2`, `height`, `mDate`) VALUES
	('BBQ', '비비큐', 1972, '서울', '010', '12345678', 178, '2008-08-08'),
	('KHD', '강호동', 1970, '경북', '011', '22222222', 182, '2007-07-07'),
	('KJD', '김제동', 1974, '경남', NULL, NULL, 173, '2013-03-03'),
	('KKG', '김국진', 1965, '서울', '019', '33333333', 171, '2009-09-09'),
	('KYM', '김용만', 1967, '서울', '010', '44444444', 177, '2015-05-05'),
	('LHJ', '이휘재', 1972, '경기', '011', '88888888', 180, '2006-04-04'),
	('LKK', '이경규', 1960, '경남', '018', '99999999', 170, '2004-12-12'),
	('NHS', '남희석', 1971, '충남', '016', '66666666', 180, '2017-04-04'),
	('PSH', '박수홍', 1970, '서울', '010', '00000000', 183, '2012-05-05'),
	('SDY', '신동엽', 1971, '경기', NULL, NULL, 176, '2008-10-10'),
	('YJS', '유재석', 1972, '서울', '010', '11111111', 178, '2008-08-08');
/*!40000 ALTER TABLE `usertbl` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
