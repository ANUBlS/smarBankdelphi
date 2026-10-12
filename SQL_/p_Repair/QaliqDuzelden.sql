select
  ac.id ,
  ac.acc_no as AccNumber,
  t.DatDate as "Date" ,
  av.val_name as Currency,
  ac.Bal_cn1 ,
  op.ostat as Rate,
  t.ostat as Rest,
  t.Pok_Ostat as RateInAzeri  ,
  Round((t.ostat*op.ostat),2) as OstatMultRate,
  Round((t.pok_ostat/op.ostat),2) as pokOstatDivRate
from
  account ac,
  operkurs op,
  archost t,
  avalute av
where 
  ac.id = t.acc_id and
  op.val_kod = av.valute and
  av.valute = ac.val_acc and 
  av.valute <> 0 and
  op.dat = t.datdate and
 -- t.Ostat = t.pok_ostat and
 -- t.pok_ostat<>0 and 
 ac.bal_cn1<>5015 and
  t.datdate > '20-may-2003' and
  (Round((t.ostat*op.ostat),2)<>t.pok_ostat)     
order by 
  "Date" ,
  accnumber ,
  currency
        
      
