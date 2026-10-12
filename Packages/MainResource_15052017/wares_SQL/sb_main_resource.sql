-- Start of DDL Script for Package SMART.SB_MAIN_RESOURCE
-- Generated 7-Dec-2006 10:06:22 from SMART@SB

CREATE OR REPLACE 
PACKAGE smart.sb_main_resource
  IS

  procedure Delete_Wares(v_wares_id number);
  function get_date
  return sysdat.tek_dat%type;
  PROCEDURE settransaction (
      v_debitid    NUMBER,
      v_creditid   NUMBER,
      v_amount     NUMBER,
      v_trname     VARCHAR2
   );
  procedure Delete_Groups(v_ID Groups.id%type);
  function Enable_Delete_Groups(v_groups_id number) return
boolean;
  function GetAccountNumber(AccountID number) return varchar;
  function GetAccountID(AccountNumber varchar) return number;
  procedure add_groups(v_name varchar,
                       v_amort number,
                       v_main_account number default 0,
                       v_exp_account number,
                       v_amort_account number,
                       v_sale_account number default 0,
                       v_taxamort number);
  PROCEDURE settrans_out (
      v_debitid    NUMBER,
      v_creditid   NUMBER,
      v_amount     NUMBER,
      v_trname     VARCHAR2
   );
  procedure  update_wares_trans(v_id number,
                               v_debt_acc varchar2,
                               v_cred_acc varchar2 );
  procedure  update_wares_trans_out(v_id number,
                               v_debt_acc varchar2,
                               v_cred_acc varchar2 );
  procedure wares_all_transaction;
  procedure Calculate_Wares(Calc_Date date);
  procedure Sum_For_Group_Params(
v_amort_date              in   date,
v_groups_id               in   groups.id%type,
v_sum_first_price        out   wares_all.first_price%type,
v_sum_remainder          out   wares_all.remainder%type,
v_sum_all_amort          out   wares_all.all_amort%type,
v_sum_amort              out   wares_all.amort%type,
v_sum_tax_first_price    out   wares_all.first_price%type,
v_sum_tax_remainder      out   wares_all.remainder%type,
v_sum_tax_all_amort      out   wares_all.all_amort%type,
v_sum_tax_amort          out   wares_all.amort%type
);
  procedure stop_calculate(status varchar2,v_id number);
  procedure Keep_After_Calc;
  procedure Keep_Before_Calc;
  function bankdaysbetween (firstdate in date, lastdate in date)
      return integer;
  function current_amort_date return date;
  function first_amort_date return date;
  function last_amort_date(v_date in date) return date;
  function get_view_turn_sql(v_beg_date in date ,v_end_date in date)
return varchar2;
  procedure restore_calculate;
  procedure calculate_wares_for_day(calc_date date);
  procedure repair_wares;
  function last_calc_date return date;
  procedure upd_groups(v_id            number,
                       v_name          varchar2,
                       v_amort         number,
                       v_main_account  integer,
                       v_exp_account   integer,
                       v_amort_account integer,
                       v_sale_account  integer,
                       v_taxamort number);

  procedure new_wares_trans_acc(
                              v_groups_id    in  integer,
                              v_main_account out integer,
                              v_sale_account out integer);
  procedure new_wares_transaction(
                                v_groups_id   integer,
                                v_debt_amount number,
                                v_cred_acc    number,
                                v_debt_acc    number,
                                v_trans_name  varchar2
                                );
  procedure set_transaction_new (
      v_debitid    number,
      v_creditid   number,
      v_amount     number,
      v_trname     varchar2
   );
  procedure add_wares(
                     v_wares_name        varchar2,
                     v_inventar_date     date,
                     v_groups_id         number,
                     v_first_price       number,
                     v_remainder         number,
                     v_amort             number,
                     v_all_amort         number,
                     v_percent           number,
                     v_tax_first_price   number,
                     v_tax_remainder     number,
                     v_tax_amort         number,
                     v_tax_all_amort     number,
                     v_tax_percent       number,
                     v_amort_date        date,
                     v_fxm               number default null,
                     v_keeping_sec       varchar2 default null,
                     v_inventar_no       varchar2 default null,
                     v_user_name         varchar2 default null
                    );
  procedure update_wares(
                     v_wares_name        varchar2,
                     v_wares_id          number,
                     v_inventar_date     date,
                     v_first_price       number,
                     v_remainder         number,
                     v_amort             number,
                     v_all_amort         number,
                     v_tax_first_price   number,
                     v_tax_remainder     number,
                     v_tax_amort         number,
                     v_tax_all_amort     number,
                     v_amort_date        date,
                     v_fxm               number,
                     v_keeping_sec       varchar2 default null,
                     v_inventar_no       varchar2 default null,
                     v_user_name         varchar2 default null
                        );
  procedure deleted_wares_trans(
                                v_groups_id   integer,
                                v_debt_amount number,
                                v_cred_acc    number,
                                v_debt_acc    number,
                                v_trans_name  varchar2
                                );
  procedure del_wares_trans_acc(
                              v_groups_id    in  integer,
                              v_main_account out integer,
                              v_sale_account out integer);
