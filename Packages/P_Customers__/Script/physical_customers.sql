-- Start of DDL Script for Package SMART.PHYSICAL_CUSTOMERS
-- Generated 13-Nov-2006 23:51:09 from SMART@SB

CREATE OR REPLACE 
PACKAGE physical_customers IS
  
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
 AccName account.name%type
)  return integer;
  procedure add_cities
 (p_name cities.city_name%type,p_countryid cities.country_id%type);
  procedure add_countries
 (p_name countries.cntr_name%type);
  procedure delete_cities
 (p_id cities.id%type);
  procedure delete_countries
 (p_id countries.id%type);
  procedure add_customers
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
  p_phone_mob customers_physical.phone_mob%type);
  procedure upd_customers
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
 p_adrs_state customers_physical.adress%type,
  p_adrs_city customers_physical.adrs_city%type,
  p_birth_state customers_physical.birth_state%type,
  p_phone_mob customers_physical.phone_mob%type);
END Physical_Customers;
/


CREATE OR REPLACE 
PACKAGE BODY physical_customers IS
procedure add_customers
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
  p_phone_mob customers_physical.phone_mob%type)
is 

 BuyerOpenDate customers_physical.OpenDate%type;
begin
 select tek_dat into BuyerOpenDate from sysdat;
 
 insert into customers_physical
  (byr_name, passport, birthdate, birthplace,
   fam_status, adress, phone, email, OpenDate, sex,
   passp_number, adrs_state, adrs_city, birth_state, phone_mob)
  values
  (p_byr_name, p_passport, p_birthdate, p_birthplace,
   p_fam_status, p_adress,  p_phone, p_email, BuyerOpenDate, p_sex,
   p_passp_number, p_adrs_state, p_adrs_city, p_birth_state, p_phone_mob); 

 commit;
end;   
----------------------------
procedure add_countries
 (p_name countries.cntr_name%type)
is
begin
 insert into countries
  (cntr_name)
  values
  (p_name);
  
 commit;
end;
--------------------------
procedure add_cities
 (p_name cities.city_name%type,p_countryid cities.country_id%type)
is
begin
 insert into cities
  (country_id, city_name)
  values
  (p_countryid,p_name);
  
 commit;
end;
--------------------------
procedure delete_cities
 (p_id cities.id%type)
is
begin
 delete cities
   where id=p_id;
  
 commit;
end;
---------------------------
procedure delete_countries
 (p_id countries.id%type)
is
begin
 delete countries
   where id=p_id;
  
 commit;
end;


--------------------------
procedure upd_customers
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
 p_adrs_state customers_physical.adress%type,
  p_adrs_city customers_physical.adrs_city%type,
  p_birth_state customers_physical.birth_state%type,
  p_phone_mob customers_physical.phone_mob%type)
is

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
 where ID =p_ID ;



 commit;
end;
--------------------------
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
 AccName account.name%type
)  return integer
 is
   Result integer;
begin
 SB_ACA.CheckObjectAccess('Accounts','insert');
 insert into account
  (acc_no, val_acc, bal_cn1, kli_id, open_dat, limit,
   sim_otcet, filial, tipacc, name)
 values
  (AccNumber, Currency, Balance, 0, OpenDate, Limite,
   RepSymb, Branch, AccSymb, AccName)
 returning ID into Result;

 insert into lazyrest
  (acc_id, ostat, pok_ostat, datdate, obr_d, obr_k, pok_obr_d, pok_obr_k)
 values
  (Result, 0, 0, sysdate, 0, 0, 0, 0);

commit;
return Result;
end;
END Physical_Customers;
/


-- End of DDL Script for Package SMART.PHYSICAL_CUSTOMERS


