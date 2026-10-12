select * from archost partition (reserve);
update archost set id_number =1 where datdate<'1-jan-5';
commit;
