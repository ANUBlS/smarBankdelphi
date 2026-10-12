-- Start of DDL Script for Table SMART.XS_TRANSTYPE_CODE
-- Generated 5-Feb-2007 19:47:36 from SMART@SBN

CREATE TABLE xs_transtype_code
    (code                           NUMBER(3,0),
    name                           VARCHAR2(40),
    nameid                         NUMBER,
    id                             NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     81920
    NEXT        16384
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
PARALLEL (DEGREE DEFAULT)
/


-- End of DDL Script for Table SMART.XS_TRANSTYPE_CODE

