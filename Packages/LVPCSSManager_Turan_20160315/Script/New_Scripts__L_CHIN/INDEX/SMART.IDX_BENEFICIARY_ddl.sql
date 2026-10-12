-- Start of DDL Script for Index SMART.IDX_BENEFICIARY
-- Generated 20-May-2006 14:26:43 from SMART@SB

CREATE INDEX idx_beneficiary ON xs_beneficiary
  (
    batchid                         ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     10240
    NEXT        10240
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
/

-- End of DDL Script for Index SMART.IDX_BENEFICIARY

