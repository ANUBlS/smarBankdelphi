-- Start of DDL Script for Table SMART.XS_BENEFICIARY_SHABLON
-- Generated 20-May-2006 17:25:24 from SMART@SB

CREATE TABLE xs_beneficiary_shablon
    (mebleg                         VARCHAR2(25),
    odenish_kod                    VARCHAR2(25),
    bankin_kodu                    VARCHAR2(50),
    hesab_no                       VARCHAR2(25),
    adi                            VARCHAR2(25),
    kodu                           VARCHAR2(25),
    voen                           VARCHAR2(25),
    od_tey1                        VARCHAR2(50),
    od_tey2                        VARCHAR2(50),
    od_tey3                        VARCHAR2(50),
    od_tey4                        VARCHAR2(50),
    elave_mel1                     VARCHAR2(50),
    elave_mel2                     VARCHAR2(50),
    elave_mel3                     VARCHAR2(50),
    shablonun_adi                  VARCHAR2(25),
    bankin_adi                     VARCHAR2(25),
    odenish                        VARCHAR2(100))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- End of DDL Script for Table SMART.XS_BENEFICIARY_SHABLON

