-- Start of DDL Script for Package Body SMART.SBRM
-- Generated 16-Dec-2003 11:10:04 from SMART@SB

CREATE OR REPLACE 
PACKAGE sbrm
IS
/* *********************************************** */
/*        SmartBank Rate Management package        */
/*  Copyright 2002, Smart Systems Technoogy, Ltd.  */
/* *********************************************** */

   function calc_rate_difference
      return integer; -- TempID of new transactions set;

   procedure commit_new_rates;
  procedure correct_lammount;
END; -- Package spec
/

CREATE OR REPLACE 
PACKAGE BODY sbrm
IS
  
/* *********************************************** */
/*        SmartBank Rate Management package        */
/*  Copyright 2002, Smart Systems Technoogy, Ltd.  */
/* *********************************************** */

  procedure commit_new_rates
  as
    currentdate date;
  begin
    select tek_dat into currentdate from sysdat;
    delete from operkurs where dat = currentdate;
    insert into operkurs select * from temprate;
  end;
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
  function calc_rate_difference return integer as 
		-- TempID of new transactions set
  cursor c_RateDifference is (select * from RateDifference);
		cursor c_AccCurrency(AccID integer)	is 
		(	select VAL_ACC	from ACCOUNT	where ID = AccID	);
		cursor c_CurrencyRate(CurrencyID integer)	is 
		(select OSTAT as Rate	from operkurs	where VAL_KOD = CurrencyID);

  --TempID integer;
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
--  TrName varchar2(64) := sbmsg.get_message('SB_TRANSACTION.transaction_add.RateDifferenceTransactionDest');
  TrName varchar2(64) := 'ћ€з€нн€ ф€рги';
  TrCount Integer := 0;
  begin
    /* generate temporary ID */
--    TempID := SB_TRANSACTION.gen_temp_id;
    
    for RateData in c_RateDifference
    loop
      /* analize what's changed */
      DebitAccID := null; -- if not modified in next statement - no transaction needed

      if ((RateData.ostat > 0) and (RateData.DeltaRate < 0))
         or ((RateData.ostat < 0) and (RateData.DeltaRate > 0))
      then
        DebitAccID := RateData.ID;
        CreditAccID := RateData.Kredit;
        CheckRDSettings(CreditAccID, RateData.CurrencyID);
      elsif (RateData.ostat < 0) and (RateData.DeltaRate < 0)
            or (RateData.ostat > 0) and (RateData.DeltaRate > 0)
      then
        DebitAccID := RateData.Debet;
        CreditAccID := RateData.ID;
        CheckRDSettings(DebitAccID, RateData.CurrencyID);
      end if;
			
			open c_AccCurrency(DebitAccID);
			fetch c_AccCurrency into DebitCurrencyID;
			close c_AccCurrency;
			
			open c_AccCurrency(CreditAccID);
			fetch c_AccCurrency into CreditCurrencyID;
			close c_AccCurrency;

			open c_CurrencyRate(DebitCurrencyID);
			fetch c_CurrencyRate into DebitRate;
			close c_CurrencyRate;
			
			open c_CurrencyRate(CreditCurrencyID);
			fetch c_CurrencyRate into CreditRate;
			close c_CurrencyRate;
			
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
    				--TempID => TempID,
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
procedure correct_lammount is
begin
update archost arc	set
	pok_ostat = (
				select arc.ostat * ostat 	from operkurs	where 
					(dat = (	select tek_dat from sysdat))
					and
					(val_kod = (	select val_acc	from account	where ID = arc.acc_id)
					)
			);
end;
	
END;
/


-- End of DDL Script for Package Body SMART.SBRM

