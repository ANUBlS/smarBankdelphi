SELECT
  acc.ID AS AccID,
  acc.ACC_NO AS AccNo,
  acc.NAME AS AccName,
  acc.OPEN_DAT AS OpenDate,
  acc.CLOSE_DAT AS CloseDate,
  acc.VAL_ACC AS CurrencyID,
  acc.bal_cn1 AS SAcc,
  acc.bal_cn2 AS SAcc2,
  acc.bal_cn3 AS SAcc3,
  acc.bal_cn4 AS SAcc4,
  acc.KLI_ID as CustomerID,
  acc.PAIR_ACC as PairAcc,
  acc.Limit as AccLimit,
  acc.SIM_OTCET as ReportSymbol,
  acc.tipacc as AccFlags ,
  acc.FILIAL as FilialID,
  acc.Insider as Insider,
  t.OSTAT AS Amount,
  t.POK_OSTAT AS LAmount,
  t.OBR_D AS DebitTurnover,
  t.OBR_K AS CreditTurnover,
  t.POK_OBR_D AS DebitLTurnover,
  t.POK_OBR_K AS CreditLTurnover,
  Currency.VAL_NAME AS CurrencySName,
  dsb.OSTAT as DayStartAmount,
  dsb.POK_OSTAT as DayStartLAmount,
  dlb.OSTAT as DelayedAmount,
  dlb.POK_OSTAT as DelayedLAmount,
  acc.sid#,
  acc.rowid
FROM
--  ACCOUNT  acc,
  ACCOUNT  PARTITION (ActivACC) acc,
--  ACCOUNT  PARTITION (CloseACC) acc,
  TENOSTAT t,
  AVALUTE Currency,
  TEMPOST dsb,
  LAZYREST dlb
WHERE
  (t.ACC_ID = acc.ID)
  AND (Currency.VALUTE = acc.VAL_ACC)
  AND (dsb.ACC_ID = acc.ID)
  AND (dlb.ACC_ID = acc.ID)
  ORDER BY acc.ACC_NO

