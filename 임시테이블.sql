USE employees;
CREATE TEMPORARY TABLE if NOT EXISTS tempTBL (id INT, NAME CHAR(7));
CREATE TEMPORARY TABLE if NOT EXISTS employees (id INT, NAME CHAR(7));
DESCRIBE tempTBL; -- 테이블 구조 확인 describe
DESCRIBE employees;

INSERT INTO tempTBL VALUES (1, 'this');
INSERT INTO employees VALUES (2, 'MariaDB');
SELECT * FROM tempTBL;
SELECT * FROM employees;

USE employees;
SELECT * FROM tempTBL;
SELECT * FROM employees;

DROP TABLE tempTBL ; 

USE employees;
SELECT * FROM employees; 

USE tableDB;
