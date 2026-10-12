-- Start of DDL Script for Trigger SMART.V_TR_AVALUTE
-- Generated 16-Mar-2005 12:12:07 from SMART@SBTEST

CREATE OR REPLACE TRIGGER v_tr_avalute
INSTEAD OF INSERT  OR UPDATE  OR  DELETE 
ON avalute
REFERENCING NEW AS NEW OLD AS OLD
begin
if inserting then
dbms_output.put_line('ins ');
insert into avalute_t
(
VALUTE, VAL_NAME, VALU_NAME, VALU_SHORT, USTORG, USTPOK, VALU_GEN, VALU_AZ, 
USING, VALU_OTHER, VALU_INTER, VALU_BALA, PRISTAVKA, COUNTRY, UST_POK1, 
OFFICAL, LIMIT
)
values
(
:new.VALUTE, :new.VAL_NAME, :new.VALU_NAME, :new.VALU_SHORT, :new.USTORG, :new.USTPOK, :new.VALU_GEN, :new.VALU_AZ, 
:new.USING, :new.VALU_OTHER, :new.VALU_INTER, :new.VALU_BALA, :new.PRISTAVKA, :new.COUNTRY, :new.UST_POK1, 
:new.OFFICAL, :new.LIMIT
);
-- insert into TempRate (val_kod, ostat, dat, shifr) values (:new.valute,1,sbop.get_date(),3);
insert into bankproperties select :new.valute,:new.DEBET, :new.KREDIT, :new.F5501P, :new.F5501V, :new.SDEBET, :new.SCREDIT,id from filial;

elsif updating then
dbms_output.put_line('upd ');
update avalute_t set
VALUTE=:new.valute
,VAL_NAME=:new.val_name
,VALU_NAME=:new.valu_name
,VALU_SHORT=:new.valu_short
,USTORG=:new.ustorg
,USTPOK=:new.ustpok
,VALU_GEN=:new.valu_gen
,VALU_AZ =:new.valu_az
,USING=:new.using
,VALU_OTHER=:new.valu_other
,VALU_INTER=:new.valu_inter
,VALU_BALA=:new.valu_bala
,PRISTAVKA=:new.pristavka
,COUNTRY=:new.country
,UST_POK1 =:new.ust_pok1
,OFFICAL=:new.offical
,LIMIT=:new.limit
where valute=:new.valute;

update bankproperties set
 valute=:new.valute
,debet=:new.DEBET
,kredit=:new.KREDIT
,f5501p= :new.F5501P
,f5501v= :new.F5501V
,sdebet= :new.SDEBET
,scredit= :new.SCREDIT
where valute=:new.valute
and filialid=(select filialid from sba_objinf where obj=(select user from dual))
;


elsif deleting then
dbms_output.put_line('del ');
 delete from avalute_t where valute=:old.valute;
 delete from bankproperties where valute=:old.valute;
end if;
end;
/

-- End of DDL Script for Trigger SMART.V_TR_AVALUTE


