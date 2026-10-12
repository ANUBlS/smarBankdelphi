Insert into SMART.ARCHOST 
 (ID_NUMBER, ACC_ID, OSTAT, POK_OSTAT, DATDATE, OBR_D, OBR_K, POK_OBR_D, POK_OBR_K, LASTOPDATE ) 
  SELECT 
 ID_NUMBER, ACC_ID, OSTAT, POK_OSTAT, DATDATE, OBR_D, OBR_K, POK_OBR_D, POK_OBR_K, LASTOPDATE
  FROM SMART.ARCHOST_X where datdate<'1-jan-3'; 
commit;

Insert into SMART.ARCHOST 
 (ID_NUMBER, ACC_ID, OSTAT, POK_OSTAT, DATDATE, OBR_D, OBR_K, POK_OBR_D, POK_OBR_K, LASTOPDATE ) 
  SELECT 
 ID_NUMBER, ACC_ID, OSTAT, POK_OSTAT, DATDATE, OBR_D, OBR_K, POK_OBR_D, POK_OBR_K, LASTOPDATE
  FROM SMART.ARCHOST_X where datdate>='1-jan-3' and datdate<'1-may-3'; 
commit;

Insert into SMART.ARCHOST 
 (ID_NUMBER, ACC_ID, OSTAT, POK_OSTAT, DATDATE, OBR_D, OBR_K, POK_OBR_D, POK_OBR_K, LASTOPDATE ) 
  SELECT 
 ID_NUMBER, ACC_ID, OSTAT, POK_OSTAT, DATDATE, OBR_D, OBR_K, POK_OBR_D, POK_OBR_K, LASTOPDATE
  FROM SMART.ARCHOST_X where datdate>='1-may-3' and datdate<'1-jun-3'; 
commit;

Insert into SMART.ARCHOST 
 (ID_NUMBER, ACC_ID, OSTAT, POK_OSTAT, DATDATE, OBR_D, OBR_K, POK_OBR_D, POK_OBR_K, LASTOPDATE ) 
  SELECT 
 ID_NUMBER, ACC_ID, OSTAT, POK_OSTAT, DATDATE, OBR_D, OBR_K, POK_OBR_D, POK_OBR_K, LASTOPDATE
  FROM SMART.ARCHOST_X where datdate>='1-jun-3' and datdate<'1-aug-3'; 
commit;

Insert into SMART.ARCHOST 
 (ID_NUMBER, ACC_ID, OSTAT, POK_OSTAT, DATDATE, OBR_D, OBR_K, POK_OBR_D, POK_OBR_K, LASTOPDATE ) 
  SELECT 
 ID_NUMBER, ACC_ID, OSTAT, POK_OSTAT, DATDATE, OBR_D, OBR_K, POK_OBR_D, POK_OBR_K, LASTOPDATE
  FROM SMART.ARCHOST_X where datdate>='1-aug-3' and datdate<'1-sep-3'; 
commit;

Insert into SMART.ARCHOST 
 (ID_NUMBER, ACC_ID, OSTAT, POK_OSTAT, DATDATE, OBR_D, OBR_K, POK_OBR_D, POK_OBR_K, LASTOPDATE ) 
  SELECT 
 ID_NUMBER, ACC_ID, OSTAT, POK_OSTAT, DATDATE, OBR_D, OBR_K, POK_OBR_D, POK_OBR_K, LASTOPDATE
  FROM SMART.ARCHOST_X where datdate>='1-sep-3';
commit;

CREATE OR REPLACE VIEW TempOst (
   id_number,
   acc_id,
   ostat,
   pok_ostat,
   datdate,
   obr_d,
   obr_k,
   pok_obr_d,
   pok_obr_k,
   lastopdate )
AS
select "ID_NUMBER","ACC_ID","OSTAT","POK_OSTAT","DATDATE","OBR_D","OBR_K","POK_OBR_D","POK_OBR_K","LASTOPDATE" 
from archost partition (YesterDay) ;


CREATE OR REPLACE VIEW tenostat (
   id_number,
   acc_id,
   ostat,
   pok_ostat,
   datdate,
   obr_d,
   obr_k,
   pok_obr_d,
   pok_obr_k,
   lastopdate )
AS
select "ID_NUMBER","ACC_ID","OSTAT","POK_OSTAT","DATDATE","OBR_D","OBR_K","POK_OBR_D","POK_OBR_K","LASTOPDATE" 
from archost partition (CurrentDay);

/*
ALTER ROLLBACK SEGMENT RB0 OnLINE;

ALTER ROLLBACK SEGMENT RB1 OnLINE;

update archost partition(ArchivalDay) set id_number=1

select * from dba_rollback_segs where segment_name='RB0'

select * from dba_rollback_segs where segment_id=3
*?
