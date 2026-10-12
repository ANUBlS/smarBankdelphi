-- Start of DDL Script for Package Body SMART.P_EXTRACTION
-- Generated 18-Jun-2004 12:45:36 from SMART@SB

-- Drop the old instance of P_EXTRACTION
DROP PACKAGE p_extraction
/

CREATE OR REPLACE 
PACKAGE p_extraction
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
   v_filial    number
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
/

-- Grants for Package
GRANT EXECUTE ON p_extraction TO sbr_statement
/

CREATE OR REPLACE 
PACKAGE BODY p_extraction IS
UserName varchar(32);
BankDay date;
Type DynCursor is ref cursor;  
---------------------------------------------------------------
FUNCTION fdate( v_Date IN Date, v_OpenDate in Date) return date as
OptDate Date;
begin
if v_Date<v_OpenDate then
 OptDate:=v_OpenDate;
else
 OptDate:=v_Date;
end if;
/*
strsql:='Select open_dat from  account where acc_id=' || TO_CHAR(v_id);
open maxDate for strsql; 
LOOP
 FETCH maxDate INTO OptDate;
  EXIT WHEN maxDate%NOTFOUND;
  dbms_output.put_line('Statement DateBeg ' || to_char(OptDate));
END LOOP;
CLOSE maxdate;
*/
return OptDate;
end;
-------------------------------------------------
PROCEDURE GetExtraction
(
   v_filial    number
,  v_BalType   number
,  v_Currency  Number
,  v_kli_id    varchar2
,  v_acc_no    varchar2
,  v_bal_cn    varchar2
,  v_date_beg  date
,  v_date_end  date
,  RateDif Number    -- Kurs fergi 0-he 1 yox
,  TurnYesNo number  -- Dovriyyeler 0-he 1-yox
)
is
   DateBeg date;
   DateEnd date;
   UserTab Varchar2(96);
   StrSql varchar2(1000);
   Str_For_Condition varchar2(500);
   Str_For_Currency varchar2(92);
   Str_for_filial varchar2(92);
   maxDate dynCursor;
   RateDiffCondition varchar2(92);
BEGIN
DateBeg:=v_date_beg;
DateEnd:=v_date_End;

STRSQL:='Truncate table EXTRACTION';
 Execute Immediate strsql;
STRSQL:='Truncate table EXTRACTIONTRANS';
 EXECUTE IMMEDIATE StrSql;

If v_filial=-1 then
 Str_for_filial:='';
Else
 Str_for_filial:=' and a1.filial=' || v_filial;
End if; 

If v_Currency=-1 then
-- Str_For_Currency:=' and a1.CurrencyId is not null ';
 Str_For_Currency:=' ';
Else
 Str_For_Currency:=' and a1.CurrencyId=' || v_Currency;
End if;

If (v_kli_id='-1') and (v_acc_no='''-1''') and (v_bal_cn='-1') then
 str_for_condition:='';
Else
 str_for_condition:='
 and ( a1.BalanceCode in ('||v_bal_cn||') 
    or a1.AccountNumber in ('||v_acc_no||')
    or a1.CustomerId in ('||v_kli_id||') 
     )';
End If;

strsql:=
' 
Insert into EXTRACTION
 Select
   a1.*
 , 0         PreviousRest
 , sysdate   LastOpDate  
 , P_EXTRACTION.fdate('''||DateBeg||''',OpenDate) DatDate  
-- , sysdate   DatDate
 , 0         Ostat
 , 0         Pok_Ostat
 , 0         Obr_d
 , 0         Obr_k
 , 0         Pok_Obr_d
 , 0         Pok_Obr_k
 , ''(P)''   AP_beg
 , to_date('''||DateEnd||''') EndDate
 , 0         EndOstat
 , 0         EndPok_Ostat
 , 0         EndObr_d
 , 0         EndObr_k
 , 0         EndPok_Obr_d
 , 0         EndPok_Obr_k
 , ''(M)''   AP_end
from v_Account'||v_BalType||' a1
where a1.OpenDate<=''' ||DateEnd || ''''
|| Str_For_Currency
|| str_for_condition
|| Str_for_filial;
--|| ' order by accountnumber';
--dbms_output.put_line(str_for_condition);
EXECUTE IMMEDIATE StrSql;

