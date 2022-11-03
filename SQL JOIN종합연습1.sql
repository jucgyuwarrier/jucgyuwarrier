USE sqlDB;
SELECT userID, SUM(price*amount) AS '총구매액'
FROM buytbl
GROUP BY userID
ORDER BY SUM(price*amount) DESC;

SELECT B.userID, U.userName, SUM(price*amount) AS '총구매액'
FROM buytbl B
INNER JOIN usertbl U
ON B.userID = U.userID
GROUP BY B.userID, U.userName
ORDER BY SUM(price*amount) DESC;

SELECT B.userID, U.userName, SUM(price*amount) AS '총구매액'
FROM buytbl B
RIGHT OUTER JOIN usertbl U
ON B.userID = U.userID
GROUP BY B.userID, U.userName 
ORDER BY SUM(price*amount) DESC ;

SELECT U.userID, U.userName, SUM(price*amount) AS '총구매액'
FROM buytbl B
RIGHT OUTER JOIN usertbl U
ON B.userID = U.userID
GROUP BY U.userID, U.userName
ORDER BY SUM(price*amount) DESC


USE sqldb;
SELECT U.userID, U.userName, SUM(price*amount) AS '총구매액',
CASE
WHEN (SUM(price*amount) >= 1500) THEN '최우수고객'
WHEN (SUM(price*amount) >= 1000) THEN '우수고객'
WHEN (SUM(price*amount) >= 1) THEN '일반고객'
ELSE '유령고객'
END AS '고객등급'
FROM buytbl B
RIGHT OUTER JOIN usertbl U
ON B.userID = U.userID
GROUP BY U.userID, U.userName
ORDER BY SUM(price*amount) DESC;







---

USE sqldb;
DROP PROCEDURE if EXISTS Proc1;
DELIMITER $$
CREATE PROCEDURE Proc1()
BEGIN

SELECT U.userID, U.userName, SUM(price*amount) AS '총구매액', 
	CASE
	WHEN (SUM(price*amount) >= 1500) THEN '최우수고객'
	WHEN (SUM(price*amount) >= 1000) THEN '우수고객'
	WHEN (SUM(price*amount) >= 1) THEN '일반고객'
ELSE '유령고객'
END AS '고객등급' -- 조회 필드칸에 CASE를 활용하고 AS 로 별칭 붙일때는 END CASE에서 CASE 쓰면안됨
FROM buytbl B
RIGHT OUTER JOIN usertbl U
ON B.userID = U.userID
GROUP BY U.userID, U.userName
ORDER BY SUM(price*amount) DESC;

END $$;
DELIMITER ; 
CALL Proc1();
