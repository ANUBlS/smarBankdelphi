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

## Login (`Packages/SBCommon50/UnitSBOraLogOn`, `SBOracleLogOn`, `Packages/sboapi50/SBOInitPkg`, `Programs/SmartBank/sbMainForm_Unit` → `api/app/sb.py`, `/api/login`, `/api/session`, `/api/system`, `/api/tree`)

The web keeps its own login design: one Oracle session per web user, the 45-minute idle logout that closes that
session, the app-side login audit, the lock after 5 failures and the admin unlock. Only the Oracle calls, their order
and their parameters follow Delphi. Tests: `api/tests/test_login_oracle_parity.py` (recording backend/connection;
the dataset SQL is re-read from the .dfm files, using `git show HEAD:` in a sparse checkout).

| # | Delphi | Oracle call | Web | Status | Notes |
|---|---|---|---|---|---|
| 1 | UnitSBOraLogOn.pas:314-315 btOkClick | `OracleSession1.LogOn`, password `'KLs'+pw+'#1$'` | `sb.logon` connect 1 | identical | |
| 2 | :317-329 | ORA-28001 → TfmPassChange, `SetPassword(edNewPass.Text)`, LogOn | connect 1 with `newpassword` (OCI password change) | differs, deliberate | Delphi sends the **unwrapped** new password and then logs on with the wrapped one (:397), so the next logon fails: a Delphi bug. The web sends `'KLs'+new+'#1$'`. TfmPassChange makes no Oracle call (VerifyPassword is defined but not called). |
| 3 | :349, UnitSBOraLogOn.dfm OracleDataSet1 | `select * from sba_objinf where id = (…obj=user)` | connect 1 | identical | |
| 4 | :350, OracleDataSet4 | `select … as ex from dba_users a where \n user_id=UID` | connect 1 | fixed | The SQL text was missing the line break. Kept web behaviour: an error (no grant on dba_users) gives the warning `login.warn_expiry_unavailable` instead of stopping the logon. |
| 5 | :360-363 | `ex < 5` → warning | `login.warn_password_expires` | identical | |
| 6 | :370-386 | `finger3 = 1` → fingerprint scan (BSDK) | 403 `FINGERPRINT_REQUIRED` | not ported | No fingerprint reader in the browser. |
| 7 | :390 | `OracleSession1.Connected := False` | close connect 1 | fixed | The web used the form session as the working session. |
| 8 | SBOracleLogOn.pas CheckForExpire | SBSession `LogOn; LogOff` | connect 2 + close | fixed | was missing |
| 9 | SBOInitPkg.pas:47-67 Sb_Initialize | `SBSession.LogOn` | connect 3 (the per-user web session) | fixed | separate session, as in Delphi |
| 10 | sboapiDataModuleImpl.dfm SBSession `IsolationLevel = ilReadCommitted` | `alter session set isolation_level = read committed` | connect 3 | fixed | was missing. The statement is the DOA behaviour reconstructed (the DOA source is not in the repo). |
| 11 | client info | v$session.program = the client exe | `program="SmartBank.exe"` (`ORACLE_PROGRAM`, empty = driver default) | fixed | DOA/OCI reports the exe name. No DBMS_APPLICATION_INFO calls exist in the Delphi sources. |
| 12 | SBOInitPkg.pas:64 | `SBLOGIN.GetSessionID` | connect 3 | identical | |
| 13 | — | `SBLOGIN.UserID` | removed | fixed | The main program never calls it at logon. |
| 14 | DBIniFile.pas:147-151 | `SBCONFIG.OpenFile([FileName])` once | `ini_open` | identical | |
| 15 | PluginSrv.pas:881-900 | `ReadValue('<PluginManager>\Packages','Count')`, `ItemN` | `load_plugins` | identical | |
| 16 | TreeViewIni.pas:189-205, PluginTreeView.pas:353, :221 | per node `Count`, `Caption` (`<no data>`), `Action`, then `Icon` only for plugin nodes (of NodeByPlugin), then the children | `build_tree` | fixed | The web read `Icon` for every node and a web-only `CaptionKey`. `CaptionKey` is now off by default (`TREE_CAPTION_KEYS=1` turns it on). |
| 17 | sbMainForm_Unit.pas:463, PluginTreeView.pas:111-128 | `sb_aca.checkmodright` only when a node is opened | removed from the tree load | fixed | Nodes are `allowed: true`. A denied open gets 403 `error.access_denied`. `TREE_PRECHECK_RIGHTS=1` or `HIDE_DENIED_NODES=1` restore the web-only pre-check. |
| 18 | :1029-1032 AccCheck | `sb_aca.checkmodright([GUID])` | `/api/modules/open` | identical | |
| 19 | :451 Sb_LogEnable (SBOutput.pas) | `dbms_output.enable` | `main_form_init` | fixed | was missing. The 20000 buffer is the DOA default (reconstructed). |
| 20 | :453 Sb_LogPutLine | `dbms_output.put_line('SmartBank 4.0, Copyright 1996-2016, Smart Systems Technology, Ltd.')` | `main_form_init` | fixed | was missing |
| 21 | :465-468 InitAlertThread | `dbms_alert.register` for `MessageBroadcast`, `MsgToUser_<sid>`, `SessionShutdown`, `Shutdown_<sid>` | `main_form_init` | fixed | was missing. A failure does not stop the login (it runs in TAlertThread). |
| 22 | AlertThread.pas / SBAlert.pas | `dbms_alert.waitany(name, message, status, timeout=0)` loop; a shutdown alert stops the thread | `/api/session` poll → `alerts` (toast in app.js) | fixed | Timing differs deliberately: the web polls every 30 s instead of every 2 s. A shutdown alert only shows its message, as in Delphi (InitiateShutdown does not exit). |
| 23 | :823-839 LogTimer (60000 ms) | `dbms_output.get_line` until status ≠ 0 | `/api/session` poll, at most every 60 s → `log` | fixed | |
| 24 | :477 Sb_GetSystemDate | `SBOP.get_date` | `main_form_init` → `/api/system.operation_date` | identical | now read once at start-up |
| 25 | :997-998 FormShow | `select get_app_header from dual` | `main_form_init` | identical | |
| 26 | :1002, :1004 | `SBLOGIN.get_lastlogintime` twice | `main_form_init` → `db_last_login_time` | fixed | was missing. The screen still shows the app-side audit times. |
| 27 | :710-712 FormActivate | `select * from companies order by company_name` | `main_form_init` | fixed | was missing |
| 28 | CompanySelection.pas | `complist_id`, `DBMS_SESSION.SET_CONTEXT` | `/api/companies` | identical | |
| 29 | PasswordChange_unit.pas | `SB_ADM.verify_password`, `SBLOGIN.ChangeUserPsw` | `/api/password` | identical | |
| 30 | :483 TranslateAllCompForms | `SL_CONTROL.TranslateWords` per control | — | not ported | UI translation; the web has its own locales. Packages/SBTranslate/SBTranslateProc.pas is empty at HEAD (only `__history` has the source). |
| 31 | Setup_RegionalSettings | none (Windows SetLocaleInfo) | — | not applicable | no Oracle call |
| 32 | ReconnectExecute, Sb_CheckFatalError, ForTerminateApp | reconnect; disconnect on fatal error; `select 'TRUE' …` keep-alive | — | not ported | The keep-alive timer is disabled in Delphi. A broken web session ends through the idle logout or logout. |
| 33 | — | `SB_ACA.isadm`; unlock (`all_users` + `ALTER USER … ACCOUNT UNLOCK` in the admin's session); `SYSDAT`/`BANKINFO` header reads (once per session); app audit; idle close | various | web-only | These are the web design features that were kept. |

Counts (Login): **identical 11** (#1, 3, 5, 12, 14, 15, 18, 24, 25, 28, 29) · **fixed 15** (#4, 7-11, 13, 16, 17, 19-23, 26, 27)
· **differs, deliberate 1** (#2, plus the kept tolerance in #4 and the poll timing in #22) · **still missing 0**
· not ported/not applicable 4 (#6, 30, 31, 32) · web-only (#33).

## Transaction Manager

Sources: `Packages/TransactionManager` (TransactionManagerImpl = TM, TransactionPropertiesImpl = TP, CommissionImpl,
TransactionDestinationImpl = TD, TransactionDataModuleUnit = DM). API: `api/app/transactions.py`, SQL: `api/app/tm_sql.py`.
Tests: `api/tests/test_tm_oracle_parity.py` (recording connection; every dataset SQL re-read from the .dfm files).
DOA facts: `SB_TRANSACTION` (DM.dfm:720) and `SB_COMPLEX_TRANSACTIONS` (DM.dfm:891) are `pmNamed`, `SB_ACA` (DM.dfm:994)
is positional. ODS_StatusT and TrDest stream no `LockingMode` and no `CommitOnPost`, so the DOA defaults apply: the record
is locked at Post (`select * from T where rowid = :doa__rowid for update nowait`), the modified columns are written by
ROWID, and DOA commits after the write. That DML is generated by DOA, not stored in the .dfm, so the texts in
`tm_sql.py` (`SQL_STATUST_*`, `SQL_TRDEST_*`) are reconstructed in the same form as the Accounts ones. The DOA savepoint
before the lock is not sent: the web holds no open transaction to roll back to.

| # | Delphi (file:line) | Oracle operation | API | Status | Note |
|---|---|---|---|---|---|
| 1 | TM InitData :546 | Tag=1 datasets: Sysdat, Currency, OperationTypes, branches, Users (DM.dfm) | `GET /init` | identical | Verbatim SQL. |
| 2 | TM.dfm Transactions `Active = True` + ActiveFormCreate :628-654 | Transactions opened at design time with `:TransactionDate` NULL, TITLE `OperationNo` | — | differs (deliberate) | Returns no rows; the web opens it only once there is a date (row 4). |
| 3 | TM ActiveFormCreate :646, DM.dfm:1055 ODS_StatusT | `select s.RowID, s.* from Settings s where upper(name)='TRANSACTION_STATUST'` | `GET /init` | identical | |
| 4 | TM ActionRefreshExecute :587-621, DM.dfm:339 Transactions | UNION SQL, `:TransactionDate` otDate, `:TITLE` otSubst (`' Status desc, '+OrderedTitle` or OrderedTitle) | `POST /list` | **fixed** | The SQL constant had 6 extra blank lines (wrapped-string artifacts in the .dfm that were read as empty items). It now matches the .dfm text exactly. |
| 5 | TM GridTransactionsTitleClick :680-701 | TITLE := column, then Refresh | `POST /list` (title) | identical | |
| 6 | TM GridTransactionsTitleClick :700 `finally SQL[100] := EmptyStr` | blanks the `RejectReason as REJECT_REASON,` line, so the next refresh fails with ORA-01789 | — | differs (deliberate) | This is a Delphi bug, so it is not reproduced. |
| 7 | TM ChBoxStatusTClick :1057-1065 | ODS_StatusT Edit / `Value := 1/0` / Post: lock by rowid, `update Settings set VALUE = :VALUE where rowid = :doa__rowid`, commit | `PUT /status-order` | **fixed** | It was `update Settings s set s.Value … where upper(s.name)=…` with no lock. If there is no TRANSACTION_STATUST row, Delphi would insert one (Edit on an empty dataset). That case is not ported: the web does nothing. |
| 8 | TM ActionLoadFilters (Operations.Execute; Valute.Execute) | Operations, Valute SQL | `GET /init` | identical | |
| 9 | TM ActionStepCommitExecute :1279-1344 | per row `SB_TRANSACTION.transaction_commit(TransactionID, CommitTemp=>true)` + commit | `POST /commit` | identical | Same loop as Customers (`customers.step_commit`). |
| 10 | TM ActionRejectExecute :1347-1387 | per row with status 1/3: `transaction_reject(TransactionID, RejectReason)` + commit; errors counted | `POST /reject` | identical | |
| 11 | TM ActionDeleteExecute :969 | `SB_ACA.CheckObjectAccess('Transaction','delete')` **once** before the loop | `POST /delete` (`first`) | **fixed** | It was called for every row. The client now sends `first=true` only for the first row of an action. |
| 12 | TM ActionDeleteExecute :972-1015 | per row: ODS_VidOPTrDel (`:v_ID` integer); Cnt=1 means a message and skip; otherwise `transaction_delete(TransactionID)` + SBCommit. The error is swallowed only when more than one row is selected, and the commit still runs | `POST /delete` | identical | |
| 13 | TM ActionInsertExecute :656-661 | `CheckObjectAccess('Transaction','insert')` when the editor opens | `POST /editor-open` | **fixed** | It used to run at save. |
| 14 | TM ActionEditExecute :703-708 | `CheckObjectAccess('Transaction','update')`, then Transactions.Edit | `POST /editor-open` | **fixed** | It used to run at save. |
| 15 | CommissionImpl GridCommissionDblClick | omCommission + Insert; **no** access check | `POST /editor-open` (commission) | **fixed** | The web used to send CheckObjectAccess('insert') when a commission was saved. |
| 16 | DM.dfm:727 Commission (FormShow / ButtonRefreshClick) | Commission SQL | `GET /commissions` | **fixed** | Same blank-line artifacts as row 4. The constant now matches the .dfm exactly. |
| 17 | TP FormCreate :615-645, DM.dfm:1083 ODS_Settings | `select value from settings where name='AccNoSearchPos'`; `:SRC_POS := ODS_SettingsVALUE.AsInteger`, then DebitAccData/CreditAccData | `GET /editor-lookups` | **fixed** | When the value is NULL or there is no row, the default is now 0 (AsInteger), not 1. |
| 18 | TP FormCreate / LoadComboData :777 | currencies, CashSymbols, ConvertationSymbols, OperationTypes, Destinations, TrDest, ReportDesc, Country | `GET /editor-lookups` | identical | Verbatim SQL. |
| 19 | TP DebitAccRestData / CreditAccRestData | Tenostat by `:acc_id` | `GET /accounts/{id}/rest` | identical | |
| 20 | TP SaveTransaction :392-394 | `CheckAdvancedObjectAccess('TRANSACTIONCOMMITEDEDIT')` when Status = 2 | `POST /save` | identical | |
| 21 | TP SaveTransaction :395-401 | ODS_VidOPTrDel before Post; Cnt=1 means a message and Exit | `POST /save` | identical | |
| 22 | DM ApplyRecord 'I' :244-270 | `GenerateID`, then `transaction_add` (named), then `SB_COMPLEX_TRANSACTIONS.SetTransactions` (omCommission only), then SBCommit | `POST /save` | identical | |
| 23 | DM ApplyRecord 'U' | `transaction_delete(TransactionID)`, then `transaction_add` with the same ID, then SBCommit | `POST /save` | identical | |
| 24 | TP ActionInsertExecute :691 (SaveTransaction + ResetTransaction) | the next record is inserted with no new access check | `POST /save` | **fixed** | Save now relies on the editor-open check kept in the session. It calls the check itself only if the client skipped `/editor-open`, and never for commission. |
| 25 | DM ApplyRecord 'L', 'R', 'C' | `Applied := True`, no DB call | — | not applicable | TP OperationCancel :183 only cancels. |
| 26 | TD.dfm:88 DBNavigator1 on TrDest (TD.dfm:98) | Insert / Edit / Delete + Post: DOA `insert into TRDESTINATION (ID, NAME) …`; lock, then `update TRDESTINATION set <modified cols> where rowid = :doa__rowid`; lock, then `delete … where rowid = :doa__rowid`; commit after each | `POST /trdest`, `PUT /trdest/{id}`, `DELETE /trdest/{id}` | **fixed** | This was missing, because the picker was read-only. Minimal ＋ ✎ − buttons were added to the F3 picker. A Post with nothing modified sends nothing. |
| 27 | TM ActionCommitExecute :909-949 | `transactions_delayed_commit` + SBCommit | — | not ported | ToolButton6 is `Visible = False`, and the action has no menu item or shortcut, so users cannot reach it. |
| 28 | TP Button1Click :811-839 | `P_BUSINESS_PROC.execbprocess`, BPTransData, `commitprocs`, Session.Commit | — | not ported | Button1 and the BProc combo are `Visible = False` and are never shown. |
| 29 | TM NFullRefreshClick :1414 | FullRefresh (the datasets from row 1 + row 4) | `POST /list`, `GET /init` | identical | |
| 30 | — | Validation re-reads (Avalute, accounts, kassa_b, CONVERT_ASSIGNMENTS); Transactions re-read before commit / reject / delete / save; ODS_StatusT re-read before each list and before the status update; TRDESTINATION rowid by ID | various | web-only | Read-only. The stateless web reads again what the Delphi datasets had in memory. |

Counts (Transaction Manager): **identical 14** (#1, 3, 5, 8, 9, 10, 12, 18-23, 29) · **fixed 10** (#4, 7, 11, 13-17, 24, 26)
· **differs, deliberate 2** (#2, 6) · **still missing 0** · not ported/not applicable 3 (#25, 27, 28) · web-only (#30).
