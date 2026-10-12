-- Start of DDL Script for Trigger SMART.XS_ACCOUNTS_ID
-- Generated 5-Feb-2007 19:53:12 from SMART@SBN

CREATE OR REPLACE TRIGGER xs_accounts_id
 BEFORE
  INSERT
 ON xs_accounts
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare nw integer;
begin
 select XS_ACCOUNTS_ID_GEN.nextval into nw from dual;
 :new.id:=nw;
end;
/

-- End of DDL Script for Trigger SMART.XS_ACCOUNTS_ID

-- Start of DDL Script for Trigger SMART.XS_BATCHS_ID
-- Generated 5-Feb-2007 19:53:12 from SMART@SBN

CREATE OR REPLACE TRIGGER xs_batchs_id
 BEFORE
  INSERT
 ON xs_batchs
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare nw integer;
begin
 select XS_BATCHS_ID_GEN.nextval into nw from dual;
 :new.id:=nw;
end;
/

-- End of DDL Script for Trigger SMART.XS_BATCHS_ID

-- Start of DDL Script for Trigger SMART.XS_BENEFICIARY_ID
-- Generated 5-Feb-2007 19:53:12 from SMART@SBN

CREATE OR REPLACE TRIGGER xs_beneficiary_id
 BEFORE
  INSERT
 ON xs_beneficiary
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   nw   INTEGER;
BEGIN
   SELECT xs_beneficiary_id_gen.NEXTVAL
     INTO nw
     FROM DUAL;

   :NEW.id := nw;
END;
/

-- End of DDL Script for Trigger SMART.XS_BENEFICIARY_ID

-- Start of DDL Script for Trigger SMART.XS_BENEFICIARY_USERID
-- Generated 5-Feb-2007 19:53:12 from SMART@SBN

CREATE OR REPLACE TRIGGER xs_beneficiary_userid
 BEFORE
  INSERT
 ON xs_beneficiary
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
   :NEW.USERID:=SBLOGIN.USERID;
END;


-- End of DDL Script for Table SMART.HOXMESSAGE_OUT
/

-- End of DDL Script for Trigger SMART.XS_BENEFICIARY_USERID

-- Start of DDL Script for Trigger SMART.XS_FILEINFO_GET_USERID
-- Generated 5-Feb-2007 19:53:12 from SMART@SBN

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

-- End of DDL Script for Trigger SMART.XS_FILEINFO_GET_USERID

-- Start of DDL Script for Trigger SMART.XS_FILEINFO_ID
-- Generated 5-Feb-2007 19:53:12 from SMART@SBN

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

-- End of DDL Script for Trigger SMART.XS_FILEINFO_ID

-- Start of DDL Script for Trigger SMART.XS_GET_USERID
-- Generated 5-Feb-2007 19:53:12 from SMART@SBN

CREATE OR REPLACE TRIGGER xs_get_userid
 BEFORE
  INSERT
 ON xs_batchs
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
   :NEW.USERID:=SBLOGIN.USERID;
END;
/

-- End of DDL Script for Trigger SMART.XS_GET_USERID

-- Start of DDL Script for Trigger SMART.XS_INCOMING_UPDATE_ICON
-- Generated 5-Feb-2007 19:53:12 from SMART@SBN

CREATE OR REPLACE TRIGGER xs_incoming_update_icon
 BEFORE
  INSERT
 ON xs_incoming
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare nw integer;
begin
 select xs_INCOMING_ID_GEN.nextval into nw from dual;
 :new.id:=nw;
end ;

-- End of DDL Script for Table SMART.XS_BENEFICIARY
/

-- End of DDL Script for Trigger SMART.XS_INCOMING_UPDATE_ICON

-- Start of DDL Script for Trigger SMART.XS_INCOMING_USERID
-- Generated 5-Feb-2007 19:53:12 from SMART@SBN

CREATE OR REPLACE TRIGGER xs_incoming_userid
 BEFORE
  INSERT
 ON xs_incoming
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
   :NEW.USERID:=SBLOGIN.USERID;
END;
/

-- End of DDL Script for Trigger SMART.XS_INCOMING_USERID

-- Start of DDL Script for Trigger SMART.XS_TRANSTYPE_NAME_ID
-- Generated 5-Feb-2007 19:53:12 from SMART@SBN

CREATE OR REPLACE TRIGGER xs_transtype_name_id
 BEFORE
  INSERT
 ON xs_transtype_name
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare nw integer;
begin
 select XS_TRANSTYPENAME_ID_GEN.nextval into nw from dual;
 :new.id:=nw;
end ;
/

-- End of DDL Script for Trigger SMART.XS_TRANSTYPE_NAME_ID

