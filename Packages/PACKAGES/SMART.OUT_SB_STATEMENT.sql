-- Start of DDL Script for Package SMART.OUT_SB_STATEMENT
-- Generated 28-Jun-2006 10:11:57 from SMART@SB

CREATE OR REPLACE 
PACKAGE out_sb_statement

AUTHID CURRENT_USER
  IS

Type Cursor_Type is ref cursor ;  
  
  
  function GetAccNo(Acc_id number) return varchar2;
  function GetAccountID(AccountNumber varchar) return number;
  Function get_date return sysdat.tek_dat%type;
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
  function fLastOpdate(v_acc_id number,v_beg_dat date) return date;
  function fOstat(v_acc_id number,v_beg_dat date) return number;
  function fPok_Ostat(v_acc_id number,v_beg_dat date) return number;
  function fEndOstat(v_acc_id number,v_end_dat date) return number;
  function fEndPok_Ostat(v_acc_id number,v_end_dat date) return number;

  FUNCTION fDatDate( v_acc_id number,v_beg_dat date) return date;
  function fAp_Beg(v_acc_id number,v_beg_dat date) return varchar2;
  function fAp_End(v_acc_id number,v_beg_dat date) return varchar2;
  function GetExtraction(v_beg_dat  in date,
                       v_end_dat  in date, 
                       v_kli_id   in varchar2,
                       v_acc_no   in varchar2,
                       v_bal_cn   in varchar2,
                       v_filial   in number,
                       v_currency in number,
                       v_user     in number)
      return varchar2;
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
       
       
  FUNCTION get_acc_param(accid in number, val_name out varchar2, accname out varchar2)
     RETURN  number;
  function get_curr_date(accid number, bdate date)
     return date;
  function get_old_date(accid number, bdate date)
     return date;
  procedure get_ostat (acc_id in number,
                        begindate in date,
                        type in varchar2,
                        ostat out number,
                        pok_ostat out number);
  function get_rate(accid in number, Dat date)
  return number;
  FUNCTION check_account_number(accno in varchar2, val_name out varchar2, accname out varchar2)
     RETURN  number;
  FUNCTION check_bal_number(balcn in varchar2)
     RETURN  number;
  function notAccId(     v_beg_dat            date,
                       v_end_dat            date, 
                       v_kli_id             varchar2,
                       v_acc_no             varchar2,
                       v_bal_cn             varchar2, 
                       v_filial             number,
                       v_currency           number,
                       v_user               number,
                       v_turn_and_ratediff  varchar2)
      return    varchar2;
  function get_user(v_op_id number) return varchar2;
END;
/


CREATE OR REPLACE 
PACKAGE BODY out_sb_statement
  IS

FUNCTION fDatDate( v_acc_id number,v_beg_dat date) return date 
is
result Date;
begin
select    nvl(ar.datdate,null) 
into      result 
from      out_archost ar 
where     ar.acc_id =v_acc_id 
and       ar.datdate=(
                     select   max(ar.datdate) 
                     from     out_archost ar 
                     where    ar.datdate<v_beg_dat
                     and      ar.acc_id=v_acc_id
               );
return result; 

end;  

 function GetAccountID(AccountNumber varchar) return number
 is 
  AccountID out_account.ID%type;
 begin
  Select ID into AccountID from out_Account
   where acc_no = AccountNumber;
  return AccountID; 
  Exception When NO_DATA_FOUND Then
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
  v_acc_no out_account.acc_no%type;
 begin
  Select acc_no into v_acc_no from out_Account
   where id = Acc_id;
  return v_acc_no; 
  Exception When NO_DATA_FOUND Then
   return '';
 end;    
 
 
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

If D_OR_K=0 then 
 if CURRENCYID_D=0 then 
  Result:= Ammount_c;
 else
  Result:= Ammount;
 end if;
