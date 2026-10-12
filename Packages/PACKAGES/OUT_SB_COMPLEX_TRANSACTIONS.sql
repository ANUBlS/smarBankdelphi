CREATE OR REPLACE PACKAGE OUT_SB_COMPLEX_TRANSACTIONS
  IS
 	/* **************************************************************** */
 /*        SmartBank OUT_SB_COMPLEX_TRANSACTIONS package             */
/*  Copyright 2006, Smart Systems Technology, Ltd.
                                 modified by Kenan MEMMEDOV        */  
 /* **************************************************************/

	
 
           
procedure CheckSides(commisionID Out_Commision_trans.id%type);
  procedure Delete_Commision_Trans(settingID Out_commision_trans.id%type);
  function GetAccountCurrency(AccountID out_Account.ID%type)
   return avalute.val_name%type;
  function GetAccountCurrencyID(AccountID out_Account.id%type) return Avalute.valute%type;
  function GetAccountNumber(AccountID number) return varchar;
  function GetCurrencyName(v_val_acc avalute.valute%type)
   return avalute.val_name%type;
  function GetGroupName(groupID Out_QRP_KLIE.id%type) return Out_QRP_KLIE.name%type;
  procedure Insert_Commision_Trans
                          (
                           v_name Out_commision_trans.name%type
                          ,v_debt Out_commision_trans.debt%type
                          ,v_credit Out_commision_trans.credit%type
                          ,v_additionalDebt number
                          ,v_additionalCredit number
                          ,v_assignment varchar
                          ,v_commisionassignment varchar
                          ,isCommonSetting boolean
                           );
  procedure update_commision_trans
                         (
                           v_ID Out_commision_trans.ID%type 
                          ,v_name Out_commision_trans.name%type
                          ,v_debt Out_commision_trans.debt%type
                          ,v_credit Out_commision_trans.credit%type
                          ,v_additionalDebt number
                          ,v_additionalCredit number
                          ,v_assignment varchar 
                          ,v_commisionassignment varchar
                          ,isCommonSetting boolean
                          );
  function IsCommonSetting(uID Out_Commision_trans.userid%type) return boolean;
  procedure SetTransactions(commisionID Out_Commision_trans.id%type
                         ,DebitID out_provarch.debt%type
                         ,CreditID out_provarch.kredit%type
                         ,DebitAmmount out_provarch.ammount%type
                         ,CreditAmmount out_provarch.ammount%type
                         ,TransDate out_provarch.dat%type default out_sbop.get_date);
END;
/
CREATE OR REPLACE PACKAGE BODY OUT_SB_COMPLEX_TRANSACTIONS
IS
  		/* **************************************************************** */
 /*        SmartBank OUT_SB_COMPLEX_TRANSACTIONS package             */
/*  Copyright 2006, Smart Systems Technology, Ltd.
                                 modified by Kenan MEMMEDOV        */  
 /* **************************************************************/

	
cursor c_TariffScale(CustomerGroup Out_TariffScale.groupid%type
                     ,operationID Out_TariffScale.commisionid%type
                     ,TransactionAmmount Out_TariffScale.ammount%type) is
 select 
   *
 from
   Out_TariffScale
 where 
   groupID = CustomerGroup and 
    commisionID = operationID and   
     TransactionAmmount >= MinValue and
      TransactionAmmount < MaxValue;   

cursor c_CurrencyRate(AccountID out_Account.id%type) is
 select 
   ostat
 from 
   out_Account A ,
    Operkurs O                               
 where
   A.ID = AccountID and
     A.val_acc = O.val_kod and
       O.dat = (select tek_dat from sysdat);
     
cursor c_CustomerGroup(AccountID out_Account.id%type) is
 select 
   C.group_klie
 from 
   out_Account A,
     Customers C
 where 
   A.ID = AccountID and
     A.kli_id = C.ID; 
     
cursor c_Commision(commisionID Out_Commision_trans.id%type) is
 select
   *        
 from 
   Out_Commision_trans
 where 
   ID = commisionID;      
   
cursor c_MinValues(CustomerGroup Out_TariffScale.groupid%type
                   ,operationID Out_TariffScale.commisionid%type) is
 select                   
   *
 from 
   Out_TariffScale
 where
   groupID = CustomerGroup and 
     CommisionID=operationID and
       minvalue=(select
                   min(minvalue)
                 from Out_TariffScale 
                 where 
                    groupID = CustomerGroup and CommisionID=operationID);     

