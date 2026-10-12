-- Start of DDL Script for Table SMART.ACCOUNT_FLAGS
-- Generated 25-May-2006 20:24:56 from SMART@SB

CREATE TABLE out_account_flags
    (symbol                         CHAR(1) NOT NULL,
    name                           VARCHAR2(32) NOT NULL,
    description                    VARCHAR2(64))
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


-- Constraints for ACCOUNT_FLAGS

ALTER TABLE out_account_flags
ADD CONSTRAINT out_uk_acc_flags_symbol UNIQUE (symbol)
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

-- Triggers for ACCOUNT_FLAGS

CREATE OR REPLACE TRIGGER out_restrict_delete_update
 BEFORE
  DELETE OR UPDATE
 ON out_account_flags
REFERENCING NEW AS NEW OLD AS OLD
begin
  RAISE_APPLICATION_ERROR(-20999 ,'Editing or Deleting Rows Restricted by SYSTEM!');
end;
/

-- Comments for ACCOUNT_FLAGS

COMMENT ON TABLE out_account_flags IS 'Lazimdir'
/

-- End of DDL Script for Table SMART.ACCOUNT_FLAGS

