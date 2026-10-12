CREATE OR REPLACE VIEW cm_active (
   id,
   currency,
   boorowerid,
   creditlineamount,
   annualyinterestrate,
   initialamount,
   annualyoverduerate,
   annualypenaltyrate,
   dateofconclusion,
   duedatefirstcontract,
   duedatelastcontract,
   numberofcredit,
   purposeofcredit,
   usrgroup,
   branchid,
   usid,
   customertype,
   credittype,
   personaltype,
   stopcalcdate,
   rest,
   interestrest,
   duerest,
   dueinterestrest,
   reserveid,
   duereserveid,
   obligation,
   pledgeprice,
   pledgeid,
   contractaccno,
   boorowerrest,
   val_name,
   name )
AS
SELECT
   B.ID 
 , B.CURRENCY 
 , B.BOOROWERID 
 , B.CREDITLINEAMOUNT 
 , B.ANNUALYINTERESTRATE 
 , B.INITIALAMOUNT 
 , B.ANNUALYOVERDUERATE 
 , B.ANNUALYPENALTYRATE 
 , B.DATEOFCONCLUSION 
 , B.DUEDATEFIRSTCONTRACT
 , B.DUEDATELASTCONTRACT
 , B.NUMBEROFCREDIT 
 , B.PURPOSEOFCREDIT 
 , B.USRGROUP 
 , B.BRANCHID
 , B.USID 
 , B.CUSTOMERTYPE
 , B.CREDITTYPE 
 , B.PERSONALTYPE   
 , C.STOPCALCDATE 
 , C.REST 
 , C.INTERESTREST 
 , C.DUEREST
 , C.DUEINTERESTREST 
 , C.RESERVEID 
 , C.DUERESERVEID
 , C.OBLIGATION 
 , C.PLEDGEPRICE  
 , G.PLEDGEID 
 , CM_COMMON.AccountNumber_Get(A.CONTRACTACCID) as CONTRACTACCNO
 , CM_COMMON.AccountRest_Get(A.BOOROWERACCID) as BoorowerRest
 , J.VAL_NAME 
 , L.NAME
FROM
   CM_ACCOUNTS A
 , CM_CURR_STATE C
 , CM_ACTIVE_CREDITS B
 , CM_GUARANTEE G
 , SB_AVALUTE J
 , CM_BOOROWERINFO L
WHERE
     (B.ID = A.CREDITID)
 AND (C.CREDITID = B.ID)
 AND (G.CREDITID = B.ID)
 AND (J.VALUTE = B.CURRENCY)
 AND (L.CREDITID = B.ID)
/
CREATE OR REPLACE VIEW cm_active_credits (
   id,
   currency,
   boorowerid,
   initialamount,
   creditlineamount,
   annualyinterestrate,
   annualyoverduerate,
   annualypenaltyrate,
   dateofconclusion,
   dateofgrant,
   duedatefirstcontract,
   duedatelastcontract,
   closedate,
   numberofcredit,
   purposeofcredit,
   customertype,
   credittype,
   personaltype,
   autopayment,
   autoexpire,
   usrgroup,
   branchid,
   usid,
   partitionkey )
AS
select
  "ID","CURRENCY","BOOROWERID","INITIALAMOUNT","CREDITLINEAMOUNT","ANNUALYINTERESTRATE","ANNUALYOVERDUERATE","ANNUALYPENALTYRATE","DATEOFCONCLUSION","DATEOFGRANT","DUEDATEFIRSTCONTRACT","DUEDATELASTCONTRACT","CLOSEDATE","NUMBEROFCREDIT","PURPOSEOFCREDIT","CUSTOMERTYPE","CREDITTYPE","PERSONALTYPE","AUTOPAYMENT","AUTOEXPIRE","USRGROUP","BRANCHID","USID","PARTITIONKEY"
from 
  cm_portfolio partition ( ActiveCredits )
