-- Start of DDL Script for View CHINAR.CM_ACTIVE
-- Generated 24-Aug-2008 19:19:22 from CHINAR@T

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
   penaltyrest,
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
 , C.PENALTYREST
 , C.RESERVEID
 , C.DUERESERVEID
 , C.OBLIGATION
 , C.PLEDGEPRICE
 , G.PLEDGEID
 , a.acc_no as CONTRACTACCNO
 , br.ostat as BoorowerRest
 , J.VAL_NAME
 , cm_common.get_accname(CONTRACTACCID)  as name

FROM
   CM_loanACCOUNTS A
 , cm_boorowerrest br
 , cm_history C
 , CM_ACTIVE_CREDITS B
 , CM_GUARANTEE G
 , SB_AVALUTE J
 --, CM_BOOROWERINFO L
WHERE
     (B.ID = A.CREDITID)
 AND (b.id = br.creditid)
 AND (C.CREDITID = B.ID)
 AND (c.hdate = (select tek_dat from sb_sysdat))
 AND (G.CREDITID = B.ID)
 AND (J.VALUTE = B.CURRENCY)
--8 AND (L.CREDITID = B.ID)
/*SELECT
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
 , C.PENALTYREST
 , C.RESERVEID
 , C.DUERESERVEID
 , C.OBLIGATION
 , C.PLEDGEPRICE
 , G.PLEDGEID
 , a.acc_no as CONTRACTACCNO
 , br.ostat as BoorowerRest
 , J.VAL_NAME
 , L.NAME
FROM
   CM_loanACCOUNTS A
 , cm_boorowerrest br
 , cm_history C
 , CM_ACTIVE_CREDITS B
 , CM_GUARANTEE G
 , SB_AVALUTE J
 , CM_BOOROWERINFO L
WHERE
     (B.ID = A.CREDITID)
 AND (b.id = br.creditid)
 AND (C.CREDITID = B.ID)
 AND (c.hdate = (select tek_dat from sb_sysdat))
 AND (G.CREDITID = B.ID)
 AND (J.VALUTE = B.CURRENCY)
 AND (L.CREDITID = B.ID)*/
/


-- End of DDL Script for View CHINAR.CM_ACTIVE

-- Start of DDL Script for View CHINAR.CM_ACTIVE_
-- Generated 24-Aug-2008 19:19:23 from CHINAR@T

CREATE OR REPLACE VIEW cm_active_ (
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
   penaltyrest,
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
 , C.PENALTYREST
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


-- End of DDL Script for View CHINAR.CM_ACTIVE_

-- Start of DDL Script for View CHINAR.CM_ACTIVE_CREDITS
-- Generated 24-Aug-2008 19:19:23 from CHINAR@T

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
   partitionkey,
   annualbankrate,
   newfinanceamount,
   numberofbankcredit,
   intcalcmethod,
   pledgsorts )
AS
select "ID","CURRENCY","BOOROWERID","INITIALAMOUNT","CREDITLINEAMOUNT","ANNUALYINTERESTRATE","ANNUALYOVERDUERATE","ANNUALYPENALTYRATE","DATEOFCONCLUSION","DATEOFGRANT","DUEDATEFIRSTCONTRACT","DUEDATELASTCONTRACT","CLOSEDATE","NUMBEROFCREDIT","PURPOSEOFCREDIT","CUSTOMERTYPE","CREDITTYPE","PERSONALTYPE","AUTOPAYMENT","AUTOEXPIRE","USRGROUP","BRANCHID","USID","PARTITIONKEY","ANNUALBANKRATE","NEWFINANCEAMOUNT","NUMBEROFBANKCREDIT","INTCALCMETHOD","PLEDGSORTS" from cm_portfolio partition(ACTIVECREDITS)
/


-- End of DDL Script for View CHINAR.CM_ACTIVE_CREDITS

-- Start of DDL Script for View CHINAR.CM_ADM_ACTIVE_CREDITS
-- Generated 24-Aug-2008 19:19:23 from CHINAR@T

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
   partitionkey,
   annualbankrate,
   newfinanceamount,
   numberofbankcredit,
   intcalcmethod,
   pledgsorts )