Update EXTRACTION e set 
(e.endostat, e.endpok_ostat, e.endobr_d, e.endobr_k, e.endpok_obr_d, e.endpok_obr_k, AP_end)
= (select 
  a.ostat   , a.pok_ostat   , a.obr_d   , a.obr_k   , a.pok_obr_d   , a.pok_obr_k 
 ,decode(sign(a.pok_ostat),1,'(P)',0,'(P)',-1,'(A)','(P)')
 from archost a where e.AccountId=a.acc_id and a.datdate=
 (select max(datdate) from archost a1 where datdate<=DateEnd));
	
Update EXTRACTION e set 
(e.lastopdate,  e.datdate,  e.ostat, e.pok_ostat, e.obr_d, e.obr_k, e.pok_obr_d, e.pok_obr_k, 
 AP_Beg)=
(select
  a.lastopdate, a.datdate, a.ostat, a.pok_ostat, a.obr_d, a.obr_k, a.pok_obr_d, a.pok_obr_k, 
 decode(sign(a.pok_ostat),1,'(P)',0,'(P)',-1,'(A)','(P)')
 from 
  archost a 
 where 
 e.AccountId=a.acc_id and 
 a.datdate=
 (select max(datdate) from archost a1 where datdate<DateBeg));

-- Mezenne fergi Son emeliyyat tarixi sayilmir
update EXTRACTION e set e.LastOpDate = 
( 
  select max(dat) from provarch p 
	where (p.debt=e.AccountId or kredit=e.AccountId) 
     and p.dat <DateBeg and (P.vid_op<>1)
 );  

Update EXTRACTION e set e.datdate = DateBeg where e.datdate is null;
GetExtracTrans(UserTab,v_date_beg,v_date_end,RateDif,TurnYesNo);
End;
------------------------------------------------------
PROCEDURE GetExtracTrans
(
  TableName Varchar2
, v_date_1 date
, v_date_2 date
, RateDif number
, TurnYesNo number
)
is
date_beg date;
date_end date;
STRSQL varchar2(1500);
v_Cursor number(9);
nRow number(9);
UserTab varchar2(64);

Begin
date_beg:=v_date_1; --GetApproximateDate(AccountID, v_date_1);
date_end:=v_date_2; --GetApproximateDate(AccountID, v_date_2);

Insert Into EXTRACTIONTRANS  
 Select 
 p.id
 , p.dat
 , p.tim
 , e.CurrencyId
 , e.AccountId OwnAccountID
 , p.kredit PairAccountId
 , a.acc_no PairAccountName
 , p.Currencyid_c PairCurrencyId
 , p_extraction.checkcurrency(0,p.val_acc,p.currencyid_c,p.ammount,p.ammount_c,p.lammount) debit
 , 0 Kredit
 , p.lammount Ldebit
 , 0 LKredit
 , p.vid_op OperationCode
 , p.name
 from EXTRACTION 
 e, provarch p, account a 
  where 
    e.AccountId=p.debt 
    and p.kredit=a.id 
    and dat>= to_char(date_beg)
    and dat<= to_char(date_end)
  union 
 select 
 p.id
 , p.dat
 , p.tim
 , e.CurrencyId
 , e.AccountId OwnAccountID
 , p.debt PairAccountId
 , a.acc_no PairAccountName
 , p.val_acc PairCurrencyId
 , 0 debit
 , p_extraction.checkcurrency(1,p.val_acc,p.currencyid_c,p.ammount,p.ammount_c,p.lammount) Kredit
 , 0 Ldebit
 , p.lammount LKedit
 , p.vid_op OperationCode
 , p.name
 from EXTRACTION
  e, provarch p, account a 
  where 
        e.AccountId=p.kredit 
  and p.debt=a.id
  and dat>=  to_char(date_beg)
  and dat<=  to_char(date_end)
;

if RateDif=1 then 
 Delete from EXTRACTIONTRANS where OperationCode=1;
end if;


if TurnYesNo=0 then 
 Delete from EXTRACTION where not (accountid in 
  (select distinct ownaccountID from EXTRACTIONTRANS));
end if;

End;

--******************************************************
Function GetUserName return varchar2 is
begin
 return UserName;
end;

--******************************************************
Function CheckCurrency 
(
   D_OR_K       NUMBER
,  CURRENCYID_D NUMBER 
,  CURRENCYID_C NUMBER
,  AMMOUNT      NUMBER
,  AMMOUNT_C    NUMBER
,  LAMMOUNT     NUMBER
)    
return Number is
Result number;
begin
Result:=0;
if CURRENCYID_D=CURRENCYID_C then
  Result:= Ammount;
  Return Result;
end if;

