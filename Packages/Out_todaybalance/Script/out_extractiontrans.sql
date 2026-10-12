-- Start of DDL Script for Table SMART.EXTRACTIONTRANS
-- Generated 16-May-2006 21:33:58 from SMART@sb

CREATE GLOBAL TEMPORARY TABLE out_extractiontrans
    (id                             NUMBER(10,0),
    dat                            DATE,
    tim                            DATE,
    currencyid                     NUMBER(3,0),
    ownaccountid                   NUMBER(10,0),
    pairaccountid                  NUMBER(10,0),
    pairaccountname                VARCHAR2(20),
    paircurrencyid                 NUMBER,
    debit                          NUMBER,
    kredit                         NUMBER,
    ldebit                         NUMBER,
    lkredit                        NUMBER,
    operationcode                  NUMBER(5,0),
    name                           VARCHAR2(255))
ON COMMIT DELETE ROWS
/


-- End of DDL Script for Table SMART.EXTRACTIONTRANS

