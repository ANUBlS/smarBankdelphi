# Parity: Deposits manager (NewDepositsManager)

| | |
|---|---|
| CLSID | `{9ABE87C4-2DB3-41CE-BF01-6B6EED2677C5}` CLASS_NewDepositsManagerImpl (TLB:55); second CoClass `{776C93C9-…}` TNewDepositsManager_ uses the same route |
| Delphi source | `NewDepositsManager/NewDepositsManager/NewDepositsManagerForm.pas` (1111 lines) + `.dfm`, `NewDepositDataModule.pas/.dfm`, `NewDepositsCommon/NewCommonDeclsImpl.pas` |
| Web | API `api/app/deposits.py`, SQL `api/app/dep_sql.py`, mock `api/app/db/mock_dep.py` + `api/fixtures/deposits.json`, UI `web/public/modules/deposits.js` (route `/m/newdepositsmanager`) |
| Tree | Mock tree Item4\Item0 "Deposits manager" Action #9 (CaptionKey `deposits.title`) |
| Tests | `api/tests/test_deposits.py` (14), E2E `e2e/deposits_screens.py`, screenshots 242–249 |
| Production lineage | NewDepositsManager/ has the newest real OCX builds (2013-12-05, archive 2018-05-12). **Please confirm** that DepositsManager / DepositsManager_New / DepositTeze / DepozitAqroinvest_neftfondu are not in production use. |

## Main form: what is ported (lists first)

| Delphi | Web | Ref |
|---|---|---|
| DmDataSet main SQL (verbatim, `order by :OrderField` otSubst) | `SQL_DMDATASET`; `:OrderField` uses only the 16 MainGrid column names, `cont.id` by default | dfm:198-242 |
| Lookups: avalute, filial, dm_types, dm_categories, dm_persons, sysdat, bankinfo | `/api/deposits/init` | dfm:7-163 |
| PrepareFilter: each combo KeyValue := first record (0 if empty) | `defaults` | pas:676-688 |
| MainGridTitleClick: `FIELD ASC`, then DESC on the second click | header click ▲/▼ | pas |
| BuildFilterString + `Filtered := True` (TDataSet.Filter) | literal port, evaluated by `tdataset_filter.py`; the expression is shown under the grid | pas:611-673 |
| Checkbox/combo/date change → ActnFilterExecute | the same change events reapply the filter (CBStatus has no OnClick, so it waits for the next change) | dfm |
| TBFilteration: toggles FilterPanel, both pickers := bank date | Filter button toggles the top panel (no left sidebar, by decision) | pas |
| BitBtnexp → CMExcelExport (visible fields, DisplayLabel titles) | `/api/deposits/export.xlsx`, browser download | CMExcelExport.pas:606 |
| Axtarış Paneli (Ctrl+Shift+S): SearchRecord srIgnoreCase+srPartialMatch, from current, forward, wrap confirm, 'Yazı tapılmadı!' | client-side, same messages | pas:280-310 |
| Grid multi-select (dgExtendedSelect) | Ctrl+click | dfm |
| ToolButton7 Yeniləmək → N28Click (reopen + Locate ID, only if RecordCount>0) | Refresh | pas |
| N18 Bağlamaq (F8) → `dm_stored_programs.CloseDeposit(ContractID)` + Refresh | `POST /{id}/close`, **no commit** (`pending: true`) | pas:819-848 |
| N19 Hesablamanı dayandırmaq/davam etdirmək → IsCalculationEnabled, then Disable/EnableCalculation | `GET/POST /{id}/calc`, no commit | pas:850-869 |
| Sazlamalar ▾ → CheckAdvancedObjectAccess('DM_ADMIN') before the drop-down | `/settings-menu` | pas:1094 |
| Rights on handlers: DM_CONTRACTUPDATE (edit), DM_CONTRACTLOOK (dbl-click), REPAYMENT (vaxtsız), DM_ADMIN (settings) | `sb_aca.checkadvancedobjectaccess` before the plugin call | pas |
| Shortcuts: Ctrl+N/E/D/M/P/F/T, F8, Ctrl+Shift+S | same keys (browsers may keep Ctrl+N for "new window") | dfm |

## Plugin forms (BPL): status

All of these are called via `LoadPlugin(bpl, param)` (NewCommonDeclsImpl.pas:31-41). In the web app the right check runs, then the page shows "not migrated yet (BPL)".

