"""Verbatim SQL of the DepositsManager_New operation plugins (SBDM_*_new.bpl). Prefix = plugin, dfm line ranges cited.
A_ = SBDM_ApplyMoney_new/DMApplyMoneynewImpl.dfm, E_ = SBDM_ExtractMoney_new/DMExtractMoneyImpl_new.dfm,
TT_ = SBDM_Common_new/TemporaryTransactionsFormImpl_new.dfm (TrDelayed_Show)."""
from .dep_sql import text

# A Tranches (dfm:5-10)
A_SQL_TRANCHES = text(['SELECT id, hdate, total, trid,reserve,description',
    '  FROM sbcm_tranches_new',
    '  where id# = :ContractID',
    'order by hdate'])
# A DebitAccs (dfm:58-88)
A_SQL_DEBITACCS = text(['/*select id,',
    '       acc_no,',
    '       name',
    'from account ',
    'where close_dat is null',
    'and kli_id =:KliID',
    'and  bal_cn1 in ( select accgroup_new from ',
    'sbcm_acc_zone_info_new where zoneid = (select zoneid from sbcm_acc_zones_new',
    "where name = 'Account'))",
    'union all*/',
    'select ',
    '       /*+ FIRST_ROWS_200(account) */',
    '       id,',
    '       acc_no,',
    '       name',
    'from account ',
    'where close_dat is null',
    'and  id=:custid',
    '/*bal_cn1 in ( select accgroup_new from ',
    'sbcm_acc_zone_info_new where zoneid = (select zoneid from sbcm_acc_zones_new',
    "where name = 'InternalBankAccs'))",
    'order by acc_no*/',
    '',
    '',
    ''])
# A DepositInfo (dfm:122-136)
A_SQL_DEPOSITINFO = text(['select',
    '     cust.name,',
    '     intr.interest,',
    '     cont.amount,',
    '     cont.currency,',
    '     cont.customerid',
    'from customers cust,',
    '     sbcm_interests_new intr,',
    '     sbcm_contracts_new cont',
    'where',
    'cont.id = :ContractID and ',
    'cust.id = cont.customerid',
    'and intr.id# = :ContractID '])
# A CustAcc (dfm:172-175)
A_SQL_CUSTACC = text(['select clientaccid from sbcm_contract_accounts_new',
    'where id# = :Contractid'])
# E Payments (dfm:5-10)
E_SQL_PAYMENTS = text(['SELECT id,  hdate, facticaldebt, interestdebt, trid, inttrid',
    '  FROM sbcm_payments_new',
    '  where id# = :ContractID',
    'order by hdate'])
# E CreditAccs (dfm:57-86)
E_SQL_CREDITACCS = text(['/*select id,',
    '       acc_no,',
    '       name',
    'from account ',
    'where close_dat is null',
    'and kli_id =:KliID',
    'and  bal_cn1 in ( select accgroup from ',
    'sbcm_acc_zone_info where zoneid = (select zoneid from sbcm_acc_zones_new',
    "where name = 'Account'))",
    'union all*/',
    'select ',
    '       /*+ FIRST_ROWS_200(account) */',
    '       id,',
    '       acc_no,',
    '       name',
    'from account ',
    'where close_dat is null',
    'and  bal_cn1 in ( select accgroup from ',
    'sbcm_acc_zone_info where zoneid = (select zoneid from sbcm_acc_zones_new',
    "where name = 'InternalBankAccs'))",
    'order by acc_no',
    '',
    '',
    ''])
# E DepositInfo (dfm:112-127)
E_SQL_DEPOSITINFO = text(['select',
    '     cust.name,',
    '     cont.amount,',
    '     cont.currency,',
    '     cont.customerid,',
    '     cs.facticaldebt,',
    '     cs.facticalinterestdebt',
    'from customers cust,',
    '     sbcm_contract_state_new cs,',
    '     sbcm_contracts_new cont',
    'where',
    'cont.id = :ContractID and ',
    'cust.id = cont.customerid',
    'and cs.id# = :ContractID '])
# E CustAcc (dfm:155-165)
E_SQL_CUSTACC = text(['select clientaccid ',
    '       ,sbcm_stored_programs.Get_ContractAccount(ContractAccID) as ContractAccNo',
    '       ,sbcm_stored_programs.Get_ContractAccount(InterestAccID) as InterestAccNo',
    'from sbcm_contract_accounts_new',
    'where id# = :Contractid'])
# TT Transactions (dfm:258-275)
TT_SQL_TRANSACTIONS = text(['select',
    '    DEBITACCNO,',
    '    DEBITCURRENCY,',
    '    CREDITACCNO,',
    '    CREDITCURRENCY,',
    '    TRDATE,',
    '    INBALANCECHAR,',
    '    FLAGS,',
    '    DEBITAMOUNT,',
    '    CREDITAMOUNT,',
    '    NATAMOUNT,',
    '    TRDESCRIPTION,',
    '    CANPROCESS',
    '  from SBCM_DELAYED_TRANSACTIONS_new',
    ' ',
    ' '])


