# Parity: Deposits manager (DepositsManager_New, production)

**Status: complete** (2026-10-20) except the items held by the user (contract prints SBDM_WReport_new / SBDM_ContractReport_new, the print setup SBDM_WRSetup_new, the reports SBDM_PeriodReport_new / SBDM_Report_new / SBDM_ReportofBalance_new) and the two plugins skipped (no source, per user Oct 20, 2026: SBDM_PercentConverting_new 'Faizlərin hesablanması', SBDM_Filter_new 'Filter Paneli') – these open the "not migrated" / "on hold" notice.

| | |
|---|---|
| Production module | **`Packages/DepositsManager_New`** (user decision 2026-10-20). Built in `SBWorld_Tale.groupproj` together with the `Packages/SBDM_*_new` plugins. |
| CLSID | `{FC4F6C2E-FDCA-40AF-AE35-8F57F648EE56}` CLASS_DepositsManager_new (DepositsManager_New_TLB.pas:52) |
| Delphi source | `DepositsManagerImpl_new.pas` (1155 lines) + `.dfm`, `DMDepositManagerImpl_new.pas/.dfm`, `Packages/SBDM_Common_new/CommonDeclsImpl_new.pas` |
| Oracle objects | `sbcm_contracts_new`, `sbcm_contract_accounts_new`, `sbcm_contract_state_new`, `sbcm_tranches_new`, `sbcm_deposit_Types_new`, `sbcm_categories_new`, `sbcm_persons_new`, `temprate`, `avalute`, `filial`, `user$`, `sysdat`, `bankinfo`; packages `sbcm_stored_programs_new` (pmNamed), `sb_aca` |
| Web | API `api/app/deposits.py`, SQL `api/app/dep_sql.py`, mock `api/app/db/mock_dep.py` + `api/fixtures/deposits.json`, UI `web/public/modules/deposits.js` (route `/m/depositsmanager-new`) |
| Tree / modules.json | Mock tree Item4\Item0 "Deposits manager" → `axinplace:{FC4F6C2E-…}`; `web/modules.json` marks DepositsManager_New migrated and the two NewDepositsManager CoClasses not migrated |
| Tests | `api/tests/test_deposits.py` (14) + one test file per plugin (`test_dep_*.py`, incl. `test_dep_settings.py` 6, `test_dep_pct.py` 4); E2E `e2e/deposits_screens.py` + `e2e/dep_*_screens.py`; screenshots 250–294 |

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
| Yatırım (miDeposit, N23 Ctrl+D) | NEW_SBCM_TRANSH | SBDM_ApplyMoney_new.bpl | Packages/SBDM_ApplyMoney_new (3 / 1440) | **ported** – api/app/dep_ops.py, deposits_ops.js |
| Əmanətin ödənilməsi (miWithdraw, N25 Ctrl+M) | NEW_SBCM_PEYMENT | SBDM_ExtractMoney_new.bpl | Packages/SBDM_ExtractMoney_new (3 / 1518) | **ported** – api/app/dep_ops.py, deposits_ops.js |
| Əmanətin qismən ödənilməsi (N15) | NEW_SBCM_PARTIAL_PEYMENT | SBDM_PartialPayment_new.bpl | Packages/SBDM_PartialPayment_new (3 / 1392) | **ported** – api/app/dep_partial.py, deposits_ops.js (non-functional in production, see section) |
| Kapitallaşdırma (miCapitalization, N24 Ctrl+T) | NEW_SBCM_CAPITALIZATION | SBDM_Capitalize_new.bpl | Packages/SBDM_Capitalize_new (2 / 1130) | **ported** – api/app/dep_capitalize.py, deposits_ops.js |
| Əmanətin vaxtsız ödənilməsi (N26 Ctrl+U) | NEW_SBCM_UNTIMELY | SBDM_UntimelyEtMoney_new.bpl | Packages/SBDM_UntimelyEtMoney_new (1 unit in dpk / 1971) | **ported** – api/app/dep_untimely.py, deposits_ops.js |
| Faizlərin hesablanması (N12, N27 Ctrl+P) | NEW_SBCM_CALC_PERCENT | SBDM_PercentConverting_new.bpl | **source not in the repo** (only referenced by NewDepositsManager/NewDepositsExtractMoney/NewDepositsPercentConverting.dpk as `..\SBDM_PercentConverting_new\`, folder missing) | skipped (no source, per user Oct 20, 2026). Re-searched the whole repo: only the classic-schema SBDM_PercentConverting / SBDM_Filter exist (DepositsManager/, DepositTeze/ – sbcm_* classic tables, DepozitAqroinvest_neftfondu/, NewDepositsManager/NewDepositsFilter); none is the _new source |
| Prolonqasiya (N9, N8) | NEW_SBCM_PROLONGATION | SBDM_Prolongation_new.bpl | Packages/SBDM_Prolongation_new (2 / 800) | **ported** – api/app/dep_prolong.py, deposits_ops.js |
| Ödəmə planı (N36; N14 invisible) | – | Sbdm_Shedule_new.bpl | Packages/Sbdm_Shedule_new (3 / 1577) | **ported** – api/app/dep_shedule.py, deposits_ops.js |
| Filter Paneli (N10 Ctrl+F) | – | SBDM_Filter_new.bpl | **source not in the repo** | skipped (no source, per user Oct 20, 2026). Re-searched the whole repo: only the classic-schema SBDM_PercentConverting / SBDM_Filter exist (DepositsManager/, DepositTeze/ – sbcm_* classic tables, DepozitAqroinvest_neftfondu/, NewDepositsManager/NewDepositsFilter); none is the _new source |
| Yatrımların və yığımların çapı (N20) | SBCM_PRINT_APPLYMONEY | SBDM_ContractReport_new.bpl | Packages/SBDM_ContractReport_new (3 / 3155) | **on hold by user** |
| Müqavilə çapı (N21) | SBCM_PRINT_CONTRACT1 | SBDM_WReport_new.bpl | Packages/SBDM_WReport_new (2 / 629) | **on hold by user** |
| Sazlamalar: Bankın seçmələri (N1, Visible False) | – | SBDM_Settings_new.bpl showrefer | Packages/SBDM_Settings_new (9 / 2908) | **ported** (hidden: opened only by code) – api/app/dep_settings.py, deposits_settings.js |
| Sazlamalar: Hesab qrupları (N2) | SBCM_ACCOUNT_GROUP | SBDM_Settings_new.bpl showcccgroups | same | **ported** – dep_settings.py |
| Sazlamalar: Müştəri tipləri (N3) | SBCM_CUSTOMERS_TYPE | SBDM_Settings_new.bpl showcategories | same | **ported** – dep_settings.py |
| Sazlamalar: Depozitin tipləri (N4) | SBCM_DEPOSIT_TYPE | SBDM_Settings_new.bpl showdeposittypes | same | **ported** – dep_settings.py |
| Sazlamalar: Gəlir zərər hesablarının sazlanması (N5) | SBCM_LOSS_INCOME_ADJUSTMENT_ACC | SBDM_Settings_new.bpl showaccountturning | same | **ported** – dep_settings.py |
| Sazlamalar: Müqavilə çapı (Sazlanması) (N6) | SBCM_PRINT_CONTRACT | SBDM_WRSetup_new.bpl showSBWRBookmarkSetup | Packages/SBDM_WRSetup_new (6 / 2006) | **on hold** (user decision: held together with the contract prints) |
| Sazlamalar: Faizlərin sazlanması (N7) | SBCM_PERCENT_SETTING | SBDM_PercentSettings_new.bpl | Packages/SBDM_PercentSettings_new (1 / 1833) | **ported** – api/app/dep_pct.py, deposits_pct.js |
| Sazlamalar: Hesabların sazlanması (Hesablarin1, Visible False) | – | SBDM_DepozitAccSettings_new.bpl | Packages/SBDM_DepozitAccSettings_new (1 / 64) | **ported** (empty form; hidden) – deposits_pct.js |
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

## SBDM_ApplyMoney_new.bpl / SBDM_ExtractMoney_new.bpl (Yatırım, Əmanətin ödənilməsi) + TrDelayed_Show

| Delphi | Web |
|---|---|
| frmApplyMoneynew: Tranches grid (№, Tarix, Məbləğ, Faiz, Qeyd), 'Müqavilə haqqında' / Müştəri, Yeni / Silmək / Excel -ə at / Çıxış | list modal; Sil and Excel always enabled (no OnUpdate in the dfm) |
| ActnAdd: INSERT_SBCM_TRANSH; frmAddMoneynew FormShow: getpersentTransh -> PercentEdit (FloatToStr), counttranch, Get_BankDate | `/apply/add` |
| ActnTransactionExecute AM:104-267: Percent = 0 message; checkedtranch / checkedaddtranch / checkedtranch_max_limit all called; check1 only when counttransh = 0, check2 + check3 only when > 0; depositmoney(..., Trname 'null', usetransaction True) | `/apply/run`, keys a_chk1_*, a_chk2_*, a_chk3_* (verbatim az texts) |
| ActnDel: DELETE_SBCM_TRANSH, 'Silinməsinə əminsinizmi?', DeleteDepositMoney(P_DepMoneyID), no commit | `/apply/delete` (stays pending in the session like the Delphi session) |
| ActnExport: EXCEL_SBCM_TRANSH, sheet 'Depozit yatrımları' | `/apply/export.xlsx` |
| frmExtractMoney_new: Payments grid (№, Tarix, Əsas məbləğdən, Faiz məbləğindən), Yeni / Ləğv etmək / Excel -ə at / Çıxış; Del/Excel need RecordCount > 0 | list modal, buttons disabled on an empty grid, the API re-checks |
| frmAddExtractMoney_new: Əsas məbləğ / Faiz məbləği groups, Tarix, Müştəri Hesab (CreditAccs = InternalBankAccs zone, Locate ClientACCID); Actiontr enabled when main + interest > 0; WithDrawMoney(..., UseTransactions, showTransaction True) | `/extract/add`, `/extract/run` |
| TrDelayed_Show: SBCM_DELAYED_TRANSACTIONS_new grid (Tarix, Debet, $, Kredit, $, Kassa sim., TrAmount), Təyinatı; Təsdiq et / İmtina et ('Əməliyyat aparılmayacaq! Əminsinizmi?'); Commit<Op>(DoCommit) | delayed modal; second call `/delayed/finish {ok}` on the same session; a confirmation left open is dismissed (Commit(False)) before the next operation |
| FormClose: RefreshWithSavely when an operation was OK | main grid reload on Çıxış |

Mock assumptions (package bodies not in the repo): depositmoney / WithDrawMoney write one delayed posting per leg; Commit*(True) inserts into sbcm_tranches_new / sbcm_payments_new and moves sbcm_contract_state_new; the three tranche checks come from fixture `_tranch_checks` (default 1 / 3 / 5 = OK); getpersentTransh = sbcm_interests_new.INTEREST.

Unverified: E_SQL_CREDITACCS / E_SQL_CUSTACC use the classic `sbcm_acc_zone_info` and `sbcm_stored_programs.Get_ContractAccount` exactly as the _new dfm does (looks like a leftover in the Delphi source, kept verbatim); PL/SQL BOOLEAN arguments (usetransaction, DoCommit) passed as Python bool in thin mode; N1 'Əməliyyata baxmaq' opens SBDM_TransactionViewer.bpl (not migrated, shows a notice).

## SBDM_Prolongation_new.bpl (Prolonqasiya)

| Delphi | Web |
|---|---|
| exportproc: prolongations (`sbcm_prolongations_new`, order by hdate) + DepositInf (closedate) for Get_SelectedContID | `/api/deposits/prolong/open` |
| Toolbar Əlavə etmək / Silmək (ActnDel 'Sonuncunu silmək') / Excel-ə at / Çıxış; Del and Excel need RecordCount > 0 | list modal; disabled on an empty grid, the API re-checks |
| ActnAddProlong: INSERT_SBCM_PROLONGATION; frmAddProlongation_new FormShow: DTPNew := Get_BankDate, DTPLast := CloseDate | `/prolong/add/open` |
| BitBtnOkClick: Trunc(DTPNew) <= CloseDate -> 'Tarixi düzgün  daxil edin !' (form stays open); else AddProlongation(ContractID, Get_BankDate, ProlongDate) positional, Refresh both | `/prolong/add`, key p_err_date |
| ActnDel: DELETE_SBCM_PROLONGATION, 'Silinməsinə Əminsinizmi?', DelLastProlongation(Get_SelectedContID) | `/prolong/delete` |
| ActnExport: EXCEL_SBCM__PROLONGATION (double underscore, verbatim), sheet 'Prolonqasiya', ID# hidden | `/prolong/export.xlsx` |

No Commit is issued by the plugin after AddProlongation / DelLastProlongation, and the manager grid is not refreshed on close (no FormClose handler); both kept. Mock assumption: AddProlongation logs (old closedate -> new) and moves sbcm_contracts_new.closedate; DelLastProlongation removes the newest row and restores OLDDATE.

## Sbdm_Shedule_new.bpl (ödəmə planı)

| Delphi | Web |
|---|---|
| exportproc: caption '%s № li müqavilə üçün ödəmə planı.', sbdm_customers (customers × sbcm_contracts_new), OracleDataSet1 (sbcm_interests_new), OracleDataSet2 (SBCM_PAYMENT_SCHEDULE_new, SeqNo = RecNo), OracleDataSet3 (type with DATEINTERVAL > 0) | `/api/deposits/shedule/open` |
| Müştəri / Depozit Haqqında (Depozitin məbləği, İllik faiz (%), Verilmə / Qaytarılma Tarixi), grid №, Tarix, İllik Faiz, Hesablanmış faiz | same layout |
| Toolbars: Yaddaşa yaz, Çap, Çıxış / Yeni, Redaktə, Silmək, Yeniləmək, Plan, Planı dəyiş – every TAction has no OnExecute (shown disabled); ToolButton1Click / ToolButton14Click are not wired to any OnClick | the same buttons disabled; Save and Delete become enabled after Plan (ToolButton18Click sets Enabled) but do nothing (notice) |
| ToolButton18Click 'Plan': getdateinterval(StrToDate(open), StrToDate(close)), getconverteddebt(interval, amount, interest) as Integer, Periodların sayı := DATEINTERVAL ('' when OracleDataSet3 is empty); DateTimePicker1 keeps the dfm value 23.04.2010 21:40:02 (the get_date line is commented out) | `/shedule/plan/open` |
| Button1Click 'Qəbul': SBCM_PAYMENT_SCHEDULE1_new.sbcmperiod(deposid, PaymentDate incl. time, per_amount, period => StrToInt, perc => StrToCurr(DBEdit2)); Refresh; form stays open; İmtina closes | `/shedule/plan/accept`; StrToInt error -> s_err_int |

No right check (N36Click), no Commit in the plugin; ActionClose has no handler, so the web form closes with the title-bar ✕ (the Delphi window close box). Mock assumptions: getdateinterval = whole months, getconverteddebt = amount × rate / 100 × months / 12 rounded, sbcmperiod replaces the rows with <period> monthly rows of per_amount / period.

## SBDM_UntimelyEtMoney_new.bpl (vaxtından əvvəl ödəmə)

| Delphi | Web |
|---|---|
| exportproc: DepositInfo (SbcmOpenDate, SBCMGetOldDate, GetpercentCollection, sbcm_payment_new.GetOverduePercent_new, the three accounts, FACTICALDEBT / FACTICALINTERESTDEBT), CreditAccs (opened, unused), DepositAccno (outComeAccForDeposit per currency and category); caption '<no> nömrəli depozitin vaxtından əvvəl ödənilməsi' | `/api/deposits/untimely/open` |
| 'Kredit Hesabın №': AccountListCB has no ListSource; DBEditEh8 (DepositAccno.ACC_NO) lies on top of it | read-only DepositAccno.ACC_NO |
| FormShow: DTPCalcPercent := OpenDate, DTPBankDate := Get_BankDate (editable, unused) | same |
| Button1Click: UntimeWithDrawMoney(ContractID, Trunc(DTPCalcPercent), p_CreditAccID => DepositAccno.ID, p_checdpercentpeyment => checkbox 1/0, p_FACTICALINTDEBT) outside the try; TrDelayed_Show 'Depozitin vaxtından əvvəl ödənilməsi ...'; CommitWithDrawMoney(DoCommit); OK closes the form | `/untimely/run` + `/delayed/finish` |
| Button2Click İmtina: Session.Rollback; Close. Esc: Close only | `/untimely/cancel`; Esc closes without the call |

Right NEW_SBCM_UNTIMELY is re-checked by the API (the manager checks it before LoadPlugin). The manager grid is not refreshed afterwards (as in Delphi). frmUntimelyEtMoneyImpl.pas (no _new suffix) in the same folder is a dead older copy. Mock assumptions: UntimeWithDrawMoney pays the whole principal plus either the accrued interest (checkbox) or the principal × untimely rate (fixture `_rates[type][1]`) × days(calc date → bank date) / 365; commit zeroes the state.

## SBDM_PartialPayment_new.bpl (qismən ödəmə)

The production plugin is a viewer only; the web port reproduces that.

| Delphi | Web |
|---|---|
| exportproc: Payments (`sbcm_tranches_new`), DepositInfo, DebitAccs / CreditAccs / PercentAccs (classic `sbcm_acc_zone_info` × `sbcm_acc_zones_new`, verbatim), Sysdat | `/api/deposits/partial/open` |
| Grid: AutoNumber №, Tarix, Faiz, Yatrım Məbləği, Qeyd; Müştəri | same |
| Yeni: INSERT_SBCM_PARTIAL_PEYMENT, FrmPaymentAdd_new (Əməliyyat Tarixi, Müştəri Hesab, Əsas məbləğ / Faiz məbləği with Hesabın №, Qalıq, Ödəniləcək məbləğ; FormShow zeroes) | `/partial/add/open` |
| Ləğv et / Excel-ə at: actions without OnExecute (disabled); OnClick only checks DELETE_/EXCEL_SBCM_PARTIAL_PEYMENT | disabled buttons |
| Qəbul: ActionTr has only OnUpdate (enabled when amount > 0), no OnExecute | enabled by the amount, click = notice, nothing is posted |
| EdMainDebitChange (SetPaymentPecentAmount with GetParameter(3/4)) is not wired to EdMainDebit.OnChange | not called; interest fields stay 0 |
| N1 'Əməliyyata baxmaq' has no OnClick | no context menu |

Unverified: whether VCL greys out Ləğv et / Excel-ə at (DisableIfNoHandler) or lets their OnClick run the right check only – the outcome is the same, nothing happens.

## SBDM_Capitalize_new.bpl (kapitallaşdırma)

| Delphi | Web |
|---|---|
| exportproc: DepositInfo (classic `sbcm_stored_programs.Get_ContractAccount`, verbatim), Capitals (`sbcm_capitalization_new`); caption '<no> nömrəli depozitin  kapitallaşdırılması' | `/api/deposits/capitalize/open` |
| Toolbar Yeni / Ləğv etmək / Excel -ə at / Çıxış; grid №, Tarix, Məbləğ (TRID hidden); 'Müqavilə haqqında' / Müştəri | list modal |
| ActnAddTr: INSERT_SBCM_CAPITALIZATION, frmAddCapitalize_new (Tarix = Get_BankDate disabled, Məbləğ, Əsas məbləğ / Faiz məbləği accounts and balances); ActnTransUpdate: > 0 | `/capitalize/add/open` |
| ActnTransExecute: Capitalization(ContractID, HDate, Total, UseTransactions True) outside the try; TrDelayed_Show 'Depozit karitallaşdırılması ...' (typo in the source, kept); CommitWithDrawMoney(DoCommit); OK closes and refreshes Capitals | `/capitalize/run` + `/delayed/finish` |
| ActnDel (no OnUpdate – enabled on an empty grid): DELETE_SBCM_CAPITALIZATION, 'Silinməsinə əminsinizmi?', DeleteCapitalization(p_capitalizationID), no commit | `/capitalize/delete` |
| ActnExport (RecordCount > 0): EXCEL_SBCM_CAPITALIZATION, sheet 'Kapitallaşdırma' | `/capitalize/export.xlsx` |

CanAfterRefresh is assigned but never read, so the manager grid is not refreshed on close (kept). Mock assumption: Capitalization moves Total from the accrued interest to the principal (interest account → deposit account posting).

## SBDM_Settings_new.bpl (Sazlamalar: N1–N5)

ReferLoader_new.exportproc creates the form and ShowModal per parameter. API `api/app/dep_settings.py` (`/api/deposits/sett/*`), SQL `dep_settings_sql.py`, UI `deposits_settings.js`, tests `test_dep_settings.py` (6), E2E `e2e/dep_settings_screens.py`, screenshots 283–289.
All five forms edit TOracleDataSets directly; DOA's default ApplyRecord is reproduced (insert / update / delete by rowid with the persistent fkData fields), CommitOnPost (default True) commits each Post / Delete, TDataSet.Post checks Required fields ("Field '<DisplayName>' must have a value"). The OnApplyRecord handlers of DepositTypes and settings only read fields (their package calls are commented out) and leave Applied False, so the default applies.

| Form | Delphi | Web |
|---|---|---|
| showcategories (frmCategoriesImpl_new) | DBGridEh + TDBNavigator on `sbcm_categories_new`; **Esc in the grid = Categories.Delete** (DBGridEh1KeyPress, no confirmation) and KeyPreview FormKeyPress closes the form | navigator (first … refresh), Esc closes **and deletes the current record** (as in Delphi; an inserted row is cancelled) |
| showcccgroups (frmAccGroupsImpl_new) | acc_zones (read-only list) master → acc_zone_info detail (DetailFields ZONEID, editable, navigator) | zones grid + editable detail grid; new rows get ZONEID := the zone |
| showdeposittypes (frmDepositTypesImpl_new + frmAddEditDepositTypesImpl_new) | Yeni / Redaktə / Silmək / Yeniləmək / Bağla; add-edit form: Adı (TYPE, required), Tipi (WITHDRAWTYPE lookup over `sbcm_deposit_addtypes_new` withdrtype<>'Inadvance'), CheckBox2 'Cari məbləğə görə hesabla' → AMOUNT_RULE, hidden CheckBox1 → PERCENT_RULE; Qəbul = Post (commit), İmtina = Cancel; Esc only closes – the caller's Refresh then runs CheckBrowseMode (Post if modified) | same; Silmək = 'Silinməsinə əminsinizmi?' + `SBCM_RPDEPOSITORY_new.delDepositTypes(ID)` positional, **no commit** |
| showaccountturning (frmAccountTurningImpl_new + frmAddEditAccTurningImpl_new) | Categories → movie_names (TYPEID) → settings (PARENTID) with lookup fields filialname / currencyname / accountnumber; Add / Edit / Del actions (Edit / Del enabled when RecordCount > 0), Yeniləmək, Bağla; add-edit: Filial, Valyuta, Hesab № (Accounts: InternalBankAccs zone); Qəbul sets CurrencyID := valute.Valute then Post | same |
| showrefer (frmReferencesImpl_new, menu N1 Visible = False) | tree from `SBCM_References_new` (ParentID = -1 recursively); value edit or ';'-split combo; Qəbul → `sbcm_rpdepository_new.UPD_SBCM_REFERENCES(ID, Name, LName, ParentID, NewValue, SourceList)`, Refresh, no commit | reachable only by code (`SB.depForms.sett_refer()`), same behaviour |

## SBDM_PercentSettings_new.bpl (Faizlərin sazlanması, N7)

API `api/app/dep_pct.py` (`/api/deposits/pct/*`), SQL `dep_pct_sql.py`, UI `web/public/modules/deposits_pct.js`, tests `test_dep_pct.py` (4), E2E `e2e/dep_pct_screens.py`, screenshots 290–293. P = PercentSettingImpl_new.pas.

| Delphi | Web |
|---|---|
| Layout: Depozitlərin tipləri / Müddətlər üzrə + Kapitallaşdırma müddətləri üzrə / Valyutalar + Məbləğlər / Artım Məbləğləri və Faizlər / Müddətdən əvvəl faiz dərəcələri; Yaddaşa yaz, Təsdiqlə, 'Əvvəlki yatrımlarında % dərəcələrini dəyiş' | same order and grid columns (dfm titles / DisplayLabels; № = AutoNumber) |
| Cursor chain: DepositTypes → depperiods (DEPID) → depcapitalperiods (PERIODID); any of these or Valutes → WaitForOp reopens DSsbcm_amount_setting(periodid, currencyid) → DSRsbcm_amount_settingDataChange reopens DepositPerSetting(depid, periodid, capitalid, currencyid, amount_setting_id) → WaitFor reopens Depositdatsettings (P:421-650) | `state()` resolves the same chain; dependents go back to the first row whenever an upper cursor moves; a record being inserted counts as ID 0 |
| DepositTypes / Valutes have no ROWID (read-only); the other five grids edit with DOA's default ApplyRecord, CommitOnPost, AfterPost Refresh | same; keys as TDBGrid: Insert / Down on the last row (append), F2 / double-click / typing (edit), moving to another row posts; **Enter also posts (web convenience)** |
| Delete key (XDBGrid3KeyDown on periods / caps / amounts, XDBGrid6KeyDown on Depositdatsettings): RecordCount > 0, 'Silinməsinə əminsinizmi?', Delete (commit) | same |
| XDBGrid5KeyDown (rates): confirm, `deppseting_hist_new(id, 0)`, Delete | same |
| XDBGrid7KeyPress (amounts): PeriodID, Currencyid := current period / currency | applied to the posted record after a key press in insert / edit state |
| XDBGrid6KeyPress (early payout): Depsetid := DepositPerSetting.ID, Depid, PeriodID, CapitalID, valcod, amount_setting_id | same |
| XDBGrid5KeyPress (rates), **on every key press**: read the 18 values (AsFloat), then (insert / edit) assign DepID, PeriodID, CapitalID, Currencyid, amount_setting_id, WRITE_MEMORY 0, CONFIRMATION 0, hdate := sysdat.tek_dat, then `deppseting_upd_hist_new(18 values)` | one `/keypress` call per key press (queued, in order) with the values written to the fields so far; no commit |
| XFButton1 Yaddaşa yaz: right SBCM_PERCENT_SETTING_SAVE, `upd_confir_and_writ_memory_new(valute, period, capital, type, amount_setting, 0)`, ShowMessage | same, no commit |
| XFButton2 Təsdiqlə: right SBCM_PERCENT_SETTING_COMMIT; checkbox → MessageDlg → `upd_transh_percent(keys, Məbləğ(min), Məbləğ(max), İllik%)`; `say := get_write_memory(keys)`; > 0 → '…yaddaşa yazılmadığından təsdiqlənə bilməz!'; = 0 → `upd_confir_and_writ_memory_new(…, 1)` + '…təsdiqləndi.'; < 0 → nothing | same; the browser shows the question between two calls, so the right is checked twice; no commit |
| Esc: the grid cancels its edit, KeyPreview closes the form, XDBGrid5KeyPress still runs (one more history call when the rates grid has focus) | same |
| The form is created in `initialization` and the package is never unloaded, so later openings keep the cursor positions (FormShow's Open calls are no-ops) and XFCheckBox1 is reset | cursor positions kept in the browser; the data is re-read on each opening (Delphi would show the data of the first opening until a Post / Refresh) |

DSsysdat `select * from sysdat` is read through the manager's `select tek_dat from sysdat` (only TEK_DAT is used). `sbcm_amount_setting` (no `_new`) is used verbatim.

## SBDM_DepozitAccSettings_new.bpl (Hesabların sazlanması, Hesablarin1 Visible = False)

FrmDepozitAccSettings contains only a TStatusBar; KeyPreview is on but there is no key handler, so Esc does nothing and the window close box closes it. The web shows the same empty form with a ✕ button (reachable only by code, `SB.depForms.sett_accounts()`), screenshot 294.

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
`SBCM_RPDEPOSITORY_new`: delDepositTypes refuses a type used by a contract (ORA-02292); UPD_SBCM_REFERENCES updates the row.
`sbcm_percent_converting_new`: deppseting_upd_hist_new / deppseting_hist_new / upd_transh_percent are logged only; upd_confir_and_writ_memory_new sets write_memory (flag 0) or confirmation (flag 1) to 1 on the selected rate rows; get_write_memory = number of selected rate rows with write_memory 0. New rows get their ID from an assumed BEFORE INSERT trigger (max + 1).

## Unverified

- TXDBGrid (XDBGrids.pas not in the repo): SelectedRows with `MultiSelectOptions = [msNone]` + dgExtendedSelect/dgMarkerAutoToggle is assumed to work like TDBGrid multi-select (Ctrl+click). If XDBGrid never fills SelectedRows, F8 closes nothing in Delphi.
- After Close the Delphi Refresh keeps the record position; the web selects the first row.
- `(select distinct stopcalculationdate …)` / `calculationenabled` raise ORA-01427 in Oracle when the state rows differ; the mock data keeps them equal.
- DateSeparator for the opendate filter literal (az-AZ '.').
- Package call commit behaviour: no explicit Commit in the form; DepositsData `CommitOnPost = False`.
- DOA `UpdateStatus` outside cached updates: the PercentSettings KeyPress handlers assume it reports usInserted / usModified for the record being inserted / edited. If DOA returns usUnmodified there, Delphi never assigns the master values and a new rate row fails on 'CURRENCYID must have a value'.
- DOA default ApplyRecord column list (all persistent data fields vs. only modified ones) and the ID source for new settings rows (trigger / sequence) – the web inserts every data field, ID null.
- SBDM_PercentSettings_new on a second opening shows the data of the first opening in Delphi (datasets stay open); the web re-reads it.
- The real bodies of the sbcm_percent_converting_new procedures and of delDepositTypes / UPD_SBCM_REFERENCES (not in the repo).
