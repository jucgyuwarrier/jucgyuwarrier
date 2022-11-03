DROP PROCEDURE if EXISTS errorProc;
delimiter $$
CREATE PROCEDURE errorProc()
BEGIN 
DECLARE CONTINUE HANDLER FOR 1146 SELECT '테이블이 없음' AS '메세지'; SELECT * FROM noTable;  
END $$
DELIMITER ; 
CALL errorProc(); 