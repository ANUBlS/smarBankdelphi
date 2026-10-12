-- Start of DDL Script for Table SMART.CUST_ORDER_ARXIV
-- Generated 25-Feb-2006 23:57:38 from SMART@SB

CREATE TABLE cust_order_arxiv
    (dbname                         VARCHAR2(50),
    dbcode                         VARCHAR2(50),
    pnum                           NUMBER,
    dbinn                          VARCHAR2(50),
    dbcoracc                       VARCHAR2(50),
    dbswift                        VARCHAR2(50),
    val                            VARCHAR2(50),
    b_name                         VARCHAR2(50),
    b_code                         VARCHAR2(50),
    b_inn                          VARCHAR2(50),
    b_swift                        VARCHAR2(50),
    b_acc                          VARCHAR2(50),
    c_name                         VARCHAR2(50),
    c_acc                          VARCHAR2(50),
    c_inn                          VARCHAR2(50),
    m_name                         VARCHAR2(50),
    m_acc                          VARCHAR2(50),
    m_inn                          VARCHAR2(50),
    n_mon                          VARCHAR2(500),
    w_mon                          VARCHAR2(500),
    content                        VARCHAR2(1000),
    edv                            VARCHAR2(50),
    edv_f                          VARCHAR2(50),
    edv_c                          VARCHAR2(50),
    pro                            VARCHAR2(50),
    pro_f                          VARCHAR2(50),
    pro_c                          VARCHAR2(50),
    head                           VARCHAR2(50),
    chief                          VARCHAR2(50),
    ddate                          DATE,
    id                             NUMBER,
    acc_inn                        VARCHAR2(50),
    close_date                     DATE)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     40960
    NEXT        221184
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/


-- End of DDL Script for Table SMART.CUST_ORDER_ARXIV