END;
/


CREATE OR REPLACE 
PACKAGE BODY smart.sb_main_resource
IS
procedure keep_before_calc
is
begin
  insert into wares_first
  select
  wares_name, wares_id, inventar_date, groups_id, first_price, remainder,
  amort, all_amort, percent, tax_first_price, tax_remainder, tax_amort,
  tax_all_amort, tax_percent, close_format, amort_date,tax_close_format,inventar_no
  from
  wares_all;
  exception when others then
  raise_application_error(-20007,'Bu tarixe hesablamaq olmaz!!!!');

end;

procedure keep_after_calc
is
begin
  insert into wares_last
  select
  wares_name, wares_id, inventar_date, groups_id, first_price, remainder,
  amort, all_amort, percent, tax_first_price, tax_remainder, tax_amort,
  tax_all_amort, tax_percent, close_format, amort_date,tax_close_format,inventar_no
  from
  wares_all;
   exception when others then
  raise_application_error(-20007,'Bu tarixe hesablamaq olmaz!!!!');
  
end;


function getaccountnumber(AccountID number) return varchar
is 
AccountNumber account.acc_no%type;
begin
 Select acc_no into AccountNumber from Account
  where ID = AccountID;
return AccountNumber; 
Exception When NO_DATA_FOUND Then
return '';
end;

 function getaccountid(AccountNumber varchar) return number
 is 
  AccountID account.ID%type;
 begin
  Select ID into AccountID from Account
   where acc_no = AccountNumber;
  return AccountID; 
  Exception When NO_DATA_FOUND Then
   return 0;
 end;

function get_date
  return sysdat.tek_dat%type
  as
    currdate   sysdat.tek_dat%type;
  begin
    select tek_dat
      into currdate
      from sysdat;
    return currdate;
  end;

  procedure add_groups(v_name varchar,
                       v_amort number,
                       v_main_account number default 0,
                       v_exp_account number,
                       v_amort_account number,
                       v_sale_account number default 0,
                       v_taxamort number)
  is 
  begin
   Insert into Groups(name,
                      amort,
                      main_account,
                      exp_account,
                      amort_account,
                      sale_account,
                      taxamort)
               Values(v_name,
                      v_amort,
                      v_main_account,
                      v_exp_account,
                      v_amort_account,
                      v_sale_account,
                      v_taxamort);
  commit;          
  end;

  procedure upd_groups(v_id            number,
                       v_name          varchar2,
                       v_amort         number,
                       v_main_account  integer,
                       v_exp_account   integer,
                       v_amort_account integer,
                       v_sale_account  integer,
                       v_taxamort number)
  is 


  begin

   update groups set
                     name=v_name,
                      amort=v_amort,
                      main_account=v_main_account,
                      exp_account=v_exp_account,
                      amort_account=v_amort_account,
                      sale_account=v_sale_account,
                      taxamort=v_taxamort
              where id = v_id;        
  commit;          
  end;
  
  
  
  