/
CREATE OR REPLACE VIEW cm_adm_active_credits (
   id,
   currency,
   boorowerid,
   initialamount,
   creditlineamount,
   annualyinterestrate,
   annualyoverduerate,
   annualypenaltyrate,
   dateofconclusion,
   dateofgrant,
   duedatefirstcontract,
   duedatelastcontract,
   closedate,
   numberofcredit,
   purposeofcredit,
   customertype,
   credittype,
   personaltype,
   autopayment,
   autoexpire,
   usrgroup,
   branchid,
   usid,
   partitionkey )
AS
SELECT "ID", "CURRENCY", "BOOROWERID", "INITIALAMOUNT", "CREDITLINEAMOUNT",
       "ANNUALYINTERESTRATE", "ANNUALYOVERDUERATE", "ANNUALYPENALTYRATE",
       "DATEOFCONCLUSION", "DATEOFGRANT", "DUEDATEFIRSTCONTRACT",
       "DUEDATELASTCONTRACT", "CLOSEDATE", "NUMBEROFCREDIT",
       "PURPOSEOFCREDIT", "CUSTOMERTYPE", "CREDITTYPE", "PERSONALTYPE",
       "AUTOPAYMENT", "AUTOEXPIRE", "USRGROUP", "BRANCHID", "USID",
       "PARTITIONKEY"
  FROM cm_portfolio PARTITION (activecredits)
 WHERE (   (usid IN (SELECT slaveuser
                         FROM cm_adm_vuserman
                        WHERE grouptypeid = 0 AND masteruser = UID))
        OR (cm_administration.is_adminnum (USER) = 1)
       )
/
CREATE OR REPLACE VIEW cm_adm_branches (
   id,
   name )
AS
select ID,NAME from sb_filial
--where id = cm_common_utils.cm_branchid_get()
/
CREATE OR REPLACE VIEW cm_adm_cm_active (
   id,
   currency,
   boorowerid,
   creditlineamount,
   annualyinterestrate,
   initialamount,
   annualyoverduerate,
   annualypenaltyrate,
   dateofconclusion,
   duedatefirstcontract,
   duedatelastcontract,
   numberofcredit,
   purposeofcredit,
   usrgroup,
   branchid,
   usid,
   customertype,
   credittype,
   personaltype,
   stopcalcdate,
   rest,
   interestrest,
   duerest,
   dueinterestrest,
   reserveid,
   duereserveid,
   obligation,
   pledgeprice,
   pledgeid,
   contractaccno,
   boorowerrest,
   val_name,
   name )
AS
SELECT
   B.ID 
 , B.CURRENCY 
 , B.BOOROWERID 
 , B.CREDITLINEAMOUNT 
 , B.ANNUALYINTERESTRATE 
 , B.INITIALAMOUNT 
 , B.ANNUALYOVERDUERATE 
 , B.ANNUALYPENALTYRATE 
 , B.DATEOFCONCLUSION 
 , B.DUEDATEFIRSTCONTRACT
 , B.DUEDATELASTCONTRACT
 , B.NUMBEROFCREDIT 
 , B.PURPOSEOFCREDIT 
 , B.USRGROUP 
 , B.BRANCHID
 , B.USID 
 , B.CUSTOMERTYPE
 , B.CREDITTYPE 
 , B.PERSONALTYPE   
 , C.STOPCALCDATE 
 , C.REST 
 , C.INTERESTREST 
 , C.DUEREST
 , C.DUEINTERESTREST 
 , C.RESERVEID 
 , C.DUERESERVEID
 , C.OBLIGATION 
 , C.PLEDGEPRICE  
 , G.PLEDGEID 
 , CM_COMMON.AccountNumber_Get(A.CONTRACTACCID) as CONTRACTACCNO
 , CM_COMMON.AccountRest_Get(A.BOOROWERACCID) as BoorowerRest
 , J.VAL_NAME 
 , L.NAME
FROM
   CM_ACCOUNTS A
 , CM_CURR_STATE C
 , CM_ACTIVE_CREDITS B
 , CM_GUARANTEE G
 , SB_AVALUTE J
 , CM_BOOROWERINFO L
