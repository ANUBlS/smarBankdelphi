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
