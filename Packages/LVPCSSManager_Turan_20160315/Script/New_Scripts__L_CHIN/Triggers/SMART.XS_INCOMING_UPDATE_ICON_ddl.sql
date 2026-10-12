-- Start of DDL Script for Trigger SMART.XS_INCOMING_UPDATE_ICON
-- Generated 20-May-2006 14:24:38 from SMART@SB

CREATE OR REPLACE TRIGGER "SMART".xs_incoming_update_icon
 BEFORE
  INSERT
 ON xs_incoming
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare nw integer;
begin
 select xs_INCOMING_ID_GEN.nextval into nw from dual;
 :new.id:=nw;
end ;

-- End of DDL Script for Table SMART.XS_BENEFICIARY
/

-- End of DDL Script for Trigger SMART.XS_INCOMING_UPDATE_ICON

