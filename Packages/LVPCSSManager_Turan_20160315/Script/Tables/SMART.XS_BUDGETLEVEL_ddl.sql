-- Start of DDL Script for Table SMART.XS_BUDGETLEVEL
-- Generated 5-Feb-2007 19:46:35 from SMART@SBN

CREATE TABLE xs_budgetlevel
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(255),
    description                    VARCHAR2(255))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- End of DDL Script for Table SMART.XS_BUDGETLEVEL

