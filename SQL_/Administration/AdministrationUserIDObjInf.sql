ALTER TABLE sba_objinf  ADD (  SysUserid NUMBER )
/
CREATE OR REPLACE TRIGGER sba_objinf_userid
   BEFORE INSERT OR UPDATE
   ON sba_objinf
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
   userid   INTEGER;
BEGIN
   IF :NEW.TYPE = 'U' THEN
      SELECT ID INTO userid FROM user$ WHERE NAME = :NEW.obj;
      :NEW.sysuserid := userid;
   END IF;
END;
/
DELETE FROM sba_objinf WHERE obj NOT IN (SELECT NAME FROM user$) AND TYPE = 'U'
/
DELETE FROM sba_groupmanager WHERE groupid NOT IN (SELECT ID FROM sba_objinf)
/
DELETE FROM sba_groupmanager WHERE userid NOT IN (SELECT ID FROM user$)
/
DELETE FROM sba_usergrants WHERE cur_user NOT IN (SELECT NAME FROM user$)
/
DELETE FROM sba_usergrants_advanced WHERE username NOT IN (SELECT NAME FROM user$)
/
DELETE FROM sba_usergrants_advanced WHERE advancedgrantid NOT IN (SELECT ID FROM sba_advanced_grants)
/
DELETE FROM sba_userman WHERE muser NOT IN (SELECT ID FROM user$)
/
DELETE FROM sba_userman WHERE suser NOT IN (SELECT ID FROM user$)
/
DELETE FROM sba_userman WHERE ugrup NOT IN (SELECT ID FROM sba_objinf)
/
--
UPDATE sba_objinf SET sysuserid = (SELECT ID FROM user$ WHERE NAME = obj) WHERE TYPE = 'U'

