create or replace trigger smart.bi_adm_changeimage
   before insert or delete or update
   on smart.custimage
   referencing new as new old as old
   for each row
begin
   sb_aca.checkadvancedobjectaccess ('CUSTINFOIMAGECHANGE', user);
end;
/
create or replace trigger smart.bi_sba_adm_logs
   before insert
   on smart.sba_adm_logs
   referencing new as new old as old
   for each row
begin
   select nvl (max (id), 0) + 1, user, sysdate
     into :new.id, :new.usname, :new.modtime
     from sba_adm_logs;
end;
/
create or replace trigger smart.sba_logs_modules
   before insert or delete or update
   on smart.modules
   referencing new as new old as old
   for each row
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
                            '1B',
                            :old.description,
                            :old.can_insert,
                            :old.can_update,
                            :old.can_delete,
                            2,
                            :old.name,
                            :old.trvdesc
                           );
         sb_adm.admlog_add (2,
                            '1A',
                            :new.description,
                            :new.can_insert,
                            :new.can_update,
                            :new.can_delete,
                            2,
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
create or replace trigger smart.sba_logs_usergrants
   before insert or delete or update
   on smart.sba_usergrants
   referencing new as new old as old
   for each row
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
                            2
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

