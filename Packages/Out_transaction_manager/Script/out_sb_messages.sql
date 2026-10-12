-- Start of DDL Script for Table SMART.SB_MESSAGES
-- Generated 6/3/2006 4:41:28 PM from SMART@SB

CREATE TABLE out_sb_messages
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(64) NOT NULL,
    text                           VARCHAR2(1024))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     81920
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- End of DDL Script for Table SMART.SB_MESSAGES


