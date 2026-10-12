-- Start of DDL Script for Package SMART.PHYSICAL_CUSTOMERS
-- Generated 17-Nov-2006 16:09:26 from SMART@SB

CREATE OR REPLACE 
PACKAGE physical_customers
is 

  
  function upd_p_customes
 (p_ID customers_physical.id%type,
  p_byr_name customers_physical.byr_name%type,
  p_passport customers_physical.passport%type,
  p_birthdate customers_physical.birthdate%type,
  p_birthplace customers_physical.birthplace%type,
  p_fam_status customers_physical.fam_status%type,
  p_adress customers_physical.adress%type,
  p_phone customers_physical.phone%type,
  p_email customers_physical.email%type,
  p_sex customers_physical.sex%type,
  p_passp_number customers_physical.passp_number%type,
  p_adrs_state customers_physical.adrs_state%type,
  p_adrs_city customers_physical.adrs_city%type,
  p_birth_state customers_physical.birth_state%type,
  p_phone_mob customers_physical.phone_mob%type)return integer;
  FUNCTION add_p_customers
 (p_byr_name customers_physical.byr_name%type,
  p_passport customers_physical.passport%type,
  p_birthdate customers_physical.birthdate%type,
  p_birthplace customers_physical.birthplace%type,
  p_fam_status customers_physical.fam_status%type,
  p_adress customers_physical.adress%type,
    p_phone customers_physical.phone%type,
  p_email customers_physical.email%type,
  p_sex customers_physical.sex%type,
  p_passp_number customers_physical.passp_number%type,
  p_adrs_state customers_physical.adrs_state%type,
  p_adrs_city customers_physical.adrs_city%type,
  p_birth_state customers_physical.birth_state%type,
  p_phone_mob customers_physical.phone_mob%type) return integer;
  function open_Account (
 AccNumber account.acc_no%type,
 Currency account.val_acc%type default 0,
 Balance account.bal_cn1%type,
 CustomerID account.kli_id%type,
 OpenDate account.open_dat%type,
 Limite account.limit%type,
 RepSymb account.sim_otcet%type,
 Branch account.filial%type default 0,
 AccSymb account.tipacc%type,
 AccName account.name%type,
 Custid account.p_custid%type)
  return integer;
  procedure del_fromTable
 (p_TableName varchar2,
  p_ID integer);
  procedure ins_cc_repairing
 (
  p_val_code cc_settings.val_code%type,
  p_val_name cc_settings.val_name%type,
  p_bal_cn1 cc_settings.bal_cn1%type,
  p_bal_name cc_settings.bal_name%type,
   p_cust_id cc_settings.cust_id%type,
  p_cust_name cc_settings.cust_name%type,
  p_open_date cc_settings.open_date%type,
  p_tw_acc_number cc_settings.tw_acc_number%type,
  p_acc_symbol cc_settings.acc_symbol%type,
  p_limit cc_settings.limit%type,
  p_branch_id cc_settings.branch_id%type,
  p_branch_name cc_settings.branch_name%type
  );
end;
/


CREATE OR REPLACE 
PACKAGE BODY physical_customers
is 
FUNCTION add_p_customers
 (p_byr_name customers_physical.byr_name%type,
  p_passport customers_physical.passport%type,
  p_birthdate customers_physical.birthdate%type,
  p_birthplace customers_physical.birthplace%type,
  p_fam_status customers_physical.fam_status%type,
  p_adress customers_physical.adress%type,
    p_phone customers_physical.phone%type,
  p_email customers_physical.email%type,
  p_sex customers_physical.sex%type,
  p_passp_number customers_physical.passp_number%type,
  p_adrs_state customers_physical.adrs_state%type,
  p_adrs_city customers_physical.adrs_city%type,
  p_birth_state customers_physical.birth_state%type,
  p_phone_mob customers_physical.phone_mob%type) return integer
is 
result integer;
 BuyerOpenDate customers_physical.OpenDate%type;
begin
 select tek_dat into BuyerOpenDate from sysdat;
 
 insert into customers_physical
  (byr_name, passport, birthdate, birthplace,
   fam_status, adress,  phone, email, OpenDate, sex,
   passp_number, adrs_state, adrs_city, birth_state, phone_mob)
  values
  (p_byr_name, p_passport, p_birthdate, p_birthplace,
   p_fam_status, p_adress, p_phone, p_email, BuyerOpenDate, p_sex,
   p_passp_number, p_adrs_state, p_adrs_city, p_birth_state, p_phone_mob) 
   returning id into result;
  return result; 
 commit;
