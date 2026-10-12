-- Start of DDL Script for View SMART.INC_EXPENSES
-- Generated 20-Apr-2005 11:04:45 from SMART@SB-HESEN

CREATE OR REPLACE VIEW inc_expenses (
   dat,
   filial,
   bal_cn1,
   balname,
   rest )
AS
(
select p.dat,a.filial, a.bal_cn1, b.balName, sum(lammount) as rest 
 from provarch p, Account_Inc a, bal_SPR1 b
 where(p.kredit = a.ID)
  and (p.debt in (select ID from Account_Inc where bal_cn1 <> 5501))
  and (a.bal_cn1 between 6000 and 9999)
  and (b.bal_cn=a.Bal_cn1)
 group by p.dat, a.filial, a.bal_cn1, b.BalName
union all
select p.dat, a.filial, a.bal_cn1, b.balName, sum(lammount) as rest 
 from provarch p, Account_Inc a, bal_SPR1 b
 where(p.debt = a.ID)
  and (p.kredit in (select ID from Account_Inc where bal_cn1 <> 5501))
  and (a.bal_cn1 between 6000 and 9999)
  and (b.bal_cn=a.Bal_cn1)
 group by p.dat, a.filial, a.bal_cn1, b.BalName)
/


-- End of DDL Script for View SMART.INC_EXPENSES


