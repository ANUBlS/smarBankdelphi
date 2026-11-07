"""Verbatim SQL of Delphi Packages/Out_account/ocx (the units compiled by out_account.dpr: AccountImpl, AccountDataModuleImpl,
AccountPropertiesImpl, AccountFlagsImpl, AccountRestState, AccountTransactionsImpl, IntervalImpl). Lines joined with CRLF
(TStrings.Text). Do not edit the text; cite the dfm lines."""

# AccountDataModuleImpl.dfm:140-157 Account. SQL[6] (the empty line) is replaced by ' where '+FilterStr in
# ActionFilterExecute (AccountImpl.pas:946); :title is a DOA substitution variable (Variables.Data type 1, default 'acc_no').
ACCOUNT_SQL_LINES = ["SELECT   ", "   OUT_ACCOUNT.RowID, ID, kli_id, op_id, acc_no, val_acc, NAME, open_dat, close_dat,", "   DECODE (close_dat, NULL, 1, 2) AS statu1, bal_cn1, bal_cn2, bal_cn3,", "   bal_cn4, filial, sim_otcet, tipacc, LIMIT, old_acc_no, pair_acc,", "   insider,tempid,(select name from cm_expert where id=tempid) expert", "FROM OUT_ACCOUNT ", "", "ORDER BY ", "   :title"]

# AccountDataModuleImpl.dfm:7-10 Branches
SQL_BRANCHES = "\r\n".join(["select ID, name from filial ", "order by ID", ""])

# AccountDataModuleImpl.dfm:33-37 Users
SQL_USERS = "\r\n".join(["select ID, Name from user$", "Order by name", "", ""])

# AccountDataModuleImpl.dfm:60-63 Currency
SQL_CURRENCY = "\r\n".join(["select Valute, Valu_Name from out_Avalute", "Order by valute", ""])

# AccountDataModuleImpl.dfm:87-89 AccFlags
SQL_ACC_FLAGS = "\r\n".join(["SELECT symbol, symbol||'     '||description as name", "  FROM OUT_account_flags"])

# AccountDataModuleImpl.dfm:113-116 BalAcc
SQL_BAL_ACC = "\r\n".join(["select to_char(bal_cn) as BAL_CN, BalName from OUT_bal_spr1", "order by bal_cn", ""])

# AccountDataModuleImpl.dfm:262-267 Tenostat (detail of Account, MasterFields id -> acc_id)
SQL_TENOSTAT = "\r\n".join(["select ", "  acc_id, ostat, pok_ostat ", "from ", "  OUT_tenostat ", "where acc_id=:acc_id"])

# AccountDataModuleImpl.dfm:299-304 Lazyrest (opened, not shown on any control)
SQL_LAZYREST = "\r\n".join(["select ", "  acc_id, ostat, pok_ostat ", "from ", "  OUT_lazyrest ", "where acc_id=:acc_id"])

# AccountDataModuleImpl.dfm:343-345 ReportSymbol
SQL_REPORT_SYMBOL = "\r\n".join(["select * from REPORT_SYMBOL", "order by ID"])

# AccountDataModuleImpl.dfm:377-385 PairAccount (BeforeOpen: Filter 'Status = 1', AccountDataModuleImpl.pas:281-289)
SQL_PAIR_ACCOUNT = "\r\n".join(["select", "  ID,", "  acc_no,", "  DECODE (close_dat, NULL, 1, 2) AS status", "from", "  OUT_Account", "order by acc_no", " "])

# AccountDataModuleImpl.dfm:413-414 Sysdat
SQL_SYSDAT = "\r\n".join(["Select tek_dat from sysdat"])

# AccountDataModuleImpl.dfm:441-444 BalAccnew
SQL_BAL_ACC_NEW = "\r\n".join(["select to_char(bal_cn) as BAL_CN, BalName from OUT_bal_spr2", "order by bal_cn", ""])

# AccountDataModuleImpl.dfm:467-470 Customers (cursor :p_result)
SQL_CUSTOMERS = "\r\n".join(["begin", "pkg_report.get_customers(p_result=>:p_result);", "end;"])

# AccountPropertiesImpl.dfm:594-595 OracleDataSet2 (DBLookupComboBox1 on tempid)
SQL_EXPERTS = "\r\n".join(["select*from cm_expert"])

# AccountRestState.dfm:448-460 AccStateData
SQL_ACC_STATE = "\r\n".join(["select", "  arc.DATDATE as ArchiveDate,", "  arc.ACC_ID as AccID,", "  abs(arc.OSTAT) as Amount,", "  abs(arc.POK_OSTAT) as LAmount,", "  abs(arc.OBR_D) as DebitTurnover,", "  abs(arc.POK_OBR_D) as DebitLTurnover,", "  abs(arc.OBR_K) as CreditTurnover,", "  abs(arc.POK_OBR_K) as CreditLTurnover", "from out_archost arc", "where arc.acc_id = :AccID", "order by arc.datdate --desc"])

# AccountTransactionsImpl.dfm:510-528 DebetTransactionsData
SQL_DEBIT_TRANSACTIONS = "\r\n".join(["select", "  p.ID,", "  p.debt as DebitAccID,", "  p.dat as OperationDate,", "  p.ammount as DebitAmount,", "  p.ammount_c as CreditAmount,", "  p.lammount as LAmount,", "  ac.acc_no as CreditAccNo,", "  p.NAME as Destination", "from", "  SMART.out_provarch p,", "  SMART.out_account ac", "where", "  (p.dat between :StartDate and :EndDate)", "  and (p.debt = :AccountID)", "  and (ac.id = p.kredit)", "order by p.dat", " "])

# AccountTransactionsImpl.dfm:595-612 CreditTransactionsData
SQL_CREDIT_TRANSACTIONS = "\r\n".join(["select", "  p.ID,", "  p.kredit as CreditAccID,", "  p.dat as OperationDate,", "  p.ammount as DebitAmount,", "  p.ammount_c as CreditAmount,", "  p.lammount as LAmount,", "  ad.acc_no as DebitAccNo,", "  p.NAME as Destination", "from", "  SMART.out_provarch p,", "  SMART.out_account ad", "where", "  (p.kredit = :AccountID)", "  and (p.dat between :StartDate and :EndDate)", "  and (ad.id = p.debt)", "order by p.dat"])
