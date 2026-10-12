-- Start of DDL Script for Table CREDITSMGR.AGRO_KREDIT_PURPOSE
-- Generated 30-May-2006 16:39:19 from CREDITSMGR@SB

CREATE TABLE creditsmgr.agro_kredit_purpose
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(128),
    depend_id                      NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Constraints for CREDITSMGR.AGRO_KREDIT_PURPOSE

ALTER TABLE creditsmgr.agro_kredit_purpose
ADD CONSTRAINT pk_akpurpose PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Triggers for CREDITSMGR.AGRO_KREDIT_PURPOSE

CREATE OR REPLACE TRIGGER creditsmgr.bi_inc_agro_kredit_purpose
BEFORE INSERT 
ON creditsmgr.agro_kredit_purpose
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
   SELECT seg_agro_kredit_purpose.NEXTVAL
     INTO :NEW.id
     FROM DUAL;
END;
/

-- End of DDL Script for Table CREDITSMGR.AGRO_KREDIT_PURPOSE

-- Start of DDL Script for Table CREDITSMGR.AGRO_KREDIT_TARGET
-- Generated 30-May-2006 16:39:20 from CREDITSMGR@SB

CREATE TABLE creditsmgr.agro_kredit_target
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(128),
    name_eng                       VARCHAR2(128))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Constraints for CREDITSMGR.AGRO_KREDIT_TARGET

ALTER TABLE creditsmgr.agro_kredit_target
ADD CONSTRAINT pk_agro_kredit_target PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     81920
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Triggers for CREDITSMGR.AGRO_KREDIT_TARGET

CREATE OR REPLACE TRIGGER creditsmgr.bi_inc_agro_kredit_terget
BEFORE INSERT 
ON creditsmgr.agro_kredit_target
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
   SELECT seg_agro_kredit_target.NEXTVAL
     INTO :NEW.id
     FROM DUAL;
END;
/

-- End of DDL Script for Table CREDITSMGR.AGRO_KREDIT_TARGET

-- Start of DDL Script for Table CREDITSMGR.AGRO_REGION
-- Generated 30-May-2006 16:39:20 from CREDITSMGR@SB

CREATE TABLE creditsmgr.agro_region
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(128),
    name_eng                       VARCHAR2(128))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Constraints for CREDITSMGR.AGRO_REGION

ALTER TABLE creditsmgr.agro_region
ADD CONSTRAINT pk_agro_region PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- End of DDL Script for Table CREDITSMGR.AGRO_REGION

-- Start of DDL Script for Table CREDITSMGR.AGRO_VILLAGE
-- Generated 30-May-2006 16:39:20 from CREDITSMGR@SB

CREATE TABLE creditsmgr.agro_village
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(128),
    depend_id                      NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Constraints for CREDITSMGR.AGRO_VILLAGE

ALTER TABLE creditsmgr.agro_village
ADD CONSTRAINT pk_village PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Triggers for CREDITSMGR.AGRO_VILLAGE

CREATE OR REPLACE TRIGGER creditsmgr.bi_inc_agro_village
BEFORE INSERT 
ON creditsmgr.agro_village
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
   SELECT seg_agro_village.NEXTVAL
     INTO :NEW.id
     FROM DUAL;
END;
/

-- End of DDL Script for Table CREDITSMGR.AGRO_VILLAGE

-- Start of DDL Script for Table CREDITSMGR.CM_ACC_NAME
-- Generated 30-May-2006 16:39:20 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_acc_name
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(30) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Constraints for CREDITSMGR.CM_ACC_NAME

ALTER TABLE creditsmgr.cm_acc_name
ADD CONSTRAINT pr_an PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- End of DDL Script for Table CREDITSMGR.CM_ACC_NAME

-- Start of DDL Script for Table CREDITSMGR.CM_ACCOUNT_MODEL
-- Generated 30-May-2006 16:39:20 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_account_model
    (seqno                          NUMBER NOT NULL,
    purpose                        VARCHAR2(32) NOT NULL,
    symbol                         CHAR(1) NOT NULL,
    symbolcount                    NUMBER NOT NULL,
    symbolprefix                   CHAR(1),
    symbolsuffix                   CHAR(1))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Comments for CREDITSMGR.CM_ACCOUNT_MODEL

COMMENT ON COLUMN creditsmgr.cm_account_model.seqno IS 'Sequence'
/

-- End of DDL Script for Table CREDITSMGR.CM_ACCOUNT_MODEL

-- Start of DDL Script for Table CREDITSMGR.CM_ACCOUNTGROUPS
-- Generated 30-May-2006 16:39:20 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_accountgroups
    (id                             NUMBER NOT NULL,
    iname                          VARCHAR2(32),
    description                    VARCHAR2(64))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- Constraints for CREDITSMGR.CM_ACCOUNTGROUPS

ALTER TABLE creditsmgr.cm_accountgroups
ADD CONSTRAINT pk_cm_accountgroups PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits_idx
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Comments for CREDITSMGR.CM_ACCOUNTGROUPS

COMMENT ON COLUMN creditsmgr.cm_accountgroups.id IS 'Generated by trigger'
/

-- End of DDL Script for Table CREDITSMGR.CM_ACCOUNTGROUPS

