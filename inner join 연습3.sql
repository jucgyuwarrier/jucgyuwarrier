USE sqldb;
SELECT S.stdName, S.addr, C.clubName, C.roomNo FROM stdtbl S
INNER JOIN stdclubtbl sc ON S.stdName = SC.stdName
INNER JOIN clubtbl C ON SC.clubName = C.clubName
ORDER BY S.stdName;

SELECT C.clubName, C.roomNo, S.stdName, S.addr
FROM stdtbl S 
INNER JOIN stdclubtbl SC ON SC.stdName = S.stdName
INNER JOIN clubtbl C ON SC.clubName = C.clubName
ORDER BY C.clubName;