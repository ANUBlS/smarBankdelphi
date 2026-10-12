-- Start of DDL Script for Package Body SMART.P_CORRECT
-- Generated 27-Aug-2004 23:42:16 from SMART@SB

-- Drop the old instance of P_CORRECT
DROP PACKAGE p_correct
/

CREATE OR REPLACE 
PACKAGE p_correct IS
 Type DynCursor is ref cursor;
 GbFlag Number;
 GbCorMod Number;
 ProfitID_D number;
 ExpenseID_D number;
 ProfitID_C number;
 ExpenseID_C number;
 ConvProfitID_D number;
 ConvExpenseID_D number;
 ConvProfitID_C number;
 ConvExpenseID_C number;
 strsql varchar2(500);
 sql_error varchar2(150);
 v_no_doc integer;
 v_Filial number;
 rProvarch provarch%rowtype; 
 rTransaction provarch%rowtype;
 rChild provarch%rowtype;
	rDRate RateDifference%rowtype;
	function  GetRate(CurrencyID integer, ArchiveDate date)	return number;
	procedure Prepare;
 procedure DataPrepare;
	procedure DelCursor(str varchar2);
	procedure dbms;
	Function  AddTransactions(flag number) return number;
 Procedure DelProvarch;
 Procedure DelRest;
 Procedure DelTurnOver;
 Function  AddProvarch(flag Number) return number;
 Procedure AddRest;
 Procedure AddTurnOver;
 Procedure AddTempRepairTrans;
 Procedure RateDif(NeedDate date, ID number);
 Procedure Profit(NeedDate date, Result in out  number);
	Procedure LazyRestDel;
	Procedure LazyRestAdd;
 Procedure Child;
	function  DebitAmount	return number;
	function  CreditAmount	return number;
-- Function Main1 (Flag integer, Transaction provarch%rowtype);

Function Main (
  Flag integer,
		CorMode integer,
		TransactionID			  integer,
		TransactionDate   date default null,
  DebitID           integer default null,
  CreditID          integer default null,
  DebitAmount       number default null,
 	CreditAmount      number default null,
  LAmount           number default null,
  DebitRate         number default null,
  CreditRate        number default null, -- rates should be retreived from system dataset
  TrName            varchar default null,
		InBalanceChar			  integer default null,
		OutBalanceChar		  integer default null,
		OperationType			  integer default null,
		ParentID					     integer default null,
		TempID						      integer default null

) return integer;

END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY p_correct IS
 CurrentDate date;
/*
 if rProvarch.vid_op is not null thenf
  raise_application_error
	  (-20031,
	  'This Transaction are received 
 	   automatically and can not be removed !
      OperationType:=' ||to_char(rProvarch.vid_op) 
		 );
 end if;
*/
--------------------------------------------------------
Function Main (Flags Number,CorMode Number, Transaction provarch%rowtype) return integer as
-- Flags   : 0 - delete 1 - Add 2 - Update  
-- CorMode : 0 - calculate Profit 1 - ignore 2 - ignore rate and profit 
 cProvarch DynCursor;
 Type OpDate is table of date index by binary_integer;
 Type chec is table of number index by binary_integer;
 tDate OpDate;
 str varchar(255);
 DayCount number(15);
 DRecCount number(4);
 CRecCount number(4);
 User$ varchar(32);
 Result Number;
 i integer;
 j integer;
 DeltaRate number;
 DebitDeltaRate number;
 CreditDeltaRate number;
 TempProvT provarch%rowtype;
 cursor cDate is 
  select dat from operkurs where val_kod=rProvarch.val_acc 
   and dat>=rProvarch.dat and dat<=CurrentDate; 
Begin
--execute immediate 'ALTER TRIGGER smart.inc_provarch disable';
--execute immediate 'ALTER TRIGGER smart.bi_provarch_opid disable';
execute immediate 'ALTER TRIGGER smart.UPD_SET_OF_LASTOPDAY disable';
GbFlag :=Flags;
GbcorMod:=CorMode;
dbms_output.put_line('Repair ' || to_char(Transaction.Dat));
select user into user$ from dual;
if user$<>'SMART' then 
	raise_application_error(-20032,' You  do not have permission to this operation ! ');
end if;

