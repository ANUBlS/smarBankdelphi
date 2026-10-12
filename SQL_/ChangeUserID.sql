declare
 cursor c_OLDOPID is 
     select OP_ID from 
     (
     select * from 
      (
      select op_id,count(*) as cnt from account group by op_id 
      )
     where cnt= (select max(cnt) from (select op_id,count(*) as cnt from account group by op_id ))
     ); 

  cursor c_NEWOPID is
     select ID from User$ where UPPER(Name)='SMART'; 
     
 OldSmartID Number;    
 CurrentSmartID Number;    
begin

 open c_OLDOPID;
 fetch c_OLDOPID into OldSmartID;
 dbms_output.put_line(' OldSmartID is '|| to_char(OldSmartID));
 close c_OLDOPID; 
 
 open c_NEWOPID;
 fetch c_NEWOPID into CurrentSmartID;
 dbms_output.put_line(' CurrentSmartID is '|| to_char(CurrentSmartID));
 close c_NEWOPID; 
 
--1 Customers  
 Update Customers set OP_ID = CurrentSmartID where OP_ID = OldSmartID;
 commit;
--2 Account
 Update Account set OP_ID = CurrentSmartID where OP_ID = OldSmartID;
 commit;
--3 Provarch
 Update Provarch set OP_ID = CurrentSmartID where OP_ID = OldSmartID;
 commit;
 
end;
