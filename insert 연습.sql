USE tabledb;
create TABLE usertbl
(userID CHAR(8) NOT NULL PRIMARY key, userName varchar(10) NOT NULL, birthYear INT NOT NULL, 
addr char(2) NOT null, mobile1 CHAR(3) null,
mobile2 CHAR(8), height smallint, mDate DATE NULL);

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


USE tabledb;
CREATE TABLE buytbl 
(num INT AUTO_INCREMENT NOT NULL primary KEY, userID CHAR(8) NOT NULL, prodName char(6), groupName char(4), price INT, amount SMALLINT, 
foreign KEY(userID) REFERENCES usertbl (userID));

INSERT INTO buytbl VALUES (NULL, 'KBS', '운동화', null, 30, 2);






