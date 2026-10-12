-- Start of DDL Script for Package Body SMART.SB_MAIN_FACILITIES
-- Generated 23-Mar-2003 11:52:21 from SMART@ORAWIN

CREATE OR REPLACE 
PACKAGE sb_main_facilities 
is
  procedure delete_groups(v_id number); 
   procedure delete_wares(v_id number);
   procedure add_departments(v_department varchar);
   procedure add_interchange(v_givenID number,v_givenName varchar,v_givenInventar varchar,v_givenSumma number,
                          v_takenID number,v_takenName varchar,v_takenInventar varchar,v_takenSumma number,v_ChangeDate date);
  
  procedure add_close_month(v_month date);
  procedure add_moderned_wares(v_id number,v_groupsID number,v_modern_num number,v_modern_summa number,v_modern_date date);
  procedure add_repaired_wares(v_id number,v_groupsID number,v_repair_num number,v_repair_summa number,v_repair_date date);
  procedure delete_repaired_wares(v_id number);
  procedure delete_moderned_wares(v_id number); 
  procedure upd_balance_price2(InventarDay date,NextDay date,balance_price number);
  procedure upd_balance_price1(LastDay date,Nextday date);
  procedure  CalculateNewWares(
                    -- LastProcessDate IN Date
                    CalcDate IN Date
                    );
  procedure  CalculateOldWares(
            CalcDate IN Date 
           );
  procedure add_MFTraffics(v_id number);
  procedure add_groups(v_name varchar,v_amort number,v_main_account varchar,v_exp_account varchar,v_amort_account varchar,v_sale_account varchar,v_taxamort number);
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
      , v_close_format   number
      , v_remainder      number 
      , v_allamort       number
      , v_taxamort       number
      , v_alltaxamort    number
      , v_tax            number);
  Function  GetTakedID return Number;
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
      v_repair_num     number     
       );
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY sb_main_facilities
IS

procedure  CalculateOldWares(
            CalcDate IN Date 
           )
Is      
  cursor  OldWares is
  Select
    ID From Wares
  Where  Close_Format = 1;
    
  IDs Integer;
  OldBalancePrice Number;
  DateInterval Integer;
  LastProcessDate Date;
  a OldWares%rowtype;
Begin
  
   Select  
       Month    Into LastProcessDate
    From  Close_Month
    Where  
        Month_ID = (Select Max(Month_ID) From Close_Month);
    DateInterval :=CalcDate - LastProcessDate;
    
   For  a In OldWares
   loop
   IDs :=a.ID;
   dbms_output.put_line('ID= '||TO_CHAR(IDs));
    
        Select
          Balance_Price Into OldBalancePrice
          From  Wares
          Where ID=IDs;    
                                  
    --  dbms_output.put_line('ID= '||TO_CHAR(IDs));
          
     update Wares
     set
     --Balance_Price = Balance_Price-(DateInterval*First_Price*Amort)/(36000)
        Remainder =(DateInterval*First_Price*Amort)/(36000)      
     --,TaxAmort =(DateInterval*Balance_Price*Amort)/(36000)
       ,Amort_Date = CalcDate
     where ID = IDs;
     
   --dbms_output.put_line('OldBalancePrice '||TO_CHAR(OldBalancePrice));
     
     commit;
     
     Update Wares
      set      
    -- Remainder =OldBalancePrice - Balance_Price
       Balance_price = First_price - (Allamort + Remainder)
      ,Allamort = Allamort + Remainder
   -- ,TaxAmort =(DateInterval*(First_price - (Allamort + Remainder))*Amort)/(36000)
   -- ,AllTaxAmort = AllTaxAmort + (DateInterval*(First_price - (Allamort + Remainder))*Amort)/(36000)
      where  ID = IDs;
    commit;
    
    Update Wares
     set
      TaxAmort =(DateInterval*Balance_Price*Tax)/(36000)  
     ,AllTaxAmort =AllTaxAmort + (DateInterval*Balance_Price*Tax)/(36000)
     where ID = IDS;
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
  OldBalancePrice Number;
  DateInterval Integer;
  LastProcessDate Date;
  NewWaresCursor NewWares%RowType;
