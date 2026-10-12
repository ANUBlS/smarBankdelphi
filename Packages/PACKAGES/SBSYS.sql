CREATE OR REPLACE PACKAGE SBSYS
is

	/* *********************************************** */
  /*       SmartBank System Utilities package        */
	/*  Copyright 2006, Smart Systems Technoogy, Ltd.
                   modified by Kenan MEMMEDOV        */
  /* *********************************************** */  

  function is_day_opened return boolean;
  procedure open_day;
  procedure close_day (NewDate date);
  function close_day_profits return Integer;
  Procedure Correct_Lammount;
  Procedure Correct_Ammount;
  Procedure rollback_day(
		ToDate date,	
		PrevDate date default null,	  
		ArchiveDate date default null);

end;
/
CREATE OR REPLACE PACKAGE BODY SBSYS is
 	/* *********************************************** */
  /*       SmartBank System Utilities package        */
	/*  Copyright 2006, Smart Systems Technoogy, Ltd.
                   modified by Kenan MEMMEDOV        */
  /* *********************************************** */  

function is_day_opened return boolean is Result integer;
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
function TriggersSwitch(TableName varchar2,IsEnable Boolean)
 return Boolean
is
 Trig_name dba_triggers.trigger_name%type;
begin
 select trigger_name into Trig_name from dba_triggers
 where owner = 'SMART' and table_name = UPPER(TableName);

 if isEnable then
  execute immediate REPLACE('alter trigger %TR enable','%TR',Trig_name);
 else
  execute immediate REPLACE('alter trigger %TR disable','%TR',Trig_name);
 end if;

return True;
exception
when others then
  return False;
end;

------------------------------------------
Procedure close_day (NewDate date) as
CurrentDate   date;
begin
SB_ACA.CheckObjectAccess('CLOSEDAY','update');  --adm
SB_ACA.CheckObjectAccess('RATEMANAGEMENT','update');  --adm 

CurrentDate :=out_sbop.get_date;
if NewDate <= CurrentDate then
   raise_application_error (
   sbdecls.Error_BadNewDate,
    'CloseDay: new operation date must be greatest than current'
    );
end if;

-- Correct partition place in ArchOst
Update OperKurs partition (YesterDay) set Shifr=0;
Update OperKurs partition (ToDay) set Shifr=2;
INSERT INTO OperKurs partition (ToDay)
 SELECT val_kod, Ostat, NewDate, 3
  FROM OperKurs partition (YesterDay);

 Update archost partition (YesterDay) set id_Number=0;
 Update archost partition (ToDay) set id_Number=2;

-----------------OUT_BALANCE--------------------------------
 Update out_archost partition (YesterDay) set id_Number=0;
 Update out_archost partition (ToDay) set id_Number=2;
---------------------------------------------------------------
INSERT INTO archost partition (ToDay)
 SELECT 3, acc_id, ostat, pok_ostat, newdate, 0, 0, 0, 0, lastopdate
  FROM archost partition (YesterDay);
-----------------OUT_BALANCE--------------------------------
INSERT INTO out_archost partition (ToDay)
 SELECT 3, acc_id, ostat, pok_ostat, newdate, 0, 0, 0, 0, lastopdate
  FROM out_archost partition (YesterDay);----TKenan

-- Correct partition place in Provarch
Update ProvArch partition (YesterDay) set Shifr=0;
Update ProvArch partition (ToDay) set Shifr=2;

Update Out_ProvArch partition (YesterDay) set Shifr=0;
Update Out_ProvArch partition (ToDay) set Shifr=2;

Update sysdat set 
     arc_day = pred_dat,
     pred_dat = tek_dat,
     tek_dat = NewDate,
     close = 1;
Delete from temptranz;
Delete from out_temptranz;

