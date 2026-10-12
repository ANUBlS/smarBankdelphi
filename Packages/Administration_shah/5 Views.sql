CREATE OR REPLACE VIEW smart.sba_account (
   id,
   kli_id,
   op_id,
   acc_no,
   val_acc,
   name,
   open_dat,
   close_dat,
   bal_cn1,
   bal_cn2,
   bal_cn3,
   bal_cn4,
   filial,
   sim_otcet,
   tipacc,
   limit,
   old_acc_no,
   pair_acc,
   insider,
   sid# )
AS
select "ID", "KLI_ID", "OP_ID", "ACC_NO", "VAL_ACC", "NAME", "OPEN_DAT",
       "CLOSE_DAT", "BAL_CN1", "BAL_CN2", "BAL_CN3", "BAL_CN4", "FILIAL",
       "SIM_OTCET", "TIPACC", "LIMIT", "OLD_ACC_NO", "PAIR_ACC", "INSIDER",
       "SID#"
  from smart.account
 where (    op_id <> -1
        and not exists (select suser
                          from sba_userman
                         where muser = uid and (type# = 2 or type# = 0))
       )
    or     (op_id in (select suser
                        from sba_userman
                       where muser = uid and (type# = 2 or type# = 0)))
       and (sb_aca.checkbalaccaccess (bal_cn1, 1, user) <> 0)
       and (sb_aca.checksymbolaccess (tipacc, user) <> 0)
/
CREATE OR REPLACE VIEW smart.sba_active_credits (
   id,
   contractno,
   operatorid,
   opendate,
   monthday,
   closedate,
   amount,
   contracttype,
   pledgetype,
   reliabilityid,
   overduereliabilityid,
   clienttype,
   pledgeprice,
   contractaccid,
   clientaccid,
   reserveaccid,
   interestaccid,
   overdueaccid,
   overdueinterestaccid,
   overduereserveaccid,
   facticaldebt,
   facticalinterestdebt,
   overduedebt,
   overdueinterestdebt,
   stopcalculationdate,
   calculationenabled,
   reguiredamountdec,
   reguiredpercentdec,
   lastprocessdate,
   residuaryamount,
   contractaccno,
   interestaccno,
   contractcurrency,
   contractaccname,
   contractcurrencyid,
   status,
   interestbalance,
   clientbalance )
AS
select 
"ID","CONTRACTNO","OPERATORID","OPENDATE","MONTHDAY","CLOSEDATE","AMOUNT","CONTRACTTYPE","PLEDGETYPE","RELIABILITYID","OVERDUERELIABILITYID","CLIENTTYPE","PLEDGEPRICE","CONTRACTACCID","CLIENTACCID","RESERVEACCID","INTERESTACCID","OVERDUEACCID","OVERDUEINTERESTACCID","OVERDUERESERVEACCID","FACTICALDEBT","FACTICALINTERESTDEBT","OVERDUEDEBT","OVERDUEINTERESTDEBT","STOPCALCULATIONDATE","CALCULATIONENABLED","REGUIREDAMOUNTDEC","REGUIREDPERCENTDEC","LASTPROCESSDATE","RESIDUARYAMOUNT","CONTRACTACCNO","INTERESTACCNO","CONTRACTCURRENCY","CONTRACTACCNAME","CONTRACTCURRENCYID","STATUS","INTERESTBALANCE","CLIENTBALANCE" from active_credits
where
(OPERATORID<>-1 and 
not EXISTS(select SUSER from sba_userman where MUSER=uid and (type#=4 or type#=0)))
or
(OPERATORID in(select SUSER from sba_userman where MUSER=uid and (type#=4 or type#=0)))
/
CREATE OR REPLACE VIEW smart.sba_advgrantwider (
   userid,
   username,
   grantname,
   advancedgranterror,
   grantdesc,
   modulesid,
   moduledesc,
   maxamount )
AS
SELECT u.ID userid, u.NAME username, a.grantname grantname,
          a.errormessage advancedgranterror, a.description grantdesc,
          m.NAME modulesid, m.description moduledesc, f.maxavalue maxamount
     FROM smart.user$ u,
          smart.sba_usergrants_advanced g,
          smart.sba_advanced_grants a,
          smart.modules m,
          smart.sba_objinf o,
          smart.sba_monetaryborder f
    WHERE (g.advancedgrantid = a.ID)
      AND (u.NAME = g.username)
      AND (o.obj = u.NAME)
      AND (a.moduleid = m.ID)
      AND (f.advgrantid = a.ID)
/
CREATE OR REPLACE VIEW smart.sba_commision_trans (
   id,
   name,
   debt,
   credit,
   additionaldebt,
   additionalcredit,
   assignment,
   commisionassignment,
   userid )
AS
SELECT id, name, debt, credit, additionaldebt, additionalcredit,
       assignment, commisionassignment, UID as USerid
  FROM commision_trans
where userid in 
(
SELECT ID
  FROM user$
 WHERE NAME IN ((SELECT obj
                   FROM sba_objinf
                  WHERE filialid =
                            (SELECT filialid
                               FROM sba_objinf
                              WHERE obj = USER)))
)
/
CREATE OR REPLACE VIEW smart.sba_customers (
   id,
   op_id,
   open_dat,
   close_dat,
   nerezident,
   prinad_kod,
   name,
   short_name,
   group_klie,
   vid_sob,
   org_sob,
   sfera_dey,
   otrasl,
   nalog_kod,
   kod_okpro,
   inn,
   dat_nal,
   dat_ustav,
   bik,
   otv_lico,
   otv_passport,
   otv_issued,
   otv_isdate )
AS
Select "ID","OP_ID","OPEN_DAT","CLOSE_DAT","NEREZIDENT","PRINAD_KOD","NAME","SHORT_NAME","GROUP_KLIE","VID_SOB","ORG_SOB","SFERA_DEY","OTRASL","NALOG_KOD","KOD_OKPRO","INN","DAT_NAL","DAT_USTAV","BIK","OTV_LICO","OTV_PASSPORT","OTV_ISSUED","OTV_ISDATE"
from smart.CUSTOMERS
where
(op_id<>-1 and 
not EXISTS(select SUSER from sba_userman where MUSER=uid and (type#=3 or type#=0)))
or
(op_id in(select SUSER from sba_userman where MUSER=uid and (type#=3 or type#=0)))
/
CREATE OR REPLACE VIEW smart.sba_exconvert (
   id,
   dat,
   kassa_z,
   debt,
   kredit,
   val_acc,
   currencyid_c,
   ammount,
   ammount_c,
   lammount,
   rate_d,
   rate_c,
   dacc_no,
   kacc_no,
   ostat )
AS
SELECT DISTINCT pr.id, pr.dat, pr.kassa_z, pr.debt, pr.kredit, pr.val_acc,
                pr.currencyid_c, pr.ammount, pr.ammount_c, pr.lammount,
                pr.rate_d, pr.rate_c, a1.acc_no AS dacc_no,
                a2.acc_no AS kacc_no,
                DECODE (pr.rate_d, 1, pr.rate_c, pr.rate_d) AS ostat
           FROM provarch pr, sba_ACCOUNT a1, sba_ACCOUNT a2, convert_assignments c
          WHERE (pr.val_acc <> pr.currencyid_c)
            AND pr.debt = a1.id
            AND pr.kredit = a2.id
            AND a1.bal_cn1 IN
                          (SELECT bal_cn
                             FROM bal_spr1
                            WHERE cashincoming = 0)
            AND a2.bal_cn1 IN
                          (SELECT bal_cn
                             FROM bal_spr1
                            WHERE cashincoming = 0)
            AND pr.kassa_z = c.id
       ORDER BY pr.dat
/
CREATE OR REPLACE VIEW smart.sba_paymentdecree (
   id,
   pdate,
   pnum,
   dbname,
   dbcod,
   dbinn,
   dbcoracc,
   dbswift,
   dacc_no,
   daccname,
   daccinn,
   kbname,
   kbcod,
   kbinn,
   kbcoracc,
   kbswift,
   kacc_no,
   kaccname,
   kaccinn,
   ammount,
   assignment,
   extra,
   sid# )
AS
SELECT id, pdate, pnum, dbname, dbcod, dbinn, dbcoracc, dbswift,
       dacc_no, daccname, daccinn, kbname, kbcod, kbinn, kbcoracc,
       kbswift, kacc_no, kaccname, kaccinn, ammount, assignment, extra,
       sid# 
  FROM smart.paymentdecree
 WHERE
       (sid#<>-1
   AND 
not EXISTS(select SUSER from sba_userman where MUSER=uid and (type#=2 or type#=0)))
or
(sid# in(select SUSER from sba_userman where MUSER=uid and (type#=2 or type#=0)))
/
CREATE OR REPLACE VIEW smart.sba_sbcm_contracts (
   id,
   type#,
   opendate,
   closedate,
   amount,
   contractno,
   contracttype,
   pledgetype,
   reliabilityid,
   clienttype,
   pledgeprice,
   sid#,
   overduereliabilityid )
AS
SELECT "ID","TYPE#","OPENDATE","CLOSEDATE","AMOUNT","CONTRACTNO","CONTRACTTYPE","PLEDGETYPE","RELIABILITYID","CLIENTTYPE","PLEDGEPRICE","SID#","OVERDUERELIABILITYID" FROM sbcm_contracts 
 where
  type# in (1,2) and
(
(SID#<>-1 and 
not EXISTS(select SUSER from sba_userman where MUSER=uid and (type#=4 or type#=0) ))
or
(SID# in(select SUSER from sba_userman where MUSER=uid and (type#=4 or type#=0)))
)
or
type# in (3,4) and
(
(SID#<>-1 and 
not EXISTS(select SUSER from sba_userman where MUSER=uid and (type#=5 or type#=0)))
or
(SID# in(select SUSER from sba_userman where MUSER=uid and (type#=5 or type#=0)))
)
/
CREATE OR REPLACE VIEW smart.sba_sbcm_contracts_legal (
   id,
   type#,
   opendate,
   closedate,
   amount,
   contractno,
   contracttype,
   pledgetype,
   reliabilityid,
   clienttype,
   pledgeprice,
   sid#,
   overduereliabilityid )
AS
select sbcn."ID",sbcn."TYPE#",sbcn."OPENDATE",sbcn."CLOSEDATE",sbcn."AMOUNT",sbcn."CONTRACTNO",sbcn."CONTRACTTYPE",sbcn."PLEDGETYPE",sbcn."RELIABILITYID",sbcn."CLIENTTYPE",sbcn."PLEDGEPRICE",sbcn."SID#",sbcn."OVERDUERELIABILITYID" from SBA_SBCM_CONTRACTS sbcn,sbcm_categories sbcat
where sbcn.clienttype = sbcat.id
and (sbcat.truecategory = 4)
/
CREATE OR REPLACE VIEW smart.sba_sbcm_contracts_phys (
   id,
   type#,
   opendate,
   closedate,
   amount,
   contractno,
   contracttype,
   pledgetype,
   reliabilityid,
   clienttype,
   pledgeprice,
   sid#,
   overduereliabilityid )
AS
select sbcn."ID",sbcn."TYPE#",sbcn."OPENDATE",sbcn."CLOSEDATE",sbcn."AMOUNT",sbcn."CONTRACTNO",sbcn."CONTRACTTYPE",sbcn."PLEDGETYPE",sbcn."RELIABILITYID",sbcn."CLIENTTYPE",sbcn."PLEDGEPRICE",sbcn."SID#",sbcn."OVERDUERELIABILITYID" from SBA_SBCM_CONTRACTS sbcn,sbcm_categories sbcat
where sbcn.clienttype = sbcat.id
and (sbcat.truecategory = 2)
/
CREATE OR REPLACE VIEW smart.sba_tm_archive (
   id,
   pdate,
   pnum,
   dbankfilial,
   dbankcode,
   dbankname,
   dbankinn,
   dbankswift,
   dbankkacc,
   dacc_no,
   daccname,
   daccinn,
   kbankfilial,
   kbankcode,
   kbankname,
   kbankinn,
   kbankswift,
   kbankkacc,
   kbanksubkacc,
   kacc_no,
   kaccname,
   kaccinn,
   ammount,
   description,
   information,
   userid,
   status,
   ticktype )
AS
select a.id, to_date(pdate) pdate, pnum, dbankfilial, to_char(i.kod_b) dbankcode, i.az_name dbankname,
       i.inn dbankinn, i.swift dbankswift, to_char(i.krno) dbankkacc, dacc_no,
       daccname, daccinn, kbankfilial, to_char(b.bankcode) kbankcode, b.name kbankname,
       b.inn kbankinn, b.swift kbankswift, to_char(b.krno) kbankkacc,
       b.subkrno kbanksubkacc, kacc_no, kaccname, kaccinn, ammount,
       a.description, information, userid, a.status, a.ticktype
  from tm_archive a, bankinfo_t i, bankm b, smart.tm_adv_status s
 where     a.dbankfilial = i.kod_fil
       and b.id = a.kbankfilial
       and s.id=a.ticktype
       and (s.statusid=a.status)
and (tm_manage.getgrantsadv(s.name)>1  or tm_manage.getgrantsadv('ticketmanadmin')>1 or sb_aca.isadm_num(user)=1)
/
CREATE OR REPLACE VIEW smart.sba_transactions (
   id,
   operatorid,
   transactiondate,
   debitid,
   debitaccno,
   debitcurrencyid,
   debitcurrencysname,
   creditid,
   creditaccno,
   creditcurrencyid,
   creditcurrencysname,
   debitamount,
   creditamount,
   lamount,
   debitrate,
   creditrate,
   debitbank,
   creditbank,
   packagenumber,
   cyphercode,
   operationcode,
   inbalancechar,
   outbalancechar,
   filialid,
   debitbalance,
   name,
   flags,
   status,
   reject_reason )
AS
Select "ID","OPERATORID","TRANSACTIONDATE","DEBITID","DEBITACCNO","DEBITCURRENCYID","DEBITCURRENCYSNAME","CREDITID","CREDITACCNO","CREDITCURRENCYID","CREDITCURRENCYSNAME","DEBITAMOUNT","CREDITAMOUNT","LAMOUNT","DEBITRATE","CREDITRATE","DEBITBANK","CREDITBANK","PACKAGENUMBER","CYPHERCODE","OPERATIONCODE","INBALANCECHAR","OUTBALANCECHAR","FILIALID","DEBITBALANCE","NAME","FLAGS","STATUS","REJECT_REASON" 
from transactions
where
(OPERATORID<>-1 and 
not EXISTS(select SUSER from sba_userman where MUSER=uid and (type#=1 or type#=0)))
or
(OPERATORID in(select SUSER from sba_userman where MUSER=uid and (type#=1 or type#=0)))
/
CREATE OR REPLACE VIEW smart.sbav_logs_account (
   id,
   cuser,
   tablename,
   oper,
   tid,
   tim,
   acc_no,
   name,
   operat )
AS
SELECT l.id, cuser, tablename, oper, tid, tim, a.acc_no, a.name, decode (oper,1,'Daxil etmÿ',2,'Redaktÿ',3,'Lÿüv','-') operat
  FROM sba_logs l, account a
  where l.tablename=2 and l.tid=a.id(+) and l.tid is not null
/
CREATE OR REPLACE VIEW smart.sbav_logs_custimage (
   id,
   cuser,
   tablename,
   oper,
   tid,
   tim,
   name,
   custid,
   operat )
AS
select   l.id, cuser, tablename, oper, tid, tim, c.name, c.id custid,
            decode (oper,
                    1, 'Daxil etmÿ',
                    2, 'Redaktÿ',
                    3, 'Lÿüv',
                    '-'
                   ) operat
       from sba_logs l, customers c, custinfo i
      where tablename = 1 and l.tid = i.id and i.idcust = c.id
   order by tim desc
/
CREATE OR REPLACE VIEW smart.sbav_logs_custinfo (
   id,
   cuser,
   tablename,
   oper,
   tid,
   tim,
   name,
   custid,
   operat )
AS
select   l.id, cuser, tablename, oper, tid, tim, c.name, c.id custid,
            decode (oper,
                    1, 'Daxil etmÿ',
                    2, 'Redaktÿ',
                    3, 'Lÿüv',
                    '-'
                   ) operat
       from sba_logs l, customers c, custinfo i
      where tablename = 5 and l.tid = i.id and i.idcust = c.id
   order by tim desc
/
CREATE OR REPLACE VIEW smart.sbav_logs_customers (
   id,
   cuser,
   tablename,
   oper,
   tid,
   tim,
   name,
   custid,
   operat )
AS
select   l.id, cuser, tablename, oper, tid, tim, c.name, c.id custid,
            decode (oper,
                    1, 'Daxil etmÿ',
                    2, 'Redaktÿ',
                    3, 'Lÿüv',
                    '-'
                   ) operat
       from sba_logs l, customers c
      where tablename = 4 and l.tid = c.id
   order by tim desc
/
CREATE OR REPLACE VIEW smart.sbav_logs_modaccess (
   id,
   cuser,
   tim,
   modul,
   description,
   trvdesc )
AS
SELECT a.id, cuser, tim, modul, m.description, m.trvdesc
  FROM sba_logs_modaccess a, modules m
  where a.modul=m.name(+) and m.description<>'SPLASH'
  order by tim desc
/
CREATE OR REPLACE VIEW smart.sbav_logs_portfolio (
   id,
   cuser,
   tablename,
   oper,
   tid,
   tim,
   numberofcredit,
   name,
   operat )
AS
select l.id, cuser, tablename, oper, tid, tim, p.numberofcredit, b.name,
       decode (oper, 1, 'Daxil etmÿ', 2, 'Redaktÿ', 3, 'Lÿüv', '-') operat
  from sba_logs l, creditsmgr.cm_portfolio p, creditsmgr.cm_boorowerinfo b
 where tablename = 6 and p.id = l.tid and b.creditid = p.id
/
CREATE OR REPLACE VIEW smart.sbav_logs_provarch (
   id,
   cuser,
   tablename,
   oper,
   tid,
   tim,
   operat )
AS
SELECT l.id, cuser, tablename, oper, tid, tim, decode (oper,1,'Daxil etmÿ',2,'Redaktÿ',3,'Lÿüv','-') operat
  FROM sba_logs l
  where l.tablename=3
/
