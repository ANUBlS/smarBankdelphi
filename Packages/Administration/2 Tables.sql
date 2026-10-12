CREATE TABLE smart.modules
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(64) NOT NULL,
    description                    VARCHAR2(128),
    sid#                           NUMBER,
    trvdesc                        VARCHAR2(256),
    can_insert                     NUMBER(1,0) DEFAULT 0,
    can_delete                     NUMBER(1,0) DEFAULT 0,
    can_update                     NUMBER(1,0) DEFAULT 0

 ,
    advanced_grants                NUMBER(1,0) DEFAULT 0
 )
/
ALTER TABLE smart.modules
ADD CONSTRAINT pk_modules PRIMARY KEY (id)
USING INDEX
/

ALTER TABLE smart.modules
ADD CONSTRAINT uk_modulename UNIQUE (description)
USING INDEX
/

ALTER TABLE smart.modules
ADD CONSTRAINT classid_unique UNIQUE (name)
USING INDEX
/

CREATE OR REPLACE TRIGGER smart.bi_modules
 BEFORE
  INSERT
 ON smart.modules
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
	select modules_id_gen.nextval
		into :new.ID
	from dual;	
end;
/

CREATE OR REPLACE TRIGGER smart.sba_logs_modules
 BEFORE
  INSERT OR DELETE OR UPDATE
 ON smart.modules
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
   if inserting
   then
      sb_adm.admlog_add (2,
                         '',
                         :new.description,
                         :new.can_insert,
                         :new.can_update,
                         :new.can_delete,
                         1,
                         :new.name,
                         :new.trvdesc
                        );
   else
      if updating
      then
         sb_adm.admlog_add (2,
                            '',
                            :old.description,
                            :old.can_insert,
                            :old.can_update,
                            :old.can_delete,
                            2,
                            :old.name,
                            :old.trvdesc
                           );
         sb_adm.admlog_add (2,
                            '',
                            :new.description,
                            :new.can_insert,
                            :new.can_update,
                            :new.can_delete,
                            4,
                            :new.name,
                            :new.trvdesc
                           );
      else
         if deleting
         then
            sb_adm.admlog_add (2,
                               '',
                               :old.description,
                               :old.can_insert,
                               :old.can_update,
                               :old.can_delete,
                               3,
                               :old.name,
                               :old.trvdesc
                              );
         end if;
      end if;
   end if;
end;
/
CREATE TABLE smart.sba_adm_logs
    (id                             NUMBER,
    logtype                        NUMBER,
    usname                         VARCHAR2(30),
    modtime                        DATE,
    moduser                        VARCHAR2(30),
    modul                          VARCHAR2(50),
    cins                           NUMBER(1,0),
    cupd                           NUMBER(1,0),
    cdel                           NUMBER(1,0),
    oper                           NUMBER(1,0),
    description                    VARCHAR2(128),
    trvdesc                        VARCHAR2(256),
    advanced_grants                NUMBER(1,0),
    otype                          VARCHAR2(1),
    ofullname                      VARCHAR2(128),
    ophone                         VARCHAR2(30),
    oclassid                       NUMBER,
    ofilialid                      NUMBER,
    oadvtype                       NUMBER,
    osysuserid                     NUMBER)
/
CREATE OR REPLACE TRIGGER smart.bi_sba_adm_logs
 BEFORE
  INSERT
 ON smart.sba_adm_logs
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select nvl(max(id),0)+1, user, sysdate
    into :new.id, :new.usname, :new.modtime
    from sba_adm_logs;
end;
/

CREATE TABLE smart.sba_advanced_grants
    (id                             NUMBER NOT NULL,
    grantname                      VARCHAR2(128) NOT NULL,
    errormessage                   VARCHAR2(128),
    moduleid                       NUMBER NOT NULL,
    description                    VARCHAR2(128) NOT NULL)
/
ALTER TABLE smart.sba_advanced_grants
ADD CONSTRAINT uk_sba_adv_grant_name UNIQUE (grantname)
USING INDEX
/