| Menu | BPL / param | Delphi folder (units / lines) | Status |
|---|---|---|---|
| Yeni / Redaktə / dbl-click | NewDepositsContract.bpl InsertContract / EditContract / LookContract | NewDepositsContract (6 / 1550) | **ported** (see below) |
| Yatırım | NewDepositsApplyMoney.bpl | NewDepositsApplyMoney (6 / 1367) | todo |
| Əmanətin ödənilməsi | NewDepositsExtractMoney.bpl | NewDepositsExtractMoney (3 / 548) | todo |
| Kapitallaşdırma (toolbar) | NewDepositsCapitalize.bpl | NewDepositsCapitalize (2 / 362) | todo |
| Əmanətin vaxtsız ödənilməsi | NewDepositsUntimelyEtMoney.bpl (REPAYMENT) | SBDM_UntimelyEtMoney_new (3 / 558) | todo |
| Faizlərin hesablanması | NewDepositsPercentConverting.bpl | NewDepositsPercentConverting (5 / 1219) | todo |
| Prolonqasiya | NewDepositsProlongation.bpl (+ Refresh) | NewDepositsProlongation (2 / 288) | todo |
| Ödəmə planı | NewDepositsShedule.bpl | NewDepositsShedule (3 / 340) | todo |
| Müqavilə çapı | NewDepositsWReport.bpl | NewDepositsWReport (2 / 247) | on hold (print) |
| Filter Paneli (Ctrl+F) | NewDepositsFilter.bpl | NewDepositsFilter (4 / 597) | todo |
| Hesablara baxış | Sb_General.bpl depozit_stetment | Packages | todo |
| Settings: groups / categories / types / account turning | NewDepositsSettings.bpl show* | NewDepositsSettings (12 / 1315) | todo |
| Settings: print files / types | NewDepositsWRSetup.bpl, NewDepositsWRGroups.bpl | (6 / 593), (4 / 458) | todo |
| Settings: percent / balance | NewDepositsPercentSettings.bpl, NewDepositsBalanceSettings.bpl | (7 / 1439), (1 / 96) | todo |
| Reports: Mis / Kontrol / Loqlar | NewDepositsReport.bpl, NewDepositsControl.bpl, NewDepositsLogs.bpl | (2 / 397), (1 / 117), (2 / 255) | on hold (reports) |
| Archive module | NewDepositsArchive (separate CLSID {D24ECADF-…}) | (3 / 1228) | todo |

## NewDepositsContract.bpl (new / edit / view contract)

API `api/app/dep_contract.py` (`/api/deposits/contract/*`), SQL `dep_contract_sql.py`, UI `web/public/modules/deposits_contract.js`,
tests `api/tests/test_dep_contract.py` (14), E2E `e2e/dep_contract_screens.py`, screenshots 250–254.

