-- Start of DDL Script for Table SMART.ACCOUNT_FLAGS
-- Generated 12-Nov-2003 17:13:15 from SMART@SBDIABLO

CREATE TABLE account_flags
    (symbol                         CHAR(1) NOT NULL,
    name                           VARCHAR2(32),
    description                    VARCHAR2(64))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  STORAGE   (
    INITIAL     10240
    NEXT        10240
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
PARALLEL (DEGREE DEFAULT)
/


-- Constraints for ACCOUNT_FLAGS

ALTER TABLE account_flags
ADD CONSTRAINT uk_acc_flags_symbol UNIQUE (symbol)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  STORAGE   (
    INITIAL     10240
    NEXT        10240
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
/

-- End of DDL Script for Table SMART.ACCOUNT_FLAGS

