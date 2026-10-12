-- Start of DDL Script for Table SMART.CASH_SETTINGS
-- Generated 14-Jul-2006 0:56:08 from SMART@sb

-- Drop the old instance of CASH_SETTINGS
DROP TABLE cash_settings
/

CREATE TABLE cash_settings
    (cashbalancenational            NUMBER,
    cashbalanceenglish             NUMBER,
    description_az                 VARCHAR2(150),
    description_eng                VARCHAR2(150),
    signatyre                      VARCHAR2(150),
    responsible_person             VARCHAR2(150),
    handover                       VARCHAR2(10),
    chief                          VARCHAR2(10),
    operator                       VARCHAR2(10),
    cashier                        VARCHAR2(10),
    amount                         VARCHAR2(10),
    chief_out                      VARCHAR2(10),
    operator_out                   VARCHAR2(10),
    cashier_out                    VARCHAR2(10),
    accountant                     VARCHAR2(10))
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


-- Comments for CASH_SETTINGS

COMMENT ON TABLE cash_settings IS 'Cash Reports Settings'
/

-- End of DDL Script for Table SMART.CASH_SETTINGS


