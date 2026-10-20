"""Verbatim SQL of NewDepositsApplyMoney.bpl (NewDepositsDMApplyMoneyImpl.dfm, prefix A_), NewDepositsExtractMoney.bpl
(NewDepositsDMExtractMoneyImpl.dfm, prefix E_) and the shared delayed-transactions viewer
(NewDepositsCommon/NewTemporaryTransactionsFormImpl.dfm, TrDelayed_Show)."""
from .dep_sql import text

# Tranches (dfm:5-10) - NewDepositsDMApplyMoneyImpl.dfm
A_SQL_TRANCHES = text(['SELECT id, hdate, total, trid,description',
    '  FROM dm_tranches',
    '  where id# = :ContractID',
    'order by hdate'])
# DebitAccs (dfm:54-68) - NewDepositsDMApplyMoneyImpl.dfm
A_SQL_DEBITACCS = text(['select ',
    '       id,',
    '       acc_no,',
    '       name',
    'from ',
    '  account ',
    'where ',
    '   close_dat is null',
    '   and  id=:custid',
    '',
    '',
    '',
    ''])
# DepositInfo (dfm:102-117) - NewDepositsDMApplyMoneyImpl.dfm
A_SQL_DEPOSITINFO = text(['select',
    '     cust.name,',
    '     cont.contractno,',
    '     cont.interest,',
    '     cont.amount,',
    '     cont.currency,',
    '     cont.customerid,',
    '     trunc(sysdate) as opdate ',
    'from customers cust,',
    '     dm_contracts cont',
    'where',
    '   cont.id = :ContractID and ',
    '   cust.id = cont.customerid',
    '  '])
# CustAcc (dfm:170-173) - NewDepositsDMApplyMoneyImpl.dfm
A_SQL_CUSTACC = text(['select clientaccid from dm_contract_accounts',
    'where id# = :Contractid'])
# ClientAccs (dfm:196-217) - NewDepositsDMApplyMoneyImpl.dfm
A_SQL_CLIENTACCS = text(['select ',
    '       -1 as id,',
    "       'Seçilməyib' as acc_no",
    'from ',
    '  account ',
    '',
    'union',
    '',
    'select ',
    '       id,',
    '       acc_no',
    'from ',
    '  account ',
    'where ',
    '    close_dat is null and  ',
    '    kli_id=:custid and',
    "    sim_otcet in('0','100','300','331','333','334','336','337','338','339') and ",
    '    bal_cn1 in(3801,3811,3812,3709,3707)'])
# AccNoOstat (dfm:236-238) - NewDepositsDMApplyMoneyImpl.dfm
A_SQL_ACCNOOSTAT = text(['select ostat from tenostat where acc_id=:accid'])
# Payments (dfm:5-12) - NewDepositsDMExtractMoneyImpl.dfm
E_SQL_PAYMENTS = text(['SELECT id,  hdate, facticaldebt, interestdebt,clientdebt,trid, inttrid,tranchesid,description',
    '  FROM dm_payments',
    '  where id# = :ContractID',
    'order by hdate'])
# CreditAccs (dfm:81-95) - NewDepositsDMExtractMoneyImpl.dfm
E_SQL_CREDITACCS = text(['select ',
    '       id,',
    '       acc_no,',
    '       name',
    'from account ',
    'where close_dat is null',
    'and  bal_cn1 in ( select accgroup from ',
    'dm_acc_zone_info where zoneid = (select zoneid from dm_acc_zones',
    "where name = 'Account'))",
    'order by acc_no',
    '',
    '',
    ''])
# DepositInfo (dfm:121-144) - NewDepositsDMExtractMoneyImpl.dfm
E_SQL_DEPOSITINFO = text(['select',
    '     cust.name,',
    '     cont.amount,',
    '     cont.currency,',
    '     cont.customerid,',
    '     cs.facticaldebt,',
    '     cs.facticalinterestdebt,',
    '    (select ostat from tenostat where acc_id=ca.clientaccid) ostat',
    'from customers cust,',
    '     dm_history_currstate cs,',
    '     dm_contracts cont,',
    '     dm_contract_accounts ca',
    'where',
    '   cont.id = :ContractID ',
    '  and ',
    '   cust.id = cont.customerid',
    '  and ',
    '   cs.id# = :ContractID ',
    '  and',
    '   ca.id# = :ContractID '])
# CustAcc (dfm:192-205) - NewDepositsDMExtractMoneyImpl.dfm
E_SQL_CUSTACC = text(['select clientaccid ',
    '       ,dm_stored_programs.GetContractAccount(ContractAccID) as ContractAccNo',
    '       ,dm_stored_programs.GetContractAccount(InterestAccID) as InterestAccNo',
    '       ,dm_stored_programs.GetContractAccount(ClientAccID)   as ClientAccNo',
    'from dm_contract_accounts',
    'where id# = :Contractid'])
# Transactions (dfm:274-292) - NewTemporaryTransactionsFormImpl.dfm
SQL_DELAYED = text(['select',
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
    '    CANPROCESS,',
    '    PARENTID',
    '  from DM_DELAYED_TRANSACTIONS',
    ' ',
    ' '])
