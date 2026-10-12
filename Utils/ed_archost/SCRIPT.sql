-- Start of DDL Script for Package SMART.SB_MAIN_FACILITIES
-- Generated 20-Feb-2005 20:49:15 from SMART@sbdev

CREATE OR REPLACE 
PACKAGE sb_main_facilities 
is
  Type C_TransactionCursor is ref cursor ;
  
  procedure delete_wares(v_id number);
  procedure add_departments(v_department varchar);
  
  procedure add_close_month(v_month date);
  procedure add_moderned_wares(v_id number,v_groupsID number,v_modern_num number,v_modern_summa number,v_modern_date date);
  procedure add_repaired_wares(v_id number,v_groupsID number,v_repair_num number,v_repair_summa number,v_repair_date date);
  procedure delete_repaired_wares(v_id number);
  procedure delete_moderned_wares(v_id number); 
  
  procedure  CalculateNewWares(
                    -- LastProcessDate IN Date
                    CalcDate IN Date
                    );
  procedure add_MFTraffics(v_id number);
	  procedure add_groups(v_name varchar,v_amort number,v_main_account varchar,v_exp_account varchar,v_amort_account varchar,v_sale_account varchar,v_taxamort number);
  Function  GetCurrentID return Number;
  procedure upd_groups(v_id number,v_name varchar,v_amort number,v_main_account varchar,v_exp_account varchar,v_amort_account varchar,v_sale_account varchar,v_taxamort number);
  procedure upd_wares(
      v_id             number, 
      v_name           varchar, 
      v_inventar       varchar,
      v_inventar_date  date,
      v_first_price    number,
      v_balance_price  number,
      v_in_date        date,
      v_in_num         number,
      v_amort          number,
      v_producer_plane varchar,
      v_fxm            number,
      v_sector_cod     number,
      v_allamort       number,
      v_tax            number
                      );
 procedure DropTable(v_TableName varchar);                     
  procedure add_archive_wares1(
      v_id number, 
      v_groupsID       number,
      v_name           varchar2, 
      v_inventar       varchar2,
      v_inventar_date  date,
      v_first_price    number,
      v_balance_price  number,
      v_in_date        date,
      v_out_date       date, 
      v_in_num         number,
      v_out_num        number, 
      v_amort          number,
      v_allamort       number,
      v_producer_plane varchar2,
      v_fxm            number,
      v_sector_cod     number,
      v_cause_out      varchar2,
      v_modern_date       date,
      v_modern_summa   number,
      v_modern_num     number,
      v_repair_date    date,
      v_repair_summa   number,
      v_repair_num     number,
      v_amort_date     date     
       );
  procedure sumGroupDetails(IDGroups in number,FirstPrice in out number,BalancePrice in out number,AllAmort in out number,Remainder in out number);
  procedure sumModernedWares(IDGroups in number, ModernSumma in out number);
  Procedure sumRepairedWares(IDGroups in number ,RepairSumma in out number);
  procedure SumGroupDetailsForTax(IDGroups in number,FirstPrice in out number,BalancePrice in out number,AllTaxAmort in out number,TaxAmort in out number);
  Procedure SetNewSettings(NewDate date );
  function GetCurrentYear return date;
  function  GetPresentDate return Date;

  procedure SetTransactions(v_TransactionID number,v_GroupsID number);
  Procedure OpenCursor(ACursor IN OUT C_TransactionCursor, V_StrParam IN VarChar2);
  procedure add_wares(
        v_groupsID       number
      , v_name           varchar 
      , v_inventar       varchar
      , v_inventar_date  date
      , v_first_price    number
      , v_balance_price  number
      , v_in_date        date
      , v_in_num         number
      , v_amort          number
      , v_producer_plane varchar
      , v_fxm            number
      , v_sector_cod     number
      , v_remainder      number 
      , v_allamort       number
      , v_taxamort       number
      , v_alltaxamort    number
      , v_tax            number);
  Function CheckForTakeOff(v_ID number) return boolean;
  procedure TempTaxUpdate(v_ID number,v_TaxPercentPrice number,v_AllTaxAmort number);
  function GetAccountID(AccountNumber varchar) return number;
  function GetAccountNumber(AccountID number) return varchar;
  function GetDepartmentName(DepartmentID number) return varchar;
  function GetLastCalculateDate return date;
  function DifferenceReport return varchar;
  
  procedure CheckForCalculate(
                            ObjectID in Wares.id%type ,
                            DateInterval in number,
                            NewBalancePrice out Wares.balance_price%type,
                            NewRemainder out Wares.remainder%type
                           );
  procedure StopCalculate(ObjectID number);
  function GetTransactions
          (
           v_GroupsID Wares.groupsid%type--0 all wares
          ,v_BeginDate date
          ,v_EndDate date
          ) return varchar;
  procedure Delete_MainGroup(v_ID Groups.id%type);
  procedure  CalculateOldWares(
            CalcDate IN Date 
           ,CalculateDays in number 
           );
  function CheckID(v_ID number) return boolean;
  function GetGroupName(groupID number) return Groups.name%type;
  function GetAccountbalance(accid number) return number;
