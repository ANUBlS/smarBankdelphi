-- Start of DDL Script for Table SMART.REPORT_UNICODE
-- Generated 8-Jul-2006 22:32:49 from SMART@SB

CREATE TABLE report_unicode
    (az                             VARCHAR2(500),
    az_font                        VARCHAR2(100),
    q_az                           VARCHAR2(500),
    q_az_font                      VARCHAR2(100),
    az_font_size                   NUMBER,
    q_az_font_size                 NUMBER,
    id                             NUMBER,
    component                      VARCHAR2(500),
    component_type                 VARCHAR2(500),
    component_type_c               VARCHAR2(500))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
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


-- End of DDL Script for Table SMART.REPORT_UNICODE

