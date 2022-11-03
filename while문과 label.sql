USE sqldb; 
DROP PROCEDURE if EXISTS whileProc;
DELIMITER $$
CREATE PROCEDURE whileProc()
BEGIN
DECLARE i INT;
DECLARE hap INT;
	SET i = 1;
	SET hap = 0;
	
WHILE (i<=100) DO
SET hap = hap + i;
SET i = i + 1;
END while;

SELECT hap;
END $$
DELIMITER ;
CALL whileProc();






USE sqldb;
DROP PROCEDURE if EXISTS whileProc2;
DELIMITER $$
CREATE PROCEDURE whileProc2()
BEGIN
DECLARE i INT;
DECLARE hap INT;
SET i = 1;
SET hap = 0;

myWhile: WHILE (i <= 100) DO -- While문에 label 지정--
IF (i%7 = 0) then
SET i = i +1;
ITERATE myWhile; -- 지정한 label문으로 가서 계속 진행 --
END IF;

SET hap = hap + i;
IF (hap > 1000) THEN
LEAVE myWhile; -- 지정한 label문을 떠남. 즉, while 종료.--

END IF;
SET i = i + 1;
END while;

SELECT hap;
END $$
DELIMITER;
CALL whileProc();