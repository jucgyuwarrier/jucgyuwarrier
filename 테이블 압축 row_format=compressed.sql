CREATE DATABASE IF NOT EXISTs compressDB
USE compressDB;
CREATE TABLE normaltbl( emp_no INT, first_name VARCHAR(14));
CREATE TABLE compresstbl(emp_no INT, first_name VARCHAR(14))
ROW_FORMAT=COMPRESSED ;

-- employees.employees에 필드를 select해서 normaltbl에 넣음 --
INSERT INTO normaltbl
SELECT emp_no, first_name FROM employees.employees;
INSERT INTO compresstbl
SELECT emp_no, first_name FROM employees.employees;

SHOW TABLE STATUS FROM compressDB;

USE mysql;
DROP DATABASE if EXISTS compressDB;