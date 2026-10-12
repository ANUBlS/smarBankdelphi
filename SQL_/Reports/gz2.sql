--select * from a2;
select aa.q1, ss.q2 --, sum(aa.q4), sum(ss.q4)
--, aa.q3, ss.q3  
from a2 aa, a2 ss
where aa.q1 = ss.q2
and aa.q1<>0
and ss.q2<>0
--group by aa.q1,ss.q2
