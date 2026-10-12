-- Start of DDL Script for Package SMART.SB_STATEMENT
-- Generated 07-08-2006 5:22:14 PM from SMART@SBTEST

CREATE OR REPLACE 
PACKAGE sb_statement

AUTHID CURRENT_USER
  IS

Type Cursor_Type is ref cursor ;  
  
  
  function GetAccNo(Acc_id number) return varchar2;
  function GetAccountID(AccountNumber varchar) return number;
  Function get_date return sysdat.tek_dat%type;
  Function CheckCurrency 
(
   d_or_k       number
,  currencyid_d number 
,  currencyid_c number
,  ammount      number
,  ammount_c    number
,  lammount     number
)    
return Number;
  function fLastOpdate(v_acc_id number,v_beg_dat date) return date;
  function fOstat(v_acc_id number,v_beg_dat date) return number;
  function fPok_Ostat(v_acc_id number,v_beg_dat date) return number;
  function fEndOstat(v_acc_id number,v_end_dat date) return number;
  function fEndPok_Ostat(v_acc_id number,v_end_dat date) return number;

  FUNCTION fDatDate( v_acc_id number,v_beg_dat date) return date;
  function fAp_Beg(v_acc_id number,v_beg_dat date) return varchar2;
  function fAp_End(v_acc_id number,v_beg_dat date) return varchar2;
  function fCurrencyId(v_acc_id number) return integer;
  function Extraction_Trans(v_beg_dat in date,
                          v_end_dat in date, 
                          v_kli_id in varchar2,
                          v_acc_no in varchar2,
                          v_bal_cn in varchar2,
                          v_filial    number,
                          v_currency  number,
                          v_user      number                          
                         )
       return varchar2;
       
       
  function get_user(v_op_id number) return varchar2;
  procedure OpenCursor(ACursor in out Cursor_Type, AStrParam IN VarChar2);
  function GetExtraction(v_beg_dat   date,
                       v_end_dat   date, 
                       v_kli_id    varchar2 default '-1',
                       v_acc_no    varchar2 default '''-1''',
                       v_bal_cn    varchar2 default '-1',
                       v_filial    number,
                       v_currency  number,
                       v_user      number)
      return varchar2;
  function notAccId(     v_beg_dat            date,
                       v_end_dat            date, 
                       v_kli_id    varchar2 default '-1',
                       v_acc_no    varchar2 default '''-1''',
                       v_bal_cn    varchar2 default '-1',
                       v_filial             number,
                       v_currency           number,
                       v_user               number,
                       v_turn_and_ratediff  varchar2)
      return    varchar2;
end;
/


CREATE OR REPLACE 
PACKAGE BODY sb_statement
  IS
procedure OpenCursor(ACursor IN OUT Cursor_Type, AStrParam IN VarChar2)
is begin
  if  ACursor%isOpen  then
  close ACursor;
  end if;  
  open ACursor For AStrParam;  
end; 
  
  
FUNCTION fDatDate( v_acc_id number,v_beg_dat date) return date 
is
result Date;
begin
select    nvl(ar.datdate,null) 
into      result 
from      archost ar 
where     ar.acc_id =v_acc_id 
and       ar.datdate=(
                     select   max(ar.datdate) 
                     from     archost ar 
                     where    ar.datdate<v_beg_dat
                     and      ar.acc_id=v_acc_id
               );
return result; 

end;  

 function GetAccountID(AccountNumber varchar) return number
 is 
  AccountID account.ID%type;
 begin
  Select ID into AccountID from Account
   where acc_no = AccountNumber;
  return AccountID; 
  Exception When no_data_found Then
   return 0;
 end;   
   

Function get_date return sysdat.tek_dat%type as
Currdate   sysdat.tek_dat%type;
begin
 select tek_dat into currdate from sysdat;
 return currdate;
end; 
 
 
   
 function GetAccNo(Acc_id number) return varchar2
 is 
  v_acc_no account.acc_no%type;
 begin
  Select acc_no into v_acc_no from Account
   where id = Acc_id;
  return v_acc_no; 
  Exception When NO_DATA_FOUND Then
   return '';
 end;    
 
 
Function CheckCurrency 
(
   d_or_k       number
,  currencyid_d number 
,  currencyid_c number
,  ammount      number
,  ammount_c    number
,  lammount     number
)    
return number is
Result number;
begin
Result:=0;
if currencyid_d=currencyid_c then
  Result:= Ammount;
  Return Result;
end if;

If d_or_k=0 then 
 if currencyid_d=0 then 
  Result:= Ammount_c;
 else
  Result:= Ammount;
 end if;