END; -- Package spec
/

CREATE OR REPLACE 
PACKAGE BODY sb_main_facilities
IS

 Cursor C_CurrentYear is
 Select Current_Year from MF_Close_Year;


procedure CheckForCalculate(
                            ObjectID in Wares.ID%type ,
                            DateInterval in number,
                            NewBalancePrice out Wares.balance_price%type,
                            NewRemainder out Wares.remainder%type
                           ) 
is
  FirstPrice Wares.first_price%type;
  TotalAmort Wares.allamort%type;
  Percent Wares.amort%type;
begin 
 select
    First_price ,Allamort ,Amort
   into 
    FirstPrice ,TotalAmort ,Percent 
 from Wares
 where 
    ID = ObjectID; 
  NewRemainder :=(DateInterval*FirstPrice*Percent)/(36000);
  NewBalancePrice :=FirstPrice -(TotalAmort +NewRemainder); 
  if NewBalancePrice < 0 then 
   begin
    NewBalancePrice :=0;
    NewRemainder :=FirstPrice - TotalAmort;
   -- Update Wares
   --   set 
   --     close_format = 2
   --   where ID = ObjectID;  
   --select * from close_month  commit;
   end; 
  end if;  
  --dbms_output.put_line('NewRemainder= '||to_char(NewRemainder)||' '||'NewBalancePrice='||to_char(NewBalancePrice));
  
end;
  
  
procedure  CalculateOldWares(
            CalcDate IN Date 
           ,CalculateDays in number 
           )
Is      
  cursor  OldWares is
   Select
    ID From Wares
   Where  Close_Format = 1;
    
  IDs Integer;
  DateInterval Integer;
  LastProcessDate Date;
  NewRemainder Wares.remainder%type;
  NewBalancePrice Wares.balance_price%type;
  OldWaresCursor OldWares%rowtype;
  
Begin
 SB_ACA.CheckObjectAccess('transaction','insert');  --adm
   DateInterval :=CalcDate - GetLastCalculateDate;

   For  OldWaresCursor In OldWares
   loop
   IDs :=OldWaresCursor.ID;
    CheckForCalculate(IDs,CalculateDays,NewBalancePrice,NewRemainder);
     update Wares
      set
        Remainder =NewRemainder
       ,Balance_price = NewBalancePrice       
       ,TaxAmort =(CalculateDays*TaxPercentPrice*Tax)/(36000)
       ,Amort_Date = CalcDate
      where ID = IDs;
     commit;
   --  dbms_output.put_line('NewRemainder= '||to_char(NewRemainder)||' '||'NewBalancePrice='||to_char(NewBalancePrice));
     
     Update Wares
      set      
       AllAmort = AllAmort + NewRemainder
      ,AllTaxAmort = AllTaxAmort +TaxAmort 
      where  ID = IDs;
     commit;
              
    add_MFTraffics(IDs); --for traffic every thing                   
   
   end loop;    
End;

           
procedure  CalculateNewWares(
                     CalcDate IN Date
                            )