WHERE
     (B.ID = A.CREDITID)
 AND (C.CREDITID = B.ID)
 AND (G.CREDITID = B.ID)
 AND (J.VALUTE = B.CURRENCY)
 AND (L.CREDITID = B.ID)
   AND (   (b.usid IN (SELECT slaveuser
                         FROM cm_adm_vuserman
                        WHERE grouptypeid = 0 AND masteruser = UID))
        OR (cm_administration.is_adminnum (USER) = 1)
       )
/
CREATE OR REPLACE VIEW cm_adm_intcache (
   id,
   currency,
   boorowerid,
   numberofcredit,
   usrgroup,
   branchid,
   usid,
   customertype,
   personaltype,
   credittype,
   stopcalcdate,
   rest,
   interestrest,
   duerest,
   dueinterestrest,
   contractaccno,
   val_name,
   name,
   interest,
   dueinterest,
   trprocessed )
AS
SELECT b.ID, b.currency, b.boorowerid, b.numberofcredit, b.usrgroup,
       b.branchid, b.usid, b.customertype, b.personaltype, b.credittype,
       c.stopcalcdate, c.rest, c.interestrest, c.duerest, c.dueinterestrest,
       cm_common.accountnumber_get (a.contractaccid) AS contractaccno,
       j.val_name, l.NAME, k.interest, k.dueinterest, k.trprocessed
  FROM cm_accounts a,
       cm_curr_state c,
       cm_active_credits b,
       sb_avalute j,
       cm_boorowerinfo l,
       cm_int_currstate k
 WHERE (b.ID = a.creditid)
   AND (c.creditid = b.ID)
   AND (j.valute = b.currency)
   AND (l.creditid = b.ID)
   AND (b.ID = k.creditid)
   AND (   (b.usid IN (SELECT slaveuser
                         FROM cm_adm_vuserman
                        WHERE grouptypeid = 0 AND masteruser = UID))
        OR (cm_administration.is_adminnum (USER) = 1)
       )
/
CREATE OR REPLACE VIEW cm_adm_portfolio (
   id,
   currency,
   boorowerid,
   initialamount,
   creditlineamount,
   annualyinterestrate,
   annualyoverduerate,
   annualypenaltyrate,
   dateofconclusion,
   dateofgrant,
   duedatefirstcontract,
   duedatelastcontract,
   closedate,
   numberofcredit,
   purposeofcredit,
   customertype,
   credittype,
   personaltype,
   autopayment,
   autoexpire,
   usrgroup,
   branchid,
   usid,
   partitionkey )
AS
SELECT "ID","CURRENCY","BOOROWERID","INITIALAMOUNT","CREDITLINEAMOUNT","ANNUALYINTERESTRATE","ANNUALYOVERDUERATE","ANNUALYPENALTYRATE","DATEOFCONCLUSION","DATEOFGRANT","DUEDATEFIRSTCONTRACT","DUEDATELASTCONTRACT","CLOSEDATE","NUMBEROFCREDIT","PURPOSEOFCREDIT","CUSTOMERTYPE","CREDITTYPE","PERSONALTYPE","AUTOPAYMENT","AUTOEXPIRE","USRGROUP","BRANCHID","USID","PARTITIONKEY"
  FROM cm_portfolio
 WHERE (   (usid IN (SELECT slaveuser
                       FROM cm_adm_vuserman
                      WHERE grouptypeid = 0 AND masteruser = UID))
        OR (cm_administration.is_adminnum (USER) = 1)
       )
/
CREATE OR REPLACE VIEW cm_adm_vuserman (
   masteruser,
   slaveuser,
   groupid,
   grouptypeid )
AS
SELECT a.userid masteruser, b.userid slaveuser, a.groupid,
       c.typeid grouptypeid
  FROM cm_adm_groupmanager a, cm_adm_groupmanager b, cm_adm_groups c
 WHERE a.groupid = b.groupid AND a.usertype = 1 AND a.groupid = c.ID
