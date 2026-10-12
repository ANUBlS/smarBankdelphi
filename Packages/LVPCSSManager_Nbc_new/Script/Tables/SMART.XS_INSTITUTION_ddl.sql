-- Start of DDL Script for Table SMART.XS_INSTITUTION
-- Generated 5-Feb-2007 19:47:29 from SMART@SBN

CREATE TABLE xs_institution
    (id                             NUMBER,
    name                           VARCHAR2(255),
    bosh                           VARCHAR2(40),
    tek                            VARCHAR2(40),
    uch                            VARCHAR2(255),
    description                    VARCHAR2(300))
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


-- End of DDL Script for Table SMART.XS_INSTITUTION

