CREATE OR REPLACE 
PACKAGE tm_manage
is
   procedure committicket (aid number);
end;
/

CREATE OR REPLACE 
PACKAGE BODY tm_manage
is
   procedure committicket (aid number)
   is
   begin
      update tm_archive
         set status = status + 1
       where status <= 5 and id = aid;

      commit;
   end;
end;
/

