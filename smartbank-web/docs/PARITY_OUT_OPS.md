# Parity: Off-balance operations screens

Status: ✅ identical · 🟡 documented difference · ⛔ not ported · ❓ verify on the real DB

## 1. Off-balance Memorial Orders (`Packages/out_memorial`)

CLSID `{AE49F109-D3B9-4334-B841-77B4C90F2A16}` (`out_memorial_TLB.pas:56`) → route `/m/out-memorial`, tree
**Off-balance → Off-balance Memorial Orders** (`Tree\Sections\Item8\Item11`, plugin `PluginManager\Packages\Item28`).
API `api/app/out_memorial.py`, SQL `api/app/out_mem_sql.py`, UI `web/public/modules/out_memorial.js`, mock `api/app/db/mock_omem.py`
(uses `oacc.json`), tests `api/tests/test_out_memorial.py`, E2E `e2e/out_memorial_screens.py` (screenshots 93–95).
`modules.json` source corrected from `Packages/Copy of out_memorial` to `Packages/out_memorial`.

**Source used:** `out_memorial.dpr` compiles `memorialimpl_COPY.pas` (not `memorialimpl.pas` / `memorialimpl.$$$`), `memorial_datamod.pas`,
`unitreport1`, `UnitReport2..4`, `unitreferen`, `unitfilter`. All line numbers below are `memorialimpl_COPY.pas` unless noted.