Is
  cursor  NewWares is
   Select
    ID From Wares
   Where  Close_Format = 0;
    
  IDs Integer;
  DateInterval Integer;
  LastProcessDate Date;
  NewWaresCursor NewWares%RowType;
begin
  for NewWaresCursor in NewWares
   loop    
   IDs :=NewWaresCursor.ID;
      
      Select  
          Inventar_Date Into LastProcessDate
      From  Wares
      Where ID = IDs;
                     
     DateInterval :=CalcDate - LastProcessDate;
          
     update Wares
      set
        Remainder =(DateInterval*First_Price*Amort)/(36000)           
       ,TaxAmort =(DateInterval*TaxPercentPrice*Tax)/(36000) 
       ,Amort_date = CalcDate
     Where ID = IDs;
     commit;
     
     Update Wares
      set
        Close_Format = 1
       ,Balance_price = First_price - (AllAmort + Remainder)          
       ,Allamort = AllAmort + Remainder
       ,AllTaxAmort = AllTaxAmort + TaxAmort
      where  ID = IDs;
     commit;
          
     add_MFTraffics(IDs); --for traffic every thing                
   
   end loop;
end;




 procedure add_wares(
        v_groupsID       number
      , v_name           varchar 
      , v_inventar       varchar
      , v_inventar_date  date
      , v_first_price    number
      , v_balance_price  number
      , v_in_date        date
      , v_in_num         number
      , v_amort          number
      , v_producer_plane varchar
      , v_fxm            number
      , v_sector_cod     number
      , v_remainder      number 
      , v_allamort       number
      , v_taxamort       number
      , v_alltaxamort    number
      , v_tax            number)
 is 
  CloseFormat Wares.close_format%type;
  begin
   SB_ACA.CheckObjectAccess('MAINFACILITIES','insert');  --adm
   if (v_first_price <> 0) and  (v_balance_price <> 0) and (v_allamort <> 0) then
     CloseFormat :=1; --Old wares
   end if;  
   if (v_allamort = 0) or (v_first_price = v_balance_price) then
     CloseFormat :=0; --New wares
   end if; 
   if (v_first_price = v_allamort) or (v_balance_price = 0) then 
     CloseFormat :=2; --Can  take off ,Can't calculate amortization 
   end if;  
    Insert into Wares(
      groupsID,
      name, 
      inventar,
      inventar_date,
      first_price,
      balance_price,
      in_date,
      in_num,
      amort,
      producer_plane,
      fxm,
      sector_cod,
      close_format,
      remainder,
      allamort,
      taxamort,
      alltaxamort,
      tax,
      taxpercentprice )
    Values(
      v_groupsID,
      v_name, 
      v_inventar,
      v_inventar_date,
      v_first_price,
      v_balance_price,
      v_in_date,
      v_in_num,
      v_amort,
      v_producer_plane,
      v_fxm,
      v_sector_cod,
      CloseFormat, 
      v_remainder,
      v_allamort,
      v_taxamort,
      v_alltaxamort,
      v_tax,
      v_balance_price);
  commit;
  end;    
 
 procedure upd_wares(
      v_id             number, 
      v_name           varchar, 
      v_inventar       varchar,
      v_inventar_date  date,
      v_first_price    number,
      v_balance_price  number,
      v_in_date        date,
      v_in_num         number,
      v_amort          number,
      v_producer_plane varchar,
      v_fxm            number,
      v_sector_cod     number,
      v_allamort       number,
      v_tax            number
                      )
  is
   CloseFormat number;
  begin
   SB_ACA.CheckObjectAccess('MAINFACILITIES','update');  --adm    
   if (v_first_price <> 0) and  (v_balance_price <> 0) and (v_allamort <> 0) then
     CloseFormat :=1; --Old wares
   end if;
   if (v_allamort = 0) or (v_first_price = v_balance_price) then
     CloseFormat :=0; --New wares
   end if;  
   if (v_first_price = v_allamort) or (v_balance_price = 0) then 
     CloseFormat :=2; --Can  take off ,Can't calculate amortization 
   end if;
    Update Wares
    set 
      name = v_name, 
      inventar = v_inventar,
      inventar_date = v_inventar_date,
      first_price = v_first_price,
      balance_price = v_balance_price,
      in_date = v_in_date,
      in_num = v_in_num,
      amort = v_amort,
      producer_plane = v_producer_plane,
      fxm = v_fxm,
      sector_cod = v_sector_cod,
      allamort = v_allamort,
      tax = v_tax,
      close_format = CloseFormat
  Where 
      ID = v_id;       
  commit;
  end;
  
  
  procedure delete_wares(v_id number)
  is 
  begin
   SB_ACA.CheckObjectAccess('MAINFACILITIES','delete');  --adm
   Delete from Wares 
          Where ID=v_id;         
   Delete from Archive_Wares1
          Where ID=v_id;
   Delete from MFTraffics
          Where ID=v_id;  
   Delete from Moderned_Wares
          Where ID=v_id;  
   Delete from Repaired_Wares
          Where ID=v_id;                      
   commit;        
  end;
  
  procedure add_close_month(v_month date)
  is
  begin
   Insert into Close_month(month)
          values(v_month); 
   commit;                           
  end; 
   
  procedure add_departments(v_department varchar)
  is
  begin
   Insert into Departments(department)
          values (v_department);
  commit;             
  end;
  
  
  procedure add_moderned_wares(v_id number,v_groupsID number,v_modern_num number,v_modern_summa number,v_modern_date date)
  is
  begin
   Insert into Moderned_wares(id,groupsID,modern_num,modern_summa,modern_date)
               Values(v_id,v_groupsID,v_modern_num,v_modern_summa,v_modern_date);
  commit;              
  end; 
 
  procedure delete_moderned_wares(v_id number)
  is
  begin
   Delete From Moderned_wares
    where id=v_id;  
  commit;
  end;
  
  procedure add_repaired_wares(v_id number,v_groupsID number,v_repair_num number,v_repair_summa number,v_repair_date date)
  is
  begin
   Insert into Repaired_wares(id,groupsID,repair_num,repair_summa,repair_date)
               Values(v_id,v_groupsID,v_repair_num,v_repair_summa,v_repair_date);   
  commit;
  end;
  
  procedure delete_repaired_wares(v_id number)
  is
  begin
   Delete From Repaired_wares
    where id=v_id;  
  commit;
  end;
  
 Function  GetCurrentID return Number
 Is
 TakedID Wares.ID%Type;
 Begin
    Select  SEQ_Wares.Currval Into	TakedID
		     From dual;
	return  TakedID; 			   							
 End;
  
  procedure add_groups(v_name varchar,v_amort number,v_main_account varchar,v_exp_account varchar,v_amort_account varchar,v_sale_account varchar,v_taxamort number)
  is 
  begin
  SB_ACA.CheckObjectAccess('MAINFACILITIES','insert');  --adm
   Insert into Groups(name,amort,main_account,exp_account,amort_account,sale_account,taxamort)
     Values(v_name,v_amort,v_main_account,v_exp_account,v_amort_account,v_sale_account,v_taxamort);
  commit;          
  end;
  
  procedure upd_groups(v_id number,v_name varchar,v_amort number,v_main_account varchar,v_exp_account varchar,v_amort_account varchar,v_sale_account varchar,v_taxamort number)
  is
  begin
  SB_ACA.CheckObjectAccess('MAINFACILITIES','update');  --adm 
   UpDate Groups
   set name = v_name
      ,amort = v_amort
      ,main_account = v_main_account
      ,exp_account = v_exp_account
      ,amort_account = v_amort_account
      ,sale_account = v_sale_account
      ,taxamort = v_taxamort
  where id=v_id;
  commit;        
  end;
   
  procedure delete_MainGroup(v_ID Groups.id%type)
  is
  begin
   SB_ACA.CheckObjectAccess('MAINFACILITIES','delete');  --adm
   Delete from Groups
   Where id=v_id;
   commit;
  end;
  
  procedure add_archive_wares1(
      v_id number, 
      v_groupsID       number,
      v_name           varchar2, 
      v_inventar       varchar2,
      v_inventar_date  date,
      v_first_price    number,
      v_balance_price  number,
      v_in_date        date,
      v_out_date       date, 
      v_in_num         number,
      v_out_num        number, 
      v_amort          number,
      v_allamort       number,
      v_producer_plane varchar2,
      v_fxm            number,
      v_sector_cod     number,
      v_cause_out      varchar2,
      v_modern_date       date,
      v_modern_summa   number,
      v_modern_num     number,
      v_repair_date    date,
      v_repair_summa   number,
      v_repair_num     number,
      v_amort_date     date     
       )
    is
    begin
     SB_ACA.CheckObjectAccess('MAINFACILITIES','delete');  --adm
     SB_ACA.CheckObjectAccess('transactions','insert');  --adm
    Insert into Archive_Wares1(
      ID,
      groupsID,
      name, 
      inventar,
      inventar_date,
      first_price,
      balance_price,
      in_date,
      out_date,
      in_num,
      out_num,
      amort,
      allamort,
      producer_plane,
      fxm,
      sector_cod,
      cause_out,
      modern_date,
      modern_summa,
      modern_num,
      repair_date,
      repair_summa,
      repair_num,
      amort_date     
       )
      Values(
      v_id,
      v_groupsID,
      v_name, 
      v_inventar,
      v_inventar_date,
      v_first_price,
      v_balance_price,
      v_in_date,
      v_out_date,
      v_in_num,
      v_out_num,
      v_amort,
      v_allamort, 
      v_producer_plane,
      v_fxm,
      v_sector_cod,
      v_cause_out,
      v_modern_date,
      v_modern_summa,
      v_modern_num,
      v_repair_date,
      v_repair_summa,
      v_repair_num,
      v_amort_date);
    commit;
    end;
  
 procedure add_MFTraffics(v_id number)  
 is
 begin
  Insert into MFTraffics
  Select id, groupsid, 
          name, inventar,
          inventar_date,
          first_price,
          balance_price, 
          allamort,
          remainder, 
          amort,
          amort_date
  from Wares
   where id = v_id;                       
   
  commit;      
  end;

