-- Start of DDL Script for Table SMART.XS_CONFIG
-- Generated 5-Feb-2007 19:46:46 from SMART@SBN

CREATE TABLE xs_config
    (id                             NUMBER,
    in_dir                         VARCHAR2(250),
    out_dir                        VARCHAR2(250),
    amount_limit                   NUMBER(22,8),
    account                        VARCHAR2(13),
    archive_dir                    VARCHAR2(250),
    usebankdate                    NUMBER,
    commisionid                    NUMBER,
    nb_swift                       VARCHAR2(15),
    coraccount                     VARCHAR2(20))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     40960
    NEXT        16384
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
PARALLEL (DEGREE DEFAULT)
/


-- End of DDL Script for Table SMART.XS_CONFIG

