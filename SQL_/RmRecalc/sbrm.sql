-- Start of DDL Script for Package SMART.SBRM
-- Generated 15-Apr-2004 2:26:08 from SMART@SBNEW

CREATE OR REPLACE 
PACKAGE sbrm
IS
/* *********************************************** */
/*        SmartBank Rate Management package        */
/*  Copyright 2002, Smart Systems Technoogy, Ltd.  */
/* *********************************************** */

 Function  calc_rate_difference return integer; -- TempID of new transactions set;
 Procedure commit_new_rates;

  procedure ArchiveTransactions;
  procedure CheckAmmounts;
  procedure CheckRDSettings(AccID integer, CurrencyID integer);
  procedure DelCursor(str varchar2);
  procedure DeleteOldTransactions;
  procedure Recalculate;
  procedure Rates_recalculation(ComCount out integer,LazyCount out integer );
  function AddArchiveTransactions(ProvTrCount in out integer,LazyTrCount in out integer) return boolean;
END; -- Package spec
/

CREATE OR REPLACE 
PACKAGE BODY sbrm IS
/* *********************************************** */
/*        SmartBank Rate Management package        */
/*  Copyright 2002, Smart Systems Technoogy, Ltd.  */
/* *********************************************** */
LazyError constant  varchar2(128)  := 'Áצעצם ÿלÿכטייאעכאנ עÿסעטדכÿםלטר מכלאכûהûנ';
RatesNotChange constant  varchar2(128)  := 'Êףנסכאנ הÿיטרלÿלטרהט';
TriggerProvarch constant  varchar2(24):= 'BI_PROVARCH_OPID';
TruggerLazy constant  varchar2(32):='BI_LAZYTRANSACTION_OP_ID';
commandpromt constant   VARCHAR2 (64) := 'ALTER TRIGGER ';


 Type DynCursor is ref cursor; 
 rProvarch provarch%rowtype;

Procedure commit_new_rates as
Currentdate date;
Begin
dbms_output.put_line('commit_new_rates ');
--Commit;
 delete from operkurs where dat = sbop.get_date;
 insert into operkurs select * from temprate;
End;
--------------------------------------------------
  procedure CheckRDSettings(AccID integer, CurrencyID integer) as
  begin
    if AccID is null then
      raise_application_error(
        sbdecls.Error_RateDifferenceSettings,
           'Rate difference settings not set for currency #'
        || TO_CHAR(CurrencyID)
      );
    end if;
  end;
--------------------------------------------------------
Function calc_rate_difference return integer as 
		-- TempID of new transactions set
  cursor c_RateDifference is (select * from RateDifference);
  DebitAccID integer;
  CreditAccID integer;
		DebitCurrencyID integer;
		CreditCurrencyID integer;
		DebitAmount number;
		CreditAmount number;
		DebitRate number;
		CreditRate number;
  Amount number(14, 2);
		TempTrID integer;
  RateData c_RateDifference%rowtype;
  TrName varchar2(64) := 'Ìÿחÿםםÿ פÿנדט';
  TrCount  Integer := 0;
  begin
    for RateData in c_RateDifference
    loop
      /* analize what's changed */
      DebitAccID := null; -- if not modified in next statement - no transaction needed
      if ((RateData.ostat > 0) and (RateData.DeltaRate < 0))
         or ((RateData.ostat < 0) and (RateData.DeltaRate > 0))
      then
        DebitAccID := RateData.ID;
        CreditAccID := RateData.Kredit;
        DebitCurrencyID:=RateData.AccCurrencyID;
        CreditCurrencyID:=0;        
        CheckRDSettings(CreditAccID, RateData.CurrencyID);
      elsif ((RateData.ostat < 0) and (RateData.DeltaRate < 0))
            or ((RateData.ostat > 0) and (RateData.DeltaRate > 0))
      then
        DebitAccID := RateData.Debet;
        CreditAccID := RateData.ID;
        DebitCurrencyID:=0;
        CreditCurrencyID:=RateData.AccCurrencyID;        
        CheckRDSettings(DebitAccID, RateData.CurrencyID);
      end if;
			if DebitCurrencyID = 0 then
				DebitAmount := RateData.sum_transaction;
			else
				DebitAmount := 0; 
			end if;
			if CreditCurrencyID = 0 then
				CreditAmount := RateData.sum_transaction;
			else
				CreditAmount := 0; 
			end if;
      /* add transaction */
      if DebitAccID is not null
      then
				TempTrID :=
    			SB_TRANSACTION.transaction_add(
--    				TempID => TempID,
    				DebitID  => DebitAccID,
    				CreditID => CreditAccID,
    				DebitAmount => DebitAmount,	-- debit
    				CreditAmount => CreditAmount,
    				LAmount => RateData.sum_transaction,
   					OperationType => 1,
    				DebitRate => 0,
    				CreditRate => 0,
    				TrName => TrName,
    				Flags => sbdecls.atfCommitImmediate
								);
      TrCount := TrCount + 1;                
      end if;
    end loop;
    return TrCount;
