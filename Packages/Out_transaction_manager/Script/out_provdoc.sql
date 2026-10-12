-- Start of DDL Script for View SMART.OUT_PROVDOC
-- Generated 10-May-2006 17:10:02 from SMART@SB

CREATE OR REPLACE VIEW out_provdoc (
   id,
   op_id,
   no_prov,
   dat,
   debt,
   kredit,
   val_acc,
   vid_op,
   ammount,
   lammount,
   tim,
   shifr,
   no_pack,
   kassa_b,
   kassa_z,
   no_filial,
   sloj_prov,
   bank_d,
   bank_k,
   no_doc,
   no_mem,
   d1,
   k1,
   rate_d,
   rate_c,
   parentid,
   currencyid_c,
   ammount_c,
   name,
   commit_opid )
AS
SELECT
   id, op_id, no_prov, dat, debt, kredit, val_acc, vid_op, ammount,
       lammount, tim, shifr, no_pack, kassa_b, kassa_z, no_filial,
       sloj_prov, bank_d, bank_k, no_doc, no_mem, d1, k1, rate_d,
       rate_c, parentid, currencyid_c, ammount_c, name, commit_opid
FROM
   OUT_provarch  partition (Today)
/


-- End of DDL Script for View SMART.OUT_PROVDOC