procedure delete_wares(v_wares_id number)
is
begin
delete from wares_last where wares_id in (v_wares_id);
delete from wares_first where wares_id in (v_wares_id);
delete from wares_all where wares_id in (v_wares_id);


commit;
end;

function enable_delete_groups(v_groups_id number) return
boolean
is
Cursor c is select Count(*) as 
          CountWares from wares_all where groups_id=v_groups_id;
rc c%rowtype; 

b boolean;
begin
b:=true;
       open c;
       fetch c into rc;
       close c;
       
    if rc.CountWares=0 then 
    b:=true;
    else
    b:=false;
    end if;   
return b;
end;

  procedure delete_groups(v_ID Groups.id%type)
  is
  begin
   Delete from Groups
   Where id=v_id;
   commit;
  end;
procedure update_wares(
                     v_wares_name        varchar2, 
                     v_wares_id          number,                     
                     v_inventar_date     date, 
                     v_first_price       number,
                     v_remainder         number, 
                     v_amort             number, 
                     v_all_amort         number, 
                     v_tax_first_price   number,
                     v_tax_remainder     number, 
                     v_tax_amort         number, 
                     v_tax_all_amort     number, 
                     v_amort_date        date,
                     v_fxm               number, 
                     v_keeping_sec       varchar2 default null,
                     v_inventar_no       varchar2 default null,
                     v_user_name         varchar2 default null
                        )
                        is
p_close_format number;
p_tax_close_format number;


begin
           if v_first_price=v_remainder then
           p_close_format:=0;
           end if;

           if (v_first_price<>v_remainder) and (v_remainder>0) then
           p_close_format:=1;
           end if;
           
           if v_remainder=0 then
           p_close_format:=2;
           end if;
           
       
     if (v_first_price = v_tax_remainder) and
           (v_first_price = v_tax_first_price) then
     p_tax_close_format:=0;
     end if;
        
               if  v_first_price>v_tax_remainder then
               p_tax_close_format:=1;
               end if;
                                 
            if  (v_tax_first_price=0) 
                        or (v_tax_remainder=0)
                    then
                   p_tax_close_format:=2;
                 end if;              
       
update wares_all
set
wares_name=v_wares_name,
user_name=v_user_name,
inventar_date=v_inventar_date, 

first_price=v_first_price,
remainder=v_remainder, 
amort=v_amort, 
all_amort=v_all_amort, 

tax_first_price=v_tax_first_price,
tax_remainder=v_tax_remainder, 
tax_amort=v_tax_amort, 
tax_all_amort=v_tax_all_amort, 

amort_date=v_amort_date,
fxm=v_fxm, 
keeping_sec=v_keeping_sec,
inventar_no=v_inventar_no,
close_format=p_close_format,
tax_close_format=p_tax_close_format

where wares_id=v_wares_id;
commit;
end;


procedure add_wares(
                     v_wares_name        varchar2,                      
                     v_inventar_date     date, 
                     v_groups_id         number, 
                     v_first_price       number,
                     v_remainder         number, 
                     v_amort             number, 
                     v_all_amort         number, 
                     v_percent           number, 
                     v_tax_first_price   number,
                     v_tax_remainder     number, 
                     v_tax_amort         number, 
                     v_tax_all_amort     number, 
                     v_tax_percent       number,
                     v_amort_date        date,
                     v_fxm               number default null, 
                     v_keeping_sec       varchar2 default null,
                     v_inventar_no       varchar2 default null,
                     v_user_name         varchar2 default null
                    )
is
p_close_format number;
p_tax_close_format number;

begin


           if v_first_price=v_remainder then
           p_close_format:=0;
           end if;

           if (v_first_price<>v_remainder) and (v_remainder>0) then
           p_close_format:=1;
           end if;
           
           if v_remainder=0 then
           p_close_format:=2;
           end if;
           
       
     if (v_first_price = v_tax_remainder) and
           (v_first_price = v_tax_first_price) then
     p_tax_close_format:=0;
     end if;
        
               if  v_first_price>v_tax_remainder then
               p_tax_close_format:=1;
               end if;
                                 
            if  (v_tax_first_price=0) 
                        or (v_tax_remainder=0)
                    then
                   p_tax_close_format:=2;
                 end if;              
        
