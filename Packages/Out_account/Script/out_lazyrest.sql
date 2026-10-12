-- Start of DDL Script for Table SMART.LAZYREST
-- Generated 9-Jun-2006 11:42:49 from SMART@SB

CREATE TABLE out_lazyrest
    (id_number                      NUMBER NOT NULL,
    acc_id                         NUMBER(10,0),
    ostat                          NUMBER(15,2),
    pok_ostat                      NUMBER(15,2),
    datdate                        DATE,
    obr_d                          NUMBER(15,2),
    obr_k                          NUMBER(15,2),
    pok_obr_d                      NUMBER(15,2),
    pok_obr_k                      NUMBER(15,2),
    lastopdate                     DATE)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     1720320
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Constraints for LAZYREST

ALTER TABLE out_lazyrest
ADD CONSTRAINT out_notnull_lazyrest CHECK (ID_NUMBER IS NOT NULL)
/
ALTER TABLE out_lazyrest
ADD CONSTRAINT out_pk_lazyrest PRIMARY KEY (id_number)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     163840
    NEXT        49152
    PCTINCREASE 0
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
/
ALTER TABLE out_lazyrest
ADD CONSTRAINT out_uk_lazyrest_acc_id_datdate UNIQUE (acc_id, datdate)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     163840
    NEXT        49152
    PCTINCREASE 0
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
/

-- Triggers for LAZYREST

CREATE OR REPLACE TRIGGER out_inc_lazyrest
 BEFORE
  INSERT
 ON out_lazyrest
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare nw integer;
begin
 select tr_seg_LazyRest.nextval into nw from dual;
 :new.id_Number:=nw;
end out_Inc_Inc_LazyRest;
/

-- End of DDL Script for Table SMART.LAZYREST
-- Foreign Key
ALTER TABLE out_lazyrest
ADD CONSTRAINT out_fk_lazyrest_account FOREIGN KEY (acc_id)
REFERENCES out_account (id) ON DELETE CASCADE
/
-- End of DDL script for Foreign Key(s)
