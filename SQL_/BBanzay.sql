declare 
  adate Date;
  l integer;
begin
 adate := '15-Mar-2004';
  for i in 1..20 
  loop
    delete from archost where datdate=adate;
    commit;
    adate := adate + 1;
  end loop; 
end;
