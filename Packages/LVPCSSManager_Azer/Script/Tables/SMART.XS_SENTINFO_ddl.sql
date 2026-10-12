-- Start of DDL Script for Table SMART.XS_SENTINFO
-- Generated 5-Feb-2007 19:47:33 from SMART@SBN

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
    INITIAL     286720
    NEXT        98304
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  121
  )
PARALLEL (DEGREE DEFAULT)
/


-- Triggers for XS_SENTINFO

CREATE OR REPLACE TRIGGER xs_fileinfo_id
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
CREATE OR REPLACE TRIGGER xs_fileinfo_get_userid
 BEFORE
  INSERT
 ON xs_sentinfo
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
   :NEW.USERID:=SBLOGIN.USERID;
END;
/

-- End of DDL Script for Table SMART.XS_SENTINFO

