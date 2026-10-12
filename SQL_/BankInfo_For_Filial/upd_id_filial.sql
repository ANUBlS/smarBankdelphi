-- Start of DDL Script for Trigger SMART.UPD_FILIAL_ID
-- Generated 22-Jul-2005 16:55:07 from SMART@SBMAIN



CREATE OR REPLACE TRIGGER upd_filial_id
BEFORE UPDATE OF 
  id
ON filial_t
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
 update bankinfo_t set kod_fil=:new.id where kod_fil=:old.id;
 update bankinfo_t set kod_bfil=:new.id where kod_bfil=:old.id;
 update bankproperties set filialid=:new.id where filialid=:old.id;
 update sba_objinf set filialid=:new.id where filialid=:old.id;
 update account set filial=:new.id where filial=:old.id;
 update filialinfo set kod_fil=:new.id where kod_fil=:old.id;
 update xs_accounts set branchid=:new.id where branchid=:old.id;
 update xs_branchaccount set branchid=:new.id where branchid=:old.id;
 update commision_trans_t set branch=:new.id where branch=:old.id;
 update xs_batchs set filial=:new.id where filial=:old.id;
 update xs_batchs_archive set filial=:new.id where filial=:old.id;
 update xs_incoming set filial=:new.id where filial=:old.id;
 update CREDITSMGR.CM_PORTFOLIO set branchid=:new.id where branchid=:old.id;
end;
/

-- End of DDL Script for Trigger SMART.UPD_FILIAL_ID


