-- Start of DDL Script for Table SMART.AGRO_KREDIT_PURPOSE
-- Generated 8-Nov-2004 11:43:43 from SMART@SB

CREATE TABLE agro_kredit_purpose
    (id                             NUMBER,
     name                           VARCHAR2(128),
     depend_id                      number )
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


-- End of DDL Script for Table SMART.AGRO_KREDIT_PURPOSE

-- Start of DDL Script for Table SMART.AGRO_KREDIT_TARGET
-- Generated 8-Nov-2004 11:43:43 from SMART@SB

CREATE TABLE agro_kredit_target
    (id                             NUMBER NOT NULL,
    name                            VARCHAR2(128),
    name_eng                        VARCHAR2(128))
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


-- Constraints for AGRO_KREDIT_TARGET

ALTER TABLE agro_kredit_target
ADD CONSTRAINT pk_agro_kredit_target PRIMARY KEY (id)
USING INDEX
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

-- Triggers for AGRO_KREDIT_TARGET

CREATE OR REPLACE TRIGGER bi_inc_agro_kredit_terget
 BEFORE
  INSERT
 ON agro_kredit_target
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
dbms_put.line('aaaaaaaaaaaaaa');
---  select seg_AGRO_KREDIT_TARGET.nextval into :new.ID from dual;
end;
/

-- End of DDL Script for Table SMART.AGRO_KREDIT_TARGET

-- Start of DDL Script for Table SMART.AGRO_REGION
-- Generated 8-Nov-2004 11:43:43 from SMART@SB

CREATE TABLE agro_region
    (id                             NUMBER NOT NULL,
    name                            VARCHAR2(128),
    name_eng                        VARCHAR2(128))
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


-- Constraints for AGRO_REGION

ALTER TABLE agro_region
ADD CONSTRAINT pk_agro_region PRIMARY KEY (id)
USING INDEX
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

-- End of DDL Script for Table SMART.AGRO_REGION

-- Start of DDL Script for Table SMART.AGRO_VILLAGE
-- Generated 8-Nov-2004 11:43:44 from SMART@SB

CREATE TABLE agro_village
    (id                             NUMBER,
    name                           VARCHAR2(128),
    depend_id                      NUMBER)
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


-- End of DDL Script for Table SMART.AGRO_VILLAGE
-- Foreign Key
ALTER TABLE agro_kredit_purpose
ADD CONSTRAINT fk_agro_kredit_purpose FOREIGN KEY (depend_id)
REFERENCES agro_kredit_target (id)
/
-- Foreign Key
ALTER TABLE agro_village
ADD CONSTRAINT fk_agro_region FOREIGN KEY (depend_id)
REFERENCES agro_region (id) ON DELETE CASCADE
DISABLE
/
-- End of DDL script for Foreign Key(s)

CREATE SEQUENCE seg_AGRO_KREDIT_TARGET
  INCREMENT BY 1
  START WITH 32
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  NOCYCLE
  NOORDER
  NOCACHE
/
