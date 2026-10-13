# Accounts module – parity checklist (Delphi `Packages/Accounts` → web)

Status: ✅ ported identically · 🟡 ported with a documented difference · ⛔ intentionally not ported · ❓ verify on the real DB

| # | Delphi (unit:line) | Behaviour | Web | Status |
|---|---|---|---|---|
| 1 | AccountMainFormImpl.pas:254-298 `SAccountsQuery` | Main list SQL (ACCOUNT/TENOSTAT/TEMPOST/LAZYREST/AVALUTE) | `accounts.SACCOUNTS_QUERY`, verbatim incl. CRLF | ✅ |
| 2 | :559-603 `BuildAccsQuery` | Filters only when "Apply filter" is on: open/closed, BAL_CN1, KLI_ID, VAL_ACC, FILIAL, `tipacc like '%X%'`; ORDER BY acc no / name / currency | `build_accs_query`. Same text, but **bind variables** instead of `Format('%d')` | 🟡 (same SQL semantics, injection-safe) |
| 3 | AccountDataModuleImpl.pas:152-160 `FetchRecLimit=50` / afPause | Fetches 50 rows, then more | Pages of 50 with "Load next 50" (rownum window, 11g-compatible) | ✅ |
| 4 | OrderAccNoExecute | Changing the order refreshes the list | Radio change reloads | ✅ |
| 5 | FindAccountExecute (search forward/back in grid fields) | Partial search in loaded rows | Quick search box over loaded rows | 🟡 (no forward/backward stepping) |
| 6 | AccountDataModuleImpl.dfm lookups | bal_spr1..4, CUSTOMERS (close_dat is null), AVALUTE, REPORT_SYMBOL, FILIAL, account_flags | `/api/accounts/lookups`, verbatim SQL | ✅ |
| 7 | AccountPropertiesForm_Unit.pas:141 CheckFields | Required, checked in order: AccNo, CurrencyID, SAcc, CustomerID, AccName. The first empty field gives "`"%s" sahəsinə qiymət daxil olunmayıb`" | `validate()` on the server, same order and same message (i18n) | ✅ |
| 8 | :287-292 AccNoEditKeyPress | Allowed characters `0-9 a-z A-Z / - : ( ) . , ' + { } space` | Filtered as you type, and validated again on the server | ✅ |
| 9 | :151 `Trunc(OpenDateEdit.DateTime)` | Open date without time | `_trunc()` | ✅ |
| 10 | :178-188 New | Open date defaults to `Sb_GetSystemDate` (SBOP.get_date) | `/new-defaults` | ✅ |
| 11 | :279-284 FormActivate (insert) | Filial defaults to `SB_ACA.getuserfilialid` | `/new-defaults` | ✅ |
| 12 | :236-240 CustomerNameCBCloseUp | Choosing a customer copies the customer name into AccName | Same on customer change | ✅ |
| 13 | :208-226 FillCBL + SBAccount.pas:70-78 | Flags checked when `SBUTIL.FlagExsist(AccountType=>, FlagChar=>)` | `flags_of()`, one call per flag symbol | ✅ |
| 14 | AccFlagsChangingImpl.pas:38-53 BuildAccFlags | Flags string = first characters of the checked items, comma-separated, in list order | `build_acc_flags()` | ✅ |
| 15 | AccountDataModuleImpl.pas:95-133 ApplyRecord + SBAccount.pas:80-103 | Insert → `SBOP.add_account` (named params, op_id 0), then commit | `add_account()`, the same named parameters | ✅ |
| 16 | SBAccount.pas:124-147 | Update → `SBOP.upd_account` (`v_`-prefixed named params), then commit | `update_account()` | ✅ |
| 17 | SBAccount.pas:93/137 `close_dat => NullDate` (0.0) | Delphi sends TDateTime 0 (30-Dec-1899, or NULL depending on DOA) | Sends NULL, which is the PL/SQL default | ❓ verify what upd_account/add_account do with close_dat |
| 18 | AccountMainFormImpl.pas:813-829 CloseExecute | Block if Amount or LAmount ≠ 0 ("You can not close account, if they have positive balance"); confirm; `SBOP.close_account(AccID, DoClose=>1)` | Same: checked in the UI and again on the server; confirm dialog | ✅ |
| 19 | :976-980 CloseUpdate | Close is enabled only when CloseDate is NULL | Button disabled, and the server rejects it | ✅ |
| 20 | close_account commit | Delphi does not call Sb_Commit after Sb_CloseAccount (it relies on a later commit or logoff) | Commits right away | 🟡 ❓ confirm this is acceptable |
| 21 | DB-side rules (sm_p.sql:7858 close_account: CheckObjectAccess, lazy transactions, ORA-20002) | Raised by the DB | ORA text shown unchanged | ✅ |
| 22 | :831-857 ViewTransactions + StartEndDateInputForm | Period defaults to the operation date for both start and end | Same | ✅ |
| 23 | AccTransactionsFormImpl.dfm:477/574 | Debit and credit SQL against provarch | Verbatim | ✅ |
| 24 | AccTransactionsFormImpl.pas:98-117 CalcFields | DebitAccNo / CreditAccNo filled with the current account | Same | ✅ |
| 25 | :130-154 FillAmounts | Totals of the amount and LAmount columns (Currency) | Decimal sums | ✅ |
| 26 | :96-106 date change → refresh; :213-214 credit tab when there are no debit rows | Same | Same | ✅ |
| 27 | AccStatesImpl.dfm:201 | archost history, abs(), date desc | Verbatim | ✅ |
| 28 | F3 export (AccTrExport / AccStateExporter, only when RecordCount>0) | Export grid | CSV export buttons | 🟡 (CSV instead of the Delphi exporter format) |
| 29 | FormCloseQuery "Dissmiss changes?", Esc closes, Enter goes to the next field | Same | Same | ✅ |
| 30 | Module access | AccCheck `sb_aca.checkmodright(CLSID)` | Every `/api/accounts` endpoint is guarded on the server | ✅ |
| 31 | PairAccCB (all accounts ordered by ACC_NO) | Full list in a combo box | Searchable lookup (prefix, 50 rows), same SQL wrapped | 🟡 |
| 32 | `ToolButton5Click` / `Button1Click` / Memo1 | Lets the user edit and run raw SQL from a memo | **Not ported** (security risk) | ⛔ |
| 33 | `ArestExecute` | Only toggles a repaint flag; no grid draw handler exists in the source | Not ported (no effect in the source) | ⛔ ❓ |
| 34 | LTimeShow (query timing label) | Debug | Not ported | ⛔ |
| 35 | Insider field | Commented out in Delphi (`IsInsider` not sent) | Not sent either | ✅ |
| 36 | SAccsDataAfterScroll (balance-account name label) | Shows BALNAME | The dropdown shows "code – name" | ✅ |
