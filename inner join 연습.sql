USE sqldb;
SELECT u.userid, u.userName, b.prodName, u.addr,
CONCAT(u.mobile1, u.mobile2) AS '연락처' FROM usertbl u 
INNER JOIN buytbl b ON u.userID = B.userID
ORDER BY u.userID;

SELECT DISTINCT u.userID, u.userName, u.addr FROM usertbl u
INNER JOIN buytbl b ON u.userID = b.userid ORDER BY u.userID;

use sqldb;
SELECT u.userID, u.userName, u.addr
FROM usertbl u
WHERE EXISTS (
SELECT * FROM buytbl b WHERE u.userID = b.userID);
