-- Start of DDL Script for Table SMART.ARCHOST
-- Generated 9-Jun-2006 12:20:09 from SMART@SB

CREATE TABLE out_archost
    (id_number                      NUMBER NOT NULL,
    acc_id                         NUMBER(10) NOT NULL,
    ostat                          NUMBER(15,2),
    pok_ostat                      NUMBER(15,2),
    datdate                        DATE NOT NULL,
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
    BUFFER_POOL DEFAULT
  )
  PARTITION BY RANGE (ID_NUMBER)
  (
  PARTITION ARCHIVALDAY VALUES LESS THAN (1)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255,
  PARTITION RESERVE VALUES LESS THAN (2)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255,
  PARTITION YESTERDAY VALUES LESS THAN (3)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255,
  PARTITION TODAY VALUES LESS THAN (4)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255,
  PARTITION UNKNOWNDAY VALUES LESS THAN (MAXVALUE)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  )
/


-- Indexes for ARCHOST

CREATE INDEX out_idx_archost_datdate ON out_archost
  (
    datdate                         ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     22609920
    NEXT        49152
    PCTINCREASE 0
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
/
CREATE INDEX out_idx_nu_account_id ON out_archost
  (
    acc_id                          ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     23183360
    NEXT        49152
    PCTINCREASE 0
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
/


-- Constraints for ARCHOST

ALTER TABLE out_archost
ADD CONSTRAINT out_pk_archost PRIMARY KEY (acc_id, datdate)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     22609920
    NEXT        49152
    PCTINCREASE 0
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
/

-- Triggers for ARCHOST

CREATE OR REPLACE TRIGGER out_upd_set_of_lastopday
BEFORE UPDATE OF 
  acc_id,
  datdate,
  obr_d,
  obr_k,
  ostat,
  pok_obr_d,
  pok_obr_k,
  pok_ostat
ON out_archost
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
DECLARE
BEGIN 
 :new.lastopdate:=out_SBOP.get_date;
    INSERT INTO 
      SB_$SESSION
     
        SELECT 
          * 
        FROM 
          SYS.V_$SESSION 
        WHERE 
          --USERNAME=USER 
          AUDSID = USERENV('SESSIONID')
          AND 
          (UPPER(PROGRAM)<>'SMARTBANK.EXE')
          AND
          (UPPER(PROGRAM)<>'CREDITSMGR.EXE')
          AND
          (UPPER(PROGRAM)<>'SALARY.EXE')  
          AND
          (UPPER(PROGRAM)<>'CARDPROG.EXE')
          AND
          (UPPER(PROGRAM)<>'ORACLE.EXE');          
          
END;
/

-- End of DDL Script for Table SMART.ARCHOST

-- Foreign Key
ALTER TABLE out_archost
ADD CONSTRAINT out_fk_archost_to_account FOREIGN KEY (acc_id)
REFERENCES out_account (id) ON DELETE CASCADE
ENABLE NOVALIDATE
/
-- End of DDL script for Foreign Key(s)