cursor c_MaxValues(CustomerGroup Out_TariffScale.groupid%type
                   ,operationID Out_TariffScale.commisionid%type) is
 select                   
   *
 from 
   TariffScale
 where
   groupID = CustomerGroup and 
     CommisionID=operationID and
       maxvalue=(select
                   max(maxvalue)
                 from Out_TariffScale 
                 where 
                    groupID = CustomerGroup and CommisionID=operationID);     

                        
procedure Insert_Commision_Trans
                          (
                           v_name Out_commision_trans.name%type
                          ,v_debt Out_commision_trans.debt%type
                          ,v_credit Out_commision_trans.credit%type
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
 Insert into Out_Commision_Trans
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

procedure update_commision_trans
                         (
                           v_ID Out_commision_trans.ID%type 
                          ,v_name Out_commision_trans.name%type
                          ,v_debt Out_commision_trans.debt%type
                          ,v_credit Out_commision_trans.credit%type
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
 Update Out_Commision_trans
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

procedure Delete_Commision_Trans(settingID Out_commision_trans.id%type)
is
begin
 Delete from Out_Commision_trans
  where ID = settingID;
 commit;
end;

function GetAccountNumber(AccountID number) return varchar
is 
AccountNumber out_account.acc_no%type;
begin
 Select acc_no into AccountNumber from out_Account
  where ID = AccountID;
return AccountNumber; 
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

function GetGroupName(groupID Out_QRP_KLIE.id%type) return Out_QRP_KLIE.name%type
is
 GroupName Out_QRP_KLIE.name%type;
begin
 Select name into GroupName from Out_QRP_KLIE
  where ID = groupID;
 return GroupName;
 Exception When NO_DATA_FOUND Then return '';
end; 

function GetAccountCurrency(AccountID out_Account.ID%type)
   return avalute.val_name%type
is
 CurrencyName avalute.val_name%type;
begin
 Select 
   val_name into CurrencyName
 from  
    out_Account AC,Avalute AV
 where 
   Ac.ID = AccountID and  
     Ac.val_acc = Av.valute;  
 return CurrencyName; 
 Exception When NO_DATA_FOUND Then return '';
end;  

procedure SetTransactions(commisionID Out_Commision_trans.id%type
                         ,DebitID Out_provarch.debt%type
                         ,CreditID out_provarch.kredit%type
                         ,DebitAmmount out_provarch.ammount%type
                         ,CreditAmmount out_provarch.ammount%type
                         ,TransDate out_provarch.dat%type default sbop.get_date)
is
 ClientGroup Customers.group_klie%type;
 MinAmmount Out_TariffScale.ammount%type;
 MaxAmmount Out_TariffScale.ammount%type;
 ReturnedAmmount Out_provarch.ammount%type;
 TransactionID Out_provarch.id%type;
 TariffNotFound boolean default false; 
 GroupNotFound boolean;
 TransactionDate date;
 TDebit number;
 TCredit number;
 TransactionAmmount out_provarch.ammount%type;
 DebitRate out_provarch.rate_d%type;
 CreditRate out_provarch.rate_c%type;
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

function GetAccountCurrencyID(AccountID out_Account.id%type) return Avalute.valute%type
is
 CurrencyID Avalute.valute%type;
begin
 if (AccountID is Null) or (AccountID = 0)  then
  return 0;
 end if; 
 select val_acc into CurrencyID
  from  out_Account
  where ID = AccountID;
 return CurrencyID; 
 Exception When NO_DATA_FOUND Then
  return 0;
   
end;         

procedure CheckSides(commisionID Out_Commision_trans.id%type)
is
 commision Out_Commision_trans%RowType;
begin
 select 
    * into Commision 
 from 
    Out_Commision_trans
 where ID = commisionID;   
 if ((not(commision.debt is null) and not(commision.debt is null)) and
   ((commision.additionaldebt is null) and (commision.additionalcredit is null))) then
   return;
 end if;  
end;

function IsCommonSetting(uID Out_Commision_trans.userid%type) return boolean
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


