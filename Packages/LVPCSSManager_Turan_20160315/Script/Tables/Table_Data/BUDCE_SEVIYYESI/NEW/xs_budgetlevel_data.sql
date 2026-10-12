Truncate Table Smart.xs_budgetlevel
/
insert into Smart.xs_budgetlevel(NAME,ID) values('Respublika Budcesi',1);
insert into Smart.xs_budgetlevel(NAME,ID) values('Naxchivan MR Budcesi',2);
insert into Smart.xs_budgetlevel(NAME,ID) values('Budcedenken. Vesait',3);
insert into Smart.xs_budgetlevel(NAME,ID) values('DSMF',4);
insert into Smart.xs_budgetlevel(NAME,ID) values('Neft Fondu',5);
insert into Smart.xs_budgetlevel(NAME,ID) values('Naxchivan MR Budcedenken. Vesait',6);
insert into Smart.xs_budgetlevel(NAME,ID) values('Depozit ve tapshiriq',7);

update Smart.xs_budgetlevel set 
   DESCRIPTION = ID||' - '||NAME;

commit;
