declare 

  cursor c_oldCredits is
  SELECT id, opendate, closedate, amount, contractno,  pledgeprice,reliabilityid,overduereliabilityid
  FROM SMART.sbcm_contracts 
  where type#=1 and BranchID=81
  order by ContractNo;
  
  cursor c_oldCrdAccs(p_ID in Integer)
  is
  SELECT  contractaccid, clientaccid, reserveaccid, interestaccid,
         overdueaccid, overdueinterestaccid, overduereserveaccid
    FROM SMART.sbcm_contract_accounts 
  where ID#=p_ID;
  
  cursor c_oldCrdRates(p_ID in Integer) is
  select i.interest,o.overdueinterest
    from SMART.SBCM_INTERESTS I,SMART.SBCM_OVERDUEINTERESTS O
  where I.ID#=p_ID and O.ID#=p_ID;  
  
  cursor c_NewPortfolio(p_ID in Integer) is
  SELECT id, creditlineamount,
         annualyinterestrate, annualyoverduerate, 
         dateofconclusion, duedatefirstcontract,
         numberofcredit
    FROM cm_portfolio        
  where id=p_ID;
  
  cursor c_newAccs(p_ID in Integer) is
  SELECT  Loanaccid, dueloanaccid,boorowerAccID,
         interestaccid, dueinterestaccid, primaryreserveaccid,
         secondaryreserveaccid
    FROM cm_accounts  
  where creditid=p_ID;  
  
  cursor c_newCrdIDByNumber (Num in varchar2) is
  select ID 
  from cm_portfolio where NumberofCredit=NUM;
  
  cursor c_newHist(p_ID in Integer) is
  SELECT  rest, interestrest,
       duerest, dueinterestrest, reserveid, pledgeprice, duereserveid
  FROM cm_curr_state
  where creditid=p_ID;
  
--  cursor select * from sbcm_reliability
  
  oldCrds c_oldCredits%rowtype;
  oldAcc c_oldCrdAccs%rowtype;
  oldRate  c_oldCrdRates%rowtype;
  newPortf c_NewPortfolio%rowtype;
  newAcc c_newAccs%rowtype;
  newHist c_newHist%rowtype;
  Numb c_newCrdIDByNumber%rowtype;
  
  CrdFound  Boolean;                
  aID Integer;
begin
  for oldCrds in   c_oldCredits 
  loop    
  
    open c_newCrdIDByNumber(oldCrds.ContractNo);
    fetch c_newCrdIDByNumber into Numb;
    CrdFound := c_newCrdIDByNumber%Found;    
    aID := Numb.ID;
    close c_newCrdIDByNumber;
    
    if  CrdFound  then --@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
   -- dbms_output.put_line(oldCrds.ContractNo||' -¹  -------------------------YOXLANILIR ....... ');
    
    open c_oldCrdAccs(oldCrds.ID);
    fetch c_oldCrdAccs into oldAcc;
    close c_oldCrdAccs;
    
    open c_oldCrdRates(oldCrds.ID);
    fetch c_oldCrdRates into oldRate;
    close c_oldCrdRates;
    
    open c_NewPortfolio(AID);
    fetch c_NewPortfolio into newPortf;
    close c_NewPortfolio;
    
    open c_newAccs(AID);
    fetch c_newAccs into newAcc;
    close c_newAccs;
    
    open c_newHist(AID);
    fetch c_newHist into newHist;
    close c_newHist;
    
    --Begin Checking
     
     if oldCrds.OpenDate <> newPortf.dateofconclusion then
       dbms_output.put_line(oldCrds.ContractNo||' dateofconclusion SEHVDI');
     end if;

     if oldCrds.closedate <> newPortf.duedatefirstcontract then
       dbms_output.put_line(oldCrds.ContractNo||' duedatefirstcontract SEHVDI');
     end if;
     
     if oldCrds.amount <> newPortf.creditlineamount then
       dbms_output.put_line(oldCrds.ContractNo||' creditlineamount SEHVDI');
     end if;
     /*
     if oldCrds.pledgeprice <> newHist.pledgeprice then
       dbms_output.put_line(oldCrds.ContractNo||' pledgeprice SEHVDI');
     end if;*/
     /*
     if oldCrds.reliabilityid <> newHist.reserveid+1 then
       dbms_output.put_line(oldCrds.ContractNo||' reserveid SEHVDI');
     end if;
     
     if oldCrds.overduereliabilityid <> newHist.duereserveid+1 then
       dbms_output.put_line(oldCrds.ContractNo||' duereserveid SEHVDI');
     end if;
    */
     if oldRate.interest <> newPortf.annualyinterestrate then
       dbms_output.put_line(oldCrds.ContractNo||' annualyinterestrate SEHVDI');
     end if;
     
     if oldRate.overdueinterest <> newPortf.annualyoverduerate then
       dbms_output.put_line(oldCrds.ContractNo||' annualyoverduerate SEHVDI');
     end if;
     
     ------------------------------------------------------
    /* if (oldAcc.overdueaccid is not null)and(oldAcc.overdueaccid<>-1)   then
     if oldAcc.overdueaccid <> newAcc.dueloanaccid then
       dbms_output.put_line(oldCrds.ContractNo||' dueloanaccid SEHVDI');
     end if;     
     end if;
*/
     if oldAcc.contractaccid <> newAcc.Loanaccid then
       dbms_output.put_line(oldCrds.ContractNo||' Loanaccid SEHVDI');
     end if;
          
     if (oldAcc.clientaccid is not null)and(oldAcc.clientaccid <> -1)     then
     if oldAcc.clientaccid <> newAcc.boorowerAccID then
       dbms_output.put_line(oldCrds.ContractNo||' boorowerAccID SEHVDI');
     end if;     
     end if;

     if oldAcc.interestaccid <> newAcc.interestaccid then
       dbms_output.put_line(oldCrds.ContractNo||' InterstsAccID SEHVDI');
     end if;     
     
/*     if (oldAcc.overdueinterestaccid is not null)and(oldAcc.overdueinterestaccid <> -1) then  
     if oldAcc.overdueinterestaccid <> newAcc.dueinterestaccid then
       dbms_output.put_line(oldCrds.ContractNo||' dueinterestaccid SEHVDI');
     end if;     
     end if;*/
  
     if oldAcc.reserveaccid <> newAcc.primaryreserveaccid then
       dbms_output.put_line(oldCrds.ContractNo||' primaryreserveaccid SEHVDI');
     end if;     
     /*   
     if oldAcc.overduereserveaccid <> -1 then
     if oldAcc.overduereserveaccid <> newAcc.secondaryreserveaccid then
       dbms_output.put_line(oldCrds.ContractNo||' secondaryreserveaccid SEHVDI');
     end if;
     end if;     
     */       
--    dbms_output.put_line(oldCrds.ContractNo||' -¹ ------------------------ QUTARDI ...........');    
    
    else
          dbms_output.put_line(oldCrds.ContractNo||' -¹ TAPILMADI!!!!!!!');      
          
    end if;           --@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    
  end loop;

end;