end;
---------------------------------------------	
----------------------------------------------
procedure Recalculate
is
begin
 update temprepairtrans
 set 
  RATE_D = (select ostat from temprate where val_kod = VAL_ACC),
  LAMMOUNT= (select ostat* AMMOUNT from temprate where val_kod = VAL_ACC)
 where 
 (VAL_ACC<>0)
 and id not in (select parentid from temprepairtrans where vid_op = 0 and parentid is not null);

 update temprepairtrans
 set 
  LAMMOUNT= (select ostat* AMMOUNT from temprate where val_kod = VAL_ACC)
 where 
 (VAL_ACC<>0)
 and id in (select parentid from temprepairtrans where vid_op = 0 and parentid is not null);
 
 
 update temprepairtrans
 set AMMOUNT_C=LAMMOUNT 
 where CURRENCYID_C=0;
 
 update temprepairtrans
 set 
 RATE_C = (select ostat from temprate where val_kod = CURRENCYID_C),
 LAMMOUNT= (select ostat * AMMOUNT_C  from temprate where val_kod = CURRENCYID_C)
 where CURRENCYID_C<>0
 and id not in (select parentid from temprepairtrans where vid_op = 0 and parentid is not null);

 update temprepairtrans
 set 
 LAMMOUNT= (select ostat * AMMOUNT_C  from temprate where val_kod = CURRENCYID_C)
 where CURRENCYID_C<>0
 and id in (select parentid from temprepairtrans where vid_op = 0 and parentid is not null);

  
 update temprepairtrans
 set AMMOUNT=LAMMOUNT 
 where VAL_ACC=0;
 
 delete from temprepairtrans 
 where  (vid_op = 0 and parentid is not null);
 --where id in (select parentid from temprepairtrans where vid_op = 0 and parentid is not null);

end;

----------------------------------------------
procedure ArchiveTransactions
is
begin
  Delete from TEMPREPAIRTRANS;
  

  insert into TEMPREPAIRTRANS
  select * from provdoc  
  where 
   not(val_acc=0 and currencyid_c=0) and (vid_op<>1 and vid_op<>2 or vid_op is null)
   and 
   (
   (val_acc<>currencyid_c
   and (val_acc in (select val_acc from RATECHECK where delta<>0) or currencyid_c in (select val_acc from RATECHECK where delta<>0)))
    or(val_acc=currencyid_c and val_acc in (select val_acc from RATECHECK where delta<>0)));

  insert into TEMPREPAIRTRANS
  select * from provdoc  
  where vid_op = 0 and parentid is not null;
end;
----------------------------------------------
procedure DelCursor(str varchar2) 
is
cProvarch DynCursor;
begin
 open cProvarch for str; 
  LOOP
   FETCH cProvarch INTO rProvarch;
   EXIT WHEN cProvarch%NOTFOUND;
    SB_TRANSACTION.transaction_delete(rProvarch.id);
  END LOOP;
 CLOSE cProvarch;
end;
----------------------------------------------
procedure DeleteOldTransactions
is
begin
DelCursor('select * from TEMPREPAIRTRANS where parentid is null');
DelCursor('select * from provdoc where (vid_op=1 or vid_op=2) ');
end;
----------------------------------------------
procedure ReenableTriggers(TriggerName varchar2,IsEnable Boolean default True)
is
  TriggerRow dba_triggers%rowtype;