| # | Delphi (unit:line) | Behaviour | Web | Status |
|---|---|---|---|---|
| 1 | ActiveFormCreate :587-613 | Dates = `OUT_SB_MEMORIAL.getBankDay`; currencies from ODSRate; nothing is run on open (call commented out :607-610) | `/init`, grid empty until Run | ✅ |
| 2 | memorial_datamod.dfm:133-134, FillCmbBoxRate :568-586 | `Select  Valute,Valu_Name from aValute`; Rate[0] = -1 "Bütün valyutalar" | `SQL_ODSRATE`, same index → valute mapping (server-side) | ✅ |
| 3 | sb_Memorial :414-425 | `OUT_SB_MEMORIAL.MEMORIAL(begDate,endDate,Valute,BalType,BalOrAcc,Balance,RateDiff,KredDebt,UseBalance,MultyCurrency,TransactionMode,FilialMode)`, positional; FilialMode always from BranchesSC (ID or -1) | Same 12 positional values, bound; dates Trunc'ed | ✅ |
| 4 | BitBtnRunClick :629-695 | Form 0: (…,1,0,'',diff,-1,useBal,mode); 1: filter dialog, DebtKred :646-655, BalanceType = plan+1 only if CheckBoxBalance; 2 (separator): nothing; 3: Multy=1 | Same per form; dialog Cancel = Abort (nothing runs) | ✅ |
| 5 | OpenOracleDataSet :542-562 | `'Select  *  From  '+'Memorial_'+GetUserName` + order line | Same text; GetUserName result must be a plain identifier (else error) | ✅ (validated) |
| 6 | CmbBoxOrderChange :720-741 | 8 fixed ORDER BY strings; re-opens the table without running MEMORIAL; the choice is kept for later runs | `ORDER[]` by index only | ✅ |
| 7 | miPrintSelectedClick :801-839 | `Where (ID in (ids))` from multi-selected rows, report, then reopen | Integer IDs only; checkbox multi-select; empty selection = all rows (like Delphi) | ✅ (validated) |
| 8 | SearchCombo1Change :842-854 | Dataset Filter `OP_ID = <user id>` | Client-side filter of the loaded rows | ✅ |
| 9 | VAL_ACCChange etc. :709-951 | `Locate(EditName, Text, [loPartialKey])`, Beep if not found | Prefix search on the loaded rows, "Not found" toast | 🟡 (Beep → toast) |
| 10 | ODSMainCalcFields datamod.pas:87-106 | CurrInNational = CurrencyToHR_Azeri(LAmmount,2,[2]) + '/ ədəd' | `currency_to_hr_azeri()` – every copy of that unit in the repo ends with the debug literal `'zaaaaaaa'` and drops the fraction; reproduced as is | ❓ unit not in the package – check which build is linked |
| 11 | InitalizeRpt :453-534 | CBCount → Memorial_Rpt2 (RGBlanck 0) / Rpt1 (QRExpr1 by "ordercount"); else Index = Word(Rate<>0): 1 → Rpt3, 0 → Rpt4. So "all currencies" (-1) gives Rpt3 and AZN (0) gives Rpt4 | Same selection | ✅ |
| 12 | Rpt3/Rpt4 headers :484-531 | Bank/INN from `GetBankInfo` (error → 'No Actual Parametr"s'), dates dd-mm-yyyy (2nd only if different), currency text or 'Multi valyuta əməliyyatlar(ı) ', QRLXV 'Manatla'/'Xarici valyutada' from the current (first) row | Same strings (Azerbaijani data, not translated) | ✅ |
| 13 | Rpt3 QRLabel4/QRDBText8/QRShape3 :512-514 | Deal-rate column only for form 3 | DIFFRATE column only for form 3 | ✅ |
| 14 | Report expressions | Amount = IF(COPY(VAL_ACC,1,2)='AZ',AMMOUNT_C,AMMOUNT); summary NIF(…) evaluated on the last record; LAMMOUNT blank if VAL_ACC=0 and CURRENCYID_C=0 | Same | ✅ |
| 15 | BtnReportClick :780-789 / miPrintSelected :827-830 | Rpt3 signature captions: '' + 'Baş mühasib ___' vs 'Təhvil verən/alan ___'; Run keeps whatever was set last (dfm default Təhvil verən/alan) | `signer` tracked per page | ✅ |
| 16 | Rpt1/Rpt2 dfm | Per-transaction forms; Rpt2 prints original + copy | Table, Rpt2 rows twice | 🟡 (layout) |
| 17 | Report DataFields `DInn`/`Kinn` | Dataset persistent fields are DEBTINN/KREDINN, so these print empty | Empty columns | ❓ |
| 18 | ComboBoxPrintMode | Preview / Print | Preview = on-screen report + PDF; Print = PDF download | 🟡 |
| 19 | miExcelExportClick :796-799 | TExcelExporter, ExportList VAL_ACC…LAMMOUNT, sheet 'Transactions' | `/export.xlsx`, same columns/sheet; operator filter applied | ❓ (filter respected by TExcelExporter?) |
| 20 | BtnReferClick / unitreferen | `Select RowID,Balance From Out_Memorial` with DBNavigator | List/insert/edit/delete, DOA-style DML by ROWID, commit per post | ❓ (DOA-generated DML) |
| 21 | Rate array `[0..10]` | More than 10 currencies overflows the Delphi array | No limit | 🟡 |
| 22 | DOA CallProcedure | No commit by the form | `call_proc(..., commit=False)` | ❓ (does MEMORIAL commit itself?) |
| 23 | ProgressBar1, Screen.Cursor | Visual only | Not ported | ⛔ |
| 24 | memorial_datamod.dfm:158-160 BankInfo, :202-206 UsersList, :230-231 Branches | Opened in DataModuleCreate | Same SQL; LOGO image not printed | 🟡 |

**To verify on the real DB:** `OUT_SB_MEMORIAL` parameter order/types (package source not in the repo), that the user table
`Memorial_<user>` exists for every user, and the column list of that table (VAL_ACC/CURRENCYID_C are strings in the persistent fields).

## 2. Off-balance Repair (`Packages/out_repair`) – ported

CLSID `{86E3CBB4-1C62-4BD8-BC35-C5E16FACED54}` (`OutRepair_TLB.pas:56`), tree `Item8\Item12`, plugin `Item29`, route `/m/out-repair`.
`OutRepair.dpr` compiles `Out_RepairImpl1.pas`, `RepairNewEdit.pas`, `RepairNewDataModule.pas`, `OutRepdelete.pas` – only these are ported
(`__history`, `.~pas` ignored). API `api/app/out_repair.py`, SQL `api/app/out_rep_sql.py` (generated verbatim from `RepairNewDataModule.dfm`),
web `web/public/modules/out_repair.js`, mock `api/app/db/mock_orep.py`, tests `api/tests/test_out_repair.py`, screenshots 96–98.

