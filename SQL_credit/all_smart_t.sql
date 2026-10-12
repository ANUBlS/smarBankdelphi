CREATE TABLE a1
    (c1                             NUMBER,
    c2                             VARCHAR2(3000),
    c3                             DATE,
    c4                             NUMBER,
    c5                             VARCHAR2(4000))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER ewqe
AFTER UPDATE OF 
  c2
ON a1
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  raise_application_error(-20001,'Zafaghshsdvgkj');
end;
/
CREATE TABLE a2
    (id                             NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE acc_flag_link
    (acc_id                         NUMBER NOT NULL,
    flag_id                        NUMBER NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE acc_flag_link
ADD CONSTRAINT pk_acc_flag_link PRIMARY KEY (acc_id, flag_id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
COMMENT ON TABLE acc_flag_link IS '?????? ????? ACCOUNT ? ACC_FLAGS
????????? "??????-??-??????"'
/
CREATE TABLE acc_flags
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(16) NOT NULL,
    description                    VARCHAR2(256))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE acc_flags
ADD CONSTRAINT pk_acc_flags_id PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
ALTER TABLE acc_flags
ADD CONSTRAINT uk_acc_flags UNIQUE (name)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
COMMENT ON TABLE acc_flags IS '????? ??? ??????.
?????? ?????????????? ????? ??????? ACC_FLAG_LINK.'
/
CREATE TABLE account
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
    sid#                           NUMBER,
    oldid                          NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  PARTITION BY RANGE (CLOSE_DAT)
  (
  PARTITION CLOSEACC VALUES LESS THAN (TO_DATE(' 2100-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255,
  PARTITION ACTIVACC VALUES LESS THAN (MAXVALUE)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  )
/
CREATE INDEX idx_account_acc_no ON account
  (
    acc_no                          ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE INDEX idx_account_bal_cn1 ON account
  (
    bal_cn1                         ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE INDEX idx_account_bal_cn2 ON account
  (
    bal_cn2                         ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE INDEX idx_account_bal_cn3 ON account
  (
    bal_cn3                         ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE INDEX idx_account_bal_cn4 ON account
  (
    bal_cn4                         ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/

ALTER TABLE account
ADD CONSTRAINT pk_account PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
ALTER TABLE account
ADD CONSTRAINT uk_acc_no_val_acc UNIQUE (acc_no, val_acc)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
ENABLE NOVALIDATE
/
CREATE OR REPLACE TRIGGER befor_inc_account
BEFORE INSERT 
ON account
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
   SELECT tr_seg_account.NEXTVAL
     INTO :NEW.id
     FROM dual;

    :new.OP_ID := sblogin.UserID;
    
   -- :new.kli_id :=getnewid(:new.kli_id);
   
END befor_inc_account;
/
CREATE OR REPLACE TRIGGER after_inc_account
AFTER INSERT 
ON account
REFERENCING NEW AS NEW OLD AS OLD
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
CREATE OR REPLACE TRIGGER bi_account_opid
BEFORE UPDATE 
ON account
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare
 AccRest Archost.ostat%type;
 AccPokRest Archost.pok_ostat%type;
begin
  if :new.OP_ID = :old.OP_ID then
	:new.OP_ID := sblogin.UserID;
  end if;
 
 if :new.close_dat is not null then
  select ostat, pok_ostat into AccRest, AccPokRest from tenostat where acc_id = :new.ID;
  if (AccRest <> 0) or (AccPokRest <> 0) then
   raise_application_error(-20010, 'Qaligi olan hesabi baglamaq olmaz!!!');
  end if;  
 end if;  
end;
/
CREATE OR REPLACE TRIGGER bu_account_restrict_update
BEFORE UPDATE 
ON account
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  if (:NEW.VAL_ACC <> :OLD.VAL_ACC) or (:NEW.ACC_NO <> :OLD.ACC_NO) then 
  raise_application_error(-20034,'Editing Account Currency or Account Number Restricted by system');
	end if;
end;
/
CREATE TABLE account_flags
    (symbol                         CHAR(1) NOT NULL,
    name                           VARCHAR2(32) NOT NULL,
    description                    VARCHAR2(64))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE account_flags
ADD CONSTRAINT uk_acc_flags_symbol UNIQUE (symbol)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER restrict_delete_update
BEFORE UPDATE  OR  DELETE 
ON account_flags
REFERENCING NEW AS NEW OLD AS OLD
begin
  RAISE_APPLICATION_ERROR(-20999 ,'Editing or Deleting Rows Restricted by SYSTEM!');
end;
/
CREATE TABLE account_zones
    (id                             NUMBER NOT NULL,
    zonename                       VARCHAR2(32),
    zonedescription                VARCHAR2(128))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE account_zones
ADD CONSTRAINT pk_account_zones PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER bi_account_zones
BEFORE INSERT 
ON account_zones
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  select SEQ_ACCOUNT_ZONES.NEXTVAL 
  into :NEW.ID 
  from DUAL;
end;
/
CREATE TABLE account_zones_info
    (zoneid                         NUMBER NOT NULL,
    accounts                       NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE accs_extr
    (acc_no                         VARCHAR2(20) DEFAULT NULL,
    name                           VARCHAR2(90) DEFAULT NULL,
    bal_cn1                        NUMBER(10) DEFAULT NULL

 ,
    st_date                        DATE DEFAULT NULL,
    end_date                       DATE DEFAULT NULL

 ,
    acc_id                         NUMBER(10),
    bal_cn2                        NUMBER(10),
    bal_cn3                        NUMBER(10),
    bal_cn4                        NUMBER(10),
    init_sum                       NUMBER(15),
    init_sum_pok                   NUMBER(15),
    last_sum                       NUMBER(15),
    last_sum_pok                   NUMBER(15),
    init_sum_date                  DATE,
    last_sum_date                  DATE)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE TABLE amb_file_path
    (id_r                           NUMBER,
    file_name                      VARCHAR2(255),
    list_name                      VARCHAR2(255),
    moving                         NUMBER(8))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE TABLE amb_formula
    (id_r                           NUMBER,
    cell                           VARCHAR2(10),
    isperiodic                     NUMBER,
    horizontal                     NUMBER,
    formula                        VARCHAR2(255),
    isperiodic_1                   CHAR(1),
    horizontal_1                   CHAR(1))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE TABLE amb_report_list
    (id                             NUMBER,
    name                           VARCHAR2(255))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE OR REPLACE TRIGGER inc_reportlist
BEFORE INSERT 
ON amb_report_list
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare nw integer;
begin
 select tr_seg_REPORTLIST.nextval into nw from dual;
 :new.id:=nw;
end inc_REPORTLIST;
/
CREATE TABLE archive_wares1
    (id                             NUMBER NOT NULL,
    groupsid                       NUMBER,
    name                           VARCHAR2(90),
    inventar                       VARCHAR2(20),
    inventar_date                  DATE,
    first_price                    NUMBER,
    balance_price                  NUMBER(20,2),
    in_date                        DATE,
    out_date                       DATE,
    in_num                         NUMBER,
    out_num                        NUMBER,
    amort                          NUMBER,
    producer_plane                 VARCHAR2(100),
    fxm                            NUMBER,
    sector_cod                     NUMBER,
    cause_out                      VARCHAR2(100),
    modern_date                    DATE,
    modern_summa                   NUMBER,
    modern_num                     NUMBER,
    repair_date                    DATE,
    repair_summa                   NUMBER,
    repair_num                     NUMBER,
    allamort                       NUMBER(15,2),
    amort_date                     DATE)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE TABLE archive_wares2
    (id                             NUMBER,
    groupsid                       NUMBER,
    name                           VARCHAR2(90),
    invenrtar                      VARCHAR2(20),
    inventar_date                  DATE,
    close_date                     DATE,
    first_price                    NUMBER(20,2),
    balance_price                  NUMBER(20,2),
    amort                          NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE TABLE archost
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
CREATE INDEX idx_archost_datdate ON archost
  (
    datdate                         ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE INDEX idx_nu_account_id ON archost
  (
    acc_id                          ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/

ALTER TABLE archost
ADD CONSTRAINT pk_archost PRIMARY KEY (acc_id, datdate)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
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
END;
/
CREATE TABLE avalute_t
    (valute                         NUMBER(4) NOT NULL,
    val_name                       VARCHAR2(10),
    valu_name                      VARCHAR2(25),
    valu_short                     VARCHAR2(10),
    ustorg                         NUMBER(10),
    ustpok                         NUMBER(10),
    valu_gen                       VARCHAR2(10),
    valu_az                        VARCHAR2(25),
    using                          NUMBER(5),
    valu_other                     VARCHAR2(25),
    valu_inter                     VARCHAR2(3),
    valu_bala                      VARCHAR2(25),
    pristavka                      NUMBER,
    country                        VARCHAR2(20),
    ust_pok1                       NUMBER(10),
    offical                        VARCHAR2(5),
    limit                          NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE avalute_t
ADD CONSTRAINT pk_avalute PRIMARY KEY (valute)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER inc_avalute
AFTER INSERT 
ON avalute_t
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
 insert into TempRate (val_kod, ostat, dat, shifr) values (:new.valute,1,sbop.get_date(),3);
end;
/
CREATE OR REPLACE TRIGGER sba_avalute_delete
BEFORE  DELETE 
ON avalute_t
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('AVALUTE','delete');  --adm
end;
/
CREATE OR REPLACE TRIGGER sba_avalute_update
BEFORE UPDATE 
ON avalute_t
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('AVALUTE','update');  --adm
end;
/
CREATE OR REPLACE TRIGGER sba_avalute_insert
BEFORE INSERT 
ON avalute_t
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('AVALUTE','insert');  --adm
end;
/
CREATE TABLE bal_spr1
    (bal_cn                         NUMBER(10) NOT NULL,
    typeid                         NUMBER,
    additionaltypeid               NUMBER,
    accgroup                       NUMBER(10),
    accclass                       NUMBER(10),
    saldo                          NUMBER DEFAULT 0
,
    part                           NUMBER(5),
    balname                        VARCHAR2(181),
    closebalance                   NUMBER DEFAULT 0

 ,
    ratedifference                 NUMBER DEFAULT 0


,
    currencyposition               NUMBER DEFAULT 0

 ,
    cashincoming                   NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE bal_spr1
ADD CONSTRAINT pk_bal_spr1 PRIMARY KEY (bal_cn)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER sba_bal_spr1_delete
BEFORE  DELETE 
ON bal_spr1
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('BALANCEREFEDIT','delete');  --adm
end;
/
CREATE OR REPLACE TRIGGER sba_bal_spr1_update
BEFORE UPDATE 
ON bal_spr1
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('BALANCEREFEDIT','update');  --adm
end;
/
CREATE OR REPLACE TRIGGER sba_bal_spr1_insert
BEFORE INSERT 
ON bal_spr1
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('BALANCEREFEDIT','insert');  --adm
end;
/
COMMENT ON COLUMN bal_spr1.cashincoming IS '0-NOT INCOMING ;1 INCOMING IN CASH REPORT'
/
COMMENT ON COLUMN bal_spr1.closebalance IS '0- Uchastvuet,  1... NeUchastvuet'
/
COMMENT ON COLUMN bal_spr1.currencyposition IS '0- Uchastvuet,  1... NeUchastvuet'
/
COMMENT ON COLUMN bal_spr1.typeid IS '1-Active, 2-Passive, 3-Active-Passive'
/
CREATE TABLE bal_spr2
    (bal_cn                         NUMBER(10) NOT NULL,
    typeid                         NUMBER,
    additionaltypeid               NUMBER,
    accgroup                       NUMBER(10),
    accclass                       NUMBER(10),
    saldo                          NUMBER DEFAULT 0
,
    part                           NUMBER(5),
    balname                        VARCHAR2(181),
    closebalance                   NUMBER DEFAULT 0

 ,
    ratedifference                 NUMBER DEFAULT 0

,
    currencyposition               NUMBER DEFAULT 0 ,
    cashincomig                    NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE bal_spr2
ADD CONSTRAINT pk_bal_spr2 PRIMARY KEY (bal_cn)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER sba_bal_spr2_delete
BEFORE  DELETE 
ON bal_spr2
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('BALANCEREFEDIT','delete');  --adm
end;
/
CREATE OR REPLACE TRIGGER sba_bal_spr2_insert
BEFORE INSERT 
ON bal_spr2
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('BALANCEREFEDIT','insert');  --adm
end;
/
CREATE OR REPLACE TRIGGER sba_bal_spr2_update
BEFORE UPDATE 
ON bal_spr2
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('BALANCEREFEDIT','update');  --adm
end;
/
COMMENT ON COLUMN bal_spr2.closebalance IS '0- Uchastvuet,  1... NeUchastvuet'
/
COMMENT ON COLUMN bal_spr2.currencyposition IS '0- Uchastvuet,  1... NeUchastvuet'
/
COMMENT ON COLUMN bal_spr2.typeid IS '1-Active, 2-Passive, 3-Active-Passive'
/
CREATE TABLE bal_spr3
    (bal_cn                         NUMBER(10) NOT NULL,
    typeid                         NUMBER,
    additionaltypeid               NUMBER,
    accgroup                       NUMBER(10),
    accclass                       NUMBER(10),
    saldo                          NUMBER DEFAULT 0
,
    part                           NUMBER(5),
    balname                        VARCHAR2(181),
    closebalance                   NUMBER DEFAULT 0

 ,
    ratedifference                 NUMBER DEFAULT 0

,
    currencyposition               NUMBER DEFAULT 0

 ,
    cashincoming                   NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE bal_spr3
ADD CONSTRAINT pk_bal_spr3 PRIMARY KEY (bal_cn)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER sba_bal_spr3_delete
BEFORE  DELETE 
ON bal_spr3
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('BALANCEREFEDIT','delete');  --adm
end;
/
CREATE OR REPLACE TRIGGER sba_bal_spr3_update
BEFORE UPDATE 
ON bal_spr3
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('BALANCEREFEDIT','update');  --adm
end;
/
CREATE OR REPLACE TRIGGER sba_bal_spr3_insert
BEFORE INSERT 
ON bal_spr3
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('BALANCEREFEDIT','insert');  --adm
end;
/
COMMENT ON COLUMN bal_spr3.closebalance IS '0- Uchastvuet,  1... NeUchastvuet'
/
COMMENT ON COLUMN bal_spr3.currencyposition IS '0- Uchastvuet,  1... NeUchastvuet'
/
COMMENT ON COLUMN bal_spr3.typeid IS '1-Active, 2-Passive, 3-Active-Passive'
/
CREATE TABLE bal_spr4
    (bal_cn                         NUMBER(10) NOT NULL,
    typeid                         NUMBER,
    additionaltypeid               NUMBER,
    accgroup                       NUMBER(10),
    accclass                       NUMBER(10),
    saldo                          NUMBER DEFAULT 0
,
    part                           NUMBER(5),
    balname                        VARCHAR2(181),
    closebalance                   NUMBER DEFAULT 0

 ,
    ratedifference                 NUMBER DEFAULT 0

,
    currencyposition               NUMBER DEFAULT 0

 ,
    cashincoming                   NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE bal_spr4
ADD CONSTRAINT pk_bal_spr4 PRIMARY KEY (bal_cn)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER sba_bal_spr4_delete
BEFORE  DELETE 
ON bal_spr4
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('BALANCEREFEDIT','delete');  --adm
end;
/
CREATE OR REPLACE TRIGGER sba_bal_spr4_insert
BEFORE INSERT 
ON bal_spr4
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('BALANCEREFEDIT','insert');  --adm
end;
/
CREATE OR REPLACE TRIGGER sba_bal_spr4_update
BEFORE UPDATE 
ON bal_spr4
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('BALANCEREFEDIT','update');  --adm
end;
/
COMMENT ON COLUMN bal_spr4.closebalance IS '0- Uchastvuet,  1... NeUchastvuet'
/
COMMENT ON COLUMN bal_spr4.currencyposition IS '0- Uchastvuet,  1... NeUchastvuet'
/
COMMENT ON COLUMN bal_spr4.typeid IS '1-Active, 2-Passive, 3-Active-Passive'
/
CREATE TABLE bankinfo_t
    (kod_b                          NUMBER,
    bank                           VARCHAR2(80),
    az_name                        VARCHAR2(80),
    krno                           NUMBER,
    inn                            VARCHAR2(15),
    seher                          VARCHAR2(20),
    adress                         VARCHAR2(50),
    sedr                           VARCHAR2(20),
    buhaltr                        VARCHAR2(20),
    tel                            VARCHAR2(20),
    fax                            VARCHAR2(20),
    swift                          VARCHAR2(20),
    telex                          VARCHAR2(20),
    email                          VARCHAR2(20),
    post_in                        VARCHAR2(20),
    kod_fil                        NUMBER(10) NOT NULL,
    filial                         VARCHAR2(80),
    adres_fil                      VARCHAR2(50),
    tel_fil                        VARCHAR2(20),
    fax_fil                        VARCHAR2(20),
    swift_fil                      VARCHAR2(20),
    telex_fil                      VARCHAR2(20),
    postin_fil                     VARCHAR2(20),
    seher_fil                      VARCHAR2(20),
    inn_fil                        VARCHAR2(15),
    krno_fil                       NUMBER,
    sedrfil                        VARCHAR2(20),
    buhal_fil                      VARCHAR2(20),
    kod_bfil                       NUMBER,
    nb                             NUMBER(5),
    val_mov                        VARCHAR2(15),
    logo                           BLOB,
    link                           VARCHAR2(220),
    sdv                            NUMBER(20),
    svm                            NUMBER(20),
    bf                             NUMBER,
    managertitle                   VARCHAR2(128),
    accountanttitle                VARCHAR2(128),
    svm_currencyid                 NUMBER,
    capital                        NUMBER(20,2))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
LOB (LOGO) STORE AS
(
  NOCACHE LOGGING
  CHUNK 8192
  PCTVERSION 10
)
/
CREATE TABLE bankm
    (id                             NUMBER(10) NOT NULL,
    krno                           NUMBER(17),
    name                           VARCHAR2(256),
    inn                            VARCHAR2(32),
    swift                          VARCHAR2(128),
    bankcode                       VARCHAR2(32))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE bankm
ADD CONSTRAINT pk_bankm PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER sba_bankm_delete
BEFORE  DELETE 
ON bankm
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('ABOUTBANKS','delete');  --adm
end;
/
CREATE OR REPLACE TRIGGER inc_bankm
BEFORE INSERT 
ON bankm
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare nw integer;
begin
 select tr_seg_Bankm.nextval into nw from dual;
 :new.id:=nw;
end Inc_Bankm;
/
CREATE OR REPLACE TRIGGER sba_bankm_update
BEFORE UPDATE 
ON bankm
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('ABOUTBANKS','update');  --adm
end;
/
CREATE OR REPLACE TRIGGER sba_bankm_insert
BEFORE INSERT 
ON bankm
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('ABOUTBANKS','insert');  --adm
end;
/
CREATE TABLE bankproperties
    (valute                         NUMBER(4) NOT NULL,
    debet                          NUMBER(10),
    kredit                         NUMBER(10),
    f5501p                         NUMBER(10),
    f5501v                         NUMBER(10),
    sdebet                         NUMBER(10),
    scredit                        NUMBER(10),
    filialid                       NUMBER(10) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE cash_settings
    (cashbalancenational            NUMBER,
    cashbalanceenglish             NUMBER,
    description_az                 VARCHAR2(150),
    description_eng                VARCHAR2(150),
    signatyre                      VARCHAR2(150),
    responsible_person             VARCHAR2(150))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE cashinfo
    (id                             NUMBER NOT NULL,
    person_doc                     VARCHAR2(40),
    issuedby                       VARCHAR2(40),
    seria                          VARCHAR2(40),
    docnumber                      VARCHAR2(40),
    fromwhen                       VARCHAR2(100))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE cashinfo
ADD CONSTRAINT pk_cashinfo PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE TABLE classifications
    (id                             NUMBER NOT NULL,
    accgrouplist                   VARCHAR2(255),
    description                    VARCHAR2(255))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE classifications
ADD CONSTRAINT pk_classifications PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER bi_classifications_gen_id
BEFORE INSERT 
ON classifications
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  select CLASSIFICATIONS_ID_GEN.NEXTVAL
  into :NEW.ID
  from DUAL;
end;
/
CREATE TABLE classifications_info
    (classid                        NUMBER NOT NULL,
    criterion                      NUMBER NOT NULL,
    interestkind                   NUMBER NOT NULL,
    debitaccountid                 NUMBER,
    creditaccountid                NUMBER,
    period                         NUMBER NOT NULL,
    lastopdate                     DATE,
    annualrate                     NUMBER(7,4) NOT NULL,
    minrest                        NUMBER(18,2),
    maxrest                        NUMBER(18,2),
    presenceflags                  VARCHAR2(64),
    absenceflags                   VARCHAR2(64),
    trdesc                         VARCHAR2(255) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE classifications_info
ADD CONSTRAINT check_debit_or_credit_notnull CHECK ((DEBITACCOUNTID IS NOT NULL) OR (CREDITACCOUNTID IS NOT NULL))
/
CREATE TABLE close_acc_type
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(32) NOT NULL,
    displayname                    VARCHAR2(64) NOT NULL,
    visible                        NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
COMMENT ON COLUMN close_acc_type.id IS 'Manually configured ID. No AutoInc'
/
CREATE TABLE close_month
    (month                          DATE,
    month_id                       NUMBER NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE close_month
ADD CONSTRAINT pk_month_id PRIMARY KEY (month_id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER trg_month_id
BEFORE INSERT 
ON close_month
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
Declare nw integer;
begin
 select seq_close_month.nextval into nw from dual;
 :new.month_id:=nw;
end;
/
CREATE TABLE commision_trans_t
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(150),
    debt                           NUMBER,
    credit                         NUMBER,
    additionaldebt                 NUMBER,
    additionalcredit               NUMBER,
    assignment                     VARCHAR2(300),
    commisionassignment            VARCHAR2(300),
    userid                         NUMBER,
    branch                         NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE commision_trans_t
ADD CONSTRAINT pk_commision_trans_id PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE TABLE config_files
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(32) NOT NULL,
    description                    VARCHAR2(64))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE config_files
ADD CONSTRAINT pk_config_files PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE TABLE config_sections
    (id                             NUMBER NOT NULL,
    parentid                       NUMBER,
    name                           VARCHAR2(64) NOT NULL,
    section_comment                VARCHAR2(256),
    fileid                         NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE config_sections
ADD CONSTRAINT pk_config_sections PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER bi_config_sections
BEFORE INSERT 
ON config_sections
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  select CONFIG_SECTIONS_ID_GEN.nextval
    into :new.ID
    from dual;
end;
/
COMMENT ON COLUMN config_sections.fileid IS 'Add NOT NULL constraint'
/
CREATE TABLE config_values
    (id                             NUMBER NOT NULL,
    sectionid                      NUMBER NOT NULL,
    name                           VARCHAR2(64) NOT NULL,
    value                          VARCHAR2(1024))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE config_values
ADD CONSTRAINT pk_config_values PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER bi_config_values
BEFORE INSERT 
ON config_values
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
        select CONFIG_VALUES_ID_GEN.nextval
                into :new.ID
                from dual;
end;
/
CREATE TABLE convert_assignments
    (id                             NUMBER NOT NULL,
    shortname                      VARCHAR2(10) NOT NULL,
    fullpath                       VARCHAR2(200),
    extra                          VARCHAR2(10),
    different                      NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER trg_convert_assignment
BEFORE INSERT 
ON convert_assignments
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare nw integer;
begin
 select SEQ_CONVERT_ASSIGNMENT.NEXTVAL into nw from dual;
  :new.id :=nw; 
end;
/
CREATE TABLE cpsum_smart
    (shortname                      VARCHAR2(5),
    currency                       NUMBER,
    rate                           NUMBER,
    actives                        NUMBER,
    pok_actives                    NUMBER,
    passives                       NUMBER,
    pok_passives                   NUMBER,
    limit                          NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE curr_pos
    (capital                        NUMBER(18,2),
    balaccount                     NUMBER,
    accountrest                    NUMBER(18,2))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE currencyposition_smart
    (bankid                         VARCHAR2(64),
    shortname                      VARCHAR2(64),
    using                          NUMBER(5),
    presentdate                    DATE,
    currency                       NUMBER(3),
    offical                        VARCHAR2(64),
    balance                        NUMBER(10),
    incoming                       NUMBER,
    active                         NUMBER,
    passive                        NUMBER,
    rate                           NUMBER,
    extra                          NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE currentacc_passport
    (id                             NUMBER NOT NULL,
    currentaccid                   NUMBER NOT NULL,
    interestaccid                  NUMBER NOT NULL,
    expenceaccid                   NUMBER NOT NULL,
    annualyrate                    NUMBER(6,4) NOT NULL,
    min_rest                       NUMBER(18,2),
    max_rest                       NUMBER(18,2),
    trdescription                  VARCHAR2(128) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER bi_passport_genid
BEFORE INSERT 
ON currentacc_passport
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  select SEQ_PASSPORT.Nextval
  into :New.ID
  from dual;
end;
/
CREATE TABLE custimage
    (id                             NUMBER(10) NOT NULL,
    photo                          BLOB,
    custsign                       BLOB,
    stamp                          BLOB)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
LOB (PHOTO) STORE AS
(
  NOCACHE LOGGING
  CHUNK 8192
  PCTVERSION 10
)
LOB (CUSTSIGN) STORE AS
(
  NOCACHE LOGGING
  CHUNK 8192
  PCTVERSION 10
)
LOB (STAMP) STORE AS
(
  NOCACHE LOGGING
  CHUNK 8192
  PCTVERSION 10
)
/
ALTER TABLE custimage
ADD CONSTRAINT pk_custimage PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER trg_custimg_access_delete
BEFORE UPDATE 
ON custimage
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  SB_ACA.CheckObjectAccess('CUSTOMERS','delete');
end;
/
CREATE OR REPLACE TRIGGER trg_custimg_access_update
BEFORE UPDATE 
ON custimage
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  SB_ACA.CheckObjectAccess('CUSTOMERS','update');
end;
/
CREATE OR REPLACE TRIGGER trg_custimg_access_insert
BEFORE UPDATE 
ON custimage
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  SB_ACA.CheckObjectAccess('CUSTOMERS','insert');
end;
/
CREATE TABLE custinfo
    (id                             NUMBER(10) NOT NULL,
    idcust                         NUMBER(10) NOT NULL,
    soname                         VARCHAR2(30),
    name                           VARCHAR2(30),
    lastname                       VARCHAR2(30),
    birthday                       DATE,
    birthplace                     VARCHAR2(30),
    passer                         VARCHAR2(30),
    paspnum                        NUMBER(10),
    paspdate                       DATE,
    paspplace                      VARCHAR2(100),
    city                           VARCHAR2(30),
    address                        VARCHAR2(30),
    workplace                      VARCHAR2(30),
    phone_w                        VARCHAR2(30),
    phone_h                        VARCHAR2(30),
    phone_m                        VARCHAR2(30),
    e_mail                         VARCHAR2(30),
    url                            VARCHAR2(30),
    recomendation                  VARCHAR2(30),
    garanted                       VARCHAR2(30),
    otv_passport                   VARCHAR2(100),
    otv_issued                     VARCHAR2(100),
    otv_isdate                     VARCHAR2(100),
    note                           VARCHAR2(500),
    work                           VARCHAR2(100))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE custinfo
ADD CONSTRAINT pk_custinfo PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER befor_inc_iustinfo
BEFORE INSERT 
ON custinfo
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare nw integer;
begin
 select tr_seg_CUSTINFO.nextval into nw from dual;
 :new.id:=nw;
end Inc_CUSTINFO;
/
CREATE OR REPLACE TRIGGER after_inc_iustinfo
AFTER INSERT 
ON custinfo
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare nw integer;
begin
 select tr_seg_CUSTINFO.Currval into nw from dual;
 insert into CustImage values(nw,null,null,null); 
end After_Inc_CUSTINFO;
/
CREATE OR REPLACE TRIGGER trg_custinfo_access_delete
BEFORE UPDATE 
ON custinfo
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  SB_ACA.CheckObjectAccess('CUSTOMERS','delete');
end;
/
CREATE OR REPLACE TRIGGER trg_custinfo_access_update
BEFORE UPDATE 
ON custinfo
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  SB_ACA.CheckObjectAccess('CUSTOMERS','update');
end;
/
CREATE OR REPLACE TRIGGER trg_custinfo_access_insert
BEFORE UPDATE 
ON custinfo
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  SB_ACA.CheckObjectAccess('CUSTOMERS','insert');
end;
/
CREATE TABLE customers
    (id                             NUMBER(6) NOT NULL,
    op_id                          NUMBER(10),
    open_dat                       DATE,
    close_dat                      DATE,
    nerezident                     NUMBER DEFAULT 0

 ,
    prinad_kod                     NUMBER(10),
    name                           VARCHAR2(90),
    short_name                     VARCHAR2(50),
    group_klie                     NUMBER(10),
    vid_sob                        NUMBER(10),
    org_sob                        NUMBER(10),
    sfera_dey                      NUMBER(10),
    otrasl                         NUMBER(10),
    nalog_kod                      NUMBER(10),
    kod_okpro                      NUMBER(10),
    inn                            NUMBER(10),
    dat_nal                        DATE,
    dat_ustav                      DATE,
    bik                            NUMBER(14,2),
    otv_lico                       VARCHAR2(40),
    otv_passport                   VARCHAR2(20),
    otv_issued                     VARCHAR2(40),
    otv_isdate                     DATE,
    oldid                          NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE customers
ADD CONSTRAINT notnull CHECK (ID IS NOT NULL)
/
ALTER TABLE customers
ADD CONSTRAINT pk PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER inc_customer
BEFORE INSERT 
ON customers
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin

  select tr_seg_customer.nextval 
 	  into :new.id 
  from dual;
	
 :new.OP_ID := sblogin.UserID;
 
end Inc_Customer;
/
CREATE OR REPLACE TRIGGER sba_customers_update
BEFORE UPDATE 
ON customers
REFERENCING NEW AS NEW OLD AS OLD
begin
  SB_ACA.CheckObjectAccess('CUSTOMERS','update');  --adm
end;
/
CREATE OR REPLACE TRIGGER sba_customers_delete
BEFORE  DELETE 
ON customers
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('CUSTOMERS','delete');  --adm
end;
/
CREATE OR REPLACE TRIGGER upd_customers
BEFORE UPDATE 
ON customers
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
 :new.OP_ID := sblogin.UserID;
end;
/
CREATE OR REPLACE TRIGGER sba_customers_insert
BEFORE INSERT 
ON customers
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('CUSTOMERS','insert');  --adm
end customers_insert;
/
COMMENT ON TABLE customers IS '??????? ???????? ?????? ? ????????? ???????? ?????'
/
CREATE TABLE dbd_balance
    (adate                          DATE,
    accountnum                     VARCHAR2(32),
    accountname                    VARCHAR2(1024),
    active                         NUMBER,
    passive                        NUMBER,
    debt_turnover                  NUMBER,
    credit_turnover                NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE departments
    (department                     VARCHAR2(100),
    id                             NUMBER NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE departments
ADD CONSTRAINT pk_departments_id PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER trg_departments
BEFORE INSERT 
ON departments
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
Declare nw integer;
begin
 Select SEQ_DEPARTMENTS.nextval into nw from  dual;
 :new.ID:=nw;
end TRG_DEPARTMENTS;
/
CREATE TABLE dnm_regulationaccs
    (acc_id                         NUMBER,
    id_key                         NUMBER,
    tramount                       NUMBER,
    trappoint                      VARCHAR2(100),
    acc_no                         VARCHAR2(30))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER dnm_accid
BEFORE INSERT  OR UPDATE 
ON dnm_regulationaccs
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN 
declare 
 AccountID number;
BEGIN 
 begin
  select id into AccountID from account where account.acc_no = :new.Acc_NO;
  :new.Acc_id:=AccountID;
  EXCEPTION
  WHEN no_data_found THEN
  RAISE_APPLICATION_ERROR(-20100, 'Account № '||:new.Acc_NO ||' Not Found');
 end;
END;

END;
/
CREATE TABLE excaccount
    (exchangeid                     NUMBER NOT NULL,
    accountid                      NUMBER NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE excaccount
ADD CONSTRAINT pk_excaccount PRIMARY KEY (accountid)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE TABLE exchanges
    (id                             NUMBER(10) NOT NULL,
    name                           VARCHAR2(128) NOT NULL,
    exnum                          NUMBER NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE exchanges
ADD CONSTRAINT pk_exc_account PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER trg_exchanges
BEFORE INSERT 
ON exchanges
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare nw number(10);
begin
  Select SEG_FOR_EXCHANGES.NEXTVAL  Into
	  nw From Dual;
	:New.ID :=nw;	
end trg_exchanges;
/
CREATE GLOBAL TEMPORARY TABLE extraction
    (customername                   VARCHAR2(90),
    customervoin                   NUMBER(10),
    customerid                     NUMBER(10) NOT NULL,
    accountname                    VARCHAR2(90),
    accountnumber                  VARCHAR2(20) NOT NULL,
    accountid                      NUMBER(10) NOT NULL,
    operationid                    NUMBER(10),
    currencyid                     NUMBER(3) NOT NULL,
    currencyname                   VARCHAR2(10),
    balancecode                    NUMBER(10) NOT NULL,
    opendate                       DATE NOT NULL,
    filial                         NUMBER(5),
    close_dat                      DATE,
    previousrest                   NUMBER,
    lastopdate                     DATE,
    datdate                        DATE,
    ostat                          NUMBER,
    pok_ostat                      NUMBER,
    obr_d                          NUMBER,
    obr_k                          NUMBER,
    pok_obr_d                      NUMBER,
    pok_obr_k                      NUMBER,
    ap_beg                         CHAR(3),
    enddate                        DATE,
    endostat                       NUMBER,
    endpok_ostat                   NUMBER,
    endobr_d                       NUMBER,
    endobr_k                       NUMBER,
    endpok_obr_d                   NUMBER,
    endpok_obr_k                   NUMBER,
    ap_end                         CHAR(3))
ON COMMIT DELETE ROWS
/
CREATE TABLE extraction_smart
    (customername                   VARCHAR2(90),
    customervoin                   NUMBER(10),
    customerid                     NUMBER(10) NOT NULL,
    accountname                    VARCHAR2(90),
    accountnumber                  VARCHAR2(20) NOT NULL,
    accountid                      NUMBER(10) NOT NULL,
    currencyid                     NUMBER(3) NOT NULL,
    currencyname                   VARCHAR2(10),
    balancecode                    NUMBER(10) NOT NULL,
    balancename                    VARCHAR2(181),
    opendate                       DATE NOT NULL,
    filial                         NUMBER(5),
    close_dat                      DATE,
    ratedifference                 NUMBER,
    closebalance                   NUMBER,
    typeid                         NUMBER,
    additionaltypeid               NUMBER,
    saldo                          NUMBER,
    previousrest                   NUMBER,
    lastopdate                     DATE,
    datdate                        DATE,
    ostat                          NUMBER,
    pok_ostat                      NUMBER,
    obr_d                          NUMBER,
    obr_k                          NUMBER,
    pok_obr_d                      NUMBER,
    pok_obr_k                      NUMBER,
    ap_beg                         CHAR(3),
    enddate                        DATE,
    endostat                       NUMBER,
    endpok_ostat                   NUMBER,
    endobr_d                       NUMBER,
    endobr_k                       NUMBER,
    endpok_obr_d                   NUMBER,
    endpok_obr_k                   NUMBER,
    ap_end                         CHAR(3))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE GLOBAL TEMPORARY TABLE extractiontrans
    (id                             NUMBER(10),
    dat                            DATE,
    tim                            DATE,
    currencyid                     NUMBER(3),
    ownaccountid                   NUMBER(10),
    pairaccountid                  NUMBER(10),
    pairaccountname                VARCHAR2(20),
    paircurrencyid                 NUMBER,
    debit                          NUMBER,
    kredit                         NUMBER,
    ldebit                         NUMBER,
    lkredit                        NUMBER,
    operationcode                  NUMBER(5),
    name                           VARCHAR2(255))
ON COMMIT DELETE ROWS
/
CREATE TABLE extractiontrans_smart
    (id                             NUMBER(10),
    dat                            DATE,
    tim                            DATE,
    currencyid                     NUMBER(3),
    ownaccountid                   NUMBER(10),
    pairaccountid                  NUMBER(10),
    pairaccountname                VARCHAR2(20),
    paircurrencyid                 NUMBER,
    debit                          NUMBER,
    kredit                         NUMBER,
    ldebit                         NUMBER,
    lkredit                        NUMBER,
    operationcode                  NUMBER(5),
    name                           VARCHAR2(255))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE filial_t
    (id                             NUMBER(10) NOT NULL,
    name                           VARCHAR2(90))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE filial_t
ADD CONSTRAINT pk_filial_id PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER after_inc_filial
AFTER INSERT 
ON filial_t
REFERENCING NEW AS NEW OLD AS OLD
declare 
nw number;
begin
 select tr_seg_Filial.currval into nw from dual;
 insert into bankinfo_t (kod_fil) values (nw); 

 insert into bankproperties select 
  valute,debet,kredit,f5501p,f5501v,sdebet,scredit,nw
    from bankproperties where filialid=0;
end;
/
CREATE OR REPLACE TRIGGER filial_t_inc
BEFORE INSERT 
ON filial_t
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare
begin
 select tr_seg_Filial.nextval into :new.id from dual;
end;
/
CREATE TABLE groups
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(90),
    amort                          NUMBER,
    main_account                   NUMBER,
    exp_account                    NUMBER,
    amort_account                  NUMBER,
    sale_account                   NUMBER,
    taxamort                       NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE groups
ADD CONSTRAINT pk_groups PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER inc_groups
BEFORE INSERT 
ON groups
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
Declare nw integer;
begin
 Select SEQ_GROUPS.nextval into nw from  dual;
 :new.ID:=nw;
end INC_GROUPS;
/
CREATE TABLE hox102_out
    (id                             NUMBER,
    f_id                           NUMBER,
    opercode                       VARCHAR2(6),
    acc_id                         NUMBER,
    client_name                    VARCHAR2(70),
    client_code                    VARCHAR2(70),
    trans_ref                      VARCHAR2(16),
    amount                         NUMBER(22,2),
    val_acc                        NUMBER(4),
    transdate                      DATE,
    send                           NUMBER(1),
    status                         NUMBER(1),
    filial                         NUMBER(10),
    transaction_id                 NUMBER(10),
    client_inn                     VARCHAR2(30))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER hox_id_inc
BEFORE INSERT 
ON hox102_out
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare nw integer;
begin
 select hox_mt102.nextval into nw from dual;
 :new.id:=nw;
end Hox_id_inc;
/
CREATE TABLE hox150_out
    (id                             NUMBER,
    format                         VARCHAR2(1),
    sender                         VARCHAR2(20),
    receiver                       VARCHAR2(20),
    type                           VARCHAR2(3),
    priority                       VARCHAR2(1),
    notif_rq                       VARCHAR2(1),
    user_priority                  VARCHAR2(10),
    create_date                    DATE,
    user_reference                 VARCHAR2(16),
    batchfile                      NUMBER(2))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER new_id
BEFORE INSERT 
ON hox150_out
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare nw integer;
begin
 select hox150_id.nextval into nw from dual;
 :new.id:=nw;
end new_id;
/
CREATE TABLE hoxmessage_in
    (id                             NUMBER,
    reference                      VARCHAR2(16),
    val_cod                        NUMBER(4),
    amount                         NUMBER(22,2),
    sen_acc                        VARCHAR2(34),
    sen_name                       VARCHAR2(70),
    sen_inn                        VARCHAR2(35),
    sen_bank_id                    NUMBER,
    sen_bank_subacc                NUMBER(13),
    rec_bank_subacc                NUMBER(13),
    rec_bank_bik                   VARCHAR2(11),
    rec_client_acc                 VARCHAR2(34),
    rec_client_acc_id              NUMBER,
    rec_client_name                VARCHAR2(70),
    rec_client_inn                 VARCHAR2(35),
    remit_inf                      VARCHAR2(140),
    typecode                       NUMBER(3),
    add_inf                        VARCHAR2(105),
    trans_date                     DATE,
    status                         NUMBER(1),
    filial                         NUMBER(10))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER mex_ou_id
BEFORE INSERT 
ON hoxmessage_in
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare nw integer;
begin
 select hoxmess_in_id.nextval into nw from dual;
 :new.id:=nw;
end Hox_id_inc;
/
CREATE OR REPLACE TRIGGER update_icon
BEFORE INSERT 
ON hoxmessage_in
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
if (:new.rec_client_acc_id = null) then
   :new.status :=2; 
end if;
end;
/
CREATE TABLE hoxmessage_in_old
    (id                             NUMBER,
    reference                      VARCHAR2(16),
    val_cod                        NUMBER(4),
    amount                         NUMBER(22,2),
    sen_acc                        VARCHAR2(34),
    sen_name                       VARCHAR2(70),
    sen_inn                        NUMBER(35),
    sen_bank_id                    NUMBER,
    sen_bank_subacc                NUMBER(13),
    rec_bank_subacc                NUMBER(13),
    rec_bank_bik                   VARCHAR2(11),
    rec_client_acc                 VARCHAR2(34),
    rec_client_acc_id              NUMBER,
    rec_client_name                VARCHAR2(70),
    rec_client_inn                 NUMBER(35),
    remit_inf                      VARCHAR2(140),
    typecode                       NUMBER(3),
    add_inf                        VARCHAR2(105),
    trans_date                     DATE,
    status                         NUMBER(1),
    filial                         NUMBER(10))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE hoxmessage_out
    (id                             NUMBER,
    mt102_id                       NUMBER,
    rec_bank_id                    NUMBER,
    rec_bank_sub_acc               NUMBER(13),
    client_acc_no                  VARCHAR2(34),
    client_name                    VARCHAR2(70),
    client_code                    VARCHAR2(70),
    client_inn                     VARCHAR2(30),
    remit_inf                      VARCHAR2(140),
    trans_cod                      NUMBER(3),
    add_inf                        VARCHAR2(105),
    val_date                       DATE,
    val_cod                        NUMBER(4),
    mess_reference                 VARCHAR2(16),
    amount                         NUMBER(22,2),
    bnfcount                       NUMBER(5),
    status                         NUMBER(1),
    transaction_id                 NUMBER(10))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER hox_mess_id_inc
BEFORE INSERT 
ON hoxmessage_out
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare nw integer;
begin
 select hoxmess.nextval into nw from dual;
 :new.id:=nw;
end Hox_mess_id_INC;
/
CREATE TABLE hoxsw_account
    (id                             NUMBER,
    swift_id                       NUMBER,
    hox_id                         NUMBER,
    valute                         NUMBER(4))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER newid
BEFORE INSERT 
ON hoxsw_account
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare nw integer;
begin
 select hoxSW_ACCOUNT_ID.nextval into nw from dual;
 :new.id:=nw;
end Hox_mess_id_INC;
/
CREATE TABLE hoxsw_proper
    (id                             NUMBER,
    sw_in_dir                      VARCHAR2(250),
    sw_out_dir                     VARCHAR2(250),
    hox_in_dir                     VARCHAR2(250),
    hox_out_dir                    VARCHAR2(250),
    hoxamount_limit                NUMBER(22,8),
    swiftaccount                   VARCHAR2(13),
    hoxaccount                     VARCHAR2(13),
    transtypeid                    NUMBER,
    hox_archive_dir                VARCHAR2(250))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE hoxtranstype_code
    (id                             NUMBER,
    name                           VARCHAR2(15),
    code                           NUMBER(3))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE installation_actions
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(32),
    metrica                        NUMBER NOT NULL,
    code                           VARCHAR2(2000) NOT NULL,
    task_id                        NUMBER NOT NULL,
    enabled                        NUMBER,
    operationcode                  NUMBER NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE installation_actions
ADD CONSTRAINT pk_installation_actions PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER bi_installation_actions
BEFORE INSERT 
ON installation_actions
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
	select INSTALLATION_ACTIONS_ID_GEN.nextval
		into :new.ID
		from dual;
end;
/
COMMENT ON COLUMN installation_actions.code IS 'The SQL...'
/
COMMENT ON COLUMN installation_actions.metrica IS 'Prioritet'
/
COMMENT ON COLUMN installation_actions.name IS 'Canonical name of query'
/
COMMENT ON COLUMN installation_actions.operationcode IS 'Type of operation: 1 - ExecSQL (CODE - SQL query to execute), 2 - ExecTask (CODE - name of the task to execute)'
/
COMMENT ON COLUMN installation_actions.task_id IS 'Reference to INSTALLATION_TASKS'
/
CREATE TABLE installation_tasks
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(32) NOT NULL,
    dysplay_name                   VARCHAR2(32) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE installation_tasks
ADD CONSTRAINT pk_installation_tasks PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER bi_installation_tasks
BEFORE INSERT 
ON installation_tasks
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
	select INSTALLATION_TASKS_ID_GEN.nextval
		into :new.ID
		from dual;
end;
/
CREATE TABLE interchange
    (givenid                        NUMBER,
    givenname                      VARCHAR2(100),
    giveninventar                  VARCHAR2(100),
    givensumma                     NUMBER,
    takenid                        NUMBER,
    takenname                      VARCHAR2(100),
    takeninventar                  VARCHAR2(100),
    takensumma                     NUMBER,
    changedate                     DATE)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE TABLE kassa_b
    (symbol                         NUMBER NOT NULL,
    name                           VARCHAR2(777),
    mediocrity                     NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE kassa_b
ADD CONSTRAINT pk_kassab_on_symbol PRIMARY KEY (symbol)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
COMMENT ON COLUMN kassa_b.mediocrity IS '0 MEDAXIL 1 MEXARIC'
/
COMMENT ON COLUMN kassa_b.symbol IS '-CASH  SYMBOL'
/
CREATE TABLE kassa_z
    (symbol                         NUMBER(4),
    name                           VARCHAR2(556),
    mediocrity                     NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
COMMENT ON COLUMN kassa_z.mediocrity IS '--0-MEDAXIL  1-MEXARIC'
/
COMMENT ON COLUMN kassa_z.name IS '--Uygun Adi'
/
COMMENT ON COLUMN kassa_z.symbol IS '--KASSA SIMVOLU'
/
CREATE TABLE lazyrest
    (id_number                      NUMBER NOT NULL,
    acc_id                         NUMBER(10),
    ostat                          NUMBER(15,2),
    pok_ostat                      NUMBER(15,2),
    datdate                        DATE,
    obr_d                          NUMBER(15,2),
    obr_k                          NUMBER(15,2),
    pok_obr_d                      NUMBER(15,2),
    pok_obr_k                      NUMBER(15,2),
    lastopdate                     DATE)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE INDEX idx_lazyrest_datdate ON lazyrest
  (
    datdate                         ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/

ALTER TABLE lazyrest
ADD CONSTRAINT notnull_lazyrest CHECK (ID_NUMBER IS NOT NULL)
/
ALTER TABLE lazyrest
ADD CONSTRAINT pk_lazyrest PRIMARY KEY (id_number)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
ALTER TABLE lazyrest
ADD CONSTRAINT uk_lazyrest_acc_id_datdate UNIQUE (acc_id, datdate)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER inc_lazyrest
BEFORE INSERT 
ON lazyrest
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare nw integer;
begin
 select tr_seg_LazyRest.nextval into nw from dual;
 :new.id_Number:=nw;
end Inc_Inc_LazyRest;
/
CREATE TABLE lazytransaction
    (id                             NUMBER(10) NOT NULL,
    op_id                          NUMBER(10),
    no_prov                        VARCHAR2(8),
    dat                            DATE,
    debt                           NUMBER(10),
    kredit                         NUMBER(10),
    val_acc                        NUMBER(10) DEFAULT 0,
    vid_op                         NUMBER(5),
    ammount                        NUMBER(18,4),
    lammount                       NUMBER(18,4),
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
    rate_d                         NUMBER(18,4),
    rate_c                         NUMBER(18,4),
    parentid                       NUMBER,
    currencyid_c                   NUMBER(4) DEFAULT 0,
    ammount_c                      NUMBER(18,4),
    name                           VARCHAR2(255),
    temptrid                       NUMBER,
    rejectreason                   VARCHAR2(255),
    rejected                       NUMBER DEFAULT 0

 )
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE lazytransaction
ADD CONSTRAINT notnull_lazytransaction CHECK (ID IS NOT NULL)
/
ALTER TABLE lazytransaction
ADD CONSTRAINT pk_lazytransaction PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER bi_lazytransaction_op_id
BEFORE INSERT 
ON lazytransaction
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
	:new.OP_ID := sblogin.UserID;
end;
/
CREATE TABLE memorial
    (balance                        NUMBER NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE memorial_smart
    (dbal_cn                        NUMBER(10) NOT NULL,
    kbal_cn                        NUMBER(10) NOT NULL,
    dat                            DATE NOT NULL,
    diffrate                       NUMBER,
    name                           VARCHAR2(255),
    id                             NUMBER(10) NOT NULL,
    shifr                          NUMBER(5),
    val_acc                        VARCHAR2(4000),
    currencyid_c                   VARCHAR2(4000),
    ammount                        NUMBER(15,2) NOT NULL,
    ammount_c                      NUMBER(15,2) NOT NULL,
    lammount                       NUMBER(15,2) NOT NULL,
    op_id                          NUMBER(10),
    debitor                        VARCHAR2(20) NOT NULL,
    debtinn                        NUMBER,
    dname                          VARCHAR2(90),
    kreditor                       VARCHAR2(20) NOT NULL,
    kredinn                        NUMBER,
    kname                          VARCHAR2(90),
    debt                           NUMBER(10) NOT NULL,
    kredit                         NUMBER(10) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE memorial_tars
    (dbal_cn                        NUMBER(10),
    kbal_cn                        NUMBER(10),
    dat                            DATE,
    diffrate                       NUMBER,
    name                           VARCHAR2(255),
    id                             NUMBER(10) NOT NULL,
    shifr                          NUMBER(5),
    val_acc                        VARCHAR2(4000),
    currencyid_c                   VARCHAR2(4000),
    ammount                        NUMBER(15,2),
    ammount_c                      NUMBER(15,2),
    lammount                       NUMBER(15,2),
    op_id                          NUMBER(10),
    debitor                        VARCHAR2(20),
    debtinn                        NUMBER,
    dname                          VARCHAR2(90),
    kreditor                       VARCHAR2(20),
    kredinn                        NUMBER,
    kname                          VARCHAR2(90),
    debt                           NUMBER(10),
    kredit                         NUMBER(10))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE mf_close_year
    (current_year                   DATE,
    last_year                      DATE)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE TABLE mf_lazytrans
    (id                             NUMBER(10) NOT NULL,
    op_id                          NUMBER(10),
    no_prov                        VARCHAR2(8),
    dat                            DATE,
    debt                           NUMBER(10),
    kredit                         NUMBER(10),
    val_acc                        NUMBER(10),
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
    parentid                       NUMBER(5),
    currencyid_c                   NUMBER(4),
    ammount_c                      NUMBER(15,2),
    name                           VARCHAR2(255),
    temptrid                       NUMBER,
    rejectreason                   VARCHAR2(255),
    rejected                       NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE mf_transactions
    (transactionid                  NUMBER,
    groupsid                       NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE TABLE mftraf
    (id                             NUMBER,
    groupsid                       NUMBER,
    name                           VARCHAR2(90),
    invenrtar                      VARCHAR2(20),
    inventar_date                  DATE,
    first_price                    NUMBER(20,2),
    balance_price                  NUMBER(20,2),
    allamort                       NUMBER(20,2),
    remainder                      NUMBER(15,2),
    amort                          NUMBER,
    amort_date                     DATE)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE mftraffics
    (id                             NUMBER,
    groupsid                       NUMBER,
    name                           VARCHAR2(90),
    invenrtar                      VARCHAR2(20),
    inventar_date                  DATE,
    first_price                    NUMBER(20,2),
    balance_price                  NUMBER(20,2),
    allamort                       NUMBER(20,2),
    remainder                      NUMBER(15,2),
    amort                          NUMBER,
    amort_date                     DATE)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE moderned_wares
    (id                             NUMBER,
    groupsid                       NUMBER,
    modern_num                     NUMBER,
    modern_summa                   NUMBER,
    modern_date                    DATE)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE TABLE modules
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(64) NOT NULL,
    description                    VARCHAR2(128),
    sid#                           NUMBER,
    trvdesc                        VARCHAR2(256),
    can_insert                     NUMBER(1),
    can_delete                     NUMBER(1),
    can_update                     NUMBER(1),
    advanced_grants                NUMBER(1))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE modules
ADD CONSTRAINT classid_unique UNIQUE (name)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
ALTER TABLE modules
ADD CONSTRAINT pk_modules PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER bi_modules
BEFORE INSERT 
ON modules
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
	select modules_id_gen.nextval
		into :new.ID
	from dual;	
end;
/
CREATE TABLE nalog
    (id                             NUMBER(10) NOT NULL,
    name                           VARCHAR2(90))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE nalog
ADD CONSTRAINT pk_nalog PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER inc_nalog
BEFORE INSERT 
ON nalog
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare nw integer;
begin
 select tr_seg_NALOG.nextval into nw from dual;
 :new.id:=nw;
end Inc_NALOG;
/
CREATE OR REPLACE TRIGGER sba_nalog_delete
BEFORE  DELETE 
ON nalog
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('RefEdit','delete');  --adm
 SB_ACA.CheckObjectAccess('CUSTOMERS','delete');  --adm
 SB_ACA.CheckObjectAccess('CUSTOMERS','update');  --adm
end;
/
CREATE OR REPLACE TRIGGER sba_nalog_update
BEFORE UPDATE 
ON nalog
REFERENCING NEW AS NEW OLD AS OLD
begin
  SB_ACA.CheckObjectAccess('RefEdit','update');  --adm
end;
/
CREATE OR REPLACE TRIGGER sba_nalog_insert
BEFORE INSERT 
ON nalog
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('RefEdit','insert');  --adm
 end nalog_insert;
/
CREATE TABLE operation_balances
    (operationid                    NUMBER NOT NULL,
    balance                        NUMBER NOT NULL,
    id                             NUMBER,
    accno                          VARCHAR2(20),
    accgroup                       NUMBER,
    class                          NUMBER,
    tipacc                         VARCHAR2(5))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE OR REPLACE TRIGGER trg_operation_balances
BEFORE INSERT 
ON operation_balances
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare
   newID number;
begin
  select SEQ_operation_Balances.NEXTVAL into newID from Dual;
  :New.ID :=newID;
end;
/
CREATE TABLE operation_schema
    (id                             NUMBER NOT NULL,
    schema                         VARCHAR2(100))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE operation_schema
ADD CONSTRAINT pk_operation_schema PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER trg_operation_schema
BEFORE INSERT 
ON operation_schema
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare 
  newID number;
begin
 select SEQ_OPERATION_SCHEMA.NEXTVAL into newID from dual;
 :New.ID :=newID; 
end;
/
CREATE TABLE operations
    (id                             NUMBER NOT NULL,
    operation                      VARCHAR2(100),
    schemaid                       NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE operations
ADD CONSTRAINT pk_operations PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER trg_operations
BEFORE INSERT 
ON operations
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare 
   newID number;
begin
 select SEQ_OPERATIONS.NEXTVAL into newID from Dual;
 :NEW.ID :=newID;
end;
/
CREATE TABLE operkurs
    (val_kod                        NUMBER(5) NOT NULL,
    ostat                          NUMBER NOT NULL,
    dat                            DATE NOT NULL,
    shifr                          NUMBER(15))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  PARTITION BY RANGE (SHIFR)
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
CREATE INDEX idx_shifr ON operkurs
  (
    shifr                           ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE INDEX operkurs_valkod ON operkurs
  (
    val_kod                         ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE INDEX idx_operkurs_dat ON operkurs
  (
    dat                             ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/

ALTER TABLE operkurs
ADD CONSTRAINT pk_operkurs PRIMARY KEY (val_kod, dat)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE TABLE org_prav
    (id                             NUMBER(10) NOT NULL,
    name                           VARCHAR2(60))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE org_prav
ADD CONSTRAINT pk_org_prav PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER inc_org_prav
BEFORE INSERT 
ON org_prav
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare nw integer;
begin
 select tr_seg_ORG_PRAV.nextval into nw from dual;
 :new.id:=nw;
end Inc_ORG_PRAV;
/
CREATE OR REPLACE TRIGGER sba_org_prav_delete
BEFORE  DELETE 
ON org_prav
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('RefEdit','delete');  --adm
 SB_ACA.CheckObjectAccess('CUSTOMERS','delete');  --adm
 SB_ACA.CheckObjectAccess('CUSTOMERS','update');  --adm
end;
/
CREATE OR REPLACE TRIGGER sba_org_prav_insert
BEFORE INSERT 
ON org_prav
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('RefEdit','insert');  --adm
 end org_prav_insert;
/
CREATE OR REPLACE TRIGGER sba_org_prav_update
BEFORE UPDATE 
ON org_prav
REFERENCING NEW AS NEW OLD AS OLD
begin
  SB_ACA.CheckObjectAccess('RefEdit','update');  --adm
end;
/
CREATE TABLE otrasli
    (id                             NUMBER(10) NOT NULL,
    name                           VARCHAR2(90))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE otrasli
ADD CONSTRAINT pk_otrasli PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER sba_otrasli_update
BEFORE UPDATE 
ON otrasli
REFERENCING NEW AS NEW OLD AS OLD
begin
  SB_ACA.CheckObjectAccess('RefEdit','update');  --adm
end;
/
CREATE OR REPLACE TRIGGER sba_otrasli_delete
BEFORE  DELETE 
ON otrasli
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('RefEdit','delete');  --adm
 SB_ACA.CheckObjectAccess('CUSTOMERS','delete');  --adm
 SB_ACA.CheckObjectAccess('CUSTOMERS','update');  --adm
end;
/
CREATE OR REPLACE TRIGGER sba_otrasli_insert
BEFORE INSERT 
ON otrasli
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('RefEdit','insert');  --adm
 end otrasli_insert;
/
CREATE OR REPLACE TRIGGER inc_otrasli
BEFORE INSERT 
ON otrasli
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare nw integer;
begin
 select tr_seg_OTRASLI.nextval into nw from dual;
 :new.id:=nw;
end Inc_OTRASLI;
/
CREATE TABLE payment
    (op_id                          NUMBER,
    date_of_payment                DATE,
    currencyid                     NUMBER,
    currency                       VARCHAR2(3),
    packagenumber                  NUMBER,
    d_code_of_bank                 VARCHAR2(255),
    d_name_of_bank                 VARCHAR2(255),
    d_tax_id                       VARCHAR2(9),
    d_account_id                   NUMBER,
    d_account                      VARCHAR2(255),
    d_account_name                 VARCHAR2(255),
    d_client_tax_id                VARCHAR2(9),
    c_id_bankm                     NUMBER,
    c_code_of_bank                 VARCHAR2(255),
    c_name_of_bank                 VARCHAR2(255),
    c_tax_id                       VARCHAR2(9),
    c_cor_account                  VARCHAR2(255),
    c_swift                        VARCHAR2(255),
    c_account                      VARCHAR2(255),
    c_account_name                 VARCHAR2(255),
    c_client_tax_id                VARCHAR2(255),
    ammount_in_words               VARCHAR2(255),
    ammount_in_number              NUMBER,
    main_desc                      VARCHAR2(255),
    additional_desc                VARCHAR2(255),
    id                             NUMBER,
    d_cor_account                  VARCHAR2(255),
    d_swift                        VARCHAR2(255),
    document_number                NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE OR REPLACE TRIGGER tr_payment
BEFORE INSERT 
ON payment
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare nw integer;
begin
 select SEQ_PAYMENT.nextval into nw from dual;
 :new.id:=nw;
end TR_PAYMENT;
/
CREATE TABLE paymentdecree
    (id                             NUMBER NOT NULL,
    pdate                          DATE,
    pnum                           NUMBER,
    dbname                         VARCHAR2(300),
    dbcod                          VARCHAR2(15),
    dbinn                          VARCHAR2(15),
    dbcoracc                       VARCHAR2(20),
    dbswift                        VARCHAR2(15),
    dacc_no                        VARCHAR2(50),
    daccname                       VARCHAR2(300),
    daccinn                        VARCHAR2(15),
    kbname                         VARCHAR2(200),
    kbcod                          VARCHAR2(15),
    kbinn                          VARCHAR2(15),
    kbcoracc                       VARCHAR2(20),
    kbswift                        VARCHAR2(15),
    kacc_no                        VARCHAR2(50),
    kaccname                       VARCHAR2(300),
    kaccinn                        VARCHAR2(15),
    ammount                        VARCHAR2(25),
    assignment                     VARCHAR2(500),
    extra                          VARCHAR2(500),
    sid#                           NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE paymentdecree
ADD CONSTRAINT pk_paymentdecree PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER inc_paymentdecree
BEFORE INSERT 
ON paymentdecree
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare nw integer;
begin
 select tr_seg_paymentdecree.nextval into nw from dual;
 :new.id:=nw;
end inc_paymentdecree;
/
CREATE OR REPLACE TRIGGER trg_paymentdecree
BEFORE INSERT 
ON paymentdecree
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare nw integer;
begin
 select seq_paymentdecree.NEXTVAL into nw from dual;
 :new.id:=nw;
 :new.sid# := uid;
end;
/
CREATE TABLE plan_table
    (statement_id                   VARCHAR2(30),
    timestamp                      DATE,
    remarks                        VARCHAR2(80),
    operation                      VARCHAR2(30),
    options                        VARCHAR2(30),
    object_node                    VARCHAR2(128),
    object_owner                   VARCHAR2(30),
    object_name                    VARCHAR2(30),
    object_instance                NUMBER,
    object_type                    VARCHAR2(30),
    optimizer                      VARCHAR2(255),
    search_columns                 NUMBER,
    id                             NUMBER,
    parent_id                      NUMBER,
    position                       NUMBER,
    cost                           NUMBER,
    cardinality                    NUMBER,
    bytes                          NUMBER,
    other_tag                      VARCHAR2(255),
    other                          LONG)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE ppp
    (id                             NUMBER,
    op_id                          NUMBER,
    no_prov                        VARCHAR2(8),
    dat                            DATE,
    debt                           NUMBER,
    kredit                         NUMBER,
    val_acc                        NUMBER,
    vid_op                         NUMBER,
    ammount                        NUMBER,
    lammount                       NUMBER,
    tim                            DATE,
    shifr                          NUMBER,
    no_pack                        NUMBER,
    kassa_b                        NUMBER,
    kassa_z                        NUMBER,
    no_filial                      NUMBER,
    sloj_prov                      NUMBER,
    bank_d                         NUMBER,
    bank_k                         NUMBER,
    no_doc                         NUMBER,
    no_mem                         NUMBER,
    d1                             VARCHAR2(20),
    k1                             VARCHAR2(20),
    rate_d                         NUMBER,
    rate_c                         NUMBER,
    parentid                       NUMBER,
    currencyid_c                   NUMBER,
    ammount_c                      NUMBER,
    name                           VARCHAR2(255))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE prinad
    (id                             NUMBER(10) NOT NULL,
    name                           VARCHAR2(90))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE prinad
ADD CONSTRAINT pk_ptinad PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER sba_prinad_insert
BEFORE INSERT 
ON prinad
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('RefEdit','insert');  --adm
 end prinad_insert;
/
CREATE OR REPLACE TRIGGER sba_prinad_delete
BEFORE  DELETE 
ON prinad
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('RefEdit','delete');  --adm
 SB_ACA.CheckObjectAccess('CUSTOMERS','delete');  --adm
 SB_ACA.CheckObjectAccess('CUSTOMERS','update');  --adm
end;
/
CREATE OR REPLACE TRIGGER sba_prinad_update
BEFORE UPDATE 
ON prinad
REFERENCING NEW AS NEW OLD AS OLD
begin
  SB_ACA.CheckObjectAccess('RefEdit','update');  --adm
end;
/
CREATE OR REPLACE TRIGGER inc_prinad
BEFORE INSERT 
ON prinad
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare nw integer;
begin
 select tr_seg_PRINAD.nextval into nw from dual;
 :new.id:=nw;
end PRINAD;
/
CREATE TABLE pro
    (id                             NUMBER(10) NOT NULL,
    op_id                          NUMBER(10),
    no_prov                        VARCHAR2(8),
    dat                            DATE,
    debt                           NUMBER(10),
    kredit                         NUMBER(10),
    val_acc                        NUMBER(10),
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
    parentid                       NUMBER,
    currencyid_c                   NUMBER(4),
    ammount_c                      NUMBER(15,2),
    name                           VARCHAR2(255))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE proc
    (id                             NUMBER(10) NOT NULL,
    op_id                          NUMBER(10),
    no_prov                        VARCHAR2(8),
    dat                            DATE,
    debt                           NUMBER(10),
    kredit                         NUMBER(10),
    val_acc                        NUMBER(10),
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
    parentid                       NUMBER,
    currencyid_c                   NUMBER(4),
    ammount_c                      NUMBER(15,2),
    name                           VARCHAR2(255))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE pror
    (id                             NUMBER(10) NOT NULL,
    no_prov                        VARCHAR2(8),
    dat                            DATE,
    debt                           NUMBER(10),
    kredit                         NUMBER(10),
    val_acc                        NUMBER(10),
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
    parentid                       NUMBER,
    currencyid_c                   NUMBER(4),
    ammount_c                      NUMBER(15,2),
    name                           VARCHAR2(255),
    op_id                          NUMBER(10))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE prov
    (id                             NUMBER(10),
    op_id                          NUMBER(10),
    id_op                          NUMBER(10),
    no_prov                        VARCHAR2(8),
    no_op                          NUMBER,
    dat                            DATE,
    debt                           NUMBER(10),
    kredit                         VARCHAR2(20),
    kred_name                      VARCHAR2(90),
    kred_inn                       NUMBER(10),
    val_acc                        NUMBER(10),
    vid_op                         NUMBER(5),
    sum                            NUMBER,
    pok_sum                        NUMBER,
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
    propis                         VARCHAR2(200),
    ok                             NUMBER(10),
    ok_nb                          CHAR(1),
    ok_bal                         CHAR(1),
    debtacc                        VARCHAR2(20),
    debtinn                        VARCHAR2(20),
    bank_k_name                    VARCHAR2(255),
    bank_k_inn                     VARCHAR2(255),
    bank_k_krno                    VARCHAR2(255),
    bank_k_swift                   VARCHAR2(255),
    debetname                      VARCHAR2(255),
    name                           VARCHAR2(255),
    additionalname                 VARCHAR2(220))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE UNIQUE INDEX prov0 ON prov
  (
    id                              ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE INDEX kredit ON prov
  (
    kredit                          ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE INDEX debt ON prov
  (
    debt                            ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE INDEX val ON prov
  (
    val_acc                         ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE INDEX dat ON prov
  (
    dat                             ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE INDEX no_prov ON prov
  (
    no_prov                         ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/

CREATE OR REPLACE TRIGGER inc_prov
BEFORE INSERT 
ON prov
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare nw integer;
begin
 select tr_seg_PROV.nextval into nw from dual;
 :new.id:=nw;
end inc_prov;
/
CREATE TABLE provarch
    (id                             NUMBER(10) NOT NULL,
    op_id                          NUMBER(10),
    no_prov                        VARCHAR2(8),
    dat                            DATE NOT NULL,
    debt                           NUMBER(10) NOT NULL,
    kredit                         NUMBER(10) NOT NULL,
    val_acc                        NUMBER(10) DEFAULT 0 NOT NULL,
    vid_op                         NUMBER(5),
    ammount                        NUMBER(15,2) NOT NULL,
    lammount                       NUMBER(15,2) NOT NULL,
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
    rate_d                         NUMBER(18,4),
    rate_c                         NUMBER(18,4),
    parentid                       NUMBER DEFAULT NULL,
    currencyid_c                   NUMBER(4) DEFAULT 0 NOT NULL,
    ammount_c                      NUMBER(15,2) NOT NULL,
    name                           VARCHAR2(255),
    commit_opid                    NUMBER(22))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  PARTITION BY RANGE (SHIFR)
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
CREATE INDEX idx_provarch_dat ON provarch
  (
    dat                             ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE INDEX idx_provarch_debitid ON provarch
  (
    debt                            ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE INDEX idx_provarch_creditid ON provarch
  (
    kredit                          ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/

ALTER TABLE provarch
ADD CONSTRAINT pk_provarch PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER tr_provarch_opid
BEFORE INSERT 
ON provarch
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
 :new.commit_opid := sblogin.UserID;
 if :new.OP_ID is null then
  :new.OP_ID := sblogin.UserID;
 end if;
end;
/
CREATE TABLE qrp_klie
    (id                             NUMBER(10) NOT NULL,
    name                           VARCHAR2(90))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE qrp_klie
ADD CONSTRAINT pk_qrp_klie PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER sba_qrp_klie_insert
BEFORE INSERT 
ON qrp_klie
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('RefEdit','insert');  --adm
 end qrp_klie_insert;
/
CREATE OR REPLACE TRIGGER sba_qrp_klie_update
BEFORE UPDATE 
ON qrp_klie
REFERENCING NEW AS NEW OLD AS OLD
begin
  SB_ACA.CheckObjectAccess('RefEdit','update');  --adm
end;
/
CREATE OR REPLACE TRIGGER inc_qrp_klie
BEFORE INSERT 
ON qrp_klie
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare nw integer;
begin
 select tr_seg_QRP_KLIE.nextval into nw from dual;
 :new.id:=nw;
end QRP_KLIE;
/
CREATE OR REPLACE TRIGGER sba_qrp_klie_delete
BEFORE  DELETE 
ON qrp_klie
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('RefEdit','delete');  --adm
 SB_ACA.CheckObjectAccess('Tuningtransactions','delete');  --adm
 SB_ACA.CheckObjectAccess('Tuningtransactions','update');  --adm
end;
/
CREATE TABLE quest_com_product_privs
    (product_id                     NUMBER NOT NULL,
    privilege_id                   VARCHAR2(60) NOT NULL,
    privilege_description          VARCHAR2(256) NOT NULL,
    validation_routine             VARCHAR2(2000),
    privilege_level                VARCHAR2(256))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE quest_com_product_privs
ADD CONSTRAINT quest_com_product_privs_pk PRIMARY KEY (product_id, privilege_id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE TABLE quest_com_products
    (product_id                     NUMBER NOT NULL,
    product_name                   VARCHAR2(30) NOT NULL,
    product_prefix                 VARCHAR2(8) NOT NULL,
    install_user                   VARCHAR2(30) NOT NULL,
    grant_procedure                VARCHAR2(2000),
    revoke_procedure               VARCHAR2(2000),
    product_version                VARCHAR2(20),
    deinstall_script               LONG,
    grant_priv_procedure           VARCHAR2(2000),
    revoke_priv_procedure          VARCHAR2(2000),
    installed_by                   VARCHAR2(30),
    product_schema_version         VARCHAR2(20),
    product_base_version           VARCHAR2(20),
    stand_alone_product_flag       VARCHAR2(1))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE quest_com_products
ADD CONSTRAINT quest_com_prducts_u2 UNIQUE (product_prefix)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
ALTER TABLE quest_com_products
ADD CONSTRAINT quest_com_products_pk PRIMARY KEY (product_id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
ALTER TABLE quest_com_products
ADD CONSTRAINT quest_com_product_u1 UNIQUE (product_name)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE TABLE quest_com_products_used_by
    (product_id                     NUMBER NOT NULL,
    used_by_product_id             NUMBER NOT NULL,
    product_version                VARCHAR2(20))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE quest_com_products_used_by
ADD CONSTRAINT quest_com_products_used_by_pk PRIMARY KEY (product_id, 
  used_by_product_id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE TABLE quest_com_user_privileges
    (product_id                     NUMBER NOT NULL,
    user_id                        NUMBER NOT NULL,
    privilege_id                   VARCHAR2(60) NOT NULL,
    privilege_level                VARCHAR2(2000))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE quest_com_user_privileges
ADD CONSTRAINT quest_com_user_priv_pk PRIMARY KEY (product_id, user_id, 
  privilege_id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE TABLE quest_com_users
    (user_id                        NUMBER NOT NULL,
    product_id                     NUMBER NOT NULL,
    authorization_level            VARCHAR2(60),
    install_user                   VARCHAR2(30))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE quest_com_users
ADD CONSTRAINT quest_com_users_pk PRIMARY KEY (user_id, product_id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE TABLE quest_soo_buffer_busy
    (timestamp                      DATE,
    p1                             NUMBER,
    p2                             NUMBER,
    p3                             NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE quest_soo_event_categories
    (name                           VARCHAR2(64),
    category                       VARCHAR2(40))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE quest_soo_lock_tree
    (user_audsid                    NUMBER,
    sequence_id                    NUMBER,
    tree_depth                     NUMBER,
    sid                            NUMBER,
    serial                         NUMBER,
    username                       VARCHAR2(30),
    pid                            VARCHAR2(16),
    lock_type                      VARCHAR2(90),
    request_mode                   VARCHAR2(30),
    object_name                    VARCHAR2(61))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE quest_soo_monitor_version
    (monitor_version_string         VARCHAR2(20),
    oracle_version_string          VARCHAR2(16))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE quest_soo_plan_table
    (statement_id                   VARCHAR2(60),
    timestamp                      DATE,
    remarks                        VARCHAR2(2000),
    operation                      VARCHAR2(30),
    options                        VARCHAR2(30),
    object_node                    VARCHAR2(128),
    object_owner                   VARCHAR2(30),
    object_name                    VARCHAR2(30),
    object_instance                NUMBER,
    object_type                    VARCHAR2(30),
    search_columns                 NUMBER,
    id                             NUMBER,
    parent_id                      NUMBER,
    position                       NUMBER,
    other                          LONG,
    collector                      VARCHAR2(31),
    address                        VARCHAR2(16),
    hash_value                     NUMBER,
    optimizer                      VARCHAR2(255),
    cost                           NUMBER,
    cardinality                    NUMBER,
    bytes                          NUMBER,
    other_tag                      VARCHAR2(255),
    partition_start                VARCHAR2(255),
    partition_stop                 VARCHAR2(255),
    partition_id                   NUMBER,
    join_text                      VARCHAR2(1000),
    filter_text                    VARCHAR2(1000),
    view_text                      VARCHAR2(1000))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE rep_titles
    (titlegroup                     VARCHAR2(16),
    titlename                      VARCHAR2(32),
    titledescription               VARCHAR2(256),
    personname                     VARCHAR2(256))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE repaired_wares
    (id                             NUMBER,
    groupsid                       NUMBER,
    repair_num                     NUMBER,
    repair_summa                   NUMBER,
    repair_date                    DATE)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE TABLE report_symbol
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(256) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER report_symbol_id_gen
BEFORE INSERT 
ON report_symbol
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
    select TR_SEG_REPORT_SYMBOL.nextval
    into :new.ID
    from dual;
end;
/
CREATE OR REPLACE TRIGGER sba_report_symbol_update
BEFORE UPDATE 
ON report_symbol
REFERENCING NEW AS NEW OLD AS OLD
begin
  SB_ACA.CheckObjectAccess('RefEdit','update');  --adm
end;
/
CREATE OR REPLACE TRIGGER sba_report_symbol_insert
BEFORE INSERT 
ON report_symbol
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('RefEdit','insert');  --adm
 end report_symbol_insert;
/
CREATE OR REPLACE TRIGGER sba_report_symbol_delete
BEFORE  DELETE 
ON report_symbol
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('RefEdit','delete');  --adm
 SB_ACA.CheckObjectAccess('CUSTOMERS','delete');  --adm
 SB_ACA.CheckObjectAccess('CUSTOMERS','update');  --adm
end;
/
CREATE TABLE reserve
    (id                             NUMBER(10) NOT NULL,
    op_id                          NUMBER(10),
    no_prov                        VARCHAR2(8),
    dat                            DATE,
    debt                           NUMBER(10),
    kredit                         NUMBER(10),
    val_acc                        NUMBER(10),
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
    parentid                       NUMBER(5),
    currencyid_c                   NUMBER(4),
    ammount_c                      NUMBER(15,2),
    name                           VARCHAR2(255),
    temptrid                       NUMBER,
    rejectreason                   VARCHAR2(255),
    rejected                       NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE reservewares
    (id                             NUMBER NOT NULL,
    groupsid                       NUMBER NOT NULL,
    name                           VARCHAR2(90),
    inventar                       VARCHAR2(20),
    inventar_date                  DATE,
    first_price                    NUMBER(20,2),
    balance_price                  NUMBER(15,2),
    in_date                        DATE,
    in_num                         NUMBER,
    amort                          NUMBER,
    producer_plane                 VARCHAR2(500),
    fxm                            NUMBER,
    sector_cod                     NUMBER,
    close_format                   NUMBER,
    remainder                      NUMBER(15,2),
    allamort                       NUMBER(20,2),
    taxamort                       NUMBER(15,2),
    alltaxamort                    NUMBER(20,2),
    amort_date                     DATE,
    tax                            NUMBER,
    taxpercentprice                NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE sb_errors
    (id                             NUMBER NOT NULL,
    text                           VARCHAR2(256))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE sb_errors
ADD CONSTRAINT pk_sb_errors PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE TABLE sb_messages
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(64) NOT NULL,
    text                           VARCHAR2(1024))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE TABLE sb_queries
    (description                    VARCHAR2(128),
    query                          VARCHAR2(4000))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE TABLE sb_withdraw
    (id                             NUMBER,
    debtid                         NUMBER,
    debt                           VARCHAR2(30),
    debtname                       VARCHAR2(100),
    creditid                       NUMBER,
    credit                         VARCHAR2(30),
    creditname                     VARCHAR2(100),
    amount                         NUMBER(20,2),
    amount_word                    VARCHAR2(200),
    name                           VARCHAR2(200),
    extra                          VARCHAR2(200),
    hdate                          DATE,
    currencyid                     NUMBER,
    currencyname                   VARCHAR2(30),
    passer                         VARCHAR2(20),
    pasnum                         VARCHAR2(20),
    pasplace                       VARCHAR2(200),
    pasdate                        DATE)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE OR REPLACE TRIGGER trg_sb_withdraw
BEFORE INSERT 
ON sb_withdraw
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
 select SEQ_SB_WITHDRAW.NEXTVAL into :new.ID from dual;
end;
/
CREATE TABLE sba_advanced_grants
    (id                             NUMBER NOT NULL,
    grantname                      VARCHAR2(128) NOT NULL,
    errormessage                   VARCHAR2(128),
    moduleid                       NUMBER NOT NULL,
    description                    VARCHAR2(128) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE sba_advanced_grants
ADD CONSTRAINT sba_advanced_grants_primkey PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER sba_advanced_grants_upcase
BEFORE INSERT  OR UPDATE 
ON sba_advanced_grants
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
 :new.grantname:=Upper(:new.grantname);
end;
/
CREATE OR REPLACE TRIGGER sba_advanced_grants_id
BEFORE INSERT 
ON sba_advanced_grants
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  select SBA_ADVANCED_GRANTS_ID_GEN.NEXTVAL
   into :NEW.id
   from dual;
end;
/
CREATE TABLE sba_groupmanager
    (userid                         NUMBER NOT NULL,
    groupid                        NUMBER NOT NULL,
    type                           NUMBER(1) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE sba_grouptypes
    (id                             NUMBER NOT NULL,
    type$                          VARCHAR2(24) NOT NULL,
    descr                          VARCHAR2(128))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE sba_grouptypes
ADD CONSTRAINT sba_grouptypes_prim PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER sba_grouptypes_id_gen
BEFORE INSERT 
ON sba_grouptypes
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  select SBA_GROUPTYPES_SEC.NEXTVAL
   into :NEW.id
   from dual;
end;
/
CREATE TABLE sba_monetaryborder
    (advgrantid                     NUMBER NOT NULL,
    maxavalue                      NUMBER NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE sba_objinf
    (id                             NUMBER NOT NULL,
    type                           CHAR(1) NOT NULL,
    obj                            VARCHAR2(56) NOT NULL,
    createdate                     DATE,
    description                    VARCHAR2(96),
    fullname                       VARCHAR2(96),
    phone                          VARCHAR2(8),
    classid                        NUMBER,
    filialid                       NUMBER,
    advtype                        NUMBER,
    sysuserid                      NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE sba_objinf
ADD CONSTRAINT sba_objinf_primkey PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
ALTER TABLE sba_objinf
ADD CONSTRAINT sba_objinf_uniq UNIQUE (obj)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER sba_objinf_date
BEFORE INSERT 
ON sba_objinf
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
 :new.createdate:=sysdate;
end;
/
CREATE OR REPLACE TRIGGER sba_objinf_userid
BEFORE INSERT  OR UPDATE 
ON sba_objinf
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
DECLARE
   userid   INTEGER;
BEGIN
   IF :NEW.TYPE = 'U'
   THEN
      SELECT ID
        INTO userid
        FROM user$
       WHERE NAME = :NEW.obj;

      :NEW.sysuserid := userid;
   END IF;
END;
/
CREATE OR REPLACE TRIGGER sba_objinf_idgen
BEFORE INSERT 
ON sba_objinf
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
	select SBA_OBJINF_ID_GEN.nextval
		into :new.ID
	from dual;	
end;
/
CREATE TABLE sba_objmanager
    (id                             NUMBER NOT NULL,
    object                         VARCHAR2(96) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE sba_syndec
    (objectname                     VARCHAR2(72) NOT NULL,
    objecttype                     VARCHAR2(48))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE UNIQUE INDEX sba_syndec_index ON sba_syndec
  (
    objectname                      ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/

COMMENT ON TABLE sba_syndec IS 'Tablica soderjit imena objektov,kotoriye ignoriruyetsa vo vrema sozdaniya synonimov'
/
COMMENT ON COLUMN sba_syndec.objectname IS 'Ima objekta'
/
COMMENT ON COLUMN sba_syndec.objecttype IS 'tip obyekta n/p esli tablica to TABLE ...'
/
CREATE TABLE sba_synreplace
    (target                         VARCHAR2(100) NOT NULL,
    repobject                      VARCHAR2(100) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE sba_usergrants
    (cur_user                       VARCHAR2(72) NOT NULL,
    cur_module                     VARCHAR2(72) NOT NULL,
    can_insert                     NUMBER(1),
    can_delete                     NUMBER(1),
    can_update                     NUMBER(1))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE UNIQUE INDEX usergrants_index ON sba_usergrants
  (
    cur_user                        ASC,
    cur_module                      ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/

CREATE OR REPLACE TRIGGER sba_usergrants_uppercase
BEFORE INSERT  OR UPDATE 
ON sba_usergrants
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
 :NEW.CUR_USER:=UPPER(:NEW.CUR_USER);
 :NEW.CUR_MODULE:=UPPER(:NEW.CUR_MODULE);
end;
/
CREATE TABLE sba_usergrants_advanced
    (username                       VARCHAR2(128) NOT NULL,
    advancedgrantid                NUMBER NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE sba_usergrants_advanced
ADD CONSTRAINT sba_usergrants_advanced_prkey PRIMARY KEY (username, 
  advancedgrantid)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE TABLE sba_userman
    (muser                          NUMBER NOT NULL,
    suser                          NUMBER NOT NULL,
    ugrup                          NUMBER,
    type#                          NUMBER,
    ctype#                         NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE INDEX sba_userman_muser ON sba_userman
  (
    muser                           ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE INDEX sba_userman_suser ON sba_userman
  (
    suser                           ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/

CREATE TABLE sbcm_acc_zone_info
    (zoneid                         NUMBER(10),
    accgroup                       NUMBER(10))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
COMMENT ON TABLE sbcm_acc_zone_info IS 'tipi  scetov
'
/
CREATE TABLE sbcm_acc_zones
    (zoneid                         NUMBER(10) NOT NULL,
    name                           VARCHAR2(20),
    description                    VARCHAR2(200))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE UNIQUE INDEX sbcm_acc_zones1 ON sbcm_acc_zones
  (
    zoneid                          ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE INDEX sbcm_acc_zones_sk1 ON sbcm_acc_zones
  (
    name                            ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/

CREATE OR REPLACE TRIGGER bi_acczones
BEFORE INSERT 
ON sbcm_acc_zones
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
Declare nw Integer;
Begin
  Select SEQ_ACCZONESID.NEXTVAL
	  Into nw
		From Dual;
	:New.ZONEID :=nw;	
End  BI_ACCZONES;
/
COMMENT ON TABLE sbcm_acc_zones IS 'Balansovie scera dlya vibirki'
/
CREATE TABLE sbcm_categories
    (id                             NUMBER NOT NULL,
    category                       VARCHAR2(128),
    truecategory                   NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE sbcm_categories
ADD CONSTRAINT pk_sbcm_categories PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER bd_sbcm_categories
BEFORE  DELETE 
ON sbcm_categories
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  SBCM_Stored_Programs.DelMovieName(:Old.ID);
end;
/
CREATE OR REPLACE TRIGGER bi_sbcm_categories
BEFORE INSERT 
ON sbcm_categories
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
Declare nw Integer;
begin
  Select seg_categories.NEXTVAL Into nw
	from Dual;
	:New.ID :=nw;
	SBCM_Stored_Programs.AddMovieName(nw);
end;
/
COMMENT ON TABLE sbcm_categories IS 'Kategoriya klientov
Fiziki
....'
/
CREATE TABLE sbcm_collection
    (id                             NUMBER NOT NULL,
    id#                            NUMBER,
    hdate                          DATE,
    amount                         NUMBER(18,2),
    percent                        NUMBER(18,2))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE sbcm_collection
ADD CONSTRAINT pk_sbcm_collection_id PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
ALTER TABLE sbcm_collection
ADD CONSTRAINT uk_sbcm_collection UNIQUE (id#, hdate)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER bi_sbcm_collection
BEFORE INSERT 
ON sbcm_collection
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  Select 
    SEQ_SBCM_COLLECTION.NEXTVAL 
    Into
      :New.ID 
      From DUAL; 
end;
/
COMMENT ON TABLE sbcm_collection IS 'YIGIM'
/
CREATE TABLE sbcm_contract_accounts
    (id#                            NUMBER NOT NULL,
    contractaccid                  NUMBER NOT NULL,
    clientaccid                    NUMBER,
    reserveaccid                   NUMBER,
    interestaccid                  NUMBER,
    overdueaccid                   NUMBER,
    overdueinterestaccid           NUMBER,
    overduereserveaccid            NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE sbcm_contract_accounts
ADD CONSTRAINT pk_sbcm_contract_accounts PRIMARY KEY (id#)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
COMMENT ON COLUMN sbcm_contract_accounts.clientaccid IS 'scet  klienta'
/
COMMENT ON COLUMN sbcm_contract_accounts.contractaccid IS 'ssudniy scet (v kreditax)'
/
COMMENT ON COLUMN sbcm_contract_accounts.interestaccid IS 'scet procentov'
/
COMMENT ON COLUMN sbcm_contract_accounts.overdueaccid IS 'scet   prosrocennoqo dolqa'
/
COMMENT ON COLUMN sbcm_contract_accounts.overdueinterestaccid IS 'scet  procentov po prossrocenemu dolqu'
/
COMMENT ON COLUMN sbcm_contract_accounts.reserveaccid IS 'rezervniy scet'
/
CREATE TABLE sbcm_contract_state
    (id#                            NUMBER NOT NULL,
    facticaldebt                   NUMBER,
    overduedebt                    NUMBER,
    facticalinterestdebt           NUMBER,
    overdueinterestdebt            NUMBER,
    closedate                      DATE,
    stopcalculationdate            DATE,
    lastprocessdate                DATE,
    calculationenabled             NUMBER NOT NULL,
    reguiredamountdec              NUMBER,
    reguiredpercentdec             NUMBER,
    residuaryamount                NUMBER,
    lastfacticaldebt               NUMBER(18,2),
    lastoverduedebt                NUMBER(18,2))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE sbcm_contract_state
ADD CONSTRAINT pk_sbcm_contract_state PRIMARY KEY (id#)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
COMMENT ON TABLE sbcm_contract_state IS 'Tekuschee sostoyanie dla kontraktov (kak TENOSTAT)'
/
COMMENT ON COLUMN sbcm_contract_state.calculationenabled IS 'Flag uchastiya v pereschete'
/
COMMENT ON COLUMN sbcm_contract_state.closedate IS 'Realnaya data zakritiya'
/
COMMENT ON COLUMN sbcm_contract_state.facticaldebt IS 'Osnovnoy dolg'
/
COMMENT ON COLUMN sbcm_contract_state.facticalinterestdebt IS '% po ocnovnomu dolgu'
/
COMMENT ON COLUMN sbcm_contract_state.lastprocessdate IS 'Data posledney operacii'
/
COMMENT ON COLUMN sbcm_contract_state.overduedebt IS 'Prosrochenniy'
/
COMMENT ON COLUMN sbcm_contract_state.overdueinterestdebt IS '% po prosrochennomu'
/
COMMENT ON COLUMN sbcm_contract_state.reguiredamountdec IS 'Ayliq chixarilish'
/
COMMENT ON COLUMN sbcm_contract_state.reguiredpercentdec IS 'Faizden Chixarilish'
/
COMMENT ON COLUMN sbcm_contract_state.residuaryamount IS 'Qalmish Borc'
/
COMMENT ON COLUMN sbcm_contract_state.stopcalculationdate IS 'Data ostanovki pereschota'
/
CREATE TABLE sbcm_contract_types
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(32) NOT NULL,
    description                    VARCHAR2(128))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE sbcm_contract_types
ADD CONSTRAINT pk_sbcm_contract_types PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
ALTER TABLE sbcm_contract_types
ADD CONSTRAINT uk_sbcm_contract_types_id UNIQUE (name)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER bi_sbcm_contract_types
BEFORE INSERT 
ON sbcm_contract_types
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  select SBCM_CONTRACT_TYPES_ID_GEN.nextval
		into :new.ID
		from dual;
end;
/
COMMENT ON TABLE sbcm_contract_types IS 'No comments!'
/
CREATE TABLE sbcm_contracts
    (id                             NUMBER NOT NULL,
    type#                          NUMBER NOT NULL,
    opendate                       DATE NOT NULL,
    closedate                      DATE NOT NULL,
    amount                         NUMBER,
    contractno                     VARCHAR2(64),
    contracttype                   NUMBER(6),
    pledgetype                     NUMBER(10),
    reliabilityid                  NUMBER(6),
    clienttype                     NUMBER,
    pledgeprice                    NUMBER(16,2),
    sid#                           NUMBER,
    overduereliabilityid           NUMBER,
    branchid                       NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE sbcm_contracts
ADD CONSTRAINT pk_sbcm_contract_types_id PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
ALTER TABLE sbcm_contracts
ADD CONSTRAINT uk_sbcm_contracts UNIQUE (type#, contractno)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER bi_sbcm_contracts
BEFORE INSERT 
ON sbcm_contracts
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  Select  Seg_SbCm_Contracts.NEXTVAL  Into
	     :New.ID  From  Dual;
end;
/
CREATE OR REPLACE TRIGGER bi_sbcm_contracts_create_sid
BEFORE INSERT 
ON sbcm_contracts
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
	:new.sid# := sblogin.UserID;
end;
/
CREATE OR REPLACE TRIGGER ai_contracts
AFTER INSERT 
ON sbcm_contracts
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare

tdate date;

begin

select 
 tek_dat into tdate 
from sysdat;

insert into sbcm_deposit_interests(
           id#, 
           hdate, 
           interest, 
           overdureinterest, 
           intprecision,
           dueintprecision, 
           inttrid, 
           dueinttrid)
values (
           :new.id,
           tdate,
           0,
           0,
           0,
           0,
           null,
           null);           
           

end;
/
COMMENT ON TABLE sbcm_contracts IS 'Spisok kontraktov'
/
COMMENT ON COLUMN sbcm_contracts.amount IS 'Dogovornaya summa po kontraktu'
/
COMMENT ON COLUMN sbcm_contracts.clienttype IS '-->sbcm_categories'
/
COMMENT ON COLUMN sbcm_contracts.closedate IS '-//- zakritiya'
/
COMMENT ON COLUMN sbcm_contracts.contractno IS 'nomer ontracta'
/
COMMENT ON COLUMN sbcm_contracts.contracttype IS '---> sbcm_credittypes'
/
COMMENT ON COLUMN sbcm_contracts.opendate IS 'Data otkritiya'
/
COMMENT ON COLUMN sbcm_contracts.pledgetype IS '--->sbcm_Pledgetypes'
/
COMMENT ON COLUMN sbcm_contracts.reliabilityid IS '--->sbcm_reliability'
/
COMMENT ON COLUMN sbcm_contracts.type# IS 'Tip kontrakta: iz SBCM_CONTRACT_TYPES'
/
CREATE TABLE sbcm_credit_types
    (id                             NUMBER(6) NOT NULL,
    type                           VARCHAR2(128),
    additionaltype                 VARCHAR2(32))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER bi_sbcm_credit_types
BEFORE INSERT 
ON sbcm_credit_types
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  Select  seg_sbcm_credittypes.NEXTVAL Into
	:New.ID From Dual;
end;
/
COMMENT ON TABLE sbcm_credit_types IS 'Overdrive...'
/
CREATE TABLE sbcm_deffered_transactions
    (contractid                     NUMBER NOT NULL,
    balanceinterest                NUMBER(18,2) DEFAULT 0      NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE TABLE sbcm_deposit_interests
    (id#                            NUMBER NOT NULL,
    hdate                          DATE NOT NULL,
    interest                       NUMBER NOT NULL,
    overdureinterest               NUMBER NOT NULL,
    intprecision                   NUMBER NOT NULL,
    dueintprecision                NUMBER NOT NULL,
    inttrid                        NUMBER,
    dueinttrid                     NUMBER,
    withdrawtrid                   NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE sbcm_deposit_types
    (id                             NUMBER NOT NULL,
    type                           VARCHAR2(256) NOT NULL,
    additionaltype                 VARCHAR2(32),
    withdrawtype                   VARCHAR2(32),
    dateinterval                   NUMBER(4))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE OR REPLACE TRIGGER trg_sbcm_deposit_types
BEFORE INSERT 
ON sbcm_deposit_types
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  Select SEQ_SBCM_DEPOSIT_TYPES.NEXTVAL 
    Into  :New.ID
    From Dual;        
end;
/
CREATE TABLE sbcm_expires
    (id                             NUMBER NOT NULL,
    id#                            NUMBER NOT NULL,
    hdate                          DATE NOT NULL,
    amount                         NUMBER(15,2))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE OR REPLACE TRIGGER bi_sbcm_expires
BEFORE INSERT 
ON sbcm_expires
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  Select  SEQ_SBCM_Expires.NEXTVAL Into
	  :New.ID  From Dual;
end;
/
CREATE TABLE sbcm_interests
    (id#                            NUMBER NOT NULL,
    hdate                          DATE NOT NULL,
    interest                       NUMBER(6,2) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE sbcm_interests
ADD CONSTRAINT uk_sbcm_id_hdate UNIQUE (id#, hdate)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
COMMENT ON TABLE sbcm_interests IS 'Procenti po kontraktam'
/
COMMENT ON COLUMN sbcm_interests.hdate IS 'data  naznochenie prochentov'
/
COMMENT ON COLUMN sbcm_interests.interest IS 'Procenti po kontraktam'
/
CREATE TABLE sbcm_movie_names
    (id                             NUMBER(6) NOT NULL,
    typeid                         NUMBER(6) NOT NULL,
    name                           VARCHAR2(64) NOT NULL,
    description                    VARCHAR2(128))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE sbcm_movie_names
ADD CONSTRAINT pk_movie_names PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER inc_sbcm_movie_names
BEFORE INSERT 
ON sbcm_movie_names
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare nw integer;
begin
 select seg_sbcm_movie_names.nextval into nw from dual;
 :new.id:=nw;
end inc_sbcm_movie_names;
/
COMMENT ON COLUMN sbcm_movie_names.description IS 'Imya'
/
COMMENT ON COLUMN sbcm_movie_names.id IS 'ID'
/
COMMENT ON COLUMN sbcm_movie_names.name IS 'Naznachenie'
/
COMMENT ON COLUMN sbcm_movie_names.typeid IS '-> na sbcm_clientCategories'
/
CREATE TABLE sbcm_overdueinterests
    (id#                            NUMBER NOT NULL,
    hdate                          DATE NOT NULL,
    overdueinterest                NUMBER(6,2) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE sbcm_overdueinterests
ADD CONSTRAINT uk_sbcm_overdueinterest UNIQUE (id#, hdate)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
COMMENT ON TABLE sbcm_overdueinterests IS 'procenti po prosrocennemu dolqu!'
/
COMMENT ON COLUMN sbcm_overdueinterests.overdueinterest IS 'procenti po prosrocennemu dolqu!UDALI  3 iz LENGTHA'
/
CREATE TABLE sbcm_payments
    (id                             NUMBER NOT NULL,
    id#                            NUMBER NOT NULL,
    hdate                          DATE NOT NULL,
    facticaldebt                   NUMBER(15,2),
    interestdebt                   NUMBER(15,2),
    overduedebt                    NUMBER(15,2),
    overdueinterestdebt            NUMBER(15,2))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE sbcm_payments
ADD CONSTRAINT pk_sbcm_payments PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER bi_sbcm_payments
BEFORE INSERT 
ON sbcm_payments
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  Select
	    SEQ_SBCM_PAYMENTS.NEXTVAL
			Into  :New.ID From Dual;
end;
/
COMMENT ON COLUMN sbcm_payments.facticaldebt IS 'Poqoshenie s: Osnovnoqo  Dolqa'
/
COMMENT ON COLUMN sbcm_payments.id IS 'SELF  ID'
/
COMMENT ON COLUMN sbcm_payments.id# IS 'ID Contracta'
/
CREATE TABLE sbcm_payments_plane
    (id                             NUMBER NOT NULL,
    id#                            NUMBER NOT NULL,
    hdate                          DATE NOT NULL,
    facticaldebtpayment            NUMBER(18,2) DEFAULT 0    NOT NULL,
    interestdebtpayment            NUMBER(18,2) DEFAULT 0    NOT NULL,
    paid                           CHAR(1))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE sbcm_payments_plane
ADD CONSTRAINT uk_payments_plane UNIQUE (id#, hdate)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER bi_sbcm_payments_plane
BEFORE INSERT 
ON sbcm_payments_plane
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  select 
    SEQ_SBCM_PAYMENTS_PLANE.NEXTVAL 
  into
    :New.ID
  from 
    DUAL;  
end;
/
COMMENT ON COLUMN sbcm_payments_plane.hdate IS 'Payment Date'
/
COMMENT ON COLUMN sbcm_payments_plane.id# IS 'Contract ID#'
/
CREATE TABLE sbcm_pledgetypes
    (id                             NUMBER(10) NOT NULL,
    type                           VARCHAR2(32))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER bi_sbcm_pledgetypes
BEFORE INSERT 
ON sbcm_pledgetypes
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare  nw Integer;
begin
  Select seg_pledgerypes.NEXTVAL Into
	nw From  Dual;
	:New.ID :=nw;
end;
/
CREATE TABLE sbcm_prolongations
    (id                             NUMBER NOT NULL,
    id#                            NUMBER NOT NULL,
    hdate                          DATE NOT NULL,
    olddate                        DATE NOT NULL,
    newdate                        DATE NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE OR REPLACE TRIGGER bi_sbcm_prolongations
BEFORE INSERT 
ON sbcm_prolongations
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  Select
	     SEQ_SBCM_PROLONGATIONS.NEXTVAL
			  Into  :New.ID From Dual;
end;
/
COMMENT ON COLUMN sbcm_prolongations.id IS 'Self ID'
/
COMMENT ON COLUMN sbcm_prolongations.id# IS 'Contract ID'
/
CREATE TABLE sbcm_references
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(64),
    lname                          VARCHAR2(128),
    parentid                       NUMBER NOT NULL,
    value                          VARCHAR2(556),
    sourcelist                     VARCHAR2(2048))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE OR REPLACE TRIGGER bi_sbcm_references
BEFORE INSERT 
ON sbcm_references
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
Declare 
  NewValue Integer;
Begin
  Select
	    SEQ_SBCMREFERENCES.NEXTVAL
		Into NewValue
		From Dual;				 
	:New.ID :=NewValue;	 	
End BI_sbcm_references;
/
COMMENT ON TABLE sbcm_references IS 'Tablica dlya postroenie dereva nastroek'
/
CREATE TABLE sbcm_reliability
    (id                             NUMBER(4) NOT NULL,
    reliability                    VARCHAR2(132) NOT NULL,
    percent                        NUMBER(3) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE sbcm_reliability
ADD CONSTRAINT pk_reliability PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER bi_sbcm_reliability
BEFORE INSERT 
ON sbcm_reliability
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  Select  Seg_SbCm_Reliability.NEXTVAL  
	     Into  :New.ID
			 From   Dual;
end;
/
COMMENT ON COLUMN sbcm_reliability.percent IS 'pracent'
/
COMMENT ON COLUMN sbcm_reliability.reliability IS 'Nadyojnost kontrakta'
/
CREATE TABLE sbcm_reserve_corrector
    (profitaccid                    NUMBER NOT NULL,
    expenceaccid                   NUMBER NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE sbcm_settings
    (id                             NUMBER NOT NULL,
    parentid                       NUMBER NOT NULL,
    currencyid                     NUMBER NOT NULL,
    accid                          NUMBER NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE sbcm_settings
ADD CONSTRAINT uk_sbcmsettings UNIQUE (parentid, currencyid, accid)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER biud_sbcm_restrict
BEFORE INSERT  OR UPDATE  OR  DELETE 
ON sbcm_settings
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  if USER <> 'SMART' then
    raise_application_error(-20001,'Only Database Administrator have privileges to change settings');
  end if;
end;
/
CREATE OR REPLACE TRIGGER bi_sbcm_settings
BEFORE INSERT 
ON sbcm_settings
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  Select SEG_SBCM_SETTINGS.NEXTVAL  Into
	      :New.ID From Dual;
end;
/
COMMENT ON COLUMN sbcm_settings.parentid IS '--> na movienames'
/
CREATE TABLE sbcm_state_cache
    (id#                            NUMBER NOT NULL,
    facticalinterest               NUMBER,
    overdueinterest                NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE sbcm_state_cache
ADD CONSTRAINT pk_sbcm_state_cache_id PRIMARY KEY (id#)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
COMMENT ON COLUMN sbcm_state_cache.facticalinterest IS 'Procenti po osnovnomu dolqu'
/
COMMENT ON COLUMN sbcm_state_cache.overdueinterest IS 'Procenti po prosrocennomu dolqu'
/
CREATE TABLE sbcm_state_history
    (id                             NUMBER NOT NULL,
    id#                            NUMBER NOT NULL,
    hdate                          DATE NOT NULL,
    primaryreservepercent          NUMBER,
    overduereservepercent          NUMBER,
    primarydebtrest                NUMBER(18,2),
    primarypercentrest             NUMBER(16,2),
    overduedebtrest                NUMBER(18,2),
    overduepercentrest             NUMBER(16,2))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE sbcm_state_history
ADD CONSTRAINT uk_sbcm_contracts__id UNIQUE (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
DISABLE
/
ALTER TABLE sbcm_state_history
ADD CONSTRAINT uk_sbcm_state_history_id#date UNIQUE (id#, hdate)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER bi_sbcm_state_history
BEFORE INSERT 
ON sbcm_state_history
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
 select seq_sbcm_state_history.NextVal Into :New.ID from DUAL;
end;
/
CREATE TABLE sbcm_tranches
    (id                             NUMBER NOT NULL,
    id#                            NUMBER NOT NULL,
    hdate                          DATE NOT NULL,
    total                          NUMBER(15,2),
    reserve                        NUMBER(15,2))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE sbcm_tranches
ADD CONSTRAINT pk_sbcm_tranches PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER bi_sbcm_tranches
BEFORE INSERT 
ON sbcm_tranches
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  Select  SEQ_SBCM_TRANCHES.NEXTVAL 
	     Into  :New.ID From  Dual;
end;
/
COMMENT ON COLUMN sbcm_tranches.hdate IS 'Tranch Date'
/
COMMENT ON COLUMN sbcm_tranches.id IS 'Self ID'
/
COMMENT ON COLUMN sbcm_tranches.id# IS 'Contract ID'
/
COMMENT ON COLUMN sbcm_tranches.total IS 'Ammount'
/
CREATE TABLE sbcm_truecategories
    (categoryid                     NUMBER,
    name                           VARCHAR2(32),
    description                    VARCHAR2(64))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE TABLE security_access$
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(32) NOT NULL,
    description                    VARCHAR2(256) NOT NULL,
    parentid                       NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE security_access$
ADD CONSTRAINT pk_access$ PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER bi_security_access
BEFORE INSERT 
ON security_access$
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
	select security_access_id_gen.nextval
		into :new.ID
	from dual;
end;
/
COMMENT ON COLUMN security_access$.description IS 'Name for display to user'
/
COMMENT ON COLUMN security_access$.id IS 'Access identifier'
/
COMMENT ON COLUMN security_access$.name IS 'Canonical name of access role'
/
CREATE TABLE security_clients$
    (id                             NUMBER NOT NULL,
    type#                          NUMBER,
    sysid                          NUMBER,
    name                           VARCHAR2(32),
    group#                         NUMBER,
    flags                          NUMBER,
    create_date                    DATE DEFAULT sysdate

 ,
    created_by_user                NUMBER DEFAULT NULL

 ,
    sid#                           NUMBER,
    description                    VARCHAR2(64),
    filialid                       NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE security_clients$
ADD CONSTRAINT pk_security_clients$ PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
ALTER TABLE security_clients$
ADD CONSTRAINT uk_security_clients_name UNIQUE (name)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
ALTER TABLE security_clients$
ADD CONSTRAINT uk_security_clients_sysid UNIQUE (sysid)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER ai_security_clients$
AFTER INSERT 
ON security_clients$
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
	update SECURITY_CLIENTS$
	set
		Name = UPPER(:new.Name)
	where
	  ID = :new.ID; 
end;
/
CREATE OR REPLACE TRIGGER before_inc_security_clients
BEFORE INSERT 
ON security_clients$
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  select security_clients_id_gen.nextval
  into :new.ID
  from dual;
end;
/
COMMENT ON COLUMN security_clients$.flags IS '1 - Built-in group (for example "Everyone")'
/
COMMENT ON COLUMN security_clients$.sid# IS 'User rights'
/
CREATE TABLE security_default_access
    (link#                          NUMBER,
    access#                        NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
COMMENT ON TABLE security_default_access IS 'default security

users'
/
CREATE TABLE security_default_user
    (objtype#                       NUMBER NOT NULL,
    client#                        NUMBER NOT NULL,
    id                             NUMBER NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE security_default_user
ADD CONSTRAINT pk_security_defaul_user PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER bi_security_default_user
BEFORE INSERT 
ON security_default_user
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  select security_default_user_id_gen.nextval
  into :new.ID
  from dual;
end;
/
COMMENT ON TABLE security_default_user IS 'default security

users'
/
CREATE TABLE security_group_membership
    (client#                        NUMBER,
    group#                         NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE security_group_roles
    (groupid                        NUMBER,
    roleid                         NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
COMMENT ON TABLE security_group_roles IS 'Roles, that should be granted to user when it included in SmartBank group'
/
COMMENT ON COLUMN security_group_roles.groupid IS 'security_clients$.ID'
/
COMMENT ON COLUMN security_group_roles.roleid IS 'sys.user$.user#'
/
CREATE TABLE security_object_type
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(32),
    displayname                    VARCHAR2(64))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE security_object_type
ADD CONSTRAINT pk_security_object_type PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER tr_security_object_type
BEFORE INSERT 
ON security_object_type
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  select security_object_type_id_gen.nextval
  into :new.ID
  from dual;
end;
/
CREATE TABLE security_profile_tasks
    (profile#                       NUMBER NOT NULL,
    task#                          NUMBER NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE security_profiles
    (id                             NUMBER,
    name                           VARCHAR2(32),
    description                    VARCHAR2(256))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE security_sid$
    (id                             NUMBER NOT NULL,
    user#                          NUMBER,
    group#                         NUMBER,
    type#                          NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE security_sid$
ADD CONSTRAINT pk_sid#_id PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER bi_security_sid
BEFORE INSERT 
ON security_sid$
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
	select security_sid_id_gen.nextval
		into :new.ID
	from dual;
end;
/
CREATE TABLE security_sid_client_link
    (id                             NUMBER NOT NULL,
    sid#                           NUMBER,
    client#                        NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE security_sid_client_link
ADD CONSTRAINT pk_sid_client_link PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
ALTER TABLE security_sid_client_link
ADD CONSTRAINT uk_sid_client UNIQUE (sid#, client#)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER bi_security_sid_client_link
BEFORE INSERT 
ON security_sid_client_link
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
	select seg_security_sid_client_link.nextval
		into :new.ID
	from dual;
end;
/
CREATE TABLE security_sid_link_access
    (id                             NUMBER NOT NULL,
    link#                          NUMBER,
    access#                        NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE security_sid_link_access
ADD CONSTRAINT pk_sid_link_access PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
ALTER TABLE security_sid_link_access
ADD CONSTRAINT uk_sid_link_access UNIQUE (link#, access#)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER bi_security_sid_links_access
BEFORE INSERT 
ON security_sid_link_access
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
	select seq_SECURITY_SID_LINKS_ACCESS.nextval
	into :new.ID
	from dual;
end;
/
CREATE TABLE security_sid_to_access$
    (sid$                           NUMBER NOT NULL,
    access$                        NUMBER NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
COMMENT ON TABLE security_sid_to_access$ IS 'Link between SID$ & ACCESS$

????????? ??????-??-??????'
/
COMMENT ON COLUMN security_sid_to_access$.access$ IS 'Access identifier (from ACCESS$)'
/
COMMENT ON COLUMN security_sid_to_access$.sid$ IS 'Security identifier (from SID$)'
/
CREATE TABLE security_typed_access
    (type#                          NUMBER,
    access#                        NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE setexchange
    (nat_balance                    NUMBER,
    for_balance                    NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE OR REPLACE TRIGGER sba_setexchange_delete
BEFORE  DELETE 
ON setexchange
REFERENCING NEW AS NEW OLD AS OLD
begin
     SB_ACA.CheckObjectAccess('EXCHANGE','delete');  --adm
end;
/
CREATE OR REPLACE TRIGGER sba_setexchange_insert
BEFORE INSERT 
ON setexchange
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('EXCHANGE','insert');  --adm
end;
/
CREATE OR REPLACE TRIGGER sba_setexchange_update
BEFORE UPDATE 
ON setexchange
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('EXCHANGE','update');  --adm
end;
/
CREATE TABLE setpaymentdecree
    (isaccdetails                   NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE TABLE settings
    (id                             NUMBER NOT NULL,
    parentid                       NUMBER,
    name                           VARCHAR2(64) NOT NULL,
    description                    VARCHAR2(256) NOT NULL,
    value                          VARCHAR2(256),
    valuelist                      VARCHAR2(256),
    display_value_list             VARCHAR2(256))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE settings
ADD CONSTRAINT pk_settings PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER settings_id_gen
BEFORE INSERT 
ON settings
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
	select tr_seg_settings.nextval
		into :new.ID
	from dual;
end;
/
CREATE TABLE sferadey
    (id                             NUMBER(10) NOT NULL,
    name                           VARCHAR2(90))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE sferadey
ADD CONSTRAINT pk_sferadey PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER sba_sferadey_delete
BEFORE  DELETE 
ON sferadey
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('RefEdit','delete');  --adm
 SB_ACA.CheckObjectAccess('CUSTOMERS','delete');  --adm
 SB_ACA.CheckObjectAccess('CUSTOMERS','update');  --adm
end;
/
CREATE OR REPLACE TRIGGER inc_sferadey
BEFORE INSERT 
ON sferadey
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare nw integer;
begin
 select tr_seg_SFERADEY.nextval into nw from dual;
 :new.id:=nw;
end SFERADEY;
/
CREATE OR REPLACE TRIGGER sba_sferadey_insert
BEFORE INSERT 
ON sferadey
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('RefEdit','insert');  --adm
 end sferadey_insert;
/
CREATE OR REPLACE TRIGGER sba_sferadey_update
BEFORE UPDATE 
ON sferadey
REFERENCING NEW AS NEW OLD AS OLD
begin
  SB_ACA.CheckObjectAccess('RefEdit','update');  --adm
end;
/
CREATE TABLE sifr_spr
    (id                             NUMBER(10),
    name                           VARCHAR2(90))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE UNIQUE INDEX sifr_spr0 ON sifr_spr
  (
    id                              ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/

CREATE TABLE swift
    (id                             NUMBER NOT NULL,
    sender                         VARCHAR2(50),
    receiver                       VARCHAR2(50),
    fererence                      VARCHAR2(16),
    valdate                        DATE,
    val_code                       NUMBER,
    amount                         NUMBER(13,2),
    sen_acc_id                     NUMBER,
    sen_acc_name                   VARCHAR2(35),
    sen_acc_inn                    NUMBER(35),
    rec_acc_no                     VARCHAR2(34),
    rec_acc_name                   VARCHAR2(35),
    rec_acc_inn                    NUMBER(35),
    senderbank                     NUMBER,
    remit_inf                      VARCHAR2(3),
    add_inf                        VARCHAR2(210),
    status                         NUMBER(2),
    inout                          NUMBER(1),
    trans_id                       NUMBER,
    trans_date                     DATE,
    filial                         NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER swift_id_inc
BEFORE INSERT 
ON swift
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
DECLARE nw INTEGER;
BEGIN
    SELECT SWIFT_ID.NEXTVAL INTO nw  FROM DUAL;
    :NEW.ID:=NW; 
END SWIFT_ID_INC;
/
CREATE TABLE sysdat
    (tek_dat                        DATE NOT NULL,
    pred_dat                       DATE,
    arc_day                        DATE,
    close                          NUMBER(1))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE sysdat
ADD CONSTRAINT pk_sysdat PRIMARY KEY (tek_dat)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE TABLE tariffscale
    (id                             NUMBER NOT NULL,
    groupid                        NUMBER NOT NULL,
    percent                        NUMBER,
    ammount                        NUMBER(20,2),
    minvalue                       NUMBER(20,2),
    maxvalue                       NUMBER(20,2),
    commisionid                    NUMBER NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE tariffscale
ADD CONSTRAINT pk_tariffscale PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
ALTER TABLE tariffscale
ADD CONSTRAINT uk_tariffscale UNIQUE (groupid, minvalue, maxvalue, commisionid)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER sba_tariffscale_insert
BEFORE INSERT 
ON tariffscale
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('TUNINGTRANSACTIONS','insert');  --adm
end;
/
CREATE OR REPLACE TRIGGER upd_tariffscale
BEFORE UPDATE 
ON tariffscale
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
 if (not(:new.percent is Null) and not(:new.ammount is Null)) then
  raise_application_error(-20097,'Комиссийа щесабындан йалныз 1-и дахил едилмялидир!'); 
 end if;
end;
/
CREATE OR REPLACE TRIGGER trg_tariffscale
BEFORE INSERT 
ON tariffscale
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare newID number;
begin
 if (not(:new.percent is Null) and not(:new.ammount is Null)) then
  raise_application_error(-20097,'Комиссийа щесабындан йалныз 1-и дахил едилмялидир!'); 
 end if; 
 select Seq_tariffscale.NEXTVAL into newID from dual;
 :new.ID :=newID;
end;
/
CREATE OR REPLACE TRIGGER sba_tarifscale_delete
BEFORE  DELETE 
ON tariffscale
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('TUNINGTRANSACTIONS','delete');  --adm
end;
/
CREATE OR REPLACE TRIGGER sba_tarifscale_update
BEFORE UPDATE 
ON tariffscale
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('TUNINGTRANSACTIONS','update');  --adm
end;
/
COMMENT ON COLUMN tariffscale.commisionid IS 'Directs to Commision_trans'
/
COMMENT ON COLUMN tariffscale.groupid IS 'ID on QRP_KLIE'
/
CREATE TABLE temprepairtrans
    (id                             NUMBER(10) NOT NULL,
    op_id                          NUMBER(10),
    no_prov                        VARCHAR2(8),
    dat                            DATE,
    debt                           NUMBER(10),
    kredit                         NUMBER(10),
    val_acc                        NUMBER(10),
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
    rate_d                         NUMBER(18,4),
    rate_c                         NUMBER(18,4),
    parentid                       NUMBER,
    currencyid_c                   NUMBER(4),
    ammount_c                      NUMBER(15,2),
    name                           VARCHAR2(255),
    commit_opid                    NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE temptranz
    (id                             NUMBER NOT NULL,
    debitid                        NUMBER,
    creditid                       NUMBER,
    debitamount                    NUMBER(18,4),
    creditamount                   NUMBER(18,4),
    lamount                        NUMBER(15,2),
    debitrate                      NUMBER(17,4),
    creditrate                     NUMBER(17,4),
    trname                         VARCHAR2(128),
    parentid                       NUMBER,
    flags                          NUMBER DEFAULT 0

 ,
    result                         NUMBER,
    tempid                         NUMBER NOT NULL,
    applied                        NUMBER DEFAULT 0
,
    filialid                       NUMBER,
    kassa_b                        NUMBER,
    kassa_z                        NUMBER,
    vid_op                         NUMBER,
    shifr                          NUMBER,
    no_pack                        NUMBER,
    bank_d                         NUMBER,
    bank_k                         NUMBER,
    rate_d                         NUMBER,
    rate_c                         NUMBER,
    sessionid                      NUMBER,
    operatorid                     NUMBER,
    no_prov                        VARCHAR2(20))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE temptranz
ADD CONSTRAINT temptranz_pk PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE TABLE tempusers
    (user#                          NUMBER NOT NULL,
    name                           VARCHAR2(30) NOT NULL,
    type#                          NUMBER NOT NULL,
    password                       VARCHAR2(30),
    datats#                        NUMBER NOT NULL,
    tempts#                        NUMBER NOT NULL,
    ctime                          DATE NOT NULL,
    ptime                          DATE,
    exptime                        DATE,
    ltime                          DATE,
    resource$                      NUMBER NOT NULL,
    audit$                         VARCHAR2(38),
    defrole                        NUMBER NOT NULL,
    defgrp#                        NUMBER,
    defgrp_seq#                    NUMBER,
    astatus                        NUMBER NOT NULL,
    lcount                         NUMBER NOT NULL,
    defschclass                    VARCHAR2(30),
    ext_username                   VARCHAR2(4000),
    spare1                         NUMBER,
    spare2                         NUMBER,
    spare3                         NUMBER,
    spare4                         VARCHAR2(1000),
    spare5                         VARCHAR2(1000),
    spare6                         DATE)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE trdestination
    (id                             NUMBER(10),
    name                           VARCHAR2(90))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE turn_shamira
    (acc_no                         VARCHAR2(20),
    balname                        VARCHAR2(90),
    val_name                       VARCHAR2(10),
    obr_d                          NUMBER(15,2),
    obr_k                          NUMBER(15,2),
    pok_obr_d                      NUMBER(15,2),
    pok_obr_k                      NUMBER(15,2),
    s_act                          NUMBER,
    s_pas                          NUMBER,
    p_act                          NUMBER,
    p_pas                          NUMBER,
    lastdate                       DATE,
    bal_cn                         NUMBER(10))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE turn_smart
    (acc_no                         VARCHAR2(20) NOT NULL,
    balname                        VARCHAR2(90),
    val_name                       VARCHAR2(10),
    obr_d                          NUMBER(15,2),
    obr_k                          NUMBER(15,2),
    pok_obr_d                      NUMBER(15,2),
    pok_obr_k                      NUMBER(15,2),
    s_act                          NUMBER,
    s_pas                          NUMBER,
    p_act                          NUMBER,
    p_pas                          NUMBER,
    lastdate                       DATE,
    bal_cn                         NUMBER(10) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE turn_tars
    (acc_no                         VARCHAR2(20),
    balname                        VARCHAR2(90),
    val_name                       VARCHAR2(10),
    obr_d                          NUMBER(15,2),
    obr_k                          NUMBER(15,2),
    pok_obr_d                      NUMBER(15,2),
    pok_obr_k                      NUMBER(15,2),
    s_act                          NUMBER,
    s_pas                          NUMBER,
    p_act                          NUMBER,
    p_pas                          NUMBER,
    lastdate                       DATE,
    bal_cn                         NUMBER(10))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE urep_cursors
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(32) NOT NULL,
    query                          VARCHAR2(2048) NOT NULL,
    flags                          VARCHAR2(32),
    description                    VARCHAR2(128) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE urep_cursors
ADD CONSTRAINT pk_urep_cursors_id PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
ALTER TABLE urep_cursors
ADD CONSTRAINT uk_urep_cursors_name UNIQUE (name)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER bi_urep_cursors
BEFORE INSERT 
ON urep_cursors
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
	select UREP_CURSORS_ID_GEN.nextval
		into :new.ID
		from dual;
end;
/
CREATE TABLE urep_files
    (id#                            NUMBER NOT NULL,
    body                           BFILE,
    location                       VARCHAR2(1024),
    qqq                            VARCHAR2(12))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
COMMENT ON COLUMN urep_files.location IS 'Obsolete. Location of the file'
/
CREATE TABLE urep_report
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(32) NOT NULL,
    description                    VARCHAR2(64) NOT NULL,
    location#                      NUMBER DEFAULT 1     NOT NULL,
    controllerlocation             VARCHAR2(64) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE urep_report
ADD CONSTRAINT pk_urep_id PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
ALTER TABLE urep_report
ADD CONSTRAINT uk_urep_report_name UNIQUE (name)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER bi_urep_report
BEFORE INSERT 
ON urep_report
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
	select UREP_REPORT_ID_GEN.nextval
		into :new.ID
	from dual;
end;
/
COMMENT ON COLUMN urep_report.description IS 'Description of the report'
/
COMMENT ON COLUMN urep_report.location# IS '1-BFILE, 2-External File'
/
COMMENT ON COLUMN urep_report.name IS 'Canonical name of the report'
/
CREATE TABLE vid_op
    (id                             NUMBER(3),
    name                           VARCHAR2(128))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE vid_sob
    (id                             NUMBER(10) NOT NULL,
    name                           VARCHAR2(60))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE vid_sob
ADD CONSTRAINT pk_vid_sob PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER sba_vid_sob_insert
BEFORE INSERT 
ON vid_sob
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('RefEdit','insert');  --adm
 end vid_sob_insert;
/
CREATE OR REPLACE TRIGGER sba_vid_sob_delete
BEFORE  DELETE 
ON vid_sob
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('RefEdit','delete');  --adm
 SB_ACA.CheckObjectAccess('CUSTOMERS','delete');  --adm
 SB_ACA.CheckObjectAccess('CUSTOMERS','update');  --adm
end;
/
CREATE OR REPLACE TRIGGER inc_vid_sob
BEFORE INSERT 
ON vid_sob
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare nw integer;
begin
 select tr_seg_VID_SOB.nextval into nw from dual;
 :new.id:=nw;
end VID_SOB;
/
CREATE OR REPLACE TRIGGER sba_vid_sob_update
BEFORE UPDATE 
ON vid_sob
REFERENCING NEW AS NEW OLD AS OLD
begin
  SB_ACA.CheckObjectAccess('RefEdit','update');  --adm
end;
/
CREATE TABLE visits
    (time                           DATE,
    idomain                        VARCHAR2(15),
    browser                        VARCHAR2(15),
    hits                           NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE wares
    (id                             NUMBER NOT NULL,
    groupsid                       NUMBER NOT NULL,
    name                           VARCHAR2(90),
    inventar                       VARCHAR2(20),
    inventar_date                  DATE,
    first_price                    NUMBER,
    balance_price                  NUMBER(15,2),
    in_date                        DATE,
    out_date                       DATE,
    in_num                         NUMBER,
    out_num                        NUMBER,
    amort                          NUMBER,
    producer_plane                 VARCHAR2(100),
    fxm                            NUMBER,
    sector_cod                     NUMBER,
    close_format                   NUMBER,
    remainder                      NUMBER(15,2),
    allamort                       NUMBER,
    amort_date                     DATE,
    taxamort                       NUMBER(15,2),
    alltaxamort                    NUMBER(15,2),
    taxpercentprice                NUMBER(15,2),
    tax                            NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE wares
ADD CONSTRAINT pk_wares_id PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER inc_wares
BEFORE INSERT 
ON wares
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
Declare nw integer;
begin
 Select SEQ_WARES.nextval into nw from  dual;
 :new.ID:=nw;
end INC_WARES;
/
CREATE OR REPLACE TRIGGER wares_sid#
BEFORE INSERT  OR UPDATE 
ON wares
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
 :new.Sid# := sblogin.UserID;
end;
/
COMMENT ON COLUMN wares.close_format IS 'Поддался ли амортизацию?(1-да,0-нет)'
/
COMMENT ON COLUMN wares.remainder IS 'Остаток'
/
ALTER TABLE acc_flag_link
ADD CONSTRAINT fk_acc_flag_link_acc FOREIGN KEY (acc_id)
REFERENCES account (id) ON DELETE CASCADE
/
ALTER TABLE acc_flag_link
ADD CONSTRAINT fk_acc_flag_link_flag FOREIGN KEY (flag_id)
REFERENCES acc_flags (id) ON DELETE CASCADE
/
ALTER TABLE account
ADD CONSTRAINT fk_account_bal_spr1 FOREIGN KEY (bal_cn1)
REFERENCES bal_spr1 (bal_cn) ON DELETE SET NULL
/
ALTER TABLE account
ADD CONSTRAINT fk_account_filial_t FOREIGN KEY (filial)
REFERENCES filial_t (id) ON DELETE SET NULL
/
ALTER TABLE account
ADD CONSTRAINT fk_acc_avalute FOREIGN KEY (val_acc)
REFERENCES avalute_t (valute) ON DELETE SET NULL
/
ALTER TABLE account
ADD CONSTRAINT fk_acc_customers FOREIGN KEY (kli_id)
REFERENCES customers (id) ON DELETE CASCADE
/
ALTER TABLE account_zones_info
ADD CONSTRAINT fk_account_zones_info FOREIGN KEY (zoneid)
REFERENCES account_zones (id) ON DELETE CASCADE
/
ALTER TABLE archost
ADD CONSTRAINT fk_archost_to_account FOREIGN KEY (acc_id)
REFERENCES account (id) ON DELETE SET NULL
/
ALTER TABLE bankinfo_t
ADD CONSTRAINT fk_bankinfo_filial FOREIGN KEY (kod_fil)
REFERENCES filial_t (id) ON DELETE CASCADE
/
ALTER TABLE classifications_info
ADD CONSTRAINT fk_class_info_to_class FOREIGN KEY (classid)
REFERENCES classifications (id) ON DELETE CASCADE
/
ALTER TABLE config_sections
ADD CONSTRAINT fk_config_sections_file_id FOREIGN KEY (fileid)
REFERENCES config_files (id) ON DELETE SET NULL
/
ALTER TABLE config_sections
ADD CONSTRAINT fk_config_sections_parent_id FOREIGN KEY (parentid)
REFERENCES config_sections (id) ON DELETE SET NULL
DISABLE
/
ALTER TABLE config_values
ADD CONSTRAINT fk_config_values_section_id FOREIGN KEY (sectionid)
REFERENCES config_sections (id) ON DELETE CASCADE
/
ALTER TABLE custimage
ADD CONSTRAINT fk_custimage FOREIGN KEY (id)
REFERENCES custinfo (id) ON DELETE CASCADE
/
ALTER TABLE custinfo
ADD CONSTRAINT fk_custinfo FOREIGN KEY (idcust)
REFERENCES customers (id) ON DELETE CASCADE
/
ALTER TABLE customers
ADD CONSTRAINT fk_customers_nalog FOREIGN KEY (nalog_kod)
REFERENCES nalog (id) ON DELETE SET NULL
/
ALTER TABLE customers
ADD CONSTRAINT fk_customers_org_prav FOREIGN KEY (org_sob)
REFERENCES org_prav (id) ON DELETE SET NULL
/
ALTER TABLE customers
ADD CONSTRAINT fk_customers_otrasli FOREIGN KEY (otrasl)
REFERENCES otrasli (id) ON DELETE SET NULL
/
ALTER TABLE customers
ADD CONSTRAINT fk_customers_prinad FOREIGN KEY (prinad_kod)
REFERENCES prinad (id) ON DELETE SET NULL
/
ALTER TABLE customers
ADD CONSTRAINT fk_customers_qrp_klie FOREIGN KEY (group_klie)
REFERENCES qrp_klie (id) ON DELETE SET NULL
ENABLE NOVALIDATE
/
ALTER TABLE excaccount
ADD CONSTRAINT fk_excacc FOREIGN KEY (exchangeid)
REFERENCES exchanges (id) ON DELETE SET NULL
/
ALTER TABLE excaccount
ADD CONSTRAINT fk_excaccunt FOREIGN KEY (accountid)
REFERENCES account (id) ON DELETE SET NULL
/
ALTER TABLE installation_actions
ADD CONSTRAINT fk_actions_task_id FOREIGN KEY (task_id)
REFERENCES installation_tasks (id) ON DELETE SET NULL
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
ALTER TABLE operation_balances
ADD CONSTRAINT fk_operation_balances FOREIGN KEY (operationid)
REFERENCES operations (id) ON DELETE SET NULL
/
ALTER TABLE operkurs
ADD CONSTRAINT fk_operkurs_avalute FOREIGN KEY (val_kod)
REFERENCES avalute_t (valute) ON DELETE SET NULL
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
REFERENCES avalute_t (valute) ON DELETE SET NULL
/
ALTER TABLE provarch
ADD CONSTRAINT fk_provarch_val_acc FOREIGN KEY (val_acc)
REFERENCES avalute_t (valute) ON DELETE SET NULL
/
ALTER TABLE quest_com_product_privs
ADD CONSTRAINT quest_com_product_privs_fk1 FOREIGN KEY (product_id)
REFERENCES quest_com_products (product_id) ON DELETE CASCADE
/
ALTER TABLE quest_com_products_used_by
ADD CONSTRAINT quest_com_products_used_by_fk1 FOREIGN KEY (product_id)
REFERENCES quest_com_products (product_id) ON DELETE CASCADE
/
ALTER TABLE quest_com_products_used_by
ADD CONSTRAINT quest_com_products_used_by_fk2 FOREIGN KEY (used_by_product_id)
REFERENCES quest_com_products (product_id) ON DELETE CASCADE
/
ALTER TABLE quest_com_user_privileges
ADD CONSTRAINT quest_com_user_privs_fk2 FOREIGN KEY (user_id, product_id)
REFERENCES quest_com_users (user_id,product_id) ON DELETE SET NULL
/
ALTER TABLE quest_com_user_privileges
ADD CONSTRAINT quest_com_user_priv_fk1 FOREIGN KEY (product_id, privilege_id)
REFERENCES quest_com_product_privs (product_id,privilege_id) ON DELETE CASCADE
/
ALTER TABLE quest_com_users
ADD CONSTRAINT quest_com_users_fk1 FOREIGN KEY (product_id)
REFERENCES quest_com_products (product_id) ON DELETE CASCADE
/
ALTER TABLE sba_groupmanager
ADD CONSTRAINT sba_groupmanager_forkey FOREIGN KEY (groupid)
REFERENCES sba_objinf (id) ON DELETE CASCADE
/
ALTER TABLE sba_monetaryborder
ADD CONSTRAINT fk_sba_monetaryborderadvgrant FOREIGN KEY (advgrantid)
REFERENCES sba_advanced_grants (id) ON DELETE SET NULL
/
ALTER TABLE sba_objmanager
ADD CONSTRAINT sba_objmanager_forkey FOREIGN KEY (id)
REFERENCES sba_objinf (id) ON DELETE CASCADE
/
ALTER TABLE sba_usergrants_advanced
ADD CONSTRAINT sba_usergrants_advanced_fork FOREIGN KEY (advancedgrantid)
REFERENCES sba_advanced_grants (id) ON DELETE CASCADE
/
ALTER TABLE sba_userman
ADD CONSTRAINT sba_userman_forkey FOREIGN KEY (ugrup)
REFERENCES sba_objinf (id) ON DELETE CASCADE
/
ALTER TABLE sbcm_collection
ADD CONSTRAINT fk_sbcm_collection_id# FOREIGN KEY (id#)
REFERENCES sbcm_contracts (id) ON DELETE SET NULL
/
ALTER TABLE sbcm_contract_accounts
ADD CONSTRAINT fk_sbcm_contract_accounts FOREIGN KEY (id#)
REFERENCES sbcm_contracts (id) ON DELETE SET NULL
/
ALTER TABLE sbcm_contract_state
ADD CONSTRAINT fk_sbcm_contract_state FOREIGN KEY (id#)
REFERENCES sbcm_contracts (id) ON DELETE SET NULL
/
ALTER TABLE sbcm_contracts
ADD CONSTRAINT fk_contracts_client_type FOREIGN KEY (clienttype)
REFERENCES sbcm_categories (id) ON DELETE SET NULL
/
ALTER TABLE sbcm_contracts
ADD CONSTRAINT fk_contracts_to_reliability FOREIGN KEY (reliabilityid)
REFERENCES sbcm_reliability (id) ON DELETE SET NULL
/
ALTER TABLE sbcm_contracts
ADD CONSTRAINT fk_contract_types FOREIGN KEY (type#)
REFERENCES sbcm_contract_types (id) ON DELETE SET NULL
/
ALTER TABLE sbcm_interests
ADD CONSTRAINT fk_sbcm_interests_id FOREIGN KEY (id#)
REFERENCES sbcm_contracts (id) ON DELETE SET NULL
/
ALTER TABLE sbcm_overdueinterests
ADD CONSTRAINT fk_sbcm_overduoeinterest FOREIGN KEY (id#)
REFERENCES sbcm_contracts (id) ON DELETE SET NULL
/
ALTER TABLE sbcm_payments
ADD CONSTRAINT fk_payments_to_contracts FOREIGN KEY (id#)
REFERENCES sbcm_contracts (id) ON DELETE SET NULL
/
ALTER TABLE sbcm_payments_plane
ADD CONSTRAINT fk_paymentsplan_to_contracts FOREIGN KEY (id#)
REFERENCES sbcm_contracts (id) ON DELETE SET NULL
/
ALTER TABLE sbcm_prolongations
ADD CONSTRAINT fk_prolongations_to_contracts FOREIGN KEY (id#)
REFERENCES sbcm_contracts (id) ON DELETE SET NULL
/
ALTER TABLE sbcm_settings
ADD CONSTRAINT fk_settingstomovienames FOREIGN KEY (parentid)
REFERENCES sbcm_movie_names (id) ON DELETE SET NULL
/
ALTER TABLE sbcm_state_cache
ADD CONSTRAINT fk_sbcm_state_cache FOREIGN KEY (id#)
REFERENCES sbcm_contracts (id) ON DELETE SET NULL
/
ALTER TABLE sbcm_tranches
ADD CONSTRAINT fk_tranches_to_contracts FOREIGN KEY (id#)
REFERENCES sbcm_contracts (id) ON DELETE SET NULL
/
ALTER TABLE security_clients$
ADD CONSTRAINT fk_security_clients_group_id FOREIGN KEY (group#)
REFERENCES security_clients$ (id) ON DELETE SET NULL
/
ALTER TABLE security_default_access
ADD CONSTRAINT fk_sda_access FOREIGN KEY (access#)
REFERENCES security_access$ (id) ON DELETE SET NULL
/
ALTER TABLE security_default_access
ADD CONSTRAINT fk_sda_link FOREIGN KEY (link#)
REFERENCES security_default_user (id) ON DELETE SET NULL
/
ALTER TABLE security_sid_client_link
ADD CONSTRAINT fk_sid_client_link_sid FOREIGN KEY (client#)
REFERENCES security_clients$ (id) ON DELETE CASCADE
/
ALTER TABLE security_sid_link_access
ADD CONSTRAINT fk_sid_link_access_access_id FOREIGN KEY (access#)
REFERENCES security_access$ (id) ON DELETE SET NULL
/
ALTER TABLE security_sid_link_access
ADD CONSTRAINT fk_sid_link_access_link_id FOREIGN KEY (link#)
REFERENCES security_sid_client_link (id) ON DELETE CASCADE
/
ALTER TABLE settings
ADD CONSTRAINT fk_settings_parentid FOREIGN KEY (parentid)
REFERENCES settings (id) ON DELETE SET NULL
/
ALTER TABLE tariffscale
ADD CONSTRAINT fk_tariffscale_on_commision FOREIGN KEY (commisionid)
REFERENCES commision_trans_t (id) ON DELETE CASCADE
/
ALTER TABLE tariffscale
ADD CONSTRAINT fk_tariffscale_on_qrp_klie FOREIGN KEY (groupid)
REFERENCES qrp_klie (id) ON DELETE SET NULL
/
ALTER TABLE urep_files
ADD CONSTRAINT fk_urep_report_id FOREIGN KEY (id#)
REFERENCES urep_report (id) ON DELETE SET NULL
/
ALTER TABLE wares
ADD CONSTRAINT fk_wares_groupsid FOREIGN KEY (groupsid)
REFERENCES groups (id) ON DELETE SET NULL
/

