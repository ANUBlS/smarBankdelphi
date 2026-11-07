# Parity – Off-balance account/report group

Group 1 of the off-balance queue: `Packages/Out_control_tape` (done), `Out_account` (pending), `Out_Statement` (done), `Out_turn_over_for_period` (done).

## Out_control_tape (TFrmControlTape, {C0327750-D672-4942-90C6-4D56121957A7})
Web: tree "Off-balance → Off-balance Control Tape" (Action `#21`), route `/m/out-control-tape`, API `/api/out-control-tape`.
Design-time SQL: `api/app/out_ct_sql.py` (generated from untdatamod.dfm). Run-time SQL: `api/app/out_control_tape.py`, string-for-string copies of the
concatenations in ControlTapeImpl.pas (line cited per function).

| Delphi | Web | Notes |
|---|---|---|
| ActiveFormCreate :386 `Out_SB_Balance.GetBankDay` | `/init` date | |
| Full :402-425 ForMoney → 'Bütün valyutalar' + Valu_Name, Rate[] | `/init` currencies; `currency` = ItemIndex | |
| Branch dataset (-1 'Bütün filiallar' ∪ filial) | branch select | |
| Button3 'Yeniləmək' :435-473 ForTable (Out_provarch, group by bal_cn1/bal_cn2) | `/refresh` | |
| BuildFilter :352-365 | `build_filter` | Toggle on + empty text → `a.bal_cn1 in (-1)` even on plan 2 (Delphi quirk, kept). Text now validated as integer list (Delphi pasted it raw) |
| Button1 'Çap' :476-536 Group → QR1 | `/print` (grouped by balance account, totals) | Reads `out_provdoc` when date = GetBankDay, else `out_provarch` |
| Button2 'Məcmu' :540-555 = Button3 + BanksName → QR2 | `/summary` | Amount column printed white unless a currency is picked → hidden in web |
| Button4 'Hesabat' :557-683 ODSTransactionView → QTransactionView | `/report` | Ignores branch and balance filters, always Out_Provarch (as Delphi) |
| QuickReport previews | grid + PDF/XLSX (`/{kind}.pdf|xlsx`) | layouts approximated |

Tests: `api/tests/test_out_control_tape.py` (3). Screenshots: 76-out-control-tape.png, 77-out-control-tape-print.png, 78-out-control-tape-report.png.
Unverified (no DB): `Out_SB_Balance.GetBankDay` existence/return type, `Out_sb_complex_transactions.getcurrencyname`, QR1/QR2 exact layouts.

## Out_turn_over_for_period (TTurnOvers_Form, {EFA0EDF1-911C-42CC-B896-032FCC59C38C})
Web: tree "Off-balance → Off-balance Turnovers for Period" (Action `#22`), route `/m/out-turnovers`, API `/api/out-turnovers`.
Design-time SQL: `api/app/out_tp_sql.py` (generated from TurnOversDataMod.dfm). Run-time SQL: `api/app/out_turnovers.py`.

| Delphi | Web | Notes |
|---|---|---|
| ActiveFormCreate :354-374 BranchData/CurrencyData/SYSDAT.TEK_DAT | `/init` (both dates = TEK_DAT) | |
| CBCurrency / CBBranch ItemIndex 0 → -1 (:453-461) | `currency`/`branch` = ItemIndex, 0 = all | TSearchCombo source not in repo: assumed item 0 is an "all" entry |
| CBAccountType → AccPlane = ItemIndex+1 (:463) | `plan` 0..3 | |
| BuildTurnOverQuery :398-427 Format SQL[52,55,94,97,114,117,124,125,126] | `turnover_sql` | Line-for-line on the TStrings; AccountListEdit now validated as integer list (Delphi pasted raw) |
| GetPeriodPrefix :429-441 (MAX(DAT) from Operkurs < BeginDate, NULL → BeginDate) | `period_prefix` | |
| RGAmountType → AmountType (:466) | `amount_type` accepted, unused | Delphi never uses it (kept inert) |
| RGReportType 0: TurnOversRpt.Preview with filter :521 (any L* ≠ 0), CBWithAccNames shows ACC_NAME | `/report` (+ bank header, signatures, SUM totals) | QuickReport layout approximated; logo not rendered |
| RGReportType 1: TurnOversExporter.ExportDataset (unfiltered) | `/export` + `.xlsx` | Column order = persistent fields order |
| DSout_achost / DSout_achost1 | not used | Commented out in Delphi (:477-487) |

