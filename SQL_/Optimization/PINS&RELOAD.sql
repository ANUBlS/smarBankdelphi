select sum(pins) pins, sum(reloads) Reloads, 
sum(reloads)/(sum(pins)+sum(reloads))*100 
from v$libraryCache;

SELECT UNIQUE 
(1-(SUM(GETMISSES)/(SUM(GETS)+SUM(GETMISSES))))*100
FROM V$ROWCACHE;


