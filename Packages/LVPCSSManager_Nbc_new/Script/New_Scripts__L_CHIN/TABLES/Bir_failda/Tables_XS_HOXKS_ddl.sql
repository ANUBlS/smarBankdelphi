-- Start of DDL Script for Table SMART.XS_ACCOUNTS
-- Generated 20-May-2006 17:26:42 from SMART@SB

CREATE TABLE xs_accounts
    (id                             NUMBER,
    acc_id                         NUMBER,
    valute                         NUMBER(4,0),
    branchid                       NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     40960
    NEXT        16384
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
PARALLEL (DEGREE DEFAULT)
/


-- Triggers for XS_ACCOUNTS

CREATE OR REPLACE TRIGGER "SMART".xs_accounts_id
 BEFORE
  INSERT
 ON xs_accounts
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare nw integer;
begin
 select XS_ACCOUNTS_ID_GEN.nextval into nw from dual;
 :new.id:=nw;
end;
/

-- End of DDL Script for Table SMART.XS_ACCOUNTS

-- Start of DDL Script for Table SMART.XS_BATCHS
-- Generated 20-May-2006 17:26:42 from SMART@SB

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
    INITIAL     327680
    NEXT        24576
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
  TABLESPACE  smartidx
  STORAGE   (
    INITIAL     81920
    NEXT        65536
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Triggers for XS_BATCHS

CREATE OR REPLACE TRIGGER "SMART".xs_batchs_id
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
CREATE OR REPLACE TRIGGER "SMART".xs_get_userid
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

-- Start of DDL Script for Table SMART.XS_BATCHS_ARCHIVE
-- Generated 20-May-2006 17:26:42 from SMART@SB

CREATE TABLE xs_batchs_archive
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
    INITIAL     1064960
    NEXT        507904
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- End of DDL Script for Table SMART.XS_BATCHS_ARCHIVE

-- Start of DDL Script for Table SMART.XS_BENEFICIARY
-- Generated 20-May-2006 17:26:42 from SMART@SB

CREATE TABLE xs_beneficiary
    (id                             NUMBER,
    batchid                        NUMBER,
    rec_bank_id                    NUMBER,
    rec_bank_sub_acc               NUMBER(13,0),
    client_acc_no                  VARCHAR2(34),
    client_name                    VARCHAR2(70),
    client_code                    VARCHAR2(70),
    client_inn                     VARCHAR2(30),
    remit_inf                      VARCHAR2(145),
    trans_cod                      NUMBER(3,0),
    add_inf                        VARCHAR2(107),
    val_date                       DATE,
    val_cod                        NUMBER(4,0),
    mess_reference                 VARCHAR2(16),
    amount                         NUMBER(22,2),
    bnfcount                       NUMBER(5,0),
    status                         NUMBER(1,0),
    transaction_id                 NUMBER(10,0),
    userid                         NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     1064960
    NEXT        16384
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
PARALLEL (DEGREE DEFAULT)
/


-- Indexes for XS_BENEFICIARY

CREATE INDEX idx_beneficiary ON xs_beneficiary
  (
    batchid                         ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     10240
    NEXT        10240
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
/


-- Triggers for XS_BENEFICIARY

CREATE OR REPLACE TRIGGER "SMART".xs_beneficiary_id
 BEFORE
  INSERT
 ON xs_beneficiary
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   nw   INTEGER;
BEGIN
   SELECT xs_beneficiary_id_gen.NEXTVAL
     INTO nw
     FROM DUAL;

   :NEW.id := nw;
END;
/
CREATE OR REPLACE TRIGGER "SMART".xs_beneficiary_userid
 BEFORE
  INSERT
 ON xs_beneficiary
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
   :NEW.USERID:=SBLOGIN.USERID;
END;


-- End of DDL Script for Table SMART.HOXMESSAGE_OUT
/

-- End of DDL Script for Table SMART.XS_BENEFICIARY

-- Start of DDL Script for Table SMART.XS_BENEFICIARY_ARCHIVE
-- Generated 20-May-2006 17:26:42 from SMART@SB

CREATE TABLE xs_beneficiary_archive
    (id                             NUMBER,
    batchid                        NUMBER,
    rec_bank_id                    NUMBER,
    rec_bank_sub_acc               NUMBER(13,0),
    client_acc_no                  VARCHAR2(34),
    client_name                    VARCHAR2(70),
    client_code                    VARCHAR2(70),
    client_inn                     VARCHAR2(30),
    remit_inf                      VARCHAR2(145),
    trans_cod                      NUMBER(3,0),
    add_inf                        VARCHAR2(107),
    val_date                       DATE,
    val_cod                        NUMBER(4,0),
    mess_reference                 VARCHAR2(16),
    amount                         NUMBER(22,2),
    bnfcount                       NUMBER(5,0),
    status                         NUMBER(1,0),
    transaction_id                 NUMBER(10,0),
    userid                         NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     2375680
    NEXT        1146880
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- Indexes for XS_BENEFICIARY_ARCHIVE

CREATE INDEX idx_beneficiary_archive ON xs_beneficiary_archive
  (
    batchid                         ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     10240
    NEXT        126976
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
/


-- End of DDL Script for Table SMART.XS_BENEFICIARY_ARCHIVE

-- Start of DDL Script for Table SMART.XS_BENEFICIARY_ARCHIVE1
-- Generated 20-May-2006 17:26:43 from SMART@SB

CREATE TABLE xs_beneficiary_archive1
    (id                             NUMBER,
    batchid                        NUMBER,
    rec_bank_id                    NUMBER,
    rec_bank_sub_acc               NUMBER(13,0),
    client_acc_no                  VARCHAR2(34),
    client_name                    VARCHAR2(70),
    client_code                    VARCHAR2(70),
    client_inn                     VARCHAR2(30),
    remit_inf                      VARCHAR2(145),
    trans_cod                      NUMBER(3,0),
    add_inf                        VARCHAR2(107),
    val_date                       DATE,
    val_cod                        NUMBER(4,0),
    mess_reference                 VARCHAR2(16),
    amount                         NUMBER(22,2),
    bnfcount                       NUMBER(5,0),
    status                         NUMBER(1,0),
    transaction_id                 NUMBER(10,0),
    userid                         NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     2375680
    NEXT        1146880
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- End of DDL Script for Table SMART.XS_BENEFICIARY_ARCHIVE1

-- Start of DDL Script for Table SMART.XS_BENEFICIARY_SHABLON
-- Generated 20-May-2006 17:26:43 from SMART@SB

CREATE TABLE xs_beneficiary_shablon
    (mebleg                         VARCHAR2(25),
    odenish_kod                    VARCHAR2(25),
    bankin_kodu                    VARCHAR2(50),
    hesab_no                       VARCHAR2(25),
    adi                            VARCHAR2(25),
    kodu                           VARCHAR2(25),
    voen                           VARCHAR2(25),
    od_tey1                        VARCHAR2(50),
    od_tey2                        VARCHAR2(50),
    od_tey3                        VARCHAR2(50),
    od_tey4                        VARCHAR2(50),
    elave_mel1                     VARCHAR2(50),
    elave_mel2                     VARCHAR2(50),
    elave_mel3                     VARCHAR2(50),
    shablonun_adi                  VARCHAR2(25),
    bankin_adi                     VARCHAR2(25),
    odenish                        VARCHAR2(100))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- End of DDL Script for Table SMART.XS_BENEFICIARY_SHABLON

-- Start of DDL Script for Table SMART.XS_BRANCHACCOUNT
-- Generated 20-May-2006 17:26:43 from SMART@SB

CREATE TABLE xs_branchaccount
    (branchid                       NUMBER,
    accid                          NUMBER,
    valute                         NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     40960
    NEXT        16384
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
PARALLEL (DEGREE DEFAULT)
/


-- End of DDL Script for Table SMART.XS_BRANCHACCOUNT

-- Start of DDL Script for Table SMART.XS_COMMISION
-- Generated 20-May-2006 17:26:43 from SMART@SB

CREATE TABLE xs_commision
    (custid                         NUMBER,
    comission                      NUMBER(1,0))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     40960
    NEXT        16384
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
PARALLEL (DEGREE DEFAULT)
/


-- End of DDL Script for Table SMART.XS_COMMISION

-- Start of DDL Script for Table SMART.XS_CONFIG
-- Generated 20-May-2006 17:26:43 from SMART@SB

CREATE TABLE xs_config
    (id                             NUMBER,
    in_dir                         VARCHAR2(250),
    out_dir                        VARCHAR2(250),
    amount_limit                   NUMBER(22,8),
    account                        VARCHAR2(13),
    archive_dir                    VARCHAR2(250),
    usebankdate                    NUMBER,
    commisionid                    NUMBER,
    nb_swift                       VARCHAR2(15),
    coraccount                     VARCHAR2(20))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     40960
    NEXT        16384
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
PARALLEL (DEGREE DEFAULT)
/


-- End of DDL Script for Table SMART.XS_CONFIG

-- Start of DDL Script for Table SMART.XS_INCOMING
-- Generated 20-May-2006 17:26:43 from SMART@SB

CREATE TABLE xs_incoming
    (id                             NUMBER,
    reference                      VARCHAR2(16),
    val_cod                        NUMBER(4,0),
    amount                         NUMBER(22,2),
    sen_acc                        VARCHAR2(34),
    sen_name                       VARCHAR2(70),
    sen_inn                        VARCHAR2(35),
    sen_bank_id                    NUMBER,
    sen_bank_subacc                NUMBER(13,0),
    rec_bank_subacc                NUMBER(13,0),
    rec_bank_bik                   VARCHAR2(11),
    rec_client_acc                 VARCHAR2(34),
    rec_client_acc_id              NUMBER,
    rec_client_name                VARCHAR2(70),
    rec_client_inn                 VARCHAR2(35),
    remit_inf                      VARCHAR2(140),
    typecode                       NUMBER(3,0),
    add_inf                        VARCHAR2(105),
    trans_date                     DATE,
    status                         NUMBER(1,0),
    filial                         NUMBER(10,0),
    userid                         NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     1597440
    NEXT        16384
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
PARALLEL (DEGREE DEFAULT)
/


-- Triggers for XS_INCOMING

CREATE OR REPLACE TRIGGER "SMART".xs_incoming_update_icon
 BEFORE
  INSERT
 ON xs_incoming
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare nw integer;
begin
 select xs_INCOMING_ID_GEN.nextval into nw from dual;
 :new.id:=nw;
end ;

-- End of DDL Script for Table SMART.XS_BENEFICIARY
/
CREATE OR REPLACE TRIGGER "SMART".xs_incoming_userid
 BEFORE
  INSERT
 ON xs_incoming
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
   :NEW.USERID:=SBLOGIN.USERID;
END;
/

-- End of DDL Script for Table SMART.XS_INCOMING

-- Start of DDL Script for Table SMART.XS_SENTINFO
-- Generated 20-May-2006 17:26:43 from SMART@SB

CREATE TABLE xs_sentinfo
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
    batchfile                      NUMBER(2,0),
    userid                         NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     122880
    NEXT        24576
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
PARALLEL (DEGREE DEFAULT)
/


-- Triggers for XS_SENTINFO

CREATE OR REPLACE TRIGGER "SMART".xs_fileinfo_get_userid
 BEFORE
  INSERT
 ON xs_sentinfo
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
   :NEW.USERID:=SBLOGIN.USERID;
END;
/
CREATE OR REPLACE TRIGGER "SMART".xs_fileinfo_id
 BEFORE
  INSERT
 ON xs_sentinfo
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare nw integer;
begin
 select XS_FILEINFO_ID_GEN.nextval into nw from dual;
 :new.id:=nw;
end;
/

-- End of DDL Script for Table SMART.XS_SENTINFO

-- Start of DDL Script for Table SMART.XS_TRANSTYPE_CODE
-- Generated 20-May-2006 17:26:43 from SMART@SB

CREATE TABLE xs_transtype_code
    (code                           NUMBER(3,0),
    name                           VARCHAR2(40),
    nameid                         NUMBER,
    id                             NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     81920
    NEXT        16384
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
PARALLEL (DEGREE DEFAULT)
/


-- End of DDL Script for Table SMART.XS_TRANSTYPE_CODE

-- Start of DDL Script for Table SMART.XS_TRANSTYPE_NAME
-- Generated 20-May-2006 17:26:43 from SMART@SB

CREATE TABLE xs_transtype_name
    (id                             NUMBER,
    name                           VARCHAR2(200))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     40960
    NEXT        16384
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
PARALLEL (DEGREE DEFAULT)
/


-- Triggers for XS_TRANSTYPE_NAME

CREATE OR REPLACE TRIGGER "SMART".xs_transtype_name_id
 BEFORE
  INSERT
 ON xs_transtype_name
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare nw integer;
begin
 select XS_TRANSTYPENAME_ID_GEN.nextval into nw from dual;
 :new.id:=nw;
end ;
/

-- End of DDL Script for Table SMART.XS_TRANSTYPE_NAME

