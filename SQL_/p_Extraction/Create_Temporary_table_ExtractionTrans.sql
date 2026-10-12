--drop table extractiontrans
CREATE global temporary TABLE extractiontrans
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
--ON COMMIT DELETE ROWS
ON COMMIT PRESERVE ROWS;