else 
 if currencyid_c=0 then 
  Result:= Ammount;
 else
  Result:= Ammount_C;
 end if;
End if;
 return Result;
end;
 
function fCurrencyId(v_acc_id number) return integer
is
result integer;
begin
    select val_acc into result from account where id=v_acc_id;
      return result;
    exception when no_data_found then
    return -1;          
end;
   
   
   
function fLastOpdate(v_acc_id number,v_beg_dat date) return date
is
result date;
begin
 
select max(pr.dat) 
into   result 
from   provarch pr 
where  
        (pr.debt =v_acc_id or pr.kredit=v_acc_id) 
    and (pr.dat<v_beg_dat)  
    and (nvl(pr.vid_op,0)<>1);

return result; 
 exception 
  when no_data_found
   then
return null;
end;   
  
function fOstat(v_acc_id number,v_beg_dat date) return number
is
result number;
begin
 
select  nvl(ar.ostat,null) 
into    result 
from    archost ar 
where   ar.acc_id =v_acc_id 
and     ar.datdate=(
                     select   max(ar.datdate)  
                     from     archost ar
                     where    ar.datdate<v_beg_dat
                     and      ar.acc_id=v_acc_id
                  );
return result; 

end;   

function fAp_Beg(v_acc_id number,v_beg_dat date) return varchar2
is   
result varchar2(10);
begin
       if fPok_Ostat(v_acc_id,v_beg_dat) >=0 then
       result:='(P)';
       else
       result:='(A)';       
       end if; 
return result;
end;  




function fAp_End(v_acc_id number,v_beg_dat date) return varchar2
is   
result varchar2(10);
begin       
       if fEndPok_Ostat(v_acc_id,v_beg_dat) >=0 then
       result:='(P)';
       else
       result:='(A)';       
       end if;
return result;
end; 
   
function fEndOstat(v_acc_id number,v_end_dat date) return number
is
result number;
begin
 
select  nvl(ar.ostat,null) 
into    result 
from    archost ar
where   ar.acc_id =v_acc_id 
and     ar.datdate=(
                     select   max(ar.datdate)  
                     from     archost ar 
                     where    ar.datdate<=v_end_dat
                     and      ar.acc_id=v_acc_id
                );
return result; 
end;   

   
function fPok_Ostat(v_acc_id number,v_beg_dat date) return number
is
result number;
begin
 
select nvl(ar.pok_ostat,null) 
into   result 
from   archost ar
where  ar.acc_id =v_acc_id 
and    ar.datdate=(
                     select  max(ar.datdate)  
                     from    archost ar  
                     where   ar.datdate<v_beg_dat
                     and     ar.acc_id=v_acc_id
                  );
return result; 

end;      

function fEndPok_Ostat(v_acc_id number,v_end_dat date) return number
is
result number;
begin
 
select  nvl(ar.pok_ostat,null) 
into    result 
from    archost ar 
where   ar.acc_id =v_acc_id 
and     ar.datdate=(
                     select   max(ar.datdate)  
                     from     archost ar
                     where    ar.datdate<=v_end_dat
                     and      ar.acc_id=v_acc_id
                );
return result; 

end;      


function notAccId(     v_beg_dat            date,
                       v_end_dat            date, 
                       v_kli_id             varchar2 default '-1',
                       v_acc_no             varchar2 default '''-1''',
                       v_bal_cn             varchar2 default '-1',
                       v_filial             number,
                       v_currency           number,
                       v_user               number,
                       v_turn_and_ratediff  varchar2)
      return    varchar2
is
 strsql         varchar2(2024);
 main_condition varchar2(2000);
 str_filial     varchar2(200);
 str_currency   varchar2(200); 
 str_user       varchar2(200); 
begin



if v_user=-1 then
 str_user:='';
else
 str_user:=' and OP_ID=' || v_user;
end if;

if v_filial=-1 then
 str_filial:='';
else
 str_filial:=' and filial=' || v_filial;
end if; 

if v_currency=-1 then
 str_currency:=' ';
else
 str_currency:=' and val_acc=' || v_currency;
end if;


if (v_kli_id='-1') and (v_acc_no='''-1''') and (v_bal_cn='-1') then
main_condition:=' ';
else
main_condition:='
 and ( Bal_Cn1 in ('||v_bal_cn||') 
    or Acc_No in ('||v_acc_no||')
    or kli_id in ('||v_kli_id||') 
     ) ';
     
