-- Start of DDL Script for Table SMART.COUNTRIES
-- Generated 13-Nov-2006 23:53:33 from SMART@SB

CREATE TABLE countries
    (id                             NUMBER NOT NULL,
    cntr_name                      VARCHAR2(30))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     65536
    NEXT        10240
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
/


-- Constraints for COUNTRIES

ALTER TABLE countries
ADD CONSTRAINT cc_pk_country PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     16384
    NEXT        10240
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
/

-- Triggers for COUNTRIES

CREATE OR REPLACE TRIGGER cc_ins_countries
BEFORE INSERT 
ON countries
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
 select cc_countriesid.nextval into :new.ID from dual;
end;
/

-- End of DDL Script for Table SMART.COUNTRIES


