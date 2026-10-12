CREATE OR REPLACE 
PACKAGE cm_sd
  IS
  
  
  function FilterPerson(Cs in varchar2,person in integer,b in boolean)
  return varchar2;
  
  
  function FilterVal(Cs in varchar2,Val in integer,b in boolean)
  return varchar2;
  
  function FilterDc(Cs in varchar2,bcm in integer,ecm in integer,b in boolean)
  return varchar2;
 
  procedure Get_Obligation(
                CrdID in Integer,
                Dat in Date,
                Delimer in number);
  procedure Get_Payments(
                CrdID in Integer,
                FirstDate in Date,
                LastDate in Date,
                Delimer in number);
  procedure Get_Rest(
                CrdID in Integer,
                Dat in Date,
                Delimer in number);
  procedure Get_Tranches(
                CrdID in Integer,
                FirstDate in Date,
                LastDate in Date,
                Delimer in number);
  procedure Get_DueRest(
                CrdID in Integer,
                FirstDate in Date,
                LastDate in Date,
                Delimer in number);
  function FilterString(
                 NatVal in boolean default false,
                 FreeVal in boolean default false,
                 FreeNotVal in boolean default false,
                 LegalPerson in boolean default false,
                 NaturalPerson in boolean default false,
                 DC1 in boolean default false,
                 DC2 in boolean default false,
                 DC3 in boolean default false,
                 DC4 in boolean default false,
                 DC5 in boolean default false,
                 DC6 in boolean default false,
                 DC7 in boolean default false,
                 DC8 in boolean default false,
                 DC9 in boolean default false,
                 FID in integer default 0
                 )
  return varchar2;
END;
/

