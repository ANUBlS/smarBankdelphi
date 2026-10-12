-- Start of DDL Script for View SMART.CLOSE_PROFITS_ACCS
-- Generated 21-Aug-2004 13:01:37 from SMART@SB

-- Drop the old instance of CLOSE_PROFITS_ACCS
DROP VIEW close_profits_accs
/

CREATE OR REPLACE VIEW close_profits_accs (
   id,
   acc_no,
   val_acc,
   val_name,
   f5501p,
   f5501v,
   ostat,
   pok_ostat,
   bal_cn1,
   filial )
AS
SELECT
  a.id
, a.acc_no
, a.val_acc
, v.val_name
, bp.f5501p
, bp.f5501v
, t.ostat
, t.pok_ostat
, a.BAL_CN1
, a.filial
FROM
  ACCOUNT partition (ActivAcc)  a
, Archost partition (ToDay) t
, BAL_SPR1 B
, avalute v
, bankproperties bp

WHERE
    a.id=t.acc_id
and t.ostat<>0
and a.BAL_CN1 = b.BAL_CN
and b.CloseBalance = 1
and a.Val_acc=v.valute
AND (bp.filialid=a.filial)
AND (bp.valute=a.val_acc)
/

-- Grants for View
GRANT SELECT ON close_profits_accs TO sbr_profitclosing
/

-- End of DDL Script for View SMART.CLOSE_PROFITS_ACCS

