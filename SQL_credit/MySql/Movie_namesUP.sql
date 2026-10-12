declare

cursor c_cat
is
select id,newid from sbcm_categories
where newid is not null;

begin

  for cat in c_cat
  loop
   update sbcm_movie_names 
   set typeid = cat.newid
   where typeid = cat.id;
  end loop; 
end;