--CM_SYSTEM.MarkStateHistory(NewDate);
commit;
end;
-----------------------------------------------
function close_day_profits	return Integer	as
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
  AccNullCount integer;

   cursor c_ReMainder is (select * from Close_Profits_Accs);
   cursor c_AccNullCount is select count(*) from AVALUTE
      where 
        (VALUTE in (select VAL_ACC from Close_Profits_Accs)) 
        and (f5501p is null) or (f5501v is null);
      
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
------------------------------------------------------------------	
	/* rollback_day: Return to previous date
	 || Parameters:
	 ||		ToDate:		Date for rollback to
	 ||		PrevDate:	Optional. Date previous for ToDate, if not supplied - 
	 ||			calculated automatically from operkurs
	 ||		ArchiveDate: Optional. Date previous for PrevDate. If not supplied
	 ||			will taken from operkurs
	 || Note: Procedure will not commit changes		
	*/
------------------------------------------------------------	
	procedure Rollback_Day(
		ToDate date,	
		PrevDate date default null,	  
		ArchiveDate date default null)
	as
    
  Cursor C_CheckDate(ReturnDate date) is
   select * from OperKurs where dat = ReturnDate;
   PredDate date;
   Arcday date;
   CheckDate C_CheckDate%RowType; 
   IsInvalidDate Boolean; 
   
      
	begin
      dbms_output.put_line('Rollback begin');
     
     open C_CheckDate(ToDate);
      fetch C_CheckDate into CheckDate;
      IsInvalidDate :=(C_CheckDate%notfound) OR (CheckDate.dat=out_SBOP.get_date);
     close C_CheckDate;
     
     if IsInvalidDate then
      Return;
     end if;
     delete from archost where datdate>ToDate;
-----------------OUT_BALANCE--------------------------------               
     delete from out_archost where datdate>ToDate;
--------------------------------------------------------------     
     delete from lazyrest;
     insert into lazyrest select * from archost where datdate=ToDate;
     delete from provarch where dat>ToDate;
-----------------OUT_BALANCE----------------------------------------------------     
     delete from out_lazyrest;
     insert into out_lazyrest select * from out_archost where datdate=ToDate;
     delete from out_provarch where dat>ToDate;
--------------------------------------------------------------------------------      
--     delete from lazytransaction;

     delete from operkurs where dat>ToDate;
   --  delete from temprate;
   --  insert into temprate  select * from operkurs where dat = ToDate ;

     select max(dat) into PredDate from operkurs where dat<ToDate; --tempost view
     select max(dat) into Arcday from operkurs where dat<PredDate; --tempost view
     
     Update SysDat 
      set 
       tek_dat = ToDate,
       pred_dat = PredDate, 
        arc_day  = Arcday; 
     
      commit;   
      dbms_output.put_line('Rollback partition');

  ------------------------->>- partition needs-------------------------   
     
     update archost set id_number = 3 where datdate = ToDate;   
     update archost set id_number = 2 where datdate = PredDate; 
     
     update out_archost set id_number = 3 where datdate = ToDate;   
     update out_archost set id_number = 2 where datdate = PredDate; 
     
     update operkurs set shifr = 3 where dat = ToDate;   
     update operkurs set shifr = 2 where dat = PredDate; 
     
     update provarch set shifr = 3 where dat = ToDate;   
     update provarch set shifr = 2 where dat = PredDate; 
    
     update out_provarch set shifr = 3 where dat = ToDate;   
     update out_provarch set shifr = 2 where dat = PredDate; 
  
   ------------------------<<-- partition needs-------------------------      
    commit; 		
      dbms_output.put_line('Rollback end');

end;
-------------------------------------------
Procedure Correct_Lammount is
Begin
dbms_output.put_line(' ');
/*
Update archost arc	set Pok_Ostat = ostat * 
 (
	Select ostat 	From OperKurs	where 
		(dat = (Select tek_dat From sysdat))
			and
		(val_kod = (Select val_acc	From account	Where ID = arc.acc_id))
	);
*/
end;
-------------------------------------------
Procedure Correct_Ammount is
Begin
dbms_output.put_line(' ');
/*
Update archost arc	set Ostat = pok_ostat /  
 (
	Select ostat 	From OperKurs	where 
		(dat = (Select tek_dat From sysdat))
			and
		(val_kod = (Select val_acc	From account	Where ID = arc.acc_id))
	);
*/
end;
--------------------------------------------- 
 
END;




