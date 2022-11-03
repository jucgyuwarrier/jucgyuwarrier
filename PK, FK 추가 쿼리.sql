
USE tabledb2
DROP TABLE IF EXISTS usertbl;

CREATE TABLE usertbl
(userID CHAR(8) NOT NULL, NAME VARCHAR(10) NOT NULL, birthyear INT not NULL,
CONSTRAINT PRIMARY KEY pk_userTBL_userID (userID) );

--------------------------------------------------------------------------------
USE tabledb2;
create TABLE usertbl
(userID CHAR(8) NOT NULL, userName varchar(10) NOT NULL, birthYear INT NOT NULL, 
addr char(2) NOT null, mobile1 CHAR(3) null,
mobile2 CHAR(8), height smallint, mDate DATE NULL,
CONSTRAINT PRIMARY KEY pk_userTBL_userID (userID)); -- 사용자가 이름을 지정해서 pk 명명

INSERT INTO usertbl (userID, userName, birthYear, addr, mobile1, mobile2, height, mDate) 
VALUES ("LSG", "이승기", 1987, "서울", 011, 1111111, 182, "2008-08-08");
INSERT INTO usertbl (userID, userName, birthYear, addr, mobile1, mobile2, height, mDate) 
VALUES ("KBS", "김범수", 1979, "경남", 011, 2222222, 173, "2012-04-04");
INSERT INTO usertbl (userID, userName, birthYear, addr, mobile1, mobile2, height, mDate) 
VALUES ("KKH", "김경호", 1971, "전남", 019, 3333333, 177, "2007-07-07");
INSERT INTO usertbl (userID, userName, birthYear, addr, mobile1, mobile2, height, mDate) 
VALUES ("JYP", "조용필", 1950, "경기", 011, 4444444, 166, "2009-04-04");
INSERT INTO usertbl (userID, userName, birthYear, addr, mobile1, mobile2, height, mDate) 
VALUES ("SSK", "성식경", 1979, "서울", NULL, NULL, 170, "2013-12-12");
INSERT INTO usertbl (userID, userName, birthYear, addr, mobile1, mobile2, height, mDate) 
VALUES ("LJB", "임재봄", 1963, "서울", 016, 6666666, 182, "2009-09-09");
INSERT INTO usertbl (userID, userName, birthYear, addr, mobile1, mobile2, height, mDate) 
VALUES ("YJS", "윤종신", 1969, "경남", NULL, NULL, 170, "2005-05-05");
INSERT INTO usertbl (userID, userName, birthYear, addr, mobile1, mobile2, height, mDate) 
VALUES ("EJW", "은쥐원", 1978, "경북", 011, 8888888, 174, "2014-03-03");
INSERT INTO usertbl (userID, userName, birthYear, addr, mobile1, mobile2, height, mDate) 
VALUES ("JKW", "김관우", 1965, "경기", 018, 9999999, 172, "2010-10-10");
INSERT INTO usertbl (userID, userName, birthYear, addr, mobile1, mobile2, height, mDate) 
VALUES ("BBB", "바밤바", 1973, "서울", 010, 0000000, 176, "2013-05-05"); 

-------------------------------------------------------------------------------------
-- ALTER TABLE 문을 사용한 수정 구문 --
USE tabledb2;
DROP TABLE IF EXISTS lol;
CREATE TABLE lol (id CHAR(30) NOT NULL, pw VARCHAR(10) NOT NULL, 
nickName CHAR(10) NOT NULL);

INSERT INTO lol VAlues ("jucgyuman", "1234", "젓규맨");
INSERT INTO lol VAlues ("gyugyuman", "4321", "규규맨");

ALTER TABLE lol
ADD CONSTRAINT PK_lol_id PRIMARY KEY (id);

--------------------------------------------------------------------------------------
-- FOREIGN KEY 생성방법1 --
USE tabledb2;
DROP TABLE if EXISTS lolop;
CREATE TABLE lolop (id CHAR(30) NOT NULL, win INT, lose INT , 
FOREIGN KEY(id) REFERENCES lol (id));

INSERT INTO lolop VALUES ("jucgyuman", 2, 3);
INSERT INTO lolop VALUES ("gyugyuman", 4, 10);

-- FOREIGN KEY 생성방법2 --
-- CONSTRAINT를 이용해 FK키에 이름을 지정 --
USE tabledb2;
DROP TABLE if EXISTS lolop;
CREATE TABLE lolop (id CHAR(30) NOT NULL, win INT, lose INT , 
CONSTRAINT FK_lol_lolop FOREIGN KEY(id) REFERENCES lol (id));


-- 테이블을 먼저 만들고 나중에 키를 추가할시 --
ALTER TABLE lolop
ADD CONSTRAINT FK_lol_lolop
FOREIGN KEY (id)
REFERENCES lol(id);

SHOW INDEX FROM lolop;

-- 외래 키 제거하고 ADD CONSTRAINT로 다시 추가 --
ALTER TABLE lolop
DROP FOREIGN KEY FK_lol_lolop;

ADD CONSTRAINT FK_lol_lolop FOREIGN KEY (id) REFERENCES lol(id)
ON UPDATE CASCADE;