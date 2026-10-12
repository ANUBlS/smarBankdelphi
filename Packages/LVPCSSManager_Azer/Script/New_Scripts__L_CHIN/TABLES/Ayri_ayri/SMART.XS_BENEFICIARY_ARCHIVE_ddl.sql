-- Start of DDL Script for Table SMART.XS_BENEFICIARY_ARCHIVE
-- Generated 20-May-2006 14:04:17 from SMART@SB

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
    INITIAL     2375680
    NEXT        1146880
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- End of DDL Script for Table SMART.XS_BENEFICIARY_ARCHIVE

