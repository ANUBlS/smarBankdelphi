update provarch set vid_op=1,name='ћ€з€нн€ ф€рги' where name=' урс ф€рги' or name='Kurs fergi' or name='ћ€з€нн€ ф€рги';
--update provarch set vid_op=1 where name='ћ€з€нн€ ф€рги';
update provarch set vid_op=2 where name='Galir zararin baglanmasi';
update provarch set name='Gelir zererin baglanmasi' where vid_op=2;
update provarch set vid_op=0, name='(MultiCurrency Auto Transaction)' where parentid is not null;
update provarch set vid_op=0 where id in (select parentID from provarch where vid_op=0);

create view v_provarch1 as 
select a1.acc_no DebitNumber, a2.acc_no CreditNumber, p.*
 from provarch p, account a1, account a2 
  where p.debt=a1.id and p.kredit=a2.id;

drop table vid_op;

CREATE TABLE vid_op
(
id  NUMBER(3,0),
name VARCHAR2(128)
);

insert into vid_op values(1,'Kurs fergi (MultiCurrency)');

insert into vid_op values(2,'Galir zararin baglanmasi');

insert into vid_op values(3,'ћ€з€нн€ ф€рги');

select * from vid_op;

commit;

