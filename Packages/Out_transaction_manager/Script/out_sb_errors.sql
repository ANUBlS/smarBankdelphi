-- Start of DDL Script for Table SMART.SB_ERRORS
-- Generated 6/3/2006 4:43:25 PM from SMART@SB

CREATE TABLE out_sb_errors
    (id                             NUMBER NOT NULL,
    text                           VARCHAR2(256))
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
/


-- Constraints for SB_ERRORS

ALTER TABLE out_sb_errors
ADD CONSTRAINT out_pk_sb_errors PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     81920
    NEXT        49152
    PCTINCREASE 0
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
/

-- End of DDL Script for Table SMART.SB_ERRORS


