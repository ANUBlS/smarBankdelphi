select
   a1.*
 , decode(sign(a1.pok_ostat), 1 ,'(P)',0,'(P)',-1,'(A)','(P)') AP_beg
 , a2.datdate   EndDate
 , a2.ostat     EndOstat
 , a2.pok_ostat EndPok_Ostat
 , a2.obr_d     EndObr_d
 , a2.obr_k     EndObr_k
 , a2.pok_obr_d EndPok_Obr_d
 , a2.pok_obr_k EndPok_Obr_k
 , decode(sign(a2.pok_ostat),1,'(P)',0,'(P)',-1,'(A)','(P)') AP_end
from v_Balance1 a1, v_balance1 a2
where
a1.AccountId=a2.AccountId     and
--a1.datdate = P_EXTRACTION.Fdate(a1.AccountId,'19-Mar-2003')   and
--a2.datdate='20-Mar-2003' and 
( a1.BalanceCode in (1001) 
    or a1.AccountNumber in ('-1')
    or a1.CustomerId in (-1) 
)