-- Start of DDL Script for Table CREDITSMGR.CM_ACCOUNTS
-- Generated 30-May-2006 16:39:20 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_accounts
    (creditid                       NUMBER NOT NULL,
    booroweraccid                  NUMBER,
    contractaccid                  NUMBER NOT NULL,
    loanaccid                      NUMBER,
    dueloanaccid                   NUMBER,
    interestaccid                  NUMBER,
    dueinterestaccid               NUMBER,
    primaryreserveaccid            NUMBER,
    secondaryreserveaccid          NUMBER,
    outcollateralaccid             NUMBER,
    outguaranteeaccid              NUMBER,
    outinterestaccid               NUMBER,
    crdlineoblaccid                NUMBER,
    oldprimaryreserveaccid         NUMBER,
    oldsecondaryreseveaccid        NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Indexes for CREDITSMGR.CM_ACCOUNTS

CREATE UNIQUE INDEX creditsmgr.uk_cm_accounts ON creditsmgr.cm_accounts
  (
    creditid                        ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits_idx
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Triggers for CREDITSMGR.CM_ACCOUNTS

CREATE OR REPLACE TRIGGER creditsmgr.bi_cm_accounts
BEFORE UPDATE 
ON creditsmgr.cm_accounts
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
   
   if :new.primaryreserveaccid <> :old.primaryreserveaccid then
        :new.oldprimaryreserveaccid := :old.primaryreserveaccid;
   end if;

   if :new.secondaryreserveaccid <> :old.secondaryreserveaccid then
        :new.oldsecondaryreseveaccid := :old.secondaryreserveaccid;
   end if;
    
end;
/

-- Comments for CREDITSMGR.CM_ACCOUNTS

COMMENT ON COLUMN creditsmgr.cm_accounts.booroweraccid IS '->Smart.Accounts'
/
COMMENT ON COLUMN creditsmgr.cm_accounts.contractaccid IS 'LoanAccID or DueLoanAccID for optimization'
/
COMMENT ON COLUMN creditsmgr.cm_accounts.creditid IS '->CM_PORTFOLIO'
/
COMMENT ON COLUMN creditsmgr.cm_accounts.dueinterestaccid IS '->Smart.Accounts'
/
COMMENT ON COLUMN creditsmgr.cm_accounts.dueloanaccid IS '->Smart.Accounts'
/
COMMENT ON COLUMN creditsmgr.cm_accounts.interestaccid IS '->Smart.Accounts'
/
COMMENT ON COLUMN creditsmgr.cm_accounts.loanaccid IS '->Smart.Accounts'
/
COMMENT ON COLUMN creditsmgr.cm_accounts.outcollateralaccid IS '->Smart@SBOUT.Accounts'
/
COMMENT ON COLUMN creditsmgr.cm_accounts.outguaranteeaccid IS '->Smart@SBOUT.Accounts'
/
COMMENT ON COLUMN creditsmgr.cm_accounts.primaryreserveaccid IS '->Smart.Accounts'
/
COMMENT ON COLUMN creditsmgr.cm_accounts.secondaryreserveaccid IS '->Smart.Accounts'
/

-- End of DDL Script for Table CREDITSMGR.CM_ACCOUNTS

-- Start of DDL Script for Table CREDITSMGR.CM_ACTV_TRANSACTIONS
-- Generated 30-May-2006 16:39:20 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_actv_transactions
    (creditid                       NUMBER NOT NULL,
    obltrid                        NUMBER,
    pledgetrid                     NUMBER,
    actvdate                       DATE NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- Indexes for CREDITSMGR.CM_ACTV_TRANSACTIONS

CREATE UNIQUE INDEX creditsmgr.uk_cm_actv_transactions ON creditsmgr.cm_actv_transactions
  (
    creditid                        ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits_idx
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- End of DDL Script for Table CREDITSMGR.CM_ACTV_TRANSACTIONS

-- Start of DDL Script for Table CREDITSMGR.CM_ADM_GROUPMANAGER
-- Generated 30-May-2006 16:39:20 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_adm_groupmanager
    (userid                         NUMBER NOT NULL,
    groupid                        NUMBER NOT NULL,
    usertype                       NUMBER NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Constraints for CREDITSMGR.CM_ADM_GROUPMANAGER

ALTER TABLE creditsmgr.cm_adm_groupmanager
ADD CONSTRAINT cm_uk_grman_usergroup UNIQUE (userid, groupid)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Triggers for CREDITSMGR.CM_ADM_GROUPMANAGER

CREATE OR REPLACE TRIGGER creditsmgr.cm_biu_adm_groupman
BEFORE INSERT  OR UPDATE 
ON creditsmgr.cm_adm_groupmanager
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
   cm_administration.checkuserexistsbyid (:NEW.userid);
END;
/

-- Comments for CREDITSMGR.CM_ADM_GROUPMANAGER

COMMENT ON COLUMN creditsmgr.cm_adm_groupmanager.usertype IS '1 MASTER, 2 SLAVE, 3 NEUTRAL'
/

-- End of DDL Script for Table CREDITSMGR.CM_ADM_GROUPMANAGER

-- Start of DDL Script for Table CREDITSMGR.CM_ADM_GROUPS
-- Generated 30-May-2006 16:39:20 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_adm_groups
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(255) NOT NULL,
    typeid                         NUMBER NOT NULL,
    description                    VARCHAR2(255))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Constraints for CREDITSMGR.CM_ADM_GROUPS

ALTER TABLE creditsmgr.cm_adm_groups
ADD CONSTRAINT cm_pk_groupid PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/
ALTER TABLE creditsmgr.cm_adm_groups
ADD CONSTRAINT cm_uk_groupname UNIQUE (name)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Triggers for CREDITSMGR.CM_ADM_GROUPS

CREATE OR REPLACE TRIGGER creditsmgr.cm_biu_adm_groups
BEFORE INSERT  OR UPDATE 
ON creditsmgr.cm_adm_groups
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
   IF (INSERTING) AND (:NEW.ID IS NULL)
   THEN
      SELECT seq_cm_adm_groups.NEXTVAL
        INTO :NEW.ID
        FROM DUAL;
   END IF;

   :NEW.NAME := UPPER (:NEW.NAME);
END;
/

-- End of DDL Script for Table CREDITSMGR.CM_ADM_GROUPS

-- Start of DDL Script for Table CREDITSMGR.CM_ADM_GROUPTYPES
-- Generated 30-May-2006 16:39:20 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_adm_grouptypes
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(255) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Constraints for CREDITSMGR.CM_ADM_GROUPTYPES

ALTER TABLE creditsmgr.cm_adm_grouptypes
ADD CONSTRAINT cm_pk_grouptypeid PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/
ALTER TABLE creditsmgr.cm_adm_grouptypes
ADD CONSTRAINT cm_uk_grouptype UNIQUE (name)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Triggers for CREDITSMGR.CM_ADM_GROUPTYPES

CREATE OR REPLACE TRIGGER creditsmgr.cm_bi_adm_grouptypes
BEFORE INSERT 
ON creditsmgr.cm_adm_grouptypes
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
   SELECT seq_cm_adm_grouptypes.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
END;
/

-- End of DDL Script for Table CREDITSMGR.CM_ADM_GROUPTYPES

-- Start of DDL Script for Table CREDITSMGR.CM_ADM_GROUPUSERTYPES
-- Generated 30-May-2006 16:39:20 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_adm_groupusertypes
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(255) NOT NULL,
    description                    VARCHAR2(255))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Constraints for CREDITSMGR.CM_ADM_GROUPUSERTYPES

ALTER TABLE creditsmgr.cm_adm_groupusertypes
ADD CONSTRAINT cm_pk_grusertypeid PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/
ALTER TABLE creditsmgr.cm_adm_groupusertypes
ADD CONSTRAINT cm_uk_grusertypename UNIQUE (name)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- End of DDL Script for Table CREDITSMGR.CM_ADM_GROUPUSERTYPES

-- Start of DDL Script for Table CREDITSMGR.CM_ADM_PLUGINS
-- Generated 30-May-2006 16:39:20 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_adm_plugins
    (id                             NUMBER NOT NULL,
    pluginname                     VARCHAR2(255) NOT NULL,
    paramname                      VARCHAR2(255),
    description                    VARCHAR2(255),
    typeid                         NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Constraints for CREDITSMGR.CM_ADM_PLUGINS

ALTER TABLE creditsmgr.cm_adm_plugins
ADD CONSTRAINT cm_pk_pluginid PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/
ALTER TABLE creditsmgr.cm_adm_plugins
ADD CONSTRAINT cm_uk_pluginnameparam UNIQUE (pluginname, paramname)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Triggers for CREDITSMGR.CM_ADM_PLUGINS

CREATE OR REPLACE TRIGGER creditsmgr.cm_bi_adm_plugins
BEFORE INSERT  OR UPDATE 
ON creditsmgr.cm_adm_plugins
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
   IF (INSERTING) AND (:NEW.ID IS NULL)
   THEN
      SELECT seq_cm_adm_plugins.NEXTVAL
        INTO :NEW.ID
        FROM DUAL;
   END IF;

   :NEW.pluginname := UPPER (:NEW.pluginname);

   IF TRIM (:NEW.paramname) IS NULL
   THEN
      :NEW.paramname := 'NONE';
   END IF;

   :NEW.paramname := UPPER (:NEW.paramname);
END;
/

-- End of DDL Script for Table CREDITSMGR.CM_ADM_PLUGINS

-- Start of DDL Script for Table CREDITSMGR.CM_ADM_PLUGINTYPES
-- Generated 30-May-2006 16:39:20 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_adm_plugintypes
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(255) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Constraints for CREDITSMGR.CM_ADM_PLUGINTYPES

ALTER TABLE creditsmgr.cm_adm_plugintypes
ADD CONSTRAINT cm_pk_plugintype PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- End of DDL Script for Table CREDITSMGR.CM_ADM_PLUGINTYPES

-- Start of DDL Script for Table CREDITSMGR.CM_ADM_ROOTS
-- Generated 30-May-2006 16:39:20 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_adm_roots
    (name                           VARCHAR2(255) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Constraints for CREDITSMGR.CM_ADM_ROOTS

ALTER TABLE creditsmgr.cm_adm_roots
ADD CONSTRAINT cm_uk_rootname UNIQUE (name)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Triggers for CREDITSMGR.CM_ADM_ROOTS

CREATE OR REPLACE TRIGGER creditsmgr.cm_bi_adm_roots
BEFORE INSERT  OR UPDATE 
ON creditsmgr.cm_adm_roots
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
   :NEW.NAME := UPPER (:NEW.NAME);
   cm_administration.checkuserexists (:NEW.NAME);
END;
/

-- End of DDL Script for Table CREDITSMGR.CM_ADM_ROOTS

-- Start of DDL Script for Table CREDITSMGR.CM_ADM_SYNREPLACE
-- Generated 30-May-2006 16:39:21 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_adm_synreplace
    (objectname                     VARCHAR2(255) NOT NULL,
    replacewith                    VARCHAR2(255) NOT NULL,
    objecttype                     VARCHAR2(255) DEFAULT 'TABLE'    NOT NULL,
    objectowner                    VARCHAR2(255) DEFAULT 'CREDITSMGR'    NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Constraints for CREDITSMGR.CM_ADM_SYNREPLACE

ALTER TABLE creditsmgr.cm_adm_synreplace
ADD CONSTRAINT cm_uk_synreplace UNIQUE (objectname, replacewith)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Triggers for CREDITSMGR.CM_ADM_SYNREPLACE

CREATE OR REPLACE TRIGGER creditsmgr.cm_biu_adm_synreplace
BEFORE INSERT  OR UPDATE 
ON creditsmgr.cm_adm_synreplace
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
   :NEW.objectname := UPPER (:NEW.objectname);
   :NEW.objecttype := UPPER (:NEW.objecttype);
   :NEW.replacewith := UPPER (:NEW.replacewith);
   :NEW.objectowner := UPPER (:NEW.objectowner);
END;
/

-- End of DDL Script for Table CREDITSMGR.CM_ADM_SYNREPLACE

-- Start of DDL Script for Table CREDITSMGR.CM_ADM_USERGRANTS
-- Generated 30-May-2006 16:39:21 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_adm_usergrants
    (userid                         NUMBER NOT NULL,
    pluginid                       NUMBER NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Constraints for CREDITSMGR.CM_ADM_USERGRANTS

ALTER TABLE creditsmgr.cm_adm_usergrants
ADD CONSTRAINT cm_uk_usergrants_uidplid UNIQUE (userid, pluginid)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Triggers for CREDITSMGR.CM_ADM_USERGRANTS

CREATE OR REPLACE TRIGGER creditsmgr.cm_biu_adm_usergrants
BEFORE INSERT  OR UPDATE 
ON creditsmgr.cm_adm_usergrants
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
   cm_administration.checkuserexistsbyid (:NEW.userid);
END;
/

-- End of DDL Script for Table CREDITSMGR.CM_ADM_USERGRANTS

-- Start of DDL Script for Table CREDITSMGR.CM_ADM_USERS
-- Generated 30-May-2006 16:39:21 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_adm_users
    (id                             NUMBER NOT NULL,
    systemid                       NUMBER,
    name                           VARCHAR2(255),
    typeid                         NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Constraints for CREDITSMGR.CM_ADM_USERS

ALTER TABLE creditsmgr.cm_adm_users
ADD CONSTRAINT cm_pk_userid PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/
ALTER TABLE creditsmgr.cm_adm_users
ADD CONSTRAINT cm_uk_username UNIQUE (name)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/
ALTER TABLE creditsmgr.cm_adm_users
ADD CONSTRAINT cm_uk_usersysid UNIQUE (systemid)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Triggers for CREDITSMGR.CM_ADM_USERS

CREATE OR REPLACE TRIGGER creditsmgr.cm_ad_adm_users
BEFORE  DELETE 
ON creditsmgr.cm_adm_users
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN

   DELETE FROM cm_adm_usergrants
         WHERE userid = cm_administration.getuserid (:OLD.NAME);

   DELETE FROM cm_adm_groupmanager
         WHERE userid = cm_administration.getuserid (:OLD.NAME);
END;
/
CREATE OR REPLACE TRIGGER creditsmgr.cm_bi_adm_users
BEFORE INSERT  OR UPDATE 
ON creditsmgr.cm_adm_users
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
   :NEW.NAME := UPPER (:NEW.NAME);
   cm_administration.checkuserexists (UPPER (:NEW.NAME));

   IF (INSERTING) AND (:NEW.ID IS NULL)
   THEN
      SELECT seq_cm_adm_users.NEXTVAL
        INTO :NEW.ID
        FROM DUAL;
   END IF;
END;
/

-- Comments for CREDITSMGR.CM_ADM_USERS

COMMENT ON COLUMN creditsmgr.cm_adm_users.name IS 'USER'
/
COMMENT ON COLUMN creditsmgr.cm_adm_users.systemid IS 'UID'
/

-- End of DDL Script for Table CREDITSMGR.CM_ADM_USERS

-- Start of DDL Script for Table CREDITSMGR.CM_AE_CACHE
-- Generated 30-May-2006 16:39:21 from CREDITSMGR@SB

CREATE GLOBAL TEMPORARY TABLE creditsmgr.cm_ae_cache
    (creditid                       NUMBER NOT NULL,
    duemainamt                     NUMBER(18,2),
    dueintamt                      NUMBER(18,2),
    daysmain                       NUMBER,
    daysint                        NUMBER)
ON COMMIT DELETE ROWS
/


-- End of DDL Script for Table CREDITSMGR.CM_AE_CACHE

-- Start of DDL Script for Table CREDITSMGR.CM_AGINFO
-- Generated 30-May-2006 16:39:21 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_aginfo
    (groupid                        NUMBER NOT NULL,
    accountnumber                  NUMBER NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- Comments for CREDITSMGR.CM_AGINFO

COMMENT ON COLUMN creditsmgr.cm_aginfo.groupid IS '->CM_ACCOUNTGROUPS'
/

-- End of DDL Script for Table CREDITSMGR.CM_AGINFO

-- Start of DDL Script for Table CREDITSMGR.CM_AK_GRANTS
-- Generated 30-May-2006 16:39:21 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_ak_grants
    (creditid                       NUMBER NOT NULL,
    machineid                      NUMBER NOT NULL,
    grantyear                      NUMBER(4) NOT NULL,
    grantdate                      DATE NOT NULL,
    machineammount                 NUMBER(18,2) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Constraints for CREDITSMGR.CM_AK_GRANTS

ALTER TABLE creditsmgr.cm_ak_grants
ADD CONSTRAINT cm_uk_grant_creditid UNIQUE (creditid)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- End of DDL Script for Table CREDITSMGR.CM_AK_GRANTS

-- Start of DDL Script for Table CREDITSMGR.CM_AK_MACHINES
-- Generated 30-May-2006 16:39:21 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_ak_machines
    (id                             NUMBER NOT NULL,
    machinename                    VARCHAR2(255) NOT NULL,
    description                    VARCHAR2(255))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Constraints for CREDITSMGR.CM_AK_MACHINES

ALTER TABLE creditsmgr.cm_ak_machines
ADD CONSTRAINT cm_pk_ak_machineid PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/
ALTER TABLE creditsmgr.cm_ak_machines
ADD CONSTRAINT cm_uk_ak_machinename UNIQUE (machinename)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Triggers for CREDITSMGR.CM_AK_MACHINES

CREATE OR REPLACE TRIGGER creditsmgr.cm_bi_ak_machines
BEFORE INSERT 
ON creditsmgr.cm_ak_machines
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
   IF :NEW.ID IS NULL
   THEN
      SELECT seq_cm_ak_machines.NEXTVAL
        INTO :NEW.ID
        FROM DUAL;
   END IF;
END;
/

-- End of DDL Script for Table CREDITSMGR.CM_AK_MACHINES

-- Start of DDL Script for Table CREDITSMGR.CM_AM_DEV
-- Generated 30-May-2006 16:39:21 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_am_dev
    (symbol                         CHAR(1),
    description                    VARCHAR2(256))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- End of DDL Script for Table CREDITSMGR.CM_AM_DEV

-- Start of DDL Script for Table CREDITSMGR.CM_AUTO_EXP
-- Generated 30-May-2006 16:39:21 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_auto_exp
    (creditid                       NUMBER NOT NULL,
    expamt                         NUMBER NOT NULL,
    expdate                        DATE NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- End of DDL Script for Table CREDITSMGR.CM_AUTO_EXP

-- Start of DDL Script for Table CREDITSMGR.CM_AUTO_RES
-- Generated 30-May-2006 16:39:21 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_auto_res
    (creditid                       NUMBER NOT NULL,
    resamt                         NUMBER NOT NULL,
    resdate                        DATE NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- End of DDL Script for Table CREDITSMGR.CM_AUTO_RES

-- Start of DDL Script for Table CREDITSMGR.CM_AUTOMATION
-- Generated 30-May-2006 16:39:21 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_automation
    (id                             NUMBER NOT NULL,
    description                    VARCHAR2(32))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     24576
    NEXT        16384
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
PARALLEL (DEGREE DEFAULT)
/


-- Comments for CREDITSMGR.CM_AUTOMATION

COMMENT ON TABLE creditsmgr.cm_automation IS 'Read Only Table'
/
COMMENT ON COLUMN creditsmgr.cm_automation.id IS '0-on;1-off'
/

-- End of DDL Script for Table CREDITSMGR.CM_AUTOMATION

-- Start of DDL Script for Table CREDITSMGR.CM_BC_REPORTS
-- Generated 30-May-2006 16:39:21 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_bc_reports
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(127) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Constraints for CREDITSMGR.CM_BC_REPORTS

ALTER TABLE creditsmgr.cm_bc_reports
ADD CONSTRAINT pk_bc_reports PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Triggers for CREDITSMGR.CM_BC_REPORTS

CREATE OR REPLACE TRIGGER creditsmgr.bi_bc_reports
BEFORE INSERT 
ON creditsmgr.cm_bc_reports
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  select seq_bc_reports.nextval
    into :new.id
    from dual;
end;
/

-- End of DDL Script for Table CREDITSMGR.CM_BC_REPORTS

-- Start of DDL Script for Table CREDITSMGR.CM_BOOROWERINFO
-- Generated 30-May-2006 16:39:21 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_boorowerinfo
    (creditid                       NUMBER NOT NULL,
    boorowerid                     VARCHAR2(32),
    name                           VARCHAR2(64),
    countrycode                    VARCHAR2(8) DEFAULT NULL,
    bankrupteystatus               VARCHAR2(16) DEFAULT NULL

 ,
    phonenumber                    VARCHAR2(16),
    address                        VARCHAR2(128),
    firstownerid                   VARCHAR2(32),
    firstownername                 VARCHAR2(64),
    secondownerid                  VARCHAR2(32),
    secondownername                VARCHAR2(64),
    thirdownerid                   VARCHAR2(32),
    thirdownername                 VARCHAR2(64))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- Indexes for CREDITSMGR.CM_BOOROWERINFO

CREATE UNIQUE INDEX creditsmgr.ui_cm_boorowerinfo ON creditsmgr.cm_boorowerinfo
  (
    creditid                        ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits_idx
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- Comments for CREDITSMGR.CM_BOOROWERINFO

COMMENT ON COLUMN creditsmgr.cm_boorowerinfo.boorowerid IS 'Report ID for risk form'
/
COMMENT ON COLUMN creditsmgr.cm_boorowerinfo.creditid IS '->CM_portfolio.ID'
/

-- End of DDL Script for Table CREDITSMGR.CM_BOOROWERINFO

-- Start of DDL Script for Table CREDITSMGR.CM_BP_PURPOSES
-- Generated 30-May-2006 16:39:21 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_bp_purposes
    (id                             NUMBER NOT NULL,
    purposedesc                    VARCHAR2(32))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- End of DDL Script for Table CREDITSMGR.CM_BP_PURPOSES

-- Start of DDL Script for Table CREDITSMGR.CM_BP_TYPES
-- Generated 30-May-2006 16:39:21 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_bp_types
    (id                             NUMBER NOT NULL,
    typedesc                       VARCHAR2(32))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- Constraints for CREDITSMGR.CM_BP_TYPES

ALTER TABLE creditsmgr.cm_bp_types
ADD CONSTRAINT cm_pk_bptype PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- End of DDL Script for Table CREDITSMGR.CM_BP_TYPES

-- Start of DDL Script for Table CREDITSMGR.CM_BUSINESS_PLAN
-- Generated 30-May-2006 16:39:21 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_business_plan
    (creditid                       NUMBER NOT NULL,
    projectcost                    NUMBER(18,2),
    givencredit                    NUMBER(18,2),
    concessionperiod               NUMBER,
    purpose                        NUMBER,
    source                         VARCHAR2(50),
    type                           NUMBER,
    untmeansofproduction           VARCHAR2(10),
    numberofproduction             NUMBER,
    untproduction                  VARCHAR2(10),
    production                     NUMBER,
    productivity                   NUMBER,
    productioncost                 NUMBER(18,2),
    sumprofit                      NUMBER(18,2),
    boughtmaterial                 NUMBER(18,2),
    operationexpense               NUMBER(18,2),
    taxexpense                     NUMBER(18,2),
    otherexpence                   NUMBER(18,2),
    sumexpense                     NUMBER(18,2),
    villageid                      NUMBER,
    akpurpose                      NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- Indexes for CREDITSMGR.CM_BUSINESS_PLAN

CREATE UNIQUE INDEX creditsmgr.uk_cm_business_plan ON creditsmgr.cm_business_plan
  (
    creditid                        ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- Comments for CREDITSMGR.CM_BUSINESS_PLAN

COMMENT ON COLUMN creditsmgr.cm_business_plan.concessionperiod IS '-In Months'
/

-- End of DDL Script for Table CREDITSMGR.CM_BUSINESS_PLAN

-- Start of DDL Script for Table CREDITSMGR.CM_CATEGORIES
-- Generated 30-May-2006 16:39:21 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_categories
    (id                             NUMBER NOT NULL,
    person                         NUMBER DEFAULT 0   NOT NULL,
    code                           VARCHAR2(8),
    description                    VARCHAR2(128))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     24576
    NEXT        16384
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
/


-- Constraints for CREDITSMGR.CM_CATEGORIES

ALTER TABLE creditsmgr.cm_categories
ADD CONSTRAINT pk_cm_categories PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits_idx
  STORAGE   (
    INITIAL     24576
    NEXT        16384
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
/

-- Triggers for CREDITSMGR.CM_CATEGORIES

CREATE OR REPLACE TRIGGER creditsmgr.ai_cm_categories
AFTER INSERT 
ON creditsmgr.cm_categories
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare 
  CategoryID Integer;
begin
  CategoryID := :New.ID;
  CM_SETUP.CategoryLinks_add(CategoryID);
end;
/
CREATE OR REPLACE TRIGGER creditsmgr.bi_cm_categories
BEFORE INSERT 
ON creditsmgr.cm_categories
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  select SEQ_CM_CATEGORIES.NEXTVAL
    into :NEW.ID
    from DUAL;
end;
/

-- Comments for CREDITSMGR.CM_CATEGORIES

COMMENT ON COLUMN creditsmgr.cm_categories.code IS 'Risk Form'
/
COMMENT ON COLUMN creditsmgr.cm_categories.id IS 'Trigger'
/
COMMENT ON COLUMN creditsmgr.cm_categories.person IS '0 - Pysikal ; 1 -juridical'
/

-- End of DDL Script for Table CREDITSMGR.CM_CATEGORIES

-- Start of DDL Script for Table CREDITSMGR.CM_CONTROLS
-- Generated 30-May-2006 16:39:21 from CREDITSMGR@SB

CREATE GLOBAL TEMPORARY TABLE creditsmgr.cm_controls
    (numberofcredit                 VARCHAR2(30) NOT NULL,
    custname                       VARCHAR2(68) NOT NULL,
    drest                          NUMBER,
    dinterestrest                  NUMBER,
    dduerest                       NUMBER,
    ddueinterestrest               NUMBER)
ON COMMIT DELETE ROWS
/


-- End of DDL Script for Table CREDITSMGR.CM_CONTROLS

-- Start of DDL Script for Table CREDITSMGR.CM_COUNTRYS
-- Generated 30-May-2006 16:39:21 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_countrys
    (code                           VARCHAR2(3) NOT NULL,
    name                           VARCHAR2(255) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     24576
    NEXT        16384
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
PARALLEL (DEGREE DEFAULT)
/


-- End of DDL Script for Table CREDITSMGR.CM_COUNTRYS

-- Start of DDL Script for Table CREDITSMGR.CM_CREDITTYPES
-- Generated 30-May-2006 16:39:21 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_credittypes
    (id                             NUMBER NOT NULL,
    renewablestatus                NUMBER DEFAULT 0    NOT NULL,
    itype                          NUMBER DEFAULT 0    NOT NULL,
    iclass                         NUMBER DEFAULT 0    NOT NULL,
    description                    VARCHAR2(128))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     24576
    NEXT        16384
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
/


-- Constraints for CREDITSMGR.CM_CREDITTYPES

ALTER TABLE creditsmgr.cm_credittypes
ADD CONSTRAINT pk_cm_credittypes PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits_idx
  STORAGE   (
    INITIAL     24576
    NEXT        16384
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
/

-- Triggers for CREDITSMGR.CM_CREDITTYPES

CREATE OR REPLACE TRIGGER creditsmgr.bi_seq_cm_credittypes
BEFORE INSERT 
ON creditsmgr.cm_credittypes
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  select  SEQ_CM_CREDITTYPES.NEXTVAL
    into :NEW.ID 
    from DUAL;  
end;
/

-- Comments for CREDITSMGR.CM_CREDITTYPES

COMMENT ON COLUMN creditsmgr.cm_credittypes.itype IS '1-credit xetti'
/
COMMENT ON COLUMN creditsmgr.cm_credittypes.renewablestatus IS '0-;1-Berpaolunma(0-berpa olun!!mur)'
/

-- End of DDL Script for Table CREDITSMGR.CM_CREDITTYPES

-- Start of DDL Script for Table CREDITSMGR.CM_DUERESTS_SD
-- Generated 30-May-2006 16:39:21 from CREDITSMGR@SB

CREATE GLOBAL TEMPORARY TABLE creditsmgr.cm_duerests_sd
    (id                             NUMBER,
    dateofcredit                   VARCHAR2(25) NOT NULL,
    namount                        NUMBER,
    navgintamount                  NUMBER,
    famount                        NUMBER,
    favgintamount                  NUMBER,
    fnamount                       NUMBER,
    fnavgintamount                 NUMBER)
ON COMMIT DELETE ROWS
/


-- End of DDL Script for Table CREDITSMGR.CM_DUERESTS_SD

-- Start of DDL Script for Table CREDITSMGR.CM_ERRORS
-- Generated 30-May-2006 16:39:21 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_errors
    (errcode                        NUMBER NOT NULL,
    errmessage                     VARCHAR2(255) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- End of DDL Script for Table CREDITSMGR.CM_ERRORS

-- Start of DDL Script for Table CREDITSMGR.CM_EXPIRES
-- Generated 30-May-2006 16:39:21 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_expires
    (id                             NUMBER NOT NULL,
    creditid                       NUMBER NOT NULL,
    expdate                        DATE NOT NULL,
    expamount                      NUMBER(18,2) NOT NULL,
    oldduereserveid                NUMBER,
    exptrid                        NUMBER,
    prestrid                       NUMBER,
    srestrid                       NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- Indexes for CREDITSMGR.CM_EXPIRES

CREATE UNIQUE INDEX creditsmgr.idx_cm_expire ON creditsmgr.cm_expires
  (
    id                              ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits_idx
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- Triggers for CREDITSMGR.CM_EXPIRES

CREATE OR REPLACE TRIGGER creditsmgr.bi_cm_expire
BEFORE INSERT 
ON creditsmgr.cm_expires
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  select SEQ_CM_EXPIRE.NEXTVAL 
    into :NEW.ID 
    from DUAL;
end;
/

-- Comments for CREDITSMGR.CM_EXPIRES

COMMENT ON COLUMN creditsmgr.cm_expires.creditid IS '->cm_portf'
/
COMMENT ON COLUMN creditsmgr.cm_expires.id IS 'Trigger'
/

-- End of DDL Script for Table CREDITSMGR.CM_EXPIRES

-- Start of DDL Script for Table CREDITSMGR.CM_GENERATECHILDACCOUNTS
-- Generated 30-May-2006 16:39:21 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_generatechildaccounts
    (id                             NUMBER NOT NULL,
    genid                          NUMBER NOT NULL,
    bal_acc                        NUMBER,
    name                           VARCHAR2(80))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Constraints for CREDITSMGR.CM_GENERATECHILDACCOUNTS

ALTER TABLE creditsmgr.cm_generatechildaccounts
ADD CONSTRAINT pr_ch PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Triggers for CREDITSMGR.CM_GENERATECHILDACCOUNTS

CREATE OR REPLACE TRIGGER creditsmgr.bi_gench
BEFORE INSERT 
ON creditsmgr.cm_generatechildaccounts
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
select SEG_GCACC.NEXTVAL into :new.id from dual;
end;
/

-- End of DDL Script for Table CREDITSMGR.CM_GENERATECHILDACCOUNTS

-- Start of DDL Script for Table CREDITSMGR.CM_GENERATEMAINACCOUNTS
-- Generated 30-May-2006 16:39:22 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_generatemainaccounts
    (id                             NUMBER NOT NULL,
    bal_acc                        NUMBER NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Constraints for CREDITSMGR.CM_GENERATEMAINACCOUNTS

ALTER TABLE creditsmgr.cm_generatemainaccounts
ADD CONSTRAINT pr_gen_main PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Triggers for CREDITSMGR.CM_GENERATEMAINACCOUNTS

CREATE OR REPLACE TRIGGER creditsmgr.ai_gma
AFTER INSERT 
ON creditsmgr.cm_generatemainaccounts
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare

cursor c_name is
select description as name from cm_accountgroups where id  not in (1,9,10);

--cc c_name%rowtype;
r varchar2(30);
begin

for c in c_name
loop
insert into cm_generatechildaccounts(genid,name,bal_acc)
values(:new.id,c.name,null);
end loop;
end;
/
CREATE OR REPLACE TRIGGER creditsmgr.bi_macc
BEFORE INSERT 
ON creditsmgr.cm_generatemainaccounts
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
select SEQ_GMACC.NEXTVAL into :new.id from  dual;
end;
/

-- End of DDL Script for Table CREDITSMGR.CM_GENERATEMAINACCOUNTS

-- Start of DDL Script for Table CREDITSMGR.CM_GUARANTEE
-- Generated 30-May-2006 16:39:22 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_guarantee
    (creditid                       NUMBER NOT NULL,
    pledgeid                       NUMBER NOT NULL,
    pledgename                     VARCHAR2(128),
    holdername                     VARCHAR2(128),
    holderaddress                  VARCHAR2(128),
    anyinfotodisting               VARCHAR2(128),
    registryno                     VARCHAR2(32),
    registryagency                 VARCHAR2(64),
    registrydate                   DATE,
    pledgeinuse                    NUMBER DEFAULT 0,
    pledgeinsurant                 NUMBER DEFAULT 0,
    insuranceagency                VARCHAR2(128),
    insuranceamount                NUMBER(18,2),
    insurancedate                  DATE)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- Indexes for CREDITSMGR.CM_GUARANTEE

CREATE UNIQUE INDEX creditsmgr.ui_cm_guarantee ON creditsmgr.cm_guarantee
  (
    creditid                        ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits_idx
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- Comments for CREDITSMGR.CM_GUARANTEE

COMMENT ON COLUMN creditsmgr.cm_guarantee.creditid IS '->CM_PORTFOLIO'
/
COMMENT ON COLUMN creditsmgr.cm_guarantee.pledgeinsurant IS '1 - Yes 0 - No'
/
COMMENT ON COLUMN creditsmgr.cm_guarantee.pledgeinuse IS '1 - Yes 0 - No'
/

-- End of DDL Script for Table CREDITSMGR.CM_GUARANTEE

-- Start of DDL Script for Table CREDITSMGR.CM_HISTORY
-- Generated 30-May-2006 16:39:22 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_history
    (creditid                       NUMBER NOT NULL,
    hdate                          DATE NOT NULL,
    lastcalcdate                   DATE NOT NULL,
    stopcalcdate                   DATE,
    rest                           NUMBER(18,2) DEFAULT 0  NOT NULL,
    interestrest                   NUMBER(18,2) DEFAULT 0  NOT NULL,
    duerest                        NUMBER(18,2) DEFAULT 0  NOT NULL,
    dueinterestrest                NUMBER(18,2) DEFAULT 0  NOT NULL,
    reserveid                      NUMBER NOT NULL,
    givenamount                    NUMBER(18,2) DEFAULT 0  NOT NULL,
    obligation                     NUMBER(18,2) DEFAULT 0  NOT NULL,
    pledgeprice                    NUMBER(18,2) DEFAULT 0  NOT NULL,
    partitionkey                   NUMBER DEFAULT 0  NOT NULL,
    duereserveid                   NUMBER DEFAULT 0

 ,
    oldreserveid                   NUMBER,
    oldduereserveid                NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits_history
  STORAGE   (
    MAXEXTENTS  2147483645
    BUFFER_POOL KEEP
  )
  PARTITION BY RANGE (PARTITIONKEY)
  (
  PARTITION CURR_STATE VALUES LESS THAN (1)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255,
  PARTITION PREV_STATE VALUES LESS THAN (2)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255,
  PARTITION ARCHIVE_STATE VALUES LESS THAN (MAXVALUE)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  )
PARALLEL (DEGREE DEFAULT)
CACHE
/


-- Indexes for CREDITSMGR.CM_HISTORY

CREATE UNIQUE INDEX creditsmgr.uk_history ON creditsmgr.cm_history
  (
    hdate                           ASC,
    creditid                        ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Triggers for CREDITSMGR.CM_HISTORY

CREATE OR REPLACE TRIGGER creditsmgr.bu_hist
BEFORE UPDATE 
ON creditsmgr.cm_history
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN

if (:OLD.reserveid <> :NEW.reserveid) then
    :new.oldreserveid:=:OLD.reserveid;
end if;


if (:OLD.duereserveid <> :NEW.duereserveid) then
    :new.oldduereserveid := :OLD.duereserveid;   
end if;



END;
/

-- End of DDL Script for Table CREDITSMGR.CM_HISTORY

-- Start of DDL Script for Table CREDITSMGR.CM_INT_OUTBALANCE
-- Generated 30-May-2006 16:39:22 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_int_outbalance
    (id                             NUMBER NOT NULL,
    tramount                       NUMBER NOT NULL,
    trinbalance                    NUMBER,
    trinoutbalance                 NUMBER,
    creditid                       NUMBER NOT NULL,
    trdate                         DATE)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- Constraints for CREDITSMGR.CM_INT_OUTBALANCE

ALTER TABLE creditsmgr.cm_int_outbalance
ADD CONSTRAINT pk PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/
ALTER TABLE creditsmgr.cm_int_outbalance
ADD CONSTRAINT uk UNIQUE (creditid)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Triggers for CREDITSMGR.CM_INT_OUTBALANCE

CREATE OR REPLACE TRIGGER creditsmgr.bi_cmint
BEFORE INSERT 
ON creditsmgr.cm_int_outbalance
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
select CM_INTOUT.NEXTVAL into :NEW.id from dual;

end;
/

-- End of DDL Script for Table CREDITSMGR.CM_INT_OUTBALANCE

-- Start of DDL Script for Table CREDITSMGR.CM_INTERESTS
-- Generated 30-May-2006 16:39:22 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_interests
    (partitionkey                   NUMBER NOT NULL,
    creditid                       NUMBER NOT NULL,
    hdate                          DATE NOT NULL,
    interest                       NUMBER(25,7) NOT NULL,
    dueinterest                    NUMBER(25,7) NOT NULL,
    inttrid                        NUMBER,
    dueinttrid                     NUMBER,
    trprocessed                    NUMBER NOT NULL,
    intprecision                   NUMBER(8,7) DEFAULT 0 NOT NULL,
    dueintprecision                NUMBER(8,7) DEFAULT 0

  NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    BUFFER_POOL DEFAULT
  )
  PARTITION BY RANGE (PARTITIONKEY)
  (
  PARTITION CURR_STATE VALUES LESS THAN (1)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255,
  PARTITION PREV_STATE VALUES LESS THAN (2)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255,
  PARTITION ARCHIVE_STATE VALUES LESS THAN (MAXVALUE)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  )
/


-- Indexes for CREDITSMGR.CM_INTERESTS

CREATE UNIQUE INDEX creditsmgr.idx_cm_interests ON creditsmgr.cm_interests
  (
    creditid                        ASC,
    hdate                           ASC,
    partitionkey                    ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits_idx
  STORAGE   (
    BUFFER_POOL DEFAULT
  )
PARALLEL (DEGREE DEFAULT)
LOCAL (
PARTITION CURR_STATE
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255,
PARTITION PREV_STATE
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255,
PARTITION ARCHIVE_STATE
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
)
/


-- Comments for CREDITSMGR.CM_INTERESTS

COMMENT ON COLUMN creditsmgr.cm_interests.partitionkey IS '0-Today'
/
COMMENT ON COLUMN creditsmgr.cm_interests.trprocessed IS '0 - not Processed;1-processed 2-commited'
/

-- End of DDL Script for Table CREDITSMGR.CM_INTERESTS

-- Start of DDL Script for Table CREDITSMGR.CM_LEGAL_MEASURE_NAMES
-- Generated 30-May-2006 16:39:22 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_legal_measure_names
    (id                             NUMBER NOT NULL,
    description                    VARCHAR2(255))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- Constraints for CREDITSMGR.CM_LEGAL_MEASURE_NAMES

ALTER TABLE creditsmgr.cm_legal_measure_names
ADD CONSTRAINT cm_pk_lmn_id PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- End of DDL Script for Table CREDITSMGR.CM_LEGAL_MEASURE_NAMES

-- Start of DDL Script for Table CREDITSMGR.CM_LEGAL_MEASURES
-- Generated 30-May-2006 16:39:22 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_legal_measures
    (id                             NUMBER NOT NULL,
    creditid                       NUMBER NOT NULL,
    protocol                       NUMBER,
    paragraph                      NUMBER,
    grantdate                      DATE,
    givedate                       DATE,
    measurecode                    NUMBER,
    totalamount                    NUMBER(18,2),
    maindebt                       NUMBER(18,2),
    num                            NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- Triggers for CREDITSMGR.CM_LEGAL_MEASURES

CREATE OR REPLACE TRIGGER creditsmgr.bi_cm_legal_measures
BEFORE INSERT 
ON creditsmgr.cm_legal_measures
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  select SEQ_CM_LEGAL_MEASURES.NEXTVAL
    into :NEW.ID 
    from DUAL;
end;
/

-- Comments for CREDITSMGR.CM_LEGAL_MEASURES

COMMENT ON COLUMN creditsmgr.cm_legal_measures.id IS 'Trigger'
/
COMMENT ON COLUMN creditsmgr.cm_legal_measures.measurecode IS '-->MeasureNames'
/

-- End of DDL Script for Table CREDITSMGR.CM_LEGAL_MEASURES

-- Start of DDL Script for Table CREDITSMGR.CM_LINK_VALUES
-- Generated 30-May-2006 16:39:22 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_link_values
    (linkid                         NUMBER NOT NULL,
    branchid                       NUMBER NOT NULL,
    currencyid                     NUMBER NOT NULL,
    accountid                      NUMBER NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Constraints for CREDITSMGR.CM_LINK_VALUES

ALTER TABLE creditsmgr.cm_link_values
ADD CONSTRAINT uk_cm_link_values UNIQUE (linkid, branchid, currencyid, accountid)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits_idx
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Comments for CREDITSMGR.CM_LINK_VALUES

COMMENT ON COLUMN creditsmgr.cm_link_values.accountid IS '-> Smart.Account.ID'
/
COMMENT ON COLUMN creditsmgr.cm_link_values.currencyid IS '-> Smart.Avalute.valute'
/

-- End of DDL Script for Table CREDITSMGR.CM_LINK_VALUES

-- Start of DDL Script for Table CREDITSMGR.CM_LINKS
-- Generated 30-May-2006 16:39:22 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_links
    (id                             NUMBER NOT NULL,
    categoryid                     NUMBER NOT NULL,
    link                           VARCHAR2(32) NOT NULL,
    description                    VARCHAR2(128))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Constraints for CREDITSMGR.CM_LINKS

ALTER TABLE creditsmgr.cm_links
ADD CONSTRAINT pk_cm_links PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits_idx
  STORAGE   (
    INITIAL     81920
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/
ALTER TABLE creditsmgr.cm_links
ADD CONSTRAINT uk_cm_links UNIQUE (categoryid, link)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits_idx
  STORAGE   (
    INITIAL     81920
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Triggers for CREDITSMGR.CM_LINKS

CREATE OR REPLACE TRIGGER creditsmgr.bi_cm_links
BEFORE INSERT 
ON creditsmgr.cm_links
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  select SEQ_CM_LINKS.NEXTVAL
    into :NEW.ID
    from DUAL;
end;
/

-- Comments for CREDITSMGR.CM_LINKS

COMMENT ON COLUMN creditsmgr.cm_links.id IS 'Trigger'
/

-- End of DDL Script for Table CREDITSMGR.CM_LINKS

-- Start of DDL Script for Table CREDITSMGR.CM_N2_SDT
-- Generated 30-May-2006 16:39:22 from CREDITSMGR@SB

CREATE GLOBAL TEMPORARY TABLE creditsmgr.cm_n2_sdt
    (id                             NUMBER NOT NULL,
    region_name                    VARCHAR2(34) NOT NULL,
    generalamt                     NUMBER NOT NULL,
    avgamt                         NUMBER NOT NULL,
    natvalamt                      NUMBER NOT NULL,
    avgnatvalamt                   NUMBER NOT NULL,
    freevalamt                     NUMBER NOT NULL,
    avgfreevalamt                  NUMBER NOT NULL,
    expiresamt                     NUMBER NOT NULL,
    branch                         VARCHAR2(34) NOT NULL)
ON COMMIT DELETE ROWS
/


-- Triggers for CREDITSMGR.CM_N2_SDT

CREATE OR REPLACE TRIGGER creditsmgr.bi_n2sd
BEFORE INSERT 
ON creditsmgr.cm_n2_sdt
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
select SEG_N3_SDT.NEXTVAL into :new.id from dual;
end;
/

-- End of DDL Script for Table CREDITSMGR.CM_N2_SDT

-- Start of DDL Script for Table CREDITSMGR.CM_N3_SDT
-- Generated 30-May-2006 16:39:23 from CREDITSMGR@SB

CREATE GLOBAL TEMPORARY TABLE creditsmgr.cm_n3_sdt
    (id                             NUMBER NOT NULL,
    vidsop                         VARCHAR2(25),
    region_name                    VARCHAR2(25),
    category_name                  VARCHAR2(45),
    amt                            NUMBER NOT NULL,
    branchid                       NUMBER)
ON COMMIT DELETE ROWS
/


-- Triggers for CREDITSMGR.CM_N3_SDT

CREATE OR REPLACE TRIGGER creditsmgr.bi_nsd
BEFORE INSERT 
ON creditsmgr.cm_n3_sdt
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin

select SEG_N3_SDT.NEXTVAL into :new.id from dual;
end;
/

-- End of DDL Script for Table CREDITSMGR.CM_N3_SDT

-- Start of DDL Script for Table CREDITSMGR.CM_OBLIGATIONS_SD
-- Generated 30-May-2006 16:39:23 from CREDITSMGR@SB

CREATE GLOBAL TEMPORARY TABLE creditsmgr.cm_obligations_sd
    (id                             NUMBER,
    dateofcredit                   VARCHAR2(25) NOT NULL,
    namount                        NUMBER,
    navgintamount                  NUMBER,
    famount                        NUMBER,
    favgintamount                  NUMBER,
    fnamount                       NUMBER,
    fnavgintamount                 NUMBER)
ON COMMIT DELETE ROWS
/


-- End of DDL Script for Table CREDITSMGR.CM_OBLIGATIONS_SD

-- Start of DDL Script for Table CREDITSMGR.CM_PAYMENT_SCHEDULE
-- Generated 30-May-2006 16:39:23 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_payment_schedule
    (id                             NUMBER NOT NULL,
    creditid                       NUMBER NOT NULL,
    paymentdate                    DATE NOT NULL,
    principal                      NUMBER(18,2) NOT NULL,
    interest                       NUMBER(18,2) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- Indexes for CREDITSMGR.CM_PAYMENT_SCHEDULE

CREATE UNIQUE INDEX creditsmgr.ui_cm_repayment_plan ON creditsmgr.cm_payment_schedule
  (
    id                              ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits_idx
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- Constraints for CREDITSMGR.CM_PAYMENT_SCHEDULE

ALTER TABLE creditsmgr.cm_payment_schedule
ADD CONSTRAINT uk_cm_repayment_plan UNIQUE (creditid, paymentdate)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits_idx
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Triggers for CREDITSMGR.CM_PAYMENT_SCHEDULE

CREATE OR REPLACE TRIGGER creditsmgr.bi_cm_payment_schedule
BEFORE INSERT 
ON creditsmgr.cm_payment_schedule
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  select seq_cm_payment_schedule.nextval 
  into :new.ID from dual;
end;
/

-- End of DDL Script for Table CREDITSMGR.CM_PAYMENT_SCHEDULE

-- Start of DDL Script for Table CREDITSMGR.CM_PAYMENTS
-- Generated 30-May-2006 16:39:23 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_payments
    (id                             NUMBER NOT NULL,
    creditid                       NUMBER NOT NULL,
    paydate                        DATE NOT NULL,
    payedamt                       NUMBER(18,2) NOT NULL,
    payedintamt                    NUMBER(18,2) NOT NULL,
    payeddueamt                    NUMBER(18,2) NOT NULL,
    payeddueintamt                 NUMBER(18,2) NOT NULL,
    payedpenaltyamt                NUMBER(18,2) NOT NULL,
    tridamt                        NUMBER,
    tridintamt                     NUMBER,
    triddueamt                     NUMBER,
    triddueintamt                  NUMBER,
    tridpenaltyamt                 NUMBER,
    tridprimreserve                NUMBER,
    tridsecreserve                 NUMBER,
    outtridobligation              NUMBER,
    trobligation                   NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- Indexes for CREDITSMGR.CM_PAYMENTS

CREATE UNIQUE INDEX creditsmgr.ui_cm_payments_id ON creditsmgr.cm_payments
  (
    id                              ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits_idx
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- Triggers for CREDITSMGR.CM_PAYMENTS

CREATE OR REPLACE TRIGGER creditsmgr.bi_cm_payments
BEFORE INSERT 
ON creditsmgr.cm_payments
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  select SEQ_CM_PAYMENTS.nextval
    into :NEW.ID 
    from DUAL;
end;
/

-- Comments for CREDITSMGR.CM_PAYMENTS

COMMENT ON COLUMN creditsmgr.cm_payments.creditid IS '->CreditID'
/
COMMENT ON COLUMN creditsmgr.cm_payments.id IS 'Autoinc'
/

-- End of DDL Script for Table CREDITSMGR.CM_PAYMENTS

-- Start of DDL Script for Table CREDITSMGR.CM_PAYMENTS_SD
-- Generated 30-May-2006 16:39:23 from CREDITSMGR@SB

CREATE GLOBAL TEMPORARY TABLE creditsmgr.cm_payments_sd
    (id                             NUMBER,
    dateofcredit                   VARCHAR2(25) NOT NULL,
    namount                        NUMBER,
    navgintamount                  NUMBER,
    famount                        NUMBER,
    favgintamount                  NUMBER,
    fnamount                       NUMBER,
    fnavgintamount                 NUMBER)
ON COMMIT DELETE ROWS
/


-- End of DDL Script for Table CREDITSMGR.CM_PAYMENTS_SD

-- Start of DDL Script for Table CREDITSMGR.CM_PERIODS
-- Generated 30-May-2006 16:39:23 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_periods
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(25),
    bperiod                        NUMBER,
    eperiod                        NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- End of DDL Script for Table CREDITSMGR.CM_PERIODS

-- Start of DDL Script for Table CREDITSMGR.CM_PERSONS
-- Generated 30-May-2006 16:39:23 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_persons
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(32) NOT NULL,
    descripion                     VARCHAR2(64))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     24576
    NEXT        16384
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
PARALLEL (DEGREE DEFAULT)
/


-- Constraints for CREDITSMGR.CM_PERSONS

ALTER TABLE creditsmgr.cm_persons
ADD CONSTRAINT pk_cm_persons PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits_idx
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Comments for CREDITSMGR.CM_PERSONS

COMMENT ON COLUMN creditsmgr.cm_persons.name IS 'Natural,Juridical Peson'
/

-- End of DDL Script for Table CREDITSMGR.CM_PERSONS

-- Start of DDL Script for Table CREDITSMGR.CM_PLEDGES
-- Generated 30-May-2006 16:39:23 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_pledges
    (id                             NUMBER NOT NULL,
    typecode                       VARCHAR2(8) NOT NULL,
    description                    VARCHAR2(64))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     24576
    NEXT        16384
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
/


-- End of DDL Script for Table CREDITSMGR.CM_PLEDGES

-- Start of DDL Script for Table CREDITSMGR.CM_PORT_FILIALS
-- Generated 30-May-2006 16:39:23 from CREDITSMGR@SB

CREATE GLOBAL TEMPORARY TABLE creditsmgr.cm_port_filials
    (personsname                    VARCHAR2(20),
    filialname                     VARCHAR2(30),
    facticalrest                   NUMBER,
    rest                           NUMBER,
    restdue                        NUMBER,
    tramt                          NUMBER,
    payamt                         NUMBER,
    paydue                         NUMBER,
    expamt                         NUMBER,
    lastfacticalrest               NUMBER,
    lastrest                       NUMBER,
    lastduerest                    NUMBER,
    percentexp                     NUMBER,
    tranchplamt                    NUMBER,
    payplamt                       NUMBER)
ON COMMIT DELETE ROWS
/


-- End of DDL Script for Table CREDITSMGR.CM_PORT_FILIALS

-- Start of DDL Script for Table CREDITSMGR.CM_PORTFOLIO
-- Generated 30-May-2006 16:39:23 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_portfolio
    (id                             NUMBER NOT NULL,
    currency                       NUMBER NOT NULL,
    boorowerid                     NUMBER NOT NULL,
    initialamount                  NUMBER(18,2) DEFAULT 0  NOT NULL,
    creditlineamount               NUMBER(18,2) DEFAULT 0    NOT NULL,
    annualyinterestrate            NUMBER(7,4) DEFAULT 0

   NOT NULL,
    annualyoverduerate             NUMBER(7,4) DEFAULT 0    NOT NULL,
    annualypenaltyrate             NUMBER(7,4) DEFAULT 0    NOT NULL,
    dateofconclusion               DATE NOT NULL,
    dateofgrant                    DATE,
    duedatefirstcontract           DATE NOT NULL,
    duedatelastcontract            DATE,
    closedate                      DATE,
    numberofcredit                 VARCHAR2(32),
    purposeofcredit                VARCHAR2(128),
    customertype                   NUMBER NOT NULL,
    credittype                     NUMBER NOT NULL,
    personaltype                   NUMBER NOT NULL,
    autopayment                    NUMBER DEFAULT 0   NOT NULL,
    autoexpire                     NUMBER DEFAULT 0   NOT NULL,
    usrgroup                       NUMBER DEFAULT 0  NOT NULL,
    branchid                       NUMBER DEFAULT 0    NOT NULL,
    usid                           NUMBER NOT NULL,
    partitionkey                   NUMBER DEFAULT 0

    NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    BUFFER_POOL DEFAULT
  )
  PARTITION BY RANGE (PARTITIONKEY)
  (
  PARTITION ACTIVECREDITS VALUES LESS THAN (1)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255,
  PARTITION INACTIVECREDITS VALUES LESS THAN (2)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  )
/


-- Constraints for CREDITSMGR.CM_PORTFOLIO

ALTER TABLE creditsmgr.cm_portfolio
ADD CONSTRAINT pk_cm_portfolio PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits_idx
  STORAGE   (
    INITIAL     122880
    NEXT        65536
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
/
ALTER TABLE creditsmgr.cm_portfolio
ADD CONSTRAINT uk_cm_portf_numberofcrd UNIQUE (numberofcredit)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits_idx
  STORAGE   (
    INITIAL     122880
    NEXT        65536
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
/

-- Triggers for CREDITSMGR.CM_PORTFOLIO

CREATE OR REPLACE TRIGGER creditsmgr.bi_cm_portfolio_gen_id
BEFORE INSERT 
ON creditsmgr.cm_portfolio
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  select  SEQ_CM_PORTFOLIO.NEXTVAL
    into :NEW.ID 
    from DUAL;
end;
/
CREATE OR REPLACE TRIGGER creditsmgr.bi_cm_portfolio_uid
BEFORE INSERT 
ON creditsmgr.cm_portfolio
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  :new.USID := uid;
end;
/

-- Comments for CREDITSMGR.CM_PORTFOLIO

COMMENT ON TABLE creditsmgr.cm_portfolio IS 'Main Table contests information about contract'
/
COMMENT ON COLUMN creditsmgr.cm_portfolio.autoexpire IS '1 - Auto expire On 0 - Off'
/
COMMENT ON COLUMN creditsmgr.cm_portfolio.autopayment IS '1 - Auto payment On 0 - Off'
/
COMMENT ON COLUMN creditsmgr.cm_portfolio.boorowerid IS '->  Smart.Customers'
/
COMMENT ON COLUMN creditsmgr.cm_portfolio.currency IS '->  Smart.Avalute'
/
COMMENT ON COLUMN creditsmgr.cm_portfolio.id IS 'Trigger'
/
COMMENT ON COLUMN creditsmgr.cm_portfolio.partitionkey IS '0-ActiveCredits 1-InactiveCredits'
/
COMMENT ON COLUMN creditsmgr.cm_portfolio.usid IS 'Value Gived By Trigger'
/

-- End of DDL Script for Table CREDITSMGR.CM_PORTFOLIO

-- Start of DDL Script for Table CREDITSMGR.CM_PROLONGATIONS
-- Generated 30-May-2006 16:39:23 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_prolongations
    (id                             NUMBER NOT NULL,
    creditid                       NUMBER NOT NULL,
    prolongdate                    DATE NOT NULL,
    newclosedate                   DATE NOT NULL,
    oldclosedate                   DATE NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- Indexes for CREDITSMGR.CM_PROLONGATIONS

CREATE UNIQUE INDEX creditsmgr.idx_cm_prolongations ON creditsmgr.cm_prolongations
  (
    creditid                        ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits_idx
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- Triggers for CREDITSMGR.CM_PROLONGATIONS

CREATE OR REPLACE TRIGGER creditsmgr.bi_cm_prolongations
BEFORE INSERT 
ON creditsmgr.cm_prolongations
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  select SEQ_CM_PROLONGATIONS.NEXTVAL 
    into :NEW.ID
    from DUAL;
end;
/

-- End of DDL Script for Table CREDITSMGR.CM_PROLONGATIONS

-- Start of DDL Script for Table CREDITSMGR.CM_REFERENCES
-- Generated 30-May-2006 16:39:23 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_references
    (id                             NUMBER NOT NULL,
    parentid                       NUMBER NOT NULL,
    iname                          VARCHAR2(32) NOT NULL,
    description                    VARCHAR2(255),
    integervalue                   NUMBER,
    charvalue                      VARCHAR2(8),
    availablevalues                VARCHAR2(64))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Triggers for CREDITSMGR.CM_REFERENCES

CREATE OR REPLACE TRIGGER creditsmgr.bi_cm_references
BEFORE INSERT 
ON creditsmgr.cm_references
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  select SEQ_CM_REFERENCES.NEXTVAL
    into :NEW.ID
    from DUAL;
end;
/

-- Comments for CREDITSMGR.CM_REFERENCES

COMMENT ON COLUMN creditsmgr.cm_references.integervalue IS 'Internal'
/

-- End of DDL Script for Table CREDITSMGR.CM_REFERENCES

-- Start of DDL Script for Table CREDITSMGR.CM_REPLACE_BOOKMARKS
-- Generated 30-May-2006 16:39:23 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_replace_bookmarks
    (tablename                      VARCHAR2(100),
    fieldname                      VARCHAR2(100),
    bookmark                       VARCHAR2(100),
    description                    VARCHAR2(255))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Constraints for CREDITSMGR.CM_REPLACE_BOOKMARKS

ALTER TABLE creditsmgr.cm_replace_bookmarks
ADD CONSTRAINT uk_bookmark UNIQUE (bookmark)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/
ALTER TABLE creditsmgr.cm_replace_bookmarks
ADD CONSTRAINT uk_tablefield UNIQUE (fieldname, tablename)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Triggers for CREDITSMGR.CM_REPLACE_BOOKMARKS

CREATE OR REPLACE TRIGGER creditsmgr.trg_upper_repbookmarks
BEFORE INSERT 
ON creditsmgr.cm_replace_bookmarks
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  :NEW.TABLENAME := UPPER (:NEW.TABLENAME);
  :NEW.FIELDNAME := UPPER (:NEW.FIELDNAME);  
end;
/

-- End of DDL Script for Table CREDITSMGR.CM_REPLACE_BOOKMARKS

-- Start of DDL Script for Table CREDITSMGR.CM_REPORT_F1
-- Generated 30-May-2006 16:39:23 from CREDITSMGR@SB

CREATE GLOBAL TEMPORARY TABLE creditsmgr.cm_report_f1
    (creditid                       NUMBER(20) NOT NULL,
    boorowerid                     NUMBER(20) NOT NULL,
    crdnum                         VARCHAR2(255) NOT NULL,
    boorowername                   VARCHAR2(255) NOT NULL,
    branchid                       NUMBER NOT NULL,
    branch                         VARCHAR2(255) NOT NULL,
    districtid                     NUMBER NOT NULL,
    district                       VARCHAR2(255) NOT NULL,
    villageid                      NUMBER NOT NULL,
    village                        VARCHAR2(255) NOT NULL,
    purposeid                      NUMBER NOT NULL,
    purpose                        VARCHAR2(255) NOT NULL,
    typeid                         NUMBER NOT NULL,
    typedesc                       VARCHAR2(10) NOT NULL,
    crdcount                       NUMBER DEFAULT 1    NOT NULL,
    payedcrdcount                  NUMBER DEFAULT 1    NOT NULL,
    firsttrchdate                  DATE NOT NULL,
    lastpaydate                    DATE NOT NULL,
    givenamount                    NUMBER(18,2) NOT NULL,
    calculatedpercent              NUMBER(18,2) NOT NULL,
    datedebtmain                   NUMBER(18,2) NOT NULL,
    datedebtint                    NUMBER(18,2) NOT NULL,
    payedmain                      NUMBER(18,2) NOT NULL,
    payedint                       NUMBER(18,2) NOT NULL,
    payedmonmain                   NUMBER(18,2) NOT NULL,
    payedmonint                    NUMBER(18,2) NOT NULL,
    debtmain                       NUMBER(18,2) NOT NULL,
    debtint                        NUMBER(18,2) NOT NULL,
    debtovermain                   NUMBER(18,2) NOT NULL,
    debtoverint                    NUMBER(18,2) NOT NULL)
ON COMMIT DELETE ROWS
/


-- Triggers for CREDITSMGR.CM_REPORT_F1

CREATE OR REPLACE TRIGGER creditsmgr.cm_bi_report_f1
BEFORE INSERT 
ON creditsmgr.cm_report_f1
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
   :NEW.givenamount := ROUND (:NEW.givenamount / 1000, 1);
   :NEW.calculatedpercent := ROUND (:NEW.calculatedpercent / 1000, 1);
   :NEW.datedebtmain := ROUND (:NEW.datedebtmain / 1000, 1);
   :NEW.datedebtint := ROUND (:NEW.datedebtint / 1000, 1);
   :NEW.payedmain := ROUND (:NEW.payedmain / 1000, 1);
   :NEW.payedint := ROUND (:NEW.payedint / 1000, 1);
   :NEW.payedmonmain := ROUND (:NEW.payedmonmain / 1000, 1);
   :NEW.payedmonint := ROUND (:NEW.payedmonint / 1000, 1);
   :NEW.debtmain := ROUND (:NEW.debtmain / 1000, 1);
   :NEW.debtint := ROUND (:NEW.debtint / 1000, 1);
   :NEW.debtovermain := ROUND (:NEW.debtovermain / 1000, 1);
   :NEW.debtoverint := ROUND (:NEW.debtoverint / 1000, 1);
END;
/

-- End of DDL Script for Table CREDITSMGR.CM_REPORT_F1

-- Start of DDL Script for Table CREDITSMGR.CM_REPORT_SD1
-- Generated 30-May-2006 16:39:23 from CREDITSMGR@SB

CREATE GLOBAL TEMPORARY TABLE creditsmgr.cm_report_sd1
    (creditid                       NUMBER NOT NULL,
    contractno                     VARCHAR2(25) NOT NULL,
    pbmain                         NUMBER(18,2) NOT NULL,
    epbmain                        NUMBER(18,2) NOT NULL,
    pbint                          NUMBER(18,2) NOT NULL,
    epbint                         NUMBER(18,2) NOT NULL,
    pbduemain                      NUMBER(18,2) NOT NULL,
    epbduemain                     NUMBER(18,2) NOT NULL,
    pbdueint                       NUMBER(18,2) NOT NULL,
    epbdueint                      NUMBER(18,2) NOT NULL,
    paymain                        NUMBER(18,2) NOT NULL,
    epaymain                       NUMBER(18,2) NOT NULL,
    payint                         NUMBER(18,2) NOT NULL,
    epayint                        NUMBER(18,2) NOT NULL,
    paydue                         NUMBER(18,2) NOT NULL,
    epaydue                        NUMBER(18,2) NOT NULL,
    paydueint                      NUMBER(18,2) NOT NULL,
    epaydueint                     NUMBER(18,2) NOT NULL,
    tranchemain                    NUMBER(18,2) NOT NULL,
    etranchemain                   NUMBER(18,2) NOT NULL,
    pemain                         NUMBER(18,2) NOT NULL,
    epemain                        NUMBER(18,2) NOT NULL,
    peint                          NUMBER(18,2) NOT NULL,
    epeint                         NUMBER(18,2) NOT NULL,
    peduemain                      NUMBER(18,2) NOT NULL,
    epeduemain                     NUMBER(18,2) NOT NULL,
    pedueint                       NUMBER(18,2) NOT NULL,
    epedueint                      NUMBER(18,2) NOT NULL,
    crdperiod                      NUMBER(10) DEFAULT 0       NOT NULL)
ON COMMIT DELETE ROWS
/


-- End of DDL Script for Table CREDITSMGR.CM_REPORT_SD1

-- Start of DDL Script for Table CREDITSMGR.CM_RESERVE_TYPES
-- Generated 30-May-2006 16:39:23 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_reserve_types
    (id                             NUMBER NOT NULL,
    code                           VARCHAR2(8),
    percent                        NUMBER(7,4) NOT NULL,
    description                    VARCHAR2(64) NOT NULL,
    bdcount                        NUMBER,
    edcount                        NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     24576
    NEXT        16384
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
/


-- Constraints for CREDITSMGR.CM_RESERVE_TYPES

ALTER TABLE creditsmgr.cm_reserve_types
ADD CONSTRAINT pk_cm_reserves PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits_idx
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Comments for CREDITSMGR.CM_RESERVE_TYPES

COMMENT ON COLUMN creditsmgr.cm_reserve_types.code IS 'Risk Form'
/

-- End of DDL Script for Table CREDITSMGR.CM_RESERVE_TYPES

-- Start of DDL Script for Table CREDITSMGR.CM_RESTS_SD
-- Generated 30-May-2006 16:39:23 from CREDITSMGR@SB

CREATE GLOBAL TEMPORARY TABLE creditsmgr.cm_rests_sd
    (id                             NUMBER,
    dateofcredit                   VARCHAR2(25) NOT NULL,
    namount                        NUMBER,
    navgintamount                  NUMBER,
    famount                        NUMBER,
    favgintamount                  NUMBER,
    fnamount                       NUMBER,
    fnavgintamount                 NUMBER)
ON COMMIT DELETE ROWS
/


-- End of DDL Script for Table CREDITSMGR.CM_RESTS_SD

-- Start of DDL Script for Table CREDITSMGR.CM_RETURN_INT_OUTB
-- Generated 30-May-2006 16:39:23 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_return_int_outb
    (id                             NUMBER NOT NULL,
    creditid                       NUMBER NOT NULL,
    trdate                         DATE NOT NULL,
    trinbalanceid                  NUMBER,
    trinoutbalanceid               NUMBER,
    tramount                       NUMBER NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- Triggers for CREDITSMGR.CM_RETURN_INT_OUTB

CREATE OR REPLACE TRIGGER creditsmgr.bi_ret_int
BEFORE INSERT 
ON creditsmgr.cm_return_int_outb
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  select SEQ_RET_INT1.NEXTVAL  into :NEW.ID from dual;
end;
/

-- End of DDL Script for Table CREDITSMGR.CM_RETURN_INT_OUTB

-- Start of DDL Script for Table CREDITSMGR.CM_SECURITYLOG
-- Generated 30-May-2006 16:39:23 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_securitylog
    (creditid                       NUMBER NOT NULL,
    eventtime                      DATE NOT NULL,
    username                       VARCHAR2(64) NOT NULL,
    event                          VARCHAR2(255) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- Triggers for CREDITSMGR.CM_SECURITYLOG

CREATE OR REPLACE TRIGGER creditsmgr.bi_cm_securitylog
BEFORE INSERT 
ON creditsmgr.cm_securitylog
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin

  select User 
    into :NEW.UserName
    from DUAL;
    
  select Sysdate
    into :NEW.EventTime
    from DUAL;
    
end;
/

-- Comments for CREDITSMGR.CM_SECURITYLOG

COMMENT ON COLUMN creditsmgr.cm_securitylog.eventtime IS '--Trigger'
/
COMMENT ON COLUMN creditsmgr.cm_securitylog.username IS '--Trigger'
/

-- End of DDL Script for Table CREDITSMGR.CM_SECURITYLOG

-- Start of DDL Script for Table CREDITSMGR.CM_STATUS
-- Generated 30-May-2006 16:39:23 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_status
    (id                             NUMBER NOT NULL,
    iname                          VARCHAR2(16) NOT NULL,
    statuscode                     VARCHAR2(8) NOT NULL,
    description                    VARCHAR2(64))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     24576
    NEXT        16384
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
/


-- Comments for CREDITSMGR.CM_STATUS

COMMENT ON COLUMN creditsmgr.cm_status.statuscode IS 'Risk'
/

-- End of DDL Script for Table CREDITSMGR.CM_STATUS

-- Start of DDL Script for Table CREDITSMGR.CM_TRANCHE_SCHEDULE
-- Generated 30-May-2006 16:39:23 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_tranche_schedule
    (id                             NUMBER NOT NULL,
    creditid                       NUMBER NOT NULL,
    trchdate                       DATE NOT NULL,
    trchamount                     NUMBER(18,2))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- Constraints for CREDITSMGR.CM_TRANCHE_SCHEDULE

ALTER TABLE creditsmgr.cm_tranche_schedule
ADD CONSTRAINT uk_cm_tranche_schedule UNIQUE (creditid, trchdate)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits_idx
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Triggers for CREDITSMGR.CM_TRANCHE_SCHEDULE

CREATE OR REPLACE TRIGGER creditsmgr.bi_cm_tranche_schedule
BEFORE INSERT 
ON creditsmgr.cm_tranche_schedule
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  select seq_cm_payment_schedule.nextval
    into :new.id
    from dual;
end;
/

-- Comments for CREDITSMGR.CM_TRANCHE_SCHEDULE

COMMENT ON COLUMN creditsmgr.cm_tranche_schedule.creditid IS '-->Portfolio'
/

-- End of DDL Script for Table CREDITSMGR.CM_TRANCHE_SCHEDULE

-- Start of DDL Script for Table CREDITSMGR.CM_TRANCHES
-- Generated 30-May-2006 16:39:24 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_tranches
    (id                             NUMBER NOT NULL,
    creditid                       NUMBER NOT NULL,
    tranchedate                    DATE NOT NULL,
    trancheamount                  NUMBER(18,2) NOT NULL,
    tranchetrid                    NUMBER,
    reservetrid                    NUMBER,
    obligationouttrid              NUMBER,
    crdlineobltrid                 NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Indexes for CREDITSMGR.CM_TRANCHES

CREATE INDEX creditsmgr.nuk_cm_tranches ON creditsmgr.cm_tranches
  (
    creditid                        ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits_idx
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Constraints for CREDITSMGR.CM_TRANCHES

ALTER TABLE creditsmgr.cm_tranches
ADD CONSTRAINT pk_cm_tranches PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits_idx
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Triggers for CREDITSMGR.CM_TRANCHES

CREATE OR REPLACE TRIGGER creditsmgr.bi_cm_tranches
BEFORE INSERT 
ON creditsmgr.cm_tranches
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  select SEQ_CM_TRANCHES.NEXTVAL
    into :NEW.ID 
    from DUAL;
end;
/

-- Comments for CREDITSMGR.CM_TRANCHES

COMMENT ON COLUMN creditsmgr.cm_tranches.id IS 'AutoInc'
/

-- End of DDL Script for Table CREDITSMGR.CM_TRANCHES

-- Start of DDL Script for Table CREDITSMGR.CM_TRANCHES_SD
-- Generated 30-May-2006 16:39:24 from CREDITSMGR@SB

CREATE GLOBAL TEMPORARY TABLE creditsmgr.cm_tranches_sd
    (id                             NUMBER,
    dateofcredit                   VARCHAR2(25) NOT NULL,
    namount                        NUMBER,
    navgintamount                  NUMBER,
    famount                        NUMBER,
    favgintamount                  NUMBER,
    fnamount                       NUMBER,
    fnavgintamount                 NUMBER)
ON COMMIT DELETE ROWS
/


-- End of DDL Script for Table CREDITSMGR.CM_TRANCHES_SD

-- Start of DDL Script for Table CREDITSMGR.CM_TRANSACTIONS
-- Generated 30-May-2006 16:39:24 from CREDITSMGR@SB

CREATE GLOBAL TEMPORARY TABLE creditsmgr.cm_transactions
    (id                             NUMBER NOT NULL,
    trid                           NUMBER,
    debitaccid                     NUMBER NOT NULL,
    creditaccid                    NUMBER NOT NULL,
    debitamount                    NUMBER,
    creditamount                   NUMBER,
    natamount                      NUMBER,
    flags                          NUMBER NOT NULL,
    optype                         NUMBER NOT NULL,
    inbalancechar                  NUMBER,
    trdate                         DATE NOT NULL,
    trdescription                  VARCHAR2(255) NOT NULL,
    canprocess                     NUMBER DEFAULT 0

    NOT NULL)
ON COMMIT DELETE ROWS
/


-- Constraints for CREDITSMGR.CM_TRANSACTIONS

ALTER TABLE creditsmgr.cm_transactions
ADD CONSTRAINT ck_acc_ids CHECK ((DEBITACCID <> 0) and (CREDITACCID <> 0))
ENABLE NOVALIDATE
/
ALTER TABLE creditsmgr.cm_transactions
ADD CONSTRAINT ck_cm_transactions CHECK ((DEBITAMOUNT is not null) or (CREDITAMOUNT is not null))
ENABLE NOVALIDATE
/

-- Triggers for CREDITSMGR.CM_TRANSACTIONS

CREATE OR REPLACE TRIGGER creditsmgr.bi_cm_transactions_genid
BEFORE INSERT 
ON creditsmgr.cm_transactions
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  select SEQ_CM_TRANSACTIONS.NEXTVAL
    into :NEW.ID
    from DUAL;
end;
/

-- Comments for CREDITSMGR.CM_TRANSACTIONS

COMMENT ON COLUMN creditsmgr.cm_transactions.flags IS 'No Transaction Flag!!!!!0-SB,1-SBOUT'
/
COMMENT ON COLUMN creditsmgr.cm_transactions.id IS 'Internal ID not Transaction ID'
/
COMMENT ON COLUMN creditsmgr.cm_transactions.inbalancechar IS 'Kassa_B'
/
COMMENT ON COLUMN creditsmgr.cm_transactions.optype IS 'VID_OP'
/
COMMENT ON COLUMN creditsmgr.cm_transactions.trid IS 'Transaction ID'
/

-- End of DDL Script for Table CREDITSMGR.CM_TRANSACTIONS

-- Start of DDL Script for Table CREDITSMGR.CM_TRDESCRIPTIONS
-- Generated 30-May-2006 16:39:24 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_trdescriptions
    (iname                          VARCHAR2(32) NOT NULL,
    description                    VARCHAR2(255) NOT NULL,
    trdescription                  VARCHAR2(255))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- Constraints for CREDITSMGR.CM_TRDESCRIPTIONS

ALTER TABLE creditsmgr.cm_trdescriptions
ADD CONSTRAINT pk_cm_trdesc PRIMARY KEY (iname)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits_idx
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Comments for CREDITSMGR.CM_TRDESCRIPTIONS

COMMENT ON TABLE creditsmgr.cm_trdescriptions IS '%S -- Muqavilenin Nomresi'
/

-- End of DDL Script for Table CREDITSMGR.CM_TRDESCRIPTIONS

-- Start of DDL Script for Table CREDITSMGR.CM_USERGROUPS
-- Generated 30-May-2006 16:39:24 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_usergroups
    (id                             NUMBER NOT NULL,
    description                    VARCHAR2(64))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     24576
    NEXT        16384
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
PARALLEL (DEGREE DEFAULT)
/


-- Comments for CREDITSMGR.CM_USERGROUPS

COMMENT ON COLUMN creditsmgr.cm_usergroups.id IS 'Trigger'
/

-- End of DDL Script for Table CREDITSMGR.CM_USERGROUPS

-- Start of DDL Script for Table CREDITSMGR.CM_VISIBLE_FIELDS
-- Generated 30-May-2006 16:39:24 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_visible_fields
    (seqno                          NUMBER NOT NULL,
    fieldname                      VARCHAR2(64) NOT NULL,
    frozen                         NUMBER DEFAULT 0  NOT NULL,
    userid                         NUMBER NOT NULL,
    visible                        NUMBER DEFAULT 0  NOT NULL,
    id                             NUMBER NOT NULL,
    fielddesc                      VARCHAR2(128) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     81920
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
PARALLEL (DEGREE DEFAULT)
/


-- Constraints for CREDITSMGR.CM_VISIBLE_FIELDS

ALTER TABLE creditsmgr.cm_visible_fields
ADD CONSTRAINT uk_cm_visible_fields UNIQUE (fieldname, userid)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits_idx
  STORAGE   (
    INITIAL     40960
    NEXT        24576
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
/

-- Triggers for CREDITSMGR.CM_VISIBLE_FIELDS

CREATE OR REPLACE TRIGGER creditsmgr.bi_cm_visible_fields
BEFORE INSERT 
ON creditsmgr.cm_visible_fields
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  --:new.UserID :=uid;
  
  select SEQ_CM_VISIBLE_FIELDS.NEXTVAL
    into :new.ID 
    from DUAL; 
end;
/

-- Comments for CREDITSMGR.CM_VISIBLE_FIELDS

COMMENT ON COLUMN creditsmgr.cm_visible_fields.frozen IS '0-not frozen 1 frozen'
/
COMMENT ON COLUMN creditsmgr.cm_visible_fields.id IS 'Trigger'
/
COMMENT ON COLUMN creditsmgr.cm_visible_fields.userid IS 'By Trigger'
/
COMMENT ON COLUMN creditsmgr.cm_visible_fields.visible IS '0-visible 1-invisible'
/

-- End of DDL Script for Table CREDITSMGR.CM_VISIBLE_FIELDS

-- Start of DDL Script for Table CREDITSMGR.CM_WR_BOOKMARKS
-- Generated 30-May-2006 16:39:24 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_wr_bookmarks
    (id                             NUMBER NOT NULL,
    templateid                     NUMBER,
    fieldid                        NUMBER,
    bookmarkname                   VARCHAR2(255))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Constraints for CREDITSMGR.CM_WR_BOOKMARKS

ALTER TABLE creditsmgr.cm_wr_bookmarks
ADD CONSTRAINT pk_wrboomark PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/
ALTER TABLE creditsmgr.cm_wr_bookmarks
ADD CONSTRAINT uk_cm_bookmarks UNIQUE (templateid, bookmarkname)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Triggers for CREDITSMGR.CM_WR_BOOKMARKS

CREATE OR REPLACE TRIGGER creditsmgr.trg_inc_wr_bookmark
BEFORE INSERT 
ON creditsmgr.cm_wr_bookmarks
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  SELECT INC_WR_BOOKMARK.NEXTVAL
    INTO :NEW.ID
    FROM DUAL;
end;
/

-- End of DDL Script for Table CREDITSMGR.CM_WR_BOOKMARKS

-- Start of DDL Script for Table CREDITSMGR.CM_WR_FIELDS
-- Generated 30-May-2006 16:39:24 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_wr_fields
    (id                             NUMBER NOT NULL,
    fieldname                      VARCHAR2(255) NOT NULL,
    description                    VARCHAR2(255))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Constraints for CREDITSMGR.CM_WR_FIELDS

ALTER TABLE creditsmgr.cm_wr_fields
ADD CONSTRAINT pk_wrfileld PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Triggers for CREDITSMGR.CM_WR_FIELDS

CREATE OR REPLACE TRIGGER creditsmgr.trg_inc_wr_field
BEFORE INSERT 
ON creditsmgr.cm_wr_fields
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  SELECT INC_WR_FIELDS.NEXTVAL
    INTO :NEW.ID
    FROM DUAL;
end;
/

-- End of DDL Script for Table CREDITSMGR.CM_WR_FIELDS

-- Start of DDL Script for Table CREDITSMGR.CM_WR_TEMPLATES
-- Generated 30-May-2006 16:39:24 from CREDITSMGR@SB

CREATE TABLE creditsmgr.cm_wr_templates
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(255) NOT NULL,
    path                           VARCHAR2(4000))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Constraints for CREDITSMGR.CM_WR_TEMPLATES

ALTER TABLE creditsmgr.cm_wr_templates
ADD CONSTRAINT pk_wrtemplate PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  ts_credits
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/

-- Triggers for CREDITSMGR.CM_WR_TEMPLATES

CREATE OR REPLACE TRIGGER creditsmgr.trg_inc_wr_template
BEFORE INSERT 
ON creditsmgr.cm_wr_templates
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  SELECT INC_WR_TEMPLATE.NEXTVAL
    INTO :NEW.ID
    FROM DUAL;
end;
/

-- End of DDL Script for Table CREDITSMGR.CM_WR_TEMPLATES

-- Foreign Key
ALTER TABLE creditsmgr.agro_kredit_purpose
ADD CONSTRAINT fk_agro_kredit_purpose FOREIGN KEY (depend_id)
REFERENCES CREDITSMGR.agro_kredit_target (id) ON DELETE CASCADE
/
-- Foreign Key
ALTER TABLE creditsmgr.agro_village
ADD CONSTRAINT fk_agro_region FOREIGN KEY (depend_id)
REFERENCES CREDITSMGR.agro_region (id) ON DELETE CASCADE
/
-- Foreign Key
ALTER TABLE creditsmgr.cm_accounts
ADD CONSTRAINT fk_cm_accounts_id# FOREIGN KEY (creditid)
REFERENCES CREDITSMGR.cm_portfolio (id) ON DELETE CASCADE
/
-- Foreign Key
ALTER TABLE creditsmgr.cm_actv_transactions
ADD CONSTRAINT fk_cm_actv_transactions FOREIGN KEY (creditid)
REFERENCES CREDITSMGR.cm_portfolio (id) ON DELETE CASCADE
/
-- Foreign Key
ALTER TABLE creditsmgr.cm_adm_groupmanager
ADD CONSTRAINT cm_fk_groupmangrid FOREIGN KEY (groupid)
REFERENCES CREDITSMGR.cm_adm_groups (id) ON DELETE CASCADE
/
ALTER TABLE creditsmgr.cm_adm_groupmanager
ADD CONSTRAINT cm_fk_groupmanusertype FOREIGN KEY (usertype)
REFERENCES CREDITSMGR.cm_adm_groupusertypes (id) ON DELETE CASCADE
/
-- Foreign Key
ALTER TABLE creditsmgr.cm_adm_groups
ADD CONSTRAINT cm_fk_admgrouptypeid FOREIGN KEY (typeid)
REFERENCES CREDITSMGR.cm_adm_grouptypes (id) ON DELETE CASCADE
/
-- Foreign Key
ALTER TABLE creditsmgr.cm_adm_plugins
ADD CONSTRAINT fk_pt FOREIGN KEY (typeid)
REFERENCES CREDITSMGR.cm_adm_plugintypes (id) ON DELETE CASCADE
/
-- Foreign Key
ALTER TABLE creditsmgr.cm_adm_usergrants
ADD CONSTRAINT cm_fk_adm_ugpluginid FOREIGN KEY (pluginid)
REFERENCES CREDITSMGR.cm_adm_plugins (id) ON DELETE CASCADE
/
-- Foreign Key
ALTER TABLE creditsmgr.cm_aginfo
ADD CONSTRAINT fk_accgrinfo FOREIGN KEY (groupid)
REFERENCES CREDITSMGR.cm_accountgroups (id) ON DELETE CASCADE
/
-- Foreign Key
ALTER TABLE creditsmgr.cm_ak_grants
ADD CONSTRAINT cm_fk_grant_machineid FOREIGN KEY (machineid)
REFERENCES CREDITSMGR.cm_ak_machines (id) ON DELETE CASCADE
/
-- Foreign Key
ALTER TABLE creditsmgr.cm_boorowerinfo
ADD CONSTRAINT fk_cm_boorowerinfo_id# FOREIGN KEY (creditid)
REFERENCES CREDITSMGR.cm_portfolio (id) ON DELETE CASCADE
/
-- Foreign Key
ALTER TABLE creditsmgr.cm_business_plan
ADD CONSTRAINT cm_fk_bp_purpose FOREIGN KEY (akpurpose)
REFERENCES CREDITSMGR.agro_kredit_purpose (id) ON DELETE CASCADE
DISABLE
/
ALTER TABLE creditsmgr.cm_business_plan
ADD CONSTRAINT cm_fk_bp_type FOREIGN KEY (type)
REFERENCES CREDITSMGR.cm_bp_types (id) ON DELETE CASCADE
DISABLE
/
ALTER TABLE creditsmgr.cm_business_plan
ADD CONSTRAINT cm_fk_bp_village FOREIGN KEY (villageid)
REFERENCES CREDITSMGR.agro_village (id) ON DELETE CASCADE
/
ALTER TABLE creditsmgr.cm_business_plan
ADD CONSTRAINT fk_cm_business_plan FOREIGN KEY (creditid)
REFERENCES CREDITSMGR.cm_portfolio (id) ON DELETE CASCADE
/
-- Foreign Key
ALTER TABLE creditsmgr.cm_expires
ADD CONSTRAINT fk_cm_expire FOREIGN KEY (creditid)
REFERENCES CREDITSMGR.cm_portfolio (id) ON DELETE CASCADE
/
-- Foreign Key
ALTER TABLE creditsmgr.cm_generatechildaccounts
ADD CONSTRAINT fh_ch FOREIGN KEY (genid)
REFERENCES CREDITSMGR.cm_generatemainaccounts (id) ON DELETE CASCADE
/
-- Foreign Key
ALTER TABLE creditsmgr.cm_guarantee
ADD CONSTRAINT fk_cm_guarantee_id# FOREIGN KEY (creditid)
REFERENCES CREDITSMGR.cm_portfolio (id) ON DELETE CASCADE
/
-- Foreign Key
ALTER TABLE creditsmgr.cm_history
ADD CONSTRAINT fk_cm_history_duereserveid FOREIGN KEY (duereserveid)
REFERENCES CREDITSMGR.cm_reserve_types (id) ON DELETE SET NULL
/
ALTER TABLE creditsmgr.cm_history
ADD CONSTRAINT fk_cm_history_reserveid FOREIGN KEY (reserveid)
REFERENCES CREDITSMGR.cm_reserve_types (id) ON DELETE SET NULL
/
ALTER TABLE creditsmgr.cm_history
ADD CONSTRAINT fk_history FOREIGN KEY (creditid)
REFERENCES CREDITSMGR.cm_portfolio (id) ON DELETE CASCADE
ENABLE NOVALIDATE
/
-- Foreign Key
ALTER TABLE creditsmgr.cm_int_outbalance
ADD CONSTRAINT fk FOREIGN KEY (creditid)
REFERENCES CREDITSMGR.cm_portfolio (id) ON DELETE SET NULL
/
-- Foreign Key
ALTER TABLE creditsmgr.cm_interests
ADD CONSTRAINT fk_cm_interests FOREIGN KEY (creditid)
REFERENCES CREDITSMGR.cm_portfolio (id) ON DELETE CASCADE
ENABLE NOVALIDATE
/
-- Foreign Key
ALTER TABLE creditsmgr.cm_link_values
ADD CONSTRAINT fk_cm_link_values FOREIGN KEY (linkid)
REFERENCES CREDITSMGR.cm_links (id) ON DELETE CASCADE
/
-- Foreign Key
ALTER TABLE creditsmgr.cm_links
ADD CONSTRAINT fk_cm_links FOREIGN KEY (categoryid)
REFERENCES CREDITSMGR.cm_categories (id) ON DELETE CASCADE
/
-- Foreign Key
ALTER TABLE creditsmgr.cm_payment_schedule
ADD CONSTRAINT cm_pschedule_portfolio FOREIGN KEY (creditid)
REFERENCES CREDITSMGR.cm_portfolio (id) ON DELETE CASCADE
/
-- Foreign Key
ALTER TABLE creditsmgr.cm_payments
ADD CONSTRAINT fk_cm_payments FOREIGN KEY (creditid)
REFERENCES CREDITSMGR.cm_portfolio (id) ON DELETE CASCADE
/
-- Foreign Key
ALTER TABLE creditsmgr.cm_portfolio
ADD CONSTRAINT fk_cm_portfolio_credittype FOREIGN KEY (credittype)
REFERENCES CREDITSMGR.cm_credittypes (id) ON DELETE SET NULL
/
ALTER TABLE creditsmgr.cm_portfolio
ADD CONSTRAINT fk_cm_portfolio_custtype FOREIGN KEY (customertype)
REFERENCES CREDITSMGR.cm_categories (id) ON DELETE SET NULL
/
ALTER TABLE creditsmgr.cm_portfolio
ADD CONSTRAINT fk_cm_portfolio_perstype FOREIGN KEY (personaltype)
REFERENCES CREDITSMGR.cm_persons (id) ON DELETE SET NULL
/
-- Foreign Key
ALTER TABLE creditsmgr.cm_prolongations
ADD CONSTRAINT fk_cm_prolongations FOREIGN KEY (creditid)
REFERENCES CREDITSMGR.cm_portfolio (id) ON DELETE CASCADE
/
-- Foreign Key
ALTER TABLE creditsmgr.cm_tranche_schedule
ADD CONSTRAINT fk_cm_tranche_schedule FOREIGN KEY (creditid)
REFERENCES CREDITSMGR.cm_portfolio (id) ON DELETE CASCADE
/
-- Foreign Key
ALTER TABLE creditsmgr.cm_tranches
ADD CONSTRAINT fk_cm_tranches FOREIGN KEY (creditid)
REFERENCES CREDITSMGR.cm_portfolio (id) ON DELETE CASCADE
/
-- Foreign Key
ALTER TABLE creditsmgr.cm_wr_bookmarks
ADD CONSTRAINT fk_wrfieldid FOREIGN KEY (fieldid)
REFERENCES CREDITSMGR.cm_wr_fields (id) ON DELETE SET NULL
/
ALTER TABLE creditsmgr.cm_wr_bookmarks
ADD CONSTRAINT fk_wrtemplateid FOREIGN KEY (templateid)
REFERENCES CREDITSMGR.cm_wr_templates (id) ON DELETE SET NULL
/
-- End of DDL script for Foreign Key(s)
