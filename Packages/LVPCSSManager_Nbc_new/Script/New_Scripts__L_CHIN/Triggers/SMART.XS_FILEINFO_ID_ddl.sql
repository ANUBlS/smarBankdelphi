-- Start of DDL Script for Trigger SMART.XS_FILEINFO_ID
-- Generated 20-May-2006 14:24:15 from SMART@SB

CREATE OR REPLACE TRIGGER "SMART".xs_fileinfo_id
 BEFORE
  INSERT
 ON xs_sentinfo
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare nw integer;
begin
 select XS_FILEINFO_ID_GEN.nextval into nw from dual;
 :new.id:=nw;
end;
/

-- End of DDL Script for Trigger SMART.XS_FILEINFO_ID

