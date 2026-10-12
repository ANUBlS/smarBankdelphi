-- Start of DDL Script for Table SMART.XS_BENEFICIARY_ARCHIVE
-- Generated 5-Feb-2007 19:44:17 from SMART@SBN

CREATE TABLE xs_beneficiary_archive
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
    INITIAL     5242880
    NEXT        3874816
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- Indexes for XS_BENEFICIARY_ARCHIVE

CREATE INDEX idx_beneficiary_archive ON xs_beneficiary_archive
  (
    batchid                         ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     16384
    NEXT        442368
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
/


-- End of DDL Script for Table SMART.XS_BENEFICIARY_ARCHIVE