end if;
if  v_turn_and_ratediff='ch_rate_and_turn' then             
 strsql:=
 'select id as accountid from account  where '
 ||'( id not in (select debt from provarch where dat between '''||v_beg_dat||''' and '''||v_end_dat||''' ))
and  
     ( id not in (select kredit from provarch where dat between '''||v_beg_dat||''' and '''||v_end_dat||'''  ))'
 ||main_condition||str_filial||str_user||str_currency;
else 
 strsql:=
 'select id as accountid from account  where '
 ||'( id not in (select debt from provarch where nvl(vid_op,0)<>1 and  dat between '''||v_beg_dat||''' and '''||v_end_dat||''' ))
and  
     ( id not in (select kredit from provarch where nvl(vid_op,0)<>1 and  dat between '''||v_beg_dat||''' and '''||v_end_dat||'''  ))'
 ||main_condition||str_filial||str_user||str_currency;
 end if;
  

return strsql;
end;


    

function GetExtraction(v_beg_dat   date,
                       v_end_dat   date, 
                       v_kli_id    varchar2 default '-1',
                       v_acc_no    varchar2 default '''-1''',
                       v_bal_cn    varchar2 default '-1',
                       v_filial    number,
                       v_currency  number,
                       v_user      number)
      return varchar2
is
 strsql   varchar2(2024);
 main_condition varchar2(2000);
 str_filial varchar2(200);
 str_currency varchar2(200);
 str_user varchar2(200);
begin

if v_user=-1 then
 str_user:='';
else
 str_user:=' and ac.OP_ID=' || v_user;
end if; 

if v_filial=-1 then
 str_filial:='';
else
 str_filial:=' and ac.filial=' || v_filial;
end if; 

if v_currency=-1 then
 str_currency:=' ';
else
 str_currency:=' and ac.val_acc=' || v_currency;
end if;


if (v_kli_id='-1') and (v_acc_no='''-1''') and (v_bal_cn='-1') then
main_condition:=' ';
else
main_condition:=' and ( ac.bal_cn1 in ('||v_bal_cn||') 
    or ac.acc_no in ('||v_acc_no||')
    or ac.kli_id in ('||v_kli_id||') 
     ) ';
     
end if;

                  

 strsql:=
 'select
  ac.id         AccountId,
  ac.kli_id     CustomerId, 
  ac.acc_no     AccountNumber,
  ac.op_id      OperatorId,
  ac.val_acc    CurrencyId,
  av.val_name   CurrencyName,
  ac.name       AccountName,
  c.inn         CustomerVoin,
  ac.bal_cn1    BalanceCode,
  ac.open_dat   OpenDate, 
  ac.filial     Filial,  
  sb_statement.flastopdate(ac.id,'||chr(39)||v_beg_dat||chr(39)||')    LastOpdate,
  sb_statement.fOstat(ac.id,'||chr(39)||v_beg_dat||chr(39)||')         Ostat,
  sb_statement.fPok_Ostat(ac.id,'||chr(39)||v_beg_dat||chr(39)||')     PokOstat,
  sb_statement.fEndOstat(ac.id,'||chr(39)||v_end_dat||chr(39)||')      EndOstat,
  sb_statement.fEndPok_Ostat(ac.id,'||chr(39)||v_end_dat||chr(39)||')  EndPokOstat,
  sb_statement.fDatDate(ac.id,'||chr(39)||v_beg_dat||chr(39)||')       DatDate,
  to_date('''||v_end_dat||''')                                         EndDate,
  sb_statement.fAp_Beg(ac.id,'||chr(39)||v_beg_dat||chr(39)||')        AP_Beg,
  sb_statement.fAp_End(ac.id,'||chr(39)||v_beg_dat||chr(39)||')        AP_End ' 
 ||' from account ac,customers c,avalute av '
 ||' where 
  ac.kli_id=c.id
  and  ac.val_acc = av.valute 
  and ac.open_dat<=''' ||v_end_dat || ''''
 ||str_currency
 ||main_condition
 ||str_filial
 ||str_user
 ||' order by ac.acc_no'; 

return strsql;
end;


  
function Extraction_Trans(v_beg_dat in date,
                          v_end_dat in date, 
                          v_kli_id    varchar2 default '-1',
                          v_acc_no    varchar2 default '''-1''',
                          v_bal_cn    varchar2 default '-1',
                          v_filial    number,
                          v_currency  number,
                          v_user      number                          
                         )
return varchar2
is
strsql varchar2(2000);
rate_dif_str varchar2(200);
 main_condition_for_debt varchar2(1000);
 str_filial_for_debt varchar2(200);
 str_currency_for_debt varchar2(200);
 str_user_for_debt varchar2(200);  
 main_condition_for_kred varchar2(1000); 
 str_filial_for_kred varchar2(200);
 str_currency_for_kred varchar2(200); 
 str_user_for_kred varchar2(200);
begin



if v_user=-1 then
 str_user_for_debt:='';
else
 str_user_for_debt:=' and pr.debt in(select id from account ac  where'||
                                      '  ac.op_id = '||v_user||')';
end if; 

if v_user=-1 then
 str_user_for_kred:='';
else
 str_user_for_kred:=' and pr.kredit in(select id from account ac  where'||
                                        '  ac.op_id = '||v_user||')';
end if; 


if v_filial=-1 then
 str_filial_for_debt:='';
else
 str_filial_for_debt:=' and pr.debt in(select id from account ac  where'||
                                      '  ac.filial = '||v_filial||')';
end if; 

if v_filial=-1 then
 str_filial_for_kred:='';
else
 str_filial_for_kred:=' and pr.kredit in(select id from account ac  where'||
                                      '  ac.filial = '||v_filial||')';
end if; 

if v_currency=-1 then
 str_currency_for_debt:=' ';
else
 str_currency_for_debt:=' and pr.debt in(select id from account ac  where'||
                                      '  ac.val_acc = '||v_currency||')';
end if;

if v_currency=-1 then
 str_currency_for_kred:=' ';
else
 str_currency_for_kred:=' and pr.kredit in(select id from account ac  where'||
                                      '  ac.val_acc = '||v_currency||')';
end if;



if (v_kli_id='-1') and (v_acc_no='''-1''') and (v_bal_cn='-1') then
main_condition_for_debt:='';
else
main_condition_for_debt:=
         ' and pr.debt in(select id from account ac  where'||
                                        '  ac.acc_no in ('||v_acc_no||')'
                            ||' or '||                           
                                        ' ac.bal_cn1 in ('||v_bal_cn||')'
                            ||' or '||            
                                        '  ac.kli_id in ('||v_kli_id||')'||')';                                          
             end if;

if (v_kli_id='-1') and (v_acc_no='''-1''') and (v_bal_cn='-1') then
main_condition_for_kred:='';
else
main_condition_for_kred:=
         ' and pr.kredit in(select id from account ac  where'||
                                        '  ac.acc_no in ('||v_acc_no||')'
                            ||' or '||                           
                                        ' ac.bal_cn1 in ('||v_bal_cn||')'
                            ||' or '||            
                                        '  ac.kli_id in ('||v_kli_id||')'||')';                                             
end if;



strsql:=
'select 
pr.id            id,
pr.dat           dat,
pr.val_acc       CurrencyId,
pr.debt          OwnAccountId,
pr.kredit        PairAccountId,
sb_statement.getaccno(pr.kredit)  PairAccountName,
pr.Currencyid_c  PairCurrencyId ,
sb_statement.checkcurrency(0,pr.val_acc,pr.currencyid_c,pr.ammount,pr.ammount_c,pr.lammount)  debit,
0                kredit, 
pr.lammount      ldebit,
0                lkredit,
pr.vid_op        OperationCode,
pr.name          name, 
av.val_name      avalname
from provarch pr,avalute av
where 
pr.val_acc=av.valute  and
pr.debt=:OwnAccountId and
pr.dat between '||chr(39)||v_beg_dat||chr(39)||' and '||chr(39)||v_end_dat||chr(39)
||main_condition_for_debt||str_filial_for_debt||str_currency_for_debt||str_user_for_debt

||' union '|| 

' select 
pr.id            id,
pr.dat           dat,
pr.currencyid_c  CurrencyId,
pr.kredit        OwnAccountID,
pr.debt          PairAccountId,
sb_statement.getaccno(pr.debt) as PairAccountName,
pr.val_acc       PairCurrencyId ,
0                debit,
sb_statement.checkcurrency(1,pr.val_acc,pr.currencyid_c,pr.ammount,pr.ammount_c,pr.lammount) as kredit,
0                ldebit,
pr.lammount      lkredit,
pr.vid_op        OperationCode,
pr.name          name,
av.val_name      avalname
from provarch pr,avalute av
where
pr.currencyid_c=av.valute and
pr.kredit=:OwnAccountId   and
pr.dat between '||chr(39)||v_beg_dat||chr(39)||' and '||chr(39)||v_end_dat||chr(39)
 ||main_condition_for_kred||str_filial_for_kred||str_currency_for_kred||str_user_for_kred
 
||' order by dat,debit,kredit ';
return strsql;
end;  
   


   
   
function get_user(v_op_id number) return varchar2
is
result varchar2(100);
begin
      select name into result from user$ where id=v_op_id;
      return result;
      exception when no_data_found then
      return null;

end;   
   
                         
   

   
   
END;

/*Elgun Bekirov ........................
....................SMART SYSTEMS 2006*/
/


-- End of DDL Script for Package SMART.SB_STATEMENT