insert into wares_all(wares_name, 
                      inventar_date, 
                      groups_id, 
                      first_price,
                      remainder, 
                      amort, 
                      all_amort, 
                      percent, 
                      tax_first_price,
                      tax_remainder, 
                      tax_amort, 
                      tax_all_amort, 
                      tax_percent,
                      close_format, 
                      amort_date, 
                      fxm, 
                      keeping_sec,
                      tax_close_format,
                      inventar_no,
                      user_name)
               values(
                      v_wares_name, 
                      v_inventar_date, 
                      v_groups_id, 
                      v_first_price,
                      v_remainder, 
                      v_amort, 
                      v_all_amort, 
                      v_percent, 
                      v_tax_first_price,
                      v_tax_remainder, 
                      v_tax_amort, 
                      v_tax_all_amort, 
                      v_tax_percent,
                      p_close_format, 
                      v_amort_date, 
                      v_fxm, 
                      v_keeping_sec,
                      p_tax_close_format,
                      v_inventar_no,
                      v_user_name);

commit;
end;




procedure calculate_wares_for_day(calc_date date)
is

begin

keep_before_calc;
--------------------------------------------------


update wares_all
   set
      close_format = 2 ,
      amort = remainder
   where 
       ( remainder = 0 )  or  ( remainder < amort );

update wares_all
  set 
     remainder = 0,
     all_amort = first_price
  where ( close_format = 2 );
 

 
update wares_all
  set
     tax_close_format = 2,
     tax_amort = tax_remainder
  where ( tax_remainder = 0 ) or ( tax_remainder < tax_amort ); 

update wares_all
  set 
     tax_remainder = 0,
     tax_all_amort = first_price
  where ( tax_close_format = 2 );

  
-------------old wares ------------------------------------------
update wares_all
  set
     amort=( first_price * bankdaysbetween(amort_date,calc_date) * percent )/36000
  where 
       ( close_format = 1 ) and ( amort_date < calc_date );


update wares_all
  set
     tax_amort = ( tax_first_price * bankdaysbetween(amort_date,calc_date) * tax_percent ) / 36000
  where 
       ( tax_close_format = 1 )
  and
       ( amort_date < calc_date );

 
update wares_all
  set
     all_amort = all_amort + amort,
     remainder = remainder - amort
  where 
       ( close_format = 1 )
 and
       ( amort_date < calc_date );   

update wares_all
  set
     tax_all_amort = tax_all_amort + tax_amort,
     tax_remainder = tax_remainder - tax_amort
  where 
      ( tax_close_format = 1 )
  and
      ( amort_date < calc_date );  
 
 
--------new wares-------------------------------------------------

update wares_all
  set
     amort = ( first_price * bankdaysbetween( inventar_date,calc_date )* percent ) / 36000
  where 
       ( close_format = 0 )
  and
       ( inventar_date < calc_date ); 

update wares_all
  set
     tax_amort = ( tax_first_price * bankdaysbetween( inventar_date,calc_date ) * tax_percent ) / 36000
  where 
      ( tax_close_format = 0 )
 and
      ( inventar_date < calc_date ); 
 
 
update wares_all
  set
     all_amort = all_amort + amort,
     remainder = remainder - amort
  where 
       ( close_format = 0 )
 and
       ( inventar_date < calc_date ); 

 
update wares_all
  set
     tax_all_amort = tax_all_amort + tax_amort,
     tax_remainder = tax_remainder - tax_amort
  where 
       ( tax_close_format = 0 )
  and
       ( inventar_date < inventar_date );
 
 
update wares_all
  set
      close_format = 1
  where 
       ( close_format = 0 )
  and
       ( inventar_date < calc_date );


update wares_all
  set
     tax_close_format = 1
  where 
      ( tax_close_format = 0 )
 and
      ( inventar_date < calc_date ); 

---------------------------------------------- 

update wares_all
  set
      amort_date = calc_date; 


keep_after_calc;
commit;

end;


procedure calculate_wares(calc_date date)
is

begin

keep_before_calc;
--------------------------------------------------