AS
SELECT "ID","CURRENCY","BOOROWERID","INITIALAMOUNT","CREDITLINEAMOUNT","ANNUALYINTERESTRATE","ANNUALYOVERDUERATE","ANNUALYPENALTYRATE","DATEOFCONCLUSION","DATEOFGRANT","DUEDATEFIRSTCONTRACT","DUEDATELASTCONTRACT","CLOSEDATE","NUMBEROFCREDIT","PURPOSEOFCREDIT","CUSTOMERTYPE","CREDITTYPE","PERSONALTYPE","AUTOPAYMENT","AUTOEXPIRE","USRGROUP","BRANCHID","USID","PARTITIONKEY","ANNUALBANKRATE","NEWFINANCEAMOUNT","NUMBEROFBANKCREDIT","INTCALCMETHOD","PLEDGSORTS" 
  FROM cm_portfolio PARTITION (activecredits)
 WHERE (   (usid IN (SELECT slaveuser
                         FROM cm_adm_vuserman
                        WHERE grouptypeid = 0 AND masteruser = UID))
        OR (cm_administration.is_adminnum (USER) = 1)
       )
/


-- End of DDL Script for View CHINAR.CM_ADM_ACTIVE_CREDITS

-- Start of DDL Script for View CHINAR.CM_ADM_BRANCHES
-- Generated 24-Aug-2008 19:19:23 from CHINAR@T

CREATE OR REPLACE VIEW cm_adm_branches (
   id,
   name )
AS
select ID,NAME from sb_filial
--where id = cm_common_utils.cm_branchid_get()
/


-- End of DDL Script for View CHINAR.CM_ADM_BRANCHES

-- Start of DDL Script for View CHINAR.CM_ADM_CM_ACTIVE
-- Generated 24-Aug-2008 19:19:23 from CHINAR@T

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
   penaltyrest,
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
 , C.PENALTYREST
 , C.RESERVEID
 , C.DUERESERVEID
 , C.OBLIGATION
 , C.PLEDGEPRICE
 , G.PLEDGEID
 , a.acc_no as CONTRACTACCNO
 , br.ostat as BoorowerRest
 , J.VAL_NAME
 , cm_common.get_accname(CONTRACTACCID)  as name

FROM
   CM_loanACCOUNTS A
 , cm_boorowerrest br
 , cm_history C
 , CM_ACTIVE_CREDITS B
 , CM_GUARANTEE G
 , SB_AVALUTE J
 --, CM_BOOROWERINFO L
WHERE
     (B.ID = A.CREDITID)
 AND (b.id = br.creditid)
 AND (C.CREDITID = B.ID)
 AND (c.hdate = (select tek_dat from sb_sysdat))
 AND (G.CREDITID = B.ID)
 AND (J.VALUTE = B.CURRENCY)
   AND (   (b.usid IN (SELECT slaveuser
                         FROM cm_adm_vuserman
                        WHERE grouptypeid = 0 AND masteruser = UID))
        OR (cm_administration.is_adminnum (USER) = 1)
       )
/


-- End of DDL Script for View CHINAR.CM_ADM_CM_ACTIVE

-- Start of DDL Script for View CHINAR.CM_ADM_INTCACHE
-- Generated 24-Aug-2008 19:19:23 from CHINAR@T

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
       j.val_name, cm_common.get_accname(CONTRACTACCID)  as name, k.interest, k.dueinterest, k.trprocessed
  FROM cm_accounts a,
       cm_curr_state c,
       cm_active_credits b,
       sb_avalute j,
      -- cm_boorowerinfo l,
       cm_int_currstate k
 WHERE (b.ID = a.creditid)
   AND (c.creditid = b.ID)
   AND (j.valute = b.currency)
  -- AND (l.creditid = b.ID)
   AND (b.ID = k.creditid)
   AND (   (b.usid IN (SELECT slaveuser
                         FROM cm_adm_vuserman
                        WHERE grouptypeid = 0 AND masteruser = UID))
        OR (cm_administration.is_adminnum (USER) = 1)
       )
/


-- End of DDL Script for View CHINAR.CM_ADM_INTCACHE

-- Start of DDL Script for View CHINAR.CM_ADM_PORTFOLIO
-- Generated 24-Aug-2008 19:19:24 from CHINAR@T

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
   partitionkey,
   annualbankrate,
   newfinanceamount,
   numberofbankcredit,
   intcalcmethod,
   pledgsorts,
   periodid,
   nextnum )
AS
SELECT "ID","CURRENCY","BOOROWERID","INITIALAMOUNT","CREDITLINEAMOUNT","ANNUALYINTERESTRATE","ANNUALYOVERDUERATE","ANNUALYPENALTYRATE","DATEOFCONCLUSION","DATEOFGRANT","DUEDATEFIRSTCONTRACT","DUEDATELASTCONTRACT","CLOSEDATE","NUMBEROFCREDIT","PURPOSEOFCREDIT","CUSTOMERTYPE","CREDITTYPE","PERSONALTYPE","AUTOPAYMENT","AUTOEXPIRE","USRGROUP","BRANCHID","USID","PARTITIONKEY","ANNUALBANKRATE","NEWFINANCEAMOUNT","NUMBEROFBANKCREDIT","INTCALCMETHOD","PLEDGSORTS","PERIODID","NEXTNUM" FROM cm_portfolio
 WHERE (   (usid IN (SELECT slaveuser
                       FROM cm_adm_vuserman
                      WHERE grouptypeid = 0 AND masteruser = UID))
        OR (cm_administration.is_adminnum (USER) = 1)
       )
