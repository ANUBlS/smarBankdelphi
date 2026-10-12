-- Start of DDL Script for Table SMART.MEMORIAL_SMART
-- Generated 30-May-2006 18:02:38 from SMART@sb

CREATE TABLE out_memorial_smart
    (dbal_cn                        NUMBER(10) NOT NULL,
    kbal_cn                        NUMBER(10) NOT NULL,
    dat                            DATE NOT NULL,
    diffrate                       NUMBER,
    name                           VARCHAR2(255),
    id                             NUMBER(10) NOT NULL,
    shifr                          NUMBER(5),
    val_acc                        VARCHAR2(4000),
    currencyid_c                   VARCHAR2(4000),
    ammount                        NUMBER(15,2) NOT NULL,
    ammount_c                      NUMBER(15,2) NOT NULL,
    lammount                       NUMBER(15,2) NOT NULL,
    op_id                          NUMBER(10),
    debitor                        VARCHAR2(20) NOT NULL,
    debtinn                        NUMBER,
    dname                          VARCHAR2(90),
    kreditor                       VARCHAR2(20) NOT NULL,
    kredinn                        NUMBER,
    kname                          VARCHAR2(90),
    debt                           NUMBER(10) NOT NULL,
    kredit                         NUMBER(10) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
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


-- End of DDL Script for Table SMART.MEMORIAL_SMART


