/* Formatted on 2006/08/02 14:49 (Formatter Plus v4.8.6) */
DELETE FROM archost
      WHERE datdate > '29-aug-2006'
/
COMMIT
/
DELETE FROM lazyrest
/
COMMIT
/
INSERT INTO lazyrest
   SELECT *
     FROM archost
    WHERE datdate = '29-aug-2006'
/
COMMIT
/
DELETE FROM provarch
      WHERE dat > '29-aug-2006'
/
COMMIT
/
DELETE FROM operkurs
      WHERE dat > '29-aug-2006'
/
UPDATE archost
   SET id_number = 3
 WHERE datdate = '29-aug-2006'
/
COMMIT
/
UPDATE archost
   SET id_number = 2
 WHERE datdate = '28-aug-2006'
/
COMMIT
/
UPDATE operkurs
   SET shifr = 3
 WHERE dat = '29-aug-2006'
/
UPDATE operkurs
   SET shifr = 2
 WHERE dat = '28-aug-2006'
/
UPDATE provarch
   SET shifr = 3
 WHERE dat = '29-aug-2006'
/
COMMIT
/
UPDATE provarch
   SET shifr = 2
 WHERE dat = '28-aug-2006'
/
COMMIT
/
DELETE FROM creditsmgr.cm_curr_state
/
DELETE FROM creditsmgr.cm_prev_state
/
UPDATE creditsmgr.cm_history
   SET partitionkey = 0
 WHERE hdate = '29-aug-2006'
/
UPDATE creditsmgr.cm_history
   SET partitionkey = 1
 WHERE hdate = '28-aug-2006'
/
DELETE FROM creditsmgr.cm_int_currstate
/
DELETE FROM creditsmgr.cm_int_prevstate
/
UPDATE creditsmgr.cm_interests
   SET partitionkey = 0
 WHERE hdate = '29-aug-2006'
/
UPDATE creditsmgr.cm_interests
   SET partitionkey = 1
 WHERE hdate = '28-aug-2006'
/
COMMIT
/
UPDATE sysdat
   SET tek_dat = '29-aug-2006',
       pred_dat = '28-aug-2006',
       arc_day = '25-aug-2006'
/
COMMIT
/