Tests: `api/tests/test_out_turnovers.py` (3). Screenshots: 79-out-turnovers-report.png, 80-out-turnovers-export.png.
Unverified (no DB): SQL.CommaText round trip keeps line indices (assumed identity), TSearchCombo item 0 semantics, `out_sb_mtoutview.active/passiv`, `cm_expert` access.

## Out_Statement (TOut_StatementForm, {D6E66400-5EED-4943-BEC3-DA55C65D499E})
Web: tree "Off-balance → Off-balance Account Statement" (Action `#23`, plugin Item23), route `/m/out-statement`, API `/api/out-statement`.
Design-time SQL: `api/app/out_ost_sql.py` (generated from Out_Stdatamod_Unit.dfm). Logic: `api/app/out_statement.py`.
Package source is in the repo (`Packages/Out_Statement/Script/out_sb_statement.sql`); the mock (`api/app/db/mock_ost.py`) ports
notAccId / GetExtraction / Extraction_Trans string-for-string and evaluates the SQL text they return. Mock-only extras: `api/fixtures/ost.json`.

| Delphi (Out_StatementImpl.pas) | Web | Notes |
|---|---|---|
| ActiveFormCreate :1082-1103 (TEK_DAT, KeyValues -1), ODSCurrency/ODSFilial/ODSUsers | `/init` | |
| CBCurrency/CBFilial/CBUser click :1105-1127 (checked → KeyValue 0, else -1) | checkbox + select, value -1 / 0 / chosen id | 0 is sent as-is if nothing is picked, as in Delphi |
| Turn_and_RateDiff :894-901 | `turn_and_ratediff` | Pascal precedence kept: T→ch_turn, T+R→ch_rate_and_turn, R only / none→ch_nothink |
| UpdateStr :382-431, defaults '-1' / \'-1\' :914-928 | `update_str`, `params` | Ported loop for loop; input validated (acc: letters/digits, bal/cli: integers) because the package concatenates it |
| notAccId :939 + ODSNotAccId → `(accountid<>N) and` filter :956-971 | `export_data_table` (set exclusion, same rows) | Only when CBTurnOver checked |
| ODS_GetExtraction / ODS_ExtractionTrans :992-1029, ODSMainState / ODSExtractTrans :1034-1060 | executes the returned STR text; detail per account with `OwnAccountId` | FilterTrans `(OperationCode<>1)` when CBRateDiff unchecked |
| RatesDataSet / RatesDataSetBegin (Operkurs by CurrencyID+EndDate / DatDate) | `RATE_END` / `RATE_BEG` | |
| BtnOk 0 PreviewClick :852 → ShowReportR (RGroupSetting 0) / ShowReport (1) | on-screen blocks + `statement.pdf` | RGroupPrintMode 1 = page break per account; RGroupValView only in Out_RepR; ChBand / sum visibility from QRSubDetailAfterPrint |
| 1 PostClick :834 (QRAsciiExportFilter of Out_Rep) | `statement.txt` | Plain-text layout approximated; Delphi left QRD_Begin/QRD_End captions unset here (prints placeholder text) – web prints the period |
| 2 ToExcelClick :519-833 (Excel OLE) | `statement.xlsx` (openpyxl) | Same cells/rows, t_val from first account decides layout, `www` row shift incl. the Next-then-test quirk, widths/formats/colours; literals kept in Azerbaijani |
| 3 ShowTransClick → FormTransView | Documents view (accounts grid + Ostat/EndOstat + transactions) | |
| 4 ShowCardState (close) | returns to home | |

Tests: `api/tests/test_out_statement.py` (4). Screenshots: 81-out-statement-preview.png, 82-out-statement-documents.png.
Unverified (no DB): NLS_DATE_FORMAT used by the package date concatenation (mock assumes DD-MON-RR), DOA filter on NULL
OperationCode (web keeps NULL rows), RepR/Rep exact QuickReport layout and logo, Out_Rep's one-row lag of DBTextDebit/Kredit visibility
(web applies per row), Excel `Last op. date` NULL (Delphi AsDateTime writes 30.12.1899, web leaves blank), varchar2(2024)/(2000) limits of the generated SQL with long lists.