-- Check existent Account on -->>
if flags = 0 then
select * into rProvarch from provarch where id=Transaction.id; 

select count(*) into DRecCount from archost 
 where acc_id=rProvarch.Debt and datdate=rProvarch.Dat;
select count(*) into CRecCount from archost 
 where acc_id=rProvarch.Kredit and datdate=rProvarch.Dat;

else
 begin
  select count(*) into DRecCount from archost 
   where acc_id=Transaction.Debt and datdate=Transaction.Dat;
  select count(*) into CRecCount from archost 
   where acc_id=Transaction.Kredit and datdate=Transaction.Dat;
 end;
end if;
if DRecCount=0 or CRecCount=0 then
	raise_application_error(-20085,	'Debit or Credit Account not Exist on Wishful Date');
end if;
-- <<---Check existent Account on  

 
If flags=0 or flags=2 then -- for delete 
 dbms_output.put_line('Delete ');
 select * into rProvarch from provarch where id=Transaction.id; 
 		if rProvarch.ParentID is not null then
			raise_application_error(sbdecls.Error_ChildTransaction, 
				'Unable to delete child transaction - delete parent first. ChildID: '
					||TO_CHAR(rProvarch.id)	||', ParentID: '	||TO_CHAR(rProvarch.ParentID));
		end if;
-- if rProvarch.Dat=CurrentDate then 
-- 	raise_application_error(-20033,' You owe, execute this task in the other place ! ');
-- end if;

 LazyRestDel;
 rTransaction:=rProvarch; 
 Child;   -- Fill Recotrd with Child Transaction 
 Prepare; -- Mesenne fergi ve gelir zerer emeliyyatlarinin yigilmasi 
 insert into TempRepairTrans select * from provarch where id=rProvarch.id or parentid=rProvarch.id;
 DataPrepare; -- Get need data from avalute;
	Str:='select * from TempRepairTrans order by dat desc,vid_op desc';
	DelCursor(str);
end if; -- end Delete

If flags=1 or flags=2 then -- Begin for Add or Update

 If transaction.id is null then -- Begin for Add
  dbms_output.put_line('Add ');
  select tr_seg_PROVARCH.nextval into rProvarch.id from dual; -- Get new Id for Transaction 
 else
  dbms_output.put_line('Update ');
  rProvarch.id:=transaction.id; -- Get Id from old Transaction
 end if; -- end of update
-- Get Currensy ID for Debit 
 select val_acc into rProvarch.val_acc from account where id = transaction.Debt;
-- Get Currensy ID for Credit 
 select val_acc into rProvarch.currencyid_c from account where id = transaction.Kredit;
 if (rProvarch.val_acc <> 0) and (rProvarch.currencyid_c <> 0) 
	 and rProvarch.val_acc<>rProvarch.currencyid_c then
			raise_application_error(
				sbdecls.Error_DifferentCurrencies, 
				'Transactions between accounts having different currencies - not implemented');
 end if;
	
-- Fill others parameters for new transactions
 rProvarch.dat          := transaction.Dat;
 rProvarch.rate_d       := transaction.rate_d;
 rProvarch.rate_c       := transaction.rate_c;
 rProvarch.debt         := transaction.Debt;
 rProvarch.kredit       := transaction.Kredit;
 rProvarch.ammount      := transaction.Ammount;
 rProvarch.ammount_c    := transaction.Ammount_c;
 rProvarch.lammount     := transaction.LAmmount;
 rProvarch.name         := transaction.name;
 rProvarch.vid_op       := transaction.vid_op;
 rProvarch.no_doc       := 1;
 rProvarch.ParentID     := null;
 rProvarch.kassa_b      := transaction.Kassa_b;
 rProvarch.kassa_z      := transaction.Kassa_z;
 rProvarch.tim          := Sysdate;

