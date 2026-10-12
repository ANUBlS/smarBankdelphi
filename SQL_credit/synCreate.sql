
declare 
cursor c_Objs is
SELECT OBJECT_NAME
  FROM sys.all_objects
 WHERE 
   (owner = UPPER ('CREDITSMGR'))
   and
   (OBJECT_TYPE in ('SYNONYM','TABLE','VIEW','PACKAGE'));

Objs c_Objs%rowtype;   
ObjName VarChar2(255);
TargetUser varchar2(255);
SourceUser varchar2(255);
SPrefix constant varchar2(255) := 'CREATE SYNONYM TARGETUSER.';
SSuffix constant varchar2(255) := ' FOR USERNAME.';
   
begin
   for Objs in c_Objs
   loop
     ObjName := '';
     ObjName := SPrefix||Objs.OBJECT_NAME||SSuffix||Objs.OBJECT_NAME;
     dbms_output.put_line(ObjName);
     dbms_output.put_line('/');     
   end loop;   
end;   

