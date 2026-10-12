-- Start of DDL Script for Table SMART.XS_TRANSTYPE_NAME
-- Generated 18-May-2004 14:34:53 from SMART@ata

-- Drop the old instance of XS_TRANSTYPE_NAME
DROP TABLE xs_transtype_name
/

CREATE TABLE xs_transtype_name
    (id                             NUMBER,
    name                           VARCHAR2(200))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/

-- Triggers for XS_TRANSTYPE_NAME

CREATE OR REPLACE TRIGGER xs_transtype_name_id
BEFORE INSERT 
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

-- Start of DDL Script for Table SMART.XS_TRANSTYPE_CODE
-- Generated 18-May-2004 14:34:53 from SMART@ata

-- Drop the old instance of XS_TRANSTYPE_CODE
DROP TABLE xs_transtype_code
/

CREATE TABLE xs_transtype_code
    (code                           NUMBER(3),
    name                           VARCHAR2(40),
    nameid                         NUMBER,
    id                             NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/

-- End of DDL Script for Table SMART.XS_TRANSTYPE_CODE

-- Start of DDL Script for Table SMART.XS_SENTINFO
-- Generated 18-May-2004 14:34:53 from SMART@ata

-- Drop the old instance of XS_SENTINFO
DROP TABLE xs_sentinfo
/

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
    batchfile                      NUMBER(2),
    userid                         NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/

-- Triggers for XS_SENTINFO

CREATE OR REPLACE TRIGGER xs_fileinfo_get_userid
BEFORE INSERT 
ON xs_sentinfo
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
   :NEW.USERID:=SBLOGIN.USERID;
END;
/
CREATE OR REPLACE TRIGGER xs_fileinfo_id
BEFORE INSERT 
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

-- Start of DDL Script for Table SMART.XS_INCOMING
-- Generated 18-May-2004 14:34:53 from SMART@ata

-- Drop the old instance of XS_INCOMING
DROP TABLE xs_incoming
/

CREATE TABLE xs_incoming
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
    filial                         NUMBER(10),
    userid                         NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/

-- Triggers for XS_INCOMING

CREATE OR REPLACE TRIGGER xs_incoming_update_icon
BEFORE INSERT 
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
CREATE OR REPLACE TRIGGER xs_incoming_userid
BEFORE INSERT 
ON xs_incoming
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
   :NEW.USERID:=SBLOGIN.USERID;
END;
/

-- End of DDL Script for Table SMART.XS_INCOMING

-- Start of DDL Script for Table SMART.XS_CONFIG
-- Generated 18-May-2004 14:34:53 from SMART@ata

-- Drop the old instance of XS_CONFIG
DROP TABLE xs_config
/

CREATE TABLE xs_config
    (id                             NUMBER,
    in_dir                         VARCHAR2(250),
    out_dir                        VARCHAR2(250),
    amount_limit                   NUMBER(22,8),
    account                        VARCHAR2(13),
    archive_dir                    VARCHAR2(250),
    usebankdate                    NUMBER,
    commisionid                    NUMBER,
    nb_swift                       VARCHAR2(15))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/

-- End of DDL Script for Table SMART.XS_CONFIG

-- Start of DDL Script for Table SMART.XS_COMMISION
-- Generated 18-May-2004 14:34:53 from SMART@ata

-- Drop the old instance of XS_COMMISION
DROP TABLE xs_commision
/

CREATE TABLE xs_commision
    (custid                         NUMBER,
    comission                      NUMBER(1))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/

-- End of DDL Script for Table SMART.XS_COMMISION

-- Start of DDL Script for Table SMART.XS_BRANCHACCOUNT
-- Generated 18-May-2004 14:34:53 from SMART@ata

-- Drop the old instance of XS_BRANCHACCOUNT
DROP TABLE xs_branchaccount
/

CREATE TABLE xs_branchaccount
    (branchid                       NUMBER,
    accid                          NUMBER,
    valute                         NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/

-- End of DDL Script for Table SMART.XS_BRANCHACCOUNT

-- Start of DDL Script for Table SMART.XS_BENEFICIARY
-- Generated 18-May-2004 14:34:53 from SMART@ata

-- Drop the old instance of XS_BENEFICIARY
DROP TABLE xs_beneficiary
/

CREATE TABLE xs_beneficiary
    (id                             NUMBER,
    batchid                        NUMBER,
    rec_bank_id                    NUMBER,
    rec_bank_sub_acc               NUMBER(13),
    client_acc_no                  VARCHAR2(34),
    client_name                    VARCHAR2(70),
    client_code                    VARCHAR2(70),
    client_inn                     VARCHAR2(30),
    remit_inf                      VARCHAR2(143),
    trans_cod                      NUMBER(3),
    add_inf                        VARCHAR2(107),
    val_date                       DATE,
    val_cod                        NUMBER(4),
    mess_reference                 VARCHAR2(16),
    amount                         NUMBER(22,2),
    bnfcount                       NUMBER(5),
    status                         NUMBER(1),
    transaction_id                 NUMBER(10),
    userid                         NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/

-- Triggers for XS_BENEFICIARY

CREATE OR REPLACE TRIGGER xs_beneficiary_userid
BEFORE INSERT 
ON xs_beneficiary
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
   :NEW.USERID:=SBLOGIN.USERID;
END;


-- End of DDL Script for Table SMART.HOXMESSAGE_OUT
/
CREATE OR REPLACE TRIGGER xs_beneficiary_id
BEFORE INSERT 
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

-- End of DDL Script for Table SMART.XS_BENEFICIARY

-- Start of DDL Script for Table SMART.XS_BATCHS
-- Generated 18-May-2004 14:34:54 from SMART@ata

-- Drop the old instance of XS_BATCHS
DROP TABLE xs_batchs
/

CREATE TABLE xs_batchs
    (id                             NUMBER NOT NULL,
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
    client_inn                     VARCHAR2(30),
    userid                         NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/

-- Constraints for XS_BATCHS

ALTER TABLE xs_batchs
ADD CONSTRAINT pk_id PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/

-- Triggers for XS_BATCHS

CREATE OR REPLACE TRIGGER xs_get_userid
BEFORE INSERT 
ON xs_batchs
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
   :NEW.USERID:=SBLOGIN.USERID;
END;
/
CREATE OR REPLACE TRIGGER xs_batchs_id
BEFORE INSERT 
ON xs_batchs
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare nw integer;
begin
 select XS_BATCHS_ID_GEN.nextval into nw from dual;
 :new.id:=nw;
end;
/

-- End of DDL Script for Table SMART.XS_BATCHS

-- Start of DDL Script for Table SMART.XS_ACCOUNTS
-- Generated 18-May-2004 14:34:54 from SMART@ata

-- Drop the old instance of XS_ACCOUNTS
DROP TABLE xs_accounts
/

CREATE TABLE xs_accounts
    (id                             NUMBER,
    acc_id                         NUMBER,
    valute                         NUMBER(4),
    branchid                       NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/

-- Triggers for XS_ACCOUNTS

CREATE OR REPLACE TRIGGER xs_accounts_id
BEFORE INSERT 
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


