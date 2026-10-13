# Parity: Off-balance settings screens

Status: ✅ identical · 🟡 documented difference · ⛔ not ported · ❓ verify on the real DB

## 1. Off-balance Chart of Accounts (`Packages/Out_balancerefeditx/Ocx`)

CLSID `{8E39E7D2-FC9F-4EB8-8645-9F04944FBD92}` (`OUT_BalanceRefEditX_TLB.pas:56`) → route `/m/out-balancerefeditx`, tree
**Off-balance → Off-balance Chart of Accounts** (`Tree\Sections\Item8\Item8`, plugin `PluginManager\Packages\Item25`).
API `api/app/out_balrefedit.py`, SQL `api/app/out_set_sql.py`, UI `web/public/modules/out_balrefedit.js`, mock `api/app/db/mock_oset.py`
(+ `out_bal_spr1..4` in `api/fixtures/oacc.json`), tests `api/tests/test_out_balrefedit.py`, E2E `e2e/out_balrefedit_screens.py` (screenshots 87–88).

**Source used:** `OUT_BalanceRefEditX.dpr` compiles only `BalanceRefEditImpl1.pas` (+ TLB).

| # | Delphi (unit:line) | Behaviour | Web | Status |
|---|---|---|---|---|
| 1 | BalanceRefEditImpl1.dfm:425-429 `BalanceDataSet` | `select b.*, b.rowid from` / `OUT_bal_spr1 b` / `` / `Order by BAL_CN` | `BALANCE_SQL_LINES`, verbatim | ✅ |
| 2 | ComboBoxPlanChange .pas:409-421 | `SQL[1] := 'out_bal_sprN b'` for ItemIndex 0..3, Close/Open | Same line replaced; index checked 0..3 (never text) | ✅ |
| 3 | dfm:59-74 | ComboBoxPlan shows "1 hesab planı" but ItemIndex is -1, so the design SQL (plan 1) is used | Opens on plan 1 | ✅ |
| 4 | BalanceDataSetCalcFields .pas:374-400 | TYPEID/ADDITIONALTYPEID → Aktiv/Passiv/Aktiv-Passiv, RATEDIFFERENCE 0/1 → Hesablanmır/Hesablanır, SALDO 0/1 → Nəzərə alınmır/alınır; other values leave the field empty | `calc()`, same texts (data, not translated) | ✅ |
| 5 | DBGrid1 dfm:241-392 | Columns BAL_CN, BALNAME, TYPEID_NAME, ADDITIONALTYPEID_NAME, SALDO_NAME, RATEDIFFERENCE_NAME, PART, QROUP, KLAS, CURRENCYPOSITION. QROUP/KLAS are not dataset fields → always empty | Same columns, QROUP/KLAS empty | ✅ |
| 6 | GroupBox2 dfm:75-240 | Edit panel: BAL_CN, ACCGROUP, PART, BALNAME edits; SALDO/RATEDIFFERENCE checkboxes ('1'/'0'); type combos = ItemIndex+1 (:423-435); CmbBoxCurrPosition = ItemIndex 0..3 (:443-447, :455-461) | Same fields/values | ✅ |
| 7 | DBNavigator dfm:30-42 | First/Prior/Next/Last/Insert/Delete/Edit/Post/Cancel/Refresh; Delete asks "Delete record?" | Same buttons; edits are done in the panel (grid is read-only on the web) | 🟡 |
| 8 | No OnApplyRecord | DOA applies posts itself: INSERT/UPDATE/DELETE on the query table, row by ROWID, CommitOnPost | `insert_sql`/`update_sql`/`delete_sql` generate the equivalent statements, values bound, commit after each post | ❓ (DOA-generated text, not in source) |
| 9 | RefreshOptions roBeforeEdit / lmCheckImmediate | Row re-read and locked before edit; "record changed by another user" check | `select … for update nowait` before update (ORA-00054 shown when locked); no field-by-field "changed by another user" comparison | 🟡 |
| 10 | Field types | BAL_CN/ACCGROUP float, PART integer, BALNAME size 181 | Numbers validated server-side (`out_balrefedit.err_number`), BALNAME max 181 | ✅ |
| 11 | EditSearchChange .pas:437-441 | `Locate('BAL_CN', text, [loCaseInsensitive, loPartialKey])` | First row whose BAL_CN starts with the text | ✅ |
| 12 | CmbBoxCashIncomingChange .pas:449-453 | Not attached to any control in the dfm; CASHINCOMING is never shown or written | Not shown / not written | ✅ |
| 13 | CloseTypesData dfm:516-520 | Declared, never opened | `SQL_CLOSE_TYPES` kept for reference, not executed | ✅ |
| 14 | Insert with all fields empty | DOA would try an insert of NULLs | Refused with "fill in at least one field" | 🟡 |

