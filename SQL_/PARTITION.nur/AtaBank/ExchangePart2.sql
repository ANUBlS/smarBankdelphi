--------------------------------------ARCHOST->>------------------------------------
CREATE TABLE ARCHOST_x ( 
  ID_NUMBER   NUMBER not null , 
  ACC_ID      NUMBER (10), 
  OSTAT       NUMBER (15,2), 
  POK_OSTAT   NUMBER (15,2), 
  DATDATE     DATE, 
  OBR_D       NUMBER (15,2), 
  OBR_K       NUMBER (15,2), 
  POK_OBR_D   NUMBER (15,2), 
  POK_OBR_K   NUMBER (15,2), 
  LASTOPDATE  DATE )
PARTITION BY RANGE (ID_NUMBER)
  (
 PARTITION ARCHIVALDAY VALUES LESS THAN (1)
,PARTITION RESERVE VALUES LESS THAN (2)
,PARTITION YESTERDAY VALUES LESS THAN (3)
,PARTITION CURRENTDAY VALUES LESS THAN (4)
,PARTITION UNKNOWNDAY VALUES LESS THAN (MAXVALUE)
); 

ALTER TABLE archost_x  ENABLE ROW MOVEMENT;


ALTER TABLE archost_x
 EXCHANGE PARTITION archivalDay WITH TABLE archost
  WITHOUT VALIDATION;

Drop table archost;

RENAME  ARCHOST_X TO ARCHOST;

ALTER TABLE archost
ADD CONSTRAINT pk_archost PRIMARY KEY (acc_id, datdate)
USING INDEX TABLESPACE smartidx;

CREATE INDEX idx_archost_datdate ON archost (datdate ASC)
 PARALLEL TABLESPACE smartidx;
  
CREATE INDEX idx_nu_account_id ON archost (acc_id ASC) PARALLEL TABLESPACE smartidx;



CREATE OR REPLACE TRIGGER upd_set_of_lastopday
BEFORE UPDATE OF 
  acc_id,
  datdate,
  obr_d,
  obr_k,
  ostat,
  pok_obr_d,
  pok_obr_k,
  pok_ostat
ON archost
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN 
 :new.lastopdate:=SBOP.get_date;
END;-------------------------------------<<-ARCHOST-------------------------------------

