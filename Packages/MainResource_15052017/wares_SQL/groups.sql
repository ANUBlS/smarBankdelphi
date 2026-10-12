-- Start of DDL Script for Table SMART.GROUPS
-- Generated 9-Jul-2006 7:17:19 from SMART@SBTEST

CREATE TABLE groups
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(90),
    amort                          NUMBER,
    main_account                   NUMBER,
    exp_account                    NUMBER,
    amort_account                  NUMBER,
    sale_account                   NUMBER,
    taxamort                       NUMBER,
    sid				   number)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
PARALLEL (DEGREE DEFAULT)
/

-- Grants for Table
GRANT SELECT ON groups TO sbr_mainfacilities
/

-- Constraints for GROUPS

ALTER TABLE groups
ADD CONSTRAINT pk_groups PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  smartidx
  STORAGE   (
    INITIAL     8028160
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
ENABLE NOVALIDATE
/

-- Triggers for GROUPS

CREATE OR REPLACE TRIGGER inc_groups
BEFORE INSERT 
ON groups
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
Declare nw integer;
begin
 Select SEQ_GROUPS.nextval, uid into :new.id, :new.sid from  dual;
end INC_GROUPS;
/

create view sba_groups as
select * from smart.groups where
(sid<>-1 and 
not EXISTS(select SUSER from sba_userman where MUSER=uid and (type#=2 or type#=0)))
or
(sid in(select SUSER from sba_userman where MUSER=uid and (type#=2 or type#=0)))
/
insert into sba_synreplace values ('GROUPS','SBA_GROUPS')
/
create public synonym groups for smart.groups
/

-- End of DDL Script for Table SMART.GROUPS


