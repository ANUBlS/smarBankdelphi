create table XX as 
SELECT
   Rownum as ID
 , B.CREDITLINEAMOUNT -- Kreditin meblegi
 , B.ANNUALYINTERESTRATE --%
 , B.DATEOFCONCLUSION --acilma
 , B.DUEDATEFIRSTCONTRACT --baglanma
 , B.DUEDATELASTCONTRACT --uzadilma
 , B.PURPOSEOFCREDIT -- teyinat
 , C.REST -- qaliq
 , C.INTERESTREST --hes %
 , C.DUEREST-- gecikmish borc
 , C.DUEINTERESTREST --gecikmish%
 , C.PLEDGEPRICE -- Girov deyeri
 , E.PERCENT -- ehtiyat %
 , H.Description -- girovun adi
 , Creditsmgr.CM_COMMON.AccountNumber_Get(A.CONTRACTACCID) as CONTRACTACCNO -- Hesab
 , J.VAL_NAME -- $
 , L.NAME --Mushteri
 , ((C.REST+C.DUEREST)* E.PERCENT / 100) * T.OSTAT as ReserveSum
FROM
   Creditsmgr.CM_ACCOUNTS A
 , Creditsmgr.CM_CURR_STATE C
 , Creditsmgr.CM_ACTIVE_CREDITS B
 , Creditsmgr.CM_GUARANTEE G
 , Creditsmgr.CM_PLEDGES H
 , Creditsmgr.SB_AVALUTE J
 , Creditsmgr.CM_RESERVES E
 , Creditsmgr.CM_USERGROUPS F
 , Creditsmgr.CM_BOOROWERINFO L
 , Creditsmgr.SB_TEMPRATE T
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
-- and (Rownum<=1000)
--AND (B.CURRENCY=1)
ORDER BY B.CURRENCY,b.PERSONALTYPE,L.NAME
