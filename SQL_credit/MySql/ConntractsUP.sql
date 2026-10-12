declare

cursor c_up
is
select id,newid from sbcm_categories
where newid is not null;

begin

 for cat in c_up
 loop
  update sbcm_contracts
  set ClientType = cat.newid
  where ClientType = Cat.id;
 end loop;
  
end;
