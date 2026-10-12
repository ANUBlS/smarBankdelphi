-- Start of DDL Script for Table SMART.BAL_SPR2
-- Generated 21-May-2006 12:48:20 from SMART@SB

CREATE TABLE out_bal_spr2
    (bal_cn                         NUMBER(10,0) NOT NULL,
    typeid                         NUMBER,
    additionaltypeid               NUMBER,
    accgroup                       NUMBER(10,0),
    accclass                       NUMBER(10,0),
    saldo                          NUMBER DEFAULT 0
,
    part                           NUMBER(5,0),
    balname                        VARCHAR2(181),
    closebalance                   NUMBER DEFAULT 0

 ,
    ratedifference                 NUMBER DEFAULT 0

,
    currencyposition               NUMBER DEFAULT 0 ,
    cashincomig                    NUMBER(*,0))
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


-- Constraints for BAL_SPR2

ALTER TABLE out_bal_spr2
ADD CONSTRAINT out_pk_bal_spr2 PRIMARY KEY (bal_cn)
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

-- Triggers for BAL_SPR2

CREATE OR REPLACE TRIGGER out_sba_bal_spr2_delete
 BEFORE
  DELETE
 ON out_bal_spr2
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('BALANCEREFEDIT','delete');  --adm
end;
/
CREATE OR REPLACE TRIGGER out_sba_bal_spr2_insert
 BEFORE
  INSERT
 ON out_bal_spr2
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('BALANCEREFEDIT','insert');  --adm
end;
/
CREATE OR REPLACE TRIGGER out_sba_bal_spr2_update
 BEFORE
  UPDATE
 ON out_bal_spr2
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('BALANCEREFEDIT','update');  --adm
end;
/

-- Comments for BAL_SPR2

COMMENT ON COLUMN out_bal_spr2.closebalance IS '0- Uchastvuet,  1... NeUchastvuet'
/
COMMENT ON COLUMN out_bal_spr2.currencyposition IS '0- Uchastvuet,  1... NeUchastvuet'
/
COMMENT ON COLUMN out_bal_spr2.typeid IS '1-Active, 2-Passive, 3-Active-Passive'
/

-- End of DDL Script for Table SMART.BAL_SPR2

