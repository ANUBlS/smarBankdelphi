
SELECT creditid, NULL AS paymentdate
  FROM (SELECT ID AS creditid
          FROM cm_portfolio
        MINUS
        SELECT   creditid
            FROM cm_payment_schedule
           WHERE paymentdate BETWEEN TO_DATE (   '01'
                                              || '-'
                                              || TO_CHAR (TO_DATE (:hdat),
                                                          'MON'
                                                         )
                                              || '-'
                                              || TO_CHAR (TO_DATE (:hdat),
                                                          'YYYY'
                                                         )
                                             )
                                 AND LAST_DAY (TO_DATE (:hdat))
        GROUP BY creditid)
UNION
SELECT creditid, MIN (paymentdate) AS paymentdate
  FROM cm_payment_schedule
 WHERE paymentdate BETWEEN TO_DATE (   '01'
                                    || '-'
                                    || TO_CHAR (TO_DATE (:hdat), 'MON')
                                    || '-'
                                    || TO_CHAR (TO_DATE (:hdat), 'YYYY')
                                   )
                       AND LAST_DAY (TO_DATE (:hdat))