begin
  for NewWaresCursor in NewWares
   loop    
   IDs :=NewWaresCursor.ID;
      
      Select
         Balance_Price Into OldBalancePrice
      From  Wares
      Where ID=IDs;
      
      Select  
          Inventar_Date Into LastProcessDate
      From  Wares
      Where ID = IDs;
                     
     DateInterval :=CalcDate - LastProcessDate;
          
     update Wares
     set
     --Balance_Price = Balance_Price-(DateInterval*First_Price*Amort)/(36000)
        Remainder =(DateInterval*First_Price*Amort)/(36000)           
     --,taxamort =(DateInterval*Balance_Price*Amort)/(36000) 
       ,Amort_date = CalcDate
     Where ID = IDs;
     commit;
     
     Update Wares
      set
     -- Close_Format = 1
     --,Remainder = OldBalancePrice - Balance_Price
        Balance_price = First_price - (AllAmort + Remainder)          
       ,Allamort = AllAmort + Remainder
    --,AllTaxAmort = AllTaxAmort + TaxAmort
      where  ID = IDs;
     commit;
     
    Update Wares
     set
      Close_format = 1
     ,TaxAmort = (DateInterval*Balance_Price*Tax)/(36000)
     ,AllTaxAmort = AllTaxAmort + (DateInterval*Balance_Price*Tax)/(36000)    
     where ID = IDs;
     
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
      , v_close_format   number
      , v_remainder      number 
      , v_allamort       number
      , v_taxamort       number
      , v_alltaxamort    number
      , v_tax            number)
 is 
  begin
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
      tax         )
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
      v_close_format,
      v_remainder,
      v_allamort,
      v_taxamort,
      v_alltaxamort,
      v_tax);
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
  begin
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
      tax = v_tax
  Where ID = v_id;       
  commit;
  end;
  
  
  procedure delete_wares(v_id number)
  is 
  begin
   Delete from Wares 
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
  
  procedure add_interchange(v_givenID number,v_givenName varchar,v_givenInventar varchar,v_givenSumma number,
                          v_takenID number,v_takenName varchar,v_takenInventar varchar,v_takenSumma number,v_ChangeDate date)
  is
  begin
   Insert into InterChange(givenID,givenName,givenInventar,givenSumma,
                           takenID,takenName,takenInventar,takenSumma,ChangeDate)   
   
   Values(v_givenID,v_givenName,v_givenInventar,v_givenSumma,
          v_takenID,v_takenName,v_takenInventar,v_takenSumma,v_ChangeDate);
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
  
 Function  GetTakedID return Number
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
   Insert into Groups(name,amort,main_account,exp_account,amort_account,sale_account,taxamort)
     Values(v_name,v_amort,v_main_account,v_exp_account,v_amort_account,v_sale_account,v_taxamort);
  commit;          
  end;
  
  procedure upd_groups(v_id number,v_name varchar,v_amort number,v_main_account varchar,v_exp_account varchar,v_amort_account varchar,v_sale_account varchar,v_taxamort number)
  is
  begin
   UpDate Groups
   set name = v_name,
       amort = v_amort,
       main_account = v_main_account,
       exp_account = v_exp_account,
       amort_account = v_amort_account,
       sale_account = v_sale_account,
       taxamort = v_taxamort
  where id=v_id;
  commit;        
  end;
  
  procedure upd_balance_price1(LastDay date,Nextday date)
  is
   count_day integer;
   Old_balance_price integer;
  begin
   count_day:=to_date(NextDay)-to_date(LastDay);
   old_balance_price:=100;
    Update Wares
    set balance_price=balance_price-(count_day*balance_price*amort)/(36500)
    where close_format=1;
   commit;
    Update Wares
    set remainder=Old_balance_price-balance_price
    where close_format=1;
    commit;   
  end;
  
  procedure upd_balance_price2(InventarDay date,NextDay date,balance_price number)
  is
    count_day integer;
    Old_balance_price integer;
  begin
   count_day:=to_date(NextDay)-to_date(InventarDay);
   old_balance_price:=balance_price;
  UpDate Wares
  set
   balance_price=balance_price-count_day*(balance_price*(amort/365))/100;
  commit;
  Update Wares
  set remainder=Old_balance_price-balance_price;
  commit;
  Update  Wares
  set
   close_format = 1;
  commit;
  end;
  
  procedure delete_groups(v_id number)
  is
  begin
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
      v_repair_num     number     
       )
    is
    begin
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
      repair_num     
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
      v_repair_num);
    commit;
    end;
  
 procedure add_MFTraffics(v_id number)  
 is
 begin
  Insert into MFTraffics
  Select id, groupsid, name, inventar, inventar_date,
                  first_price,
                        balance_price, allamort, remainder, amort,amort_date
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

END;
/


-- End of DDL Script for Package Body SMART.SB_MAIN_FACILITIES


