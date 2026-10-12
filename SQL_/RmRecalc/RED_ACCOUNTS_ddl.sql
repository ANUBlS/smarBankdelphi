-- Start of DDL Script for View SMART.RED_ACCOUNTS
-- Generated 5-Apr-2004 19:29:44 from SMART@SBLAST

CREATE OR REPLACE VIEW red_accounts (
   id,
   acc_no,
   name,
   val_acc,
   bal_cn1,
   open_dat,
   ostat )
AS
select a.ID,a.Acc_No,a.Name,a.Val_Acc,a.Bal_CN1,a.Open_Dat,ar.Ostat
from Account a, ArchOst ar, Bal_SPR1 b
where ar.DatDate=(select Tek_Dat from SysDat)
 and a.ID=ar.Acc_ID
 and ar.Ostat>0
 and a.Bal_CN1=b.Bal_CN
 and b.TypeID=1
union
select a.ID,a.Acc_No,a.Name,a.Val_Acc,a.Bal_CN1,a.Open_Dat,ar.Ostat
from Account a, ArchOst ar, Bal_SPR1 b
where ar.DatDate=(select Tek_Dat from SysDat)
 and a.ID=ar.Acc_ID
 and ar.Ostat<0
 and a.Bal_CN1=b.Bal_CN
 and b.TypeID=2
/


-- End of DDL Script for View SMART.RED_ACCOUNTS

