-- Start of DDL Script for Table SMART.REPORT_SQL
-- Generated 8-Jul-2006 22:32:34 from SMART@SB

CREATE TABLE report_sql
    (id                             NUMBER,
    name                           VARCHAR2(30),
    sql                            VARCHAR2(1000))
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     10240
    NEXT        10240
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
/


-- Triggers for REPORT_SQL

CREATE OR REPLACE TRIGGER tr_gb_report
 BEFORE
  INSERT OR UPDATE
 ON report_sql
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare nw integer;
begin
  select seq_gb_report.NEXTVAL into nw from dual;
  :new.id:=nw;
end;
/

-- End of DDL Script for Table SMART.REPORT_SQL