end;   

--------------------------
--------------------------
function upd_p_customes
 (p_ID customers_physical.id%type,
  p_byr_name customers_physical.byr_name%type,
  p_passport customers_physical.passport%type,
  p_birthdate customers_physical.birthdate%type,
  p_birthplace customers_physical.birthplace%type,
  p_fam_status customers_physical.fam_status%type,
  p_adress customers_physical.adress%type,
  p_phone customers_physical.phone%type,
  p_email customers_physical.email%type,
  p_sex customers_physical.sex%type,
  p_passp_number customers_physical.passp_number%type,
  p_adrs_state customers_physical.adrs_state%type,
  p_adrs_city customers_physical.adrs_city%type,
  p_birth_state customers_physical.birth_state%type,
  p_phone_mob customers_physical.phone_mob%type)return integer
is
result integer;
begin
 update customers_physical set
  byr_name =p_byr_name,
  passport =p_passport,
  birthdate =p_birthdate,
  birthplace =p_birthplace,
  fam_status =p_fam_status,
  adress =p_adress,
   phone =p_phone,
  email =p_email,
  sex =p_sex,
  passp_number =p_passp_number,
  adrs_state =p_adrs_state,
  adrs_city =p_adrs_city,
  birth_state =p_birth_state,
  phone_mob =p_phone_mob
 where ID =p_ID    returning id into result;
  return result; 


 commit;
end;
--------------------------
procedure del_fromTable
 (p_TableName varchar2,
  p_ID integer)
is
begin
 execute immediate
 'delete from '||p_TableName||' where ID ='||p_ID;

 commit;
end;
--------------------------
procedure ins_cc_repairing
 (
  p_val_code cc_settings.val_code%type,
  p_val_name cc_settings.val_name%type,
  p_bal_cn1 cc_settings.bal_cn1%type,
  p_bal_name cc_settings.bal_name%type,
   p_cust_id cc_settings.cust_id%type,
  p_cust_name cc_settings.cust_name%type,
  p_open_date cc_settings.open_date%type,
  p_tw_acc_number cc_settings.tw_acc_number%type,
  p_acc_symbol cc_settings.acc_symbol%type,
  p_limit cc_settings.limit%type,
  p_branch_id cc_settings.branch_id%type,
  p_branch_name cc_settings.branch_name%type
  )
is
begin
delete from acc_settings;
 insert into acc_settings
  ( val_code, val_name, bal_cn1, bal_name, cust_id,
       cust_name, open_date, tw_acc_number, acc_symbol, limit,
       branch_id, branch_name
 )
 values
  ( p_val_code, p_val_name, p_bal_cn1, p_bal_name, p_cust_id,
       p_cust_name, p_open_date, p_tw_acc_number, p_acc_symbol, p_limit,
       p_branch_id, p_branch_name);

 commit;
end;

--------------------------
function open_Account (
 AccNumber account.acc_no%type,
 Currency account.val_acc%type default 0,
 Balance account.bal_cn1%type,
 CustomerID account.kli_id%type,
 OpenDate account.open_dat%type,
 Limite account.limit%type,
 RepSymb account.sim_otcet%type,
 Branch account.filial%type default 0,
 AccSymb account.tipacc%type,
 AccName account.name%type,
 Custid account.p_custid%type)
  return integer is
   Result integer;
begin
 SB_ACA.CheckObjectAccess('Accounts','insert');
 insert into account
  (acc_no, val_acc, bal_cn1, kli_id, open_dat, limit,
   sim_otcet, filial, tipacc, name, p_custid)
 values
  (AccNumber, Currency, Balance, CustomerID, OpenDate, Limite,
   RepSymb, Branch, AccSymb, AccName, Custid)
 returning ID into Result;

 insert into lazyrest
  (acc_id, ostat, pok_ostat, datdate, obr_d, obr_k, pok_obr_d, pok_obr_k)
 values
  (Result, 0, 0, sysdate, 0, 0, 0, 0);

commit;
return Result;
end;
--------------------------

end;
/


-- End of DDL Script for Package SMART.PHYSICAL_CUSTOMERS


