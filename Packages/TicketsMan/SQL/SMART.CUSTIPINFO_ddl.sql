CREATE TABLE custipinfo
    (custid                         NUMBER,
    bdate                          DATE,
    marriage                       NUMBER DEFAULT 0,
    monthlyprofit                  VARCHAR2(20),
    profession                     VARCHAR2(63),
    passtype                       NUMBER DEFAULT 0,
    passserie                      VARCHAR2(31),
    soccategory                    NUMBER,
    insurancecomp                  NUMBER,
    inspolicnum                    VARCHAR2(15),
    inscontractdate                DATE,
    inscontractpreiod              NUMBER,
    bb_name                        VARCHAR2(100),
    bb_shortname                   VARCHAR2(50),
    bb_bdate                       DATE,
    bb_marriage                    NUMBER,
    bb_monthlyprofit               VARCHAR2(20),
    bb_profession                  VARCHAR2(63),
    bb_passtype                    NUMBER,
    bb_passserie                   VARCHAR2(31),
    bb_soccategory                 NUMBER,
    bb_work                        VARCHAR2(31),
    bb_position                    VARCHAR2(31),
    bb_address                     VARCHAR2(63),
    bb_telephone                   VARCHAR2(31),
    bb_inn                         VARCHAR2(15),
    bb_familystatus                NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
COMMENT ON COLUMN custipinfo.bb_marriage IS '0-Married, 1-Single'
/
COMMENT ON COLUMN custipinfo.bb_passtype IS '0-ID Card, 1-Military Card'
/
COMMENT ON COLUMN custipinfo.marriage IS '0-Married, 1-Single'
/
COMMENT ON COLUMN custipinfo.passtype IS '0-ID Card, 1-Military Card'
/
