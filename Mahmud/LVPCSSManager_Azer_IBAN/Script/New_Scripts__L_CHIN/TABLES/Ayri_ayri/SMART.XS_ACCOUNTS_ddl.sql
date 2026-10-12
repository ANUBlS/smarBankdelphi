-- Start of DDL Script for Table SMART.XS_ACCOUNTS
-- Generated 20-May-2006 14:00:22 from SMART@SB

CREATE TABLE xs_accounts
    (id                             NUMBER,
    acc_id                         NUMBER,
    valute                         NUMBER(4,0),
    branchid                       NUMBER)
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


-- Triggers for XS_ACCOUNTS

CREATE OR REPLACE TRIGGER "SMART".xs_accounts_id
 BEFORE
  INSERT
 ON xs_accounts
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare nw integer;
begin
 select XS_ACCOUNTS_ID_GEN.nextval into nw from dual;
 :new.id:=nw;
end;
/

-- End of DDL Script for Table SMART.XS_ACCOUNTS

