-- Start of DDL Script for Table SMART.XS_ADMIN_IN
-- Generated 13-Jul-2007 21:03:21 from SMART@SBN

CREATE TABLE xs_admin_in
    (user_id                        NUMBER,
    user_name                      VARCHAR2(30),
    filial_id                      NUMBER,
    filial_name                    VARCHAR2(50))
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


-- End of DDL Script for Table SMART.XS_ADMIN_IN

