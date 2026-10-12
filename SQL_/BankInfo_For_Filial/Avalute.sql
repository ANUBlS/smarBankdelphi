Create table BankProperties as
 select valute, debet, kredit, f5501p, f5501v, sdebet, scredit, id as filialid
  from avalute,filial;
/
  
Create table avalute_t as
 select 
  valute, val_name,valu_name,valu_short,ustorg,
   ustpok,valu_gen,valu_az,using,valu_other,valu_inter,
    valu_bala,pristavka,country,ust_pok1,offical,limit
  from avalute;
/ 
ALTER TABLE SMART.ACCOUNT DROP CONSTRAINT FK_ACC_AVALUTE ; 
ALTER TABLE SMART.OPERKURS DROP CONSTRAINT FK_OPERKURS_AVALUTE ; 
ALTER TABLE SMART.PROVARCH DROP CONSTRAINT FK_PROVARCH_CURRENCYID ; 
ALTER TABLE SMART.PROVARCH DROP CONSTRAINT FK_PROVARCH_VAL_ACC ; 
ALTER TABLE SMART.AVALUTE DROP CONSTRAINT UK_AVALUTE ; 
ALTER TABLE SMART.AVALUTE DROP CONSTRAINT UK_VALUTE_VAL_NAME ; 
ALTER TABLE SMART.AVALUTE DROP CONSTRAINT PK_AVALUTE ; 
/

drop table avalute;
/
---  Pk AVALUTE_T  ----------
ALTER TABLE AVALUTE_T ADD CONSTRAINT PK_AVALUTE PRIMARY KEY ( VALUTE ) using index TABLESPACE SMARTIDX; 

-- Fk Account -----------
ALTER TABLE ACCOUNT ADD CONSTRAINT FK_ACC_AVALUTE 
   FOREIGN KEY (VAL_ACC) REFERENCES AVALUTE_T (VALUTE) /*on delete cascade*/ ; 

--- Fk OperKurs -----------
ALTER TABLE OPERKURS ADD CONSTRAINT FK_OPERKURS_AVALUTE 
   FOREIGN KEY (VAL_KOD) REFERENCES AVALUTE_T (VALUTE) on delete cascade; 
  
--- Fk PROVARCH -----------
ALTER TABLE PROVARCH ADD CONSTRAINT FK_PROVARCH_CURRENCYID
 FOREIGN KEY (CURRENCYID_C) REFERENCES AVALUTE_T (VALUTE) /*on delete cascade*/ ; 
  
--- Fk PROVARCH -----------
ALTER TABLE PROVARCH ADD CONSTRAINT FK_PROVARCH_VAL_ACC
 FOREIGN KEY (VAL_ACC) REFERENCES AVALUTE_T (VALUTE) /*on delete cascade*/ ; 

--------------
CREATE OR REPLACE TRIGGER inc_avalute
 AFTER
  INSERT
 ON avalute_t
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
 insert into TempRate (val_kod, ostat, dat, shifr) values (:new.valute,1,sbop.get_date(),3);
end;
/

CREATE OR REPLACE TRIGGER sba_avalute_delete
 BEFORE
  DELETE
 ON avalute_t
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('AVALUTE','delete');  --adm
end;
/

CREATE OR REPLACE TRIGGER sba_avalute_update
 BEFORE
  UPDATE
 ON avalute_t
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('AVALUTE','update');  --adm
end;
/

-----  sba_avalute_insert -----
CREATE OR REPLACE TRIGGER sba_avalute_insert
 BEFORE
  INSERT
 ON avalute_t
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('AVALUTE','insert');  --adm
end;
/

-- View ----------
create or replace view avalute as
select 
v.*, bp.debet, bp.kredit, bp.f5501p, bp.f5501v, bp.sdebet, bp.scredit
 from avalute_t v, BankProperties BP
where v.valute = bp.valute and bp.filialid=
(select filialid from sba_objinf where obj=(select user from dual));

------ Tr View -----------------
CREATE OR REPLACE TRIGGER v_tr_avalute
 INSTEAD OF INSERT OR DELETE OR UPDATE ON avalute
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
and filialid=(select filialid from sba_objinf where obj=(select user from dual));
elsif deleting then
dbms_output.put_line('del ');
 delete from avalute_t where valute=:old.valute;
 delete from bankproperties where valute=:old.valute;
end if;
end;