/


-- End of DDL Script for View CHINAR.CM_ADM_PORTFOLIO

-- Start of DDL Script for View CHINAR.CM_ADM_VUSERMAN
-- Generated 24-Aug-2008 19:19:24 from CHINAR@T

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


-- End of DDL Script for View CHINAR.CM_ADM_VUSERMAN

-- Start of DDL Script for View CHINAR.CM_AK_DISTRICTV
-- Generated 24-Aug-2008 19:19:24 from CHINAR@T

CREATE OR REPLACE VIEW cm_ak_districtv (
   id,
   name )
AS
select id, name
  from agro_region
union
select -1 as id, ' Uaiu?u' as NAME
  from dual
union
select -2 as id, ' U?? ae?e' as NAME
  from dual
/


-- End of DDL Script for View CHINAR.CM_AK_DISTRICTV

-- Start of DDL Script for View CHINAR.CM_AK_PURPOSEV
-- Generated 24-Aug-2008 19:19:24 from CHINAR@T

CREATE OR REPLACE VIEW cm_ak_purposev (
   id,
   name )
AS
select id, name
  from agro_kredit_purpose
union
select -1, ' Uaiu?u' as name
  from dual
union
select -2, ' U?? ae?e' as name
  from dual
/


-- End of DDL Script for View CHINAR.CM_AK_PURPOSEV

-- Start of DDL Script for View CHINAR.CM_AK_VILLAGEV
-- Generated 24-Aug-2008 19:19:24 from CHINAR@T

CREATE OR REPLACE VIEW cm_ak_villagev (
   id,
   name,
   depend_id )
AS
select id, name, depend_id
  from agro_village
union
select -1 as ID, ' Uaiu?u' as name, -1 as depend_id
  from dual
union
select -2 as ID, ' U?? ae?e' as name, -1 as depend_id
  from dual
/


-- End of DDL Script for View CHINAR.CM_AK_VILLAGEV

-- Start of DDL Script for View CHINAR.CM_AKF_DISTRICTBOOROWERS
-- Generated 24-Aug-2008 19:19:24 from CHINAR@T

