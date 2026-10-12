-- Start of DDL Script for View SMART.V_GZ1
-- Generated 17-Apr-2004 1:22:14 from SMART@SB

CREATE OR REPLACE VIEW v_gz1 (
   dat,
   balance,
   s1,
   s2,
   dif,
   id )
AS
select 
  g1.dat
, g1.c_bal Balance
, g1.s1 s1 
-- ,g2.d_bal, 
, g2.s1 s2
, g1.s1-decode(g2.s1, null, 0,g2.s1) dif 
, to_char(g1.c_bal)||'_'||to_char(g1.dat,'dd/mm/yy') id
from
(
select dat, c_bal, sum(lamount) s1 from v_provarch1 where d_bal<>5501 and c_bal>=6000 and c_bal<8000 group by dat,c_bal 
) g1
,
(
select dat, d_bal, sum(lamount) s1 from v_provarch1 where c_bal<>5501 and d_bal>=6000 and d_bal<8000 group by dat,d_bal 
) g2

where g1.dat=g2.dat (+) and g1.c_bal =g2.d_bal (+)

union

select 
  g1.dat
, g1.d_bal 
, g1.s1 s1
--, g2.c_bal
, g2.s1 s2
, g1.s1-decode(g2.s1, null, 0,g2.s1) dif 
, to_char(g1.d_bal)||'_'||to_char(g1.dat,'dd/mm/yy') id
from
(
select dat,d_bal, sum(lamount) s1 from v_provarch1 where c_bal<>5501 and d_bal>=8000 group by dat, d_bal 
) g1
,
(
select dat,c_bal, sum(lamount) s1 from v_provarch1 where d_bal<>5501 and c_bal>=8000 group by dat, c_bal 
) g2
where g1.dat=g2.dat (+) and g1.d_bal =g2.c_bal (+)
/


-- End of DDL Script for View SMART.V_GZ1

