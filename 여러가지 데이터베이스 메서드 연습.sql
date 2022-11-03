SELECT if(100>200, '참이닷', '그짓이다');

SELECT IFNULL(NULL, '널이군요'), IFNULL(100,'널이군요');

SELECT NULLIF(100,100), NULLIF(200,100);
SELECT ASCII('A'), CHAR(65);
SELECT BIT_LENGTH('ABC'), CHAR_LENGTH('ABC'), LENGTH('ABC');
SELECT CONCAT_WS('@','dyj02159','naver.com');
SELECT FORMAT(123456.123456789,3);

SELECT INSTR('leejeonggyu','g');
SELECT LOCATE('y','leejeonggyu');
SELECT BIN(32), HEX(24), OCT(123);
SELECT INSERT('leejeonggyu',4,5,'lol');
SELECT LEFT('leejeonggyu',4), RIGHT('leejeonggyu',3);
SELECT UPPER('LeeJeongGyu'),LOWER('LEEJEONGGYU');