-- Start of DDL Script for Table SMART.XS_BATCHS_ARCHIVE
-- Generated 20-May-2006 14:04:01 from SMART@SB

CREATE TABLE xs_batchs_archive
    (id                             NUMBER NOT NULL,
    f_id                           NUMBER,
    opercode                       VARCHAR2(6),
    acc_id                         NUMBER,
    client_name                    VARCHAR2(70),
    client_code                    VARCHAR2(70),
    trans_ref                      VARCHAR2(16),
    amount                         NUMBER(22,2),
    val_acc                        NUMBER(4,0),
    transdate                      DATE,
    send                           NUMBER(1,0),
    status                         NUMBER(1,0),
    filial                         NUMBER(10,0),
    transaction_id                 NUMBER(10,0),
    client_inn                     VARCHAR2(30),
    userid                         NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     1064960
    NEXT        507904
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- End of DDL Script for Table SMART.XS_BATCHS_ARCHIVE

