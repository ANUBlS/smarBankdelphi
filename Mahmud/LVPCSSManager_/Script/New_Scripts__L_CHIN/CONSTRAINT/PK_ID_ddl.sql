-- Start of DDL Script for Constraint SMART.PK_ID
-- Generated 20-May-2006 14:29:09 from SMART@SB

ALTER TABLE xs_batchs
ADD CONSTRAINT pk_id PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartidx
  STORAGE   (
    INITIAL     81920
    NEXT        65536
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/