ALTER TABLE smart.sba_advanced_grants
ADD CONSTRAINT sba_advanced_grants_primkey PRIMARY KEY (id)
USING INDEX
/

CREATE OR REPLACE TRIGGER smart.sba_advanced_grants_upcase
 BEFORE
  INSERT OR UPDATE
 ON smart.sba_advanced_grants
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
 :new.grantname:=Upper(:new.grantname);
end;
/

CREATE OR REPLACE TRIGGER smart.sba_advanced_grants_id
 BEFORE
  INSERT
 ON smart.sba_advanced_grants
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select SBA_ADVANCED_GRANTS_ID_GEN.NEXTVAL
   into :NEW.id
   from dual;
end;
/

CREATE TABLE smart.sba_balance_acc
    (username                       VARCHAR2(30),
    bal_acc                        NUMBER,
    optype                         NUMBER)
/

CREATE TABLE smart.sba_class_balance_acc
    (username                       VARCHAR2(30),
    bal_acc                        NUMBER,
    optype                         NUMBER)
/

CREATE TABLE smart.sba_class_flags
    (username                       VARCHAR2(30),
    flagsymb                       VARCHAR2(3))
/
CREATE TABLE smart.sba_classgrants_advanced
    (username                       VARCHAR2(128) NOT NULL,
    advancedgrantid                NUMBER NOT NULL,
    modname                        VARCHAR2(128))
/
ALTER TABLE smart.sba_classgrants_advanced
ADD CONSTRAINT sba_clsgrants_advanced_prkey PRIMARY KEY (username, 
  advancedgrantid)
USING INDEX
/


CREATE TABLE smart.sba_groupmanager
    (userid                         NUMBER NOT NULL,
    groupid                        NUMBER NOT NULL,
    type                           NUMBER(1,0) NOT NULL)
/

COMMENT ON COLUMN smart.sba_groupmanager.type IS '1 master,2 slave,3 - NEYTRAL'
/
CREATE TABLE smart.sba_grouptypes
    (id                             NUMBER NOT NULL,
    type$                          VARCHAR2(24) NOT NULL,
    descr                          VARCHAR2(128))
PARALLEL (DEGREE DEFAULT)
/
ALTER TABLE smart.sba_grouptypes
ADD CONSTRAINT sba_grouptypes_prim PRIMARY KEY (id)
USING INDEX
/

CREATE OR REPLACE TRIGGER smart.sba_grouptypes_id_gen
 BEFORE
  INSERT
 ON smart.sba_grouptypes
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select SBA_GROUPTYPES_SEC.NEXTVAL
   into :NEW.id
   from dual;
end;
/

CREATE TABLE smart.sba_log_tables
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(100),
    queryst                        VARCHAR2(255),
    descrt                         VARCHAR2(100))
/
CREATE TABLE smart.sba_logs
    (id                             NUMBER,
    cuser                          VARCHAR2(30),
    tablename                      NUMBER,
    oper                           NUMBER,
    tid                            NUMBER,
    tim                            DATE)
/
CREATE OR REPLACE TRIGGER smart.sba_bi_logs
 BEFORE
  INSERT
 ON smart.sba_logs
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select sba_logs_id_gen.nextval, user, sysdate
    into :new.id, :new.cuser, :new.tim
    from dual;
end;
/

COMMENT ON COLUMN smart.sba_logs.oper IS '1-Ins. 2-B Upd, 3-Del, 4-A Upd'
/
CREATE TABLE smart.sba_logs_modaccess
    (id                             NUMBER,
    cuser                          VARCHAR2(30),
    tim                            DATE,
    modul                          VARCHAR2(100))
/
CREATE OR REPLACE TRIGGER smart.bi_sba_logsmodaccess
 BEFORE
  INSERT
 ON smart.sba_logs_modaccess
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
   select sba_logs_id_gen.nextval, sysdate
     into :new.id, :new.tim
     from dual;
end;
/

