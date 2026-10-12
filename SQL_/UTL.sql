declare
  hand UTL_FILE.file_type;
  cursor c_table is select * from account;
begin
 hand :=UTL_FILE.('C:\UTL_FILE_DIR','qaz.txt','w');
 
 for tab in c_table
 loop 
  UTL_FILE.put_line(hand, tab.acc_no);
 end loop;
 
 UTL_FILE.fclose(hand);
 
end;
