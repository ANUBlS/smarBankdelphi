-- Start of DDL Script for Table SMART.XS_INCOMING
-- Generated 5-Feb-2007 19:47:24 from SMART@SBN

CREATE TABLE xs_incoming
    (id                             NUMBER,
    reference                      VARCHAR2(16),
    val_cod                        NUMBER(4,0),
    amount                         NUMBER(22,2),
    sen_acc                        VARCHAR2(34),
    sen_name                       VARCHAR2(70),
    sen_inn                        VARCHAR2(35),
    sen_bank_id                    NUMBER,
    sen_bank_subacc                NUMBER(13,0),
    rec_bank_subacc                NUMBER(13,0),
    rec_bank_bik                   VARCHAR2(11),
    rec_client_acc                 VARCHAR2(34),
    rec_client_acc_id              NUMBER,
    rec_client_name                VARCHAR2(70),
    rec_client_inn                 VARCHAR2(35),
    remit_inf                      VARCHAR2(140),
    typecode                       NUMBER(3,0),
    add_inf                        VARCHAR2(105),
    trans_date                     DATE,
    status                         NUMBER(1,0),
    filial                         NUMBER(10,0),
    userid                         NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     2678784
    NEXT        507904
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
PARALLEL (DEGREE DEFAULT)
/


-- Triggers for XS_INCOMING

CREATE OR REPLACE TRIGGER xs_incoming_userid
 BEFORE
  INSERT
 ON xs_incoming
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
   :NEW.USERID:=SBLOGIN.USERID;
END;
/
CREATE OR REPLACE TRIGGER xs_incoming_update_icon
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

-- End of DDL Script for Table SMART.XS_INCOMING