CREATE TABLE smart.sba_monetaryborder
    (advgrantid                     NUMBER NOT NULL,
    maxavalue                      NUMBER NOT NULL)
PARALLEL (DEGREE DEFAULT)
/

CREATE TABLE smart.sba_objinf
    (id                             NUMBER NOT NULL,
    type                           CHAR(1) NOT NULL,
    obj                            VARCHAR2(56) NOT NULL,
    createdate                     DATE,
    description                    VARCHAR2(96),
    fullname                       VARCHAR2(96),
    phone                          VARCHAR2(8),
    classid                        NUMBER,
    filialid                       NUMBER,
    advtype                        NUMBER,
    sysuserid                      NUMBER)
/
ALTER TABLE smart.sba_objinf
ADD CONSTRAINT sba_objinf_primkey PRIMARY KEY (id)
USING INDEX
/

ALTER TABLE smart.sba_objinf
ADD CONSTRAINT sba_objinf_unkey UNIQUE (obj)
USING INDEX
/


CREATE OR REPLACE TRIGGER smart.sba_objinf_userid
 BEFORE
  INSERT OR UPDATE
 ON smart.sba_objinf
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   userid   INTEGER;
BEGIN
   IF :NEW.TYPE = 'U'
   THEN
      SELECT ID
        INTO userid
        FROM user$
       WHERE NAME = :NEW.obj;

      :NEW.sysuserid := userid;
   END IF;
END;
/

CREATE OR REPLACE TRIGGER smart.sba_objinf_idgen
 BEFORE
  INSERT
 ON smart.sba_objinf
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
	select SBA_OBJINF_ID_GEN.nextval
		into :new.ID
	from dual;	
end;
/

CREATE OR REPLACE TRIGGER smart.sba_objinf_date
 BEFORE
  INSERT
 ON smart.sba_objinf
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
 :new.createdate:=sysdate;
end;
/

CREATE OR REPLACE TRIGGER smart.sba_logs_objinf
 BEFORE
  INSERT OR DELETE OR UPDATE
 ON smart.sba_objinf
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
   if inserting
   then
      sb_adm.admlog_add (3,
                         :new.obj,
                         null,
                         null,
                         null,
                         null,
                         1,
                         :new.description,
                         null,
                         :new.type,
                         :new.fullname,
                         :new.phone,
                         :new.classid,
                         :new.filialid,
                         :new.advtype,
                         :new.sysuserid
                        );
   else
      if updating
      then
         sb_adm.admlog_add (3,
                            :old.obj,
                            null,
                            null,
                            null,
                            null,
                            2,
                            :old.description,
                            null,
                            :old.type,
                            :old.fullname,
                            :old.phone,
                            :old.classid,
                            :old.filialid,
                            :old.advtype,
                            :old.sysuserid
                           );
         sb_adm.admlog_add (3,
                            :new.obj,
                            null,
                            null,
                            null,
                            null,
                            4,
                            :new.description,
                            null,
                            :new.type,
                            :new.fullname,
                            :new.phone,
                            :new.classid,
                            :new.filialid,
                            :new.advtype,
                            :new.sysuserid
                           );
      else
         if deleting
         then
            sb_adm.admlog_add (3,
                               :old.obj,
                               null,
                               null,
                               null,
                               null,
                               3,
                               :old.description,
                               null,
                               :old.type,
                               :old.fullname,
                               :old.phone,
                               :old.classid,
                               :old.filialid,
                               :old.advtype,
                               :old.sysuserid
                              );
         end if;
      end if;
   end if;
end;
/

CREATE TABLE smart.sba_objmanager
    (id                             NUMBER NOT NULL,
    object                         VARCHAR2(96) NOT NULL,
    ins                            NUMBER(1,0) DEFAULT 0 NOT NULL,
    upd                            NUMBER(1,0) DEFAULT 0 NOT NULL,
    del                            NUMBER(1,0) DEFAULT 0
  NOT NULL)
/

CREATE TABLE smart.sba_optypes
    (id                             NUMBER NOT NULL,
    name                           VARCHAR2(100))
