CREATE database TRIGGERDB;
USE TRIGGERDB;
CREATE TABLE orderTbl 
(orderNo INT AUTO_INCREMENT PRIMARY KEY, userID VARCHAR(5), prodName VARCHAR(5),
orderamount INT);

USE TRIGGERDB;
CREATE TABLE prodTbl (prodName VARCHAR(10), amount INT);
CREATE TABLE deliverTbl(deliverNo INT AUTO_INCREMENT PRIMARY KEY,
prodName VARCHAR(5), amount INT UNIQUE);

INSERT INTO prodtbl VALUES('사과', 100);
INSERT INTO prodtbl VALUES('배', 100);
INSERT INTO prodtbl VALUES('귤', 100);

-- 물품 테이블에서 개수를 감소시키는 트리거 --
 
 DROP TRIGGER if EXISTS orderTrg;
 DELIMITER $$
 CREATE TRIGGER orderTrg 
 AFTER INSERT
 ON orderTBL
 FOR EACH ROW
 
 BEGIN
 UPDATE prodtbl SET amount = amount - NEW.orderamount
 WHERE prodName = NEW.prodName ;
 
 END $$
 DELIMITER ; 
 
 -----------------------------------------------------------------------
 DROP TRIGGER IF EXISTS prodTrg;
 DELIMITER $$
 CREATE TRIGGER prodTrg
 AFTER UPDATE
 ON prodTBL
 FOR EACH ROW
 
BEGIN
DECLARE orderAmount INT;
-- 주문 개수= (변경 전의 개수 - 변경 후의 개수)
SET orderAmount = OLD.amount - NEW.amount;
INSERT INTO delivertbl(prodName, amount) VALUES(NEW.prodName, orderAmount);
END //
DELIMITER ;

INSERT INTO ordertbl VALUES (NULL, 'JOHN', '배', 5);

SELECT * FROM ordertbl;
SELECT * FROM prodtbl;
SELECT * FROM delivertbl;

ALTER TABLE delivertbl CHANGE prodName productName VARCHAR(5);
INSERT INTO ordertbl VALUES (NULL, 'DANG', '사과', 9);

SELECT * FROM ordertbl;
SELECT * FROM prodtbl;
SELECT * FROM delivertbl;
