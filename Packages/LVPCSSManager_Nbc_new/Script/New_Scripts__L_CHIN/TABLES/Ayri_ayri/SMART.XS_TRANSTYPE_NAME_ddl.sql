-- Start of DDL Script for Table SMART.XS_TRANSTYPE_NAME
-- Generated 20-May-2006 14:06:34 from SMART@SB

CREATE TABLE xs_transtype_name
    (id                             NUMBER,
    name                           VARCHAR2(200))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     40960
    NEXT        16384
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
PARALLEL (DEGREE DEFAULT)
/


-- Triggers for XS_TRANSTYPE_NAME

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

-- End of DDL Script for Table SMART.XS_TRANSTYPE_NAME

