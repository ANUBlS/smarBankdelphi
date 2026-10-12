select  
     p.id ,
     p.numberofcredit,
     p.creditlineamount,                                  
     p.annualyinterestrate,                                          
     p.dateofconclusion ,                                            
     p.duedatefirstcontract,                                      
     p.duedatelastcontract,                                       
     p.purposeofcredit,                                           
     p.annualypenaltyrate, 
     p.intcalcmethod ,
     cat.description, 
     h.rest,
     h.rest*o.ostat  AS ekrest,
     h.interestrest ,
     h.interestrest*o.ostat AS ekint,
     h.duerest,
     h.duerest*ostat AS ekduerest,
     h.dueinterestrest,
     h.dueinterestrest*ostat as ekdueint,
     h.penaltyrest ,                 
     h.penaltyrest*o.ostat as ekpen,
     h.givenamount ,
     h.givenamount *o.ostat as  ekgivenamount,
     h.pledgeprice,
     h.stopcalcdate,
     e1.percent,
     e2.percent as duepercent,
     acc.acc_no as contractaccno,
     intacc.acc_no as interestaccno,
     resacc.acc_no as reserveaccno,
     dueacc.acc_no as duecontractaccno,
     dueintacc.acc_no as dueinterestaccno,
     dueresacc.acc_no as duereserveaccno ,
     av.val_name,
     l.name,
     LastintPaydate.paydat as lastintpaydate ,
     LastMainPaydate.paydat as lastmainpaydate ,
    -- cm_common.get_lastintpaydate (p.ID, :hdat) as lastintpaydate,
    -- cm_common.get_lastmainpaydate (p.ID, :hdat) as lastmainpaydate,
	 restpr.principal ,
	 restpr.interest,
     g.pledgename, 
	 g.holdername, 
	   g.registryno,
       g.anyinfotodisting                
                         ,
       g.registryagency                             
                       ,
       g.registrydate                                      
                     ,
       g.insuranceamount                                 
                        ,
       g.insuranceagency                               
                        ,
       g.insurancedate ,                                    
       l.boorowerid, 
       l.address, 
       l.phonenumber,	 
       pl.description,
       ps.name as psname
from cm_portfolio p,
     cm_history h,
     cm_categories cat,
     cm_boorowerinfo l,
     cm_guarantee g,
     cm_pledges pl,
     cm_pledgsorts ps,
     sb_avalute av,
     sb_operkurs o,
   cm_loanaccounts acc,
   cm_intaccounts intacc,
   cm_reserveaccounts resacc,
   cm_dueloanaccounts dueacc ,
   cm_dueintaccounts dueintacc ,
   cm_dueresaccounts dueresacc  ,
   cm_reserve_types e1,
   cm_reserve_types e2 ,
(SELECT 0 AS principal,0 AS interest, creditid
  FROM (SELECT ID AS creditid
          FROM cm_portfolio
        MINUS
        SELECT creditid
          FROM cm_payment_schedule
         WHERE paymentdate BETWEEN TO_DATE (   '01'
                                            || '-'
                                            || TO_CHAR (TO_DATE (:pdat),
                                                        'MON'
                                                       )
                                            || '-'
                                            || TO_CHAR (TO_DATE (:pdat),
                                                        'YYYY'
                                                       )
                                           )
                               AND LAST_DAY (TO_DATE (:pdat)))
UNION
SELECT principal,interest, creditid
  FROM cm_payment_schedule
 WHERE paymentdate BETWEEN TO_DATE (   '01'
                                    || '-'
                                    || TO_CHAR (TO_DATE (:pdat), 'MON')
                                    || '-'
                                    || TO_CHAR (TO_DATE (:pdat), 'YYYY')
                                   )
                       AND LAST_DAY (TO_DATE (:pdat))) restpr,
                       
      ((select 
          id as creditid,
          null as paydat
        from cm_portfolio
       minus
       select 
       creditid ,
       null as paydat from cm_payments
      where PAYEDINTAMT<>0  
      and PAYDATE <= :hdat
      group by creditid)
      union
      select 
       creditid ,
       max(PAYDATE) as paydat from cm_payments
      where PAYEDINTAMT<>0  
      and PAYDATE <= :hdat
      group by creditid) LastintPaydate,

     
      ((select 
          id as creditid,
          null as paydat
        from cm_portfolio
       minus
       select 
       creditid ,
       null as paydat from cm_payments
      where payedamt<>0  
      and PAYDATE <= :hdat
      group by creditid)
      union
      select 
       creditid ,
       max(PAYDATE) as paydat from cm_payments
      where payedamt<>0  
      and PAYDATE <= :hdat
      group by creditid) LastMainPaydate      
        

where 
  h.creditid = p.id 
  and e1.id = h.reserveid
  and e2.id = h.duereserveid
  and h.hdate = :hdat
  and cat.id = p.customertype
  and p.id = l.creditid
  and p.id = g.creditid
  and pl.id = g.pledgeid
  and ps.id = p.pledgsorts
  and av.valute = p.currency
  and o.dat = :hdat
  and o.val_kod = p.currency
  and  p.id = acc.creditid 
  and  p.id = intacc.creditid 
  and  p.id = resacc.creditid 
  and  p.id = dueacc.creditid  
  and  p.id = dueintacc.creditid  
  and  p.id = dueresacc.creditid 
  and restpr.creditid = p.id 
  and LastintPaydate.creditid = p.id
  and LastMainPaydate.creditid = p.id
  
  


  
     
