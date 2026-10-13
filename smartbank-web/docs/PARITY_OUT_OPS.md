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