UNION ALL
SELECT a.userid masteruser, a.userid slaveuser, a.groupid,
       c.typeid grouptypeid
  FROM cm_adm_groupmanager a, cm_adm_groups c
 WHERE a.usertype = 2 AND a.groupid = c.ID
/
CREATE OR REPLACE VIEW cm_all_users (
   id,
   name,
   ctime,
   tablespace_name )
AS
SELECT u.user# AS ID, u.NAME, u.ctime, t.NAME AS tablespace_name
     FROM SYS.user$ u, SYS.v_$tablespace t
    WHERE u.datats# = t.ts#
      AND u.datats# <> 0
      AND u.datats# <> (SELECT datats#
                          FROM SYS.user$
                         WHERE NAME = 'SYSTEM')
/
CREATE OR REPLACE VIEW cm_auto_expires (
   id,
   dateofconclusion,
   duedatefirstcontract,
   duedatelastcontract,
   numberofcredit,
   contractaccno,
   val_name,
   name,
   duemainamt,
   dueintamt,
   daysmain,
   daysint )
AS
SELECT
   B.ID
 , B.DATEOFCONCLUSION 
 , B.DUEDATEFIRSTCONTRACT
 , B.DUEDATELASTCONTRACT
 , B.NUMBEROFCREDIT 
 , CM_COMMON.AccountNumber_Get(A.CONTRACTACCID) as CONTRACTACCNO
 , J.VAL_NAME 
 , L.NAME
 , C.DUEMAINAMT
 , C.DUEINTAMT
 , C.DAYSMAIN
 , C.DAYSINT
 
FROM
   CM_ACTIVE_CREDITS B
 , SB_AVALUTE J
 , CM_BOOROWERINFO L
 , CM_AE_CACHE C
 , CM_ACCOUNTS A
WHERE
     (A.CreditID = B.ID) 
 AND (C.CREDITID = B.ID)
 AND (J.VALUTE = B.CURRENCY)
 AND (L.CREDITID = B.ID)
/
CREATE OR REPLACE VIEW cm_curr_state (
   creditid,
   hdate,
   lastcalcdate,
   stopcalcdate,
   rest,
   interestrest,
   duerest,
   dueinterestrest,
   reserveid,
   givenamount,
   obligation,
   pledgeprice,
   partitionkey,
   duereserveid )
AS
select "CREDITID","HDATE","LASTCALCDATE","STOPCALCDATE","REST","INTERESTREST","DUEREST","DUEINTERESTREST","RESERVEID","GIVENAMOUNT","OBLIGATION","PLEDGEPRICE","PARTITIONKEY","DUERESERVEID"
  from  cm_history partition ( curr_state )
/
CREATE OR REPLACE VIEW cm_delayed_transactions (
   debitaccno,
   debitcurrency,
   creditaccno,
   creditcurrency,
   trdate,
   canprocess,
   inbalancechar,
   flags,
   debitamount,
   creditamount,
   natamount,
   trdescription )
AS
SELECT
   A.ACC_NO as DebitAccNo, 
   D.VAL_NAME as DebitCurrency, 
   C.ACC_NO as CreditAccNo, 
   E.VAL_NAME  as CreditCurrency,
   B.TRDATE ,
   B.CANPROCESS , 
   B.INBALANCECHAR , 
   B.FLAGS , 
   B.DEBITAMOUNT , 
   B.CREDITAMOUNT , 
   B.NATAMOUNT ,
   B.TrDescription
FROM
   SB_ACCOUNT A
 , SB_AVALUTE D
 , CM_TRANSACTIONS B
 , SB_ACCOUNT C
 , SB_AVALUTE E
WHERE
     (B.DEBITACCID = A.ID)
 AND (D.VALUTE = A.VAL_ACC)
 AND (B.CREDITACCID = C.ID)
 AND (C.VAL_ACC = E.VALUTE)
 
UNION ALL
 
