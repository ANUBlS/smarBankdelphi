# Parity: Off-balance Accounts (`Packages/Out_account/ocx`)

CLSID `{0E7C0852-BA22-45DC-8A22-368D2FF5F4C2}` (`out_account_TLB.pas:56`) → route `/m/out-account`, tree **Off-balance → Off-balance Accounts**
(`Tree\Sections\Item8\Item7`, plugin `PluginManager\Packages\Item24`). API `api/app/out_account.py`, SQL `api/app/out_acc_sql.py`,
UI `web/public/modules/out_account.js`, mock `api/app/db/mock_oacc.py` + `api/fixtures/oacc.json`, tests `api/tests/test_out_account.py`,
E2E `e2e/out_account_screens.py` (screenshots 83–86).

**Source used:** the units listed in `out_account.dpr` (AccountImpl, AccountDataModuleImpl, AccountPropertiesImpl, AccountFlagsImpl,
AccountRestState, AccountTransactionsImpl, IntervalImpl). The `out_*.pas/.dfm` files in the same folder are older copies that are **not** in the
.dpr and were not ported. This is a separate code base from `Packages/Accounts` (different SQL, packages `OUT_SBOP`/`OUT_SBUTIL`, no balance
check on close), so no Accounts logic was reused.

Status: ✅ identical · 🟡 documented difference · ⛔ not ported · ❓ verify on the real DB

