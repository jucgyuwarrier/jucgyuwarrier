USE sqlDB;
CREATE TABLE if NOT EXISTS testTBL (id INT, txt VARCHAR(10));
INSERT INTO testTBL VALUES(1, '북북소년단');
INSERT INTO testTBL VALUES(2, '남북신기');
INSERT INTO testTBL VALUES(3, '에이오에이');
 
DROP TRIGGER IF EXISTS testTrg;
DELIMITER $$
CREATE TRIGGER testTrg
AFTER DELETE 
ON testtbl 
FOR EACH ROW 

BEGIN 
SET @msg = '가수 그룹이 삭제됨'; 
END $$
DELIMITER ; 

SET @msg = '';
INSERT INTO testTbl VALUES(4, '검은핑크');
SELECT @msg;
UPDATE testTBL SET txt = '두와이스' WHERE id = 3;
SELECT @msg; 
DELETE FROM testTBL WHERE id = 4;
SELECT @msg;

-------------------------------------------------------------------------
USE sqldb;

CREATE TABLE backup_userTBL
(userID CHAR(8) NOT NULL PRIMARY KEY, userName VARCHAR(10) NOT NULL,
birthYear INT NOT NULL, addr CHAR(2) NOT NULL, 
mobile1 CHAR(3), mobile2 CHAR(8), height SMALLINT, mDate DATE, modType CHAR(2),
modDate DATE, modUser VARCHAR(256));

USE sqldb;
DROP TRIGGER if EXISTS backUserTbl_UpdateTrg;
DELIMITER $$
CREATE TRIGGER backUserTbl_UpdateTrg
AFTER UPDATE
ON usertbl
FOR EACH ROW 

BEGIN 
INSERT INTO backup_userTBL VALUES(OLD.userID, OLD.userName, OLD.birthYear, 
OLD.addr, OLD.mobile1, OLD.mobile2, OLD.height, OLD.mDate, '수정', CURDATE());

END $$
DELIMITER ;

DROP TRIGGER IF EXISTS backUserTbl_DeleteTrg;
DELIMITER $$

CREATE TRIGGER backUserTb1_DeleteTrg
AFTER DELETE ON usertbl FOR EACH ROW
BEGIN 
INSERT INTO backup_userTBL VALUES(OLD.userID, OLD.userName, OLD.birthYear,
OLD.addr, OLD.mobile1, OLD.mobile2, OLD.height, OLD.mDate,
 '삭제', CURDATE());
END $$
DELIMITER ; 

--------------------------------------------------------------------------------------
UPDATE usertbl SET addr = '몽고' WHERE userID = 'BBQ';
DELETE FROM usertbl WHERE userID = 'QQQ';

SELECT * FROM usertbl;
SELECT * FROM backup_usertbl;
