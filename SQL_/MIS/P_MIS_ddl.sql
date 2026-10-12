-- Start of DDL Script for Package Body SMART.P_MIS
-- Generated 5-Sep-2004 23:55:37 from SMART@SB

-- Drop the old instance of P_MIS
DROP PACKAGE p_mis
/

CREATE OR REPLACE 
PACKAGE p_mis
  IS

type t_Query is record (
 Type varchar(32),
 val_name varchar(6),
 Ostat Number(15,2),
 Obr_d Number(15,2),
 Obr_k Number(15,2),
 Sayi integer,
 Daxil integer,
 Cixish integer
);
 
-------------------------
function InCount(	
 vDate	date 
,vType   varchar
,vVal_Name varchar
  ) return integer;
-------------------------
function OutCount(	
 vDate	date 
,vType   varchar
,vVal_Name varchar
) return integer;
--------------------------
Procedure build(Bdate Date,Edate Date);
Procedure Builder(BDate Date,EDate Date);
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY p_mis
IS
---------------------------------------------
Function InCount(	
 vDate	date 
,vType   varchar
,vVal_Name varchar
) return integer  
as
result integer;
Begin
select count(opendate) into result from v_mis1 where 
    datdate=vDate 
 and opendate=vDate
 and type= vType
 and val_name = vVal_name;
 return result;
End;
------------------------------------------------	
Function OutCount(	
 vDate	date 
,vType   varchar
,vVal_Name varchar
) return integer  
as
result integer;
Begin
select count(CloseDate) into result from v_mis1 where 
    datdate=vDate 
 and CloseDate=vDate
 and type= vType
 and val_name = vVal_name;
 return result;
End;
------------------------------------------------	
Procedure Build(BDate Date,EDate Date) as
--eDate date;
Cursor Query(eDate date) is 
Select 
type, val_name, 
  sum(Ostat) as Ostat --, sum(Pok_ostat)
, sum(obr_d) as Obr_D
, sum(obr_k) as Obr_K 
--,sum(pok_obr_d)
--, sum(pok_obr_k)
, count(type) Sayi  
, p_mis.InCount (eDate,type, val_name) as daxil 
, p_mis.OutCount(eDate,type, val_name) as Cixish 
from v_mis1
where datdate=eDate
group by type, val_name
order by Sayi desc, type, val_name;

rQuery t_Query;
DayCount integer;
Begin
dayCount:=eDate-bDate;
FOR i IN 0..DayCount LOOP
OPEN Query(eDate+DayCount); 
LOOP
 FETCH Query INTO rQuery;
 EXIT WHEN Query%NOTFOUND;
 dbms_output.put_line(rQuery.type);

END LOOP;
dbms_output.put_line('11111111111111111111');
close Query;
END LOOP;

End;
------------------------------------------------	
Procedure Builder(BDate Date,EDate Date) as
DayCount integer;
nDate date;
Begin
dayCount:=eDate-bDate;
delete from mis_dep;
FOR i IN 0..DayCount LOOP
nDate:=bDate+i;
insert into Mis_Dep
Select 
  bDate+i,
  type, val_name 
, sum(Ostat) as Ostat --, sum(Pok_ostat)
, sum(obr_d) as Obr_D
, sum(obr_k) as Obr_K 
--,sum(pok_obr_d)
--, sum(pok_obr_k)
, count(type) Sayi  
, p_mis.InCount (nDate,type, val_name) as daxil 
, p_mis.OutCount(nDate,type, val_name) as Cixish 
from v_mis1
where datdate=nDate
group by type, val_name;
--order by Sayi desc, type, val_name;
--insert into Mis_Dep (type) values ('');
END LOOP;

End;
-------------------------------------------------

END;
/


-- End of DDL Script for Package Body SMART.P_MIS