CREATE OR REPLACE VIEW cm_akf_districtboorowers (
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


-- End of DDL Script for View CHINAR.CM_AKF_DISTRICTBOOROWERS

-- Start of DDL Script for View CHINAR.CM_AKF_DISTRICTCREDITTYPE
-- Generated 24-Aug-2008 19:19:25 from CHINAR@T

CREATE OR REPLACE VIEW cm_akf_districtcredittype (
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


-- End of DDL Script for View CHINAR.CM_AKF_DISTRICTCREDITTYPE

-- Start of DDL Script for View CHINAR.CM_AKF_MEASURES_IDDIA
-- Generated 24-Aug-2008 19:19:25 from CHINAR@T

CREATE OR REPLACE VIEW cm_akf_measures_iddia (
   creditid,
   grantdate,
   givedate,
   activeind1,
   activeind2 )
AS
select creditid, grantdate, givedate, totalamount as activeind1, maindebt as activeind2 from cm_legal_measures
where measurecode=6
/


-- End of DDL Script for View CHINAR.CM_AKF_MEASURES_IDDIA

-- Start of DDL Script for View CHINAR.CM_AKF_MEASURES_PRETENZIA
-- Generated 24-Aug-2008 19:19:25 from CHINAR@T

CREATE OR REPLACE VIEW cm_akf_measures_pretenzia (
   creditid,
   grantdate,
   givedate,
   activeind1,
   activeind2 )
AS
select creditid, grantdate, givedate, totalamount as activeind1, maindebt as activeind2 from cm_legal_measures
where measurecode=4
/


-- End of DDL Script for View CHINAR.CM_AKF_MEASURES_PRETENZIA

-- Start of DDL Script for View CHINAR.CM_AKF_MEASURES_QATNAME
-- Generated 24-Aug-2008 19:19:25 from CHINAR@T

CREATE OR REPLACE VIEW cm_akf_measures_qatname (
   creditid,
   grantdate,
   givedate,
   activeind1,
   activeind2 )
AS
select creditid, grantdate, givedate, totalamount as activeind1, maindebt as activeind2 from cm_legal_measures
where measurecode=7
/


-- End of DDL Script for View CHINAR.CM_AKF_MEASURES_QATNAME

-- Start of DDL Script for View CHINAR.CM_AKF_SB_PROJECTS
-- Generated 24-Aug-2008 19:19:25 from CHINAR@T

CREATE OR REPLACE VIEW cm_akf_sb_projects (
   id,
   name )
AS
SELECT ID, description NAME
  FROM cm_usergroups
/


-- End of DDL Script for View CHINAR.CM_AKF_SB_PROJECTS

-- Start of DDL Script for View CHINAR.CM_ALL_PAYMENT_SCHEDULE
-- Generated 24-Aug-2008 19:19:25 from CHINAR@T

CREATE OR REPLACE VIEW cm_all_payment_schedule (
   id,
   creditid,
   paymentdate,
   principal,
   interest,
   ipinterest,
   rest )
AS
select"ID","CREDITID","PAYMENTDATE","PRINCIPAL","INTEREST","IPINTEREST","REST" from cm_payment_schedule
/


-- End of DDL Script for View CHINAR.CM_ALL_PAYMENT_SCHEDULE

-- Start of DDL Script for View CHINAR.CM_ALL_PAYMENTS
-- Generated 24-Aug-2008 19:19:26 from CHINAR@T

CREATE OR REPLACE VIEW cm_all_payments (
   id,
   creditid,
   paydate,
   payedamt,
   payedintamt,
   payeddueamt,
   payeddueintamt,
   payedpenaltyamt,
   tridamt,
   tridintamt,
   triddueamt,
   triddueintamt,
   tridpenaltyamt,
   tridprimreserve,
   tridsecreserve,
   outtridobligation,
   trobligation )
AS
select"ID","CREDITID","PAYDATE","PAYEDAMT","PAYEDINTAMT","PAYEDDUEAMT","PAYEDDUEINTAMT","PAYEDPENALTYAMT","TRIDAMT","TRIDINTAMT","TRIDDUEAMT","TRIDDUEINTAMT","TRIDPENALTYAMT","TRIDPRIMRESERVE","TRIDSECRESERVE","OUTTRIDOBLIGATION","TROBLIGATION" from cm_payments
/


-- End of DDL Script for View CHINAR.CM_ALL_PAYMENTS

-- Start of DDL Script for View CHINAR.CM_ALL_TRANCHES
-- Generated 24-Aug-2008 19:19:26 from CHINAR@T

CREATE OR REPLACE VIEW cm_all_tranches (
   id,
   creditid,
   tranchedate,
   trancheamount,
   tranchetrid,
   reservetrid,
   obligationouttrid,
   crdlineobltrid,
   profittrid )
AS
select"ID","CREDITID","TRANCHEDATE","TRANCHEAMOUNT","TRANCHETRID","RESERVETRID","OBLIGATIONOUTTRID","CRDLINEOBLTRID","PROFITTRID" from cm_tranches
/


-- End of DDL Script for View CHINAR.CM_ALL_TRANCHES

-- Start of DDL Script for View CHINAR.CM_ALL_USERS
-- Generated 24-Aug-2008 19:19:26 from CHINAR@T

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


-- End of DDL Script for View CHINAR.CM_ALL_USERS

-- Start of DDL Script for View CHINAR.CM_AUTO_EXPIRES
-- Generated 24-Aug-2008 19:19:26 from CHINAR@T

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


-- End of DDL Script for View CHINAR.CM_AUTO_EXPIRES

-- Start of DDL Script for View CHINAR.CM_BOOROWERREST
-- Generated 24-Aug-2008 19:19:26 from CHINAR@T

CREATE OR REPLACE VIEW cm_boorowerrest (
   booroweraccid,
   creditid,
   ostat )
AS
select 
     ac.booroweraccid,
     ac.creditid,
     ar.ostat as ostat
from cm_accounts ac,
     sb_tenostat ar
where ar.acc_id = ac.booroweraccid
/


-- End of DDL Script for View CHINAR.CM_BOOROWERREST

-- Start of DDL Script for View CHINAR.CM_CARDINTREST_CURR_STATE
-- Generated 24-Aug-2008 19:19:26 from CHINAR@T

CREATE OR REPLACE VIEW cm_cardintrest_curr_state (
   hdate,
   cardid,
   tranchid,
   interest,
   partkey )
AS
select "HDATE","CARDID","TRANCHID","INTEREST","PARTKEY" from CM_CARDTRCHINTRESTS partition(curr_state)
/


-- End of DDL Script for View CHINAR.CM_CARDINTREST_CURR_STATE

-- Start of DDL Script for View CHINAR.CM_CARDINTREST_PREV_STATE
-- Generated 24-Aug-2008 19:19:26 from CHINAR@T

CREATE OR REPLACE VIEW cm_cardintrest_prev_state (
   hdate,
   cardid,
   tranchid,
   interest,
   partkey )
AS
select "HDATE","CARDID","TRANCHID","INTEREST","PARTKEY" from CM_CARDTRCHINTRESTS partition(prev_state)
/


-- End of DDL Script for View CHINAR.CM_CARDINTREST_PREV_STATE

-- Start of DDL Script for View CHINAR.CM_CARDREST_CURR_STATE
-- Generated 24-Aug-2008 19:19:27 from CHINAR@T

CREATE OR REPLACE VIEW cm_cardrest_curr_state (
   hdate,
   cardid,
   tranchid,
   rest,
   intrest,
   partkey,
   trprocessed )
AS
select "HDATE","CARDID","TRANCHID","REST","INTREST","PARTKEY","TRPROCESSED" from CM_CARDTRCHRESTS partition(curr_state)
/


-- End of DDL Script for View CHINAR.CM_CARDREST_CURR_STATE

-- Start of DDL Script for View CHINAR.CM_CARDREST_PREV_STATE
-- Generated 24-Aug-2008 19:19:27 from CHINAR@T

CREATE OR REPLACE VIEW cm_cardrest_prev_state (
   hdate,
   cardid,
   tranchid,
   rest,
   intrest,
   partkey,
   trprocessed )
AS
select "HDATE","CARDID","TRANCHID","REST","INTREST","PARTKEY","TRPROCESSED" from CM_CARDTRCHRESTS partition(prev_state)
/


-- End of DDL Script for View CHINAR.CM_CARDREST_PREV_STATE

-- Start of DDL Script for View CHINAR.CM_CURR_STATE
-- Generated 24-Aug-2008 19:19:27 from CHINAR@T

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
   duereserveid,
   pledgepricetorpaq,
   pledgepriceev,
   penaltyrest )
AS
select "CREDITID","HDATE","LASTCALCDATE","STOPCALCDATE","REST","INTERESTREST","DUEREST","DUEINTERESTREST","RESERVEID","GIVENAMOUNT","OBLIGATION","PLEDGEPRICE","PARTITIONKEY","DUERESERVEID","PLEDGEPRICETORPAQ","PLEDGEPRICEEV","PENALTYREST" from cm_history partition(curr_state)
/


-- End of DDL Script for View CHINAR.CM_CURR_STATE

-- Start of DDL Script for View CHINAR.CM_DELAYED_TRANSACTIONS
-- Generated 24-Aug-2008 19:19:27 from CHINAR@T

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


-- End of DDL Script for View CHINAR.CM_DELAYED_TRANSACTIONS

-- Start of DDL Script for View CHINAR.CM_DUEINTACCOUNTS
-- Generated 24-Aug-2008 19:19:27 from CHINAR@T

CREATE OR REPLACE VIEW cm_dueintaccounts (
   acc_no,
   creditid )
AS
SELECT "ACC_NO","CREDITID"
     FROM (SELECT '' AS acc_no, creditid
             FROM (SELECT dueinterestaccid, creditid
                     FROM cm_accounts
                   MINUS
                   SELECT ca.dueinterestaccid, ca.creditid
                     FROM cm_accounts ca, sb_account ac
                    WHERE ca.dueinterestaccid = ac.ID)
           UNION
           SELECT acc_no, creditid
             FROM (SELECT ac.acc_no, ca.dueinterestaccid, ca.creditid
                     FROM cm_accounts ca, sb_account ac
                    WHERE ca.dueinterestaccid = ac.ID))
/


-- End of DDL Script for View CHINAR.CM_DUEINTACCOUNTS

-- Start of DDL Script for View CHINAR.CM_DUELOANACCOUNTS
-- Generated 24-Aug-2008 19:19:28 from CHINAR@T

CREATE OR REPLACE VIEW cm_dueloanaccounts (
   acc_no,
   creditid )
AS
SELECT "ACC_NO","CREDITID"
     FROM (SELECT '' AS acc_no, creditid
             FROM (SELECT dueloanaccid, creditid
                     FROM cm_accounts
                   MINUS
                   SELECT ca.dueloanaccid, ca.creditid
                     FROM cm_accounts ca, sb_account ac
                    WHERE ca.dueloanaccid = ac.ID)
           UNION
           SELECT acc_no, creditid
             FROM (SELECT ac.acc_no, ca.dueloanaccid, ca.creditid
                     FROM cm_accounts ca, sb_account ac
                    WHERE ca.dueloanaccid = ac.ID))
/


-- End of DDL Script for View CHINAR.CM_DUELOANACCOUNTS

-- Start of DDL Script for View CHINAR.CM_DUERESACCOUNTS
-- Generated 24-Aug-2008 19:19:28 from CHINAR@T

CREATE OR REPLACE VIEW cm_dueresaccounts (
   acc_no,
   creditid )
AS
SELECT "ACC_NO","CREDITID"
     FROM (SELECT '' AS acc_no, creditid
             FROM (SELECT secondaryreserveaccid, creditid
                     FROM cm_accounts
                   MINUS
                   SELECT ca.secondaryreserveaccid, ca.creditid
                     FROM cm_accounts ca, sb_account ac
                    WHERE ca.secondaryreserveaccid = ac.ID)
           UNION
           SELECT acc_no, creditid
             FROM (SELECT ac.acc_no, ca.secondaryreserveaccid, ca.creditid
                     FROM cm_accounts ca, sb_account ac
                    WHERE ca.secondaryreserveaccid = ac.ID))
/


-- End of DDL Script for View CHINAR.CM_DUERESACCOUNTS

-- Start of DDL Script for View CHINAR.CM_FIELDS_LIST
-- Generated 24-Aug-2008 19:19:28 from CHINAR@T

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


-- End of DDL Script for View CHINAR.CM_FIELDS_LIST

-- Start of DDL Script for View CHINAR.CM_INACTIVE_CREDITS
-- Generated 24-Aug-2008 19:19:28 from CHINAR@T

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


-- End of DDL Script for View CHINAR.CM_INACTIVE_CREDITS

-- Start of DDL Script for View CHINAR.CM_INT_CURRSTATE
-- Generated 24-Aug-2008 19:19:28 from CHINAR@T

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
   dueintprecision,
   penaltyprecision,
   penaltyinterest )
