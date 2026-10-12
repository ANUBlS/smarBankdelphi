-- Start of DDL Script for Table SMART.OUT_PROVARCH
-- Generated 10-May-2006 17:06:45 from SMART@SB

CREATE TABLE out_provarch
    (id                             NUMBER(10,0) NOT NULL,
    op_id                          NUMBER(10,0),
    no_prov                        VARCHAR2(8),
    dat                            DATE,
    debt                           NUMBER(10,0),
    kredit                         NUMBER(10,0),
    val_acc                        NUMBER(10,0) DEFAULT 0 ,
    vid_op                         NUMBER(5,0),
    ammount                        NUMBER(15,2),
    lammount                       NUMBER(15,2),
    tim                            DATE,
    shifr                          NUMBER(5,0),
    no_pack                        NUMBER(5,0),
    kassa_b                        NUMBER(5,0),
    kassa_z                        NUMBER(5,0),
    no_filial                      NUMBER(5,0),
    sloj_prov                      NUMBER(5,0),
    bank_d                         NUMBER,
    bank_k                         NUMBER,
    no_doc                         NUMBER(5,0),
    no_mem                         NUMBER(5,0),
    d1                             VARCHAR2(20),
    k1                             VARCHAR2(20),
    rate_d                         NUMBER(17,4),
    rate_c                         NUMBER(17,4),
    parentid                       NUMBER,
    currencyid_c                   NUMBER(4,0) DEFAULT 0 ,
    ammount_c                      NUMBER(15,2),
    name                           VARCHAR2(255),
    commit_opid                    NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    BUFFER_POOL DEFAULT
  )
  PARTITION BY RANGE (SHIFR)
  (
  PARTITION archivalday VALUES LESS THAN (1)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255,
  PARTITION reserve VALUES LESS THAN (2)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255,
  PARTITION yesterday VALUES LESS THAN (3)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255,
  PARTITION today VALUES LESS THAN (4)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255,
  PARTITION unknownday VALUES LESS THAN (MAXVALUE)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  )
/




-- Indexes for OUT_PROVARCH

CREATE INDEX out_idx_provarch_dat ON out_provarch
  (
    dat                             ASC
  )

  TABLESPACE  smartidx

  )
/

CREATE INDEX out_idx_provarch_debitid ON out_provarch
  (
    debt                            ASC
  )

  TABLESPACE  smartidx

  )
/



-- Constraints for OUT_PROVARCH

ALTER TABLE out_provarch
ADD CONSTRAINT out_chk_provarch CHECK (DEBT<>KREDIT)
/

ALTER TABLE out_provarch
ADD CONSTRAINT out_chk_provarch1 CHECK ((AMMOUNT<>0)OR(AMMOUNT_C<>0)OR(LAMMOUNT<>0))
/



ALTER TABLE out_provarch
ADD CONSTRAINT out_pk_provarch PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     614400
    NEXT        49152
    PCTINCREASE 0
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
/


-- Triggers for OUT_PROVARCH

CREATE OR REPLACE TRIGGER out_tr_provarch_opid
 BEFORE
  INSERT
 ON out_provarch
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
 :new.commit_opid := sblogin.UserID;
 if :new.OP_ID is null then
  :new.OP_ID := sblogin.UserID;
 end if;
end;
/
CREATE SEQUENCE out_tr_seg_provarch
  INCREMENT BY 1
  START WITH 1
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  NOCYCLE
  NOORDER
  NOCACHE
/



-- End of DDL Script for Table SMART.OUT_PROVARCH

-- Foreign Key
ALTER TABLE out_provarch
ADD CONSTRAINT out_fk_provarch_currencyid FOREIGN KEY (currencyid_c)
REFERENCES avalute_t (valute)
/
ALTER TABLE out_provarch
ADD CONSTRAINT out_fk_provarch_val_acc FOREIGN KEY (val_acc)
REFERENCES avalute_t (valute)
/
-- End of DDL script for Foreign Key(s)
ALTER TABLE OUT_PROVARCH  ENABLE ROW MOVEMENT 
/
