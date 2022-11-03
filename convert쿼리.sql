USE sqldb;
SELECT CAST(AVG(amount) AS SIGNED INTEGER) AS '평균 구매 개수' FROM buytbl;
SELECT convert(AVG(amount) AS SIGNED INTEGER) AS '평균 구매 개수' FROM 
buytbl;
