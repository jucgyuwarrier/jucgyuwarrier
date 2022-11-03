USE sqldb;
SELECT JSON_OBJECT('name', userName, 'height', height)
AS 'json 값'
FROM usertbl
WHERE height >= 180;

SET @JSON = '{"userTBL" : [{"name":"강호동", "height":182}, 
{"name":"이휘재", "height":180}, {"name":"남희석", "height":180}, 
{"name":"박수홍", "height":183}]}';

SELECT JSON_VALID(@JSON) AS JSON_VALID;
SELECT JSON_SEARCH(@JSON, 'one', '남희석') AS JSON_SEARCH;
SELECT JSON_EXTRACT(@JSON, '$.userTBL[2].name') AS JSON_EXTRACT;

SELECT JSON_INSERT (@JSON, '$.userTBL[0].mDate', '2022-08-09') AS JSON_INSERT;
SELECT JSON_REPLACE (@JSON, '$.userTBL[0].name', '토마스') AS JSON_REPLACE;
SELECT JSON_REMOVE (@JSON, '$.userTBL[0]') AS JSON_REMOVE;
