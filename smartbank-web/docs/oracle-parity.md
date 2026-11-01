# Oracle parity matrix (Delphi → web API)

Goal: each web API sends Oracle the **same** SQL text (copied from the .dfm/.pas files), the same package/procedure
calls with the same parameters, in the same order, with the same commits and rollbacks as the Delphi client.

Status values: **identical** · **fixed** (was different or missing, now matches) · **differs (deliberate)** ·
**not ported** · **web-only** (an extra read the web needs; Delphi has no matching call).

Tests: `api/tests/test_accounts_oracle_parity.py` uses a recording fake connection (`Rec`) to check SQL text, binds,
package.procedure names, named parameters and commit order. When `Packages/Accounts` is checked out, the tests also
re-read each dataset's SQL from the .dfm files (`tools/dfmdump.py`) and SAccountsQuery from the .pas file. `DB_MODE=mock`
is covered by the same file and by `tests/test_accounts.py`.

DOA facts used below: `SBOperationDay`/`SBUTIL` packages use `ParameterMode = pmNamed`; `SB_ACA` (Accounts DM) uses
pmPositional; `TOracleSession.Preferences.ZeroDateIsNull = True` (default), so Delphi `NullDate` (0.0) is bound as NULL.

## Accounts (`Packages/Accounts` → `api/app/accounts.py`, `/api/accounts`)

