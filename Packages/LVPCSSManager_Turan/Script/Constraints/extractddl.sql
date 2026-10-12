-- Start of DDL Script for Constraint SMART.CON_XS_FILTER
-- Generated 5-Feb-2007 19:57:57 from SMART@SBN

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
-- Start of DDL Script for Constraint SMART.CON_F_XS_FILTER
-- Generated 5-Feb-2007 19:57:57 from SMART@SBN

ALTER TABLE xs_filter
ADD CONSTRAINT con_f_xs_filter FOREIGN KEY (acc_id)
REFERENCES bal_spr1 (bal_cn)
/

-- Start of DDL Script for Constraint SMART.PK_ID
-- Generated 17-Mar-2007 21:16:36 from SMART@SBN

ALTER TABLE xs_batchs
ADD CONSTRAINT pk_id PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     163840
    NEXT        98304
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/
-- End of DDL script for Foreign Key(s)/
