drop table d1
/
Create table d1 as 
select ID,OpenDate,s.STOPCALCULATIONDATE ,
TO_NUMBER(TO_CHAR(c.OpenDate,'DD')) - TO_NUMBER(TO_CHAR(s.STOPCALCULATIONDATE,'DD')) as X
from sbcm_contracts c, sbcm_contract_state s where c.id=s.ID# and (c.type#=3) and (c.contracttype in ( SELECT id
  FROM sbcm_deposit_types
  where dateinterval=30)) and c.openDate between '01-mar-2005' and '31-jul-2005'
  and TO_CHAR(c.OpenDate,'DD')<>TO_CHAR(s.STOPCALCULATIONDATE,'DD')
order by opendate 
/
update sbcm_contract_state s 
   set s.stopcalculationdate=s.stopcalculationdate + (select x from d1 d where d.id=s.id#)
where id# in (select id from d1)   
/
commit
/ 
