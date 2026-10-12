-- Start of DDL Script for Table SMART.XS_BRANCHACCOUNT
-- Generated 5-Feb-2007 19:46:28 from SMART@SBN

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

