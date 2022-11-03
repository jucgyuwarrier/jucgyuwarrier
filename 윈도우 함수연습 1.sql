USE sqldb;
SELECT AVG(amount) AS '평균 구매 개수' FROM buytbl;
SELECT userID, AVG(amount) AS '평균 구매 개수' FROM buytbl GROUP BY userID;

SELECT userName, MAX(height), MIN(height) FROM usertbl;
SELECT userName, MAX(height), MIN(height) FROM usertbl GROUP BY userName; 

SELECT userName, MAX(height), MIN(height) FROM usertbl GROUP BY userName;
SELECT userName, height FROM usertbl WHERE height = (SELECT MAX(height) FROM usertbl) OR height = (SELECT MIN(height) FROM usertbl);

SELECT COUNT(*) FROM usertbl;
SELECT COUNT(mobile1) AS '휴대폰이 있는 사용자' FROM usertbl;

SELECT userID AS '사용자', SUM(price * amount) AS '총 구매액' FROM buytbl GROUP BY userID;
SELECT userID AS '사용자', SUM(price * amount) AS '총 구매액' FROM buytbl GROUP BY userID HAVING SUM(price * amount) > 1000;
SELECT userID AS '사용자', SUM(price * amount) AS '총 구매액' FROM buytbl GROUP BY userID HAVING SUM(price * amount) > 1000 ORDER BY SUM(price * amount) desc;

SELECT num, groupName, SUM(price * amount) AS '비용' FROM buytbl GROUP BY groupName, num WITH ROLLUP;
SELECT groupName, SUM(price * amount) AS '비용' FROM buytbl GROUP BY groupName WITH ROLLUP;

SELECT ROW_NUMBER() over(ORDER BY height DESC) '키큰순위', userName, addr, height FROM usertbl;
SELECT ROW_NUMBER() over(ORDER BY height DESC, username ASC) "키큰순위", userName, addr, height FROM usertbl;
SELECT addr, ROW_NUMBER() over(PARTITION BY addr ORDER BY height, userName ASC) "지역 별 키큰순위", userName, height FROM usertbl;
SELECT DENSE_RANK() over(ORDER BY height DESC) "키큰 순위", userName, addr, height FROM usertbl; 
SELECT RANK() over(ORDER BY height DESC) "키큰 순위", userName, addr, height FROM usertbl;

SELECT NTILE(2) over(ORDER BY height DESC) "반번호",userName, addr, height FROM usertbl;
SELECT NTILE(3) over(ORDER BY height DESC) "반번호",userName, addr, height FROM usertbl; 
