select * from
(
select q1, sum(q4) from a2 where q1>0 and q1<3 group by q1 
) aa
,
(
select q2, sum(q4) from a2 where q2>0 and q2<3 group by q2 
) ss
where aa.q1=ss.q2

