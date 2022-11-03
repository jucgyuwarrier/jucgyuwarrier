USE tabledb;
CREATE VIEW v_userTBL
AS -- 별칭의 AS가 아님-- 
SELECT userID, userName, addr FROM usertbl;

SELECT * FROM v_userTBL;

-----------------------------------------------
USE sqldb;
CREATE VIEW v_userbuyTBL
AS
SELECT U.userID, U.userName, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
FROM usertbl U 
INNER JOIN buytbl B
ON U.userID = B.userID;

SELECT * FROM v_userbuyTBL WHERE userName = '강호동';


----------------------------------------------------
CREATE VIEW v_userbuytbl2
AS 
SELECT U.userID AS 'USER ID', U.userName AS 'USER NAME', B.prodName AS 'PRODUCT NAME', U.addr,
CONCAT(U.mobile1, U.mobile2) AS 'MOBILE PHONE'
FROM usertbl U
INNER JOIN buytbl B
ON U.userID = B.userID;

SELECT `USER ID`, `USER NAME` FROM v_userbuytbl2; -- 별칭에 띄어쓰기가 들어가 있으면 ` ` 백틱으로 쎃어야함

-------------------------------------------------------------------

USE sqldb;
DROP VIEW v_userbuytbl;
CREATE VIEW v_userbuytbl
AS
SELECT U.userID, U.userName, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS mobile
FROM usertbl U
INNER JOIN buytbl B
ON U.userID = B.userID;

INSERT INTO v_userbuytbl 
VALUES('PKL', '박경리', '운동화', '경기', null);
-- DROP TABLE IF EXISTS buytbl, usertbl; --
SELECT * FROM v_userbuytbl;