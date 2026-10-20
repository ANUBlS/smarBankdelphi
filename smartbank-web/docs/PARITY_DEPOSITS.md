# Parity: Deposits manager (DepositsManager_New, production)

| | |
|---|---|
| Production module | **`Packages/DepositsManager_New`** (user decision 2026-10-20). Built in `SBWorld_Tale.groupproj` together with the `Packages/SBDM_*_new` plugins. |
| CLSID | `{FC4F6C2E-FDCA-40AF-AE35-8F57F648EE56}` CLASS_DepositsManager_new (DepositsManager_New_TLB.pas:52) |
| Delphi source | `DepositsManagerImpl_new.pas` (1155 lines) + `.dfm`, `DMDepositManagerImpl_new.pas/.dfm`, `Packages/SBDM_Common_new/CommonDeclsImpl_new.pas` |
| Oracle objects | `sbcm_contracts_new`, `sbcm_contract_accounts_new`, `sbcm_contract_state_new`, `sbcm_tranches_new`, `sbcm_deposit_Types_new`, `sbcm_categories_new`, `sbcm_persons_new`, `temprate`, `avalute`, `filial`, `user$`, `sysdat`, `bankinfo`; packages `sbcm_stored_programs_new` (pmNamed), `sb_aca` |
| Web | API `api/app/deposits.py`, SQL `api/app/dep_sql.py`, mock `api/app/db/mock_dep.py` + `api/fixtures/deposits.json`, UI `web/public/modules/deposits.js` (route `/m/depositsmanager-new`) |
| Tree / modules.json | Mock tree Item4\Item0 "Deposits manager" → `axinplace:{FC4F6C2E-…}`; `web/modules.json` marks DepositsManager_New migrated and the two NewDepositsManager CoClasses not migrated |
| Tests | `api/tests/test_deposits.py` (14), E2E `e2e/deposits_screens.py`, screenshots 250–257 |

## Main form: what is ported

| Delphi | Web | Ref |
|---|---|---|
| DepositsData SQL (verbatim, `order by :OrderField`, otSubst) | `SQL_DEPOSITSDATA`; always `cont.id` (set in DataModuleCreate, never changed) | DM.dfm:228-289, DM.pas:87-102 |
| MainGrid (TXDBGrid) 11 columns, dgTitleButtons but **no OnTitleClick** | same columns, header click does nothing | dfm:855-1113 |
| Lookups: avalute, filial, sbcm_deposit_Types_new, sbcm_categories_new, sbcm_persons_new, sysdat, bankinfo, users (opened, combo commented out) | `/api/deposits/init` | DM.dfm:12-186 |
| PrepareFilter: each combo KeyValue := first record (0 if empty), LCBStatus index 0 | `defaults` | pas:552-564 |
| BuildFilterString (CBpersons → `clienttype` with the categories combo, CBClientType → `personaltype` with the persons combo – crossed names kept) + `Filtered := True` | literal port, `tdataset_filter.py`; expression shown under the grid | pas:488-550, 590-602 |
| Only the combos and LCBStatus have OnChange (`DBLookupComboboxEh1Change` → ActnFilterExecute); **check boxes and date pickers have no handler** | ticking a box or changing a date waits for the next combo change | dfm:19-414 |
| FilterPanel `Align = alLeft`, Visible False; TBFilteration toggles it and sets both pickers := bank date | Filter button toggles the top panel (current layout kept: left sidebar only for Accounts / Transaction Manager) | pas:993-999 |
| SpeedButton1 'X' on the filter panel: no OnClick | ✕ button does nothing | dfm:37-49 |
| BitBtnexp (in the filter panel): DataSet.Last, CMExcelExport 'Depozitlər', visible TFields (15) with DisplayLabel titles | `/api/deposits/export.xlsx` | pas:477-486 |
| Axtarış Paneli (N35, **Ctrl+Alt+S** = ShortCut 49235): 6 edits, field = copy(Name,5); SearchRecord srIgnoreCase+srPartialMatch, from current, forward, wrap confirm, 'Yazı tapılmadı!'; only EditContractNo clears OnExit | client-side, same messages | pas:268-279, 620-666 |
| Yeniləmək (ToolButton7 / N28 → ActnRefresh): SelectedRows.Clear, Get_SelectedContID (raises 'Heç bir Depozit seçilməyib!' when empty), Refresh, Locate ID | same | pas:604-618 |
| N18 Bağlamaq (F8): right SBCM_CLOSE_CONTRACT, confirm (two texts by SelectedRows.Count), **CloseDeposit for every SelectedRows bookmark**, Refresh | `/right/SBCM_CLOSE_CONTRACT` then `POST /close {ids}`; Ctrl+click marks rows; no rows marked → nothing closed; **no commit** | pas:767-800 |
| N19 Hesablamanı dayandırmaq/davam etdirmək: right SBCM_STOP_START_CALCPERCENT, IsCalculationEnabled, confirm, Disable/EnableCalculation | `GET/POST /{id}/calc`, no commit, no refresh | pas:802-826 |
| Rights before each plugin (see table below) | `sb_aca.checkadvancedobjectaccess` in `/plugin/{key}` | pas |
| Shortcuts Ctrl+N/E/D/M/T/U/P/F, F8, Ctrl+Alt+S | same keys (browsers may keep Ctrl+N) | dfm:1679-1778 |

