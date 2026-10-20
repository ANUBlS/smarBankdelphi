"""Verbatim SQL of SBDM_Contract_new.bpl (Packages/SBDM_Contract_new/dmDepositContract_new_Impl.dfm, TdmDepositContract_new).
SQL.Strings lines joined with CRLF as DOA sends them; dfm line ranges cited per dataset.
Unused by the form (kept for reference): CreditAccs (never opened), DSsbcm_dep_t_Befoperc (never opened), usrs (never opened:
the USERNAME lookup field of DepositPorps therefore stays empty, see docs/PARITY_DEPOSITS.md)."""
from .dep_sql import text

# ClientTypes (dfm:7-11)
SQL_CLIENTTYPES = text(['SELECT id, category',
    '  FROM sbcm_categories_new',
    ''])
# Filals (dfm:34-36)
SQL_FILALS = text(['select id,name from filial'])
# persons (dfm:56-59)
SQL_PERSONS = text(['SELECT id, name',
    '  FROM sbcm_persons_new'])
# valutes (dfm:82-84)
SQL_VALUTES = text(['select valute,valu_name from avalute'])
# Customers (dfm:104-106)
SQL_CUSTOMERS = text(['select id,name from customers'])
# DepositAccs (dfm:126-145)
SQL_DEPOSITACCS = text(['SELECT   ac.id AS id, ac.kli_id AS custid, ac.acc_no AS accno,',
    '         ac.NAME AS clientname, ac.val_acc',
    '    FROM account ac',
    '   WHERE',
    '   kli_id = :CustID and',
    '   val_acc =:val_acc AND',
    '   (ac.bal_cn1 IN (SELECT accgroup',
    '                           FROM sbcm_acc_zone_info_new',
    '                          WHERE zoneid = (SELECT g.zoneid',
    '                                             FROM sbcm_acc_zones_new g',
    "                                            WHERE g.name = 'Deposit'))",
    '         )',
    'and close_dat is null',
    'ORDER BY kli_id,accno'])
# DepositPorps (dfm:185-221)
SQL_DEPOSITPORPS = text(['SELECT cont.rowid,',
    '       cont.opendate, ',
    '       cont.closedate, ',
    '       cont.amount, ',
    '       cont.contractno, ',
    '       cont.contracttype,',
    '       cont.clienttype,',
    '       cont.sid#, ',
    '       cont.branchid,',
    '       cont.Autopr, ',
    '       cont.currency, ',
    '       cont.personaltype,',
    '       cont.customerid,',
    '       cont.capitalperid,',
    '       cont.periodid,',
    '       sbcm_stored_programs_new.GetpercentCollection(cont.id) as interest,',
    '       ointr.overdueinterest,',
    '       ointr.dueinterest,',
    '       acc.contractaccid,',
    '       acc.clientaccid,',
    '       acc.interestaccid,',
    '       acc.booroweraccid,',
    '       acc.BEFO_INTERESTPEYTACCID,',
    '       cont.firstinterestpaydat',
    '  FROM sbcm_contracts_new cont,',
    '       sbcm_overdueinterests_new ointr,',
    '       sbcm_contract_accounts_new acc',
    ' where ',
    '      cont.id = :ContractID and     ',
    '      ointr.id# = :ContractID and',
    '      acc.id# = :ContractID ',
    '    ',
    '       '])
# DepositTypes1 (dfm:370-373)
SQL_DEPOSITTYPES1 = text(['SELECT id, type,withdrawtype',
    '  FROM sbcm_deposit_types_new'])
# ClientAccs (dfm:402-421)
SQL_CLIENTACCS = text(['SELECT   ac.id AS id, ac.kli_id AS custid, ac.acc_no AS accno,',
    '         ac.NAME AS clientname, ac.val_acc',
    '    FROM account ac',
    '   WHERE',
    '    kli_id = :CustID and',
    '   (ac.bal_cn1 IN (SELECT accgroup',
    '                           FROM sbcm_acc_zone_info_new',
    '                          WHERE zoneid = (SELECT g.zoneid',
    '                                             FROM sbcm_acc_zones_new g',
    "                                            WHERE g.name = 'Account'))",
    '         )',
    'and close_dat is null',
    'ORDER BY kli_id,accno',
    ''])
