-- Start of DDL Script for Table SMART.OUT_LAZYTRANSACTION
-- Generated 10-May-2006 17:09:11 from SMART@SB

CREATE TABLE out_lazytransaction
    (id                             NUMBER(10,0) NOT NULL,
    op_id                          NUMBER(10,0),
    no_prov                        VARCHAR2(8),
    dat                            DATE,
    debt                           NUMBER(10,0),
    kredit                         NUMBER(10,0),
    val_acc                        NUMBER(10,0) DEFAULT 0,
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
    parentid                       NUMBER(15,0),
    currencyid_c                   NUMBER(4,0) DEFAULT 0,
    ammount_c                      NUMBER(15,2),
    name                           VARCHAR2(255),
    temptrid                       NUMBER,
    rejectreason                   VARCHAR2(255),
    rejected                       NUMBER DEFAULT 0

 )
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     2457600
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/




-- Constraints for OUT_LAZYTRANSACTION



ALTER TABLE out_lazytransaction
ADD CONSTRAINT out_notnull_lazytransaction CHECK (ID IS NOT NULL)
/

ALTER TABLE out_lazytransaction
ADD CONSTRAINT out_pk_lazytransaction PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     368640
    NEXT        10240
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
/


-- Triggers for OUT_LAZYTRANSACTION

CREATE OR REPLACE TRIGGER out_bi_lazytransaction_op_id
 BEFORE
  INSERT
 ON out_lazytransaction
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
	:new.OP_ID := sblogin.UserID;
end;
/


-- End of DDL Script for Table SMART.OUT_LAZYTRANSACTION

-- Foreign Key
ALTER TABLE out_lazytransaction
ADD CONSTRAINT out_fk_lazytransaction_acc_deb FOREIGN KEY (debt)
REFERENCES out_account (id) ON DELETE CASCADE
/
ALTER TABLE out_lazytransaction
ADD CONSTRAINT out_fk_lazytransac_acc_cred FOREIGN KEY (kredit)
REFERENCES out_account (id) ON DELETE CASCADE
/
-- End of DDL script for Foreign Key(s)
