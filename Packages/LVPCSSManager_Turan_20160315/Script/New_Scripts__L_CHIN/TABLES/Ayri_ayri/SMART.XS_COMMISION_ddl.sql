-- Start of DDL Script for Table SMART.XS_COMMISION
-- Generated 20-May-2006 14:05:03 from SMART@SB

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