CREATE OR REPLACE 
PACKAGE BODY cm_sd
IS
  procedure Get_Rest(
                CrdID in Integer,
                Dat in Date,
                Delimer in number)
  is
  
  cursor c_rest(
          P_ID in integer,
          P_Dat in Date)
   is
    select Rest,Rest*Get_AnnInt(CreditID) as avgrest
     from cm_history
     where hdate = P_Dat and creditID = P_ID;
         

  RestInfo c_rest%rowtype;
      
  Srest number;
  Arest number;
  Pval integer;
  PrID varchar2(56);

  begin
     
     open c_rest(CrdID,Dat);
     fetch c_rest into restinfo;
     close c_rest;
     
     Srest := nvl(restinfo.rest,0);
     Arest := nvl(restinfo.avgrest,0);
     
   --  raise_application_error(-20007,'Dedimmi?--'||restinfo.rest);
     select id into PrID
     from cm_periods 
     where name = GET_PERIOD(CrdID);
     
     /*select Rest,Rest*Get_AnnInt(CreditID)/Delimer
     into Srest,Arest from cm_history
     where hdate = Dat and creditID = CrdID;*/
     
     select Currency 
     into Pval from cm_portfolio
     where id = CrdID;
     
   if Pval = 0 then
     insert into cm_rests_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),Srest,Arest,0,0,0,0);
   end if;

    if Pval =1 then
     insert into cm_rests_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),0,0,Srest,Arest,0,0);                          
     end if;
     
     if Pval = 48 then
     insert into cm_rests_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),0,0,0,0,Srest,Arest);                          
     end if;
  end;
  
  function FilterVal(Cs in varchar2,Val in integer,b in boolean)
  return varchar2  
  is
  result varchar2(59);
  begin
   
   if b then 
   if cs = ' ' then
    result := 'Currency = '||to_char(val);
   end if; 
    if cs <> ' ' then
     result := '('||cs||')'||' or '||
                                  '('||
                         'Currency = '||
                         to_char(val)||')';
   end if;
   else result :=cs;
   end if;
   
    return result; 
  end;
  
  function FilterPerson(Cs in varchar2,person in integer,b in boolean)
  return varchar2
  is
  result varchar2(60);
  begin

     if b then 
     if Cs = ' ' then
      result := 'PersonalType = '||to_char(person);
     end if; 
     if cs <> ' ' then
       result := '('||Cs||')'||' or '||'('||
                                'PersonalType = '||
                                to_char(person)||')';
     end if;
     else result :=Cs;
     end if;
     
     return result;
     
  end;
  
  function FilterDc(Cs in varchar2,bcm in integer,ecm in integer,b in boolean)
  return varchar2
  is
  result varchar2(1024);
  begin
     if b then 
     if Cs = ' ' then
      result := '(DUEDATEFIRSTCONTRACT - DATEOFCONCLUSION)<='||
                 to_char(ecm)||
                 ' and  '||
                 '(DUEDATEFIRSTCONTRACT - DATEOFCONCLUSION)>='||
                 to_char(bcm);
     end if;
     if cs <> ' ' then 
      result := '('||Cs||')'||' or '||'('||
                               '(DUEDATEFIRSTCONTRACT - DATEOFCONCLUSION)<='||
                              to_char(ecm)||
                              ' or '||
                              '(DUEDATEFIRSTCONTRACT - DATEOFCONCLUSION)>='||
                             to_char(bcm)||')';
     end if;
     else result :=Cs;
     end if;
     return result;
  end;
  
  function FilterString(
                 NatVal in boolean default false,
                 FreeVal in boolean default false,
                 FreeNotVal in boolean default false,
                 LegalPerson in boolean default false,
                 NaturalPerson in boolean default false,
                 DC1 in boolean default false,
                 DC2 in boolean default false,
                 DC3 in boolean default false,
                 DC4 in boolean default false,
                 DC5 in boolean default false,
                 DC6 in boolean default false,
                 DC7 in boolean default false,
                 DC8 in boolean default false,
                 DC9 in boolean default false,
                 FID in integer default 0
                 )
  return varchar2
  is
  
  Result varchar2(2048);
  CurrencyStr varchar2(250);
  PersonStr varchar2(250);
  DCStr  varchar2(1024);
   
  begin
  
    CurrencyStr := ' ';
    PersonStr := ' ';
    DCStr := ' ';
    
    CurrencyStr := FilterVal(CurrencyStr,0,NatVal);
    CurrencyStr := FilterVal(CurrencyStr,1,FreeVal);
    CurrencyStr := FilterVal(CurrencyStr,48,FreeNotVal);
                   
    PersonStr := FilterPerson(PersonStr,2,LegalPerson);
    PersonStr := FilterPerson(PersonStr,1,NaturalPerson);
                  
    DCStr := FilterDc(DCStr,0,30,DC1);  
    DCStr := FilterDc(DCStr,31,90,DC2);
    DCStr := FilterDc(DCStr,91,180,DC3);
    DCStr := FilterDc(DCStr,181,270,DC4);
    DCStr := FilterDc(DCStr,271,365,DC5);
    DCStr := FilterDc(DCStr,366,1095,DC6);
    DCStr := FilterDc(DCStr,1096,1825,DC7);
    DCStr := FilterDc(DCStr,1826,3650,DC8);
    DCStr := FilterDc(DCStr,3651,36510,DC9);

    Result := 'select id from cm_active_credits where  '||
              '('||CurrencyStr||')' ||
              ' and '|| 
              '('||PersonStr||')'|| 
              ' and '||
              '('||DCStr||')'||'
               and branchid = '||FID;
    return result;
                                               
  end;    
  
  procedure Get_Tranches(
                CrdID in Integer,
                FirstDate in Date,
                LastDate in Date,
                Delimer in number)
  is

  cursor c_tr(
           P_ID in integer,
           FDate in Date,
           LDate in Date)
  is
  select sum(TRANCHEAMOUNT) as tramt,sum(TRANCHEAMOUNT*Get_AnnInt(CreditID)) as avgtr
  from cm_tranches
  where TRANCHEDATE between FDate and LDate
  and creditID = P_ID;

  trinfo c_tr%rowtype;
           
  STramt number;
  ATramt number;
  Pval integer;
  PrID varchar2(56);

  begin
    
     open c_tr(CrdID,FirstDate,LastDate);
     fetch c_tr into trinfo;
     close c_tr;
    -- raise_application_error(-20007,'Dedimmi?--'||trinfo.tramt); 

     STramt := nvl(trinfo.tramt,0);  
     ATramt := nvl(trinfo.avgtr,0);

     
     select id into PrID
     from cm_periods 
     where name = GET_PERIOD(CrdID);
     
     /*select TRANCHEAMOUNT,TRANCHEAMOUNT*Get_AnnInt(CreditID)/Delimer
     into STramt,ATramt from cm_tranches
     where TRANCHEDATE between FirstDate and LastDate
     and creditID = CrdID;*/
     
     select Currency 
     into Pval from cm_portfolio
     where id = CrdID;
     
   if Pval = 0 then
     insert into cm_tranches_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),STramt,ATramt,0,0,0,0);
   end if;

    if Pval =1 then
     insert into cm_tranches_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),0,0,STramt,ATramt,0,0);                          
     end if;
     
     if Pval = 48 then
     insert into cm_tranches_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),0,0,0,0,STramt,ATramt);                          
     end if;
  end;
  
  procedure Get_Payments(
                CrdID in Integer,
                FirstDate in Date,
                LastDate in Date,
                Delimer in number)
  is

  cursor c_pay(
          P_ID in integer,
          FDate in Date,
          LDate in Date)
  is
  select sum(PAYEDAMT) as payamt,sum(PAYEDAMT*Get_AnnInt(CreditID)) as avgpay
  from cm_payments
  where PAYDATE between FDate and LDate
  and creditID = P_ID;
  
  payinfo c_pay%rowtype;
         
  SPayAmt number;
  APayAmt number;
  Pval integer;
  PrID varchar2(56);

  begin
     
     open c_pay(CrdID,FirstDate,LastDate);
     fetch c_pay into payinfo;
     close c_pay;
     SPayAmt := nvl(payinfo.payamt,0);
     APayAmt := nvl(payinfo.avgpay,0);
     select id into PrID
     from cm_periods 
     where name = GET_PERIOD(CrdID);
     
     /*select nvl(sum(PAYEDAMT),0),nvl(sum(PAYEDAMT*Get_AnnInt(CreditID)/Delimer),0)
     into SPayAmt,APayAmt from cm_payments
     where PAYDATE between FirstDate and LastDate
     and creditID = CrdID;*/
     
     select Currency 
     into Pval from cm_portfolio
     where id = CrdID;
     
   if Pval = 0 then
     insert into cm_payments_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),SPayAmt,APayAmt,0,0,0,0);
   end if;

    if Pval =1 then
     insert into cm_payments_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),0,0,SPayAmt,APayAmt,0,0);                          
     end if;
     
     if Pval = 48 then
     insert into cm_payments_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),0,0,0,0,SPayAmt,APayAmt);                          
     end if;
  end;
  
    procedure Get_Obligation(
                CrdID in Integer,
                Dat in Date,
                Delimer in number)
  is
   
  cursor c_obl(
           P_ID in integer,
           P_DAt in Date)
  is
  select Obligation,Obligation*Get_AnnInt(CreditID) as avgobl 
  from cm_history
  where hdate = P_DAt and creditID = P_ID;
  
  oblinfo c_obl%rowtype;
            
  SObl number;
  Aobl number;
  Pval integer;
  PrID varchar2(56);

  begin
     
     open c_obl(CrdID,Dat);
     fetch c_obl into oblinfo;
     close c_obl;
     
     SObl := nvl(oblinfo.Obligation,0);
     Aobl := nvl(oblinfo.avgobl,0);
     
     select id into PrID
     from cm_periods 
     where name = GET_PERIOD(CrdID);
     