-- ReCalculeted Rate_d and Rate_C
	if rProvarch.rate_d = 0 then
		rProvarch.rate_d := GetRate(rProvarch.val_acc,rProvarch.dat);
  DebitDeltaRate   := 0;
	else   
  DebitDeltaRate := rProvarch.rate_d-GetRate(rProvarch.val_acc,rProvarch.dat);
	end if;
	if rProvarch.rate_c = 0 then
		rProvarch.rate_c := GetRate(rProvarch.currencyid_c,rProvarch.dat);
  CreditDeltaRate := 0;
	else  
  CreditDeltaRate := rProvarch.rate_c-GetRate(rProvarch.currencyid_c,rProvarch.dat);
	end if;

 rTransaction:=rProvarch;
 rChild.id:=0; -- don't delete
 Prepare; -- Mesenne fergi ve gelir zerer emeliyyatlarinin yigilmasi 
 DataPrepare; -- Get need data from avalute;
	Str:='select * from TempRepairTrans order by dat desc,vid_op desc';	
	DelCursor(str); --  Gelir zerer emeliyyatlarinin pozulmasi  
 rProvarch:=rTransaction;
 LazyRestAdd;
 AddTempRepairTrans;
 Result:=AddTransactions(0);
	/*
	 calculation of child transaction is only enabled if immediate commit 
		flag is set, because rate may not be set for delayed transaction 
	*/
dbms_output.put_line('D '||to_char(rProvarch.ammount));
dbms_output.put_line('C '||to_char(rProvarch.ammount_c));
  If rProvarch.val_acc = rProvarch.currencyid_c then
   dbms_output.put_line('Currency_D=Currency_C ');
  Elsif  (rProvarch.val_acc = 0) and (rProvarch.currencyid_c <> 0.0) then
    if (ConvExpenseID_C is null) or (ConvProfitID_C is null) then
     raise_application_error(
 	 				sbdecls.Error_NoMultiCurrencyEnabled, 
	 	 					'Multy currency transactions are not enabled');
    end if;
    DeltaRate := CreditDeltaRate * rProvarch.ammount_c;
    if CreditDeltaRate > 0.0 then
      rProvarch.kredit := ConvProfitID_C;
    else
      rProvarch.debt := ConvExpenseID_C;
      rProvarch.kredit := rProvarch.debt;
      DeltaRate := - DeltaRate;
    end if;
  Elsif  (rProvarch.currencyid_c = 0) and (rProvarch.val_acc <> 0.0) then
		    if (ConvExpenseID_D is null) or (ConvProfitID_D is null) then
  		    raise_application_error(
   						sbdecls.Error_NoMultiCurrencyEnabled, 
 		   			'Multy currency transactions are not enabled');
		    end if;
      DeltaRate := DebitDeltaRate * rProvarch.ammount;
      if DebitDeltaRate > 0.0  then
        rProvarch.debt  := ConvExpenseID_D;
      else
        rProvarch.debt     := rProvarch.kredit;
        rProvarch.kredit   := ConvProfitID_D;
        DeltaRate := - DeltaRate;
      end if;
  else
      return 0; -- no additional transaction required 
  end if;


 if DeltaRate<>0 then
 dbms_output.put_line('Add Child '||to_char(DeltaRate));
		rProvarch.ammount   := DeltaRate;
		rProvarch.ammount_c := DeltaRate;
 	rProvarch.lammount  := DeltaRate;
  rProvarch.ParentID  := Result;
  rProvarch.vid_op    := 0;
  rProvarch.name      := '(MultiCurrency Auto Transaction)';
 	select VAL_ACC	into rProvarch.val_acc from ACCOUNT	where ID = rProvarch.debt;
	 select VAL_ACC	into rProvarch.currencyid_c from ACCOUNT	where ID = rProvarch.kredit;
  select tr_seg_PROVARCH.nextval into rProvarch.id from dual; 
  rProvarch.rate_d       := GetRate(rProvarch.val_acc,rProvarch.dat);
  rProvarch.rate_c       := GetRate(rProvarch.currencyid_c,rProvarch.dat);
  rProvarch.no_doc       := 0; --3
  rProvarch.ParentID     := Result;
  rProvarch.kassa_b      := null;
  rProvarch.kassa_z      := null;
  rProvarch.tim          := Sysdate;
  AddTempRepairTrans;
  Result:=AddTransactions(0);
  rProvarch.ParentID := Null;		
 end if;
end if; -- end of Add

