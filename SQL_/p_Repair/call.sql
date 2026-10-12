--select * from provarch where val_acc=0 and currencyid_c=0 and dat>'9-jun-03'
--select * from provarch where debt=4368 and kredit=1926 and dat>='01-apr-03'
--select * from archost where acc_id=4368 and datdate>'31-mar-03';
--select * from archost where acc_id=1926 and datdate>'31-mar-03';
--select * from provarch where id=115055


DECLARE
transaction sb_transaction.t_transaction;
transactionid number;
flags number;
BEGIN
transaction.id:=117330;
transactionid:=117330;
flags:=0;
-- p_Repair.main(transaction,0);
sb_transaction.transaction_delete(transactionid,flags);
END;
/
SELECT id, dat, debt, kredit, val_acc, vid_op, ammount, lammount, no_doc, 
no_mem, rate_d, rate_c, currencyid_c, ammount_c, name FROM temprepairtrans order by id

--delete From temprepairtrans
