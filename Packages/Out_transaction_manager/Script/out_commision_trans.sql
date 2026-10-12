-- Start of DDL Script for Table SMART.COMMISION_TRANS
-- Generated 12-May-2006 14:28:35 from SMART@SB

CREATE TABLE out_commision_trans
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(150),
    debt                           NUMBER,
    credit                         NUMBER,
    additionaldebt                 NUMBER,
    additionalcredit               NUMBER,
    assignment                     VARCHAR2(300),
    commisionassignment            VARCHAR2(300),
    userid                         NUMBER)
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




-- Constraints for COMMISION_TRANS

ALTER TABLE out_commision_trans
ADD CONSTRAINT out_pk_commision_trans_id PRIMARY KEY (id)
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


-- Triggers for COMMISION_TRANS

CREATE OR REPLACE TRIGGER out_trg_commision_trans
 BEFORE
  INSERT
 ON out_commision_trans
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare 
 newID number;
begin
 if ((:new.additionalDebt <> 0) and (:new.additionalCredit <> 0)) then
   raise_application_error(-20097,'Комиссийа щесабындан йалныз 1-и дахил едилмялидир!');
 end if; 
 Select Seq_commision_trans.NEXTVAL into newID from dual;
 :new.ID :=newID;
end;
/

CREATE OR REPLACE TRIGGER out_upd_commision_trans
 BEFORE
  UPDATE
 ON out_commision_trans
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
 if ((:new.additionalDebt <> 0) and (:new.additionalCredit <> 0)) then
   raise_application_error(-20097,'Комиссийа щесабындан йалныз 1-и дахил едилмялидир!'); 
 end if;
end;
/


-- End of DDL Script for Table SMART.COMMISION_TRANS

