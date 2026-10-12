CREATE TABLE custipinfo
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
    cardid                         NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
COMMENT ON COLUMN custipinfo.marriage IS '0-Married, 1-Single'
/
COMMENT ON COLUMN custipinfo.passtype IS '0-ID Card, 1-Military Card'
/
CREATE TABLE custsoccategories
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(30))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE custsoccategories
ADD CONSTRAINT pk_custsoccategoryid PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER bi_custsoccategories
 BEFORE
  INSERT
 ON custsoccategories
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select tr_seq_custsoccategories.nextval
    into :new.id
    from dual;
end;
/
CREATE TABLE custfamily
    (id                             NUMBER(*,0) NOT NULL,
    name                           VARCHAR2(30))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE custfamily
ADD CONSTRAINT pk_custfamilyid PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER bi_custfamily
 BEFORE
  INSERT
 ON custfamily
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select tr_seq_custfamily.nextval
    into :new.id
    from dual;
end;
/
