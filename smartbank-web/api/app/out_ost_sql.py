"""Verbatim SQL of Packages/Out_Statement (TOut_StatementForm), generated from the DFMs by migration/tools/gensql.py (file:line of the dataset object).
Line structure = Delphi TStrings (SQL[i] indices). Do not edit."""

# Out_Statement/Ocx/Out_Stdatamod_Unit.dfm:7 ODSMainState (TOracleDataSet)
SQL_OST_ODSMAINSTATE = 'select\n  ac.id       as AccountId,\n  ac.kli_id   as CustomerId, \n  ac.acc_no   as AccountNumber,\n  ac.op_id    as OperatorId,\n  ac.val_acc  as CurrencyId,\n  ac.name     as AccountName,\n  --c.name      as CustomerName,\n  c.inn       as CustomerVoin,\n  ac.bal_cn1  as BalanceCode,\n  av.val_name as CurrencyName, \n  ac.open_dat as OpenDate,\n  ac.open_dat  as EndDAte,  \n  ac.filial   as Filial\n   \nfrom out_account ac,customers c,avalute av,out_bal_spr1 b  where \n ac.val_acc = av.valute \n and\n ac.kli_id=c.id \n and\n ac.bal_cn1=b.bal_cn \n order by ac.acc_no'

# Out_Statement/Ocx/Out_Stdatamod_Unit.dfm:64 ODSExtractTrans (TOracleDataSet)
SQL_OST_ODSEXTRACTTRANS = ''

# Out_Statement/Ocx/Out_Stdatamod_Unit.dfm:88 RatesDataSet (TOracleDataSet)
SQL_OST_RATESDATASET = 'Select\n   Val_Kod\n  ,Dat\n ,Ostat\n  From Operkurs\nWhere   Val_Kod = :Val_Kod and Dat =:Dat'

# Out_Statement/Ocx/Out_Stdatamod_Unit.dfm:118 RatesDataSetBegin (TOracleDataSet)
SQL_OST_RATESDATASETBEGIN = 'Select\n   Val_Kod\n  ,Dat\n ,Ostat\n  From Operkurs\nWhere   Val_Kod = :Val_Kod and Dat =:Dat'

# Out_Statement/Ocx/Out_Stdatamod_Unit.dfm:154 ODSCurrency (TOracleDataSet)
SQL_OST_ODSCURRENCY = 'select * from out_avalute'

# Out_Statement/Ocx/Out_Stdatamod_Unit.dfm:187 ODSFilial (TOracleDataSet)
SQL_OST_ODSFILIAL = 'select * from filial order by id'

# Out_Statement/Ocx/Out_Stdatamod_Unit.dfm:205 ODSUsers (TOracleDataSet)
SQL_OST_ODSUSERS = 'select * from user$'

# Out_Statement/Ocx/Out_Stdatamod_Unit.dfm:222 ODSLogo (TOracleDataSet)
SQL_OST_ODSLOGO = 'SELECT *  FROM bankinfo'

# Out_Statement/Ocx/Out_Stdatamod_Unit.dfm:236 ODSSysdat (TOracleDataSet)
SQL_OST_ODSSYSDAT = 'Select tek_dat from sysdat'

# Out_Statement/Ocx/Out_Stdatamod_Unit.dfm:247 ODS_GetExtraction (TOracleDataSet)
SQL_OST_ODS_GETEXTRACTION = 'select OUT_SB_Statement.GetExtraction(\n    :bDate,\n    :eDate,\n    :ClientID,\n    :AccountNo,\n    :BalanceNo,\n    :BranchID,\n    :CurrencyID,\n    :UserID) str from dual\n'

# Out_Statement/Ocx/Out_Stdatamod_Unit.dfm:279 ODS_ExtractionTrans (TOracleDataSet)
SQL_OST_ODS_EXTRACTIONTRANS = 'select OUT_SB_Statement.Extraction_Trans(\n    :bDate,\n    :eDate,\n    :ClientID,\n    :AccountNo,\n    :BalanceNo,\n    :BranchID,\n    :CurrencyID,\n    :UserID) str from dual\n'
