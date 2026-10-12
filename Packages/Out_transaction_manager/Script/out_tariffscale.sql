-- Start of DDL Script for Table SMART.TARIFFSCALE
-- Generated 12-May-2006 14:34:32 from SMART@SB

CREATE TABLE out_tariffscale
    (id                             NUMBER NOT NULL,
    groupid                        NUMBER NOT NULL,
    percent                        NUMBER,
    ammount                        NUMBER(20,2),
    minvalue                       NUMBER(20,2),
    maxvalue                       NUMBER(20,2),
    commisionid                    NUMBER NOT NULL)
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
PARALLEL (DEGREE DEFAULT)
/




-- Constraints for TARIFFSCALE

ALTER TABLE out_tariffscale
ADD CONSTRAINT out_ck_tarif_non_equal_value CHECK (MinValue < MaxValue)
/



ALTER TABLE out_tariffscale
ADD CONSTRAINT out_pk_tariffscale PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     81920
    NEXT        49152
    PCTINCREASE 0
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
/

ALTER TABLE out_tariffscale
ADD CONSTRAINT out_uk_tariffscale_maxvalue UNIQUE (groupid, maxvalue, commisionid)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     81920
    NEXT        49152
    PCTINCREASE 0
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
/

ALTER TABLE out_tariffscale
ADD CONSTRAINT out_uk_tariffscale_minvalue UNIQUE (groupid, minvalue, commisionid)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     81920
    NEXT        49152
    PCTINCREASE 0
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
/


-- Triggers for TARIFFSCALE

CREATE OR REPLACE TRIGGER out_sba_tariffscale_insert
 BEFORE
  INSERT
 ON out_tariffscale
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('TUNINGTRANSACTIONS','insert');  --adm
end;
/

CREATE OR REPLACE TRIGGER out_upd_tariffscale
 BEFORE
  UPDATE
 ON out_tariffscale
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
 if (not(:new.percent is Null) and not(:new.ammount is Null)) then
  raise_application_error(-20097,'Комиссийа щесабындан йалныз 1-и дахил едилмялидир!'); 
 end if;
end;
/

CREATE OR REPLACE TRIGGER out_trg_tariffscale
 BEFORE
  INSERT
 ON out_tariffscale
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare newID number;
begin
 if (not(:new.percent is Null) and not(:new.ammount is Null)) then
  raise_application_error(-20097,'Комиссийа щесабындан йалныз 1-и дахил едилмялидир!'); 
 end if; 
 select Seq_tariffscale.NEXTVAL into newID from dual;
 :new.ID :=newID;
end;
/

CREATE OR REPLACE TRIGGER out_sba_tarifscale_update
 BEFORE
  UPDATE
 ON out_tariffscale
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('TUNINGTRANSACTIONS','update');  --adm
end;
/

CREATE OR REPLACE TRIGGER out_sba_tarifscale_delete
 BEFORE
  DELETE
 ON out_tariffscale
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('TUNINGTRANSACTIONS','delete');  --adm
end;
/


-- Comments for TARIFFSCALE

COMMENT ON COLUMN out_tariffscale.commisionid IS 'Directs to Commision_trans'
/
COMMENT ON COLUMN out_tariffscale.groupid IS 'ID on QRP_KLIE'
/

-- End of DDL Script for Table SMART.TARIFFSCALE

-- Foreign Key
ALTER TABLE out_tariffscale
ADD CONSTRAINT out_fk_tarif_on_commision FOREIGN KEY (commisionid)
REFERENCES out_commision_trans (id) ON DELETE CASCADE
/
ALTER TABLE out_tariffscale
ADD CONSTRAINT out_fk_tariffscale_on_qrp_klie FOREIGN KEY (groupid)
REFERENCES out_qrp_klie (id)
/
-- End of DDL script for Foreign Key(s)
