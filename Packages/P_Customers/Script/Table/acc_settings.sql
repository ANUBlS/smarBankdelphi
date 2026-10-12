-- Start of DDL Script for Table SMART.ACC_SETTINGS
-- Generated 17-Nov-2006 16:10:07 from SMART@SB

CREATE TABLE acc_settings
    (id                             NUMBER(10) NOT NULL,
    accnumber                      VARCHAR2(20),
    val_code                       VARCHAR2(10),
    val_name                       VARCHAR2(40),
    bal_cn1                        VARCHAR2(10),
    bal_name                       VARCHAR2(181),
    cust_id                        VARCHAR2(10),
    cust_name                      VARCHAR2(60),
    open_date                      VARCHAR2(10),
    tw_acc_number                  VARCHAR2(30),
    acc_symbol                     VARCHAR2(10),
    limit                          VARCHAR2(10),
    branch_id                      VARCHAR2(10),
    branch_name                    VARCHAR2(40),
    acc_name                       VARCHAR2(100),
    symbol                         VARCHAR2(10),
    ostat                          VARCHAR2(10),
    pok_ostat                      VARCHAR2(10))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     16384
    NEXT        10240
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
PARALLEL (DEGREE DEFAULT)
/


-- Triggers for ACC_SETTINGS

CREATE OR REPLACE TRIGGER cc_ins_accsettings
BEFORE INSERT 
ON acc_settings
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
 select acc_settingsid.nextval into :new.ID from dual;

end;
/

-- End of DDL Script for Table SMART.ACC_SETTINGS


