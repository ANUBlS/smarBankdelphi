create or replace PACKAGE out_p_statement
AUTHID CURRENT_USER
  IS
Function CheckCurrency 
(
   D_OR_K       NUMBER
,  CURRENCYID_D NUMBER 
,  CURRENCYID_C NUMBER
,  AMMOUNT      NUMBER
,  AMMOUNT_C    NUMBER
,  LAMMOUNT     NUMBER
)    
return Number;

PROCEDURE GetExtracTrans
(
  TableName Varchar2
, v_date_1 date
, v_date_2 date
, rateDif number
, TurnYesNo number
);
FUNCTION IIFBALANCE(
        n integer
,       TypeId1  integer
,       TypeId2  integer
,       aRemainder number
,       PRemainder number
) RETURN  number;

  procedure   getBankInfo
  (
  BankName OUT VarChar2
 ,BankCode OUT Number
 ,Manager  OUT VarChar2
 ,Accountant OUT varchar2        
  );
  Procedure LastUpdate(dId number,cId number,trDate date);
  FUNCTION fdate(v_Date IN Date, v_OpenDate in Date) return date;
  Function GetUserName return varchar2;
  Function GetBankDay return date;
  Function IsWorkDay(D date ) return BOOLEAN;
  PROCEDURE GetExtraction
(
   v_user      number
,  v_filial    number
,  v_BalType   number
,  v_Currency  Number
,  v_kli_id    varchar2
,  v_acc_no    varchar2
,  v_bal_cn    varchar2
,  v_date_beg  date
,  v_date_end  date
,  RateDif Number    -- Kurs fergi 0-he 1 yox
,  TurnYesNo number  -- Dovriyyeler 0-he 1-yox
);
end;

