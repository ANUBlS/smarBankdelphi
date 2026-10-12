-- Start of DDL Script for Table SMART.XS_SENTINFO
-- Generated 20-May-2006 14:06:17 from SMART@SB

CREATE TABLE xs_sentinfo
    (id                             NUMBER,
    format                         VARCHAR2(1),
    sender                         VARCHAR2(20),
    receiver                       VARCHAR2(20),
    type                           VARCHAR2(3),
    priority                       VARCHAR2(1),
    notif_rq                       VARCHAR2(1),
    user_priority                  VARCHAR2(10),
    create_date                    DATE,
    user_reference                 VARCHAR2(16),
    batchfile                      NUMBER(2,0),
    userid                         NUMBER)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
  STORAGE   (
    INITIAL     122880
    NEXT        24576
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
PARALLEL (DEGREE DEFAULT)
/


-- Triggers for XS_SENTINFO

CREATE OR REPLACE TRIGGER "SMART".xs_fileinfo_get_userid
 BEFORE
  INSERT
 ON xs_sentinfo
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
   :NEW.USERID:=SBLOGIN.USERID;
END;
/
CREATE OR REPLACE TRIGGER "SMART".xs_fileinfo_id
 BEFORE
  INSERT
 ON xs_sentinfo
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare nw integer;
begin
 select XS_FILEINFO_ID_GEN.nextval into nw from dual;
 :new.id:=nw;
end;
/

-- End of DDL Script for Table SMART.XS_SENTINFO

