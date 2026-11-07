# Parity: Packages/TransactionManager → /m/transactionmanager

CLSID `{FF656972-BD77-41BB-848E-D339E05CE52E}` (TransactionManager_TLB.pas:52). Backend: `api/app/transactions.py`, SQL verbatim in `api/app/tm_sql.py`. UI: `web/public/modules/transactions.js`. Tests: `api/tests/test_transactions.py`, `e2e/transactions_screens.py`.

| # | Delphi | Web | Source |
|---|---|---|---|
| 1 | Main dataset (transactions per operation date, `:title` order substitution) | `SQL_TRANSACTIONS`; `:title` only from the grid-column whitelist | TransactionDataModuleUnit.dfm:5, TransactionManagerImpl.dfm:385-545 |
| 2 | Grid columns / FieldNames | Same columns and order; status icon column | TransactionManagerImpl.dfm:385-545 |
| 3 | Title click ordering; icon-column click keeps the last title | `title_value`, per-session `module_state` | TransactionManagerImpl.dfm:385-545 |
| 4 | "Statusa görə sıralamaq" toggle stored in Settings.TRANSACTION_STATUST | `status_first`/`set_status_first`, UPDATE committed immediately | TransactionDataModuleUnit.dfm:1055 |
| 5 | Filter panel (currencies, operation types, branches, operator, status) → Filter string | `build_filter` reproduces the exact string; `apply_filter` applies it server-side | TransactionDataModuleUnit.dfm:29, 121, 274, 290 |
| 6 | Speed search fields + srFromCurrent prompt | Client-side speed search, same "search from start?" prompt | — |
| 7 | Refresh → GotoTransaction then Last | Refresh always lands on the last row | — |
| 8 | Date change does not refresh | Same | — |
| 9 | Commit (step commit, error count message) | `/commit`; 1 error → raw Oracle message; otherwise summary | TransactionDataModuleUnit.dfm:1071 |
| 10 | Reject: "İnkarolunma !!!" / "Təyinat:" prompt, cs_RejectInformation summary | `reject`, same prompt and 3-line summary | TransactionDataModuleUnit.dfm:1083 |
| 11 | Delete: one / "%d sayda" confirmation, TrDelete vid_OP block | `delete_one`, `transactions.err_trdelete` | TransactionDataModuleUnit.dfm:977 |
| 12 | Commission transactions list | `/commissions` | TransactionDataModuleUnit.dfm:960 |
| 13 | Editor lookups: currencies, accounts, cash/convert symbols, op types, report descs, countries, destinations | `editor_lookups`, verbatim SQL | TransactionDataModuleUnit.dfm:310, 319, 339, 650, 683, 694, 710, 727, 898, 912; TransactionDestinationImpl.dfm:98 |
| 14 | Account rest + equivalent | `/accounts/{id}/rest` (`SQL_ACC_REST`) | TransactionDataModuleUnit.dfm:912 |
| 15 | SetAmmounts (debit/credit/lamount with RoundNew) | `set_amounts`, Delphi RoundNew semantics, unit-tested | TransactionPropertiesImpl.pas:193-243 |
| 16 | Cash-symbol filter by account balances | `cash_symbol_filter` | TransactionDataModuleUnit.pas:245-266 |
| 17 | Validation order on Qəbul | `validate_transaction` (accounts, lamount≠0, currency, account currency, cash symbol, convert symbol, rate) | TransactionPropertiesImpl.pas:376-411 |
| 18 | Insert: CheckObjectAccess insert, GenerateID, transaction_add, SetTransactions for commission | `save_transaction` | TransactionPropertiesImpl.pas:376-411 |
| 19 | Edit: CheckObjectAccess update, CheckAdvancedObjectAccess on status 2, vid_OP TrEdit block, delete+add with same id | `save_transaction`, `transactions.err_tredit` | TransactionPropertiesImpl.pas:376-411 |
| 20 | F3 destination picker; destination number fills purpose | Same (F3 and number lookup) | TransactionDestinationImpl.dfm:98 |
| 21 | After save: ResetTransaction (new insert, currencies kept) | Same | — |
| 22 | ClearAmmounts on currency change resets ReportID/CountrID to 0 | Kept | TransactionPropertiesImpl.pas:193-243 |
| 23 | Captions Qəbul / İmtina / Çıxış, all messages | Locales en/az/ru (`transactions.*`) with the original Azeri texts | — |

## Deliberate differences
- Account/currency match is enforced on the server too (stricter than the client-only check).
- Business Process action and ActionCommit (both hidden in the DFM) are not ported.
- National currency: Delphi rules (mediocrity, tsUnknown) are keyed on currency id 0; the mock's national currency is 944, so these rules apply only to id 0 as in Delphi.

## Unverified
- Several TM package variants share this CLSID; `Packages/TransactionManager` was chosen. Which one production actually deploys is not confirmed.
- srFromCurrent wrap-around semantics were reproduced from code reading only.
- Commit timing (CommitTemp=>true through an anonymous PL/SQL block) has not been checked against a real Oracle instance; everything here was tested in DB_MODE=mock only.
- frmTrView source is not in the repo, so the read-only view is approximated by the detail strip.