# InterestsAccs (dfm:457-477)
SQL_INTERESTSACCS = text(['SELECT   ac.id AS id, ac.kli_id AS custid, ac.acc_no AS accno,',
    '         ac.NAME AS clientname, ac.val_acc',
    '    FROM account ac',
    '   WHERE',
    '   kli_id = :CustID and',
    '   val_acc =:val_acc AND',
    '   (ac.bal_cn1 IN (SELECT accgroup',
    '                           FROM sbcm_acc_zone_info_new',
    '                          WHERE zoneid = (SELECT g.zoneid',
    '                                             FROM sbcm_acc_zones_new g',
    "                                            WHERE g.name = 'Percent'))",
    '         )',
    'and close_dat is null',
    'ORDER BY kli_id,accno',
    ''])
# CreditAccs (dfm:517-535)
SQL_CREDITACCS = text(['SELECT   ac.id AS id, ac.kli_id AS custid, ac.acc_no AS accno,',
    '         ac.NAME AS clientname, ac.val_acc',
    '    FROM account ac',
    '   WHERE',
    '   (ac.bal_cn1 IN (SELECT accgroup',
    '                           FROM sbcm_acc_zone_info_new',
    '                          WHERE zoneid = (SELECT g.zoneid',
    '                                             FROM sbcm_acc_zones_new g',
    "                                            WHERE g.name = 'Credit'))",
    '         )',
    'and close_dat is null',
    'ORDER BY kli_id,accno',
    ''])
# DepCapperiod (dfm:554-560)
SQL_DEPCAPPERIOD = text(['select id,period,description,periodid from sbcm_depcapitalperiods_new',
    'where periodid = :periodid',
    'order by period'])
# DepPeriods (dfm:593-600)
SQL_DEPPERIODS = text(['select id,period,description,depid,period_type from sbcm_depperiods_new',
    '',
    'where depid = :depid',
    'order by period '])
# BoorowerAccs (dfm:647-668)
SQL_BOOROWERACCS = text(['SELECT   ac.id AS id, ac.kli_id AS custid, ac.acc_no AS accno,',
    '         ac.NAME AS clientname, ac.val_acc',
    '    FROM account ac',
    '   WHERE',
    '    kli_id = :CustID and',
    '    val_acc =:val_acc AND',
    '   (ac.bal_cn1 IN (SELECT accgroup',
    '                           FROM sbcm_acc_zone_info_new',
    '                          WHERE zoneid = (SELECT g.zoneid',
    '                                             FROM sbcm_acc_zones_new g',
    "                                            WHERE g.name = 'Account'))",
    '         )',
    'and close_dat is null',
    'ORDER BY kli_id,accno',
    '',
    ''])
# usrs (dfm:710-712)
SQL_USRS = text(['select id,lower(name) as name from user$'])
# DSBEFO_INTERESTPEYTACC (dfm:730-745)
SQL_DSBEFO_INTERESTPEYTACC = text(['SELECT   ac.id AS id, ac.kli_id AS custid, ac.acc_no AS accno,',
    '         ac.NAME AS clientname, ac.val_acc',
    '    FROM account ac',
    '   WHERE',
    '   kli_id = :CustID and',
    '   val_acc =:val_acc AND',
    '   (ac.bal_cn1 IN (SELECT accgroup FROM sbcm_acc_zone_info',
    'WHERE zoneid = (SELECT g.zoneid',
    'FROM sbcm_acc_zones g',
    "WHERE g.name = 'BefoPercent'))",
    '         )',
    'and close_dat is null',
    'ORDER BY kli_id,accno',
    ''])
# DSsbcm_dep_t_Befoperc (dfm:786-789)
SQL_DSSBCM_DEP_T_BEFOPERC = text(['SELECT *',
    '  FROM sbcm_deposit_types'])
