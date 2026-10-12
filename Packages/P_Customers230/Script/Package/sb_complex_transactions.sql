DROP PACKAGE sb_complex_transactions
/

CREATE OR REPLACE 
PACKAGE sb_complex_transactions
  IS
--procedure Ins_Account_SL(v_accno varchar2, v_accname varchar2, v_accvalcode varchar2); 

function Getvalrate(accname number) return number;
  function GetAccountName(accname number) return varchar;
  function GetAccountval_name(AccountID Account.ID%type)
   return avalute.valu_name%type;
  function GetValuteName(v_val_acc avalute.valute%type)
   return avalute.valu_name%type;         
  procedure CheckSides(commisionID Commision_trans.id%type);
  procedure Delete_Commision_Trans(settingID commision_trans.id%type);
  function GetAccountCurrency(AccountID Account.ID%type)
   return avalute.val_name%type;
  function GetAccountCurrencyID(AccountID Account.id%type) return Avalute.valute%type;
  function GetAccountNumber(AccountID number) return varchar;
  function GetCurrencyName(v_val_acc avalute.valute%type)
   return avalute.val_name%type;
  function GetGroupName(groupID QRP_KLIE.id%type) return QRP_KLIE.name%type;
 procedure ins_commission_trans_km 
(v_id number, v_debt number, v_credit number,v_c_value number,v_d_value number,v_ddate date);

  procedure Insert_Commision_Trans
                          (
                           v_name commision_trans.name%type
                          ,v_debt commision_trans.debt%type
                          ,v_credit commision_trans.credit%type
                          ,v_additionalDebt number
                          ,v_additionalCredit number
                          ,v_assignment varchar
                          ,v_commisionassignment varchar
                          ,isCommonSetting boolean
                           );
  procedure update_commision_trans
                         (
                           v_ID commision_trans.ID%type 
                          ,v_name commision_trans.name%type
                          ,v_debt commision_trans.debt%type
                          ,v_credit commision_trans.credit%type
                          ,v_additionalDebt number
                          ,v_additionalCredit number
                          ,v_assignment varchar 
                          ,v_commisionassignment varchar
                          ,isCommonSetting boolean
                          );
  function IsCommonSetting(uID Commision_trans.userid%type) return boolean;
  procedure SetTransactions(commisionID Commision_trans.id%type
                         ,DebitID provarch.debt%type
                         ,CreditID provarch.kredit%type
                         ,DebitAmmount provarch.ammount%type
                         ,CreditAmmount provarch.ammount%type
                         ,TransDate provarch.dat%type default sbop.get_date);
END;
/

CREATE OR REPLACE 
PACKAGE BODY sb_complex_transactions
IS

cursor c_TariffScale(CustomerGroup TariffScale.groupid%type
                     ,operationID TariffScale.commisionid%type
                     ,TransactionAmmount TariffScale.ammount%type) is
 select 
   *
 from
   TariffScale
 where 
   groupID = CustomerGroup and 
    commisionID = operationID and   
     TransactionAmmount >= MinValue and
      TransactionAmmount < MaxValue;   

cursor c_CurrencyRate(AccountID Account.id%type) is
 select 
   ostat
 from 
   Account A ,
    Operkurs O                               
 where
   A.ID = AccountID and
     A.val_acc = O.val_kod and
       O.dat = (select tek_dat from sysdat);
     
cursor c_CustomerGroup(AccountID Account.id%type) is
 select 
   C.group_klie
 from 
   Account A,
     Customers C
 where 
   A.ID = AccountID and
     A.kli_id = C.ID; 
     
cursor c_Commision(commisionID Commision_trans.id%type) is
 select
   *        
 from 
   Commision_trans
 where 
   ID = commisionID;      
   
cursor c_MinValues(CustomerGroup TariffScale.groupid%type
                   ,operationID TariffScale.commisionid%type) is
 select                   
   *
 from 
   TariffScale
 where
   groupID = CustomerGroup and 
     CommisionID=operationID and
       minvalue=(select
                   min(minvalue)
                 from TariffScale 
                 where 
                    groupID = CustomerGroup and CommisionID=operationID);     

