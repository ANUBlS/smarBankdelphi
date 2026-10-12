delete from sba_objinf where type<>'C' and OBJ<>'SMART';
delete from sba_groupmanager;
delete from sba_usergrants;
delete from sba_usergrants_advanced;
delete from sba_userman;

DROP SEQUENCE sba_objinf_id_gen
/

CREATE SEQUENCE sba_objinf_id_gen
  INCREMENT BY 1
  START WITH 5
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  NOCYCLE
  NOORDER
  NOCACHE
/

