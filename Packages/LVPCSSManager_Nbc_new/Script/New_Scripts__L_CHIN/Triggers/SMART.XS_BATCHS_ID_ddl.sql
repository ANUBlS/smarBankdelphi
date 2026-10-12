-- Start of DDL Script for Trigger SMART.XS_BATCHS_ID
-- Generated 20-May-2006 14:28:38 from SMART@SB

CREATE OR REPLACE TRIGGER "SMART".xs_batchs_id
 BEFORE
  INSERT
 ON xs_batchs
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare nw integer;
begin
 select XS_BATCHS_ID_GEN.nextval into nw from dual;
 :new.id:=nw;
end;
/

-- End of DDL Script for Trigger SMART.XS_BATCHS_ID

