USE sqldb;
SELECT userName, addr, height AS "키", height - (LEAD(height) OVER (ORDER BY height DESC)) 
AS "다음 사람과 키 차이"
FROM usertbl;

USE sqldb;
SELECT addr, userName, height AS "키",
height - (FIRST_VALUE(height) over (PARTITION BY addr ORDER BY height DESC)) AS "지역별 최대키와 차이" FROM usertbl;

USE sqldb;
SELECT addr, userName, height AS "키",
(CUME_DIST() over (PARTITION BY addr ORDER BY height DESC)) * 100 AS "누적인원 백분율%" FROM usertbl;