If D_OR_K=0 then -- debit
 if CURRENCYID_D=0 then 
  Result:= Ammount_c;
 else
  Result:= Ammount;
 end if;
else -- kredit
 if CURRENCYID_C=0 then 
  Result:= Ammount;
 else
  Result:= Ammount_C;
 end if;
End if;
 return Result;
end;
--*****************************************
FUNCTION IIFBALANCE
  (
        n integer
,       TypeId1  integer
,       TypeId2  integer
,       aRemainder number
,       pRemainder number
        )RETURN  number IS

value number(15,2);
BEGIN
if TypeId1=1 and TypeId2=2 then
 if n=-1 then
  value:=0;
 else
  value:=-(aRemainder+pRemainder);
 end if;
elsif TypeId1=2 and TypeId2=1 then
 if n=-1 then
  value:=-(aRemainder+pRemainder);
 else
  value:=0;
 end if;
elsif TypeId1=3 and TypeId2=1 then
 if n=-1 then
  value:=(aRemainder+pRemainder);
 else
  value:=0;
 end if;
elsif TypeId1=3 and TypeId2=2 then
 if n=-1 then
  value:=0;
 else
  value:=-(aRemainder+pRemainder);
 end if;
elsif TypeId1=TypeId2 then
 if n=-1 then
  value:=aRemainder;
 else
  value:=pRemainder;
 end if;
end if;
RETURN value;
END;

procedure   getBankInfo(
  BankName OUT VarChar2
 ,BankCode OUT Number
 ,Manager  OUT VarChar2
 ,Accountant OUT varchar2        
 ) IS
begin
   Select  bank,kod_b,sedr,buhaltr into bankname,bankcode,manager,accountant from bankinfo;
   Exception When no_data_found Then
   begin
     BankName :='';
     BankCode :=0;
     Manager  :='';
     AccountAnt:='';
   end;
end;

Function GetBankDay return date is
begin
  return BankDay;
end;

Function IsWorkDay (D date)  return Boolean is
begin
--   if ( to_char(datdate,'D-MM-YYYY') = '1-1-2002'
   -- when Holidays return false
   if (( to_char(D,'DD-MM') = '31-12' ) or
       ( to_char(D,'DD-MM') = '01-01' ) or
       ( to_char(D,'DD-MM') = '20-01' ) or
       ( to_char(D,'DD-MM') = '08-03' ) or
       ( to_char(D,'DD-MM') = '20-03' ) or
       ( to_char(D,'DD-MM') = '09-05' ) or
       ( to_char(D,'DD-MM') = '15-06' ) or
       ( to_char(D,'DD-MM') = '26-06' ) or
       ( to_char(D,'DD-MM') = '18-10' ) or
       ( to_char(D,'DD-MM') = '12-11' ) or
       ( to_char(D,'DD-MM') = '17-11' ) 
      )
   then 
        return false;
   end if;
   -- when work day return true
   if (( to_char(D,'D') >= 2 ) and
       ( to_char(D,'D') <= 6 )
      )
   then 
        return true;             
   end if;
   
  return false;
end;
------------------------------------------
Procedure LastUpdate(dId number, cId number, trDate date) as

 dFirst date;
 cFirst date;
 dLast date;
 cLast date;
begin
execute immediate 'ALTER TRIGGER UPD_SET_OF_LASTOPDAY disable';
 dbms_output.put_line(to_char(dId)||' '||to_char(cId)||' '||to_char(TrDate));
 select lastopdate into dFirst  from archost where acc_id=dId and datdate=trDate;
 select lastopdate into cFirst from archost where acc_id=cId and datdate=trDate;
  dbms_output.put_line('First ' || to_char(dFirst)||' '||to_char(cFirst));

 select max(lastopdate) into dLast  from archost 
  where acc_id=dId and datdate<dFirst;

 select max(lastopdate) into cLast  from archost 
  where acc_id=cId and datdate<cFirst;
  dbms_output.put_line('Last ' || to_char(dLast)||' '||to_char(cLast));

update archost set lastopdate=dLast where acc_id=dId and datdate=trDate;
update archost set lastopdate=cLast where acc_id=cId and datdate=trDate;

execute immediate 'ALTER TRIGGER UPD_SET_OF_LASTOPDAY ENABLE';				
end;

begin
  select user, trunc(tek_dat) into UserName, BankDay from sysdat;
--  dbms_output.put_line('*');
end;
/


-- End of DDL Script for Package Body SMART.P_EXTRACTION

