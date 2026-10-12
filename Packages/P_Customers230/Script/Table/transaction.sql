DROP TABLE transaction
/

CREATE TABLE transaction
    (debt_id                        VARCHAR2(25),
    credit_id                      VARCHAR2(25),
    debt_ammount                   NUMBER(15,2),
    credit_ammount                 NUMBER(15,2),
    content                        VARCHAR2(250),
    lammount                       NUMBER(15,2),
    credit_rate                    VARCHAR2(10),
    debt_rate                      VARCHAR2(10))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
PARALLEL (DEGREE DEFAULT)
/

