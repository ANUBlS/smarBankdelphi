-- Start of DDL Script for Table SMART.QRP_KLIE
-- Generated 12-May-2006 14:36:53 from SMART@SB

CREATE TABLE out_qrp_klie
    (id                             NUMBER(10,0) NOT NULL,
    name                           VARCHAR2(90))
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




-- Constraints for QRP_KLIE

ALTER TABLE out_qrp_klie
ADD CONSTRAINT out_pk_qrp_klie PRIMARY KEY (id)
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


-- Triggers for QRP_KLIE

CREATE OR REPLACE TRIGGER out_sba_qrp_klie_delete
 BEFORE
  DELETE
 ON out_qrp_klie
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('RefEdit','delete');  --adm
 SB_ACA.CheckObjectAccess('Tuningtransactions','delete');  --adm
 SB_ACA.CheckObjectAccess('Tuningtransactions','update');  --adm
end;
/

CREATE OR REPLACE TRIGGER out_sba_qrp_klie_update
 BEFORE
  UPDATE
 ON out_qrp_klie
REFERENCING NEW AS NEW OLD AS OLD
begin
  SB_ACA.CheckObjectAccess('RefEdit','update');  --adm
end;
/

CREATE OR REPLACE TRIGGER out_sba_qrp_klie_insert
 BEFORE
  INSERT
 ON out_qrp_klie
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('RefEdit','insert');  --adm
 end qrp_klie_insert;
/

CREATE OR REPLACE TRIGGER out_inc_qrp_klie
 BEFORE
  INSERT
 ON out_qrp_klie
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare nw integer;
begin
 select tr_seg_QRP_KLIE.nextval into nw from dual;
 :new.id:=nw;
end out_QRP_KLIE;
/


-- End of DDL Script for Table SMART.QRP_KLIE

