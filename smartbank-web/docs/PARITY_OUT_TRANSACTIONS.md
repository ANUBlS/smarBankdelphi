# Parity: Off-balance Transactions (`Packages/Out_transaction_manager`)

CLSID `{A567249D-CC16-47FA-9A7F-AF17514FB4D0}` → route `/m/out-transactionmanagerform`.
Web label: **Off-balance Transactions** (tree keeps Delphi caption from SmartBankIni).

## Ported (verbatim Delphi behaviour)
- List from `out_provarch` ∪ `out_LAZYTRANSACTION` joined to `out_account` (DFM SQL in `out_tm_sql.py`).
- Filters (currency / op type / branch / operator / status) same string-building as on-balance TM.
- Column title sort via temporary `ORDER BY` (no `:Title` bind in Out SQL).
- Insert / edit / commission save through `OUT_SB_TRANSACTION.GenerateID` / `transaction_add` / `transaction_delete`.
- Commit: `CheckAdvancedObjectAccess('OUTTRANSACTIONCOMMITRIGHT')` then `OUT_SB_TRANSACTION.transaction_commit`.
- Reject / delete via `OUT_SB_TRANSACTION`.
- Account pickers filtered by `:v_custid` on `OUT_ACCOUNT` + `out_bal_spr1`.
- Destinations from `OUT_TRDESTINATION`; rests from `out_Tenostat`.

## Intentionally different from on-balance TM
- No `ODS_StatusT` / status-first checkbox persistence.
- No ReportDesc / Country fields on the editor.
- Package prefix `OUT_SB_*` and object access name `out_Transactionmanagerform`.
- Access right for commit is `OUTTRANSACTIONCOMMITRIGHT`.

## Tests
`api/tests/test_out_transactions.py` (mock mode).
