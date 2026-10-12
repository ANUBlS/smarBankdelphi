-- Start of DDL Script for Table SMART.XS_FILTER
-- Generated 5-Feb-2007 19:46:54 from SMART@SBN

CREATE TABLE xs_filter
    (acc_id                         NUMBER(10,0) NOT NULL)
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


-- Constraints for XS_FILTER

ALTER TABLE xs_filter
ADD CONSTRAINT con_xs_filter PRIMARY KEY (acc_id)
USING INDEX
  PCTFREE     10
  INITRANS    2
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

-- End of DDL Script for Table SMART.XS_FILTER
-- Foreign Key
ALTER TABLE xs_filter
ADD CONSTRAINT con_f_xs_filter FOREIGN KEY (acc_id)
REFERENCES bal_spr1 (bal_cn)
/
-- End of DDL script for Foreign Key(s)
