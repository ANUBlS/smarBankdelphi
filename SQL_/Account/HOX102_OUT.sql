 
LOCK TABLE HOX102_OUT IN EXCLUSIVE  MODE ; 
  
 
--  Make backup copy of original table
 
RENAME  HOX102_OUT TO HOX102_OUT_X ; 
  
 
 
 
CREATE TABLE SMART.HOX102_OUT ( 
  ID           NUMBER, 
  F_ID         NUMBER, 
  OPERCODE     VARCHAR2 (6), 
  ACC_ID       NUMBER, 
  CLIENT_NAME  VARCHAR2 (70), 
  CLIENT_CODE  VARCHAR2 (70), 
  TRANS_REF    VARCHAR2 (16), 
  AMOUNT       NUMBER (22,2), 
  VAL_ACC      NUMBER (4), 
  TRANSDATE    DATE, 
  SEND         NUMBER (1), 
  STATUS       NUMBER (1) )
; 
  
 
--   Copy the data from the renamed table 
 
Insert into SMART.HOX102_OUT (
ID, F_ID, OPERCODE, ACC_ID, 
CLIENT_NAME, CLIENT_CODE, TRANS_REF, AMOUNT, 
VAL_ACC, TRANSDATE, SEND, STATUS ) 
  SELECT 
ID, F_ID, OPERCODE, ACC_ID, 
CLIENT_NAME, CLIENT_CODE, TRANS_REF, AMOUNT, 
VAL_ACC, TRANSDATE, SEND, STATUS
   FROM SMART.HOX102_OUT_X ; 
  
Commit ; 
  
--    Recreate indexes EXCLUDING those created via Unique Constraints
 
 
--   Recreate the FKey Constraints from the NEW table
 
 
--   Recreate the FKey Constraints that reference the NEW table 
 
 
--   Recompile any dependent objects
 
ALTER PACKAGE SMART.HOXPACK COMPILE ; 
  
ALTER PACKAGE  SMART.HOXPACK COMPILE PACKAGE ; 
  
 
--   Grant any privs associated with the old table
 
--  *** Recompile triggers for the new table
 

DROP TRIGGER SMART.HOX_ID_INC;

CREATE OR REPLACE TRIGGER "SMART".hox_id_inc
BEFORE INSERT 
ON hox102_out
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
declare nw integer;
begin
 select hox_mt102.nextval into nw from dual;
 :new.id:=nw;
end Hox_id_inc;
/



