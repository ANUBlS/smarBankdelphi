-- Start of DDL Script for Table SMART.WARES_ALL_TRANS
-- Generated 29-Dec-2006 17:40:29 from SMART@ORCL



CREATE TABLE smart.wares_all_trans
    (group_name                     VARCHAR2(225),
    groups_id                      NUMBER,
    debt_acc                       NUMBER,
    cred_acc                       NUMBER,
    debt_amount                    NUMBER(18,2),
    trans_date                     DATE,
    id                             NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     16384
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
/




-- Triggers for SMART.WARES_ALL_TRANS

CREATE OR REPLACE TRIGGER "SMART".tr_wares_all_trans
BEFORE INSERT 
ON wares_all_trans
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
select seq_wares_all_trans.NEXTVAL into :new.id from dual;
end;
/


-- End of DDL Script for Table SMART.WARES_ALL_TRANS

