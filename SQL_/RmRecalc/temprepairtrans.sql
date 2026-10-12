-- Start of DDL Script for Table SMART.TEMPREPAIRTRANS
-- Generated 15-Apr-2004 2:27:26 from SMART@SBNEW

CREATE TABLE temprepairtrans
    (id                             NUMBER(10) NOT NULL,
    op_id                          NUMBER(10),
    no_prov                        VARCHAR2(8),
    dat                            DATE,
    debt                           NUMBER(10),
    kredit                         NUMBER(10),
    val_acc                        NUMBER(10),
    vid_op                         NUMBER(5),
    ammount                        NUMBER(15,2),
    lammount                       NUMBER(15,2),
    tim                            DATE,
    shifr                          NUMBER(5),
    no_pack                        NUMBER(5),
    kassa_b                        NUMBER(5),
    kassa_z                        NUMBER(5),
    no_filial                      NUMBER(5),
    sloj_prov                      NUMBER(5),
    bank_d                         NUMBER,
    bank_k                         NUMBER,
    no_doc                         NUMBER(5),
    no_mem                         NUMBER(5),
    d1                             VARCHAR2(20),
    k1                             VARCHAR2(20),
    rate_d                         NUMBER(15,2),
    rate_c                         NUMBER(15,2),
    parentid                       NUMBER,
    currencyid_c                   NUMBER(4),
    ammount_c                      NUMBER(15,2),
    name                           VARCHAR2(255))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/

-- End of DDL Script for Table SMART.TEMPREPAIRTRANS


