INSERT INTO membertbl VALUES ('djm', '몽짜몽', '일본')
ON DUPLICATE KEY UPDATE username='몽짜동', addr='중국';

SELECT * FROM membertbl;