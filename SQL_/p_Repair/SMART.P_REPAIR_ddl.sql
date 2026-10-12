-- Start of DDL Script for Package Body SMART.P_REPAIR
-- Generated 11-Aug-2003 12:32:01 from SMART@SB-CURRENT

CREATE OR REPLACE 
PACKAGE p_repair
 IS
 Type DynCursor is ref cursor;
 strsql varchar2(500);
 v_no_doc integer;
 rProvarch provarch%rowtype; 
 rTransaction provarch%rowtype;
	rDRate RateDifference%rowtype;
	function  GetRate(CurrencyID integer, ArchiveDate date)	return number;
 procedure TO_TABLE (UserTab IN varchar2,StrSql varchar2);
	procedure AddTempRepair(Bd Date);
	procedure dbms;
	procedure AddTransactions;
 Procedure DelProvarch;
 Procedure DelRest;
 Procedure DelTurnOver;
 Procedure AddProvarch;
 Procedure AddRest;
 Procedure AddTurnOver;
 Procedure AddTempRepairTrans;
 Procedure RateDif(NeedDate date, ID number);
 Procedure Profit(NeedDate date, vID number, result in out number); 
	Procedure updTemp(NeedDate date, ID number);
 procedure Main (Transaction sb_transaction.t_transaction, Flags Number);
	function  DebitAmount	return number;
	function  CreditAmount	return number;
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY p_repair IS
 CurrentDate date;

--------------------------------------------------------
procedure Main (Transaction sb_transaction.t_transaction, Flags Number) as
cProvarch DynCursor;
Type OpDate is table of date index by binary_integer;
Type chec is table of number index by binary_integer;
tDate OpDate;
str varchar(255);
DayCount number(15);
RecCount number(15);
Result Number;
i integer;
j integer;
ProfitID_D  integer;
ProfitID_C  integer;
ExpenseID_D integer;
ExpenseID_C integer;

cursor cDate is 
 select dat from operkurs where val_kod=rProvarch.val_acc 
  and dat>=rProvarch.dat and dat<=CurrentDate; 

Begin
execute immediate 'ALTER TRIGGER smart.inc_provarch disable';
execute immediate 'ALTER TRIGGER smart.bi_provarch_opid disable';


if flags=0 then -- for delete 
v_no_doc:=1;
select * into rProvarch from provarch where id=Transaction.id;
rTransaction:=rProvarch; 
dbms_output.put_line('Delete ');
if rProvarch.vid_op is not null then
 raise_application_error
	(-20031,
	'This Transaction are received 
 	 automatically and can not be removed !
      OperationType:=' ||to_char(rProvarch.vid_op) 
		);
end if;

Delete From TempRepairTrans;
insert into TempRepairTrans select * from provarch where 
 dat>rProvarch.dat and (vid_op=1)
 and 
 (    debt=rProvarch.debt 
 		or kredit=rProvarch.debt 
   or debt=rProvarch.kredit 
 		or kredit=rProvarch.kredit
 );

insert into TempRepairTrans select * from provarch where dat>=rProvarch.dat and vid_op=2
and
(    debt in (select debt from temprepairtrans where vid_op=1)
  or kredit in (select debt from temprepairtrans where vid_op=1)
  or debt in (select kredit from temprepairtrans where vid_op=1)
  or kredit in (select kredit from temprepairtrans where vid_op=1)
);
update tempRepairTrans set no_doc=0; 
insert into TempRepairTrans 
 select * from provarch where id=rProvarch.id or parentid=rProvarch.id;

Select debet, kredit into ExpenseID_D, ProfitID_D   
 from aValute where valute=rTransaction.val_acc; 
Select debet, kredit into ExpenseID_C, ProfitID_C 
 from aValute where valute=rTransaction.currencyid_c; 

Str:='select * from TempRepairTrans order by dat desc,vid_op desc';
open cProvarch for str; 
LOOP
 FETCH cProvarch INTO rProvarch;
 EXIT WHEN cProvarch%NOTFOUND;
  DelTurnOver;
  DelRest;
  DelProvarch;
END LOOP;
CLOSE cProvarch;
end if; -- end Delete