AS
select "PARTITIONKEY","CREDITID","HDATE","INTEREST","DUEINTEREST","INTTRID","DUEINTTRID","TRPROCESSED","INTPRECISION","DUEINTPRECISION","PENALTYPRECISION","PENALTYINTEREST" from cm_interests partition (curr_state)
/


-- End of DDL Script for View CHINAR.CM_INT_CURRSTATE

-- Start of DDL Script for View CHINAR.CM_INT_PREVSTATE
-- Generated 24-Aug-2008 19:19:29 from CHINAR@T

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
   dueintprecision,
   penaltyprecision,
   penaltyinterest )
AS
select "PARTITIONKEY","CREDITID","HDATE","INTEREST","DUEINTEREST","INTTRID","DUEINTTRID","TRPROCESSED","INTPRECISION","DUEINTPRECISION","PENALTYPRECISION","PENALTYINTEREST" from cm_interests partition (prev_state)
/


-- End of DDL Script for View CHINAR.CM_INT_PREVSTATE

-- Start of DDL Script for View CHINAR.CM_INTACCOUNTS
-- Generated 24-Aug-2008 19:19:29 from CHINAR@T

CREATE OR REPLACE VIEW cm_intaccounts (
   acc_no,
   creditid )
AS
SELECT ac.acc_no, ca.creditid
     FROM cm_accounts ca, sb_account ac
    WHERE ca.interestaccid = ac.ID