update wares_all
   set
      close_format=2,
      amort=remainder
   where
       ( remainder = 0 )  or  ( remainder < amort );

update wares_all
  set
     remainder=0,
     all_amort=first_price
  where ( close_format = 2 );



update wares_all
  set
     tax_close_format = 2,
     tax_amort = tax_remainder
  where ( tax_remainder = 0 ) or ( tax_remainder < tax_amort );

update wares_all
  set
     tax_remainder = 0,
     tax_all_amort = first_price
  where ( tax_close_format = 2 );


-------------old wares ------------------------------------------
update wares_all
  set
     amort=(first_price*30*percent)/36000
  where
       ( close_format = 1 ) and ( amort_date < calc_date );



update wares_all
  set
     tax_amort = ( tax_first_price * 30 * tax_percent ) / 36000
  where
       ( tax_close_format = 1 )
  and
       ( amort_date < calc_date );


update wares_all
  set
     all_amort = all_amort + amort,
     remainder = remainder - amort
  where
       ( close_format = 1 )
 and
       ( amort_date < calc_date );

update wares_all
  set
     tax_all_amort = tax_all_amort + tax_amort,
     tax_remainder = tax_remainder - tax_amort
  where
      ( tax_close_format = 1 )
  and
      ( amort_date < calc_date );


--------new wares-------------------------------------------------

update wares_all
  set
     amort = ( first_price * (bankdaysbetween( inventar_date,calc_date )+1)* percent ) / 36000
  where
       ( close_format = 0 )
  and
       ( inventar_date < calc_date );

update wares_all
  set
     tax_amort = ( tax_first_price * (bankdaysbetween( inventar_date,calc_date )+1) * tax_percent ) / 36000
  where
      ( tax_close_format = 0 )
 and
      ( inventar_date < calc_date );


update wares_all
  set
     all_amort = all_amort + amort,
     remainder = remainder - amort
  where
       ( close_format = 0 )
 and
       ( inventar_date < calc_date );


update wares_all
  set
     tax_all_amort = tax_all_amort + tax_amort,
     tax_remainder = tax_remainder - tax_amort
  where
       ( tax_close_format = 0 )
 and
       ( inventar_date < inventar_date );


update wares_all
  set
      close_format = 1
  where
       ( close_format = 0 )
 and
       ( inventar_date < calc_date );


update wares_all
  set
     tax_close_format = 1
  where
      ( tax_close_format = 0 )
 and
      ( inventar_date < calc_date );

----------------------------------------------

update wares_all
  set
      amort_date = calc_date;


keep_after_calc;
commit;

end;




procedure stop_calculate(status varchar2,v_id number)
is
begin
        if 
           status='nb' 
                   then
          update wares_all
             set 
                first_price=0,
                remainder=0,
                all_amort=0,
                amort=0,
                close_format=2
           where 
                  wares_id=v_id;
          elsif 
                status='nl'
                      then 
          update wares_all
             set 
                tax_close_format=2,
                tax_remainder=0,
                tax_all_amort=0,
                tax_amort=0,
                tax_first_price=0
           where 
                  wares_id=v_id;
             end if;                 

commit;
end;


procedure wares_all_transaction
is

v_group_name  varchar2(90); 
v_groups_id   number; 
v_debt_acc    number; 
v_cred_acc    number; 
v_debt_amount number(18,2);
v_trans_date  date;
begin
delete from wares_all_trans;
          for j in (select * from groups where exp_account is not null and amort_account is not null) 
          loop
              v_group_name:=j.name;
              v_groups_id:=j.id;
              v_debt_acc:=j.exp_account;                
              v_cred_acc:=j.amort_account;
              select sum(amort) into v_debt_amount from wares_all where groups_id=j.id;              
              v_trans_date:=sblogin.get_date;              
              insert into wares_all_trans(group_name, groups_id, debt_acc, cred_acc, debt_amount,trans_date)
              values(v_group_name, v_groups_id, v_debt_acc, v_cred_acc, v_debt_amount,v_trans_date);
              
          end loop;


commit;
end;

