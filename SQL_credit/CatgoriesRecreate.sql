
begin
  execute immediate 'create table x as select * from CM_CATEGORIES';
  
  delete from CM_CATEGORIES cascade;
  
  execute immediate 'alter trigger BI_CM_CATEGORIES disable';
  
  insert into CM_CATEGORIES 
  select * from X;
  
  execute immediate 'alter trigger BI_CM_CATEGORIES enable';  
  commit;
end;
