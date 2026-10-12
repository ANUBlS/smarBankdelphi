-- Start of DDL Script for Table SMART.XS_BRANCHACCOUNT
-- Generated 20-May-2006 14:04:54 from SMART@SB

CREATE TABLE xs_branchaccount
    (branchid                       NUMBER,
    accid                          NUMBER,
    valute                         NUMBER)
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


-- End of DDL Script for Table SMART.XS_BRANCHACCOUNT

