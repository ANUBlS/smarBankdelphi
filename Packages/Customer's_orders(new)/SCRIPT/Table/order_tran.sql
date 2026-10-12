-- Start of DDL Script for Table SMART.ORDER_TRANS
-- Generated 30-Mar-2006 16:07:35 from SMART@sm

CREATE TABLE order_trans
    (debt_ammount                   FLOAT(126),
    credit_ammount                 FLOAT(126),
    debit_id                       NUMBER,
    credit_id                      NUMBER,
    content                        VARCHAR2(1000))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     24576
    NEXT        16384
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
PARALLEL (DEGREE DEFAULT)
/


-- End of DDL Script for Table SMART.ORDER_TRANS

