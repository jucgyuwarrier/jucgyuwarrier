USE sqldb;
SET @myVarl = 3;
PREPARE myQuery
FROM 'select userName, height from userTBL order by height limit ?';
EXECUTE myQuery USING @myVarl;