-- Start of DDL Script for Trigger SMART.AFTER_INC_FILIAL
-- Generated 13-May-2005 22:00:19 from SMART@SB


CREATE OR REPLACE TRIGGER after_inc_filial
 AFTER
  INSERT
 ON filial_t
REFERENCING NEW AS NEW OLD AS OLD
declare 
nw number;
begin
 select tr_seg_Filial.currval into nw from dual;
 insert into bankinfo_t (kod_fil) values (nw); 

 insert into bankproperties select 
  valute,debet,kredit,f5501p,f5501v,sdebet,scredit,nw
    from bankproperties where filialid=0;
end;
/

-- End of DDL Script for Trigger SMART.AFTER_INC_FILIAL

-- Start of DDL Script for Trigger SMART.INC_FILIAL
-- Generated 13-May-2005 22:00:19 from SMART@SB

CREATE OR REPLACE TRIGGER inc_filial
 BEFORE
  INSERT
 ON filial_t
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare nw integer;
begin
 select tr_seg_Filial.nextval into nw from dual;
 :new.id:=nw;
end Inc_Filial;
/

-- End of DDL Script for Trigger SMART.INC_FILIAL