| # | Delphi (unit:line) | Behaviour | Web | Status |
|---|---|---|---|---|
| 1 | AccountDataModuleImpl.dfm:140-157 `Account` | List SQL on OUT_ACCOUNT (+ cm_expert name), `ORDER BY :title` | `ACCOUNT_SQL_LINES`, verbatim | ✅ |
| 2 | AccountImpl.pas:841-963 `ActionFilterExecute` | `sql[6] := ' where '+FilterStr`; Status / Filial / Val_acc / Op_ID / `Tipacc like '%X%'` / `Bal_cn1=<text>`; then `Status`→`DECODE (close_dat, NULL, 1, 2)` on the whole text | `build_filter` / `account_sql`: same text, `Tipacc` and `Bal_cn1` values **bound**, ints `int()`-checked | 🟡 (injection-safe, same semantics) |
| 3 | AccountImpl.dfm:482 | Status radio defaults to "Open accounts" (ItemIndex 1); ActiveFormCreate applies the filter at once | Same | ✅ |
| 4 | CBxxxClick :340-401, DBLookupXxxClick, SpeedButton2Click | Checking/unchecking a box or picking a value refilters; unchecking runs InitControl (all lookups back to first row); "Reset filter" = InitControl + filter | Same | ✅ |
| 5 | GridAccountTitleClick :1014-1027 | Title click sets `:title` (DOA substitution) to the column FieldName | Column header click; only grid FieldNames accepted (whitelist) | ✅ |
| 6 | ReadBuffer 1000 | All rows fetched | Up to 1000 rows per request (`more` flag shown as "…") | 🟡 |
| 7 | ActionSpeedSearchExecute :966-998 | Search panel: Enter searches the field forward from the current row (ignore case, partial = starts with); at the end asks "Axtarış sona çatdı. Əvvəldən başlansın?", then "Yazı tapılmayıb!"; Exit clears the edit | Same, over the loaded rows; dates compared as dd.mm.yyyy | ✅ |
| 8 | AccountImpl.dfm:247-335 Panel3 | Rest / Equivalent and "Plan." Rest / Equivalent – **all four** are bound to `Tenostat` (OSTAT / POK_OSTAT); `Lazyrest` is opened but shown nowhere | Same (kept as in Delphi) | ✅ ❓ (likely a Delphi slip; Plan. should probably be Lazyrest) |
| 9 | ToolButton2/3/4Click :536-571 | `SB_ACA.CheckObjectAccess('out_account', insert/update/delete)` before New / Edit / Close | Always called on the server | 🟡 Delphi menu/shortcut paths (ActionInsert/Edit/CloseAcc, N4) skip the check; web always checks (stricter) |
| 10 | AccountPropertiesImpl.pas:93-113, AccountDataModuleImpl.pas:148-199, 225-279 | Post → ApplyRecord → `OUT_SBOP.add_account` / `upd_account` (pmNamed, all names as in Delphi incl. `v_tempid`) → refresh and Locate by acc_no | Same calls/names; then commit (DOA `CommitOnPost` default) | ✅ ❓ CommitOnPost not set in dfm → default True assumed |
| 11 | BuildAccount :230-255 | Fields not on the editor (op_id, bal_cn3, bal_cn4, insider) come from the current record; NULL → AsInteger 0 / AsString '' | Re-read from DB on update; insert sends 0/'' | ✅ |
| 12 | BuildAccount `CloseDate := AsDateTime` | NULL close date is sent as 0.0 (30.12.1899) | Sent as NULL | 🟡 ❓ (same choice as Accounts module) |
| 13 | :99 `Int(DTPOpenDate.DateTime)`; FormShow :115-136 | Open date without time; new account defaults to `sysdat.tek_dat` | Same | ✅ |
| 14 | — | No CheckFields-style validation in this unit; Oracle constraints decide | No extra validation (ORA text shown) | ✅ |
| 15 | DBEdit1KeyPress :228-232 | Regress No. (`old_acc_no`) accepts only `A-Z a-z 0-9 / -` | Filtered as you type and checked again on the server | ✅ |
| 16 | Customers_AfterScroll AccountDataModuleImpl.pas:319-324 | Picking a customer copies the customer name into the account name | Same | ✅ |
| 17 | SpeedButton1Click AccountPropertiesImpl.pas:192-221 | "Auto account" → `OUT_SBOP.GenerateAccountNumber(BalCn, CurrencyID, CustomerID, BranchID, BalCN2, AnalitKod)` (values AsString; AnalitKod 0 when the report-symbol combo shows 0) | Same | ✅ ❓ FormShow forces the combo to 0 without changing the field; web shows the stored value, so AnalitKod = stored sim_otcet in edit mode |
| 18 | AccountFlagsImpl.pas:33-69 | Symbols dialog skips the first `OUT_account_flags` row; edit mode ticks via `OUT_SBUTIL.FlagExsist(AccID, FlagChar)`; OK builds `"A,B"` from the first char of each ticked item | Same (`/flags`, `/flag-map`) | ✅ |
| 19 | PairAccountBeforeOpen :281-289 | Pair account list filtered `Status = 1` | Same | ✅ |
| 20 | Editor lookups | Currency `out_Avalute`, bal `OUT_bal_spr1`/`OUT_bal_spr2`, customers `pkg_report.get_customers(p_result)`, report symbol, filial, `cm_expert` (tempid) | Verbatim SQL | ✅ |
| 21 | ToolButton4Click :559-571 | Confirm `"%s" №-li hesab bağlansın?` → `OUT_SBOP.close_account(accid, doclose=1)` – **no balance / already-closed check** | Same; then commit | ✅ ❓ Delphi does not commit here (next post/session end commits) |
| 22 | ActionAccTransExecute :703-727, IntervalImpl | Period dialog, both dates default to `sysdat.tek_dat` | Same | ✅ |
| 23 | AccountTransactionsImpl.dfm:510-612, .pas:94-171 | Debit/Credit documents (`SMART.out_provarch` / `SMART.out_account`), calc field = this account's number, totals with Currency sums | Same (Decimal) | ✅ ❓ `SMART.` schema prefix as in Delphi |
| 24 | AccountRestState.dfm:448-460, .pas:88-108 | Rests & turnovers from `out_archost` (abs values, ordered by date), three tabs | Same | ✅ |
| 25 | TExcelExporter (F3 / "To ->") | Export of documents / rests | CSV (UTF-8 BOM) with the exporter's field list | 🟡 |
| 26 | ActionFullRefreshExecute → Refresh_ | Reopens every dataset | Reloads lookups and the list | ✅ |
| 27 | SBTranslateProc.TranslateAllComponents | Captions from the DB translation table | en/az/ru locale files (`out_account.*`) | 🟡 |

## Not ported
- Nothing functional from the .dpr units is left out. The mouse-wheel row stepping and the ActiveX property plumbing have no web meaning.
- The non-compiled `out_*.pas` copies (older variants of the same forms) – ⛔ by design.

## To verify on the real DB
Rows 8, 10, 12, 17, 21, 23 above, plus: the real `OUT_SBOP.add_account` / `upd_account` / `close_account` / `GenerateAccountNumber` and
`OUT_SBUTIL.FlagExsist` signatures (package source not in the repo; names taken from AccountDataModuleImpl.pas), and that
`pkg_report.get_customers` returns `ID`, `NAME` columns.
