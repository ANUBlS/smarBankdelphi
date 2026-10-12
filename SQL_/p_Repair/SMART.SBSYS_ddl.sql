-- Start of DDL Script for Package Body SMART.SBSYS
-- Generated 16-Dec-2003 11:10:49 from SMART@SB

CREATE OR REPLACE 
PACKAGE sbsys
is

	/* *********************************************** */
  /*       SmartBank System Utilities package        */
	/*  Copyright 2002, Smart Systems Technoogy, Ltd.  */
  /* *********************************************** */  

  function is_day_opened return boolean;
  procedure open_day;
  procedure close_day (NewDate date);
  function close_day_profits return Integer;
end;
/

CREATE OR REPLACE 
PACKAGE BODY sbsys
is

  /* *********************************************** */
  /*       SmartBank System Utilities package        */
  /*  Copyright 2002, Smart Systems Technoogy, Ltd.  */
  /* *********************************************** */  

function is_day_opened return boolean is
Result   integer;
begin
 select close into Result from sysdat;
  if Result = 1 then
   return true;
  else
   return false;
  end if;
end;
-------------------------------------
procedure open_day as
begin
 update sysdat set close = 0;
end;
------------------------------------------
procedure close_day (NewDate date) as
CurrentDate   date;
begin
SB_ACA.CheckObjectAccess('CLOSEDAY','update');  --adm
SB_ACA.CheckObjectAccess('RATEMANAGEMENT','update');  --adm 

CurrentDate := sbop.get_date;
if NewDate <= CurrentDate then
   raise_application_error (
   sbdecls.Error_BadNewDate,
    'CloseDay: new operation date must be greatest than current'
    );
end if;
INSERT INTO archost
   SELECT id_number, acc_id, ostat, pok_ostat, newdate, 0, 0, 0, 0, lastopdate
     FROM tenostat;
update sysdat
 set arc_day = pred_dat,
     pred_dat = tek_dat,
     tek_dat = NewDate,
      close = 1;
delete from temptranz;
update temprate set dat = NewDate;
end;
-----------------------------------------------
function close_day_profits	return Integer 
	as
    v_row Close_Profits_Accs%rowtype;
    v_Newrate Number;
    v_Oldrate Number;
    v_Ammount Number;
    v_DebetRate Number:=0.0;
    v_CreditRate Number:=0.0;
    v_Flags Number:=0.0;
    v_Result Number:=0;
    v_DeltaRate Number;
		TempID integer;
		TempTrID integer;

    v_TrName VarChar2(80) := 'Gelir zererin baglanmasi';

   cursor c_ReMainder is (select * from Close_Profits_Accs);
   cursor c_AccNullCount is select count(*) from AVALUTE
      where 
        (VALUTE in (select VAL_ACC from Close_Profits_Accs)) 
        and (f5501p is null) or (f5501v is null);
      
    AccNullCount integer;
  begin
  SB_ACA.CheckObjectAccess('PROFITCLOSING','update'); --adm
  SB_ACA.CheckObjectAccess('Transaction','insert');  --adm 

  
    open c_AccNullCount;
    fetch c_AccNullCount into AccNullCount;
    close c_AccNullCount;
    
    if AccNullCount <> 0 then
      raise_application_error(
        sbdecls.Error_ProfitClosingSettings, 
        'No accounts for one of currencies not set. '||
        'Set up your debit and credit accounts for all currencies');
    end if;  
  
	 	TempID := SB_TRANSACTION.gen_temp_id();
    for v_row in c_ReMainder
    Loop
     If v_row.Ostat>0 then
	  		TempTrID := 
					SB_TRANSACTION.transaction_add(
						TempID => TempID,
						DebitID  => v_row.ID,
						CreditID => v_row.f5501p,
						DebitAmount => v_row.ostat,	-- debit
						CreditAmount => null,
						LAmount => v_row.pok_ostat,
					 OperationType => 2,
						DebitRate => 0,
						CreditRate => 0,
						TrName => v_TrName,
						Flags => sbdecls.atfTemporary
						);

      ElsIf v_row.Ostat<0 Then	
				TempTrID :=
					SB_TRANSACTION.transaction_add(
						TempID => TempID,
						DebitID  => v_row.f5501v,
						CreditID => v_row.id,
						DebitAmount => null,	-- debit
						CreditAmount => -v_row.ostat,
						LAmount => -v_row.pok_ostat,
					 OperationType => 2,
						DebitRate => 0,
						CreditRate => 0,
						TrName => v_TrName,
						Flags => sbdecls.atfTemporary);
      End if;
    end loop;

		return TempID;
  end;
	
	/* rollback_day: Return to previous date
	 || Parameters:
	 ||		ToDate:		Date for rollback to
	 ||		PrevDate:	Optional. Date previous for ToDate, if not supplied - 
	 ||			calculated automatically from operkurs
	 ||		ArchiveDate: Optional. Date previous for PrevDate. If not supplied
	 ||			will taken from operkurs
	 || Note: Procedure will not commit changes		
	*/
	
	procedure rollback_day(
		ToDate date,	
		PrevDate date default null,	  
		ArchiveDate date default null)
	as
 CurrentDate date:=sbop.get_date;
	begin
    -- change system date
    update sysdat set pred_dat = arc_day;
    update sysdat set arc_day = ArchiveDate;
    update sysdat set tek_dat = PrevDate;
     
    delete from temprate;
    insert into temprate  select * from operkurs where dat = PrevDate;
      
    --remove old records
    delete from provarch where dat >= CurrentDate;
    delete from operkurs where dat >= CurrentDate;
    delete from archost where datdate >= CurrentDate;
			
	end;

end;
/


-- End of DDL Script for Package Body SMART.SBSYS

