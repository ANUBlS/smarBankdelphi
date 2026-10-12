
CREATE OR REPLACE 
PACKAGE pbf_transaction
  IS
  procedure del_Operation(v_operid in integer);
  procedure edit_FullOperation(
                         vID in integer,
                         vname in varchar2,
                         vclientaccid in integer,
                         vamount in number);
  procedure add_FullOperation(
                         v_name in varchar2,
                         v_clientaccid in integer,
                         v_amount in number,
                         v_hdate in date default sbop.get_date,
                         v_ID in integer default null);
  procedure edit_OtherTypeOp(
                         vOptype in varchar2,
                         vID in integer,
                         vamount in number);
  function get_valByAccID(accid in integer)
 return varchar2;
  function get_rcname(clientaccid integer)
 return varchar2;
  function get_rcaccno(clientaccid integer,acctype in varchar2)
 return varchar2;
  function get_filialCode(clientaccid in integer,usr in varchar2)
 return integer;
  procedure delete_commitedTrans(v_operid in integer,edit in boolean default false);
  procedure add_OtherTypeOp(OpType in varchar2,
                            amount in number,
                            OpID in integer default null,
                            name in varchar2,
                            v_hdate in date default sbop.get_date);
  function Get_accIDByType(AType in varchar2,
                           BrID in integer,
                           clientaccid in integer,
                           OpType in varchar2,
                           opid in integer default null)
  return integer;
  function get_accnoByType(AType in varchar2,
                           BrID in integer,
                           clientaccid in integer,
                           OpType in varchar2,
                           opid in integer default null)
  return varchar2;
END;
/


CREATE OR REPLACE 
PACKAGE BODY pbf_transaction
IS
  function add_operations(
                         v_name in varchar2,
                         v_clientaccid in integer,
                         v_amount in number,
                         v_optype in varchar2,
                         payno in varchar2 default null,
                         v_hdate in date default sbop.get_date)
  return integer
  is
  result integer;
  userfilial varchar2(50);
  tofil varchar2(50);
  cursor c_f is
  select name  from smart.filial_t
  where id = (select filial from account where id = v_clientaccid);

  cursor c_pn is
  select count(id) as cnt
  from pbf_operations
  where sb_aca.getuserfilialid(username) = sb_aca.getuserfilialid(user);

  pn c_pn%rowtype;

  begin
     select name into userfilial from smart.filial_t
     where id = (select filialid from smart.sba_objinf
     where obj=user and type='U');

     open c_f;
     fetch c_f into tofil;
     close c_f;

     if tofil is null then
        select name into tofil from smart.filial_t where id= 0;
     end if;


     open c_pn;
     fetch c_pn into pn;
     close c_pn;

     insert into pbf_operations(name,clientaccid, amount,
       operationtype,fromfilialtofilial,paymentno,hdate)
     values(v_name,v_clientaccid, v_amount,
--     v_optype,userfilial||'  -->'||tofil,substr(10000+nvl(pn.cnt,0)+1,2,length(10000+nvl(pn.cnt,0)+1))) ,||'Kredit ?ayieoe'
v_optype,userfilial ||'uiaai  '|| tofil||'ia',substr(10000+nvl(pn.cnt,0)+1,2,length(10000+nvl(pn.cnt,0)+1)),v_hdate)
     returning id into result;
   return result;
   End;

  function edit_operations(
                         v_ID in integer,
                         v_name in varchar2,
                         v_clientaccid in integer,
                         v_amount in number)
  return integer
  is
  result integer;
  begin
     update pbf_operations
     set name = v_name,
         clientaccid = v_clientaccid,
         amount = v_amount
     where id = v_ID
     returning id into result;
   return result;
   End;

  function get_accnoByType(AType in varchar2,
                           BrID in integer,
                           clientaccid in integer,
                           OpType in varchar2,
                           opid in integer default null)
  return varchar2
  is
  result varchar2(25);
  begin

     select acc_no into result from account where id = Get_accIDByType(AType ,BrID,clientaccid ,OpType,opid);
     return result;
  end;

  function Get_accIDByType(AType in varchar2,
                           BrID in integer,
                           clientaccid in integer,
                           OpType in varchar2,
                           opid in integer default null)
  return integer
  is
  result integer;
  cursor c_c(b in integer,v in integer) is
  select accid from pbf_filialsaccount
  where filialid = B and acctype = AType
  and currency = v;

  OBrID integer;
  val integer;

  cursor c_cval is
  select val_acc
     from smart.account where id = clientaccid;
     
  cursor c_ops is
  select kredit from provarch
  where id in (select transactionid from pbf_transactions
  where OPERID = opid)
  and debt in (select id from account where bal_cn1 in (1001,1011))
