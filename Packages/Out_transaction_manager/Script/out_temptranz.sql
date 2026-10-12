-- Start of DDL Script for Table SMART.OUT_TEMPTRANZ
-- Generated 10-May-2006 17:09:30 from SMART@SB

CREATE TABLE out_temptranz
    (id                             NUMBER NOT NULL,
    debitid                        NUMBER,
    creditid                       NUMBER,
    debitamount                    NUMBER(15,2),
    creditamount                   NUMBER(15,2),
    lamount                        NUMBER(15,2),
    debitrate                      NUMBER(17,4),
    creditrate                     NUMBER(17,4),
    trname                         VARCHAR2(128),
    parentid                       NUMBER,
    flags                          NUMBER DEFAULT 0

 ,
    result                         NUMBER,
    tempid                         NUMBER NOT NULL,
    applied                        NUMBER DEFAULT 0
,
    filialid                       NUMBER,
    kassa_b                        NUMBER,
    kassa_z                        NUMBER,
    vid_op                         NUMBER,
    shifr                          NUMBER,
    no_pack                        NUMBER,
    bank_d                         NUMBER,
    bank_k                         NUMBER,
    rate_d                         NUMBER,
    rate_c                         NUMBER,
    sessionid                      NUMBER,
    operatorid                     NUMBER(*,0),
    no_prov                        VARCHAR2(20))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     2457600
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/




-- End of DDL Script for Table SMART.OUT_TEMPTRANZ

