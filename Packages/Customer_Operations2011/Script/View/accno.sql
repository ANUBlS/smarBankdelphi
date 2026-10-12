DROP VIEW accno
/

CREATE OR REPLACE VIEW accno (
   id,
   accno,
   accname,
   opendate,
   currencysname,
   balance,
   lbalance,
   accklid,
   accval,
   accvalcode )
AS
select
  acc.ID,
  acc.ACC_NO as AccNo,
  acc.NAME as AccName,
  acc.OPEN_DAT as OpenDate,
  'AHA' as CurrencySName,
  T.OSTAT as Balance,
  T.POK_OSTAT as LBalance,
  acc.kli_id as accklid,
  av.val_name as accval,
  av.valute as accvalcode
from
  Account acc,
  tenostat t,
  avalute_t av
where
  (CLOSE_DAT IS NULL)
  and acc.val_acc=av.valute
  and (T.ACC_ID = acc.ID)

order by ID
/

