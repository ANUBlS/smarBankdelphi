-- Start of DDL Script for Table SMART.ARCHOST
-- Generated 13-May-2004 18:01:02 from SMART@SBLAST

RENAME  ARCHOST TO ARCHOST_X ; 

--- Drop the old instance of ARCHOST
DROP TABLE archost
/

CREATE TABLE archost
    (id_number                      NUMBER,
    acc_id                         NUMBER(10,0) NOT NULL,
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

-- Grants for Table
GRANT SELECT ON archost TO sbr_accounts
/
GRANT SELECT ON archost TO sbr_creditmanager
/
GRANT SELECT ON archost TO sbr_expertanalys
/
GRANT SELECT ON archost TO sbr_order
/
GRANT SELECT ON archost TO sbr_swift
/
GRANT SELECT ON archost TO sbr_todaybalance
/
GRANT SELECT ON archost TO sbr_turnoversforperiod
/

-- Indexes for ARCHOST

CREATE INDEX idx_archost_accid ON archost
  (
    acc_id                          ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartidx
  STORAGE   (
    INITIAL     26296320
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
/
CREATE INDEX idx_archost_datdate ON archost
  (
    datdate                         ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartidx
  STORAGE   (
    INITIAL     39403520
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
/


-- Constraints for ARCHOST

ALTER TABLE archost
ADD CONSTRAINT pk_archost PRIMARY KEY (acc_id, datdate)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartidx
  STORAGE   (
    INITIAL     39403520
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
/

-- Triggers for ARCHOST

CREATE OR REPLACE TRIGGER upd_set_of_lastopday
 BEFORE
   UPDATE OFacc_id, datdate, obr_d, obr_k, ostat, pok_obr_d, pok_obr_k, pok_ostat
 ON archost
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN 
 :new.lastopdate:=SBOP.get_date;
END;
/

-- End of DDL Script for Table SMART.ARCHOST
-- Foreign Key
ALTER TABLE archost
ADD CONSTRAINT fk_archost_account FOREIGN KEY (acc_id)
REFERENCES account (id) ON DELETE CASCADE
/
-- End of DDL script for Foreign Key(s)
