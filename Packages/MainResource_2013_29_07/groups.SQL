CREATE TABLE smart.groups
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(90),
    amort                          NUMBER,
    main_account                   NUMBER,
    exp_account                    NUMBER,
    amort_account                  NUMBER,
    sale_account                   NUMBER,
    taxamort                       NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     40960
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE smart.groups
ADD CONSTRAINT pk_groups PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     40960
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
/

CREATE OR REPLACE TRIGGER smart.inc_groups
 BEFORE
  INSERT
 ON smart.groups
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Declare nw integer;
begin
 Select SEQ_GROUPS.nextval into nw from  dual;
 :new.ID:=nw;
end INC_GROUPS;
/

