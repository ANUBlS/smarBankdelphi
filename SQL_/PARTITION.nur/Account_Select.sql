       select 
         acc.ID as AccID, 
         acc.ACC_NO as AccNo, 
         acc.NAME as AccName, 
         acc.OPEN_DAT as OpenDate, 
         acc.CLOSE_DAT as CloseDate, 
         acc.VAL_ACC as CurrencyID, 
         acc.bal_cn1 as SAcc, 
         acc.bal_cn2 as SAcc2, 
         acc.bal_cn3 as SAcc3, 
         acc.bal_cn4 as SAcc4, 
         acc.KLI_ID as CustomerID, 
         acc.PAIR_ACC as PairAcc, 
         acc.Limit as AccLimit, 
         acc.SIM_OTCET as ReportSymbol, 
         acc.tipacc as AccFlags ,  
         acc.FILIAL as FilialID, 
         acc.Insider as Insider, 
         t.OSTAT as Amount, 
         t.POK_OSTAT as LAmount, 
         t.OBR_D as DebitTurnover, 
         t.OBR_K as CreditTurnover, 
         t.POK_OBR_D as DebitLTurnover, 
         t.POK_OBR_K as CreditLTurnover, 
         Currency.VAL_NAME as CurrencySName, 
         dsb.OSTAT as DayStartAmount, 
         dsb.POK_OSTAT as DayStartLAmount, 
         dlb.OSTAT as DelayedAmount, 
         dlb.POK_OSTAT as DelayedLAmount, 
         acc.sid#, 
         acc.rowid 
       from 
         ACCOUNT acc, 
         TENOSTAT t, 
         AVALUTE Currency, 
         TEMPOST dsb, 
         LAZYREST dlb 
       where 
         (t.ACC_ID(+) = acc.ID) 
         and (Currency.VALUTE = acc.VAL_ACC) 
         and (dsb.ACC_ID (+)= acc.ID) 
         and (dlb.ACC_ID(+) = acc.ID) order by acc_no

