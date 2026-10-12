-- Start of DDL Script for Package Body SMART.P_EXTRACTION
-- Generated 6-Apr-2005 14:29:28 from SMART@SB

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


Procedure GetBalance
(
  v_BalType integer
, v_currency integer  -- -1 All Ccurrency
, v_form integer      --  0-ostat = 1-pok_ostat
, v_date_beg date
, v_date_end date
);

PROCEDURE TO_TABLE
(
  UserTab varchar2
, StrSql  varchar2
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
/

CREATE OR REPLACE 
PACKAGE BODY p_extraction IS
UserName varchar(32);
BankDay date;
Type DynCursor is ref cursor;  

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
)
is
   DateBeg date;
   DateEnd date;
   UserTab Varchar2(96);
   StrSql varchar2(2000);
   Str_For_Condition varchar2(500);
   Str_For_Currency varchar2(92);
   Str_for_filial varchar2(92);
   Str_for_user varchar2(92);
   maxDate dynCursor;
   RateDiffCondition varchar2(92);
   OperatorCondition varchar(92);
   
BEGIN
DateBeg:=v_date_beg;
DateEnd:=v_date_End;

If v_user=-1 then
 Str_for_user:='';
Else
 Str_for_user:=' and ac.OP_ID=' || v_user;
End if; 

if v_filial=-1 then
 Str_for_filial:='';
else
 Str_for_filial:=' and ac.filial=' || v_filial;
end if; 

if v_Currency=-1 then
 Str_For_Currency:=' ';
else
 Str_For_Currency:=' and ac.val_acc=' || v_Currency;
end if;
  
if (v_kli_id='-1') and (v_acc_no='''-1''') and (v_bal_cn='-1') then
 str_for_condition:='';
else
 str_for_condition:='
 and ( ac.Bal_Cn1 in ('||v_bal_cn||') 
    or ac.Acc_No in ('||v_acc_no||')
    or ac.kli_id in ('||v_kli_id||') 
     )';
end if;

UserTab:= user ||'.EXTRACTION_'|| user;
strsql:=
' create table ' || UserTab || ' as
select
   c.name       CustomerName
 , c.inn        CustomerVoin
 , ac.kli_id    CustomerId
 , ac.name      AccountName
 , ac.acc_no    AccountNumber
 , ac.id        AccountId
 , ac.op_id     OperatorId
 , ac.val_acc   CurrencyId
 , av.val_name  CurrencyName
 , ac.bal_cn1   BalanceCode
 , b.BalName    BalanceName
 , ac.open_dat  OpenDate
 , ac.filial    Filial
 , ac.close_dat
 , b.ratedifference
 , b.CloseBalance
 , b.typeid
 , b.additionaltypeid
 , b.saldo
 , 0         PreviousRest
 , sysdate   LastOpDate  
 , P_EXTRACTION.fdate('''||DateBeg||''',ac.open_dat) DatDate  
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
from 
  account ac
, avalute av
, bal_spr1 b
, customers c
where 
    ac.val_acc = av.valute
and ac.bal_cn1=b.bal_cn
and ac.kli_id=c.id
and ac.open_dat<=''' ||DateEnd || ''''
|| Str_For_Currency
|| str_for_condition
|| Str_for_filial
|| Str_for_user
|| ' order by accountnumber';

to_table(UserTab,StrSql);
commit;
strsql:='
Update '||UserTab||' e set 
(e.endostat, e.endpok_ostat, e.endobr_d, e.endobr_k, e.endpok_obr_d, e.endpok_obr_k, AP_end)
=
(select 
  a.ostat   , a.pok_ostat   , a.obr_d   , a.obr_k   , a.pok_obr_d   , a.pok_obr_k 
 ,decode(sign(a.pok_ostat),1,''(P)'',0,''(P)'',-1,''(A)'',''(P)'')
 from archost a where e.AccountId=a.acc_id and a.datdate=
 (select max(datdate) from archost a1 where datdate<='''||DateEnd||'''))';
	
EXECUTE IMMEDIATE StrSql;
commit;