cursor c_MaxValues(CustomerGroup TariffScale.groupid%type
                   ,operationID TariffScale.commisionid%type) is
 select                   
   *
 from 
   TariffScale
 where
   groupID = CustomerGroup and 
     CommisionID=operationID and
       maxvalue=(select
                   max(maxvalue)
                 from TariffScale 
                 where 
                    groupID = CustomerGroup and CommisionID=operationID);     

                        
procedure Insert_Commision_Trans
                          (
                           v_name commision_trans.name%type
                          ,v_debt commision_trans.debt%type
                          ,v_credit commision_trans.credit%type
                          ,v_additionalDebt number
                          ,v_additionalCredit number
                          ,v_assignment varchar
                          ,v_commisionassignment varchar
                          ,isCommonSetting boolean
                           ) 
is
 UserSID number;
begin
 if isCommonSetting then
   UserSID :=0;
  else 
   UserSID :=SBLogin.UserID;  
 end if;  
 dbms_output.put_line(to_char(userSID));
 Insert into Commision_Trans
                          (
                           name 
                          ,debt 
                          ,credit 
                          ,additionalDebt
                          ,additionalCredit
                          ,assignment
                          ,commisionassignment
                          ,userID
                           )
            values        (
                           v_name 
                          ,v_debt 
                          ,v_credit 
                          ,v_additionalDebt
                          ,v_additionalCredit
                          ,v_assignment
                          ,v_commisionassignment
                          ,userSID
                          );      
 commit;                  
end;
/*procedure ins_commis_trans
( v_name varchar2, v_debt number,v_credit number, v_additionaldebt number, v_additionalcredit number,
  v_assignment varchar2, v_commisionassignment varchar2,v_debt_acc varchar2,v_credit_acc varchar2,v_add_debt_acc varchar2,v_add_credit_acc varchar2)
is
begin
insert into commision_trans
(name, debt, credit, additionaldebt, additionalcredit,assignment, commisionassignment,debt_acc,credit_acc,add_debt_acc,add_credit_acc)
values
(v_name, v_debt, v_credit, v_additionaldebt, v_additionalcredit,v_assignment, v_commisionassignment,v_debt_acc,v_credit_acc,v_add_debt_acc,v_add_credit_acc);
       commit;
       end;*/
procedure update_commision_trans
                         (
                           v_ID commision_trans.ID%type 
                          ,v_name commision_trans.name%type
                          ,v_debt commision_trans.debt%type
                          ,v_credit commision_trans.credit%type
                          ,v_additionalDebt number
                          ,v_additionalCredit number
                          ,v_assignment varchar 
                          ,v_commisionassignment varchar
                          ,isCommonSetting boolean
                          ) 
is
 UserSID number;
begin
 
 if isCommonSetting then
   UserSID :=0;
  else 
   UserSID :=SBLogin.UserID;  
 end if;  
 dbms_output.put_line(to_char(userSID));
 Update Commision_trans
  set
     name = v_name
    ,debt = v_debt 
    ,credit = v_credit
    ,additionalDebt = v_additionalDebt
    ,additionalCredit = v_additionalCredit
    ,assignment = v_assignment
    ,commisionassignment = v_commisionassignment
    ,UserID = UserSID
  where 
   ID = v_ID;
 commit;    
end;

procedure Delete_Commision_Trans(settingID commision_trans.id%type)
is
begin
 Delete from Commision_trans
  where ID = settingID;
 commit;
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

function GetAccountName(accname number) return varchar
is 
AccountName account.name%type;
begin
 Select name into AccountName from Account
  where ID = accname;
return AccountName; 
Exception When NO_DATA_FOUND Then
return '';
end;

procedure ins_commission_trans_km 
(v_id number, v_debt number, v_credit number,v_c_value number,v_d_value number,v_ddate date)
is
begin
delete from commision_trans_km;
insert into commision_trans_km 
(id, debt, credit, c_value, d_value, ddate)
values
(v_id, v_debt, v_credit, v_c_value, v_d_value, v_ddate);
commit;
end;
function Getvalrate(accname number) return number
is 

valrate temprate.ostat%type;


