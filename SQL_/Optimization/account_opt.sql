SELECT acc."ID" accid, acc.acc_no accno, acc."NAME" accname, acc.open_dat 
       opendate, acc.close_dat closedate, acc.val_acc currencyid, acc.bal_cn1 
       sacc, acc.bal_cn2 sacc2, acc.bal_cn3 sacc3, acc.bal_cn4 sacc4, acc.
       kli_id customerid, acc.pair_acc pairacc, acc.limit acclimit, acc.
       sim_otcet reportsymbol, acc.tipacc accflags, acc.filial filialid, acc.
       insider insider, t.ostat amount, t.pok_ostat lamount, t.obr_d 
       debitturnover, t.obr_k creditturnover, t.pok_obr_d debitlturnover, t.
       pok_obr_k creditlturnover, 
--       currency.val_name currencysname,
       dsb.ostat 
       daystartamount, dsb.pok_ostat daystartlamount, dlb.ostat delayedamount, 
       dlb.pok_ostat delayedlamount, acc.sid#, acc.ROWID
    FROM account acc, tenostat t, tempost dsb, lazyrest dlb  
    --, avalute currency
    WHERE 
          t.acc_id = acc.ID
--      AND currency.valute = acc.val_acc
      AND dsb.acc_id = acc.ID
      AND dlb.acc_id = acc.ID
      AND (acc.op_id <>-1   
       and not EXISTS(select SUSER from sba_userman where MUSER=172 and (type#=2 or type#=0)))
or (op_id in(select SUSER from sba_userman where MUSER=172 and (type#=2 or type#=0)))
--    ORDER BY acc.acc_no