/


-- End of DDL Script for View CHINAR.CM_INTACCOUNTS

-- Start of DDL Script for View CHINAR.CM_INTCACHE
-- Generated 24-Aug-2008 19:19:29 from CHINAR@T

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
 --, L.NAME
 , K.INTEREST
 , K.DUEINTEREST
 , K.TRPROCESSED
 ,cm_common.get_accname(CONTRACTACCID)  as name
FROM
   CM_ACCOUNTS A
 , CM_CURR_STATE C
 , CM_ACTIVE_CREDITS B
 , SB_AVALUTE J
 --, CM_BOOROWERINFO L
 , CM_INT_CURRSTATE K
WHERE
     (B.ID = A.CREDITID)
 AND (C.CREDITID = B.ID)
 AND (J.VALUTE = B.CURRENCY)
-- AND (L.CREDITID = B.ID)
 AND (B.ID = K.CREDITID)
/


-- End of DDL Script for View CHINAR.CM_INTCACHE

-- Start of DDL Script for View CHINAR.CM_LM_ALL
-- Generated 24-Aug-2008 19:19:29 from CHINAR@T

CREATE OR REPLACE VIEW cm_lm_all (
   creditid,
   grantdate,
   givedate,
   measurecode,
   totalamount,
   maindebt )
AS
SELECT creditid, grantdate, givedate, measurecode,
          ROUND (totalamount / 5000, 2) totalamount,
          ROUND (maindebt / 5000, 2) maindebt
     FROM cm_legal_measures
    WHERE grantdate <= '31-dec-2005'
   UNION ALL
   SELECT creditid, grantdate, givedate, measurecode, totalamount, maindebt
     FROM cm_legal_measures
    WHERE grantdate > '31-dec-2005'
