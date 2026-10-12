update cm_curr_state
  set DUEINTERESTREST = 0
where INTERESTrest = DUEINTERESTREST and DueRest = 0
/
update cm_curr_state
  set INTERESTREST = 0
where INTERESTREST = DUEINTERESTREST and Rest = 0 
/
update cm_accounts
  set
    ContractAccID = DueLoanAccID
 where CreditID in (select CreditID from cm_curr_state
 where DUEREST>0 and REST=0
 )    
