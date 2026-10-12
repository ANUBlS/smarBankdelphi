select 
substr(name,1,20) Latch
, sum(gets)
, sum(misses)
, sum(immediate_gets)
, sum(immediate_misses)
from v$latch where name like 'redo%'
group by name