begin
 Select ostat into valrate from temprate
  where val_kod = accname;
return valrate; 
Exception When NO_DATA_FOUND Then
return '';
end;
function GetCurrencyName(v_val_acc avalute.valute%type)
   return avalute.val_name%type
is
 CurrencyName avalute.val_name%type;
begin
 Select val_name into CurrencyName from  Avalute
  where valute = v_val_acc;  
 return CurrencyName; 
 Exception When NO_DATA_FOUND Then return '';
end;  

function GetValuteName(v_val_acc avalute.valute%type)
   return avalute.valu_name%type
is
 CurrencyName avalute.valu_name%type;
begin
 Select valu_name into CurrencyName from  Avalute
  where valute = v_val_acc;  
 return CurrencyName; 
 Exception When NO_DATA_FOUND Then return '';
end;  

function GetGroupName(groupID QRP_KLIE.id%type) return QRP_KLIE.name%type
is
 GroupName QRP_KLIE.name%type;
begin
 Select name into GroupName from QRP_KLIE
  where ID = groupID;
 return GroupName;
 Exception When NO_DATA_FOUND Then return '';
end; 
/*procedure Ins_Account_SL(v_accno varchar2, v_accname varchar2, v_accvalcode varchar2) 
is
begin
delete from Account_SL;
Insert into Account_SL (accno, accname, accvalcode)
values(v_accno, v_accname, v_accvalcode);
commit;
end Ins_Account_SL;
*/
function GetAccountCurrency(AccountID Account.ID%type)
   return avalute.val_name%type
is
 CurrencyName avalute.val_name%type;
begin
 Select 
   val_name into CurrencyName
 from  
    Account AC,Avalute AV
 where 
   Ac.ID = AccountID and  
     Ac.val_acc = Av.valute;  
 return CurrencyName; 
 Exception When NO_DATA_FOUND Then return '';
end;  

function GetAccountval_name(AccountID Account.ID%type)
   return avalute.valu_name%type
is
 CurrencyName avalute.valu_name%type;
begin
 Select 
   valu_name into CurrencyName
 from  
    Account AC,Avalute AV
 where 
   Ac.ID = AccountID and  
     Ac.val_acc = Av.valute;  
 return CurrencyName; 
 Exception When NO_DATA_FOUND Then return '';
end;  

procedure SetTransactions(commisionID Commision_trans.id%type
                         ,DebitID provarch.debt%type
                         ,CreditID provarch.kredit%type
                         ,DebitAmmount provarch.ammount%type
                         ,CreditAmmount provarch.ammount%type
                         ,TransDate provarch.dat%type default sbop.get_date)
is
 ClientGroup Customers.group_klie%type;
 MinAmmount TariffScale.ammount%type;
 MaxAmmount TariffScale.ammount%type;
 ReturnedAmmount provarch.ammount%type;
 TransactionID provarch.id%type;
 TariffNotFound boolean default false; 
 GroupNotFound boolean;
 TransactionDate date;
 TDebit number;
 TCredit number;
 TransactionAmmount provarch.ammount%type;
 DebitRate provarch.rate_d%type;
 CreditRate provarch.rate_c%type;
 Tariffs c_TariffScale%rowtype; 
 commision c_Commision%rowtype;
 MinValues c_MinValues%rowtype; 
 MaxValues c_MaxValues%rowtype;
