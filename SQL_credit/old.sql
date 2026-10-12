
SELECT p.ID, p.numberofcredit, p.currency, p.personaltype, p.customertype,
       p.branchid, p.credittype, b.NAME, av.val_name,
       cm_common.accountnumber_get (a.contractaccid) AS contractaccno,
       cm_common.accountrest_get (a.booroweraccid) AS custaccrest,
       cm_utils.get_creditplanprincipal (p.ID, :PDAT) AS principal,
       cm_utils.get_creditplaninterest (p.ID, :PDAT) AS interest,
         cm_utils.get_creditplanprincipal (p.ID, :PDAT)
       + cm_utils.get_creditplaninterest (p.ID, :PDAT) AS sumamt,
        expcrd.expdatcount,
        --cm_utils.get_ExpiresDateCount(p.ID)
        
 --/*get_creditplandate (p.ID, :PDAT)*/ AS expdatcount,
       c.penaltyrest, c.reserveid,
       cm_utils.get_creditplanrest (p.ID, :PDAT) AS plr,
       p.dateofconclusion as opendate,
       p.duedatefirstcontract as closedate,
       p.annualyinterestrate,
       cm_common.get_AccountBalance(a.contractaccid) as BalaccNo,
       p.boorowerid 
  FROM cm_active_credits p,
       cm_boorowerinfo b,
       cm_accounts a,
       cm_curr_state c,
       sb_avalute av,

(select 

   pl.creditid,
   cm_utils.bankdaysbetween(max(h.hdate),:PDAT) as expdatcount
   
from cm_history h,   


(select   creditid, 
         rest,
         paymentdate
  from cm_payment_schedule
) pl

where pl.creditid =h.creditid
  and pl.paymentdate = (select max(paymentdate) from cm_payment_schedule
  where creditid = pl.creditid and paymentdate <h.hdate)
and abs(pl.rest-h.rest)<=15  
group by pl.creditid ) expcrd      
       
 WHERE b.creditid = p.ID
   AND expcrd.creditid = p.ID
   AND a.creditid = p.ID
   AND c.creditid = p.ID
   AND av.valute = p.currency
   AND abs((cm_utils.get_creditplanrest (p.ID, :PDAT) - c.rest))>=2
and c.rest <> 0
and p.intcalcmethod=0


