DROP TABLE commision_trans_km
/

CREATE TABLE commision_trans_km
    (id                             NUMBER,
    debt                           NUMBER,
    credit                         NUMBER,
    c_value                        NUMBER,
    d_value                        NUMBER,
    ddate                          DATE)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
PARALLEL (DEGREE DEFAULT)
/

