SELECT addr, MAX(height) FROM usertbl GROUP BY addr;

WITH cte_usertbl(addr, maxheight)
AS
(SELECT addr, MAX(height) FROM usertbl GROUP BY addr)
SELECT AVG(maxheight*1.0) AS '각 지역별 최고 키의 평균' FROM cte_usertbl;