/
ALTER TABLE smart.sba_optypes
ADD CONSTRAINT pk_sba_optypeid PRIMARY KEY (id)
USING INDEX
/

CREATE OR REPLACE TRIGGER smart.bi_sba_optypes
 BEFORE
  INSERT
 ON smart.sba_optypes
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select nvl(max(id),0)+1
    into :new.id
    from sba_optypes;
end;
/

CREATE TABLE smart.sba_syndec
    (objectname                     VARCHAR2(72) NOT NULL,
    objecttype                     VARCHAR2(48))
/
CREATE UNIQUE INDEX smart.sba_syndec_index ON smart.sba_syndec
  (
    objectname                      ASC
  )
/


COMMENT ON TABLE smart.sba_syndec IS 'Tablica soderjit imena objektov,kotoriye ignoriruyetsa vo vrema sozdaniya synonimov'
/
COMMENT ON COLUMN smart.sba_syndec.objectname IS 'Ima objekta'
/
COMMENT ON COLUMN smart.sba_syndec.objecttype IS 'tip obyekta n/p esli tablica to TABLE ...'
/
CREATE TABLE smart.sba_synreplace
    (target                         VARCHAR2(100) NOT NULL,
    repobject                      VARCHAR2(100) NOT NULL)
/
ALTER TABLE smart.sba_synreplace
ADD CONSTRAINT uk_replace_objs UNIQUE (target, repobject)
USING INDEX
/

CREATE TABLE smart.sba_tempgroupman
    (userid                         NUMBER NOT NULL,
    groupid                        NUMBER NOT NULL,
    type                           NUMBER(1,0) NOT NULL)
/
CREATE TABLE smart.sba_tempusergrants
    (cur_user                       VARCHAR2(72) NOT NULL,
    cur_module                     VARCHAR2(72) NOT NULL,
    can_insert                     NUMBER(1,0),
    can_delete                     NUMBER(1,0),
    can_update                     NUMBER(1,0))
/
CREATE TABLE smart.sba_userflags
    (username                       VARCHAR2(30),
    flagsymb                       VARCHAR2(3))
/
CREATE TABLE smart.sba_usergrants
    (cur_user                       VARCHAR2(72) NOT NULL,
    cur_module                     VARCHAR2(72) NOT NULL,
    can_insert                     NUMBER(1,0),
    can_delete                     NUMBER(1,0),
    can_update                     NUMBER(1,0))
/
CREATE UNIQUE INDEX smart.usergrants_index ON smart.sba_usergrants
  (
    cur_user                        ASC,
    cur_module                      ASC
  )
/


CREATE OR REPLACE TRIGGER smart.sba_usergrants_uppercase
 BEFORE
  INSERT OR UPDATE
 ON smart.sba_usergrants
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
 :NEW.CUR_USER:=UPPER(:NEW.CUR_USER);
 :NEW.CUR_MODULE:=UPPER(:NEW.CUR_MODULE);
end;
/

CREATE OR REPLACE TRIGGER smart.sba_logs_usergrants
 BEFORE
  INSERT OR DELETE OR UPDATE
 ON smart.sba_usergrants
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
   if inserting
   then
      sb_adm.admlog_add (1,
                         :new.cur_user,
                         :new.cur_module,
                         :new.can_insert,
                         :new.can_update,
                         :new.can_delete,
                         1
                        );
   else
      if updating
      then
         sb_adm.admlog_add (1,
                            :old.cur_user,
                            :old.cur_module,
                            :old.can_insert,
                            :old.can_update,
                            :old.can_delete,
                            2
                           );
         sb_adm.admlog_add (1,
                            :new.cur_user,
                            :new.cur_module,
                            :new.can_insert,
                            :new.can_update,
                            :new.can_delete,
                            4
                           );
      else
         if deleting
         then
            sb_adm.admlog_add (1,
                               :old.cur_user,
                               :old.cur_module,
                               :old.can_insert,
                               :old.can_update,
                               :old.can_delete,
                               3
                              );
         end if;
      end if;
   end if;
