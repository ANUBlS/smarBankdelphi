declare 
  cursor Zaza is
  select id from cm_categories;
  
begin
  for x in zaza 
  loop
    CM_SETUP.categorylinks_add(x.id);
  end loop;
  
end;
