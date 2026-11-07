# Parity: Balance report group

Delphi sources → web:

| Delphi package / form | CLSID | Web route | Tree |
|---|---|---|---|
| Packages/Balance – TFrmBalance (BalanceImplUnit.pas, UnitDataMod, UntBalanceRpt1/2/4, UntBalnceRpt3, InterBalance(2)Unit, ExportFormImpl, UnitCompBalSettings) | {D93CAE95-900D-11D6-AA87-00C0262B568B} | /m/balance | Accounts › Balance (existing #3) |
| Packages/DBDBalance – TFrmDayByDayBalance (UnitDayByDayBalanceImpl.pas) | {D077818C-A020-4DF6-A9CD-2421A76A8AFC} | /m/daybydaybalance | Balance reports › Day-by-day balance |
| Packages/TodayBalance – TFrmTodayBalance (TodayBalanceImpl.pas, TB_DataModuleImpl, UntBalanceRpt1/2/3) | {A06DC10A-2115-4EED-A373-D446BAA6661C} | /m/todaybalance | Balance reports › Today balance |
| Packages/BalanceAnalys – TFormBalanceAnalys (BalanceAnalysImpl.pas, DataModuleBalance.pas) | {3F8A831B-BCB5-4939-83CB-4DA491A12312} | /m/balanceanalys | Balance reports › Balance analysis |
| Packages/AccBalanceCheck – TAccBalanceCheckForm | {3877ACED-C099-400D-AFB4-58C4389DAFB8} | /m/accbalancecheck | Balance reports › Account balance check |

`web/modules.json`: DayByDayBalance source corrected from `Packages/Copy of DBDBalance` to `Packages/DBDBalance`.
Skipped (copies / dated variants, not distinct features): `Copy of DBDBalance`, `__history`, `*.~pas/~dfm`.

Code: `api/app/balance.py` (routers), `api/app/bal_logic.py` (every SQL[i] rewrite / filter, cited unit:line),
`api/app/bal_sql.py` (41 SQL texts generated verbatim from the DFMs; line indices checked against `/*N*/` markers),
`api/app/report_render.py` (PDF via reportlab/DejaVu, XLSX via openpyxl), mock `api/app/db/mock_bal.py` + `api/fixtures/bal.json`,
UI `web/public/modules/balance.js`, locales `balance.*` (en/az/ru). Tests: `api/tests/test_balance.py` (18). E2E `e2e/balance_screens.py`,
screenshots `docs/screenshots/60…69-*.png`.

## Balance (TFrmBalance)
* `sb_GetBalance` (BalanceImplUnit.pas:493-517): `SB_BalanceFilIDs` block with `:P_Procedure` substituted by the constant `sb_BalanceSelections`
  (whitelist, never user input); OUT Param1/Param2; text = Param1+Param2+' Order By Bal_CN'.
* `sb_OpenDataSet` (:526-538): text split at 1999 chars into AStrParam1/2 → `SB_BALANCEFILIDS.OpenCursor`.
* Branches: CrFilialStr (:747-765) `' '+ids`; no branch checked → error (BitBtnOk disabled in Delphi).
* Reports 0–5 = ComboBoxFont items (Qalıqlar, Tam balans, Dövriyyəli, Qalıqlar (hes. adları ilə), Beynəlxalq balans, … (dövriyyəli)); DataSet.Filter
  `LastActive<>0 or LastPassive<>0` (+ turnovers) with Delphi NULL semantics; International reports grouped on ACCGROUP (BalanceGroups lookup).
* Header: GetBankInfo p0..p3 (bank, code, chairman, chief accountant); FDate/LDate, LDate hidden when equal (sb_InitRpt).
* Excel (ExportForm): only the chosen FieldsInfo columns, unfiltered ODSMain. PDF/XLSX of the on-screen report.
* F600 (BtnCreateFileClick :924-999): DBF with NB, NF, NB1, SUM1, SUM2 = value × divisor; non-integer divisor → error.
* Comparative balance + settings only when SETTINGS PRODUCT_NAME = '2' (:812-818); `getbalance` named call then ODSBalance grouped by STATUS.
  Settings grid updates BALANCE_SETTINGS by ROWID (ROWID format-validated, values bound).
* Not exposed: analysis form (BitBtnAnalysis Visible=False), debug ShowMessage of the SQL.

## DBDBalance
* RefreshButtonClick (:561-655): symbol / currency checks, ADDITIONALPARAMS, BalansH / SsudaH (1000-char chunks), `NON_EXSIST_DATES` positional calls
  (SB_BALANCE 18 args; OUT_SB_BALANCE 9 args when "out balance" checked). ID calc field = AccountNum + 1000000×Day.
* EditDebt is concatenated into SQL by Delphi → validated: mode 0 integer list only; mode 1 alphanumeric account numbers, quoted via StrToComma.
* Excel: sheets 'Balansdankənar' (if checked & non-empty) then 'Balans'.

## TodayBalance
* Balance_/Account_/Transaction_Selections line rewrites (Pok_ prefix, Tenostat/Archost, Provdoc/Provarch when date = bank date, branch, currency,
  account list – validated integer list). Report filters per Rpt1/2/3; single-branch user → branch preselected and locked.
* Checking view: balance → accounts (master-detail :AccountNumber, CBRest filter) → transactions `(DebitAccID=id) or (CreditAccID=id)`, -1 for NULL.

## BalanceAnalys
* BuildBalance / BuildAccount / BuildTransaction SQL[i] rewrites; balances list validated to digits/','/'.' (EditBalancesKeyPress).
* Double-click debt/credit summaries set SQL[20] (`t.Debt = … and c.bal_cn1=…` / `t.Kredit = … and d.bal_cn1=…`); operator filter SQL[16].
* `order by :Title` bind kept as in Delphi (no real ordering effect).

## AccBalanceCheck
* List (Accs), status column per session (FStatusList), Check = `SBCORRECTION.check_account_balance(AccID, ErrorSet)`, Correct =
  `SBCORRECTION.correct_account_balance` then re-check.

## Rights
Each router requires `SB_ACA.checkmodright(CLSID)`. Mock user `ACCOUNTANT / Accountant#2026` has the four report modules but not AccBalanceCheck.

## Unverified / assumptions
* Real bodies of SB_BalanceFilIDs, OUT_SB_BALANCE, SB_MTOUTVIEW are not in the repo; mock emulates them (SaldoToActive/Passive rules).
* NON_EXSIST_DATES: deployed signature takes 18 args (as called by Delphi); repository SQL script shows 5 – needs DB confirmation.
* F600ta.dbf template not in the repo: DBF field widths assumed (N10/N10/N10/N20.2/N20.2).
* QuickReport binary DFM layouts were parsed (dfmbin.py) for columns; exact fonts/page layout not reproduced.
