# Parity – Off-balance balance group

Modules: `Packages/Out_Balance` (TOut_Balance, {BD77DB0C-…}), `Packages/Out_todaybalance/ocx` (TFrmTodayBalance, {06F8748C-…}),
`Packages/Out_BalanceAnalys` (TFormBalanceAnalys, **same CLSID as BalanceAnalys** {3F8A831B-…}).
Web: tree section "Off-balance" (en) / "Balansdankənar" (az) / "Внебаланс" (ru); routes `/m/out-balance`, `/m/out-todaybalance`,
`/m/out-balanceanalys`; API `/api/out-balance`, `/api/out-todaybalance`, `/api/out-balanceanalys`.
SQL is generated verbatim from the Out_ DFMs (`api/app/out_bal_sql.py`, `out_tb_sql.py`, `out_ba_sql.py`, rel-path:line cited);
logic shared with the on-balance ports through flavour configs (`balance.py` BAL/OBAL, TB/OTB, BA/OBA) only where the Delphi code is identical.

| Delphi | Web | Notes |
|---|---|---|
| Out_Balance: logic = Balance (diff of sb_InitRpt etc. empty), cursor package `out_SB_BALANCEFILIDS` | OBAL config | sb_GetSumBalance BranchID -1 as in Delphi |
| Out_BalanceImpl.dfm:388 BtnCompBalanceSettings, no OnClick | button visible, does nothing; `/comp/settings` → 403 | |
| Out_todaybalance Balance_/Account_/Transaction_Selections (TodayBalanceImpl.pas:412-489) | same `tb_*_sql` functions | Out DFM lines BalanceData 20, AccountData 4/10/17/18/21, TransactionsData 15 have **no %s** → Format leaves them; always `out_archost`/`out_provarch`, account grid always non-Pok amounts. Ported as is |
| Out SBExecuteClick :551 `Get_BankWorkDate` (max(Operkurs.dat) <= date) | `_target()` when `workdate` set | on-balance switched to the picked date (H.R. 16.09.2012); Out did not. NULL → 30.12.1899 (Integer(Trunc(NULL))) |
| Out BankInfo query without `:a` | `bank_bind=False` | |
| Out_BalanceAnalys: no credbal_acc/debtbal_acc grids | `balacc:false`, `/balacc` 404 | |
| Balances filter `' AND b.bal_cn in (…)'` (no accgroup) | `ba_balance_sql(with_group=False)` | |
| Transaction select has no kreditbalans/debetbalans | – | |
| Shared CLSID | modules.json key `{3F8A…}@Out`, tree Action `#16@Out`, `slugFor(clsid, params)` | rights check still `checkmodright(BalanceAnalys CLSID)` exactly as Delphi |

Tests: `api/tests/test_out_balance.py` (4). Screenshots: 72-out-balance.png, 73-out-today-balance.png, 74-out-today-checking.png, 75-out-balance-analysis.png.

Unverified (no DB): bodies of `out_SB_BALANCEFILIDS`, out_ table contents; QuickReport layouts rendered as grids/PDF.
Note: today's off-balance postings in `out_provdoc` are not shown by Out_todaybalance (TransactionsData always reads `out_provarch`) – Delphi behaviour.