/


-- End of DDL Script for View CHINAR.CM_LM_ALL

-- Start of DDL Script for View CHINAR.CM_LOANACCOUNTS
-- Generated 24-Aug-2008 19:19:30 from CHINAR@T

CREATE OR REPLACE VIEW cm_loanaccounts (
   acc_no,
   creditid,
   contractaccid )
AS
SELECT ac.acc_no, ca.creditid,ca.contractaccid
     FROM cm_accounts ca, sb_account ac
    WHERE ca.contractaccid = ac.ID
/


-- End of DDL Script for View CHINAR.CM_LOANACCOUNTS

-- Start of DDL Script for View CHINAR.CM_LOANREST
-- Generated 24-Aug-2008 19:19:30 from CHINAR@T

CREATE OR REPLACE VIEW cm_loanrest (
   loanaccid,
   creditid,
   ostat )
AS
select 
     ac.loanaccid,
     ac.creditid,
     abs(ar.ostat) as ostat
from cm_accounts ac,
     sb_tenostat ar
where ar.acc_id = ac.loanaccid
/


-- End of DDL Script for View CHINAR.CM_LOANREST

-- Start of DDL Script for View CHINAR.CM_PREV_STATE
-- Generated 24-Aug-2008 19:19:30 from CHINAR@T

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
   duereserveid,
   pledgepricetorpaq,
   pledgepriceev,
   penaltyrest )
AS
select "CREDITID","HDATE","LASTCALCDATE","STOPCALCDATE","REST","INTERESTREST","DUEREST","DUEINTERESTREST","RESERVEID","GIVENAMOUNT","OBLIGATION","PLEDGEPRICE","PARTITIONKEY","DUERESERVEID","PLEDGEPRICETORPAQ","PLEDGEPRICEEV","PENALTYREST"from cm_history partition (prev_state)
/


-- End of DDL Script for View CHINAR.CM_PREV_STATE

-- Start of DDL Script for View CHINAR.CM_RESERVEACCOUNTS
-- Generated 24-Aug-2008 19:19:30 from CHINAR@T

CREATE OR REPLACE VIEW cm_reserveaccounts (
   acc_no,
   creditid )
AS
SELECT ac.acc_no, ca.creditid
     FROM cm_accounts ca, sb_account ac
    WHERE ca.primaryreserveaccid = ac.ID
/


-- End of DDL Script for View CHINAR.CM_RESERVEACCOUNTS

-- Start of DDL Script for View CHINAR.CM_RESERVES
-- Generated 24-Aug-2008 19:19:30 from CHINAR@T

CREATE OR REPLACE VIEW cm_reserves (
   id,
   code,
   percent,
   description )
AS
select "ID","CODE","PERCENT","DESCRIPTION" from CM_RESERVE_TYPES
where ID<>0
/


-- End of DDL Script for View CHINAR.CM_RESERVES

-- Start of DDL Script for View CHINAR.CM_SB_ALL_ACCOUNTS
-- Generated 24-Aug-2008 19:19:31 from CHINAR@T

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


-- End of DDL Script for View CHINAR.CM_SB_ALL_ACCOUNTS

-- Start of DDL Script for View CHINAR.CM_USERS
-- Generated 24-Aug-2008 19:19:31 from CHINAR@T

CREATE OR REPLACE VIEW cm_users (
   id,
   name,
   ctime,
   tablespace_name )
AS
select "ID","NAME","CTIME","TABLESPACE_NAME" from cm_all_users where tablespace_name='TS_CREDITS'
/


-- End of DDL Script for View CHINAR.CM_USERS

-- Start of DDL Script for View CHINAR.CM_WR_CREDITINFO
-- Generated 24-Aug-2008 19:19:31 from CHINAR@T

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


-- End of DDL Script for View CHINAR.CM_WR_CREDITINFO

-- Start of DDL Script for View CHINAR.MIS
-- Generated 24-Aug-2008 19:19:31 from CHINAR@T

