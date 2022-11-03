SELECT userid AS '사용자', SUM(price * amount) AS '총구매액' FROM buytbl
GROUP BY userid HAVING SUM(price*amount) > 1000 
ORDER BY SUM(price*amount) desc; 