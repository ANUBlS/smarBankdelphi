-- Start of DDL Script for Trigger SMART.XS_BENEFICIARY_ID
-- Generated 20-May-2006 14:27:22 from SMART@SB

CREATE OR REPLACE TRIGGER "SMART".xs_beneficiary_id
 BEFORE
  INSERT
 ON xs_beneficiary
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   nw   INTEGER;
BEGIN
   SELECT xs_beneficiary_id_gen.NEXTVAL
     INTO nw
     FROM DUAL;

   :NEW.id := nw;
END;
/

-- End of DDL Script for Trigger SMART.XS_BENEFICIARY_ID