# ------------------------------------------------------------------ SBDM_Prolongation_new
# frmProlongationImpl_new.dfm:389-401 prolongations
P_SQL_PROLONGATIONS = text(['SELECT id, id#, hdate, olddate, newdate',
    '  FROM sbcm_prolongations_new',
    'where id# = :Contractid',
    'order by hdate'])
# frmProlongationImpl_new.dfm:202-212 DepositInf
P_SQL_DEPOSITINF = text(['select closedate from sbcm_contracts_new',
    'where id = :ContractID'])


# ------------------------------------------------------------------ Sbdm_Shedule_new (ScheduleDataModuleImpl_new.dfm)
# sbdm_customers (dfm:5-202)
S_SQL_CUSTOMERS = text(['select * from customers c ,sbcm_contracts_new s',
    'where c.id=s.CUSTOMERID and',
    '           s.id=:id',
    '',
    '     ',
    '',
    ' '])
# OracleDataSet1 (dfm:208-222)
S_SQL_INTERESTS = text(['select * from sbcm_interests_new',
    'where id#=:id'])
# OracleDataSet2 (dfm:228-270)
S_SQL_SCHEDULE = text(['SELECT Z.RowID,Z.*',
    '  FROM SBCM_PAYMENT_SCHEDULE_new Z',
    'WHERE Z.id#=:Id',
    'ORDER BY HDATE'])
# OracleDataSet3 (dfm:295-414)
S_SQL_DEPTYPE = text(['select * from sbcm_contracts_new s,sbcm_deposit_types_new d',
    'where s.CONTRACTTYPE=d.id and',
    '      d.DATEINTERVAL>0 and',
    '      s.id=:v_id',
    ''])


# ------------------------------------------------------------------ SBDM_UntimelyEtMoney_new (frmUntimelyEtMoneyImpl_new.dfm)
# CreditAccs (dfm:629-658)
U_SQL_CREDITACCS = text(['/*select id,',
    '       acc_no,',
    '       name',
    'from account ',
    'where close_dat is null',
    'and kli_id =:KliID',
    'and  bal_cn1 in ( select accgroup from ',
    'sbcm_acc_zone_info_new where zoneid = (select zoneid from sbcm_acc_zones_new',
    "where name = 'Account'))",
    'union all*/',
    'select ',
    '       /*+ FIRST_ROWS_200(account) */',
    '       id,',
    '       acc_no,',
    '       name',
    'from account ',
    'where close_dat is null',
    'and  bal_cn1 in ( select accgroup from ',
    'sbcm_acc_zone_info_new where zoneid = (select zoneid from sbcm_acc_zones_new',
    "where name = 'InternalBankAccs'))",
    'order by acc_no',
    '',
    '',
    ''])
# DepositAccno (dfm:677-693)
U_SQL_DEPOSITACCNO = text(['select ac.id,ac.acc_no,av.VAL_NAME from account ac,',
    '                                  sbcm_categories_new sc,',
    '                                  sbcm_movie_names_new sm,',
    '                                  sbcm_settings_new ss,',
    '                                  sbcm_contracts_new sb,',
    '                                  avalute av where ',
    ' ',
    'sb.ID        =:ContractID             and',
    'ss.CURRENCYID=sb.CURRENCY             and',
    'sc.id        =sm.TYPEID               and',
    "sm.NAME      ='outComeAccForDeposit'  and",
    'sm.id        =ss.PARENTID             and',
    'ac.id        =ss.ACCID                and',
    'ac.VAL_ACC   =av.VALUTE               and',
    'sc.id        =sb.CLIENTTYPE '])
# DepositInfo (dfm:719-758)
U_SQL_DEPOSITINFO = text(['select cust.name,',
    '       sbcm_stored_programs_new.SbcmOpenDate(Cont.ID) as opendate,',
    '       sbcm_stored_programs_new.SBCMGetOldDate(Cont.ID) as closedate,',
    '       sbcm_stored_programs_new.GetpercentCollection(Cont.ID) as annualInt,',
    '       sbcm_payment_new.GetOverduePercent_new(Cont.ID) As OverDueAnnualInt,---tale-sbcm_stored_programs_new.getoverduepercent(Cont.ID) As OverDueAnnualInt,',
    '        --sbcm_stored_programs_new.GetOverduePercentType(Cont.ID) As OverDueAnnualInt,',
    '        sbcm_stored_programs_new.Get_ContractAccount(Acc.ContractAccID) as ContractAccNo,',
    '      sbcm_stored_programs_new.Get_ContractAccount(Acc.ClientAccID) as ClientAccNo,',
    '      sbcm_stored_programs_new.Get_ContractAccount(Acc.InterestAccID) as InterestAccNo,',
    '      cstate.FACTICALDEBT,',
    '      cstate.FACTICALINTERESTDEBT',
    'from sbcm_contracts_new cont,',
    '     sbcm_contract_accounts_new acc,',
    '     sbcm_contract_state_new cstate,',
    'customers cust',
    'where ',
    'Cont.ID = :ContractID and',
    'cust.id = Cont.customerID and',
    'acc.id# = :ContractID and',
    'cstate.id# = :ContractID',
    ' '])