strsql:='
update '||UserTab||' e set 
(e.lastopdate,  e.datdate,  e.ostat, e.pok_ostat, e.obr_d, e.obr_k, e.pok_obr_d, e.pok_obr_k, 
 AP_Beg)
=
(select
  a.lastopdate, a.datdate, a.ostat, a.pok_ostat, a.obr_d, a.obr_k, a.pok_obr_d, a.pok_obr_k, 
 decode(sign(a.pok_ostat),1,''(P)'',0,''(P)'',-1,''(A)'',''(P)'')
 from 
  archost a 
 where 
 e.AccountId=a.acc_id and 
 a.datdate=
 (select max(datdate) from archost a1 where datdate<'''||DateBeg||'''))';
update a1 set c5 = strsql;commit;
EXECUTE IMMEDIATE StrSql;

if RateDif =1 then
 RateDiffCondition :=' and (P.ammount<>0 and P.ammount_c<>0)';
else
 RateDiffCondition :='';
end if; 
strsql:='
update '||UserTab||' e set 
 e.LastOpDate = (select max(dat) from provarch p 
	  where (p.debt=e.AccountId or kredit=e.AccountId) 
	   and  p.dat <'''||DateBeg||''''||RateDiffCondition||')
';  
update A1 set c5=strsql;
EXECUTE IMMEDIATE StrSql;
commit;
strsql:='
update '||UserTab||' e set 
 e.datdate = ''' || DateBeg || ''' 
 where e.datdate is null';
EXECUTE IMMEDIATE StrSql;
GetExtracTrans(UserTab,v_date_beg,v_date_end,RateDif,TurnYesNo);
commit;
end;

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

begin
date_beg:=v_date_1; --GetApproximateDate(AccountID, v_date_1);
date_end:=v_date_2; --GetApproximateDate(AccountID, v_date_2);
UserTab := user ||'.EXTRACTIONTRANS_'|| user;

