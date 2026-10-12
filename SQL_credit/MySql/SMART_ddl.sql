CREATE SYNONYM creditsmgr.cm_ip_insurances
  FOR smart.ip_insurances
/
CREATE SEQUENCE smart.seq_ip_insurancee
  INCREMENT BY 1
  START WITH 16
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  NOCYCLE
  NOORDER
  NOCACHE
/
CREATE SEQUENCE smart.tr_seq_custsoccategories
  INCREMENT BY 1
  START WITH 3
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  NOCYCLE
  NOORDER
  NOCACHE
/
CREATE SEQUENCE smart.tr_seq_custfamily
  INCREMENT BY 1
  START WITH 12
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  NOCYCLE
  NOORDER
  NOCACHE
/
CREATE TABLE smart.custipinfo
    (custid                         NUMBER,
    bdate                          DATE,
    marriage                       NUMBER DEFAULT 0,
    monthlyprofit                  VARCHAR2(20),
    profession                     VARCHAR2(63),
    passtype                       NUMBER DEFAULT 0,
    passserie                      VARCHAR2(7),
    soccategory                    NUMBER,
    insurancecomp                  NUMBER,
    inspolicnum                    VARCHAR2(15),
    inscontractdate                DATE,
    inscontractpreiod              NUMBER,
    bb_inn                         VARCHAR2(15),
    bb_familystatus                NUMBER,
    passnum                        VARCHAR2(15),
    cardid                         NUMBER,
    uniqueinsid                    VARCHAR2(20))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER smart.cm_bi_custipinfo
 BEFORE
  INSERT
 ON smart.custipinfo
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  :new.bdate := to_date(:new.bdate);
end;
/
COMMENT ON COLUMN smart.custipinfo.marriage IS '0-Married, 1-Single'
/
COMMENT ON COLUMN smart.custipinfo.passtype IS '0-ID Card, 1-Military Card'
/
CREATE TABLE smart.ip_insurances
    (id                             NUMBER NOT NULL,
    description                    VARCHAR2(127) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE smart.ip_insurances
ADD CONSTRAINT pk_ip_insuranceid PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER smart.bi_ip_insuranceidgen
 BEFORE
  INSERT
 ON smart.ip_insurances
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
   select seq_ip_insurancee.nextval
     into :new.id
     from DUAL;
end;
/
CREATE TABLE smart.custsoccategories
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(30))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE smart.custsoccategories
ADD CONSTRAINT pk_custsoccategoryid PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER smart.bi_custsoccategories
 BEFORE
  INSERT
 ON smart.custsoccategories
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select tr_seq_custsoccategories.nextval
    into :new.id
    from dual;
end;
/
CREATE TABLE smart.custfamily
    (id                             NUMBER(*,0) NOT NULL,
    name                           VARCHAR2(30))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE smart.custfamily
ADD CONSTRAINT pk_custfamilyid PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER smart.bi_custfamily
 BEFORE
  INSERT
 ON smart.custfamily
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select tr_seq_custfamily.nextval
    into :new.id
    from dual;
end;
/
