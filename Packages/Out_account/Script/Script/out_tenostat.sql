-- Start of DDL Script for View SMART.TENOSTAT
-- Generated 9-Jun-2006 11:42:12 from SMART@SB

CREATE OR REPLACE VIEW out_tenostat (
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
SELECT "ID_NUMBER", "ACC_ID", "OSTAT", "POK_OSTAT", "DATDATE", "OBR_D",
       "OBR_K", "POK_OBR_D", "POK_OBR_K", "LASTOPDATE"
 FROM out_archost  partition (Today)
/


-- End of DDL Script for View SMART.TENOSTAT