If flags=1 then
v_no_doc:=2;
dbms_output.put_line('Add after Delete');
Select count(*) into RecCount from TempRepairTrans;
If RecCount=0 then
 dbms_output.put_line('Only Add New Transaction');
End If;
 update TempRepairTrans set 
  debt=transaction.DebitID
 ,kredit=transaction.CreditID
 ,ammount=transaction.DebitAmount
 ,ammount_c=transaction.CreditAmount
 ,lammount=transaction.LAmount
 ,rate_d=transaction.DebitRate
 ,rate_c=transaction.CreditRate
 ,name=transaction.name
 ,vid_op=transaction.OperationType
 ,no_doc=v_no_doc
   where id=transaction.id;

Str:='select * from TempRepairTrans where no_doc=1 order by dat desc,vid_op desc';
open cProvarch for str; 
LOOP
 FETCH cProvarch INTO rProvarch;
 EXIT WHEN cProvarch%NOTFOUND;
  DelTurnOver;
  DelRest;
  DelProvarch;
END LOOP;
CLOSE cProvarch;
select * into rProvarch from TempRepairTrans where id=transaction.id;
AddTransactions;
dbms_output.put_line('End Add ');
end if;

-- Down is for all procedures ....
i:=0;
Open cDate; 
LOOP
 FETCH cDate INTO tDate(i);
 EXIT WHEN cDate%NOTFOUND;
	dbms_output.put_line('RateDifference ');
  if rTransaction.val_acc<>0 then 
	  RateDif(tDate(i), rTransaction.debt);
  end if;
  if rTransaction.currencyid_c<>0 then 
   RateDif(tDate(i), rTransaction.kredit);
  end if;
  i:=i+1;
End loop;
Close cDate;
DayCount:=i-1;

