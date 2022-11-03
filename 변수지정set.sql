USE sqldb;
SET @myVar1 = 5;
SET @myVar2 = 3;
SET @myvar3 = 4.25;
SET @myvar4 = '가수 이름 ==>';
SELECT @myvar1;
SELECT @myvar2 + @myvar3;

SELECT @myvar4, userName FROM usertbl WHERE height > 180;