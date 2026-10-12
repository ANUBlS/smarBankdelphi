-- Start of DDL Script for Table SMART.XS_ACCOUNTS
-- Generated 5-Feb-2007 19:43:53 from SMART@SBN

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

CREATE OR REPLACE TRIGGER xs_accounts_id
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