## Plugin forms (BPL): inventory and status

All are called via `LoadPlugin(bpl, param)` (CommonDeclsImpl_new.pas:30-40; no check that the file exists – LoadPackage raises).

| Menu | Right | BPL / param | Source folder (units / lines) | Status |
|---|---|---|---|---|
| Yeni Kontrakt / N16 Ctrl+N | NEW_SBCM_CONTRACT | SBDM_Contract_new.bpl InsertContract | Packages/SBDM_Contract_new (3 / 3126; the folder also holds NewDepositsContract.dpk) | **ported** (see below) |
| Redaktə / N17 Ctrl+E | EDIT_SBCM_CONTRACT | SBDM_Contract_new.bpl EditContract | same | **ported** |
| Yatırım (miDeposit, N23 Ctrl+D) | NEW_SBCM_TRANSH | SBDM_ApplyMoney_new.bpl | Packages/SBDM_ApplyMoney_new (3 / 1440) | todo |
| Əmanətin ödənilməsi (miWithdraw, N25 Ctrl+M) | NEW_SBCM_PEYMENT | SBDM_ExtractMoney_new.bpl | Packages/SBDM_ExtractMoney_new (3 / 1518) | todo |
| Əmanətin qismən ödənilməsi (N15) | NEW_SBCM_PARTIAL_PEYMENT | SBDM_PartialPayment_new.bpl | Packages/SBDM_PartialPayment_new (3 / 1392) | todo |
| Kapitallaşdırma (miCapitalization, N24 Ctrl+T) | NEW_SBCM_CAPITALIZATION | SBDM_Capitalize_new.bpl | Packages/SBDM_Capitalize_new (2 / 1130) | todo |
| Əmanətin vaxtsız ödənilməsi (N26 Ctrl+U) | NEW_SBCM_UNTIMELY | SBDM_UntimelyEtMoney_new.bpl | Packages/SBDM_UntimelyEtMoney_new (1 unit in dpk / 1971) | todo |
| Faizlərin hesablanması (N12, N27 Ctrl+P) | NEW_SBCM_CALC_PERCENT | SBDM_PercentConverting_new.bpl | **source not in the repo** (only referenced by NewDepositsManager/NewDepositsExtractMoney/NewDepositsPercentConverting.dpk as `..\SBDM_PercentConverting_new\`, folder missing) | blocked – needs the source |
| Prolonqasiya (N9, N8) | NEW_SBCM_PROLONGATION | SBDM_Prolongation_new.bpl | Packages/SBDM_Prolongation_new (2 / 800) | todo |
| Ödəmə planı (N36; N14 invisible) | – | Sbdm_Shedule_new.bpl | Packages/Sbdm_Shedule_new (3 / 1577) | todo |
| Filter Paneli (N10 Ctrl+F) | – | SBDM_Filter_new.bpl | **source not in the repo** | blocked – needs the source |
| Yatrımların və yığımların çapı (N20) | SBCM_PRINT_APPLYMONEY | SBDM_ContractReport_new.bpl | Packages/SBDM_ContractReport_new (3 / 3155) | **on hold by user** |
| Müqavilə çapı (N21) | SBCM_PRINT_CONTRACT1 | SBDM_WReport_new.bpl | Packages/SBDM_WReport_new (2 / 629) | **on hold by user** |
| Sazlamalar: Bankın seçmələri (N1, Visible False) | – | SBDM_Settings_new.bpl showrefer | Packages/SBDM_Settings_new (9 / 2908) | todo (hidden) |
| Sazlamalar: Hesab qrupları (N2) | SBCM_ACCOUNT_GROUP | SBDM_Settings_new.bpl showcccgroups | same | todo |
| Sazlamalar: Müştəri tipləri (N3) | SBCM_CUSTOMERS_TYPE | SBDM_Settings_new.bpl showcategories | same | todo |
| Sazlamalar: Depozitin tipləri (N4) | SBCM_DEPOSIT_TYPE | SBDM_Settings_new.bpl showdeposittypes | same | todo |
| Sazlamalar: Gəlir zərər hesablarının sazlanması (N5) | SBCM_LOSS_INCOME_ADJUSTMENT_ACC | SBDM_Settings_new.bpl showaccountturning | same | todo |
| Sazlamalar: Müqavilə çapı (Sazlanması) (N6) | SBCM_PRINT_CONTRACT | SBDM_WRSetup_new.bpl showSBWRBookmarkSetup | Packages/SBDM_WRSetup_new (6 / 2006) | todo (print template setup – confirm whether it is covered by the print hold) |
| Sazlamalar: Faizlərin sazlanması (N7) | SBCM_PERCENT_SETTING | SBDM_PercentSettings_new.bpl | Packages/SBDM_PercentSettings_new (1 / 1833) | todo |
| Sazlamalar: Hesabların sazlanması (Hesablarin1, Visible False) | – | SBDM_DepozitAccSettings_new.bpl | Packages/SBDM_DepozitAccSettings_new (1 / 64) | todo (hidden) |
| Hesabatlar: Period Hesabatı (N31) | SBCM_PERIOD_REPORT | SBDM_PeriodReport_new.bpl | Packages/SBDM_PeriodReport_new (3 / 2487) | **on hold by user** |
| Hesabatlar: Mis Hesabatı (N32) | SBCM_MIS_REPORT | SBDM_Report_new.bpl | Packages/SBDM_Report_new (2 / 1387) | **on hold by user** |
| Hesabatlar: Balans Üzrə Hesabat (N33) | SBCM_OF_BALANCE_REPORT | SBDM_ReportofBalance_new.bpl | Packages/SBDM_ReportofBalance_new (1 / 712) | **on hold by user** |
| Common | – | SBDM_Common_new.bpl (LoadPlugin, Get_SelectedContID, TrDelayed_Show) | Packages/SBDM_Common_new (2 / 597) | used by the ports |

Archive: DepositsManager_New has no archive menu item. `Packages/SBDM_DepositsArchive` (CLSID `{339266A2-…}`) reads the classic `sbcm_*` tables (not `_new`), and `NewDepositsManager/NewDepositsArchive` belongs to NewDepositsManager → both are skip candidates.

## SBDM_Contract_new.bpl (new / edit contract)

API `api/app/dep_contract.py` (`/api/deposits/contract/*`), SQL `dep_contract_sql.py`, UI `web/public/modules/deposits_contract.js`,
tests `api/tests/test_dep_contract.py` (10), E2E `e2e/dep_contract_screens.py`, screenshots 258–262. F = frmDepositContract_new_Impl.pas, DM = dmDepositContract_new_Impl.pas.

| Delphi | Web | Ref |
|---|---|---|
| exportproc InsertContract → New, EditContract → Edit (no LookContract; the manager has no double-click) | `POST /open {mode}`; the right (NEW_/EDIT_SBCM_CONTRACT) is re-checked server-side | F:471-483, 663-688 |
| DataModuleCreate opens valutes, Filals, DepositTypes1 (no status filter), ClientTypes, persons, Customers | `static_lists`; Customers is the full `select id,name from customers`, the web filters it for the name drop-down (`/customers?q=`) | DM:158-171 |
| AddContract: DepositPorps(CONTRACTID 0) Insert; CURRENCY 0, Branchid Get_FilialID, Open/Close/FIRSTINTERESTPAYDAT Get_BankDate | `add_contract` (bank date / filial of the manager) | F:488-503 |
| EditContract: Open(Get_SelectedContID), Edit, ShowAccounts | `load_contract` + `show_accounts`; DepositPorpsCalcFields calls `GetPeriod(bdat, edat)` (PeriodContracts, not shown) | F:505-527, DM:262-269 |
| CUSTOMERID OnChange → ShowAccounts: reopen DepositAccs / InterestsAccs / ClientAccs / BoorowerAccs / DSBEFO_INTERESTPEYTACC with :CustID, ChAutopr := (Autopr = 1) | `customer` event (ID edit on exit, or a name picked in the list) | DM:271-275, F:586-658 |
| Account lookups (except ClientAccs) are details of `valutes` (val_acc) – they follow the currency combo | `currency` event re-queries them | dfm:126-158 |
| ContractTypesKeyValueChanged → DepPeriods / DepCapperiod reopen; LCBPeriodsKeyValueChanged → DepCapperiod reopen | `type` / `period` events | F:276-286, 394-404 |
| LCBPeriodsChange: 'Ay' → IncMonth(open, period), 'Gün' → open + period, close-date edit Enabled := period <> 0 | same; fires when the combo text changes (list reopened) or on user selection | F:247-274 |
| LCBCapPerChange: FIRSTINTERESTPAYDAT := IncMonth(open, period div 30) (period > 0, else IncMonth(open, period)) | same | F:228-239 |
| GenAnnualInt only on **Enter** in Depozitin tipi / Müddət / Kap.per / Valyuta / Məbləğ: Get_DefaultContractRate ×3 (p_defint/p_defUntimeint TF / FT / FF) → INTEREST (FloatToStr), OVERDUEINTEREST, DUEINTEREST; skipped unless the four combos have values | `genint` event; PL/SQL BOOLEAN literals in an anonymous block | F:165-226 |
| CheckNeedsFields: 12 fields (DisplayName; INTEREST has none → 'INTEREST'), the 4 account ids <> 0, `Check_BankAccount`, BefoPercent account when the type's WITHDRAWTYPE = 'BefoPercent' | same order and texts (`deposits.c_err_*`) | F:322-384 |
| Qeyd et → SaveDeposits → Post → ApplyRecord `NewDeposit` / `UpdateDeposit(p_ContractID = Get_SelectedContID)` (pmNamed, 23 / 24 names) → **commit** (CommitOnPost default) | same; a failed call rolls back | F:298-304, 689-749, DM:190-260 |
| Insert: AddContract again, the form stays open; Edit: Close → FormClose RefreshWithSavely(True) | `closed` flag; the manager grid reloads | F:731-749, 535-541 |
| İmtina et (insert) → Cancel twice: empty dataset in browse; the next Qeyd et shows the "Filial" hint | browse state | F:288-291 |
| Bağla / Esc → CloseQuery 'Dəyişiklər qeyd olunmayacaq !'#13'Əminsiniz?' when Modified; F5 → RefreshDataSets | same | F:543-577 |

Contract-form quirks kept:
- `Amount := DBNumberEditEh.Value` with an empty amount raises a Variant conversion error, so pressing Enter in the type / period / currency combos before an amount is typed shows that error (`deposits.c_err_variant`).
- ShowAccounts sets ChAutopr from the AUTOPR field, which is Null on a new record: choosing a customer in insert mode clears the "Avto prolonq." box that New() had ticked.
- F5 before a customer is chosen in insert mode refreshes closed account datasets → "Cannot perform this operation on a closed dataset".
- Changing the customer keeps the previously chosen account ids in the record (only `<> 0` is checked on save).
- `usrs` is never opened, so the fkLookup USERNAME (Lbluser) stays empty in Edit.
- `DSBEFO_INTERESTPEYTACC` uses the classic `sbcm_acc_zone_info` / `sbcm_acc_zones` tables (not `_new`).
- The form `uses NewCommonDeclsImpl` (NewDepositsCommon) while the dpk requires SBDM_Common_new; the web uses the manager's current row, bank date and filial (as CommonDeclsImpl_new would).

Contract-form unverified / mock:
- EhLib order of OnChange / OnKeyValueChanged when the Edit record loads (the web runs type → period → capital period; this recomputes CLOSEDATE and FIRSTINTERESTPAYDAT, so saving an unchanged contract can change them).
- Lookup list cursors are assumed to sit on the selected key (first row when not found).
- FloatToStr decimal separator ('.' assumed).
- `sbcm_contract_new` body (NewDeposit, UpdateDeposit, GetPeriod, Get_DefaultContractRate, Check_BankAccount) is not in the repo; mock = fixture `_rates`, `_bankacc_missing`, unique contract number.

## Differences from NewDepositsManager (the previous, non-production port)

| Area | NewDepositsManager | DepositsManager_New |
|---|---|---|
| Schema / package | `dm_*` tables, `dm_stored_programs` | `sbcm_*_new` tables, `sbcm_stored_programs_new` |
| Main list | 21 fields incl. ID, CUSTOMERID, PROLONGATIONDATE, OSTAT, AGENTID, FILIAL, user name; closed contracts hidden | 24 fields incl. CONTRACTACCNO, INTERESTACCNO, three EK* equivalents (`temprate`), STOPCALCULATIONDATE; every `type# = 3` contract shown |
| Sorting | MainGridTitleClick ASC/DESC | none (no handler) |
| Filter triggers | check boxes + combos + dates | combos and LCBStatus only |
| Search panel | 8 fields, Ctrl+Shift+S | 6 fields (acc. numbers, last cap. date), Ctrl+Alt+S |
| Close (F8) | only the current record (loop commented out), no right | every marked row, right SBCM_CLOSE_CONTRACT |
| Calc stop/resume | no right | SBCM_STOP_START_CALCPERCENT |
| Rights | DM_CONTRACTUPDATE / DM_CONTRACTLOOK / REPAYMENT / DM_ADMIN (settings button) | one NEW_/EDIT_/SBCM_ right per menu item (table above); no settings-button check |
| Double-click | LookContract | nothing |
| Extra items | Kontrol, Loqlar, Hesablara baxış (Sb_General), WRGroups, BalanceSettings | Əmanətin qismən ödənilməsi, Hesabların sazlanması (hidden) |
| Plugins | NewDeposits*.bpl (NewDepositsManager/*) | SBDM_*_new.bpl (Packages/SBDM_*_new) |

The NewDepositsManager contract / deposit / withdrawal ports (pushed earlier in 0e8df431 and 542b51ac) were removed from the app in this rework; they stay in git history.

## Mock assumptions (bodies not in the repo)

`sbcm_stored_programs_new`: Get_ContractAccount / Get_ContractAccountName = account number / name; GetpercentCollection = fixture string;
CloseDeposit zeroes the state rows and sets calculationenabled 0 (ORA-20101 if already closed); IsCalculationEnabled = calculationenabled = 1;
Disable/EnableCalculation set it 0 / 1.

## Unverified

- TXDBGrid (XDBGrids.pas not in the repo): SelectedRows with `MultiSelectOptions = [msNone]` + dgExtendedSelect/dgMarkerAutoToggle is assumed to work like TDBGrid multi-select (Ctrl+click). If XDBGrid never fills SelectedRows, F8 closes nothing in Delphi.
- After Close the Delphi Refresh keeps the record position; the web selects the first row.
- `(select distinct stopcalculationdate …)` / `calculationenabled` raise ORA-01427 in Oracle when the state rows differ; the mock data keeps them equal.
- DateSeparator for the opendate filter literal (az-AZ '.').
- Package call commit behaviour: no explicit Commit in the form; DepositsData `CommitOnPost = False`.
