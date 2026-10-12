select 
  id
, transactiondate TDate
, DebitID
, DebitAccNo  DAccNo
, DebitCurrencyID D$
, CreditID
, CreditAccNo CAccNo
, CreditCurrencyId C$
, DebitAmount DAmount
, CreditAmount CAmount
, LAmount
, OperationCode OType
--, No
, Name

from transactions
--where transactiondate='7-jun-3'


;