STRSQL:='create table ' || UserTab || ' as
 select 
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
 from ' || TableName || ' e, provarch p, account a 
  where 
        e.AccountId=p.debt 
        and p.kredit=a.id '
 || ' and dat>= ''' || to_char(date_beg) || ''''
 || ' and dat<= ''' || to_char(date_end) || ''''
 || ' union ' ||
' select 
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
 from ' || TableName || ' e, provarch p, account a 
  where 
        e.AccountId=p.kredit 
   and p.debt=a.id'
 || ' and dat>= ''' || to_char(date_beg) || ''''
 || ' and dat<= ''' || to_char(date_end) || ''''
;
--update a1 set c5 = strsql;commit;
To_Table(UserTab, STRSQL);
commit;

if RateDif=1 then 
 Strsql:='delete from '||user||'.EXTRACTIONTRANS_'||user||' where OperationCode=1';
 Execute Immediate strsql;
end if;


Strsql:='delete from '||user||'.EXTRACTION_'||user||
' where not (accountid in (select distinct ownaccountID from '||user||'.EXTRACTIONTRANS_'
||user||'))';
if TurnYesNo=0 then 
 Execute Immediate strsql;
end if;
commit; 
end;

--******************************************************
Function GetUserName return varchar2 is
begin
 return UserName;
end;

--******************************************************
--******************************************************
Procedure GetBalance
(
  v_BalType integer
, v_currency integer  -- -1 All Ccurrency
, v_form integer      -- = 0-ostat = 1-pok_ostat
, v_date_beg date
, v_date_end date
)
is

--v_currency integer:=0;
--v_bal   integer;
--datebeg date:='10-apr-2002';
--dateend date:='02-may-2002';
date_beg date;
date_end date;
RepForm  integer;
Remainder varchar2(64);
DTurnover varchar2(64);
KTurnover varchar2(64);
SCurrency varchar2(64);
UserTab   varchar2(64); 
Strsql    varchar2(1500);
viewName1 varchar2(64);
viewName2 varchar2(64);
viewName3 varchar2(64);

begin
UserTab:= UserName ||'.BALANCE_' || UserName;

if v_currency=-1 then
 SCurrency:='';
 RepForm:=1;
else
 SCurrency:=' CurrencyId=' || v_currency || ' and ';
 RepForm:=v_form;
end if;

if RepForm=0 then
 Remainder:='ostat';
 DTurnover:='Obr_d';
 KTurnover:='Obr_k';
else
 Remainder:='pok_ostat';
 DTurnover:='Pok_Obr_d';
 KTurnover:='Pok_Obr_k';
end if;

if v_date_end=BankDay and v_date_beg=BankDay then
 viewName1:='v_tbalance'||v_BalType;  -- ostatok na konech
 viewName2:='v_tbalance'||v_BalType;  -- oboroti
 viewName1:='v_tbalance'||v_BalType;  -- ostatok na nachala
--elsif
end if; 

select max(datdate) into date_beg from v_balance1 where datdate<=v_date_beg; 
select max(datdate) into date_end from v_balance1 where datdate<=v_date_end; 

if date_beg is null or date_end is null then
 date_beg:=v_date_beg;
 date_end:=v_date_end;
-- raise_application_error(-20366, 'Wrong date'); 
end if;

strsql:='create table '|| UserTab|| ' as 
select balname, begDate.BalanceCode bal_cn
,begDate.DatDate DateBeg
  , P_EXTRACTION.iifbalance(-1,b.TypeID ,b.AdditionalTypeID, begDate.activ_beg,begDate.passiv_beg) activ_beg 
  , P_EXTRACTION.iifbalance(+1,b.TypeID ,b.AdditionalTypeID, begDate.activ_beg,begDate.passiv_beg) passiv_beg
  , Obr.obr_d, Obr.obr_k
  , endDate.DatDate DateEnd
  , P_EXTRACTION.iifbalance(-1,b.TypeID, b.AdditionalTypeID, endDate.activ_end,endDate.passiv_end) activ_end
  , P_EXTRACTION.iifbalance(+1,b.TypeID, b.AdditionalTypeID, endDate.activ_end,endDate.passiv_end) passiv_end
from 
(
select BalanceCode, '''||date_beg ||''' datDate 
,decode (sign(sum('||Remainder||')),-1, abs(sum('||Remainder||')),0) activ_beg
,decode (sign(sum('||Remainder||')),+1, abs(sum('||Remainder||')),0,0,0) passiv_beg  
 from v_balance'||v_BalType||' where '|| SCurrency ||'
  datdate ='''||date_beg||''' group by BalanceCode
) begdate
,(
select BalanceCode, sum('|| DTurnover||') obr_d,sum('||KTurnover||') obr_k 
 from v_balance'||v_BalType||' where ' || SCurrency ||'
 datdate>=''' ||date_beg|| ''' and datdate<=''' ||date_end|| ''' group by BalanceCode
) obr
,(
select BalanceCode ,'''||date_end  ||''' DatDate
,decode (sign(sum('||Remainder ||')),-1, abs(sum('||Remainder||')),0) activ_end
,decode (sign(sum('||Remainder ||')),+1, abs(sum('||Remainder||')),0,0,0) passiv_end  
 from v_balance'||v_BalType||' where  '|| SCurrency ||'
   datdate ='''||date_end||''' group by BalanceCode
) endDate
, bal_spr'||v_BalType||' b
where begDate.BalanceCode=EndDate.BalanceCode and begDate.BalanceCode=obr.BalanceCode 
and b.bal_cn=begDate.BalanceCode 
';

to_table(UserTab,strsql);
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


PROCEDURE TO_TABLE
(
  UserTab IN varchar2
, StrSql  IN varchar2
)
is
 nRow integer;
 v_Cursor integer;
 vCount Integer;
 DotPos integer := Instr(UserTab, '.');
 ATableName varchar2(32);
BEGIN
	if DotPos <> 0 then
		ATableName := substr(UserTab, DotPos+1, Length(UserTab)-DotPos);
	else
		ATableName := UserTab; 
	end if;
	
	select count(*)
		into vCount 
	from sys.all_tables
	where (owner = GetUserName) and (TABLE_NAME = Upper(ATableName));
commit;
if vCount<>0 then
  EXECUTE IMMEDIATE 'drop table ' || UPPER(UserTab);
end if;
  EXECUTE IMMEDIATE StrSql;
END;

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