procedure new_wares_transaction(
                                v_groups_id   integer,
                                v_debt_amount number,
                                v_cred_acc    number,
                                v_debt_acc    number,
                                v_trans_name  varchar2
                                )
is
v_trans_date  date;
begin
delete wares_all_trans;
                 v_trans_date:=sblogin.get_date;
      insert into wares_all_trans(group_name, groups_id, debt_acc, cred_acc, debt_amount,trans_date)
      values(v_trans_name, v_groups_id, v_debt_acc, v_cred_acc, v_debt_amount,v_trans_date);

commit;
end;


procedure deleted_wares_trans(
                                v_groups_id   integer,
                                v_debt_amount number,
                                v_cred_acc    number,
                                v_debt_acc    number,
                                v_trans_name  varchar2
                                )
is
v_trans_date  date;
begin
delete wares_all_trans;
                 v_trans_date:=sblogin.get_date;
      insert into wares_all_trans(group_name, groups_id, debt_acc, cred_acc, debt_amount,trans_date)
      values(v_trans_name, v_groups_id, v_debt_acc, v_cred_acc, v_debt_amount,v_trans_date);

commit;
end;


procedure repair_wares
is
year    integer;
dat_st  varchar2(10);
dat     date;
begin
year:=to_number(to_char(to_date(current_amort_date),'YYYY'))+1;
dat_st:='01-jan-'||year;
dat:=to_date(dat_st);


keep_before_calc;

update wares_all 
set
tax_first_price=tax_remainder,
amort_date=dat
;

insert into wares_last
  select
  wares_name, wares_id, inventar_date, groups_id, first_price, remainder,
  0, all_amort, percent, tax_first_price, tax_remainder, 0,
  0, tax_percent, close_format, amort_date,tax_close_format,inventar_no
  from
  wares_all;

commit;
end;





  procedure settransaction (
      v_debitid    number,
      v_creditid   number,
      v_amount     number,
      v_trname     varchar2
   )
   is
      tempid   integer;
   begin
      tempid :=
            sb_transaction.transaction_add (
               debitid=> v_debitid,
               creditid=> v_creditid,
               debitamount=> v_amount,
               creditamount=> v_amount,
               lamount=> v_amount,
               trname=>    v_trname
                        || ' qrupu uzre amortizasiya',
               flags => 0,
               transactiondate=> sbop.get_date,
               OperatorId=>uid
            );
      commit;
   end;

  procedure set_transaction_new (
      v_debitid    number,
      v_creditid   number,
      v_amount     number,
      v_trname     varchar2
   )
   is
      tempid   integer;
   begin
      tempid :=
            sb_transaction.transaction_add (
               debitid=> v_debitid,
               creditid=> v_creditid,
               debitamount=> v_amount,
               creditamount=> v_amount,
               lamount=> v_amount,
               trname=>    v_trname,
               flags => 0,
               transactiondate=> sbop.get_date,
               OperatorId=>uid
            );
      commit;
   end;


  procedure settrans_out (
      v_debitid    number,
      v_creditid   number,
      v_amount     number,
      v_trname     varchar2
   )
   is
      tempid   integer;
   begin
      tempid :=
            sb_transaction.transaction_add (
               debitid=> v_debitid,
               creditid=> v_creditid,
               debitamount=> v_amount,
               creditamount=> v_amount,
               lamount=> v_amount,
               trname=>    v_trname
                        || ' qrupu uzre ф€рг юд€нишл€ри(ЌЅ_амор-ЌЋ_аморт)',
               flags => 0,
               transactiondate=> sbop.get_date
            );
      commit;
   end;
   
  
   