SELECT
   A.ACC_NO as DebitAccNo, 
   D.VAL_NAME as DebitCurrency, 
   C.ACC_NO as CreditAccNo, 
   E.VAL_NAME  as CreditCurrency,
   B.TRDATE ,
   B.CANPROCESS , 
   B.INBALANCECHAR , 
   B.FLAGS , 
   B.DEBITAMOUNT , 
   B.CREDITAMOUNT , 
   B.NATAMOUNT ,
   B.TrDescription
FROM
   SBOUT_ACCOUNT A
 , SB_AVALUTE D
 , CM_TRANSACTIONS B
 , SBOUT_ACCOUNT C
 , SB_AVALUTE E
WHERE
     (B.DEBITACCID = A.ID)
 AND (D.VALUTE = A.VAL_ACC)
 AND (B.CREDITACCID = C.ID)
 AND (C.VAL_ACC = E.VALUTE)
/
CREATE OR REPLACE VIEW cm_fields_list (
   seqno,
   fieldname,
   frozen,
   userid,
   visible,
   id,
   fielddesc )
AS
select "SEQNO","FIELDNAME","FROZEN","USERID","VISIBLE","ID","FIELDDESC"
  from cm_visible_fields
 where UserID = uid
/
CREATE OR REPLACE VIEW cm_inactive_credits (
   id,
   currency,
   boorowerid,
   initialamount,
   creditlineamount,
   annualyinterestrate,
   annualyoverduerate,
   annualypenaltyrate,
   dateofconclusion,
   dateofgrant,
   duedatefirstcontract,
   duedatelastcontract,
   closedate,
   numberofcredit,
   purposeofcredit,
   customertype,
   credittype,
   personaltype,
   autopayment,
   autoexpire,
   usrgroup,
   branchid,
   usid,
   partitionkey )
AS
select
"ID","CURRENCY","BOOROWERID","INITIALAMOUNT","CREDITLINEAMOUNT","ANNUALYINTERESTRATE","ANNUALYOVERDUERATE","ANNUALYPENALTYRATE","DATEOFCONCLUSION","DATEOFGRANT","DUEDATEFIRSTCONTRACT","DUEDATELASTCONTRACT","CLOSEDATE","NUMBEROFCREDIT","PURPOSEOFCREDIT","CUSTOMERTYPE","CREDITTYPE","PERSONALTYPE","AUTOPAYMENT","AUTOEXPIRE","USRGROUP","BRANCHID","USID","PARTITIONKEY"
from 
  cm_portfolio partition ( InActiveCredits )
/
CREATE OR REPLACE VIEW cm_int_currstate (
   partitionkey,
   creditid,
   hdate,
   interest,
   dueinterest,
   inttrid,
   dueinttrid,
   trprocessed,
   intprecision,
   dueintprecision )
AS
select "PARTITIONKEY","CREDITID","HDATE","INTEREST","DUEINTEREST","INTTRID","DUEINTTRID","TRPROCESSED","INTPRECISION","DUEINTPRECISION"
from cm_interests partition (CURR_STATE)
/
CREATE OR REPLACE VIEW cm_int_prevstate (
   partitionkey,
   creditid,
   hdate,
   interest,
   dueinterest,
   inttrid,
   dueinttrid,
   trprocessed,
   intprecision,
   dueintprecision )
AS
select "PARTITIONKEY","CREDITID","HDATE","INTEREST","DUEINTEREST","INTTRID","DUEINTTRID","TRPROCESSED","INTPRECISION","DUEINTPRECISION"
from cm_interests partition (PREV_STATE)
/
CREATE OR REPLACE VIEW cm_intcache (
   id,
   currency,
   boorowerid,
   numberofcredit,
   usrgroup,
   branchid,
   usid,
   customertype,
   personaltype,
   credittype,
   stopcalcdate,
   rest,
   interestrest,
   duerest,
   dueinterestrest,
   contractaccno,
   val_name,
   name,
   interest,
   dueinterest,
   trprocessed )