-- Down is for all procedures ....
i:=0;
Open cDate; 
LOOP
 FETCH cDate INTO tDate(i);
 EXIT WHEN cDate%NOTFOUND;
 If i<>0 then -- Emeliyyat gunu mezenne fergi, olmur amma kelr zerer ola biler 
	 dbms_output.put_line('RateDifference '||to_char(tDate(i)));
   if rTransaction.val_acc<>0 then 
	   RateDif(tDate(i), rTransaction.debt);
   end if;
   if rTransaction.currencyid_c<>0 then 
    RateDif(tDate(i), rTransaction.kredit);
   end if;
 End if;
  i:=i+1;
End loop;
Close cDate;
DayCount:=i-1;

If cormode<2 then --Check CorMode
FOR i IN 0..DayCount LOOP
 str:='select * from TempRepairTrans where vid_op=1 and no_doc=1 and dat= ''' 
	|| to_char(tDate(i)) || '''';
 OPEN cProvarch for str; 
	LOOP
  FETCH cProvarch INTO rProvarch;
  EXIT WHEN cProvarch%NOTFOUND;
  Result:=AddTransactions(1);
 END LOOP;
 CLOSE cProvarch;

 if CorMode=0 then -- Calculate Profit	
  If i<>DayCount then -- Bank gunu gelir-zerer baglanmayib
   Profit(tDate(i), result);
   if result=0 then 
   str:='select * from TempRepairTrans where vid_op=2 and no_doc=1 and dat= ''' 
  		|| to_char(tDate(i)) || '''';
   OPEN cProvarch for str; 
  	LOOP
    FETCH cProvarch INTO rProvarch;
    EXIT WHEN cProvarch%NOTFOUND;
    Result:=AddTransactions(2);
   END LOOP;
   CLOSE cProvarch;
   end if;
  End if;
 End if; -- Calculate Profit  
END LOOP;  -- End of For  

End If; -- end Check CorMode
--execute immediate 'ALTER TRIGGER smart.inc_provarch ENABLE';
--execute immediate 'ALTER TRIGGER smart.bi_provarch_opid ENABLE';
execute immediate 'ALTER TRIGGER smart.UPD_SET_OF_LASTOPDAY ENABLE';
return 0;
end;
-----------------------------------------------------
Function AddProvarch(Flag number) return number is
result number;
FlagStr varchar(16);
ToDay date;
Yesterday date;
v_Shifr number;
begin
if flag=1 then
FlagStr:=' RateDiff ';
else
FlagStr:=' Profit ';
end if;
dbms_output.put_line(' AddProvarch '||FlagStr|| to_char(rProvarch.id));

select tek_dat, pred_dat into ToDay, YesterDay from sysdat;
If rProvarch.dat=ToDay then
rProvarch.shifr:=3;
elsif rProvarch.dat=YesterDay then
 rProvarch.shifr:=2;  
 else
 rProvarch.shifr:=0;
end if;

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
, null --rProvarch.no_doc
, rProvarch.no_mem
, rProvarch.d1
, rProvarch.k1
, rProvarch.rate_d
, rProvarch.rate_c
, rProvarch.parentid
, rProvarch.currencyid_c
, rProvarch.ammount_c
, rProvarch.name
)	returning ID into Result;
return result;
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
Procedure RateDif	(NeedDate date, ID number) as
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
   	dbms_output.put_line('rate 1 ');
    rProvarch.debt:=RateData.ID;
    rProvarch.kredit:=RateData.Kredit;
  elsif (RateData.ostat < 0) and (RateData.DeltaRate < 0)
   or (RateData.ostat > 0) and (RateData.DeltaRate > 0) then
  	 dbms_output.put_line('rate 2 ');
    rProvarch.debt:=RateData.Debet;
    rProvarch.kredit:=RateData.ID;
	else
	 dbms_output.put_line('RateDif 3');		
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
		 and kredit=rProvarch.kredit and no_doc=1;
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
 rProvarch.no_doc:=1; --v_no_doc+1;
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
Procedure LazyRestDel	is
begin
update LazyRest set
	 ostat = ostat + DebitAmount
	,pok_ostat =	pok_ostat + rProvarch.lammount 
 ,obr_d = obr_d - DebitAmount()
 ,pok_obr_d =	pok_obr_d - rProvarch.lammount 
		where
			(acc_id = rProvarch.debt)	
	--		and (datdate = rProvarch.dat)
			;  

		update LazyRest set
		 ostat = ostat - CreditAmount 
		,pok_ostat = pok_ostat - rProvarch.lammount
		,obr_k = obr_k - CreditAmount() 
		,pok_obr_k = pok_obr_k - rProvarch.lammount 
		where
			(acc_id = rProvarch.kredit)
	--		and (datdate = rProvarch.dat)
			;
end;
----------------------------------------------
Procedure LazyRestAdd	is
begin
update LazyRest set
	 ostat = ostat - DebitAmount 
	,pok_ostat =	pok_ostat - rProvarch.lammount 
	,obr_d = obr_d + DebitAmount 
	,pok_obr_d =	pok_obr_d + rProvarch.lammount 
		where
			(acc_id = rProvarch.debt)
--			and (datdate = rProvarch.dat)
			;  

		update LazyRest set
			ostat = ostat + CreditAmount
		,pok_ostat = pok_ostat + rProvarch.lammount
		,obr_k = obr_k + CreditAmount 
		,pok_obr_k = pok_obr_k + rProvarch.lammount 
		where
			(acc_id = rProvarch.kredit)
--			and (datdate = rProvarch.dat)
			;
end;
----------------------------------------------
procedure dbms is 
Begin
--dbms_output.put_line(' ');
dbms_output.put_line('id '           ||to_Char(rProvarch.id));
--dbms_output.put_line('op_id '        ||to_Char(rProvarch.op_id));
--dbms_output.put_line('no_prov '      ||rProvarch.no_prov);
dbms_output.put_line('dat '         ||to_Char(rProvarch.dat));
dbms_output.put_line('debt '         ||to_Char(rProvarch.debt));
dbms_output.put_line('kredit '       ||to_Char(rProvarch.kredit));
--dbms_output.put_line('val_acc '      ||to_Char(rProvarch.val_acc));
dbms_output.put_line('vid_op '       ||to_Char(rProvarch.vid_op));
dbms_output.put_line('ammount '      ||to_Char(rProvarch.ammount));
dbms_output.put_line('lammount '     ||to_Char(rProvarch.lammount));
dbms_output.put_line('tim '          ||to_Char(rProvarch.tim));
--dbms_output.put_line('shifr '        ||to_Char(rProvarch.shifr));
--dbms_output.put_line('no_pack '      ||to_Char(rProvarch.no_pack));
--dbms_output.put_line('kassa_b '       ||to_Char(rProvarch.kassa_b));
--dbms_output.put_line('kassa_z '       ||to_Char(rProvarch.kassa_z));
--dbms_output.put_line('no_filial '    ||to_Char(rProvarch.no_filial));
--dbms_output.put_line('sloj_prov '    ||to_Char(rProvarch.sloj_prov));
--dbms_output.put_line('bank_d '       ||to_Char(rProvarch.bank_d));
--dbms_output.put_line('bank_d '       ||to_Char(rProvarch.bank_k));
dbms_output.put_line('no_doc '       ||to_Char(rProvarch.no_doc));
--dbms_output.put_line('no_mem '       ||to_Char(rProvarch.no_mem));
--dbms_output.put_line('d1 '           ||rProvarch.d1);
--dbms_output.put_line('k1 '           ||rProvarch.k1);
dbms_output.put_line('rate_d '       ||to_Char(rProvarch.rate_d));
dbms_output.put_line('rate_c '       ||to_Char(rProvarch.rate_c));
dbms_output.put_line('ParentId'      ||to_Char(rProvarch.parentid));
--dbms_output.put_line('CurrencyId_c ' ||to_Char(rProvarch.currencyid_c));
dbms_output.put_line('Ammount_c '    ||to_Char(rProvarch.ammount_c));
dbms_output.put_line('Name '         ||rProvarch.Name);
--dbms_output.put_line(' ');
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
Procedure Profit(NeedDate date, Result in out  number) as
 PrevDate date;
 v_row Close_Profits_Accs%rowtype;
Cursor c_ReMainder 
(  BDate date
 , trDebit number
 , trCredit number
 , vProfitID_D number
 , vExpenseID_D number
 , vProfitID_C number
 , vExpenseID_C number
 , vConvProfitID_D number
 , vConvExpenseID_D number
 , vConvProfitID_C number
 , vConvExpenseID_C number
-- , vFilial Number
) is 
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
and a.id in 
(
  -- trDebit,
  -- trCredit,				
   vProfitID_D 
 , vExpenseID_D
 , vProfitID_C 
 , vExpenseID_C
 , vConvProfitID_D 
 , vConvExpenseID_D
 , vConvProfitID_C 
 , vConvExpenseID_C
)
;

Begin
dbms_output.put_line('Profit '||to_char(NeedDate));

Result:=1;
open c_ReMainder(
  NeedDate
, rTransaction.debt
, rTransaction.kredit
, ProfitID_D
, ExpenseID_D
, ProfitID_C
, ExpenseID_C
, ConvProfitID_D 
, ConvExpenseID_D
, ConvProfitID_C 
, ConvExpenseID_C
--, v_Filial
); 

LOOP
 FETCH c_ReMainder INTO v_row;
 EXIT WHEN c_ReMainder%NOTFOUND;
 Result:=0;
   rProvarch.dat:=NeedDate;
   rProvarch.name:='Gelir zererin baglanmasi';
   rProvarch.rate_d:=GetRate(rProvarch.val_acc,rProvarch.dat);
   rProvarch.rate_c:=GetRate(rProvarch.currencyid_c,rProvarch.dat);
   rProvarch.vid_op:=2; --'Gelir zererin baglanmasi'
   rProvarch.no_doc:=1; --v_no_doc+1;
--   rProvarch.tim:=rTransaction.tim;
   rProvarch.no_filial:=rTransaction.no_filial;
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

 Begin 
 dbms;
  Select id into rProvarch.id from TempRepairTrans 
	  where dat=NeedDate and vid_op=2 and no_doc=0
			 and debt=rProvarch.debt and kredit=rProvarch.kredit;
   dbms_output.put_line(' Profit '|| to_char(rProvarch.id));
 Exception 
	 When no_data_found Then
   dbms_output.put_line(' tr_seg_PROVARCH.nextval ');
   select tr_seg_PROVARCH.nextval into rProvarch.id from dual;
	 When TOO_MANY_ROWS Then
  dbms_output.put_line('TOO_MANY_ROWS in p_repair.Profit'); 
  rollback;
  raise_application_error(-20031,'Profit->TOO_MANY_ROWS');
 end;

	select VAL_ACC	into rProvarch.val_acc from ACCOUNT	where ID = rProvarch.debt;
	select VAL_ACC	into rProvarch.currencyid_c from ACCOUNT	where ID = rProvarch.kredit	;
AddTempRepairTrans;

End loop;
Close c_ReMainder;
End;
-----------------------------------------
Procedure AddTempRepairTrans is
begin
 dbms_output.put_line('AddTempRepairTrans ' ||to_Char(rProvarch.id));
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
Function AddTransactions(flag number) return number as
 Result number;
 RegSDebit number;
 RegSCredit number;
begin
 AddTurnOver;
 AddRest;
 Result:=AddProvarch(Flag);
 return Result;
end;
-----------------------------------
procedure Prepare as
D_RD Number;
C_RD Number;
D_CB Number;
C_CB Number;
begin
 Delete From TempRepairTrans;
-- Mezenne fergi hesablari ile olan emeliyyatlarin tapilmasi 
 select RateDifference, CloseBalance into D_RD, D_CB from v_account1 where AccountId=rProvarch.debt;    
 select RateDifference, CloseBalance into C_RD, C_CB from v_account1 where AccountId=rProvarch.kredit;    

If GbCorMod<2 then -- Check CorMode 

 If D_RD=1 then 
  insert into TempRepairTrans select * from provarch where 
   dat>rProvarch.dat and (vid_op=1)
   and ( debt=rProvarch.debt	or kredit=rProvarch.debt );
 end if;
 if C_RD=1 then 
  insert into TempRepairTrans select * from provarch where 
   dat>rProvarch.dat and (vid_op=1)
   and ( debt=rProvarch.kredit or kredit=rProvarch.kredit );
 end if;

-- Gelir-Zerer hesablari ile yuxaridaki Mezenne fergi hesablari olan emeliyyatlarin tapilmasi 
 If GbCorMod<1 then -- Check Profit
  if D_CB=1 then 
   insert into TempRepairTrans select * from provarch 
  	where dat>=rProvarch.dat and vid_op=2
   and
   (    debt in (select debt from temprepairtrans where vid_op=1)
     or kredit in (select debt from temprepairtrans where vid_op=1)
   );
  end if;
 
  if C_CB=1 then 
  insert into TempRepairTrans select * from provarch 
 	where dat>=rProvarch.dat and vid_op=2
  and
  (    debt in (select kredit from temprepairtrans where vid_op=1)
    or kredit in (select kredit from temprepairtrans where vid_op=1)
  );
  End if;
 End If; -- Check Profit 
End if; --Check CorMode	

-- Konvertasiya emeliyyati olanda Gelir-Zerer hesablari ile olan emeliyyatlarin tapilmasi 
if rChild.id<>0 then
 insert into TempRepairTrans select * from provarch where dat>=rProvarch.dat and vid_op=2
 and
 (    debt in (select debt from temprepairtrans where vid_op=0)
   or kredit in (select debt from temprepairtrans where vid_op=0)
   or debt in (select kredit from temprepairtrans where vid_op=0)
   or kredit in (select kredit from temprepairtrans where vid_op=0)
 );
end if;
 update tempRepairTrans set no_doc=0; 
End;
-----------------------------------
procedure DelCursor(str varchar2) as
cProvarch DynCursor;
begin
 open cProvarch for str; 
 LOOP
  FETCH cProvarch INTO rProvarch;
  EXIT WHEN cProvarch%NOTFOUND;
   DelTurnOver;
   DelRest;
   DelProvarch;
 END LOOP;
 CLOSE cProvarch;
end;
--------------------------------
Procedure Child as
Result Number:=0;
Begin
	Select Count(*) into Result from TempRepairTrans where ParentId=rTransaction.id; 
 if Result <> 0 then 
	 Select * into rChild from TempRepairTrans where ParentId=rTransaction.id; 
 else
  rChild.id:=0;
 End If;
End;
--------------------------------
procedure DataPrepare as
begin
 Select debet, kredit,SDebet, SCredit 
	 into ExpenseID_D, ProfitID_D,ConvExpenseID_D, ConvProfitID_D   
   from aValute where valute=rTransaction.val_acc; 
 Select debet, kredit,Sdebet, SCredit 
	 into ExpenseID_C, ProfitID_C,ConvExpenseID_C, ConvProfitID_C 
   from aValute where valute=rTransaction.currencyid_c; 
end;
--------------------------------
Function Main( 
  Flag              integer,
		CorMode           integer, 
		TransactionID			  integer,
		TransactionDate   date    default null,
  DebitID           integer default null,
  CreditID          integer default null,
  DebitAmount       number  default null,
 	CreditAmount      number  default null,
  LAmount           number  default null,
  DebitRate         number  default null,
  CreditRate        number  default null, -- rates should be retreived from system dataset
  TrName            varchar default null,
		InBalanceChar			  integer default null,
		OutBalanceChar		  integer default null,
		OperationType			  integer default null,
		ParentID					     integer default null,
		TempID						      integer default null
  )
		return integer
	is
		Transaction provarch%rowtype;
		Result number;
	begin
		Transaction.ID              := TransactionID;
		Transaction.Dat             := TransactionDate;
		Transaction.Debt            := DebitID;
		Transaction.Kredit          := CreditID;
		Transaction.Ammount         := DebitAmount;
		Transaction.Ammount_C       := CreditAmount;
		Transaction.LAmmount        := LAmount;
		Transaction.Rate_D          := DebitRate;
		Transaction.Rate_C          := CreditRate;
		Transaction.Kassa_B         := InBalanceChar;
		Transaction.Kassa_Z         := OutBalanceChar;
		Transaction.Vid_op          := OperationType;
		Transaction.ParentID        := ParentID;
		Transaction.Name            := TrName;  
/*
if flag=0 then
  Result:=Main(0,CorMode,Transaction);
elsif flag=1 then
  Result:=Main(1,CorMode,Transaction);
elsif flag=2 then
  Result:=Main(0,CorMode,Transaction);
  Result:=Main(1,CorMode,Transaction);
end if;
*/
 Result:=Main(Flag,CorMode,Transaction);
	return Result;
End;
--------------------------------------------

Begin
 CurrentDate:=SBOP.get_date;
END;
/


-- End of DDL Script for Package Body SMART.P_CORRECT

