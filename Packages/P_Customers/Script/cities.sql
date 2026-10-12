-- Start of DDL Script for Table SMART.CITIES
-- Generated 13-Nov-2006 23:53:52 from SMART@SB

CREATE TABLE cities
    (id                             NUMBER NOT NULL,
    country_id                     NUMBER NOT NULL,
    city_name                      VARCHAR2(80))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     16384
    NEXT        10240
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
PARALLEL (DEGREE DEFAULT)
/


-- Constraints for CITIES

ALTER TABLE cities
ADD CONSTRAINT cc_pk_cities PRIMARY KEY (id)
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

-- Triggers for CITIES

CREATE OR REPLACE TRIGGER cc_ins_cities
BEFORE INSERT 
ON cities
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
 select cc_citiesid.nextval into :new.ID from dual;

end;
/

-- End of DDL Script for Table SMART.CITIES

-- Foreign Key
ALTER TABLE cities
ADD CONSTRAINT cc_pkk_cities FOREIGN KEY (country_id)
REFERENCES countries (id) ON DELETE CASCADE
/
-- End of DDL script for Foreign Key(s)