FOR i IN 0..DayCount LOOP
if i<>0 then -- Emeliyyat gunu mezenne fergi, olmur amma kelr zerer ola biler 
 str:='select * from TempRepairTrans where vid_op=1 and no_doc=1 and dat= ''' || to_char(tDate(i)) || '''';
 OPEN cProvarch for str; 
	LOOP
  FETCH cProvarch INTO rProvarch;
  EXIT WHEN cProvarch%NOTFOUND;
  AddTransactions;
 END LOOP;
CLOSE cProvarch;
end if;
dbms_output.put_line('Profit ');
if rTransaction.val_acc <>0 then
 Profit(tDate(i), ProfitID_D, result);
 if result=0 then 
  dbms_output.put_line('1 ');
  AddTransactions;
 end if;
  Profit(tDate(i), ExpenseID_D, result);
 if result=0 then 
  dbms_output.put_line('2 ');
  AddTransactions;
 end if;

else
 Profit(tDate(i), ProfitID_C, result);
 if result=0 then 
  dbms_output.put_line('3 ');
  AddTransactions;
 end if;

 Profit(tDate(i), ExpenseID_C, result);
 if result=0 then 
  dbms_output.put_line('4 ');
  AddTransactions;
 end if;

End if;

END LOOP;  
		
--rollback;
--raise_application_error(-20001,'Profit->Ostat=0');


execute immediate 'ALTER TRIGGER smart.inc_provarch ENABLE';
execute immediate 'ALTER TRIGGER smart.bi_provarch_opid ENABLE';

end;
-----------------------------------------------------
Procedure AddProvarch is
begin
insert into provarch 
(
  id
, op_id
, no_prov
, dat
, debt
, kredit
, val_acc
, vid_op
, ammount
, lammount
, tim
, shifr
, no_pack
, kassa_b
, kassa_z
, no_filial
, sloj_prov
, bank_d
, bank_k
, no_doc
, no_mem
, d1
, k1
, rate_d
, rate_c
, parentid
, currencyid_c
, ammount_c
, name)
values
(
  rProvarch.id
, rProvarch.op_id
, rProvarch.no_prov
, rProvarch.dat
, rProvarch.debt
, rProvarch.kredit
, rProvarch.val_acc
, rProvarch.vid_op
, rProvarch.ammount
, rProvarch.lammount
, rProvarch.tim
, rProvarch.shifr
, rProvarch.no_pack
, rProvarch.kassa_b
, rProvarch.kassa_z
, rProvarch.no_filial
, rProvarch.sloj_prov
, rProvarch.bank_d
, rProvarch.bank_k
, rProvarch.no_doc
, rProvarch.no_mem
, rProvarch.d1
, rProvarch.k1
, rProvarch.rate_d
, rProvarch.rate_c
, rProvarch.parentid
, rProvarch.currencyid_c
, rProvarch.ammount_c
, rProvarch.name
);
end;
------------------------------------
Procedure AddTurnover is
begin
-- dbms_output.put_line('AddTornover');
-- Update debit account's balance 
update archost set
	obr_d = obr_d + DebitAmount, 
	pok_obr_d =	pok_obr_d + rProvarch.lammount 
		where
			(acc_id = rProvarch.debt)
			and (datdate = rProvarch.dat);  
-- Update credit account's balance 
		update archost set
			obr_k = obr_k + CreditAmount, 
			pok_obr_k = pok_obr_k + rProvarch.lammount 
		where
			(acc_id = rProvarch.kredit)
			and (datdate = rProvarch.dat);
end;
------------------------------------
Procedure AddRest is
begin
-- dbms_output.put_line('AddRest ');
-- Update debit account's balance */
update archost set
	ostat = ostat - DebitAmount, 
	pok_ostat =	pok_ostat - rProvarch.lammount 
		where
			(acc_id = rProvarch.debt)
			and (datdate >= rProvarch.dat);  
-- Update credit account's balance 
		update archost set
			ostat = ostat + CreditAmount, 
			pok_ostat = pok_ostat + rProvarch.lammount
		where
			(acc_id = rProvarch.kredit)
			and (datdate >= rProvarch.dat);
end;
------------------------------------
Procedure DelProvarch is
begin
 -- dbms_output.put_line('Transaction Id='||to_char(rprovarch.id)||' will be deleletet');
 delete from Provarch where id=rProvarch.id; 
end;
------------------------------------
Procedure DelRest	is
begin
-- dbms_output.put_line('DelRest ');
-- Update debit account's balance */
update archost set
	 ostat = ostat + DebitAmount
	,pok_ostat =	pok_ostat + rProvarch.lammount 
		where
			(acc_id = rProvarch.debt)	and (datdate >= rProvarch.dat);  
-- Update credit account's balance 
		update archost set
			 ostat = ostat - CreditAmount 
			,pok_ostat = pok_ostat - rProvarch.lammount
		where
			(acc_id = rProvarch.kredit)
			and (datdate >= rProvarch.dat);
end;
------------------------------------	
Procedure DelTurnOver is
begin
update archost set
	 obr_d = obr_d - DebitAmount()
	,pok_obr_d =	pok_obr_d - rProvarch.lammount 
		where
			(acc_id = rProvarch.debt)
			and (datdate = rProvarch.dat);  
-- Update credit account's balance 
		update archost set
			 obr_k = obr_k - CreditAmount() 
			,pok_obr_k = pok_obr_k - rProvarch.lammount 
		where
			(acc_id = rProvarch.kredit)
			and (datdate = rProvarch.dat);
end;
-------------------------------------
	Function CreditAmount	return number	is
	Result number:=1;
	begin
		if (rProvarch.currencyid_c <> 0) or (rProvarch.val_acc = 0) then
			Result := rProvarch.ammount_c;
		else
			Result :=rProvarch.Lammount;
--				rProvarch.ammount  
--		  *	GetRate(rProvarch.val_acc, rProvarch.dat)
--				/ GetRate(rProvarch.currencyid_c, rProvarch.dat);
		end if;
		return Result;
	end;
------------------------------------------------
	Function DebitAmount	return number is
		Result number:=1;
	begin
		if (rProvarch.val_acc <> 0) or (rProvarch.currencyid_c = 0) then
			Result := rProvarch.ammount;
		else
			Result :=rProvarch.Lammount;
--				rProvarch.ammount_c 
--    *	GetRate(rProvarch.currencyid_c, rProvarch.dat)  
--			 / GetRate(rProvarch.val_acc, rProvarch.dat);
		end if;
		return Result;
	end;
----------------------------------------------------------------
Procedure RateDif	(NeedDate date, ID number) is
PrevDate date;
Cursor cDRate (BDate date, EDate date, c_ID number) is 
SELECT
  a.id,
 	v.valute,
  v.debet,
  v.kredit,
  t.ostat ,
  t.pok_ostat,
		o.ostat Rate,
  o.ostat - o2.ostat DeltaRate,
  Abs(t.ostat * (o.ostat - o2.ostat)) sum_transaction
--  Abs(t.ostat * o.ostat - t.pok_ostat) sum_transaction
FROM
  ACCOUNT a
 ,archost t
 ,bal_spr1 b
	,operkurs o
 ,operkurs o2
 ,avalute v
WHERE
  (a.val_acc <> 0)
	 AND (t.datdate = EDate)
  AND (t.acc_id = a.id)
  AND (t.ostat <> 0)
  AND (a.bal_cn1 = b.bal_cn)
  AND (b.RateDifference = 1)
  AND (a.close_dat IS NULL)
  AND (a.val_acc = v.valute)
  AND (o.val_kod = a.val_acc)
  AND (o.val_kod = o2.val_kod)
  AND (o.ostat <> o2.ostat)
  AND (o.dat  = BDate)
  AND (o2.dat = EDate)
  AND (a.id=c_Id)
 		order by a.id;
 RateData cDRate%rowtype;
 v_id number(10);
Begin

select max(dat) into PrevDate from operkurs where dat < NeedDate;
open cDRate(NeedDate, PrevDate, ID); 
LOOP
 FETCH cDRate INTO RateData;
 EXIT WHEN cDRate%NOTFOUND;
  if ((RateData.ostat > 0) and (RateData.DeltaRate < 0))
  or ((RateData.ostat < 0) and (RateData.DeltaRate > 0)) then
   rProvarch.debt:=RateData.ID;
   rProvarch.kredit:=RateData.Kredit;
 elsif (RateData.ostat < 0) and (RateData.DeltaRate < 0)
  or (RateData.ostat > 0) and (RateData.DeltaRate > 0) then
   rProvarch.debt:=RateData.Debet;
   rProvarch.kredit:=RateData.ID;
 end if;

	select VAL_ACC	into rProvarch.val_acc from ACCOUNT	where ID = rProvarch.debt;
	select VAL_ACC	into rProvarch.currencyid_c from ACCOUNT	where ID = rProvarch.kredit	;

	if rProvarch.val_acc = 0 then
		rProvarch.ammount:=RateData.sum_transaction;
			else
  rProvarch.ammount:=0;
	end if;
	if rProvarch.currencyid_c = 0 then
  rProvarch.ammount_c:=RateData.sum_transaction;
	else
  rProvarch.ammount_c:=0;
	end if;

begin 
 Select id into rProvarch.id from TempRepairTrans 
	 where dat=NeedDate and debt=rProvarch.debt 
		 and kredit=rProvarch.kredit and no_doc=v_no_doc;
 Exception When no_data_found Then
   select tr_seg_PROVARCH.nextval into rProvarch.id from dual;
end;
 rProvarch.dat:=NeedDate;
 rProvarch.lammount:=RateData.sum_transaction;				
 rProvarch.rate_d:=GetRate(rProvarch.val_acc,rProvarch.dat);
	rProvarch.rate_c:=GetRate(rProvarch.currencyid_c,rProvarch.dat);
	rProvarch.vid_op:=1; -- 'ћ€з€нн€ ф€рги'	  
 rProvarch.tim:=rTransaction.tim;
 rProvarch.no_filial:=rTransaction.no_filial;
 rProvarch.no_doc:=v_no_doc;
 rProvarch.parentid:=null;
 rProvarch.name:='ћ€з€нн€ ф€рги';

if RateData.DeltaRate <>0 then 
 addTempRepairTrans;
end if;

END LOOP;
CLOSE cDRate;



--For RateData in cDRate(NeedDate, ID)
--loop 
/*
 if ((RateData.ostat > 0) and (RateData.DeltaRate < 0))
  or ((RateData.ostat < 0) and (RateData.DeltaRate > 0)) then
   rProvarch.debt:=RateData.ID;
   rProvarch.kredit:=RateData.Kredit;
 elsif (RateData.ostat < 0) and (RateData.DeltaRate < 0)
  or (RateData.ostat > 0) and (RateData.DeltaRate > 0) then
   rProvarch.debt:=RateData.Debet;
   rProvarch.kredit:=RateData.ID;
 end if;

	if rProvarch.val_acc = 0 then
		rProvarch.ammount:=RateData.sum_transaction;
			else
  rProvarch.ammount:=0;
	end if;
	if rProvarch.currencyid_c = 0 then
  rProvarch.ammount_c:=RateData.sum_transaction;
	else
  rProvarch.ammount_c:=0;
	end if;
 rProvarch.lammount:=RateData.sum_transaction;				
*/
--end loop;
	

end;
-----------------------------------------------
Procedure updTemp(NeedDate date, ID number)	is
PrevDate date;
Cursor cDRate (BDate date, EDate date, c_ID number) is 
SELECT
  a.id,
 	v.valute,
  v.debet,
  v.kredit,
  t.ostat,
  o.ostat- o2.ostat DeltaRate,
  Abs(t.ostat * o.ostat - t.pok_ostat) sum_transaction
FROM
  ACCOUNT a
 ,archost t
 ,bal_spr1 b
	,operkurs o
 ,operkurs o2
 ,avalute v
WHERE
  (a.val_acc <> 0)
	 AND (t.datdate = EDate)
  AND (t.acc_id = a.id)
  AND (t.ostat <> 0)
  AND (a.bal_cn1 = b.bal_cn)
  AND (b.RateDifference = 1)
  AND (a.close_dat IS NULL)
  AND (a.val_acc = v.valute)
  AND (o.val_kod = a.val_acc)
  AND (o.val_kod = o2.val_kod)
  AND (o.ostat <> o2.ostat)
  AND (o.dat  = BDate)
  AND (o2.dat = EDate)
  AND (a.id=c_Id)
 		order by a.id;
 RateData cDRate%rowtype;
Begin
select max(dat) into PrevDate  from operkurs where dat < NeedDate;
open cDRate(NeedDate, PrevDate,ID); 
LOOP
 FETCH cDRate INTO RateData;
 EXIT WHEN cDRate%NOTFOUND;
  if ((RateData.ostat > 0) and (RateData.DeltaRate < 0))
  or ((RateData.ostat < 0) and (RateData.DeltaRate > 0)) then
   update TempRepairTrans set 
			 debt=RateData.ID, 
			 kredit=RateData.Kredit 
				 where id=rProvarch.id;
 elsif (RateData.ostat < 0) and (RateData.DeltaRate < 0)
  or (RateData.ostat > 0) and (RateData.DeltaRate > 0) then
   update TempRepairTrans set 
			 debt=RateData.Debet, kredit = RateData.ID 
				 where id=rProvarch.id;
 end if;

	if rProvarch.val_acc = 0 then
  update TempRepairTrans set 
		 ammount=RateData.sum_transaction 
			 where id=rProvarch.id;
			else
  update TempRepairTrans set ammount=0 where id=rProvarch.id;
	end if;

	if rProvarch.currencyid_c = 0 then
  update TempRepairTrans set 
		 ammount_c = RateData.sum_transaction 
			 where id=rProvarch.id;
	else
  update TempRepairTrans set 
		 ammount_c = 0 
			 where id=rProvarch.id;
	end if;

 update TempRepairTrans set 
	 Lammount = RateData.sum_transaction 
		 where id=rProvarch.id;

END LOOP;
CLOSE cDRate;
	
end;
----------------------------------------------
procedure dbms is 
Begin
dbms_output.put_line(' ');
dbms_output.put_line('id '           ||to_Char(rProvarch.id));
dbms_output.put_line('op_id '        ||to_Char(rProvarch.op_id));
--dbms_output.put_line('no_prov '      ||rProvarch.no_prov);
dbms_output.put_line('dat '         ||to_Char(rProvarch.dat));
dbms_output.put_line('debt '         ||to_Char(rProvarch.debt));
dbms_output.put_line('kredit '       ||to_Char(rProvarch.kredit));
dbms_output.put_line('val_acc '      ||to_Char(rProvarch.val_acc));
dbms_output.put_line('vid_op '       ||to_Char(rProvarch.vid_op));
dbms_output.put_line('ammount '      ||to_Char(rProvarch.ammount));
dbms_output.put_line('lammount '     ||to_Char(rProvarch.lammount));
--dbms_output.put_line('tim '          ||to_Char(rProvarch.tim));
--dbms_output.put_line('shifr '        ||to_Char(rProvarch.shifr));
--dbms_output.put_line('no_pack '      ||to_Char(rProvarch.no_pack));
--dbms_output.put_line('kassa_b'       ||to_Char(rProvarch.kassa_b));
--dbms_output.put_line('kassa_b'       ||to_Char(rProvarch.kassa_z));
--dbms_output.put_line('no_filial '    ||to_Char(rProvarch.no_filial));
--dbms_output.put_line('sloj_prov '    ||to_Char(rProvarch.sloj_prov));
--dbms_output.put_line('bank_d '       ||to_Char(rProvarch.bank_d));
--dbms_output.put_line('bank_d '       ||to_Char(rProvarch.bank_k));
--dbms_output.put_line('no_doc '       ||to_Char(rProvarch.no_doc));
--dbms_output.put_line('no_mem '       ||to_Char(rProvarch.no_mem));
--dbms_output.put_line('d1 '           ||rProvarch.d1);
--dbms_output.put_line('k1 '           ||rProvarch.k1);
dbms_output.put_line('rate_d '       ||to_Char(rProvarch.rate_d));
dbms_output.put_line('rate_c '       ||to_Char(rProvarch.rate_c));
dbms_output.put_line('ParentId'      ||to_Char(rProvarch.parentid));
dbms_output.put_line('CurrencyId_c ' ||to_Char(rProvarch.currencyid_c));
dbms_output.put_line('Ammount_c '    ||to_Char(rProvarch.ammount_c));
dbms_output.put_line('Name '         ||rProvarch.Name);
dbms_output.put_line(' ');
end;
------------------------------------------
	function GetRate(CurrencyID integer, ArchiveDate date) return number	is
		Result number;
	begin
		select OSTAT into Result from OPERKURS
		where 
			(VAL_KOD = CurrencyID) and 
			(DAT = (select Max(DAT) from operkurs where DAT <= ArchiveDate));
		return Result;
	exception
		when NO_DATA_FOUND then
			raise_application_error(
				sbdecls.Error_NoRateForDateSpecified, 
				'Rate for specified date not found. CurrencyID='||TO_CHAR(CurrencyID)||', Date='||TO_CHAR(ArchiveDate));
	end;
------------------------------------------
PROCEDURE TO_TABLE (  
 UserTab IN varchar2
,StrSql varchar2)
is
 vCount Integer;
BEGIN
	select count(*) into vCount from sys.all_tables
	 where (owner = User) and (TABLE_NAME = Upper(UserTab));
if vCount<>0 then
 EXECUTE IMMEDIATE 'drop table ' || UPPER(UserTab);
 commit;
end if;
EXECUTE IMMEDIATE 'Create Table '|| UserTab ||' as '|| StrSql;
commit;
END;
------------------------------------------
Procedure AddTempRepair(bd date) is
 Cursor cDate(bd date) is 
	 select distinct dat from operkurs 
		 where dat>bd and dat<=SBOP.get_date;
 NDate date;
 v_id number;
begin
open cDate(Bd); 
LOOP
 FETCH cDate INTO NDate;
 EXIT WHEN cDate%NOTFOUND;
 select tr_seg_PROVARCH.nextval into v_id from dual;
  insert into tempRepairTrans
 	 (id,dat,vid_op,no_doc,name)
 		values(v_id,NDate,2,1,'ћ€з€нн€ ф€рги');
END LOOP;
CLOSE cDate;
end;
-----------------------------------------
Procedure Profit(NeedDate date, vId number, Result in out  number) as
PrevDate date;
v_row Close_Profits_Accs%rowtype;
Cursor c_ReMainder (BDate date, v_ID number) is 
SELECT
  a.id
, a.acc_no
, a.val_acc
, v.val_name
, v.f5501p
, v.f5501v
, t.ostat
, t.pok_ostat
, a.BAL_CN1
FROM
  ACCOUNT a
, ArchOst t
, BAL_SPR1 B
, avalute v
WHERE
    a.id=t.acc_id
and t.ostat<>0
and a.BAL_CN1 = b.BAL_CN
and b.CloseBalance = 1
and a.close_dat is Null
and a.Val_acc=v.valute
and t.datdate=BDate
--and a.id=v_Id
;

Begin
Result:=1;
open c_ReMainder(NeedDate, vID); 
LOOP
 FETCH c_ReMainder INTO v_row;
 EXIT WHEN c_ReMainder%NOTFOUND;
result:=0;

begin 
Select * into rProvarch from TempRepairTrans 
	 where dat=NeedDate and vid_op=2 and no_doc=v_no_doc
			and debt=rProvarch.debt and kredit=rProvarch.kredit;
 Exception 
	When no_data_found Then
   select tr_seg_PROVARCH.nextval into rProvarch.id from dual;
   rProvarch.dat:=NeedDate;
   rProvarch.name:='Gelir zererin baglanmasi';
   rProvarch.rate_d:=0;
   rProvarch.rate_c:=0;
   rProvarch.vid_op:=2; --'Galir zararin baglanmasi'
   rProvarch.no_doc:=v_no_doc;
   rProvarch.tim:=rTransaction.tim;
   rProvarch.no_filial:=rTransaction.no_filial;
   rProvarch.val_acc:=v_row.val_acc;
   rProvarch.currencyid_c:=v_row.val_acc;
	When TOO_MANY_ROWS Then
 dbms_output.put_line('TOO_MANY_ROWS in p_repair.Profit'); 
end;
 If v_row.Ostat>0 then
   rProvarch.debt:=v_row.ID;
   rProvarch.kredit:=v_row.f5501p;
   rProvarch.ammount:=v_row.ostat;
   rProvarch.ammount_c:=v_row.ostat;
   rProvarch.lammount:=v_row.pok_ostat;
-- dbms_output.put_line('sum1='||To_char(rProvarch.ammount_c));
 ElsIf v_row.Ostat<0 Then	
   rProvarch.debt:=v_row.f5501v;
   rProvarch.kredit:=v_row.id;
   rProvarch.ammount:=-v_row.ostat;
   rProvarch.ammount_c:=-v_row.ostat;
   rProvarch.lammount:=-v_row.pok_ostat;
-- dbms_output.put_line('sum2='||To_char(rProvarch.ammount_c));
 else 
  rollback;
  raise_application_error(-20031,'Profit->Ostat=0');
 End if;
rProvarch.no_doc:=v_no_doc;
AddTempRepairTrans;

End loop;
Close c_ReMainder;
End;
-----------------------------------------
Procedure AddTempRepairTrans is
begin
-- dbms_output.put_line('AddProvarch');
insert into TempRepairTrans 
(
  id
, op_id
, no_prov
, dat
, debt
, kredit
, val_acc
, vid_op
, ammount
, lammount
, tim
, shifr
, no_pack
, kassa_b
, kassa_z
, no_filial
, sloj_prov
, bank_d
, bank_k
, no_doc
, no_mem
, d1
, k1
, rate_d
, rate_c
, parentid
, currencyid_c
, ammount_c
, name)
values
(
  rProvarch.id
, rProvarch.op_id
, rProvarch.no_prov
, rProvarch.dat
, rProvarch.debt
, rProvarch.kredit
, rProvarch.val_acc
, rProvarch.vid_op
, rProvarch.ammount
, rProvarch.lammount
, rProvarch.tim
, rProvarch.shifr
, rProvarch.no_pack
, rProvarch.kassa_b
, rProvarch.kassa_z
, rProvarch.no_filial
, rProvarch.sloj_prov
, rProvarch.bank_d
, rProvarch.bank_k
, rProvarch.no_doc
, rProvarch.no_mem
, rProvarch.d1
, rProvarch.k1
, rProvarch.rate_d
, rProvarch.rate_c
, rProvarch.parentid
, rProvarch.currencyid_c
, rProvarch.ammount_c
, rProvarch.name
);
end;
----------------------------------
Procedure AddTransactions as
begin
 AddTurnOver;
 AddRest;
 AddProvarch;
end;
-----------------------------------
Begin
 CurrentDate:=SBOP.get_date;
END;
/


-- End of DDL Script for Package Body SMART.P_REPAIR

