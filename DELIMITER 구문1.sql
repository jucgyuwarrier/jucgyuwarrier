DROP PROCEDURE IF EXISTS ifProc;
DELIMITER $$
CREATE PROCEDURE ifProc()
BEGIN
DECLARE var1 INT;
SET var1 = 100;

IF var1 = 100 THEN
SELECT '100입니다.';
END if;
END $$;
DELIMITER ; 
CALL ifProc();


DROP PROCEDURE if EXISTS ifProc2;
USE employees;

DELIMITER $$
CREATE PROCEDURE ifProc2()
BEGIN
DECLARE hireDATE DATE;
DECLARE curDATE DATE;
DECLARE days INT;

SELECT hire_date INTO hireDate
FROM employees.employees
WHERE emp_no = 10001;

SET curDATE = CURRENT_DATE();
SET days = DATEDIFF(CURDATE, hireDate);
IF(days/365) >= 5 THEN
SELECT CONCAT('입사한지' + days + '일이나 지났습니다.');
ELSE 
SELECT '입사한지' + days + '일밖에 안되었습니다.';
END IF;
END $$
DELIMITER ; -- DELIMITER 띄어쓰기 ; 띄어쓰기 