union
  select kredit from LAZYTRANSACTION
  where id in (select transactionid from pbf_transactions
  where OPERID = opid)
  and debt in (select id from account where bal_cn1 in (1001,1011));
  
  ops c_ops%rowtype;

  begin

--raise_application_error(-20009,'AType = '||clientaccid);
    /* select val_acc into val
     from smart.account where id = clientaccid;*/
     
     IF AType='45ACCOUNT' and nvl(opid,0)<>0 THEN

        open c_ops;
        fetch c_ops into ops;
        close c_ops;
       -- raise_application_error(-20009,'opid = '||ops.kredit);
        return ops.kredit;
     end if;

     open c_cval;
     fetch c_cval into val;
     close c_cval;

     val := nvl(val,0);

--raise_application_error(-20009,'BrID = '||BrID||'c = '||val);
     if OpType = 'SELF' then
   
     open c_c(BrID,val);
     fetch c_c into result;
     close c_c;

     elsif  OpType = 'OTHER' then
     -- raise_application_error(-20009,'w');
     select filial into OBrID
     from smart.account where id = clientaccid;
     open c_c(OBrID,val);
     fetch c_c into result;
     close c_c;

     elsif OpType = 'HEAD' then
      --raise_application_error(-20009,'wq');
     open c_c(0,val);
     fetch c_c into result;
     close c_c;
     end if;

     if AType = '38ACCOUNT' then result := clientaccid; end if;
     return result;
  end;

  procedure add_FullOperation(
                         v_name in varchar2,
                         v_clientaccid in integer,
                         v_amount in number,
                         v_hdate in date default sbop.get_date,
                         v_ID in integer default null)
  is

  cursor c_GetSettingsID(FromF in varchar2,ToF in varchar2) is
  select id from PBF_SETTINGS
  where fromfilial = FromF and tofilial=ToF;

  cursor c_GetChildSettings(v_MainID in integer) is
  select debit,credit,description,
  debitfilial,kreditfilial From pbf_settingchilds
  where MAINID = v_MainID and nvl(TYPE,0) = 0;

  cursor c_FUser(f in integer) is
  SELECT  userid
  FROM pbf_operationsusers
  where filial = (select filial From smart.account where id = f);

  FromF  varchar2(10);
  ToF  varchar2(10);
  ClientsBrID integer;
  MainID integer;
  transactionid integer;
  userFilial integer := sb_aca.getuserfilialid();
  operID integer;
  DebitAccID integer;
  CreditAccID integer;
  userID integer;
  valacc integer;
  balacc integer;
  cass integer;
  ftf varchar2(60);
  cliaccno varchar2(30);
  cliaccname varchar2(50);

  begin
     if userFilial <> 0 then FromF := 'FILIAL';
     else FromF := 'HEADOFFICE'; end if;

     select filial into ClientsBrID From smart.account
     where id = v_clientaccid;

     if ClientsBrID <> 0 then ToF := 'FILIAL';
     else ToF := 'HEADOFFICE'; end if;

     open c_GetSettingsID(FromF,ToF);
     fetch c_GetSettingsID into MainID;
     close c_GetSettingsID;

     if v_ID is null then
     operID := add_operations(v_name,v_clientaccid,v_amount,'KREDIT',v_hdate);
     else
     operID := v_ID;
     end if;

     select acc_no into cliaccno From smart.account where id = v_clientaccid;
     select name into cliaccname From smart.account where id = v_clientaccid;

     select FROMFILIALTOFILIAL into  ftf From pbf_operations where id = operID;
   --   raise_application_error(-20009,'AType = '||ftf||operID);

     if nvl(MainID,0) = 0 then Raise_Application_Error(-20009,'Hesablar sazlanmayib!'); end if;

 
     for GetChildSettings in c_GetChildSettings(MainID) loop

         DebitAccID := Get_accIDByType(upper(GetChildSettings.debit),
                                            userfilial,v_clientaccid,
                                            GetChildSettings.debitfilial);
         CreditAccID := Get_accIDByType(upper(GetChildSettings.credit),
                                            userfilial,v_clientaccid,
                                            GetChildSettings.kreditfilial);
         open c_FUser(DebitAccID);
         fetch c_FUser into userID;
         close c_FUser;

         select val_acc,bal_cn1 into valacc,balacc from smart.account
         where id = DebitAccID;
