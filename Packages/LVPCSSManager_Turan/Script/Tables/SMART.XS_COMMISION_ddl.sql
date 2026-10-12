-- Start of DDL Script for Table SMART.XS_COMMISION
-- Generated 5-Feb-2007 19:46:40 from SMART@SBN

CREATE TABLE xs_commision
    (custid                         NUMBER,
    comission                      NUMBER(1,0))
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


-- End of DDL Script for Table SMART.XS_COMMISION

