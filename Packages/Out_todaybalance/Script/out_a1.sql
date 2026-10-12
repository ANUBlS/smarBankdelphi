-- Start of DDL Script for Table SMART.A1
-- Generated 16-May-2006 21:35:49 from SMART@sb

CREATE TABLE out_a1
    (c1                             NUMBER,
    c2                             VARCHAR2(3000),
    c3                             DATE,
    c4                             NUMBER(9,2),
    c5                             VARCHAR2(4000))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     81920
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- Triggers for A1

CREATE OR REPLACE TRIGGER ewqe
 AFTER
   UPDATE OFc2
 ON a1
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  raise_application_error(-20001,'Zafaghshsdvgkj');
end;
/

-- End of DDL Script for Table SMART.A1