begin
 open c_Commision(commisionID);
  fetch c_Commision into Commision;
 close c_Commision;
 
 --Not allowed
 if ((Commision.AdditionalDebt = 0) and (Commision.AdditionalCredit = 0))
 -- or 
     --((Commision.Debt = 0) and (Commision.Credit = 0))
      then
  return;
 end if; 
 -- raise_application_error(-20091,'Set up your accounts!');
 --Not allowed

 if --(
 (Commision.AdditionalDebt <> 0) 
 --and (Commision.Debt <> 0)) 
 then
  TCredit :=CreditID; 
  TDebit :=Commision.AdditionalDebt;
  TransactionAmmount :=DebitAmmount;
 else
  TDebit :=DebitID;
  TCredit :=Commision.AdditionalCredit; 
  TransactionAmmount :=CreditAmmount;
 end if;
 
 if --(
 (Commision.AdditionalCredit <> 0) 
 --and (Commision.Credit <> 0)) 
 then
  TCredit :=Commision.AdditionalCredit;
  TDebit :=DebitID; 
  TransactionAmmount :=DebitAmmount;
 end if;
 
 open c_CustomerGroup(TDebit);
  fetch c_CustomerGroup into ClientGroup;
  GroupNotFound := ((ClientGroup is Null));
 close c_CustomerGroup;

 if GroupNotFound then 
   raise_application_error(-20098,'Client must have a group!');
 end if;
   
 open c_TariffScale(ClientGroup,commisionID,TransactionAmmount);
  fetch c_TariffScale into Tariffs;
  TariffNotFound := c_TariffScale%notfound;
 close c_TariffScale;
 
 open c_MinValues(ClientGroup,commisionID);
  fetch c_MinValues into MinValues;
  dbms_output.put_line(to_char(MinValues.minvalue));
 close c_MinValues;  

 open c_MaxValues(ClientGroup,commisionID);
  fetch c_MaxValues into MaxValues;
  dbms_output.put_line(to_char(MaxValues.maxvalue));
 close c_MaxValues;  
 
 if TariffNotFound then
   if TransactionAmmount < MinValues.MinValue then
    ReturnedAmmount := (MinValues.MinValue*MinValues.percent)/100;
    dbms_output.put_line(to_char(ReturnedAmmount));
   end if; 
   if TransactionAmmount > MaxValues.MaxValue then 
    ReturnedAmmount := (MaxValues.MaxValue*MaxValues.percent)/100;
    dbms_output.put_line(to_char(ReturnedAmmount));
   end if; 
  else
   if (Tariffs.Ammount is Null) then
    ReturnedAmmount :=(TransactionAmmount*Tariffs.percent)/100;
   else
    ReturnedAmmount :=Tariffs.Ammount;   
   end if; 
 end if;
 
 dbms_output.put_line(to_char(ReturnedAmmount));
 if TariffNotFound then
  dbms_output.put_line(' TariffNotFound = true ');
 else
  dbms_output.put_line(' TariffNotFound =False '); 
 end if;
 
 
 open c_CurrencyRate(TDebit);
  fetch c_CurrencyRate into DebitRate;
 close c_CurrencyRate;

 open c_CurrencyRate(TCredit);
  fetch c_CurrencyRate into CreditRate;
 close c_CurrencyRate;

 --Beginning Transactions
--  select tek_dat into TransactionDate from sysdat;
 TransactionID := 
               sb_transaction.transaction_add (
                              debitid=> TDebit,
                              creditid=> TCredit,
                              debitamount=> Round(ReturnedAmmount),
                              creditamount=> null,
                              lamount=> null,
                              debitrate=> Null,--DebitRate,
                              creditrate=> Null,--CreditRate,
                              trname=>  Commision.CommisionAssignment,
                              flags => 0,
                              parentID => null,
                              transactiondate=> TransDate);
                        

 --Ending Transactions  

 end;      

function GetAccountCurrencyID(AccountID Account.id%type) return Avalute.valute%type
is
 CurrencyID Avalute.valute%type;
begin
 if (AccountID is Null) or (AccountID = 0)  then
  return 0;
 end if; 
 select val_acc into CurrencyID
  from  Account
  where ID = AccountID;
 return CurrencyID; 
 Exception When NO_DATA_FOUND Then
  return 0;
   
end;         

procedure CheckSides(commisionID Commision_trans.id%type)
is
 commision Commision_trans%RowType;
begin
 select 
    * into Commision 
 from 
    Commision_trans
 where ID = commisionID;   
 if ((not(commision.debt is null) and not(commision.debt is null)) and
   ((commision.additionaldebt is null) and (commision.additionalcredit is null))) then
   return;
 end if;  
end;

function IsCommonSetting(uID Commision_trans.userid%type) return boolean
is
 result boolean;
begin
 if uID = 0 then
   result := true; 
  else
   result := false; 
 end if;
 return result;   
end;

END;
/


