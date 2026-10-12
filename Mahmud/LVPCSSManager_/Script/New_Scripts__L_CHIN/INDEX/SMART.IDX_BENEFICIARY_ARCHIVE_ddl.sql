-- Start of DDL Script for Index SMART.IDX_BENEFICIARY_ARCHIVE
-- Generated 20-May-2006 14:40:02 from SMART@SB

CREATE INDEX idx_beneficiary_archive ON xs_beneficiary_archive
  (
    batchid                         ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     10240
    NEXT        126976
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
/

-- End of DDL Script for Index SMART.IDX_BENEFICIARY_ARCHIVE

