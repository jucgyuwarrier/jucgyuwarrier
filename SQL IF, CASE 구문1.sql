USE sqldb;
DROP PROCEDURE IF EXISTS ifProc3;
DELIMITER $$
CREATE PROCEDURE ifProc3()
BEGIN
DECLARE point INT ;
DECLARE credit CHAR(1);
SET POINT = 77 ;

IF POINT >= 90 then
SET credit = 'A';
ELSEIF POINT >= 80 then
SET credit = 'B';
ELSEIF POINT >= 70 then
SET credit = 'C';
ELSEIF POINT >= 60 THEN
SET credit = 'D';
ELSE
SET credit = 'F';
END if;
SELECT CONCAT ('취득점수==>', POINT), CONCAT('학점==>', credit);
END $$
DELIMITER ; 
CALL ifProc3(); 

USE sqldb;
DROP PROCEDURE if EXISTS caseProc;
DELIMITER $$
CREATE PROCEDURE caseProc()
BEGIN
	DECLARE POINT INT ;
	DECLARE credit CHAR(1);
	SET POINT = 77 ;
	
	case
	when POINT >= 90 then
	SET credit = 'A';
	when POINT >= 80 then
	SET credit = 'B';
	when POINT >= 70 then
	SET credit = 'C';
	when POINT >= 60 then
	SET credit = 'D';
	else
	SET credit = 'F';
	END case;
	SELECT CONCAT('취득점수==>', POINT), CONCAT('학점==>', credit);
	END $$
	DELIMITER ; 
	CALL ifProc3();