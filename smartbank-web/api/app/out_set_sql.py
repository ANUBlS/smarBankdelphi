"""Verbatim SQL for the off-balance settings screens (Out_balancerefeditx, Out_Tuningacctypes, out_Avalute).
Lines are kept exactly as in the .dfm SQL.Strings (joined with CRLF like TStrings.Text)."""

# Packages/Out_balancerefeditx/Ocx/BalanceRefEditImpl1.dfm:425-429 BalanceDataSet. Line [1] is replaced by
# ComboBoxPlanChange BalanceRefEditImpl1.pas:409-421 ('out_bal_spr1 b' .. 'out_bal_spr4 b').
BALANCE_SQL_LINES = ["select b.*, b.rowid from ", "OUT_bal_spr1 b", "", "Order by BAL_CN"]
BALANCE_PLAN_LINES = ["out_bal_spr1 b", "out_bal_spr2 b", "out_bal_spr3 b", "out_bal_spr4 b"]   # :412-415
BALANCE_PLAN_TABLES = ["out_bal_spr1", "out_bal_spr2", "out_bal_spr3", "out_bal_spr4"]

# BalanceRefEditImpl1.dfm:516-520 CloseTypesData (declared, never opened by the form - not executed by the web either)
SQL_CLOSE_TYPES = "\r\n".join(["select ID, DisplayName from CLOSE_ACC_TYPE", "where Visible = 1", "order by ID"])
