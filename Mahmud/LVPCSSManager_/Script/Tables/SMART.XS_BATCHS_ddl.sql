-- Start of DDL Script for Table SMART.XS_BATCHS
-- Generated 5-Feb-2007 19:43:59 from SMART@SBN

CREATE TABLE xs_batchs
    (id                             NUMBER NOT NULL,
    f_id                           NUMBER,
    opercode                       VARCHAR2(6),
    acc_id                         NUMBER,
    client_name                    VARCHAR2(70),
    client_code                    VARCHAR2(70),
    trans_ref                      VARCHAR2(16),
    amount                         NUMBER(22,2),
    val_acc                        NUMBER(4,0),
    transdate                      DATE,
    send                           NUMBER(1,0),
    status                         NUMBER(1,0),
    filial                         NUMBER(10,0),
    transaction_id                 NUMBER(10,0),
    client_inn                     VARCHAR2(30),
    userid                         NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     1007616
    NEXT        335872
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
PARALLEL (DEGREE DEFAULT)
/


-- Constraints for XS_BATCHS

ALTER TABLE xs_batchs
ADD CONSTRAINT pk_id PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     163840
    NEXT        98304
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Triggers for XS_BATCHS

CREATE OR REPLACE TRIGGER xs_batchs_id
 BEFORE
  INSERT
 ON xs_batchs
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare nw integer;
begin
 select XS_BATCHS_ID_GEN.nextval into nw from dual;
 :new.id:=nw;
end;
/
CREATE OR REPLACE TRIGGER xs_get_userid
 BEFORE
  INSERT
 ON xs_batchs
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
   :NEW.USERID:=SBLOGIN.USERID;
END;
/

-- End of DDL Script for Table SMART.XS_BATCHS

