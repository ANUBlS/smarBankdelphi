SELECT   a.id AS accid, a.kli_id, a.acc_no AS accountnumber , t.OSTAT as Rest, v.VAL_NAME
    FROM SB_ACCOUNT  a ,
         SB_TENOSTAT t ,
         SB_AVALUTE  v
   WHERE (    a.kli_id = :kli_id
          AND a.bal_cn1 IN (SELECT accountnumber
                            FROM cm_aginfo
                           WHERE groupid = (SELECT g.id
                                              FROM cm_accountgroups g
                                             WHERE g.iname = 'ClientAccs'))
         )
         AND t.Acc_ID = a.ID
         AND v.VALUTE = a.VAL_ACC
UNION ALL
SELECT   a.id AS accid, a.kli_id, a.acc_no AS accountnumber , t.OSTAT as Rest, v.VAL_NAME
    FROM SB_ACCOUNT  a ,
         SB_TENOSTAT t ,
         SB_AVALUTE  v
   WHERE ((bal_cn1 IN (SELECT accountnumber
                         FROM cm_aginfo
                        WHERE groupid = (SELECT g.id
                                           FROM cm_accountgroups g
                                          WHERE g.iname = 'InternalBankAccs'))
          )
         )
         AND t.Acc_ID = a.ID
         AND v.VALUTE = a.VAL_ACC
         
ORDER BY kli_id, accountnumber

