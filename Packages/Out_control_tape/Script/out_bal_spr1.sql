-- Start of DDL Script for Table SMART.OUT_BAL_SPR1
-- Generated 21-May-2006 14:16:32 from SMART@SB

CREATE TABLE out_bal_spr1
    (bal_cn                         NUMBER(10,0) NOT NULL,
    typeid                         NUMBER,
    additionaltypeid               NUMBER,
    accgroup                       NUMBER(10,0),
    accclass                       NUMBER(10,0),
    saldo                          NUMBER,
    part                           NUMBER(5,0),
    balname                        VARCHAR2(181),
    closebalance                   NUMBER,
    ratedifference                 NUMBER,
    currencyposition               NUMBER,
    cashincoming                   NUMBER(*,0))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     10240
    NEXT        286720
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
/


-- Constraints for OUT_BAL_SPR1

ALTER TABLE out_bal_spr1
ADD CONSTRAINT out_pk_bal_spr1 PRIMARY KEY (bal_cn)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     81920
    NEXT        10240
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
/

-- Triggers for OUT_BAL_SPR1

CREATE OR REPLACE TRIGGER out_sba_bal_spr1_delete
 BEFORE
  DELETE
 ON out_bal_spr1
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('BALANCEREFEDIT','delete');  --adm
end;
/
CREATE OR REPLACE TRIGGER out_sba_bal_spr1_insert
 BEFORE
  INSERT
 ON out_bal_spr1
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('BALANCEREFEDIT','insert');  --adm
end;
/
CREATE OR REPLACE TRIGGER out_sba_bal_spr1_update
 BEFORE
  UPDATE
 ON out_bal_spr1
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('BALANCEREFEDIT','update');  --adm
end;
/

-- End of DDL Script for Table SMART.OUT_BAL_SPR1