Screenshots: `docs/screenshots/40-…48-*.png`.

## Re-audit 2026-10-20 (fields / filters gap table)

Source: `Packages/TransactionManager/TransactionManagerImpl.pas/.dfm`, `CommissionImpl.pas/.dfm`, `TransactionDestinationImpl.dfm`, `TransactionPropertiesImpl.dfm`.

| # | Area | Delphi (unit:line) | Gap found in web | Fix |
|---|------|--------------------|------------------|-----|
| T1 | Filter panel | PanelSettings "Seçimlər" alLeft (dfm:556) | horizontal panel hidden above grid | left sidebar via shared `SB.filterLayout` (key `transactionmanager`), collapsible, per-user localStorage, stacks on top < 900px ✅ |
| T2 | Show filter | ActionShowFilterExecute :1067, ShortCut 32838 (dfm:1062) | Ctrl+F | Alt+F + toolbar button toggle the sidebar ✅ |
| T3 | Operation date | DTPCurrentDateChange :623 (no refresh until F5) | in header | moved into sidebar, still no auto refresh ✅ |
| T4 | System date | header label "Sistem tarixi" (sysdat TEK_DAT) | missing | `#sysDate` display ✅ |
| T5 | Currency checklist | "Valyuta seçimi", ActionFilterExecute :1093 | caption "Valyutalar" | caption + immediate filter ✅ |
| T6 | D. filial / İstifadəçi / K. filial | CBDebetFilialClick :1034 (checked → first row, unchecked → KeyValue -1) | captions; unchecked combo kept old value | Delphi captions/order; blank when unchecked, first row when checked ✅ |
| T7 | Operation type checklist | "Əməliyyat tipi"; F6 CLBOperationTypesKeyDown :1086 | caption; F6 missing | caption + F6 reloads lists ✅ |
| T8 | Operation kind | "Əməliyyat növü": Planlaşdırılmış/Təsdiqlənmiş/İnkar edilmiş | generic status captions | Delphi captions ✅ |
| T9 | Dərhal yeniləmək | checkbox, checked, no handler | missing | shown (no-op as in source) ✅ |
| T10 | Statusa görə sıralamaq | ChBoxStatusTClick :1057 | header | moved to sidebar, persists to Settings ✅ |
| T11 | Search edits | ActionSpeedSearchExecute :715 (ID, Debit/Credit acc, D/K/L amounts) | under grid | moved into sidebar "Search" group ✅ |
| T12 | Grid captions | GridTransactions dfm:364 — №, icon, Tarix, Debet, $, Kredit, $, Debet məbləğ, Kredit məbləğ, Ekvivalent, Daxil edən | ID/Val./"Debet hesab"/"St." | Delphi captions, ID and $ silver, nowrap, '#,##0.00' (fmtN), dd.mm.yyyy ✅ |
| T13 | Detail panel | "Əməliyyat təyinatı:", "İnkar təyinatı:", "Kassa:", USRCOMMIT | generic labels | Delphi labels ✅ |
| T14 | Refresh dropdown | PopupRefresh dfm:1164, NFullRefreshClick :1414 (Ctrl+F5) | missing | split button "Tam yeniləmək" reloads init + editor lookups ✅ |
| T15 | Popup menu | PopupMenu dfm:1108 | missing | right-click menu: add/edit(default)/cancel, Təsdiq, İnkar (no action in DFM → no-op), Yeniləmək, Əvvəlinə/Sonuna (NFirstClick :873), Komissiya, Hamısını seçmək (:755) ✅ |
| T16 | Toolbar captions | Təsdiqləmək / Ləğv etmək; en "Delete" | en "Cancel" | fixed ✅ |
| T17 | Commission grid | CommissionImpl.dfm: NAME, DEBITACCOUNT, $, CREDITACCOUNT, $, ADEBITACCOUNT, $, ACREDITACCOUNT, $ | ID column, no commission columns | Delphi columns ✅ |
| T18 | Commission details/buttons | ASSIGNMENT / COMMISIONASSIGNMENT; Yenilə :49, Bağla, Əlavə :103; Enter/Esc :63; FormClose :108 refresh | missing | added ✅ |
| T19 | Destination picker | TransactionDestinationImpl.dfm: №, Təyinat, Qəbul/İmtina | no header/buttons | added, Enter/Esc ✅ (DBNavigator not ported) |
| T20 | Editor code edits | DebitCurrencyIDEdit, DBEdit4 (OPERATIONCODE), ConvertationSymbolIDBEdit, CashSymbolDBEdit (upper), ReportIDDBEdit, CountrIDDBEdit | lookups only | code input beside each lookup, two-way synced ✅ |

Not ported: Ctrl+F1 ShowDOAInfo (debug), DBNavigator on the destination picker. Unknown typed code → lookup blank (server validation unchanged).
Tests: `api/tests/test_transactions.py::test_each_filter_narrows_like_actionfilter`, `::test_commission_list_columns`; fixtures cs.json 6006 (EUR, branch 102, op 1, cash 01), 6007 (USD, op 2), commission 2 (with commission accounts).
Screenshots: 202–213 (`e2e/tm_parity_screens.py`); 40–4x regenerated by `e2e/transactions_screens.py`.