**To verify on the real DB:** the primary key of `OUT_BAL_SPR1..4` (the mock assumes BAL_CN is unique), and that DOA's update of all changed
columns matches what the web sends (the web always writes all nine editable columns).

## 2. Off-balance Account Types (`Packages/Out_Tuningacctypes`)

CLSID `{4FD88BAF-D08A-474A-AADA-335E883BBB85}` (`Out_TuningAcctypes_TLB.pas:56`) → route `/m/out-tuningacctypes`, tree
**Off-balance → Off-balance Account Types** (`Tree\Sections\Item8\Item9`, plugin `PluginManager\Packages\Item26`).
API `api/app/out_tuningacctypes.py`, SQL `api/app/out_set_sql.py`, UI `web/public/modules/out_tuningacctypes.js`, mock `api/app/db/mock_oset.py`
(`out_account_flags` in `oacc.json`, shared with Off-balance Accounts), tests `api/tests/test_out_tuningacctypes.py`,
E2E `e2e/out_tuningacctypes_screens.py` (screenshots 89–90).

**Source used:** `Out_TuningAcctypes.dpr` compiles only `TuningAccTypesImpl.pas` (+ TLB).

| # | Delphi (unit:line) | Behaviour | Web | Status |
|---|---|---|---|---|
| 1 | TuningAccTypesImpl.dfm:149-154 `Account_Types` | `select AT.* , AT.RowID from Out_Account_Flags AT`, opened in ActiveFormCreate (.pas:354-357) | `SQL_ACCOUNT_TYPES`, verbatim | ✅ |
| 2 | DBGrid1 dfm:70-147 | Editable grid SYMBOL / NAME / DESCRIPTION (Simvol / Adı / Təyinatı) | Same columns; click a row to edit, Post/Cancel per row, Insert button | 🟡 (UI only) |
| 3 | Fields dfm:161-173 | SYMBOL required, size 1; NAME 32; DESCRIPTION 128 | Same limits (422 on violation, message for empty SYMBOL) | ✅ |
| 4 | No OnApplyRecord | DOA INSERT/UPDATE/DELETE on OUT_ACCOUNT_FLAGS by ROWID, CommitOnPost; grid Ctrl+Del asks for confirmation | `SQL_INSERT/UPDATE/DELETE` (values bound), commit after each post, confirm before delete | ❓ (DOA-generated text) |
| 5 | Account_TypesAfterPost .pas:341-352 | Refresh, return to the same row | List reloaded after save | ✅ |
| 6 | Account_TypesAfterOpen .pas:329-339 | Adds A..Z to `Columns[0].PickList` of the grid named `FlagsEditor`, which has no DataSource and lies under DBGrid1 – so the visible grid gets no pick list | No pick list (free 1-character symbol) | ✅ |
| 7 | – | No SB_ACA object check in this form | Only the module right (`require_module`) | ✅ |

Changes made here are seen at once by Off-balance Accounts (filter "Account type" and the symbols dialog read the same table).