AS
SELECT
   B.ID 
 , B.CURRENCY 
 , B.BOOROWERID 
 , B.NUMBEROFCREDIT 
 , B.USRGROUP 
 , B.BRANCHID
 , B.USID 
 , B.CUSTOMERTYPE
 , B.PERSONALTYPE
 , B.CREDITTYPE
 , C.STOPCALCDATE 
 , C.REST 
 , C.INTERESTREST 
 , C.DUEREST
 , C.DUEINTERESTREST 
 , CM_COMMON.AccountNumber_Get(A.CONTRACTACCID) as CONTRACTACCNO
 , J.VAL_NAME 
 , L.NAME
 , K.INTEREST
 , K.DUEINTEREST
 , K.TRPROCESSED
FROM
   CM_ACCOUNTS A
 , CM_CURR_STATE C
 , CM_ACTIVE_CREDITS B
 , SB_AVALUTE J
 , CM_BOOROWERINFO L
 , CM_INT_CURRSTATE K
WHERE
     (B.ID = A.CREDITID)
 AND (C.CREDITID = B.ID)
 AND (J.VALUTE = B.CURRENCY)
 AND (L.CREDITID = B.ID)
 AND (B.ID = K.CREDITID)
/
CREATE OR REPLACE VIEW cm_prev_state (
   creditid,
   hdate,
   lastcalcdate,
   stopcalcdate,
   rest,
   interestrest,
   duerest,
   dueinterestrest,
   reserveid,
   givenamount,
   obligation,
   pledgeprice,
   partitionkey,
   duereserveid )
AS
select  "CREDITID","HDATE","LASTCALCDATE","STOPCALCDATE","REST","INTERESTREST","DUEREST","DUEINTERESTREST","RESERVEID","GIVENAMOUNT","OBLIGATION","PLEDGEPRICE","PARTITIONKEY","DUERESERVEID"
  from  cm_history partition ( prev_state )
/
CREATE OR REPLACE VIEW cm_reserves (
   id,
   code,
   percent,
   description )
AS
select "ID","CODE","PERCENT","DESCRIPTION" from CM_RESERVE_TYPES
where ID<>0
/
CREATE OR REPLACE VIEW cm_sb_all_accounts (
   id,
   kli_id,
   op_id,
   acc_no,
   val_acc,
   name,
   open_dat,
   close_dat,
   bal_cn1,
   bal_cn4,
   filial,
   limit,
   sid# )
AS
select "ID","KLI_ID","OP_ID","ACC_NO","VAL_ACC","NAME","OPEN_DAT","CLOSE_DAT","BAL_CN1","BAL_CN4","FILIAL","LIMIT","SID#" from SB_Account
union all
select "ID","KLI_ID","OP_ID","ACC_NO","VAL_ACC","NAME","OPEN_DAT","CLOSE_DAT","BAL_CN1","BAL_CN4","FILIAL","LIMIT","SID#" from SBOUT_Account
/
CREATE OR REPLACE VIEW cm_users (
   id,
   name,
   ctime,
   tablespace_name )
AS
select "ID","NAME","CTIME","TABLESPACE_NAME" from cm_all_users where tablespace_name='TS_CREDITS'
/
CREATE OR REPLACE VIEW cm_wr_creditinfo (
   creditid,
   boorowerid,
   boorowername,
   dateofconclusion,
   creditlineamount,
   annualyinterestrate,
   annualyoverduerate,
   duedatefirstcontract,
   numberofcredit,
   personaltype )
AS
SELECT p.ID creditid, p.boorowerid, c.NAME boorowername, p.dateofconclusion,
       p.creditlineamount, p.annualyinterestrate, p.annualyoverduerate,
       p.duedatefirstcontract, p.numberofcredit, d.descripion personaltype
  FROM CM_SB_CUSTOMERS c,
       cm_portfolio p,
       cm_persons d
 WHERE (p.boorowerid = c.ID) AND (p.personaltype = d.ID)
/
CREATE OR REPLACE VIEW sb_usersinfo (
   obj,
   createdate,
   description,
   fullname,
   filialid )
AS
SELECT obj, createdate, description, fullname, filialid
     FROM sb_objinf
    WHERE TYPE = 'U'
/

