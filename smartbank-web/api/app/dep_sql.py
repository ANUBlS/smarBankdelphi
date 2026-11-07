"""Verbatim SQL of the production deposits module DepositsManager_New
(Packages/DepositsManager_New/DMDepositManagerImpl_new.dfm, TDMDepositsManager_new).

SQL.Strings lines are joined with CRLF as DOA sends them. :OrderField is a DOA substitution variable (otSubst,
Variables.Data type 1, dfm:287-289); DataModuleCreate sets it to 'cont.id' and nothing changes it afterwards."""

CRLF = "\r\n"


def text(lines):
    return CRLF.join(lines)


# Valutes (DMDepositManagerImpl_new.dfm:12-15)
SQL_VALUTES = text(['select valute,valu_name ',
    'from avalute'])
# Filials (DMDepositManagerImpl_new.dfm:35-39)
SQL_FILIALS = text(['select id,name from ',
    'filial',
    'order by id '])
# DepositTypes (DMDepositManagerImpl_new.dfm:59-62)
SQL_DEPOSITTYPES = text(['select id,type',
    'from sbcm_deposit_Types_new'])
# Categories (DMDepositManagerImpl_new.dfm:83-85)
SQL_CATEGORIES = text(['select id,Category from sbcm_categories_new'])
# persons (DMDepositManagerImpl_new.dfm:105-107)
SQL_PERSONS = text(['select id,name from sbcm_persons_new'])
# BankDate (DMDepositManagerImpl_new.dfm:125-127)
SQL_BANKDATE = text(['select tek_dat from sysdat'])
# FilialID (DMDepositManagerImpl_new.dfm:143-145)
SQL_FILIALID = text(['select kod_fil from bankinfo'])
# users (DMDepositManagerImpl_new.dfm:168-171)
SQL_USERS = text(['select id,name from user$',
    'where id in (select sid# from sbcm_contracts_new group by sid#)'])
# Tranches (DMDepositManagerImpl_new.dfm:192-197)
SQL_TRANCHES = text(['SELECT total,hdate,reserve',
    '  FROM sbcm_tranches_new',
    '  where id# = :ContractID',
    'order by hdate'])
# DepositsData (DMDepositManagerImpl_new.dfm:228-285)
SQL_DEPOSITSDATA = text(['select cont.rowid,',
    '       cont.id,',
    '       cont.contractno,',
    '       sbcm_stored_programs_new.Get_ContractAccount(acc.contractaccid) as ContractAccNO,',
    '       sbcm_stored_programs_new.Get_ContractAccount(acc.interestaccid) as InterestAccNO,',
    '       av.val_name,',
    '       sbcm_stored_programs_new.Get_ContractAccountName(acc.contractaccid) as CustomerName,',
    '       cont.opendate,',
    '       cont.closedate,',
    '       cont.amount,',
    '       cont.amount*tmp.ostat as ekamount,',
    '       sbcm_stored_programs_new.GetpercentCollection(cont.id) as interest,      ',
    '       (select sum(facticaldebt) from sbcm_contract_state_new where id#=cont.id) as facticaldebt ,',
    '       (select sum(facticaldebt) from sbcm_contract_state_new where id#=cont.id) *tmp.ostat as ekfacticaldebt,',
    '       (select sum(facticalinterestdebt) from sbcm_contract_state_new where id#=cont.id) as facticalinterestdebt,',
    '       (select sum(facticalinterestdebt) from sbcm_contract_state_new where id#=cont.id) *tmp.ostat as ekfacticalinterestdebt,',
    '       (select distinct stopcalculationdate from sbcm_contract_state_new where id#=cont.id) as stopcalculationdate,',
    '       cont.currency,',
    '       cont.personaltype,',
    '       cont.clienttype,',
    '       cont.branchid,',
    '       cont.contracttype,',
    '      (select distinct calculationenabled from sbcm_contract_state_new where id#=cont.id)as status,',
    '       cont.customerid,',
    '       cont.sid# as usid',
    'from sbcm_contracts_new cont,',
    '     sbcm_contract_accounts_new acc,',
    '     avalute av,',
    '     temprate tmp',
    'where acc.id# = cont.id and',
    '      cont.currency = av.valute and',
    '      cont.currency = tmp.val_kod and ',
    '      cont.type# = 3 ',
    '',
    'order by :OrderField     ',
    '  '])
