-- Start of DDL Script for Sequence SMART.WU_INCOMING_ID_GEN
-- Generated 18-May-2004 14:44:49 from SMART@ata
drop sequence wu_account_id_gen
/
drop sequence wu_incoming_id_gen
/
CREATE SEQUENCE wu_incoming_id_gen
  INCREMENT BY 1
  START WITH 1
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  NOCYCLE
  NOORDER
  CACHE 20
/

-- End of DDL Script for Sequence SMART.WU_INCOMING_ID_GEN

-- Start of DDL Script for Sequence SMART.WU_ACCOUNT_ID_GEN
-- Generated 18-May-2004 14:44:49 from SMART@ata

CREATE SEQUENCE wu_account_id_gen
  INCREMENT BY 1
  START WITH 1
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  NOCYCLE
  NOORDER
  CACHE 20
/

-- End of DDL Script for Sequence SMART.WU_ACCOUNT_ID_GEN