| # | Delphi (file:line) | Oracle operation | API | Status | Note |
|---|---|---|---|---|---|
| 1 | sbMainForm_Unit.pas:1029 AccCheck | `sb_aca.checkmodright(CLSID)` | every `/api/accounts/*` (sb.py:166) | identical | Delphi checks once when the module opens; the web checks on every request (same call). |
| 2 | AccountMainFormImpl.pas:254-298 SAccountsQuery | main list SQL | `GET /api/accounts` | identical | |
| 3 | AccountMainFormImpl.pas:559-603 BuildAccsQuery | filter/order text added to SAccountsQuery | `GET /api/accounts` | **fixed** | Was bind variables (`:bal_cn`, `:customer_id`, `:currency_id`, `:filial_id`, `:flag_like`). Values are now written into the text the way Delphi's `Format(' AND (acc.BAL_CN1 = %d)'#13#10, …)` does it (`int()` keeps the text safe) and `' AND (acc.tipacc like ''%X%''  )'#13#10`. One difference: a flag symbol `'` is doubled (in Delphi it would break the SQL). |
| 4 | AccountMainFormImpl.pas:606-623 RefreshExecute | `AccFlagsData.Refresh` after Open | `GET /api/accounts` (offset 0) | **fixed (was missing)** | The response now also has `acc_flags`. |
| 5 | AccountDataModuleImpl.dfm:505 AccFlagsData | `SELECT symbol, name, description\n  FROM account_flags` | `/lookups`, list refresh | **fixed** | Whitespace: Delphi has 2 spaces before FROM; the web had 1. |
| 6 | AccountDataModuleImpl.dfm:556 AccountFlagsData | same text | `GET /{id}` (flags list) | **fixed** | Same as #5 (`SQL_ACCOUNT_FLAGS`). |
| 7 | AccountDataModuleImpl.dfm:12/358/396/434 SAccsData1-4 | `select * from bal_sprN\norder by bal_cn` | `/lookups` | identical | |
| 8 | AccountDataModuleImpl.dfm:50 CustomersData | customers SQL | `/lookups` | identical | |
| 9 | AccountDataModuleImpl.dfm:89 AVALUTE | currency SQL | `/lookups` | identical | |
| 10 | AccountDataModuleImpl.dfm:121 REPORT_SYMBOL | report symbol SQL | `/lookups` | identical | |
| 11 | AccountDataModuleImpl.dfm:472 FILIAL | filial SQL | `/lookups` | identical | |
| 12 | AccountPropertiesForm_Unit.dfm:563 AccountsData | pair-account SQL (`from\n ACCOUNT acc`) | `GET /pair-lookup` | **fixed** | Whitespace: Delphi has 1 space before ACCOUNT; the web had 2. The web wraps the verbatim SQL in a filter/rownum select (a lookup over a large table). |
| 13 | AccountPropertiesForm_Unit.pas:178-188 New | `CustomersData.Refresh` | `GET /new-defaults` | **fixed (was missing)** | Now re-runs the customers SQL and returns `customers`; the front end uses this list for the new-account dialog. |
| 14 | AccountPropertiesForm_Unit.pas:182 / SBCore Sb_GetSystemDate | `SBOP.get_date` | `GET /new-defaults` | identical | Order: customers → get_date → getuserfilialid, the same as Delphi. |
| 15 | AccountPropertiesForm_Unit.pas:283 FormActivate | `SB_ACA.getuserfilialid` (positional, no args) | `GET /new-defaults` | identical | |
| 16 | AccountPropertiesForm_Unit.pas:221 FillCBL | `SBUTIL.FlagExsist(AccountType=>, FlagChar=>)` per flag | `GET /{id}` | identical | |
| 17 | AccountDataModuleImpl.dfm:163 LockingMode=lmCheckImmediate + Edit | DOA row lock `select * from ACCOUNT where rowid = :doa__rowid for update nowait` | `PUT /{id}` | **fixed (was missing)** | DOA generates this SQL itself (it is not in the .dfm). The web locks just before saving, not when the dialog opens, because the web holds no connection between requests. The web first looks up the rowid by ID, which the Delphi dataset already had. A lock held by another session raises ORA-00054, as in Delphi. |
| 18 | AccountDataModuleImpl.pas:95-133 ApplyRecord 'I' → SBAccount.pas Sb_AddAccount | `SBOP.add_account(customerid, op_id=0, accno, currencyid, NAME, open_dat, balcn, LIMIT, close_dat=NULL, filial, sim_otcet, pair_acc, bal_cn2, bal_cn3, bal_cn4, typeacc)` then `Sb_Commit` | `POST /api/accounts` | identical | `close_dat` = NullDate → NULL (ZeroDateIsNull). |
| 19 | ApplyRecord 'U' → Sb_EditAccount | `SBOP.upd_account(v_id, v_… same 15 params)` then `Sb_Commit` | `PUT /{id}` | identical | upd_account sets `close_dat = v_close_dat`, so NULL is sent as in Delphi. |
| 20 | AccountMainFormImpl.pas:813-824 CloseExecute → Sb_CloseAccount | `SBOP.close_account(AccID=>, DoClose=>1)` | `POST /{id}/close` | identical call; **differs (deliberate)** on commit | Delphi does not commit here. The close is committed by the next `Sb_Commit` in the same SmartBank session (any module) or at logoff, which commits by OCI default. The web commits at once. Its pooled connection would otherwise roll the close back when released (python-oracledb rolls back on close), and the change would be lost. The end state in the DB is the same as Delphi's normal path. |
| 21 | AccountMainFormImpl.pas:831-857 ViewTransactions | `SBOP.get_date` | `GET /{id}/transactions` | identical | |
| 22 | AccTransactionsFormImpl.dfm:574 DebitTransactionsData | debit SQL (StartDate, EndDate, DebitAccID) | `GET /{id}/transactions` | identical | |
| 23 | AccTransactionsFormImpl.dfm:477 CreditTransactionsData | credit SQL (CreditAccID, StartDate, EndDate) | `GET /{id}/transactions` | identical | |
| 24 | AccStatesImpl.dfm:201 AccStateData | archost SQL (AccID) | `GET /{id}/states` | identical | |
| 25 | AccountDataModuleImpl.dfm:163 AccountsData design-time SQL | opened by `Active=True`, replaced by BuildAccsQuery at create | — | not applicable | Never reaches Oracle in a way the user can see. |
| 26 | AccountMainFormImpl ToolButton5Click / Button1Click | runs raw SQL typed in a memo | — | not ported | Security: arbitrary SQL from the UI. |
| 27 | AccountMainFormImpl ArestExecute | arrest action | — | not ported | Out of scope of the web Accounts module (a separate function). |
| 28 | — | `SBOP.get_date` in `/lookups`; `SACCOUNTS_QUERY + AND (acc.ID = :acc_id)` re-read in `GET /{id}` and before close; flags SQL in `GET /{id}` | `/lookups`, `GET /{id}`, `POST /{id}/close` | web-only | Read-only. The stateless web reads again what the Delphi dataset had in memory. |

Counts (Accounts): **identical 17** (#1, 2, 7-11, 14-16, 18-24) · **fixed 7** (#3, 4, 5, 6, 12, 13, 17) ·
**differs, deliberate 1** (#20 commit timing) · **still missing 0** · not ported/not applicable 3 (#25-27) · web-only reads (#28).