/*     select Obligation,Obligation*Get_AnnInt(CreditID)/Delimer
     into SObl,Aobl from cm_history
     where hdate = Dat and creditID = CrdID;*/
     
     select Currency 
     into Pval from cm_portfolio
     where id = CrdID;
     
   if Pval = 0 then
     insert into cm_obligations_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),SObl,Aobl,0,0,0,0);
   end if;

    if Pval =1 then
     insert into cm_obligations_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),0,0,SObl,Aobl,0,0);                          
     end if;
     
     if Pval = 48 then
     insert into cm_obligations_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),0,0,0,0,SObl,Aobl);                          
     end if;
  end;
  

   procedure Get_DueRest(
                CrdID in Integer,
                FirstDate in Date,
                LastDate in Date,
                Delimer in number)
  is
  
  cursor c_duerest(
          P_ID in integer,
          P_FDate in Date,
          P_LDate in Date)
   is
    select sum(DueRest) as DueAmt ,sum(DueRest*Get_AnnInt(CreditID)) as avgduerest
     from cm_history
     where hdate between  P_FDate and P_LDate 
     and creditID = P_ID;
         

  DueRestInfo c_duerest%rowtype;
      
  Sduerest number;
  Aduerest number;
  Pval integer;
  PrID varchar2(56);

  begin
     
     open c_duerest(CrdID,FirstDate,LastDate);
     fetch c_duerest into DueRestInfo;
     close c_duerest;
     
     Sduerest := nvl(DueRestInfo.DueAmt,0);
     Aduerest := nvl(DueRestInfo.avgduerest,0);
     
   --  raise_application_error(-20007,'Dedimmi?--'||restinfo.rest);
     select id into PrID
     from cm_periods 
     where name = GET_PERIOD(CrdID);
     
     /*select Rest,Rest*Get_AnnInt(CreditID)/Delimer
     into Srest,Arest from cm_history
     where hdate = Dat and creditID = CrdID;*/
     
     select Currency 
     into Pval from cm_portfolio
     where id = CrdID;
     
   if Pval = 0 then
     insert into cm_duerests_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),Sduerest,Aduerest,0,0,0,0);
   end if;

    if Pval =1 then
     insert into cm_duerests_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),0,0,Sduerest,Aduerest,0,0);                          
     end if;
     
     if Pval = 48 then
     insert into cm_duerests_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),0,0,0,0,Sduerest,Aduerest);                          
     end if;
  end;
  
 

                            
END;
/