begin
  begin
   select * into TriggerRow from dba_triggers
   where trigger_name =UPPER(TriggerName); 
  exception
   when NO_DATA_FOUND then
    Return;
  end;
 
  IF  isenable THEN
    EXECUTE IMMEDIATE (commandpromt||TriggerName|| ' enable');
  else
    EXECUTE IMMEDIATE (commandpromt||TriggerName|| ' disable');
  END IF;
end;
----------------------------------------------
procedure UpdateId
is
 old_id integer;
 new_id integer;
 cursor prov_doc
 is
  select * from provdoc 
  where vid_op<>1 or vid_op is null
  FOR UPDATE;
begin
  for rec in prov_doc
   loop
   old_id := rec.id;
   update provdoc
   set id=TR_SEG_PROVARCH.nextval
   where id=rec.id 
   RETURNING id INTO new_id;

   update provdoc set parentid=new_id
   where parentid=old_id;
  end loop;
end;

----------------------------------------------
function AddArchiveTransactions(ProvTrCount in out integer,LazyTrCount in out integer) return boolean
is
 Result Integer;
 TransId integer;
 CommitCount integer := 0;
 LazyCount integer := 0;
 cursor ArchiveTrans
 is
 select * from TEMPREPAIRTRANS order by tim;
begin
 ReenableTriggers(TriggerProvarch,False);
 ReenableTriggers(TruggerLazy,False);

--update id in old transactions
 UpdateId;
   
 for rec in ArchiveTrans
 loop
   begin
    select TR_SEG_PROVARCH.nextval into TransId from dual;
   
    Result:=SB_TRANSACTION.transaction_add(
    TransactionID =>TransId,
    TransactionDate =>rec.dat,
    OperatorID=>rec.op_id,
    OperationType=> rec.vid_op,
    DebitID=> rec.debt,
    CreditID=>rec.kredit,
    DebitAmount=>rec.ammount,
    CreditAmount=>rec.ammount_c,
    LAmount=>rec.lammount,
    DebitRate=>rec.rate_d,
    CreditRate=>rec.rate_c,
    TrName=>rec.name,
    Flags => sbdecls.atfCommitImmediate);
    CommitCount:=CommitCount+1;
    exception 
    
     when others then
      begin
       Result:=SB_TRANSACTION.transaction_add(
       TransactionDate =>rec.dat,
       OperatorID=>rec.op_id,
       OperationType=> rec.vid_op,
       DebitID=> rec.debt,
       CreditID=>rec.kredit,
       DebitAmount=>rec.ammount,
       CreditAmount=>rec.ammount_c,
       LAmount=>rec.lammount,
       DebitRate=>rec.rate_d,
       CreditRate=>rec.rate_c,
       TrName=>rec.name);
       LazyCount:=LazyCount+1;
    end;
    
  end;
 end loop;
 ReenableTriggers(TriggerProvarch);
 ReenableTriggers(TruggerLazy);
 dbms_output.put_line('Commited count:'||TO_CHAR(CommitCount)); 
 dbms_output.put_line('Lazy count:'||TO_CHAR(LazyCount));
 ProvTrCount :=CommitCount;
 LazyTrCount:=LazyCount;
 return True; 
end;
----------------------------------------------
procedure CheckAmmounts
is
 LazyCount integer;
begin
 select count(*) into LazyCount from lazytransaction where dat= (select tek_dat from sysdat);
 if LazyCount>0 then
  raise_application_error (-20290,LazyError);
 end if;
 
 select Count(*) into LazyCount from operkurs op,temprate tp
 where op.val_kod=tp.val_kod
 and op.dat = (select tek_dat from sysdat)
 and op.ostat <> tp.ostat;

 if LazyCount=0 then
  raise_application_error (-20290,RatesNotChange);
 end if;
end;

----------------------------------------------
 procedure Rates_recalculation(ComCount out integer,LazyCount out integer )
 is
  Dummy integer;
  Dum Boolean;
 begin
  CheckAmmounts;
  ArchiveTransactions;
  DeleteOldTransactions;
  commit_new_rates;
  Dummy:=calc_rate_difference;
  Recalculate;
  Dum:=AddArchiveTransactions(ComCount,LazyCount);
 end;


	


END;
/


-- End of DDL Script for Package SMART.SBRM


