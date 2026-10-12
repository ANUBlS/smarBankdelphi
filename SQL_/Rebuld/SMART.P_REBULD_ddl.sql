-- Start of DDL Script for Package Body SMART.P_REBULD
-- Generated 17-Apr-2004 0:32:55 from SMART@SB

CREATE OR REPLACE 
PACKAGE p_rebuld IS
 Type DynCursor is ref cursor;
 str varchar(4000);
  PROCEDURE TArchOst( TName varchar default null);
  PROCEDURE tProvArch ( TName varchar default null);
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY p_rebuld IS

PROCEDURE tArchost ( TName varchar default null) IS
cArchOst DynCursor;
rArchost archost%rowtype; 
begin
str:='select * from archost_x';
Open cArchost for str; 
 LOOP
  FETCH cArchost INTO rArchost;
  EXIT WHEN cArchost%NOTFOUND;
  Insert into ARCHOST (
   ID_NUMBER, ACC_ID, OSTAT, POK_OSTAT, 
    DATDATE, OBR_D, OBR_K, POK_OBR_D, 
     POK_OBR_K, LASTOPDATE ) 
  values( 
  rArchost.ID_NUMBER, 
  rArchost.ACC_ID,
  rArchost.OSTAT,
  rArchost.POK_OSTAT, 
  rArchost.DATDATE, 
  rArchost.OBR_D,
  rArchost.OBR_K,
  rArchost.POK_OBR_D, 
  rArchost.POK_OBR_K,
  rArchost.LASTOPDATE
);
commit;
   END LOOP;
 CLOSE cArchost;
end;

----------------------------------------------
PROCEDURE tProvArch ( TName varchar default null) IS
cProvArch DynCursor;
rProvArch ProvArch%rowtype; 
begin
str:='select * from ProvArch_x';
Open cProvArch for str; 
 LOOP
  FETCH cProvArch INTO rProvArch;
  EXIT WHEN cProvarch%NOTFOUND;

Insert into PROVARCH (
 ID, OP_ID, NO_PROV, DAT, 
 DEBT, KREDIT, VAL_ACC, VID_OP, 
 AMMOUNT, LAMMOUNT, TIM, SHIFR, 
 NO_PACK, KASSA_B, KASSA_Z, NO_FILIAL, 
 SLOJ_PROV, BANK_D, BANK_K, NO_DOC, 
 NO_MEM, D1, K1, RATE_D, 
 RATE_C, PARENTID, CURRENCYID_C, AMMOUNT_C, 
 NAME ) 
values
( 
rPROVARCH.ID, rPROVARCH.OP_ID, rPROVARCH.NO_PROV, rPROVARCH.DAT, 
rPROVARCH.DEBT, rPROVARCH.KREDIT, rPROVARCH.VAL_ACC, rPROVARCH.VID_OP, 
rPROVARCH.AMMOUNT, rPROVARCH.LAMMOUNT, rPROVARCH.TIM, rPROVARCH.SHIFR, 
rPROVARCH.NO_PACK, rPROVARCH.KASSA_B, rPROVARCH.KASSA_Z, rPROVARCH.NO_FILIAL, 
rPROVARCH.SLOJ_PROV, rPROVARCH.BANK_D, rPROVARCH.BANK_K, rPROVARCH.NO_DOC, 
rPROVARCH.NO_MEM, rPROVARCH.D1, rPROVARCH.K1, rPROVARCH.RATE_D, 
rPROVARCH.RATE_C, rPROVARCH.PARENTID, rPROVARCH.CURRENCYID_C, 
rPROVARCH.AMMOUNT_C, rPROVARCH.NAME
); 
  
commit;
   END LOOP;
 CLOSE cProvarch;
end;









   -- Enter further code below as specified in the Package spec.
END;
/


-- End of DDL Script for Package Body SMART.P_REBULD

