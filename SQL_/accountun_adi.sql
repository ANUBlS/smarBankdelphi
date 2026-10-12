update 
  customers
  set name = 'Customer ¹'||TO_CHAR(ID) , SHORT_NAME = 'Customer ¹'||TO_CHAR(ID)
/  
commit
/
update account 
   
   set name = 'Account ¹'||TO_CHAR(ID)
/
commit
/
