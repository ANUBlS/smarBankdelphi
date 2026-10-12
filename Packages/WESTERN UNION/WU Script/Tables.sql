-- Start of DDL Script for Table SMART.WU_REPORT
-- Generated 26-Apr-2004 11:22:05 from SMART@SBLOCAL

CREATE TABLE wu_report
    (nom                            NUMBER,
    branch                         VARCHAR2(50),
    transcount                     NUMBER,
    amount_i                       NUMBER(15,2),
    amount_o                       NUMBER(15,2),
    revenue                        NUMBER(15,2))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/

-- End of DDL Script for Table SMART.WU_REPORT

-- Start of DDL Script for Table SMART.WU_INCOMING
-- Generated 26-Apr-2004 11:22:05 from SMART@SBLOCAL

CREATE TABLE wu_incoming
    (id                             NUMBER NOT NULL,
    userid                         NUMBER,
    convertdate                    DATE,
    kind                           VARCHAR2(2),
    branch                         VARCHAR2(10),
    currency                       NUMBER,
    incomdate                      DATE,
    reference                      VARCHAR2(20) NOT NULL,
    principial                     NUMBER(15,2),
    charges                        NUMBER(15,2),
    revenue                        NUMBER(15,2),
    status                         NUMBER(1) DEFAULT 0)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/

-- Constraints for WU_INCOMING

ALTER TABLE wu_incoming
ADD CONSTRAINT reference UNIQUE (reference)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/

-- Triggers for WU_INCOMING

CREATE OR REPLACE TRIGGER wu_incoming_id_inc
BEFORE INSERT 
ON wu_incoming
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
   SELECT wu_incoming_id_gen.NEXTVAL
     INTO :NEW.id
     FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER wu_incoming_getuser
BEFORE INSERT 
ON wu_incoming
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
   SELECT uid
     INTO :NEW.userid
     FROM DUAL; 
end;
/

-- End of DDL Script for Table SMART.WU_INCOMING

-- Start of DDL Script for Table SMART.WU_CONFIG
-- Generated 26-Apr-2004 11:22:06 from SMART@SBLOCAL

CREATE TABLE wu_config
    (sendsymbol                     VARCHAR2(3),
    receiversymbol                 VARCHAR2(3),
    sectionsymbol                  VARCHAR2(1),
    defaultdirectory               VARCHAR2(100),
    principialtrans                NUMBER(1) DEFAULT 0
 )
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/

-- End of DDL Script for Table SMART.WU_CONFIG

-- Start of DDL Script for Table SMART.WU_BRANCH
-- Generated 26-Apr-2004 11:22:06 from SMART@SBLOCAL

CREATE TABLE wu_branch
    (branchid                       NUMBER,
    symbol                         VARCHAR2(10),
    secondsymbol                   VARCHAR2(10),
    branchname                     VARCHAR2(20))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/

-- End of DDL Script for Table SMART.WU_BRANCH

-- Start of DDL Script for Table SMART.WU_ACCOUNTS
-- Generated 26-Apr-2004 11:22:06 from SMART@SBLOCAL

CREATE TABLE wu_accounts
    (accid                          NUMBER,
    currency                       NUMBER,
    name                           VARCHAR2(10),
    type                           VARCHAR2(1) DEFAULT 'D'

 ,
    accounttype                    NUMBER(1) DEFAULT 0
 ,
    id                             NUMBER,
    branchid                       NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/

-- Triggers for WU_ACCOUNTS

CREATE OR REPLACE TRIGGER wu_accounts_id_inc
BEFORE INSERT 
ON wu_accounts
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare nw integer;
begin
 select WU_INCOMING_ID_GEN.nextval into nw from dual;
 :new.id:=nw;
end;
/

-- Comments for WU_ACCOUNTS

COMMENT ON COLUMN wu_accounts.accounttype IS '0-principial,1-revevue'
/

-- End of DDL Script for Table SMART.WU_ACCOUNTS