--kredit
        if balacc  = 1001 and valacc = 0 then
         cass := 144;
        else cass := null;
        end if;


         transactionid :=
               sb_transaction.transaction_add (
                  debitid=> DebitAccID,
                  creditid=> CreditAccID,
                  debitamount=> v_amount,
                  creditamount=> null,
                  lamount=> NULL,
                  debitrate=> 0,
                  creditrate=> 0,
                  operatorID=> userID,
                  Flags=> 0,
                  inbalancechar=> cass,
--     Kerdit odenishishinin  smartda teyinati
--                  trname=>    ' Kredit ?ayieoe -'||cliaccname||'('||cliaccno||')'||'-'||ftf,
                  trname=>   cliaccname||'('||cliaccno||')'||'-'||ftf||' kredit ?ayieoe',
                  transactiondate=> v_hdate
               );

     insert into pbf_transactions(operid, transactionid, hdate)
     values(operid, transactionid,v_hdate);

     end loop;

  end;

  procedure delete_commitedTrans(v_operid in integer,edit in boolean default false)
  is

  cursor c_Tr is
  select transactionid from pbf_transactions
  where operid = v_operid and hdate = (select tek_dat from sysdat);

     cursor c_SB_Transactions(TrID in Integer) is
     select ID
       from PROVARCH
      where ID = TrID;

     cursor c_sb_LazyTransactions(TrID in integer) is
     select ID
       from lazytransaction
     where ID = TrID;



     TempRec c_SB_Transactions%rowtype;
     OpRec c_sb_LazyTransactions%rowtype;

  begin

     for Tr in c_Tr loop

         open c_SB_Transactions(Tr.transactionid);
         fetch c_SB_Transactions into TempRec;
         close c_SB_Transactions;

         open c_sb_LazyTransactions(Tr.transactionid);
         fetch c_sb_LazyTransactions into OpRec;
         close c_sb_LazyTransactions;

         if edit then
            if nvl(TempRec.id,0) <> 0 then
            raise_application_error(-20009,'Tesdiq olunmush emeliyyati redakte etmek olmaz!');
            end if;
         end if;
         if nvl(TempRec.id,0) <> 0 or nvl(OpRec.id,0) <> 0 then
         sb_transaction.transaction_delete(Tr.transactionid);
         end if;

     end loop;

  end;

procedure del_Operation(v_operid in integer)
is
TrDat date;
begin

   select hdate into TrDat from PBF_OPERATIONS
   where id =  v_operid;

   if TrDat < Sbop.get_date then
   Raise_application_error(-20009,'Arxiv emeliyyatini silmek olmaz!');
   end if;

   delete_commitedTrans(v_operid);
   delete PBF_OPERATIONS where id = v_operid;

   commit;
end;


  procedure edit_FullOperation(
                         vID in integer,
                         vname in varchar2,
                         vclientaccid in integer,
                         vamount in number)
  is
  updDat date;
  r integer;
  begin

   select hdate into updDat from PBF_OPERATIONS
   where id =  vID;

   if updDat < Sbop.get_date then
   Raise_application_error(-20009,'Arxiv emeliyyatini silmek olmaz!');
   end if;

   r := edit_operations(v_ID=>vID,v_name=>vname,v_clientaccid=>vclientaccid,v_amount=>vamount);
   delete_commitedTrans(r,true);
   add_FullOperation(v_name=>vname,v_clientaccid=>vclientaccid,v_amount=>vamount,v_ID=>r);
  end;

  procedure add_OtherTypeOp(OpType in varchar2,
                            amount in number,
                            OpID in integer default null,
                            name in varchar2,
                            v_hdate in date default sbop.get_date)
  is
  cursor c_Tr is
  SELECT ID, DEBIT,CREDIT,DESCRIPTION,DEBITFILIAL,KREDITFILIAL
  FROM pbf_settingchilds a
  where mainid = (select id from pbf_otheroptypes where name = OpType)
  and type = 1
  order by id;

  cursor c_FUser(f in integer) is
  SELECT  userid
  FROM pbf_operationsusers
  where filial = (select filial From smart.account where id = f);

  DebitAccID integer;
  CreditAccID integer;
  userID integer;
  balacc integer;
  valacc integer;
  userFilial integer := sb_aca.getuserfilialid();
  cass integer;
  transactionid integer;
  dat date;
  operID integer;
  ftf varchar2(90);
  begin
     --select tek_dat into dat from sysdat;

     operID := OpID;
     if OpID is null then
     operID := add_operations(name,null,amount,upper(OpType),v_hdate);
     end if;

    select FROMFILIALTOFILIAL into  ftf From pbf_operations where id = operID;
     for Tr in c_Tr loop