| Delphi | Web | Notes |
|---|---|---|
| `TransactionData` (dfm:7-55) `p.dat between :DAT and :DAT2 … ORDER BY :Title` | `POST /list` | verbatim, all bound. `:Title` is a **bind** (`Out_dbMainTitleClick` .pas:629-638) so Oracle orders by a constant – clicking a header reloads but does not re-sort, same as Delphi. Only grid field names are passed. |
| `CheckDates` (DataModule.pas:249-258) | 400 `out_repair.err_dates` | start > end. |
| `ReInitializeFilters` (Impl1.pas:854-935) | `build_filter` / `apply_filter`, filter panel | Exact filter string (returned as `filter`). Kept quirks: currency box loops `Count-2` so the "Yox" item filters `((DebitCurrencyID<>CreditCurrencyID) or (CreditCurrencyID<>CreditCurrencyID))`; unchecking a currency hides only rows where **both** sides have it; operation box has no "Yox" item (`VidOpThreadFinished` :407-416 adds it to `clbValute` by mistake), so its last row is outside the `<>` loop and unchecking it adds `(OperationType=<last id>)`; combo `ItemIndex` 0 is ignored for operator/branches. "Instant filter refresh" = `cbFiltrOptions`. Refresh (`RefreshTransExecute`) reloads without the filter (`Filter.Execute` commented out :702); Full refresh re-applies it. |
| Search panel (`CreateSearchPanel`/`FastSearch`) | client search row ▲●▼ | partial, case-insensitive, forward/backward/from beginning. |
| `TOutRepairEdit` | edit modal | currency → rate from `OperKurs` at the editor date (`DebetRateData`), clears amounts and account (`ValuteChange`/`SetFilter`); accounts `val_acc=:val_acc`; `ChangeAmounts` with RoundNew ≥0.5, precision 100 (`POST /amounts`); `PrepareInBalance` KASSA_B `MedioCrity` filter (0 debit-cash AZN, 1 credit-cash AZN, -1); descriptions from `out_trdestination`. chRate/chProfit unchecked by default → CorMode 2. |
| `CheckTransaction` (:194-227) | `POST /save` | erDebt/erCred/erDescr/erKassa in this order; then erConvert question when currencies differ, neither account is cash (1,2) and OutBalanceChar = 0. **Yes = keep editing, İmtina = save** (Delphi logic). OutBalanceChar NULL does not ask (Variant Null = 0 is False). |
| `SaveTransaction` (:269-302) | `Out_Correct.Main` named: Flag 1 insert (ID NULL) / 2 update, CorMode = `mode_of(chRate, chProfit)` | amounts/rates as Currency. |
| `TOutRep_delete` + `DeleteTrans` (OutRepdelete.pas) | delete dialog, `POST /delete` | Flag 0, both boxes checked by default (CorMode 0); NULL cash/convert chars sent as 0 (`AsInteger`). |
| Keys Enter/Delete/Insert (`Out_dbMainKeyDown`) | same on the page | |

**Unverified (needs real DB):** `Out_Correct.Main` body/return value not in the repo; the unit never commits (host session) – the web
commits right after `Main` and rolls back on error; `TransactionData` joins `avalute` (not an `out_` table) as in the DFM;
whether the SearchCombo `ItemIndex 0` is an "all" entry or the first user/branch (treated as "none"); `KASSA_B.SYMBOL` is a string in
the DFM but bound as integer `InBalanceChar`, as Delphi does.
Not ported: the AVI animations; `ShowAdvancedOptions` drag/dock behaviour.

## 3. `Packages/OutExcelImport` – belongs to the off-balance family

CLSID `{9B81586F-881D-480A-AE1B-AAC7DF45622B}` (`OutExcelImport_TLB.pas:52`), `OutExcelImporter.dpr` compiles only `OutExcelImport.pas`.
It loads an Excel sheet into `out_exceltable` (OutExcelImport.dfm:3281-3282 `select rowid,t. * from out_exceltable  t where userid=uid`,
rows inserted in ToolButton1Click OutExcelImport.pas:502-…), then posts them as off-balance transactions with
`excelpkg.OUTEXCELTRANSACTIONS` (:605) and clears with `excelpkg.Del_outexcel` / `del_outinspayments` (:329, :607, :625-627).
It works only on `out_*` objects, so it is an off-balance module: it gets its own Off-balance tree entry when it is ported (after out_repair).
