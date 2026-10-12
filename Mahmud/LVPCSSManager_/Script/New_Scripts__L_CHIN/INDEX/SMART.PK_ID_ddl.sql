-- Start of DDL Script for Index SMART.PK_ID
-- Generated 20-May-2006 14:28:20 from SMART@SB

CREATE UNIQUE INDEX pk_id ON xs_batchs
  (
    id                              ASC
  )
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

-- End of DDL Script for Index SMART.PK_ID

