-- Start of DDL Script for Table SMART.CUSTOMERS_PHYSICAL
-- Generated 13-Nov-2006 23:44:16 from SMART@SB

CREATE TABLE customers_physical
    (id                             NUMBER NOT NULL,
    byr_name                       VARCHAR2(50),
    passport                       VARCHAR2(3),
    birthdate                      DATE,
    birthplace                     VARCHAR2(30),
    fam_status                     NUMBER(1),
    adress                         VARCHAR2(50),
    phone                          VARCHAR2(30),
    email                          VARCHAR2(30),
    opendate                       DATE,
    sex                            NUMBER(1),
    passp_number                   NUMBER(8),
    adrs_state                     VARCHAR2(30),
    adrs_city                      VARCHAR2(20),
    birth_state                    VARCHAR2(30),
    phone_mob                      VARCHAR2(30),
    p_id                           NUMBER(10),
    userid                         NUMBER(3))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     65536
    NEXT        10240
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
/


-- Constraints for CUSTOMERS_PHYSICAL

ALTER TABLE customers_physical
ADD CONSTRAINT cc_pk_custid PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     65536
    NEXT        10240
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
/

-- Triggers for CUSTOMERS_PHYSICAL

CREATE OR REPLACE TRIGGER ins_customers_physical
BEFORE INSERT 
ON customers_physical
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
 select customers_PhysicalID.nextval into :new.ID from dual;
 :new.USERID :=sblogin.UserID;
end;
/

-- End of DDL Script for Table SMART.CUSTOMERS_PHYSICAL