---------------------------------------ACCOUNT-->>-----------------------------------
CREATE TABLE account_x
    (id                             NUMBER(10) NOT NULL,
    kli_id                         NUMBER(10) NOT NULL,
    op_id                          NUMBER(10),
    acc_no                         VARCHAR2(20) NOT NULL,
    val_acc                        NUMBER(3) NOT NULL,
    name                           VARCHAR2(90),
    open_dat                       DATE NOT NULL,
    close_dat                      DATE,
    bal_cn1                        NUMBER(10) NOT NULL,
    bal_cn2                        NUMBER(10),
    bal_cn3                        NUMBER(10),
    bal_cn4                        NUMBER(10),
    filial                         NUMBER(5),
    sim_otcet                      NUMBER(10),
    tipacc                         VARCHAR2(20),
    limit                          NUMBER DEFAULT 0,
    old_acc_no                     VARCHAR2(20),
    pair_acc                       NUMBER(10),
    insider                        VARCHAR2(1),
    sid#                           NUMBER)
  PARTITION BY RANGE (CLOSE_DAT)
  (
  PARTITION CLOSEACC VALUES LESS THAN (TO_DATE(' 2100-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')),
  PARTITION ACTIVACC VALUES LESS THAN (MAXVALUE)
  );


ALTER TABLE account_x  ENABLE ROW MOVEMENT;

ALTER TABLE smart.account DISABLE CONSTRAINT fk_acc_avalute;
ALTER TABLE smart.account DISABLE CONSTRAINT FK_ACC_CUSTOMERS;
ALTER TABLE smart.account DISABLE CONSTRAINT FK_ACCOUNT_BAL_SPR1;
ALTER TABLE smart.account DISABLE CONSTRAINT FK_ACCOUNT_FILIAL;
ALTER TABLE smart.account DISABLE CONSTRAINT FK_ACCOUNT_SID#;

ALTER TABLE acc_flag_link
DROP CONSTRAINT fk_acc_flag_link_acc
/
ALTER TABLE excaccount
DROP CONSTRAINT fk_excaccunt
/
ALTER TABLE lazyrest
DROP CONSTRAINT fk_lazyrest_account
/
ALTER TABLE lazytransaction
DROP CONSTRAINT fk_lazytransaction_acc_cred
/
ALTER TABLE lazytransaction
DROP CONSTRAINT fk_lazytransaction_acc_deb
/
ALTER TABLE provarch
DROP CONSTRAINT fk_provarch_acc_deb
/
ALTER TABLE provarch
DROP CONSTRAINT fk_provarch_acc_cred
/


ALTER TABLE account_x
 EXCHANGE PARTITION ACTIVACC WITH TABLE account
  WITHOUT VALIDATION;


drop table account;

RENAME  account_x TO account;

CREATE INDEX idx_account_acc_no ON account (acc_no ASC) PARALLEL TABLESPACE smartidx;


CREATE INDEX idx_account_bal_cn1 ON account
  (bal_cn1  ASC) PARALLEL TABLESPACE smartidx;
  

CREATE INDEX idx_account_bal_cn2 ON account
  (bal_cn2 ASC) PARALLEL TABLESPACE smartidx;
  
  
CREATE INDEX idx_account_bal_cn3 ON account 
 (bal_cn3 ASC) PARALLEL TABLESPACE smartidx;
  
CREATE INDEX idx_account_bal_cn4 ON account
  (bal_cn4 ASC) PARALLEL TABLESPACE smartidx;

ALTER TABLE account
 ADD CONSTRAINT pk_account PRIMARY KEY (id)
 USING INDEX TABLESPACE smartidx;


ALTER TABLE account
 ADD CONSTRAINT uk_acc_no_val_acc UNIQUE (acc_no, val_acc)
 USING INDEX TABLESPACE smartidx;

CREATE OR REPLACE TRIGGER "SMART".AFTER_INC_ACCOUNT
 AFTER 
 INSERT
 ON ACCOUNT
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  cursor dats is (select distinct dat from operkurs where dat>=:new.open_dat);
  I INTEGER;
  nw INTEGER;
  part integer;
  CurrentDate DATE;
 	PrevDate DATE;
 	
BEGIN
  SELECT tr_seg_account.CURRVAL INTO nw FROM dual;
  SELECT Tek_dat, Pred_Dat INTO CurrentDate, PrevDate FROM sysdat;

if :new.open_dat < CurrentDate then

  For c_Dat in dats loop   
   if c_Dat.dat=CurrentDate Then 
    Part:=3; 
   Elsif c_Dat.dat=PrevDate Then 
    Part:=2; 
   else 
    Part:=0;
   End If;
   sbop.add_archost(part, nw, c_Dat.dat);

End loop;

else
  sbop.add_archost(3,nw, CurrentDate);
  sbop.add_archost(2,nw, PrevDate);
end if;

END After_Inc_Account;
/
CREATE OR REPLACE TRIGGER "SMART".befor_inc_account
BEFORE INSERT 
ON account
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
   SELECT tr_seg_account.NEXTVAL
     INTO :NEW.id
     FROM dual;
	:new.OP_ID := sblogin.UserID;
END befor_inc_account;
/


ALTER TABLE account
ADD CONSTRAINT fk_account_bal_spr1 FOREIGN KEY (bal_cn1)
REFERENCES bal_spr1 (bal_cn) ON DELETE SET NULL;

ALTER TABLE account
ADD CONSTRAINT fk_account_filial FOREIGN KEY (filial)
REFERENCES filial (id) ON DELETE SET NULL;

ALTER TABLE account
ADD CONSTRAINT fk_acc_avalute FOREIGN KEY (val_acc)
REFERENCES avalute (valute) ON DELETE SET NULL;

ALTER TABLE account
ADD CONSTRAINT fk_acc_customers FOREIGN KEY (kli_id)
REFERENCES customers (id) ON DELETE CASCADE;



ALTER TABLE acc_flag_link
ADD CONSTRAINT fk_acc_flag_link_acc FOREIGN KEY (acc_id)
REFERENCES account (id) ON DELETE CASCADE
/
ALTER TABLE excaccount
ADD CONSTRAINT fk_excaccunt FOREIGN KEY (accountid)
REFERENCES account (id) ON DELETE SET NULL
/
ALTER TABLE lazyrest
ADD CONSTRAINT fk_lazyrest_account FOREIGN KEY (acc_id)
REFERENCES account (id) ON DELETE CASCADE
/

ALTER TABLE lazytransaction
ADD CONSTRAINT fk_lazytransaction_acc_cred FOREIGN KEY (kredit)
REFERENCES account (id) ON DELETE CASCADE
/
ALTER TABLE lazytransaction
ADD CONSTRAINT fk_lazytransaction_acc_deb FOREIGN KEY (debt)
REFERENCES account (id) ON DELETE CASCADE
/
ALTER TABLE provarch
ADD CONSTRAINT fk_provarch_acc_cred FOREIGN KEY (kredit)
REFERENCES account (id) ON DELETE CASCADE
/
ALTER TABLE provarch
ADD CONSTRAINT fk_provarch_acc_deb FOREIGN KEY (debt)
REFERENCES account (id) ON DELETE CASCADE
/


--------------------------------------<<-ACCOUNT-------------------------------------

---------------------------------------PROVARCH->>------------------------------------

CREATE TABLE provarch_x
    (id                             NUMBER(10) NOT NULL,
    op_id                          NUMBER(10),
    no_prov                        VARCHAR2(8),
    dat                            DATE,
    debt                           NUMBER(10),
    kredit                         NUMBER(10),
    val_acc                        NUMBER(10) DEFAULT 0,
    vid_op                         NUMBER(5),
    ammount                        NUMBER(15,2),
    lammount                       NUMBER(15,2),
    tim                            DATE,
    shifr                          NUMBER(5),
    no_pack                        NUMBER(5),
    kassa_b                        NUMBER(5),
    kassa_z                        NUMBER(5),
    no_filial                      NUMBER(5),
    sloj_prov                      NUMBER(5),
    bank_d                         NUMBER,
    bank_k                         NUMBER,
    no_doc                         NUMBER(5),
    no_mem                         NUMBER(5),
    d1                             VARCHAR2(20),
    k1                             VARCHAR2(20),
    rate_d                         NUMBER(15,2),
    rate_c                         NUMBER(15,2),
    parentid                       NUMBER DEFAULT NULL,
    currencyid_c                   NUMBER(4) DEFAULT 0,
    ammount_c                      NUMBER(15,2),
    name                           VARCHAR2(255))
PARTITION BY RANGE (SHIFR)
  (
  PARTITION ARCHIVALDAY VALUES LESS THAN (1),
  PARTITION RESERVE VALUES LESS THAN (2),
  PARTITION YESTERDAY VALUES LESS THAN (3),
  PARTITION TODAY VALUES LESS THAN (4),
  PARTITION UNKNOWNDAY VALUES LESS THAN (MAXVALUE)
  )
/
ALTER TABLE provarch_x  ENABLE ROW MOVEMENT;

ALTER TABLE PROVARCH 
 MODIFY (
  PARENTID NUMBER
 )
/

ALTER TABLE provarch_x
 EXCHANGE PARTITION UNKNOWNDAY WITH TABLE provarch
  WITHOUT VALIDATION;

drop table provarch;

RENAME  provarch_x TO provarch;

ALTER TABLE PROVARCH 
 MODIFY (
  DAT NOT NULL)
/
ALTER TABLE PROVARCH
 MODIFY (
  DEBT NOT NULL)
/
ALTER TABLE PROVARCH
 MODIFY (
  KREDIT NOT NULL)
/
ALTER TABLE PROVARCH
 MODIFY (
  VAL_ACC NOT NULL)
/
ALTER TABLE PROVARCH
 MODIFY (
  AMMOUNT NOT NULL)
/
ALTER TABLE PROVARCH
 MODIFY (
  LAMMOUNT NOT NULL)
/
ALTER TABLE PROVARCH
 MODIFY (
  CURRENCYID_C NOT NULL)
/
ALTER TABLE PROVARCH
 MODIFY (
  AMMOUNT_C NOT NULL)
/


CREATE INDEX idx_provarch_dat ON provarch
  (dat   ASC) PARALLEL TABLESPACE smartidx;

CREATE INDEX idx_provarch_debitid ON provarch
  (debt  ASC) PARALLEL TABLESPACE smartidx;
  
CREATE INDEX idx_provarch_creditid ON provarch
  (kredit  ASC) PARALLEL TABLESPACE smartidx;

ALTER TABLE provarch
ADD CONSTRAINT pk_provarch PRIMARY KEY (id)
USING INDEX TABLESPACE smartidx;


CREATE OR REPLACE TRIGGER "SMART".TR_PROVARCH_OPID
 BEFORE 
 INSERT
 ON PROVARCH
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
begin
  :new.OP_ID := sblogin.UserID;
end;
/

ALTER TABLE provarch
ADD CONSTRAINT fk_provarch_acc_cred FOREIGN KEY (kredit)
REFERENCES account (id) ON DELETE CASCADE
/
ALTER TABLE provarch
ADD CONSTRAINT fk_provarch_acc_deb FOREIGN KEY (debt)
REFERENCES account (id) ON DELETE CASCADE
/
ALTER TABLE provarch
ADD CONSTRAINT fk_provarch_currencyid FOREIGN KEY (currencyid_c)
REFERENCES avalute (valute) ON DELETE SET NULL
/
ALTER TABLE provarch
ADD CONSTRAINT fk_provarch_val_acc FOREIGN KEY (val_acc)
REFERENCES avalute (valute) ON DELETE SET NULL
/


--------------------------------------<<-PROVARCH-------------------------------------

----------------------------------------OPERKURS-->>-----------------------------------

CREATE TABLE operkurs_x
    (val_kod                        NUMBER(5) NOT NULL,
    ostat                          NUMBER NOT NULL,
    dat                            DATE NOT NULL,
    shifr                          NUMBER(15))
  PARTITION BY RANGE (SHIFR)
  (
  PARTITION ARCHIVALDAY VALUES LESS THAN (1),
  PARTITION RESERVE VALUES LESS THAN (2),
  PARTITION YESTERDAY VALUES LESS THAN (3),
  PARTITION TODAY VALUES LESS THAN (4),
  PARTITION UNKNOWNDAY VALUES LESS THAN (MAXVALUE)
  )
/

ALTER TABLE OPERKURS 
 ADD (
  SHIFR NUMBER (15)
 )
/

ALTER TABLE operkurs_x  ENABLE ROW MOVEMENT;

ALTER TABLE operkurs_x
 EXCHANGE PARTITION ARCHIVALDAY WITH TABLE operkurs
  WITHOUT VALIDATION;

drop table operkurs;

RENAME  operkurs_x TO operkurs;

CREATE INDEX idx_shifr ON operkurs
  (shifr ASC) PARALLEL TABLESPACE smartidx;

CREATE INDEX operkurs_valkod ON operkurs
  (val_kod  ASC) PARALLEL TABLESPACE smartidx;

CREATE INDEX idx_operkurs_dat ON operkurs
  (dat ASC) PARALLEL TABLESPACE smartidx;

ALTER TABLE operkurs
ADD CONSTRAINT pk_operkurs PRIMARY KEY (val_kod, dat)
USING INDEX TABLESPACE smartidx;

ALTER TABLE operkurs
ADD CONSTRAINT fk_operkurs_avalute FOREIGN KEY (val_kod)
REFERENCES avalute (valute) ON DELETE SET NULL;
------------------------------------<<--OPERKURS-------------------------------------

--ALTER TABLE trains MOVE PARTITION station3 TABLESPACE ts097 NOLOGGING;

