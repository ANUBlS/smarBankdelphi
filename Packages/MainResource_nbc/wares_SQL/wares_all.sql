-- Start of DDL Script for Table SMART.WARES_ALL
-- Generated 7-Dec-2006 10:08:04 from SMART@SB

CREATE TABLE smart.wares_all
    (wares_name                     VARCHAR2(90),
    wares_id                       NUMBER NOT NULL,
    inventar_date                  DATE,
    groups_id                      NUMBER,
    first_price                    NUMBER(18,2),
    remainder                      NUMBER(18,2),
    amort                          NUMBER(18,2),
    all_amort                      NUMBER(18,2),
    percent                        NUMBER,
    tax_first_price                NUMBER(18,2),
    tax_remainder                  NUMBER(18,2),
    tax_amort                      NUMBER(18,2),
    tax_all_amort                  NUMBER(18,2),
    tax_percent                    NUMBER,
    close_format                   NUMBER,
    amort_date                     DATE,
    fxm                            NUMBER,
    keeping_sec                    VARCHAR2(50),
    user_id                        NUMBER,
    tax_close_format               NUMBER,
    inventar_no                    VARCHAR2(30),
    user_name                      VARCHAR2(40))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     40960
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
/




-- Constraints for SMART.WARES_ALL


ALTER TABLE smart.wares_all
ADD CONSTRAINT pk_wares_all PRIMARY KEY (wares_id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     65536
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
/


-- Triggers for SMART.WARES_ALL

CREATE OR REPLACE TRIGGER smart.tr_wares_all_id_and_uid
 BEFORE
  INSERT
 ON smart.wares_all
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
select SEQ_WARES_ALL_ID.NEXTVAL into :new.wares_id from dual;
select uid into :new.user_id from dual;
end;
/


-- End of DDL Script for Table SMART.WARES_ALL

-- Foreign Key
ALTER TABLE smart.wares_all
ADD CONSTRAINT fk_wares_all FOREIGN KEY (groups_id)
REFERENCES SMART.groups (id)
/
-- End of DDL script for Foreign Key(s)