--
         DebitAccID := Get_accIDByType(upper(Tr.debit),
                                            userfilial,null,
                                            Tr.debitfilial);
         CreditAccID := Get_accIDByType(upper(Tr.credit),
                                            userfilial,null,
                                            Tr.kreditfilial);
         open c_FUser(DebitAccID);
         fetch c_FUser into userID;
         close c_FUser;
--dbms_output.put_line('DebitAccID =  '||DebitAccID);
         select val_acc,bal_cn1 into valacc,balacc from smart.account
         where id = DebitAccID;

    --    if balacc  = 1001 and valacc = 0 then
    --     cass := 55;
    --    else cass := null;
    --    end if;
       /* if OpType='AZERCELL' then cass := 136;
        elsif OpType='BAKCELL' then cass := 136;
        elsif OpType='NAR' then cass := 136;
        elsif OpType='LIGHT' then cass := 133;
        elsif OpType='GAS' then cass := 133;
        elsif OpType='WATER' then cass := 133;
        elsif OpType='SUMLIGHT' then cass := 133;
        end if;*/
        
        select cash into cass from pbf_beneficiars where OPERTYPE=OpType;


         transactionid :=
               sb_transaction.transaction_add (
                  debitid=> DebitAccID,
                  creditid=> CreditAccID,
                  debitamount=> amount,
                  creditamount=> null,
                  lamount=> NULL,
                  debitrate=> 0,
                  creditrate=> 0,
                  operatorID=> userID,
                  Flags=> 0,
                  inbalancechar=> cass,
-- Gunun senedlerine kommunal teyinati
                  trname=> v_hdate ||' -tarixiny ' ||  ftf ||' '||OpType||' ?ayieoe',
--                    trname=> v_hdate ||' -tarixiny ' ||  ftf ||' '||OpType,
                  transactiondate=> v_hdate
               );

     insert into pbf_transactions(operid, transactionid, hdate)
     values(operid, transactionid,v_hdate);

     end loop;
     commit;
  end;


  procedure edit_OtherTypeOp(
                         vOptype in varchar2,
                         vID in integer,
                         vamount in number)
  is
  updDat date;
  r integer;
  begin

   select hdate into updDat from PBF_OPERATIONS
   where id =  vID;

   if updDat < Sbop.get_date then
   Raise_application_error(-20009,'Arxiv emeliyyatini silmek olmaz!');
   end if;

   r := edit_operations(v_ID=>vID,v_name=>vOptype,v_clientaccid=>null,v_amount=>vamount);
   delete_commitedTrans(r,true);
   add_OtherTypeOp(OpType=>vOptype,amount=>vamount,OpID=>vID,name=>vOptype);
  end;

 function get_valByAccID(accid in integer)
 return varchar2
 is
 r varchar2(5);

 begin
 if nvl(accid,0) <> 0 then
  select val_name into r from avalute where valute=
  (select val_acc from smart.account where id = accid);
  return r;
 end if;
  return 'AZN';
 end;

 function get_rcname(clientaccid integer)
 return varchar2
 is
  r varchar2(90);
 begin
   if nvl(clientaccid,0) <> 0 then
   select name into r from smart.customers
   where id = (select kli_id from smart.account where
   id = clientaccid);
   return r;
   end if;

   select BANK into r from smart.filialinfo where kod_fil = 0;
   return r;
 end;

 function get_rcaccno(clientaccid integer,acctype in varchar2)
 return varchar2
 is
 r varchar2(25);
 begin
   if nvl(clientaccid,0) <> 0 then
   select acc_no into r from smart.account where id = clientaccid;
   return r;
   end if;


    return   get_accnoByType(AType =>acctype,
                           BrID=>null,
                           clientaccid =>null,
                           OpType =>'HEAD',
                           opid=>null);

 end;

 function get_filialCode(clientaccid in integer,usr in varchar2)
 return integer
 is
 r integer;
 begin
   if nvl(clientaccid,0) <> 0 then
   select filial into r from smart.account where id = clientaccid;
   return r;
   end if;

   if usr is not null then
   select filialid into r from sba_objinf where obj = usr and type = 'U';
    return r;
   end if;

    return 0;
 end;


 function get_stamp(username in varchar2)
 return blob
 is
 r blob;
 begin

    return r;
 end;
END;
/