else 
 if CURRENCYID_C=0 then 
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
    select val_acc into result from out_account where id=v_acc_id;
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
from   out_provarch pr 
where  (pr.debt =v_acc_id or pr.kredit=v_acc_id) 
and    (pr.dat<v_beg_dat)  
and    (nvl(pr.vid_op,0)<>1);

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
from    out_archost ar 
where   ar.acc_id =v_acc_id 
and     ar.datdate=(
                     select   max(ar.datdate)  
                     from     out_archost ar
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
from    out_archost ar
where   ar.acc_id =v_acc_id 
and     ar.datdate=(
                     select   max(ar.datdate)  
                     from     out_archost ar 
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
from   out_archost ar
where  ar.acc_id =v_acc_id 
and    ar.datdate=(
                     select  max(ar.datdate)  
                     from    out_archost ar  
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
from    out_archost ar 
where   ar.acc_id =v_acc_id 
and     ar.datdate=(
                     select   max(ar.datdate)  
                     from     out_archost ar
                     where    ar.datdate<=v_end_dat
                     and      ar.acc_id=v_acc_id
                );
return result; 

end;      


function notAccId(     v_beg_dat            date,
                       v_end_dat            date, 
                       v_kli_id             varchar2,
                       v_acc_no             varchar2,
                       v_bal_cn             varchar2, 
                       v_filial             number,
                       v_currency           number,
                       v_user               number,
                       v_turn_and_ratediff  varchar2)
      return    varchar2
is
 strsql         varchar2(2024);
 main_condition varchar2(200);
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
main_condition:='';
else
main_condition:='
 and ( Bal_Cn1 in ('||v_bal_cn||') 
    or Acc_No in ('||v_acc_no||')
    or kli_id in ('||v_kli_id||') 
     ) ';
     
end if;
if  v_turn_and_ratediff='ch_rate_and_turn' then             
 strsql:=
 'select id as accountid from out_account  where '
 ||'( id not in (select debt from out_provarch where dat between '''||v_beg_dat||''' and '''||v_end_dat||''' ))
and  
     ( id not in (select kredit from out_provarch where dat between '''||v_beg_dat||''' and '''||v_end_dat||'''  ))'
 ||main_condition||str_filial||str_user||str_currency;
else 
 strsql:=
 'select id as accountid from out_account  where '
 ||'( id not in (select debt from out_provarch where nvl(vid_op,0)<>1 and  dat between '''||v_beg_dat||''' and '''||v_end_dat||''' ))
and  
     ( id not in (select kredit from out_provarch where nvl(vid_op,0)<>1 and  dat between '''||v_beg_dat||''' and '''||v_end_dat||'''  ))'
 ||main_condition||str_filial||str_user||str_currency;
 end if;
  

return strsql;
end;


    

function GetExtraction(v_beg_dat   date,
                       v_end_dat   date, 
                       v_kli_id    varchar2,
                       v_acc_no    varchar2,
                       v_bal_cn    varchar2,
                       v_filial    number,
                       v_currency  number,
                       v_user      number)
      return varchar2
is
 strsql   varchar2(2024);
 main_condition varchar2(200);
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
main_condition:='';
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
  out_sb_statement.flastopdate(ac.id,'||chr(39)||v_beg_dat||chr(39)||')    LastOpdate,
  out_sb_statement.fOstat(ac.id,'||chr(39)||v_beg_dat||chr(39)||')         Ostat,
  out_sb_statement.fPok_Ostat(ac.id,'||chr(39)||v_beg_dat||chr(39)||')     PokOstat,
  out_sb_statement.fEndOstat(ac.id,'||chr(39)||v_end_dat||chr(39)||')      EndOstat,
  out_sb_statement.fEndPok_Ostat(ac.id,'||chr(39)||v_end_dat||chr(39)||')  EndPokOstat,
  out_sb_statement.fDatDate(ac.id,'||chr(39)||v_beg_dat||chr(39)||')       DatDate,
  to_date('''||v_end_dat||''')                                         EndDate,
  out_sb_statement.fAp_Beg(ac.id,'||chr(39)||v_beg_dat||chr(39)||')        AP_Beg,
  out_sb_statement.fAp_End(ac.id,'||chr(39)||v_beg_dat||chr(39)||')        AP_End ' 
 ||' from out_account ac,customers c,avalute av '
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
                          v_kli_id in varchar2,
                          v_acc_no in varchar2,
                          v_bal_cn in varchar2,
                          v_filial    number,
                          v_currency  number,
                          v_user      number                          
                         )
       return varchar2
is
strsql varchar2(2000);
rate_dif_str varchar2(200);
 main_condition_for_debt varchar2(200);
 str_filial_for_debt varchar2(200);
 str_currency_for_debt varchar2(200);
 str_user_for_debt varchar2(200);  
 main_condition_for_kred varchar2(200); 
 str_filial_for_kred varchar2(200);
 str_currency_for_kred varchar2(200); 
 str_user_for_kred varchar2(200);
begin



if v_user=-1 then
 str_user_for_debt:='';
else
 str_user_for_debt:=' and pr.debt in(select id from out_account ac  where'||
                                      '  ac.op_id = '||v_user||')';
end if; 

if v_user=-1 then
 str_user_for_kred:='';
else
 str_user_for_kred:=' and pr.kredit in(select id from out_account ac  where'||
                                        '  ac.op_id = '||v_user||')';
end if; 


if v_filial=-1 then
 str_filial_for_debt:='';
else
 str_filial_for_debt:=' and pr.debt in(select id from out_account ac  where'||
                                      '  ac.filial = '||v_filial||')';
end if; 

if v_filial=-1 then
 str_filial_for_kred:='';
else
 str_filial_for_kred:=' and pr.kredit in(select id from out_account ac  where'||
                                      '  ac.filial = '||v_filial||')';
end if; 

if v_currency=-1 then
 str_currency_for_debt:=' ';
else
 str_currency_for_debt:=' and pr.debt in(select id from out_account ac  where'||
                                      '  ac.val_acc = '||v_currency||')';
end if;

if v_currency=-1 then
 str_currency_for_kred:=' ';
else
 str_currency_for_kred:=' and pr.kredit in(select id from out_account ac  where'||
                                      '  ac.val_acc = '||v_currency||')';
end if;



if (v_kli_id='-1') and (v_acc_no='''-1''') and (v_bal_cn='-1') then
main_condition_for_debt:='';
else
main_condition_for_debt:=
         ' and pr.debt in(select id from out_account ac  where'||
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
         ' and pr.kredit in(select id from out_account ac  where'||
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
out_sb_statement.fCurrencyId(pr.debt)  CurrencyId,
pr.debt          OwnAccountId,
pr.kredit        PairAccountId,
out_sb_statement.getaccno(pr.kredit)  PairAccountName,
pr.Currencyid_c  PairCurrencyId ,
out_sb_statement.checkcurrency(0,pr.val_acc,pr.currencyid_c,pr.ammount,pr.ammount_c,pr.lammount)  debit,
0                kredit, 
pr.lammount      ldebit,
0                lkredit,
pr.vid_op        OperationCode,
pr.name          name 
from out_provarch pr
where pr.debt=:OwnAccountId and
pr.dat between '||chr(39)||v_beg_dat||chr(39)||' and '||chr(39)||v_end_dat||chr(39)
||main_condition_for_debt||str_filial_for_debt||str_currency_for_debt||str_user_for_debt

||' union '|| 

' select 
pr.id           as id,
pr.dat          as dat,
out_sb_statement.fCurrencyId(pr.kredit) as CurrencyId,
pr.kredit       as OwnAccountID,
pr.debt         as PairAccountId,
out_sb_statement.getaccno(pr.debt) as PairAccountName,
pr.val_acc      as PairCurrencyId ,
0               as debit,
out_sb_statement.checkcurrency(1,pr.val_acc,pr.currencyid_c,pr.ammount,pr.ammount_c,pr.lammount) as kredit,
0               as ldebit,
pr.lammount     as lkredit,
pr.vid_op       as OperationCode,
pr.name         as name 
from out_provarch pr
where pr.kredit=:OwnAccountId and
 pr.dat between '||chr(39)||v_beg_dat||chr(39)||' and '||chr(39)||v_end_dat||chr(39)
 ||main_condition_for_kred||str_filial_for_kred||str_currency_for_kred||str_user_for_kred
 
||' order by dat,debit,kredit ';
return strsql;
end;  
   
---------excel selection-------------------

   function check_account_number(accno in varchar2, val_name out varchar2, accname out varchar2)
     return  number
   is  
    result integer;
    cursor c_check is
     select acc.id, av.val_name, acc.name  
       from out_account acc, avalute av
       where acc_no = accno
       and acc.val_acc = av.valute;
     r_check c_check%rowtype;      
   begin 
      open c_check;
      fetch c_check into r_check; 
      close c_check;
      val_name :=  r_check.val_name;
      accname := r_check.name;
      return r_check.id; 
   exception
      when no_data_found THEN
          return 0;
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

function get_acc_param(accid in number, val_name out varchar2, accname out varchar2)
return  number
   is  
    result integer;
   begin 
     select acc.id, av.val_name, name
       into result, val_name, accname
       from out_account acc, avalute av
       where id = accid
       and acc.val_acc = av.valute;     
      return accid; 
   exception
      when no_data_found THEN
          return 0;
   end;    
   
   FUNCTION check_bal_number(balcn in varchar2)
     RETURN  number
   is  
    result integer;
   BEGIN 
     select bal_cn  
       into result 
       from out_bal_spr1
       where bal_cn = to_number(balcn);    
      return result; 
   EXCEPTION
      WHEN no_data_found THEN
          return 0;
   END;

   
   function get_old_date(accid number, bdate date)
     return date
   is
     result date;
   begin 
     SELECT MAX (arch.datdate)
         into result
         FROM out_archost arch
         WHERE arch.datdate < bdate
         AND arch.acc_id = accid;
     return result;
     
    exception when no_data_found then
       return null; 
   end;  

   function get_curr_date(accid number, bdate date)
     return date
   is
     result date;
   begin 
     select MAX (arch.datdate)
         into result
         from out_archost arch
         where arch.datdate <= bdate
         and arch.acc_id = accid;
     return result;
     
    exception when no_data_found then
       return null; 
   end; 
      
   procedure get_ostat (acc_id in number,
                        begindate in date,
                        type in varchar2,
                        ostat out number,
                        pok_ostat out number)
   is
      cursor c_getbeginostat (accid in number, infodate in date) 
       is 
        select arch.ostat, arch.pok_ostat
           from out_archost arch
           where arch.datdate = infodate  
           and arch.acc_id = accid;
         
     r_ostat c_getbeginostat%rowtype;
     tempdate date;
     ostat_not_found exception;
   begin
    
    if (acc_id is not null) and (begindate is not null) then

      if type = 'OLD' then 
        tempdate:=get_old_date(acc_id, begindate);
      elsif type = 'CURR' then
        tempdate:=get_curr_date(acc_id, begindate);
      else 
        raise ostat_not_found;      
      end if;    
     
    
     open c_getbeginostat(acc_id, tempdate );
      fetch c_getbeginostat into r_ostat; 
     close c_getbeginostat;

     if r_ostat.ostat <> 0 then   
       ostat := r_ostat.ostat;
       pok_ostat := r_ostat.pok_ostat;
     else
       raise ostat_not_found;
     end if;
    else
      raise ostat_not_found;
     end if;  

   exception when  ostat_not_found then
       ostat := 0;
       pok_ostat := 0;        
   end;                          


                          
   
  function get_rate(accid in number, Dat date)
  return number
  is
   result number;
  begin
    select ostat 
    into result
    from operkurs
     where dat = get_rate.dat
     and val_kod = (select val_acc from out_account where id = accid); 
    return result;
   exception when  no_data_found then
       return  0;     
  end;
   
   
   
END;

/*    Elgun Bekirov ...................
          SMART SYSTEMS 2006   */
/


-- End of DDL Script for Package SMART.OUT_SB_STATEMENT

