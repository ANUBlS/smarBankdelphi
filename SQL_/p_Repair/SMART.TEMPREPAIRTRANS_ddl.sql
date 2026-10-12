-- Start of DDL Script for Table SMART.TEMPREPAIRTRANS
-- Generated 30/07/2003 4:03:38 PM from SMART@SB-CURRENT

CREATE TABLE temprepairtrans
    (id                             NUMBER(10,0) NOT NULL,
    op_id                          NUMBER(10,0),
    no_prov                        VARCHAR2(8),
    dat                            DATE,
    debt                           NUMBER(10,0),
    kredit                         NUMBER(10,0),
    val_acc                        NUMBER(10,0),
    vid_op                         NUMBER(5,0),
    ammount                        NUMBER(15,2),
    lammount                       NUMBER(15,2),
    tim                            DATE,
    shifr                          NUMBER(5,0),
    no_pack                        NUMBER(5,0),
    kassa_b                        NUMBER(5,0),
    kassa_z                        NUMBER(5,0),
    no_filial                      NUMBER(5,0),
    sloj_prov                      NUMBER(5,0),
    bank_d                         NUMBER,
    bank_k                         NUMBER,
    no_doc                         NUMBER(5,0),
    no_mem                         NUMBER(5,0),
    d1                             VARCHAR2(20),
    k1                             VARCHAR2(20),
    rate_d                         NUMBER(15,2),
    rate_c                         NUMBER(15,2),
    parentid                       NUMBER,
    currencyid_c                   NUMBER(4,0),
    ammount_c                      NUMBER(15,2),
    name                           VARCHAR2(255))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     61440
    NEXT        61440
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  761
  )
/


-- End of DDL Script for Table SMART.TEMPREPAIRTRANS

