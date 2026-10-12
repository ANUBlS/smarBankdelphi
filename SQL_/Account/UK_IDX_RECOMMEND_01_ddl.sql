-- Start of DDL Script for Index SMART.UK_IDX_RECOMMEND_01
-- Generated 15-Apr-2005 13:05:04 from SMART@ATANEW

CREATE UNIQUE INDEX uk_idx_recommend_01 ON account
  (
    id                              ASC,
    val_acc                         ASC,
    close_dat                       ASC,
    acc_no                          ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  STORAGE   (
    BUFFER_POOL DEFAULT
  )
  LOCAL (
  PARTITION CLOSEACC
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartidx,
  PARTITION ACTIVACC
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartidx
  )
/

-- End of DDL Script for Index SMART.UK_IDX_RECOMMEND_01

