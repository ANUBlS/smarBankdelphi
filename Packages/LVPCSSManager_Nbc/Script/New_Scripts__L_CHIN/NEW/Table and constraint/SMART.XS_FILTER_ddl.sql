CREATE TABLE xs_filter
    (acc_id                         NUMBER(10,0) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
ALTER TABLE xs_filter
ADD CONSTRAINT con_f_xs_filter FOREIGN KEY (acc_id)
REFERENCES bal_spr1 (bal_cn)
/

ALTER TABLE xs_filter
ADD CONSTRAINT con_xs_filter PRIMARY KEY (acc_id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
