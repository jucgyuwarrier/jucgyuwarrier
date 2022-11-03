-- UNIQUE 제약조건--
USE tabledb2;
DROP TABLE IF EXISTS lol, lolop;
CREATE TABLE lol 
(
id CHAR(30) NOT NULL, 
pw VARCHAR(10) NOT NULL, 
nickName CHAR(10) NOT NULL UNIQUE
);

INSERT INTO lol VAlues ("jucgyuman", "1234", "젓규맨");
INSERT INTO lol VAlues ("gyugyuman", "4321", "규규맨");
-----------------------------------------------------------------
DROP TABLE IF EXISTS lol, lolop;
CREATE TABLE lol 
(
id CHAR(30) NOT NULL, 
pw VARCHAR(10) NOT NULL, 
nickName CHAR(10) NOT NULL,
CONSTRAINT AK_nickName UNIQUE(nickName)
);

-----------------------------------------------------------------

-- check 제약조건 --

USE tabledb2;
DROP TABLE IF EXISTS lol, lolop;
CREATE TABLE lol 
(
id CHAR(30) NOT NULL, 
pw VARCHAR(10) NOT NULL, CHECK (length(pw) >= 10)
nickName CHAR(10) NOT NULL,
CONSTRAINT CK_nickName CHECK ( nickName IS NOT NULL)
);

INSERT INTO lol VAlues ("jucgyuman", "1234", "젓규맨");
INSERT INTO lol VAlues ("gyugyuman", "4321", "규규맨");

DROP CHECK CK_nickName;
ALTER TABLE lol
ADD CONSTRAINT CK_nickName CHECK (nickName IN ("젓규맨", "규규맨", "규봉맨"));