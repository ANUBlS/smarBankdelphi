ALTER TABLE CASHINFO ADD (Branch NUMBER)
/
RENAME CASHINFO TO CASHINFO_T
/
update cashinfo_t set branch =0
/
commit
/
CREATE OR REPLACE VIEW cashinfo (
   id,
   person_doc,
   issuedby,
   seria,
   docnumber,
   fromwhen )
AS
SELECT a.id, a.person_doc, a.issuedby, a.seria, a.docnumber, a.fromwhen
  FROM cashinfo_t a
  where Branch = (select filialid from sba_objinf where obj=(select user from dual))
/
CREATE OR REPLACE TRIGGER ins_cashinfo_t
 BEFORE
  INSERT
 ON cashinfo_t
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
 select filialid into :new.branch from sba_objinf where obj=(select user from dual);
 
end;
/

