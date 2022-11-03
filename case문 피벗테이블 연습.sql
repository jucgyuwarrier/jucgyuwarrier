USE sqldb;
CREATE TABLE pivotTest (uName CHAR(3), season CHAR(2), amount INT);
INSERT INTO privotTest VALUES ('유재석', '겨울', 10);
INSERT INTO privotTest VALUES ('강호동', '여름', 15);
INSERT INTO privotTest VALUES ('유재석', '가을', 25);
INSERT INTO privotTest VALUES ('유재석', '봄', 3);
INSERT INTO privotTest VALUES ('유재석', '봄', 37);
INSERT INTO privotTest VALUES ('강호동', '겨울', 40);
INSERT INTO privotTest VALUES ('유재석', '여름', 14);
INSERT INTO privotTest VALUES ('유재석', '겨울', 22);
INSERT INTO privotTest VALUES ('강호동', '여름', 64);
SELECT * FROM privotTest;

SELECT uName, 
SUM(case when season='봄' then amount END) AS '봄',
SUM(case when season='여름' then amount END) AS '여름',
SUM(case when season='가을' then amount END) AS '가을',
SUM(case when season='겨울' then amount END) AS '겨울' 
FROM privotTest GROUP BY uName;