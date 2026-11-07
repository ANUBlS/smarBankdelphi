"""Verbatim SQL of Packages/BBPayings (TBBPayingsForm), generated from the DFMs by migration/tools/gensql.py (file:line of the dataset object).
Line structure = Delphi TStrings (SQL[i] indices). Do not edit."""

# BBPayings/UnitDataModBBPayings.dfm:7 ODS_ABNServices (TOracleDataSet)
SQL_BB_ODS_ABNSERVICES = 'SELECT a.id, b.name abn_name, a.contract_id, c.contract_num, a.reg_time, \n  a.srv_id, s.name service, a.amount, a.amount_eqv, a.curr_code, \n  a.status, a.done_time, a.sys_date, \n  paymethod\n  FROM bb_abn_services a, bb_contracts c, bb_services s, bb_abonents b\n  where a.contract_id =c.id and a.srv_id =s.id and c.abn_id=b.id\n   and (sys_date>=(:StDate-1) and sys_date<=(:EndDate))'

# BBPayings/UnitDataModBBPayings.dfm:102 ODS_Contracts (TOracleDataSet)
SQL_BB_ODS_CONTRACTS = 'select c.*, a.name \nfrom BB_Contracts c, BB_Abonents a\nwhere c.ABN_ID=a.ID'

# BBPayings/UnitDataModBBPayings.dfm:127 ODS_Services (TOracleDataSet)
SQL_BB_ODS_SERVICES = 'select * from BB_Services'
