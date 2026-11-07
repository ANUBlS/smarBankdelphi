"""Verbatim SQL for the off-balance settings screens (Out_balancerefeditx, Out_Tuningacctypes, out_Avalute).
Lines are kept exactly as in the .dfm SQL.Strings (joined with CRLF like TStrings.Text)."""

# Packages/Out_balancerefeditx/Ocx/BalanceRefEditImpl1.dfm:425-429 BalanceDataSet. Line [1] is replaced by
# ComboBoxPlanChange BalanceRefEditImpl1.pas:409-421 ('out_bal_spr1 b' .. 'out_bal_spr4 b').
BALANCE_SQL_LINES = ["select b.*, b.rowid from ", "OUT_bal_spr1 b", "", "Order by BAL_CN"]
BALANCE_PLAN_LINES = ["out_bal_spr1 b", "out_bal_spr2 b", "out_bal_spr3 b", "out_bal_spr4 b"]   # :412-415
BALANCE_PLAN_TABLES = ["out_bal_spr1", "out_bal_spr2", "out_bal_spr3", "out_bal_spr4"]

# BalanceRefEditImpl1.dfm:516-520 CloseTypesData (declared, never opened by the form - not executed by the web either)
SQL_CLOSE_TYPES = "\r\n".join(["select ID, DisplayName from CLOSE_ACC_TYPE", "where Visible = 1", "order by ID"])

# Packages/Out_Tuningacctypes/TuningAccTypesImpl.dfm:149-154 Account_Types
SQL_ACCOUNT_TYPES = "\r\n".join(["select", "  AT.* ,", "  AT.RowID", "from", "  Out_Account_Flags AT  "])

# Packages/out_Avalute/out_AvaluteImpl1.dfm:1234-1236 OrDS_Avalute_T (the visible grid DBGridAvalute_T)
SQL_AVALUTE_T = "\r\n".join(["select a.rowID, a.* from out_avalute a", "order by a.valute"])
# out_AvaluteImpl1.dfm:1275-1277 OrDS_ValuteSettings (reopened with :Val in OrDS_Avalute_TAfterScroll .pas:514-521)
SQL_VALUTE_SETTINGS = "\r\n".join(["select VS.rowID, VS.* from ValuteSettings VS", "where VS.Valute=:Val"])
# out_AvaluteImpl1.dfm:1184-1203 Accounts (ListSource of CBoxKREDIT / CBoxDebet)
SQL_AVALUTE_ACCOUNTS = "\r\n".join(["Select", "  0 as status, ", "  0 as ID,", "  'YOX' as acc_no", "from", "  Dual     ", "",
                                    "Union   ", "", "Select", "   1 as status, ", "   ID,", "   acc_no ", "From ", "   out_Account",
                                    "", "Order by", "   status,acc_no", ""])
# out_AvaluteImpl1.dfm:986-989 AvaluteDataSet - only bound to Panel2/DBGrid1/DBNavigator1, which are all Visible = False
# (dfm:40, 56, 158). Kept for reference, not executed by the web.
SQL_AVALUTE_HIDDEN = "\r\n".join(["select a.rowid,a.*  from out_AVALUTE a", "", ""])
