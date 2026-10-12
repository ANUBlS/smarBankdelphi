declare 

cursor c_cat
is
select newid from sbcm_categories
where newid is not null;

minid  number;

begin

  for cat in c_cat
  loop
    
      select min(id) into minid
      from sbcm_movie_names
      where TypeID = Cat.newID and name = 'outComeAccForDeposit';
      
      update sbcm_settings_t
      set ParentID = minid
      where ParentID in (select id from sbcm_movie_names where TypeID = Cat.newID and name = 'outComeAccForDeposit'); 
        
  end loop;

end;
