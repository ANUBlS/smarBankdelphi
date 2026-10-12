DROP TABLE smart.deleted_trans
/

CREATE TABLE smart.deleted_trans
    (id                             NUMBER(10,0) NOT NULL,
    parentid                       NUMBER,
    op_id                          VARCHAR2(30),
    commit_opid                    VARCHAR2(30),
    deleter                        VARCHAR2(30),
    dat                            DATE NOT NULL,
    tim                            DATE,
    deletetime                     DATE,
    debt                           NUMBER(10,0) NOT NULL,
    kredit                         NUMBER(10,0) NOT NULL,
    val_acc                        NUMBER(10,0) NOT NULL,
    currencyid_c                   NUMBER(4,0) NOT NULL,
    vid_op                         NUMBER(5,0),
    ammount                        NUMBER(15,2) NOT NULL,
    lammount                       NUMBER(15,2) NOT NULL,
    ammount_c                      NUMBER(15,2) NOT NULL,
    kassa_b                        NUMBER(5,0),
    kassa_z                        NUMBER(5,0),
    rate_d                         NUMBER(15,2),
    rate_c                         NUMBER(15,2),
    name                           VARCHAR2(255),
    status                         NUMBER)
/

CREATE OR REPLACE TRIGGER smart.trg_prov_to_log
 BEFORE
  DELETE
 ON smart.provarch
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
   insert into deleted_trans
               (id, parentid, op_id,
                commit_opid, deleter, dat,
                tim, deletetime, debt, kredit, val_acc,
                currencyid_c, vid_op, ammount, lammount,
                ammount_c, kassa_b, kassa_z, rate_d,
                rate_c, name, status
               )
        values (:old.id, :old.parentid, sb_aca.getuserbyid (:old.op_id),
                sb_aca.getuserbyid (:old.commit_opid), user, :old.dat,
                :old.tim, sysdate, :old.debt, :old.kredit, :old.val_acc,
                :old.currencyid_c, :old.vid_op, :old.ammount, :old.lammount,
                :old.ammount_c, :old.kassa_b, :old.kassa_z, :old.rate_d,
                :old.rate_c, :old.name, 2
               );
end;
/


CREATE OR REPLACE VIEW smart.all_provs (
   optype,
   id,
   oper,
   commiter,
   deleter,
   dat,
   addtime,
   deletetime,
   debt,
   kredit,
   ammount,
   lammount,
   name,
   optp )
AS
select 0 optype, p.id, sb_aca.getuserbyid (p.op_id) oper, '-' commiter,
       '-' deleter, dat, tim addtime, null deletetime, d.acc_no debt,
       k.acc_no kredit, ammount, lammount, p.name, 'Ïכאםכארהûנûכלûר' optp
  from lazytransaction p, account d, account k
 where debt = d.id and kredit = k.id
union
select 1 optype, p.id, sb_aca.getuserbyid (p.op_id) oper,
       sb_aca.getuserbyid (commit_opid) commiter, '-' deleter, dat,
       tim addtime, null deletetime, d.acc_no debt, k.acc_no kredit, ammount,
       lammount, p.name, 'Òÿסהטדכÿםלטר' optp
  from provarch p, account d, account k
 where debt = d.id and kredit = k.id
union
select 2 optype, p.id, (p.op_id) oper, (commit_opid) commiter, deleter, dat,
       tim addtime, deletetime, d.acc_no debt, k.acc_no kredit, ammount,
       lammount, p.name, 'Ëÿüג והטכלטר' optp
  from deleted_trans p, account d, account k
 where debt = d.id and kredit = k.id
/