| Delphi | Web | Ref |
|---|---|---|
| exportproc InsertContract / EditContract / LookContract | `POST /open {mode}`; Edit checks DM_CONTRACTUPDATE, Look DM_CONTRACTLOOK first (manager handlers) | F:634-688 |
| PanelInsertVizible: dm_contract_type NAME = panel, PANELTYPE=1 visible at TOPID, other listed panels hidden | `panels()`; unlisted panels keep the dfm Visible (AgentPanel, PecentDatePanel hidden) | F:191-222 |
| PanelUpdateVizible: every listed panel visible at TOPID except ThirdPersonNamePanel | same | F:223-284 |
| DepositTypes Filter 'status=0' on Insert, none on Edit/Look; Filals unfiltered / 'id='+BRANCHID | same | F:642-670, 742-747 |
| AddContract: SEG_DM_CONTRACTS (SequenceField amOnNewRecord), CURRENCY 0, Branchid Get_FilialID, dates = PC `Date`, Amount/due/overdue 0.00, prizeid/tocard from the combos, agentid 0 | `add_contract()` | F:693-718, DM dfm:568 |
| DBEditNumberChange (customer no. and currency OnChange): Customers, FPersonstype, ClientTypes (valcategory 1 when currency <> 0) → FClientType; no customer = FClientType keeps its old value | `ev_customer` | F:542-581 |
| ContractTypesChange (+ ComboBoxPrize.OnClick): reopen DepPeriods/DepCapperiod; Insert: `dm_contract.getcontractno(dtid, filialid, przid)` | `ev_type` | F:506-532 |
| LCBPeriodsKeyValueChanged → DepCapperiod reopen (LCBPeriodsChange body commented out) | `ev_period` | F:405-415 |
| LCBCapPerChange: CLOSEDATE by period_type İL/AY/GÜN, DtClose enabled when period<>0, DmDepositPerSettings (amount band), rates (Insert: settings; Edit: record), FDepPerSetid, DBLookupPercent visible when >1 row, FIRSTINTERESTPAYDAT = IncMonth(open, capperiod div 30) | `ev_capper` | F:286-353 |
| CheckNeedsFields: first Null of 9 fields → hint '"%s" sahəsinə qiymət daxil olunmayıb! ' (DisplayLabel) | `deposits.c_err_empty` with the Delphi label | F:443-498 |
| Qeyd et: SaveDeposits → Post → ApplyRecord `dmaddcontract` / `dmupdatecontract` (pmNamed, all 25 names) → **commit** (CommitOnPost default) | same; failed call → rollback | F:883-979, DM:203-279 |
| Insert: AddAccount `dmgenerateaccountnumber` + `getaddaccount` per dm_accno_columname row (p_id 0..n-1), **no commit**, then AddContract (form stays open with the next blank record) | `pending: true`, new record returned | F:835-878, 981-1004 |
| Edit: Self.Close after Post; FormClose → RefreshWithSavely(True) (RecNo kept, selection cleared) when FCommited | `closed: true`, main grid reloads | F:761-767 |
| İmtina et: Insert → Cancel (no new record; the next Qeyd et shows the CUSTOMERID hint); Edit → close | browse state | F:895-898 |
| Bağla / Esc: 'Dəyişiklər qeyd olunmayacaq !' when Modified; F5 RefreshDataSets; Enter → SelectNext | same | F:769-804 |
| Kreditin siyahısı (not FInserted): CreditContractno with :contractid := **DepositPorpsSID** (SID#), lookups Name/FilialName from the form's single-customer / filtered-filial datasets | `/credits` | NewFormCreditImpl.pas:31-38 |
| ThirdPerson '...' toggles ReadOnly | same | F:821-833 |

Contract-form quirks kept: `overdueinterest := dueinterest field` and `dueinterest := overdueinterest field` are crossed in SaveDeposits (F:965-966);
the credit list filters by the user SID# instead of the contract ID; FCommited is never reset while the BPL stays loaded (web: per form open);
DBLookupPercent has no DataField, so picking a rate there changes nothing; GenAnnualInt only reads values.

Contract-form unverified items:
- The order in which the EhLib data-aware controls fire OnChange when a record is loaded. The web runs customer → type → periods → capital period on open.
  In Edit this recomputes CLOSEDATE / FIRSTINTERESTPAYDAT and takes FDepPerSetid from the settings, so saving an unchanged contract can change them.
- Lookup list datasets are assumed to sit on the selected key (EhLib locates the ListSource on selection); the capital periods after a type change are those of the selected period (else the first).
- `dm_contract` body (getcontractno, dmaddcontract, dmupdatecontract, dmgenerateaccountnumber, getaddaccount) and the dm_* DDL are not in the repo; the mock is an assumption.
- In the mock AZN is valute 944, so valcategory is always 1; Delphi's default CURRENCY 0 suggests 0 = AZN on the real DB.

## Delphi quirks, kept as they are

1. **Status filter errors**: BuildFilterString writes `status=…`, but DmDataSet has no STATUS field, so TDataSet raises "Field 'STATUS' not found" and the web app returns `deposits.err_filter`, as Delphi does.
2. **Bağlamaq** shows the "Seçilmiş müqavilələr…" text when more than one row is selected, but the loop is commented out, so only the **current** row is closed.
3. The popup **Yeniləmək** (N28 → ActnRefresh, no OnExecute) is disabled. The toolbar Refresh works.
4. **Kapitallaşdırma** in the grid popup (N24, Ctrl+T) has no handler. N26 (Ctrl+U), N15 and N14 are invisible and are left out.
5. RepairMenu **Period Hesabatı** and **Balans Üzrə Hesabat** have no OnClick, so they do nothing.
6. N19 (calculation toggle) does not refresh the grid, as in Delphi.
7. The Excel export sheet name uses an uninitialized `i` in Delphi. The web app uses 'Depozitlər'.
8. StatusImages, dm_tranches and the users combo (commented out) are unused. The SQL is kept in `dep_sql.py` for reference.
9. TDataSet FilterError messages come out in upper case ('STATUS').
10. N18 with an empty grid would call CloseDeposit(0) in Delphi. The web app does nothing when there is no current row.
11. The MainGrid has persistent columns, so the ID column is shown even though the ID TField has Visible=False (export skips it). **Unverified** on a real build.

## Unverified / mock assumptions
- `DateSeparator` assumed '.' (FormatDateTime('dd/MM/yyyy') in the filter text, which follows the Windows locale on the bank PCs).
- The `dm_stored_programs` package body and `dm_*` DDL are not in the repo. The mock assumes:
  - CloseDeposit deletes from dm_active_contracts and sets status 0.
  - Disable/EnableCalculation set or clear stopcalcdate.
  - IsCalculationEnabled = stopcalcdate is null.
- The real SmartBankIni tree node for deposits (the mock uses Action #9).
- Production lineage (see the top table).