procedure sum_for_group_params(
v_amort_date              in   date,
v_groups_id               in   groups.id%type,
v_sum_first_price        out   wares_all.first_price%type,
v_sum_remainder          out   wares_all.remainder%type,
v_sum_all_amort          out   wares_all.all_amort%type,
v_sum_amort              out   wares_all.amort%type,
v_sum_tax_first_price    out   wares_all.first_price%type,
v_sum_tax_remainder      out   wares_all.remainder%type,
v_sum_tax_all_amort      out   wares_all.all_amort%type,
v_sum_tax_amort          out   wares_all.amort%type
)
is
begin
       select 
                sum(first_price)     
               ,sum(remainder)      
               ,sum(all_amort)
               ,sum(amort)
               ,sum(tax_first_price)     
               ,sum(tax_remainder)      
               ,sum(tax_all_amort)
               ,sum(tax_amort)
      into 
               v_sum_first_price 
              ,v_sum_remainder
              ,v_sum_all_amort
              ,v_sum_amort   
              ,v_sum_tax_first_price
              ,v_sum_tax_remainder  
              ,v_sum_tax_all_amort  
              ,v_sum_tax_amort                       
                
      from wares_first
        where 
              groups_id  = v_groups_id
              and
              amort_date = v_amort_date;
        
   exception when no_data_found then
   begin
      v_sum_first_price:=0; 
      v_sum_remainder:=0;
      v_sum_all_amort:=0;
      v_sum_amort:=0;   
      v_sum_tax_first_price:=0;
      v_sum_tax_remainder:=0;  
      v_sum_tax_all_amort:=0;  
      v_sum_tax_amort:=0;    
   
   end;                   


end;   
   
   
 procedure  update_wares_trans(v_id number,
                               v_debt_acc varchar2,
                               v_cred_acc varchar2 )
  is
             p_exp_account number;
             p_amort_account number;
  
  begin
   p_exp_account:= GetAccountID(v_debt_acc);
   p_amort_account:=GetAccountID(v_cred_acc); 
   
   update wares_all_trans
   set
            debt_acc=p_exp_account,
            cred_acc=p_amort_account
   
   where id=v_id; 
   
   
 commit;
 end;                              
   
 procedure  update_wares_trans_out(v_id number,
                               v_debt_acc varchar2,
                               v_cred_acc varchar2 )
  is
             p_exp_account number;
             p_amort_account number;
  
  begin
   p_exp_account:= GetAccountID(v_debt_acc);
   p_amort_account:=GetAccountID(v_cred_acc); 
   
   update wares_all_trans
   set
            debt_acc=p_exp_account,
            cred_acc=p_amort_account
   
   where id=v_id; 
   
   
 commit;
 end;  
 
function bankdaysbetween (firstdate in date, lastdate in date)
      return integer
   is
result          integer;
currentmonth    date;
month           date    := firstdate;
monthinterval   integer;
mounthindex     integer;
lastmonthday    integer;
bankyeardays    integer := 360;
begin
      if firstdate >= lastdate
      then
         result := 0;
      else
         result := (lastdate - firstdate);

         if bankyeardays > 360
         then
            return result;
         end if;

         monthinterval := (lastdate - firstdate) / 30;

         for monthindex in 0 .. monthinterval
         loop
            currentmonth := last_day (month);
            lastmonthday := to_number (to_char (currentmonth, 'DD'));

            if (currentmonth <= lastdate) and (currentmonth > firstdate)
            then
               if lastmonthday = 31
               then
                  result := result - 1;
               end if;

               if lastmonthday = 28
               then
                  result := result + 2;
               end if;

               if lastmonthday = 29
               then
                  result := result + 1;
               end if;
            end if;

            month := add_months (month, 1);
         end loop;
      end if;

      return result;
end;


function get_view_turn_sql(v_beg_date in date ,v_end_date in date)
return varchar2
is
first_year  integer;
last_year   integer;
str         varchar2(2000);
begin_date  date;
end_date    date;
begin

    end_date:=v_end_date;
    
    first_year:=to_number(to_char(to_date(v_beg_date),'YYYY'));
    last_year:=to_number(to_char(to_date(v_end_date),'YYYY'));
    if (first_year<>last_year)
    then
       select max(amort_date) into end_date from wares_last
          where to_number(to_char(to_date(amort_date),'YYYY'))<last_year;
    end if;

       select max(amort_date) into begin_date from wares_last
          where amort_date<=v_beg_date;


str:='Select
W.*
From
Wares_Last W
Where
 groups_id = :groups_id
