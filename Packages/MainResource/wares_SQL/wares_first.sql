-- Start of DDL Script for Table SMART.WARES_FIRST
-- Generated 7-Dec-2006 10:08:41 from SMART@SB

CREATE TABLE smart.wares_first
    (wares_name                     VARCHAR2(90),
    wares_id                       NUMBER,
    inventar_date                  DATE,
    groups_id                      NUMBER,
    first_price                    NUMBER(18,2),
    remainder                      NUMBER(18,2),
    amort                          NUMBER(18,2),
    all_amort                      NUMBER(18,2),
    percent                        NUMBER,
    tax_first_price                NUMBER(18,2),
    tax_remainder                  NUMBER(18,2),
    tax_amort                      NUMBER(18,2),
    tax_all_amort                  NUMBER(18,2),
    tax_percent                    NUMBER,
    close_format                   NUMBER,
    amort_date                     DATE,
    tax_close_format               NUMBER,
    inventar_no                    VARCHAR2(30))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     163840
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
/




-- Constraints for SMART.WARES_FIRST

ALTER TABLE smart.wares_first
ADD CONSTRAINT uk_wares_amort UNIQUE (wares_id, amort_date)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     65536
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
/



-- End of DDL Script for Table SMART.WARES_FIRST

-- Foreign Key
ALTER TABLE smart.wares_first
ADD CONSTRAINT fk_wares_first FOREIGN KEY (wares_id)
REFERENCES SMART.wares_all (wares_id)
/
-- End of DDL script for Foreign Key(s)
