-- Start of DDL Script for View CREDITSMGR.ALL_USERS
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.all_users (
   user_id,
   username,
   ctime,
   tablespace_name )
AS
select 
u.USER# as user_id
,u.name as username
,u.CTIME
,t.name as TABLESPACE_NAME
from sys.user$ u, sys.v_$tablespace t
where 
u.datats#=t.ts# and 
u.datats#<>0
and u.datats#<>
(select datats# from sys.user$ where NAME='SYSTEM')
/


-- End of DDL Script for View CREDITSMGR.ALL_USERS

-- Start of DDL Script for View CREDITSMGR.CM_ACTIVE
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_active (
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
   loanaccno,
   interestaccno,
   dueloanaccno,
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
 , CM_COMMON.AccountNumber_Get(A.LOANACCID) as LOANACCNO
 , CM_COMMON.AccountNumber_Get(A.INTERESTACCID) as INTERESTACCNO
 , CM_COMMON.AccountNumber_Get(A.DUELOANACCID) as DUELOANACCNO
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


-- End of DDL Script for View CREDITSMGR.CM_ACTIVE

-- Start of DDL Script for View CREDITSMGR.CM_ACTIVE_CREDITS
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_active_credits (
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


-- End of DDL Script for View CREDITSMGR.CM_ACTIVE_CREDITS

-- Start of DDL Script for View CREDITSMGR.CM_ADM_ACTIVE_CREDITS
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_adm_active_credits (
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


-- End of DDL Script for View CREDITSMGR.CM_ADM_ACTIVE_CREDITS

-- Start of DDL Script for View CREDITSMGR.CM_ADM_BRANCHES
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_adm_branches (
   id,
   name )
AS
select ID,NAME from sb_filial
--where id = cm_common_utils.cm_branchid_get()
/


-- End of DDL Script for View CREDITSMGR.CM_ADM_BRANCHES

-- Start of DDL Script for View CREDITSMGR.CM_ADM_CM_ACTIVE
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_adm_cm_active (
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
   loanaccno,
   interestaccno,
   dueloanaccno,
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
 , CM_COMMON.AccountNumber_Get(A.LOANACCID) as LOANACCNO
 , CM_COMMON.AccountNumber_Get(A.INTERESTACCID) as INTERESTACCNO
 , CM_COMMON.AccountNumber_Get(A.DUELOANACCID) as DUELOANACCNO
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


-- End of DDL Script for View CREDITSMGR.CM_ADM_CM_ACTIVE

-- Start of DDL Script for View CREDITSMGR.CM_ADM_INTCACHE
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_adm_intcache (
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


-- End of DDL Script for View CREDITSMGR.CM_ADM_INTCACHE

-- Start of DDL Script for View CREDITSMGR.CM_ADM_PORTFOLIO
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_adm_portfolio (
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


-- End of DDL Script for View CREDITSMGR.CM_ADM_PORTFOLIO

-- Start of DDL Script for View CREDITSMGR.CM_ADM_VUSERMAN
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_adm_vuserman (
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


-- End of DDL Script for View CREDITSMGR.CM_ADM_VUSERMAN

-- Start of DDL Script for View CREDITSMGR.CM_AK_DISTRICTV
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_ak_districtv (
   id,
   name )
AS
select id, name
  from agro_region
union
select -1 as id, ' ўамысы' as NAME
  from dual
union
select -2 as id, ' ўеч бири' as NAME
  from dual
/


-- End of DDL Script for View CREDITSMGR.CM_AK_DISTRICTV

-- Start of DDL Script for View CREDITSMGR.CM_AK_PURPOSEV
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_ak_purposev (
   id,
   name )
AS
select id, name
  from agro_kredit_purpose
union
select -1, ' ўамысы' as name
  from dual
union
select -2, ' ўеч бири' as name
  from dual
/


-- End of DDL Script for View CREDITSMGR.CM_AK_PURPOSEV

-- Start of DDL Script for View CREDITSMGR.CM_AK_VILLAGEV
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_ak_villagev (
   id,
   name,
   depend_id )
AS
select id, name, depend_id
  from agro_village
union
select -1 as ID, ' ўамысы' as name, -1 as depend_id
  from dual
union
select -2 as ID, ' ўеч бири' as name, -1 as depend_id
  from dual
/


-- End of DDL Script for View CREDITSMGR.CM_AK_VILLAGEV

-- Start of DDL Script for View CREDITSMGR.CM_AKF_DISTRICTBOOROWERS
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_akf_districtboorowers (
   districtid,
   typeid,
   customerid )
AS
SELECT
    distinct D.ID as DISTRICTID, B.TYPE as TYPEID, P.BOOROWERID as CUSTOMERID
FROM
   CREDITSMGR.CM_BUSINESS_PLAN B
 , CREDITSMGR.CM_PORTFOLIO P
 , CREDITSMGR.AGRO_VILLAGE V
 , CREDITSMGR.AGRO_REGION D
WHERE
     (V.DEPEND_ID = D.ID)
 AND (B.VILLAGEID = V.ID)
 AND (B.CREDITID = P.ID)
/


-- End of DDL Script for View CREDITSMGR.CM_AKF_DISTRICTBOOROWERS

-- Start of DDL Script for View CREDITSMGR.CM_AKF_DISTRICTCREDITTYPE
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_akf_districtcredittype (
   districtid,
   credittypeid )
AS
SELECT
   D.ID as DistrictID 
-- , D.NAME as District 
 , T.ID as CreditTypeID 
-- , T.TYPEDESC as CreditType
FROM
   CREDITSMGR.AGRO_VILLAGE V
 , CREDITSMGR.CM_BUSINESS_PLAN B
 , CREDITSMGR.AGRO_REGION D
 , CREDITSMGR.CM_BP_TYPES T
WHERE
     (V.DEPEND_ID = D.ID)
 AND (B.VILLAGEID = V.ID)
 AND (B.TYPE = T.ID)
GROUP BY
   D.ID
 , T.ID
ORDER BY
   D.ID
/


-- End of DDL Script for View CREDITSMGR.CM_AKF_DISTRICTCREDITTYPE

-- Start of DDL Script for View CREDITSMGR.CM_AKF_MEASURES_IDDIA
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_akf_measures_iddia (
   creditid,
   grantdate,
   givedate,
   activeind1,
   activeind2 )
AS
select creditid, grantdate, givedate, totalamount as activeind1, maindebt as activeind2 from cm_legal_measures
where measurecode=6
/


-- End of DDL Script for View CREDITSMGR.CM_AKF_MEASURES_IDDIA

-- Start of DDL Script for View CREDITSMGR.CM_AKF_MEASURES_PRETENZIA
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_akf_measures_pretenzia (
   creditid,
   grantdate,
   givedate,
   activeind1,
   activeind2 )
AS
select creditid, grantdate, givedate, totalamount as activeind1, maindebt as activeind2 from cm_legal_measures
where measurecode=4
/


-- End of DDL Script for View CREDITSMGR.CM_AKF_MEASURES_PRETENZIA

-- Start of DDL Script for View CREDITSMGR.CM_AKF_MEASURES_QATNAME
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_akf_measures_qatname (
   creditid,
   grantdate,
   givedate,
   activeind1,
   activeind2 )
AS
select creditid, grantdate, givedate, totalamount as activeind1, maindebt as activeind2 from cm_legal_measures
where measurecode=7
/


-- End of DDL Script for View CREDITSMGR.CM_AKF_MEASURES_QATNAME

-- Start of DDL Script for View CREDITSMGR.CM_AKF_SB_PROJECTS
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_akf_sb_projects (
   id,
   name )
AS
SELECT ID, description NAME
  FROM cm_usergroups
/


-- End of DDL Script for View CREDITSMGR.CM_AKF_SB_PROJECTS

-- Start of DDL Script for View CREDITSMGR.CM_ALL_USERS
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_all_users (
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


-- End of DDL Script for View CREDITSMGR.CM_ALL_USERS

-- Start of DDL Script for View CREDITSMGR.CM_AUTO_EXPIRES
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_auto_expires (
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


-- End of DDL Script for View CREDITSMGR.CM_AUTO_EXPIRES

-- Start of DDL Script for View CREDITSMGR.CM_CURR_STATE
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_curr_state (
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
   duereserveid,
   oldreserveid,
   oldduereserveid )
AS
select "CREDITID","HDATE","LASTCALCDATE","STOPCALCDATE","REST","INTERESTREST","DUEREST","DUEINTERESTREST","RESERVEID","GIVENAMOUNT","OBLIGATION","PLEDGEPRICE","PARTITIONKEY","DUERESERVEID","OLDRESERVEID","OLDDUERESERVEID" from  cm_history partition ( curr_state )
/


-- End of DDL Script for View CREDITSMGR.CM_CURR_STATE

-- Start of DDL Script for View CREDITSMGR.CM_DELAYED_TRANSACTIONS
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_delayed_transactions (
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


-- End of DDL Script for View CREDITSMGR.CM_DELAYED_TRANSACTIONS

-- Start of DDL Script for View CREDITSMGR.CM_FIELDS_LIST
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_fields_list (
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


-- End of DDL Script for View CREDITSMGR.CM_FIELDS_LIST

-- Start of DDL Script for View CREDITSMGR.CM_INACTIVE_CREDITS
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_inactive_credits (
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


-- End of DDL Script for View CREDITSMGR.CM_INACTIVE_CREDITS

-- Start of DDL Script for View CREDITSMGR.CM_INT_CURRSTATE
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_int_currstate (
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


-- End of DDL Script for View CREDITSMGR.CM_INT_CURRSTATE

-- Start of DDL Script for View CREDITSMGR.CM_INT_PREVSTATE
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_int_prevstate (
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


-- End of DDL Script for View CREDITSMGR.CM_INT_PREVSTATE

-- Start of DDL Script for View CREDITSMGR.CM_INTCACHE
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_intcache (
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


-- End of DDL Script for View CREDITSMGR.CM_INTCACHE

-- Start of DDL Script for View CREDITSMGR.CM_PREV_STATE
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_prev_state (
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
   duereserveid,
   oldreserveid,
   oldduereserveid )
AS
select "CREDITID","HDATE","LASTCALCDATE","STOPCALCDATE","REST","INTERESTREST","DUEREST","DUEINTERESTREST","RESERVEID","GIVENAMOUNT","OBLIGATION","PLEDGEPRICE","PARTITIONKEY","DUERESERVEID","OLDRESERVEID","OLDDUERESERVEID" from  cm_history partition ( prev_state )
/


-- End of DDL Script for View CREDITSMGR.CM_PREV_STATE

-- Start of DDL Script for View CREDITSMGR.CM_RESERVES
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_reserves (
   id,
   code,
   percent,
   description )
AS
select "ID","CODE","PERCENT","DESCRIPTION" from CM_RESERVE_TYPES
where ID<>0
/


-- End of DDL Script for View CREDITSMGR.CM_RESERVES

-- Start of DDL Script for View CREDITSMGR.CM_SB_ALL_ACCOUNTS
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_sb_all_accounts (
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


-- End of DDL Script for View CREDITSMGR.CM_SB_ALL_ACCOUNTS

-- Start of DDL Script for View CREDITSMGR.CM_USERS
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_users (
   id,
   name,
   ctime,
   tablespace_name )
AS
select "ID","NAME","CTIME","TABLESPACE_NAME" from cm_all_users where tablespace_name='TS_CREDITS'
/


-- End of DDL Script for View CREDITSMGR.CM_USERS

-- Start of DDL Script for View CREDITSMGR.CM_WR_CREDITINFO
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.cm_wr_creditinfo (
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


-- End of DDL Script for View CREDITSMGR.CM_WR_CREDITINFO

-- Start of DDL Script for View CREDITSMGR.SB_USERSINFO
-- Generated 30-May-2006 16:41:09 from CREDITSMGR@SB

CREATE OR REPLACE VIEW creditsmgr.sb_usersinfo (
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


-- End of DDL Script for View CREDITSMGR.SB_USERSINFO


