-- Start of DDL Script for Table SMART.XS_BENEFICIARY
-- Generated 20-May-2006 14:04:10 from SMART@SB

CREATE TABLE xs_beneficiary
    (id                             NUMBER,
    batchid                        NUMBER,
    rec_bank_id                    NUMBER,
    rec_bank_sub_acc               NUMBER(13,0),
    client_acc_no                  VARCHAR2(34),
    client_name                    VARCHAR2(70),
    client_code                    VARCHAR2(70),
    client_inn                     VARCHAR2(30),
    remit_inf                      VARCHAR2(145),
    trans_cod                      NUMBER(3,0),
    add_inf                        VARCHAR2(107),
    val_date                       DATE,
    val_cod                        NUMBER(4,0),
    mess_reference                 VARCHAR2(16),
    amount                         NUMBER(22,2),
    bnfcount                       NUMBER(5,0),
    status                         NUMBER(1,0),
    transaction_id                 NUMBER(10,0),
    userid                         NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     1064960
    NEXT        16384
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
PARALLEL (DEGREE DEFAULT)
/


-- Indexes for XS_BENEFICIARY

CREATE INDEX idx_beneficiary ON xs_beneficiary
  (
    batchid                         ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     10240
    NEXT        10240
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
/


-- Triggers for XS_BENEFICIARY

CREATE OR REPLACE TRIGGER "SMART".xs_beneficiary_id
 BEFORE
  INSERT
 ON xs_beneficiary
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   nw   INTEGER;
BEGIN
   SELECT xs_beneficiary_id_gen.NEXTVAL
     INTO nw
     FROM DUAL;

   :NEW.id := nw;
END;
/
CREATE OR REPLACE TRIGGER "SMART".xs_beneficiary_userid
 BEFORE
  INSERT
 ON xs_beneficiary
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
   :NEW.USERID:=SBLOGIN.USERID;
END;


-- End of DDL Script for Table SMART.HOXMESSAGE_OUT
/

-- End of DDL Script for Table SMART.XS_BENEFICIARY

