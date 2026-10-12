-- Start of DDL Script for Trigger SMART.XS_TRANSTYPE_NAME_ID
-- Generated 20-May-2006 14:21:52 from SMART@SB

CREATE OR REPLACE TRIGGER "SMART".xs_transtype_name_id
 BEFORE
  INSERT
 ON xs_transtype_name
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare nw integer;
begin
 select XS_TRANSTYPENAME_ID_GEN.nextval into nw from dual;
 :new.id:=nw;
end ;
/

-- End of DDL Script for Trigger SMART.XS_TRANSTYPE_NAME_ID

