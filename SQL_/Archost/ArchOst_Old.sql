CREATE TABLE SMART.ARCHOST ( 
  ID_NUMBER   NUMBER CONSTRAINT NOTNULL_ARCHOST   NOT NULL, 
  ACC_ID      NUMBER (10), 
  OSTAT       NUMBER (15,2), 
  POK_OSTAT   NUMBER (15,2), 
  DATDATE     DATE, 
  OBR_D       NUMBER (15,2), 
  OBR_K       NUMBER (15,2), 
  POK_OBR_D   NUMBER (15,2), 
  POK_OBR_K   NUMBER (15,2), 
  LASTOPDATE  DATE)
 ; 


ALTER TABLE archost add CONSTRAINT UK_ARCHOST_ACC_ID_DATDATE UNIQUE (ACC_ID, DATDATE)

ALTER TABLE archost ADD CONSTRAINT pk_archost PRIMARY KEY (id_number);

ALTER TABLE archost ADD CONSTRAINT fk_archost_account FOREIGN KEY (acc_id)
  REFERENCES account (id) ON DELETE CASCADE;

ALTER TABLE archost ADD CONSTRAINT notnull_archost CHECK (id_Number IS NOT NULL);

ALTER TABLE archost ADD CONSTRAINT uk_archost_acc_id_datdate UNIQUE (acc_id, datdate);

CREATE INDEX idx_archost_accid ON archost (acc_id ASC);

CREATE INDEX idx_archost_datdate ON archost (datdate ASC);



--Drop trigger upd_set_of_lastopday;

CREATE OR REPLACE TRIGGER upd_set_of_lastopday
 BEFORE UPDATE OF ostat ON archost
  REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
BEGIN 
 :new.lastopdate:=SBOP.get_date;
END;
/
--Drop trigger INC_ARCHOST;
CREATE OR REPLACE TRIGGER INC_ARCHOST
 BEFORE 
 INSERT
 ON ARCHOST
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW 
declare nw integer;
begin
 select tr_seg_archost.nextval into nw from dual;
 :new.id_Number:=nw;
end Inc_Inc_archost;
/

