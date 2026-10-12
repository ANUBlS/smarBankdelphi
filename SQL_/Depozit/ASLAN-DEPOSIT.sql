---------  ZENG VURMAMISH BU SKRIPTI BURAXMA -------------------

RENAME sbcm_settings TO sbcm_settings_t
/
ALTER TABLE SBCM_SETTINGS_T ADD ( BranchID Integer )
/

--UPDATE sbcm_settings_t SET branchid = sb_aca.getuserfilial ();
UPDATE sbcm_settings_t SET branchid = (SELECT filial FROM ACCOUNT a WHERE a.ID = accid);
/

CREATE OR REPLACE TRIGGER bi_sbcm_settings
BEFORE INSERT or update
ON sbcm_settings_t
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  if inserting then
   Select SEG_SBCM_SETTINGS.NEXTVAL Into :New.ID From Dual;
  end if;
  :New.BRANCHID := SB_ACA.GetUserFilial();      
end;
/

--  DOSDA ZENG !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

ALTER TABLE SBCM_SETTINGS_T 
 MODIFY (
  BRANCHID NOT NULL

 )
/

ALTER TABLE sbcm_settings_t
DROP CONSTRAINT uk_sbcmsettings
/

ALTER TABLE sbcm_settings_t
ADD CONSTRAINT uk_sbcmsettings UNIQUE (parentid, currencyid, accid, BranchID)
USING INDEX
/
CREATE OR REPLACE VIEW sbcm_settings (
   id,
   parentid,
   currencyid,
   accid )
AS
SELECT id, parentid, currencyid, accid
  FROM sbcm_settings_t
  where branchid=sb_aca.getuserfilial(uid)
/
   

