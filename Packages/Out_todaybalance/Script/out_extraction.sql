-- Start of DDL Script for Table SMART.EXTRACTION
-- Generated 16-May-2006 21:32:51 from SMART@sb

CREATE GLOBAL TEMPORARY TABLE out_extraction
    (customername                   VARCHAR2(90),
    customervoin                   NUMBER(10,0),
    customerid                     NUMBER(10,0) NOT NULL,
    accountname                    VARCHAR2(90),
    accountnumber                  VARCHAR2(20) NOT NULL,
    accountid                      NUMBER(10,0) NOT NULL,
    operationid                    NUMBER(10,0),
    currencyid                     NUMBER(3,0) NOT NULL,
    currencyname                   VARCHAR2(10),
    balancecode                    NUMBER(10,0) NOT NULL,
    opendate                       DATE NOT NULL,
    filial                         NUMBER(5,0),
    close_dat                      DATE,
    previousrest                   NUMBER,
    lastopdate                     DATE,
    datdate                        DATE,
    ostat                          NUMBER,
    pok_ostat                      NUMBER,
    obr_d                          NUMBER,
    obr_k                          NUMBER,
    pok_obr_d                      NUMBER,
    pok_obr_k                      NUMBER,
    ap_beg                         CHAR(3),
    enddate                        DATE,
    endostat                       NUMBER,
    endpok_ostat                   NUMBER,
    endobr_d                       NUMBER,
    endobr_k                       NUMBER,
    endpok_obr_d                   NUMBER,
    endpok_obr_k                   NUMBER,
    ap_end                         CHAR(3))
ON COMMIT DELETE ROWS
/


-- End of DDL Script for Table SMART.EXTRACTION