CREATE OR REPLACE VIEW mis (
   id,
   numberofcredit,
   creditlineamount,
   annualyinterestrate,
   dateofconclusion,
   duedatefirstcontract,
   duedatelastcontract,
   purposeofcredit,
   rest,
   ekrest,
   givenamount,
   ekgivenamount,
   interestrest,
   ekint,
   duerest,
   ekduerest,
   dueinterestrest,
   ekdueint,
   pledgeprice,
   percent,
   duepercent,
   description,
   descr,
   contractaccno,
   interestaccno,
   reserveaccno,
   duecontractaccno,
   duereserveaccno,
   val_name,
   name,
   reservesum,
   pledgename,
   holdername,
   registryno,
   anyinfotodisting,
   registryagency,
   registrydate,
   insuranceamount,
   insuranceagency,
   insurancedate,
   boorowerid,
   address,
   phonenumber )
AS
( SELECT
   Rownum as ID,B.NUMBEROFCREDIT
 , B.CREDITLINEAMOUNT -- Kreditin meblegi
 , B.ANNUALYINTERESTRATE --
 , B.DATEOFCONCLUSION --acilma
 , B.DUEDATEFIRSTCONTRACT --baglanma
 , B.DUEDATELASTCONTRACT --uzadilma
 , B.PURPOSEOFCREDIT -- teyinat
 , C.REST -- qaliq
, C.REST*T.OSTAT as EKREST
 , C.givenamount 
, C.givenamount*T.OSTAT as EKgivenamount
 , C.INTERESTREST  --hes 
, C.INTERESTREST*T.OSTAT EKINT --hes 
 , C.DUEREST-- gecikmish borc
, C.DUEREST*T.ostat as EKDuerest
 , C.DUEINTERESTREST --gecikmish
 , C.DUEINTERESTREST*T.ostat as EKDueint --gecikmish
 , C.PLEDGEPRICE -- Girov deyeri
 , E.PERCENT -- ehtiyat 
 ,GET_RESERVE_PERCENT(c.DUERESERVEID) as duepercent 
 , H.Description -- girovun adi
 ,cat.DESCRIPTION as descr
 , Creditsmgr.CM_COMMON.AccountNumber_Get(A.CONTRACTACCID) as CONTRACTACCNO -- Hesab
 , Creditsmgr.CM_COMMON.AccountNumber_Get(A.interestaccid) as INTERESTACCNO
 , Creditsmgr.CM_COMMON.AccountNumber_Get(A.PRIMARYRESERVEACCID) as RESERVEACCNO
 , Creditsmgr.CM_COMMON.AccountNumber_Get(A.DUELOANACCID) as DUECONTRACTACCNO
 , Creditsmgr.CM_COMMON.AccountNumber_Get(A.SECONDARYRESERVEACCID) as DUERESERVEACCNO
 , J.VAL_NAME -- $
 , L.NAME --Mushteri
 , ((C.REST+C.DUEREST)* E.PERCENT / 100) * T.OSTAT as ReserveSum
,g.pledgename
,g.holdername
,g.registryno
,g.anyinfotodisting
,g.registryagency
,g.registrydate
,g.insuranceamount
,g.insuranceagency
,g.insurancedate
,L.boorowerid
,L.address
,L.phonenumber
FROM
   CM_ACCOUNTS A
 , CM_PREV_STATE C
 , CM_PORTFOLIO B
 , CM_GUARANTEE G
 , CM_PLEDGES H
 , SB_AVALUTE J
 , CM_RESERVE_TYPES E
 , CM_USERGROUPS F
 , CM_BOOROWERINFO L
 , SB_operkurs T
 ,cm_categories cat
WHERE
     (B.ID = A.CREDITID)
 AND (C.CREDITID = B.ID)
 AND (E.ID = C.RESERVEID)
 AND (F.ID = B.USRGROUP)
 AND (G.CREDITID = B.ID)
 AND (H.ID = G.PLEDGEID)
 AND (J.VALUTE = B.CURRENCY)
 AND (L.CREDITID = B.ID)
 AND (T.VAL_KOD=B.CURRENCY)
AND (B.CustomerType = Cat.ID)
 AND  (B.partitionkey=0)  and  ((C.stopcalcdate is not null)  or (C.stopcalcdate is  null))  
  and t.dat= '31-Oct-2006'

)
/


-- End of DDL Script for View CHINAR.MIS

-- Start of DDL Script for View CHINAR.SB_USERSINFO
-- Generated 24-Aug-2008 19:19:32 from CHINAR@T

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


-- End of DDL Script for View CHINAR.SB_USERSINFO