and
w.close_format<>0
and
amort_date
           between
                 '''||begin_date||'''
               and
                 '''||end_date||'''

order by W.wares_id,W.amort_date';

return str;
end;
 
 
 

function last_amort_date(v_date in date) return date
is
result date;
begin
      select max(amort_date) into result from wares_last
       where
              amort_date<=v_date
                and
              (close_format<>0
                or
                tax_close_format<>0);
if result is null
then
result:=sysdate;
end if;
return result;
      
end;

function current_amort_date return date
is
result date;
begin
      select max(amort_date) into result from wares_all
       where (close_format not in(0,2) )
          or (tax_close_format not in(0,2));

      return result;
end;


function first_amort_date return date
is
result date;
begin
      select max(amort_date) into result from wares_first
       where
              (amort_date<current_amort_date)
                and
              (close_format<>0
                or
                tax_close_format<>0);
      return result;
end;


 
procedure restore_calculate
is
res_date date;
begin
res_date:=first_amort_date;
delete wares_last where amort_date>=current_amort_date;
update wares_all ww
set
ww.first_price=(select wf.first_price from wares_first wf where wf.amort_date=res_date and ww.wares_id=wf.wares_id),
ww.remainder=(select wf.remainder from  wares_first wf  where wf.amort_date=res_date and ww.wares_id=wf.wares_id),
ww.all_amort=(select wf.all_amort from wares_first wf where wf.amort_date=res_date and ww.wares_id=wf.wares_id),
ww.amort=(select wf.amort from  wares_first  wf  where  wf.amort_date=res_date  and ww.wares_id=wf.wares_id),

ww.tax_first_price=(select wf.tax_first_price from wares_first wf where wf.amort_date=res_date and ww.wares_id=wf.wares_id),
ww.tax_remainder=(select wf.tax_remainder from  wares_first wf  where wf.amort_date=res_date and ww.wares_id=wf.wares_id),
ww.tax_all_amort=(select wf.tax_all_amort from wares_first wf where wf.amort_date=res_date and ww.wares_id=wf.wares_id),
ww.tax_amort=(select wf.tax_amort from  wares_first  wf  where  wf.amort_date=res_date  and ww.wares_id=wf.wares_id),

ww.close_format=(select wf.close_format from wares_first wf  where wf.amort_date=res_date and ww.wares_id=wf.wares_id),
ww.tax_close_format=(select wf.tax_close_format from wares_first wf  where wf.amort_date=res_date and ww.wares_id=wf.wares_id)
;
update wares_all set amort_date=res_date;

delete wares_first where amort_date>=res_date;

commit;

end;

function cheking_calculate(v_date in date) return boolean
is
result boolean;
last_amort_date date;
cursor c_new is
 select close_format from wares_all where (close_format=0 or tax_close_format=0)
                                     and  (close_format=0 or tax_close_format=0);
 r_c_new c_new%rowtype;
cursor c_old is
 select close_format from wares_all where (close_format=1 or tax_close_format=1);
 r_c_old c_old%rowtype;

begin
      open c_new;
      fetch c_new into r_c_new;
      close c_new;


return result;
end;

function last_calc_date return date
is
result date;
begin
    select max(amort_date) into result from wares_last where close_format=1;
    return result;
    exception when no_data_found then
      begin
       select max(amort_date) into result from wares_last where close_format=0;
       return result;
      end;

return result;
end;

procedure new_wares_trans_acc(
                              v_groups_id    in  integer,
                              v_main_account out integer,
                              v_sale_account out integer)
is
begin
 select
       nvl(main_account,-1),
       nvl(sale_account,-1)
 into
       v_main_account,
       v_sale_account
 from
       groups
 where
       id=v_groups_id;
end;

procedure del_wares_trans_acc(
                              v_groups_id    in  integer,
                              v_main_account out integer,
                              v_sale_account out integer)
is
begin
 select
       nvl(main_account,-1),
       nvl(sale_account,-1)
 into
       v_main_account,
       v_sale_account
 from
       groups
 where
       id=v_groups_id;
end;


 
END;
/


-- End of DDL Script for Package SMART.SB_MAIN_RESOURCE

