CREATE OR REPLACE VIEW ratedifference (
   id,
   acccurrencyid,
   currencyid,
   debet,
   kredit,
   o1,
   o2,
   ostat,
   pok_ostat,
   deltarate,
   ident_transaction,
   sum_transaction,
   filial )
AS
SELECT
   a.id as id 
 , a.val_acc as ACCCURRENCYID
 , v.valute as CURRENCYID
 , bp.debet as DEBET
 , bp.kredit as KREDIT
 , o.ostat as o1
 , o2.ostat as o2
 , t.ostat as Ostat
 ,t.pok_ostat as Pok_Ostat
 , o.ostat - o2.ostat as deltarate
 , abs(t.ostat * o.ostat) - abs(t.pok_ostat) as ident_transaction
 , Abs(t.ostat * o.ostat - t.pok_ostat) as sum_transaction
 , a.filial As Filial 
-- , Round(Abs(t.ostat * o.ostat - t.pok_ostat),2) as x
FROM
  ACCOUNT partition (ActivAcc)  a,
  Archost partition (YesterDay) t,
  bal_spr1 b,
  operkurs partition (ToDay) o,
  operkurs partition (YesterDay) o2,
  avalute v,
  sysdat s
 , bankproperties bp
WHERE
  (a.val_acc <> 0)
-- 	and (t.datdate = (select pred_dat from sysdat))
  AND (t.acc_id = a.id)
  AND (a.bal_cn1 = b.bal_cn)
  AND (b.RateDifference = 1)
--  AND (a.close_dat IS NULL)
  AND (a.val_acc = v.valute)
  AND (o.val_kod = a.val_acc)
  AND (o.val_kod = o2.val_kod)
  AND (t.ostat <>0)
  AND (o.ostat - o2.ostat<>0) 
  AND (bp.filialid=a.filial)
  AND (bp.valute=a.val_acc)
  AND (Round(Abs(t.ostat * o.ostat - t.pok_ostat),2)) > 0
/
