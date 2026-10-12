
CREATE OR REPLACE TRIGGER inc_avalute
 AFTER
  INSERT
 ON avalute_t
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
 insert into TempRate (val_kod, ostat, dat, shifr) values (:new.valute,1,sbop.get_date(),3);
end;
/

CREATE OR REPLACE TRIGGER sba_avalute_delete
 BEFORE
  DELETE
 ON avalute_t
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('AVALUTE','delete');  --adm
end;
/

CREATE OR REPLACE TRIGGER sba_avalute_insert
 BEFORE
  INSERT
 ON avalute_t
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('AVALUTE','insert');  --adm
end;
/

CREATE OR REPLACE TRIGGER sba_avalute_update
 BEFORE
  UPDATE
 ON avalute_t
REFERENCING NEW AS NEW OLD AS OLD
begin
 SB_ACA.CheckObjectAccess('AVALUTE','update');  --adm
end;
/