procedure DropTable(v_TableName in varchar)
is
 TableName varchar(20);
 StrSql varchar(20);
begin
 TableName :=v_TableName;
 StrSql :='Drop Table'||' '||TableName;
 dbms_output.put_line(StrSql);
 
 Execute immediate StrSql; 

end;

 procedure sumGroupDetails(IDGroups in number,FirstPrice in out number,BalancePrice in out number,AllAmort in out number,Remainder in out number)
 is
 begin
  Select
    sum(First_Price) 
    ,sum(Balance_Price)
     ,sum(AllAmort)
      ,sum(Remainder)
  Into FirstPrice,BalancePrice,AllAmort,Remainder   
  From 
   Wares
  Where 
   GroupsID = IDGroups;

 Exception When NO_DATA_FOUND Then
  begin
   FirstPrice :=0;
   BalancePrice :=0;
   AllAmort :=0;
   Remainder :=0;
  end; 
  -- dbms_output.put_line('FirstPrice '||TO_CHAR(FirstPrice));
 end; 
 
 procedure SumGroupDetailsForTax(IDGroups in number,FirstPrice in out number,BalancePrice in out number,AllTaxAmort in out number,TaxAmort in out number)
 is
 begin
  Select
    sum(First_Price) 
    ,sum(TaxPercentPrice)
     ,sum(AllTaxAmort)
      ,sum(TaxAmort)
  Into FirstPrice,BalancePrice,AllTaxAmort,TaxAmort
  From 
   Wares
  Where 
   GroupsID = IDGroups;

 Exception When NO_DATA_FOUND Then
  begin
   FirstPrice :=0;
   BalancePrice :=0;
   AllTaxAmort :=0;
   TaxAmort :=0;
  end; 
  -- dbms_output.put_line('FirstPrice '||TO_CHAR(FirstPrice));
 end; 

 
 procedure sumModernedWares(IDGroups in number, ModernSumma in out number)
 is
 begin
  Select sum(modern_summa) Into ModernSumma
   From Moderned_Wares   
    Where GroupsID = IDGroups;  
 
  Exception When NO_DATA_FOUND Then
   begin
    ModernSumma :=0;
   end;    
 end;
 
 Procedure sumRepairedWares(IDGroups in number ,RepairSumma in out number)
 is
 begin
  Select sum(repair_summa) Into RepairSumma
   From Repaired_Wares
    Where GroupsID = IDGroups;  
 
  Exception When NO_DATA_FOUND Then
   begin
    RepairSumma :=0;
   end;      
 end;
 
 Procedure SetNewSettings(NewDate date )
 is
  CurrentDate date;
  CurrentYear number; 
 Begin
 SB_ACA.CheckObjectAccess('MAINFACILITIES','update');  --adm
    open C_CurrentYear;  
     fetch C_CurrentYear into CurrentDate;
    close C_CurrentYear;
    if NewDate <= CurrentDate then
      raise_application_error(-20098,'New date must be greater than current date');
    else
     begin 
       Update MF_Close_Year set
        last_year = current_year
       ,current_year = NewDate;
       commit;
      Update Wares set
       TaxPercentPrice = Balance_Price;
      commit;     
     end;
    end if;
 End;   
    
 function GetCurrentYear return date
 is
  PresentDate Date;  
 begin
   open C_CurrentYear;  
    fetch C_CurrentYear into PresentDate;
   close C_CurrentYear;
   return PresentDate;  	
 end;

 function  GetPresentDate return Date
 is
  PresentDate Date;  
 begin
  Select TEK_DAT Into PresentDate From SYSDAT;
	return PresentDate;	
 end;
 
 procedure SetTransactions(v_TransactionID number,v_GroupsID number)
 is
 begin
  --For  get main Transactions
  Insert into MF_Transactions(
                    TransactionID 
                   ,GroupsID )
         values
               (v_TransactionID
               ,v_GroupsID );     
 commit;   
 end;
 
 function GetTransactions
          (
           v_GroupsID Wares.groupsid%type--0 all wares
          ,v_BeginDate date
          ,v_EndDate date
          ) return varchar
 is 
  BeginDate  date;
  EndDate  date;
  GroupFilter  varchar(100);
  SelectStr  varchar(500);
  FromStr varchar(200);
  WhereStr  varchar(300);
  OrderByStr varchar(100);
  StrSql varchar(1500);
 begin
   BeginDate := v_BeginDate;
   EndDate := v_EndDate; 
   if v_GroupsID = 0 then
    GroupFilter :=' ';
   else
    GroupFilter:=' and MFTransactions.GroupsID='||to_char(v_GroupsID);
   end if;
   OrderByStr :=' Order by Transactions.Dat';
   WhereStr :=' Where '||
                  'Transactions.Debt = Debit.ID and Transactions.Kredit = Credit.ID and '|| 
                  'Transactions.ID = MFTransactions.TransactionID and '|| 
                  'Transactions.Dat>='||''''||to_char(BeginDate)||''''||' and '||
                  'Transactions.Dat<='||''''||to_char(EndDate)||''''||' and '||
                  'Transactions.Val_acc = DebitCurrency.Valute and '||
                  'Transactions.CurrencyID_C = CreditCurrency.Valute';
   SelectStr :='Select Distinct Debit.acc_no DAccount,DebitCurrency.Val_name DebitCurrency,'||
                  'Credit.acc_no CAccount,CreditCurrency.Val_name CreditCurrency,Transactions.*';
   FromStr :=' From Provarch Transactions, MF_Transactions MFTransactions ,'||
                  'Account Debit ,Account Credit,Avalute DebitCurrency,Avalute CreditCurrency ';  
   
   StrSql :=SelectStr||FromStr||WhereStr||GroupFilter||OrderByStr;
   --update a1 set c5=StrSql;
   Return StrSql;
   
 end;         

 Procedure OpenCursor(ACursor IN OUT  C_TransactionCursor, V_StrParam IN VarChar2) 
 is
 begin
  if  ACursor%isOpen  then
   close ACursor;
  end if;  
  Open ACursor For V_StrParam;  
 end;         
  
 Function CheckForTakeOff(v_ID number) return boolean
 is
  CloseFormat number;
  isTakeOff boolean;
 begin
  Select Close_format 
       into  CloseFormat           
  from Wares 
  where ID = v_ID;
  isTakeOff :=(CloseFormat = 2);
  return isTakeOff;
 end;
 
 procedure StopCalculate(ObjectID number)
 is
 begin
 -- This function is not properly ended
  if ObjectID =-1 then
   Update Wares
     set
      Close_format =2
     where Balance_price =0;  
   commit;
  else 
   Update Wares
    set
      Close_format =2
     where ID = ObjectID;  
   commit;
  end if;     
 end; 
 
 function GetDepartmentName(DepartmentID number) return varchar
 is
  DepartmentName  varchar(200);
 begin
  Select Department into DepartmentName
   from Departments
  where ID =DepartmentID;
  return DepartmentName;
  Exception When NO_DATA_FOUND Then
  return '';   
 end;
 
 function GetAccountNumber(AccountID number) return varchar
 is 
  AccountNumber account.acc_no%type;
 begin
  Select acc_no into AccountNumber from Account
   where ID = AccountID;
  return AccountNumber; 
  Exception When NO_DATA_FOUND Then
  return '';
 end;
 
 function GetAccountID(AccountNumber varchar) return number
 is 
  AccountID account.ID%type;
 begin
  Select ID into AccountID from Account
   where acc_no = AccountNumber;
  return AccountID; 
  Exception When NO_DATA_FOUND Then
   return 0;
 end;
 
 function GetLastCalculateDate return date
 is
  LastCalculateDate date;
 begin
  select
    month into LastCalculateDate 
  from
   Close_month
  where month_ID=
    (select
       max(month_ID)
     from Close_month
     );
  return LastCalculateDate;
 end;
 
 procedure TempTaxUpdate(v_ID number,v_TaxPercentPrice number,v_AllTaxAmort number)
 is
 begin
  Update Wares set
	 TaxPercentPrice = v_TaxPercentPrice
	,AllTaxAmort = v_AllTaxAmort
	where ID = v_ID;
	commit; 
 end;
 
 function DifferenceReport return varchar
 is
  SelectStr varchar(1000);
  FromStr varchar(500);
  WhereStr varchar(500);
  GroupByStr varchar(100);
  OrderByStr varchar(100);
  StrSql varchar(1500);
 begin
   SelectStr :='Select 
                 MainGroup.ID,
                 max(MainGroup.main_account) as mainacc,
                 max(MainAccount.bal_cn1 )as balcn,
                 max(MainGroup.Name) as name,
                 sum(MainWares.AllAmort) as AllAmort,
                 sum(MainWares.AllTaxAmort) as AllTaxAmort ';
   FromStr :='From Groups MainGroup ,Wares MainWares ,Account MainAccount ';
   WhereStr :='Where MainGroup.ID = MainWares.GroupsID and '||
                   'MainGroup.main_account = MainAccount.ID ';
   GroupByStr :='Group by MainGroup.ID ';
   OrderByStr :='Order by balcn';             
               
   StrSql :=SelectStr||FromStr||WhereStr||GroupByStr||OrderByStr;

  commit;
  return strsql;
 end;

function CheckID(v_ID number) return boolean
is
 Result boolean;
 FirstPrice Wares.first_price%type;
 BalancePrice Wares.balance_price%type; 
begin
 Select 
    first_price, balance_price 
	into
		FirstPrice, BalancePrice  
  from Wares 
	where ID = v_ID;

 Result :=BalancePrice<=(FirstPrice*0.05);
 return Result;
end; 

function GetGroupName(groupID number) return Groups.name%type
is
 Result Groups.name%type; 
begin
 select name into Result from groups where id=groupID;
 return result;
end;

function GetAccountbalance(accid number) return number
is
  result number;
begin
 select bal_cn1 into result from account where id=accid;
 return result;
end;  
END;
/


-- End of DDL Script for Package SMART.SB_MAIN_FACILITIES


