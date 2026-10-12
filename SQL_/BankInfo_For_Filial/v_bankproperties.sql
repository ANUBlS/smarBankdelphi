create view v_bankproperties as
select 
f.name,
v.val_name,
ac1.acc_no b_debet,
ac2.acc_no b_kredit,
ac3.acc_no b_f5501p,
ac4.acc_no b_f5501v,
ac5.acc_no b_sdebet,
ac6.acc_no b_scredit,
 b.* from bankproperties b,filial f
 , account ac1 
 , account ac2 
 , account ac3 
 , account ac4 
 , account ac5
 , account ac6 
 , avalute_t v
where b.filialid=f.id 
and b.valute=v.valute
and ac1.id(+)=b.debet
and ac2.id(+)=b.kredit
and ac3.id(+)=b.f5501p
and ac4.id(+)=b.f5501v
and ac5.id(+)=b.sdebet
and ac6.id(+)=b.scredit
