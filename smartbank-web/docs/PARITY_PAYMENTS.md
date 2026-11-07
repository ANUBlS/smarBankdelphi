# Parity: Payments 'Köçürmələr' (Payments / TPaymentsForm, Packages/Payments)

**Status: ported** (2026-10-20). **On hold:** the QuickReport print (Print1 – invisible in Delphi – and capClick, `Unit1` TRep) and opening `.adoc` / `.pdf` files from the Windows share `\\10.0.11.90\adocs\` (popup Adoc / Pdf, grid double-click): the web runs `ods_rep` and shows the path only.

| | |
|---|---|
| Source | `Packages/Payments`: `PaymentsImpl1.pas/.dfm` (TPaymentsForm), `Unit4.pas/.dfm` (TDM), `Unit1` (TRep print, on hold), `UnitPaymentsProperties` (TFormPaymentProperties – only used by commented-out code, never shown). No duplicate folders. |
| CLSID | `{49670110-C03F-4C40-AE66-3708A5C1FBE4}` CLASS_PaymentsForm (Payments_TLB.pas) |
| Oracle objects | `ibank_temp_transaction`, `ibank_client_products`, `account`, `avalute`, `filial`, `sysdat`, `piecesofwriting.CurrencyToHR` (ods_rep), standalone procedure `Ibank_change_status`. TOraclePackages `mailbanking`, `SB_ADM`, `Sb_ACA` are on the data module but never called. |
| Web | API `api/app/payments.py`; SQL `api/app/pay_sql.py` (verbatim, `migration/tools/gensql.py`); mock `api/app/db/mock_pay.py` + `api/fixtures/payments.json`; UI `web/public/modules/payments.js`, route `/m/payments` |
| Tree / modules.json | mock tree Payments → "Transfers" (`#43`); `migrated: true` |
| Tests | `api/tests/test_payments.py`; E2E `e2e/payments_screens.py`; screenshots 366–368 |

| Delphi | Web | Ref |
|---|---|---|
| Layout: tabs 'Köçürmələr' / '...' (empty); Panel1 (Yenilə, Filter, Excel Export, Statusları yoxla); filtergroup alLeft 192 px (two date pickers, Filial check + lookup, 'Köçürmə növü' + all-check, eight type check boxes, 'Əməliyyat növü' group at the bottom); DBGridPayments (14 columns, status image); Panel3 search edits | same order, captions, widths and defaults (all type / status boxes checked, Filial unchecked, lookup disabled) | PaymentsImpl1.dfm |
| ActiveFormCreate: Dat / dsfilials Active; DTPBEGIN / DTPEND := TEK_DAT; ODSPayments sort := '1', DAT1 / DAT2 := trunc(date); Open | `GET /api/payments/init` | pas:687-706 |
| ODSPayments `:sort` is a substitution variable (Variables.Data type 1) | the value is substituted into the SQL text; only `1` or a grid FieldName is accepted | Unit4.dfm:87-89 |
| BtnRefreshClick: re-open with the picker dates (sort '1'), then SpeedButton3.Click | `POST /open` then `POST /check_status` | pas:708-724 |
| SpeedButton3Click 'Statusları yoxla': RecordCount + 1 calls of `Ibank_change_status(TRANS_ID, j)`; j is always 3 (the third `or` test is always true); the last record is called twice (Next at EOF); no commit | same; standalone procedure (TOraclePackage `pack` has no PackageName); `commit=False` | pas:1033-1061, Unit4.dfm:516 |
| DBGridPaymentsTitleClick: sort := FieldName ('STATUS' if none); Open | title click re-opens with that column | pas:790-807 |
| CheckBox1Click: on → lookup enabled, KeyValue := 0; off → SQL[39] := '', BtnRefresh.Click. DBLookupComboBox1CloseUp: SQL[39] := `where filial = '<KeyValue>'`, BtnRefresh.Click | same (`filial` → line 39 of the SQL; nothing picked → 0) | pas:1223-1244, 552-564 |
| ActionFilterExecute (any type / status check box): Filter := `((status =a)or(status =b)or(status =c)) AND ((transaction_type=t1)OR…)` with Word(Checked)*Tag (unchecked → 0); Filtered := True. Before the first click the dataset is not filtered | client-side filter, same rule; filtered rows are kept for the Excel export | pas:197-381 |
| allcheckClick: sets the eight type boxes (each OnClick re-filters) | same | pas:1195-1221 |
| SpeedButton1Click 'Filter': toggles filtergroup; when shown, both dates := TEK_DAT | same | pas:938-950 |
| SpeedButton2Click: CMExcelExport.ExportDataset(ODSPayments, 'Transactions') | `POST /excel` (xlsx, sheet 'Transactions', all fields, current filter) | pas:952-961 |
| DBGridPaymentsDrawColumnCell: Status 1 → image 1, 2 → 0, 4 → 5, 3/9/10 → 2 in column 1 | status glyph in the Status column (see Unverified 3) | pas:963-1006 |
| Panel3 search edits: OnChange Locate(field = Name minus 'search', partial, case-insensitive); OnExit clear; Enter SearchRecord forward, at the end 'Axtarış sona çatdı …' → from the beginning, else 'Yazı Tapılmadı !' | same, client side | pas:1014-1031, 1149-1183 |
| A1 / P1 / double-click: ods_rep (v_id) → ShellExecute `\\10.0.11.90\adocs\<cli_id>-<id>.adoc/.pdf` | **on hold**: path shown | pas:176-195, 586-600, 726-788 |
| Print1 / capClick (QuickReport TRep) | **on hold** | pas:901-936, 1063-1141 |

Commit timing: the form never commits; `Ibank_change_status` runs without a commit (same as Delphi).

## Unverified

1. Whether `RecordCount` in 'Statusları yoxla' counts the filtered rows or all fetched rows; the web loops over the visible (filtered) rows, + 1 for the last record.
2. `Ibank_change_status` is not in the repo scripts; its body (and whether it commits itself) is unknown.
3. The ImageList bitmaps are binary in the DFM; the web shows ✔ / ⏲ / ✖ / ⚑ for images 0 / 1 / 2 / 5.
4. DOA `SearchRecord` with `srPartialMatch` is taken as "starts with" (same as Locate loPartialKey).
5. `where filial = '<n>'` compares the numeric FILIAL with a string (implicit conversion), as in Delphi.
