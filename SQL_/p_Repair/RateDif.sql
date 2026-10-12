SELECT
  a.id,
 	v.valute,
  v.debet,
  v.kredit,
  t.ostat,
  t.pok_ostat,
  o.ostat RateNextDay, 
  o2.ostat RateCurDay, 
  o.ostat- o2.ostat Delta,
  Abs(t.ostat * o.ostat - t.pok_ostat)
   Amount
FROM
  ACCOUNT a
 ,archost t
 ,bal_spr1 b
	,operkurs o
 ,operkurs o2
 ,avalute v
WHERE
  (a.val_acc <> 0)
	 AND (t.datdate = '16-jun-03')
  AND (t.acc_id = a.id)
  AND (t.ostat <> 0)
  AND (a.bal_cn1 = b.bal_cn)
  AND (b.RateDifference = 1)
  AND (a.close_dat IS NULL)
  AND (a.val_acc = v.valute)
  AND (o.val_kod = a.val_acc)
  AND (o.val_kod = o2.val_kod)
  AND (o.ostat <> o2.ostat)
  AND (o.dat  = '20-jun-03')
  AND (o2.dat = '19-jun-03')
  AND (v.valute=1)
--  AND (a.id=2251  or a.id=4546)
		order by id;
