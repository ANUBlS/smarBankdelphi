-- (c) Smart Systems Technology
SELECT   lastremainder.currid AS currencyid,
         lastremainder.balancebill AS balanceaccount,
         firstremainder.active AS firstactive,
         firstremainder.passive AS firstpassive, turnovers.dturnover,
         turnovers.cturnover, lastremainder.active AS lastactive,
         lastremainder.passive AS lastpassive
    FROM (SELECT   ac.val_acc AS currid, b.bal_cn balancebill,
                   SUM (
                      sb_mtoutview.active (
                         ar.ostat,
                         b.typeid,
                         b.additionaltypeid
                      )
                   ) active,
                   SUM (
                      sb_mtoutview.passiv (
                         ar.ostat,
                         b.typeid,
                         b.additionaltypeid
                      )
                   ) passive
              FROM archost ar, ACCOUNT ac, bal_spr1 b
             WHERE (ar.acc_id = ac.id)
               AND (ac.bal_cn1 = b.bal_cn)
               AND (ar.datdate = '05-JAN-04')
          GROUP BY ac.val_acc, b.bal_cn) firstremainder,
         (SELECT   b.bal_cn balancebill, ac.val_acc AS currid,
                   SUM (obr_d) dturnover, SUM (obr_k) cturnover
              FROM archost ar, ACCOUNT ac, bal_spr1 b
             WHERE (ar.acc_id = ac.id)
               AND (ac.bal_cn1 = b.bal_cn)
               AND (ar.datdate BETWEEN '06-JAN-04' AND '06-JAN-04')
          GROUP BY ac.val_acc, b.bal_cn) turnovers,
         (SELECT   ac.val_acc AS currid, b.bal_cn balancebill,
                   SUM (
                      sb_mtoutview.active (
                         ar.ostat,
                         b.typeid,
                         b.additionaltypeid
                      )
                   ) active,
                   SUM (
                      sb_mtoutview.passiv (
                         ar.ostat,
                         b.typeid,
                         b.additionaltypeid
                      )
                   ) passive
              FROM archost ar, ACCOUNT ac, bal_spr1 b
             WHERE (ar.acc_id = ac.id)
               AND (ac.bal_cn1 = b.bal_cn)
               AND (ar.datdate = '06-JAN-04')
          GROUP BY ac.val_acc, b.bal_cn) lastremainder
   WHERE lastremainder.currid = firstremainder.currid
     AND lastremainder.balancebill = firstremainder.balancebill(+)
     AND lastremainder.balancebill = turnovers.balancebill
     AND lastremainder.currid = turnovers.currid
ORDER BY lastremainder.balancebill