end;
/

CREATE TABLE smart.sba_usergrants_advanced
    (username                       VARCHAR2(128) NOT NULL,
    advancedgrantid                NUMBER NOT NULL)
/
ALTER TABLE smart.sba_usergrants_advanced
ADD CONSTRAINT sba_usergrants_advanced_prkey PRIMARY KEY (username, 
  advancedgrantid)
USING INDEX
/


CREATE OR REPLACE TRIGGER smart.sba_logs_usergrantadv
 BEFORE
  INSERT OR DELETE OR UPDATE
 ON smart.sba_usergrants_advanced
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
   if inserting
   then
      sb_adm.admlog_add (1,
                         :new.username,
                         sb_adm.getmodadvgrant (:new.advancedgrantid),
                         0,
                         0,
                         0,
                         1
                        );
   else
      if updating
      then
         sb_adm.admlog_add (1,
                            :old.username,
                            sb_adm.getmodadvgrant (:old.advancedgrantid),
                            0,
                            0,
                            0,
                            2
                           );
         sb_adm.admlog_add (1,
                            :new.username,
                            sb_adm.getmodadvgrant (:new.advancedgrantid),
                            0,
                            0,
                            0,
                            4
                           );
      else
         if deleting
         then
            sb_adm.admlog_add (1,
                               :old.username,
                               sb_adm.getmodadvgrant (:old.advancedgrantid),
                               0,
                               0,
                               0,
                               3
                              );
         end if;
      end if;
   end if;
end;
/

CREATE TABLE smart.sba_userman
    (muser                          NUMBER NOT NULL,
    suser                          NUMBER NOT NULL,
    ugrup                          NUMBER,
    type#                          NUMBER DEFAULT NULL ,
    ctype#                         NUMBER DEFAULT NULL )
/

ALTER TABLE smart.sba_balance_acc
ADD CONSTRAINT fk_sba_balance_acc_typeid FOREIGN KEY (optype)
REFERENCES SMART.sba_optypes (id) ON DELETE CASCADE
/
ALTER TABLE smart.sba_class_balance_acc
ADD CONSTRAINT fk_sba_cls_balance_acc_typeid FOREIGN KEY (optype)
REFERENCES SMART.sba_optypes (id) ON DELETE CASCADE
/
ALTER TABLE smart.sba_classgrants_advanced
ADD CONSTRAINT sba_clsgrants_advanced_fork FOREIGN KEY (advancedgrantid)
REFERENCES SMART.sba_advanced_grants (id) ON DELETE CASCADE
/
ALTER TABLE smart.sba_groupmanager
ADD CONSTRAINT sba_groupmanager_forkey FOREIGN KEY (groupid)
REFERENCES SMART.sba_objinf (id) ON DELETE CASCADE
/
ALTER TABLE smart.sba_monetaryborder
ADD CONSTRAINT fk_sba_advgrantborder FOREIGN KEY (advgrantid)
REFERENCES SMART.sba_advanced_grants (id) ON DELETE CASCADE
/
ALTER TABLE smart.sba_objinf
ADD CONSTRAINT fk_sba_objinf FOREIGN KEY (filialid)
REFERENCES SMART.filial_t (id) ON DELETE SET NULL
ENABLE NOVALIDATE
/
ALTER TABLE smart.sba_objmanager
ADD CONSTRAINT sba_objmanager_forkey FOREIGN KEY (id)
REFERENCES SMART.sba_objinf (id) ON DELETE CASCADE
/
ALTER TABLE smart.sba_usergrants_advanced
ADD CONSTRAINT sba_usergrants_advanced_fork FOREIGN KEY (advancedgrantid)
REFERENCES SMART.sba_advanced_grants (id) ON DELETE CASCADE
/
ALTER TABLE smart.sba_userman
ADD CONSTRAINT sba_userman_forkey FOREIGN KEY (ugrup)
REFERENCES SMART.sba_objinf (id) ON DELETE CASCADE
/
