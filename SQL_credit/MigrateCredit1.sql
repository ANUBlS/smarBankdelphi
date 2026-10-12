declare 
  CredID integer;
  
  cursor c_credit is
  select ID from CM_ACTIVE_CREDITS WHERE BRANCHID=81;
  
  cursor c_credit_acc(id in integer) is
  select loanaccid, interestaccid
  from CM_Accounts
  where CreditID=ID;
  
  cursor C_Account_Rest(AccountID in Integer) is
  select Ostat
  from Smart.TENOSTAT
  where Acc_ID  = AccountID;
  
  X c_credit_acc%rowtype;
  Y C_Account_Rest%rowtype;
  
  brest number(18,2);
  inter number(18,2);
  
begin
  for ACredit in c_credit
  loop
  
    CredID := ACredit.ID;
    brest := 0;
    inter := 0;
    open  c_credit_acc(CredID);
    fetch c_credit_acc into  x;
    close c_credit_acc;
    
    if  (x.loanaccid is not null) and (x.loanaccid<>0) then
    open C_Account_Rest(x.loanaccid);
    fetch C_Account_Rest into Y;
    close C_Account_Rest;
    brest := Y.Ostat;
    end if;
    
    if  (x.interestaccid is not null) and (x.interestaccid<>0) then    
    open C_Account_Rest(x.interestaccid);
    fetch C_Account_Rest into Y;
    close C_Account_Rest;
    inter := Y.Ostat;    
    end if;
    
    update CM_CURR_STATE
    set
      rest=abs(brest),
      interestrest=abs(inter)
    where Creditid = CredID;

    update CM_PREV_STATE
    set
      rest=abs(brest),
      interestrest=abs(inter)
    where Creditid = CredID;
       
   -- dbms_output.put_line('CreditID =  '||TO_CHAR(CredID));
  end loop;
end;  
