--update bal_spr1 set Additionaltypeid=typeid where additionaltypeid is null;
--delete from bal_spr1 where bal_cn<1001
update bal_spr1 set AccGroup=SubStr(Bal_cn,1,3);
update bal_spr1 set AccClass=SubStr(Bal_cn,1,1);
update bal_spr1 set Part=SubStr(Bal_cn,1,2);

CREATE OR REPLACE TRIGGER tr_balspr
 BEFORE
   INSERT OR UPDATE OF bal_cn
 ON bal_spr1
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
 :new.AccGroup:=SubStr(:new.bal_cn,1,3);
 :new.AccClass:=SubStr(:new.bal_cn,1,1);
 :new.Part:=SubStr(:new.bal_cn,1,2);
end;

select * from bal_spr1 order by bal_cn;

