# Parity: Rate difference report (RateDifferenceReport / TRateDifferenceReportX, Packages/RateDifferenceReport)

**Status: ported** (2026-10-20). The QuickReport print ('Hesabat', TQReport in UnitMainReport) is **on hold** by the user. The button stays and shows the on-hold notice.

| | |
|---|---|
| Source | `Packages/RateDifferenceReport`: RateDifferenceReportImpl.pas/.dfm (form), ReportDataModule.pas/.dfm (TMainDataModule), UnitMainReport.pas/.dfm (TQReport, held). 848 lines. No duplicate folders. |
| CLSID | `{8D2E74F4-B8EA-4067-AF79-53EAED0D4834}` CLASS_RateDifferenceReportX (RateDifferenceReport_TLB.pas:56) |
| Oracle objects | `provarch`, `account`, `avalute`, `filial`, `user$`; package `SBOP` (`Get_Date`) |
| Web | API `api/app/ratedifferencereport.py` (runtime SQL verbatim from pas:524-536); dfm SQL `api/app/rdr_sql.py`; mock `api/app/db/mock_rt.py` + `api/fixtures/rates.json`; UI `web/public/modules/ratedifferencereport.js`, route `/m/ratedifferencereport` |
| Tree / modules.json | mock tree Transactions → "Rate difference report" (`#39`); `migrated: true` |
| Tests | `api/tests/test_rates.py` (SQL text, filters, order, RecordNo, input validation, rights); E2E `e2e/rates_screens.py`; screenshots 354–357 |

| Delphi | Web | Ref |
|---|---|---|
| Layout: ToolBar1 (Yeniləmək / Hesabat / Axtarış), Panel3 on the left with PageControl1 'Seçimlər' (Tarix: Başlanğıc tarix, Son tarix; Valyuta seçimi; Filial seçimi; Operator seçimi), TransactionViewer, PanelSearch (hidden) under the grid | same layout. This is the form's own Delphi left panel, not the shared filter sidebar. | dfm |
| ActiveFormCreate: FillCurrency (`Currency`: Valute / Valu_Name, first item 'Bütün valyutalar'), FillOperator (`Operators` = User$: ID / name, 'Bütün operatorlar'), FillFilial (`Filials`: ID / name, 'Bütün filiallar'), SetDate (BeginDate := `SBOP.Get_Date`, EndDate := BeginDate), all combos on item 0 | `GET /init` runs the three lookups in the same order, then Get_Date | pas:421-494, 401-406, 550-563 |
| The Transactions dataset is not opened at create | the grid stays empty until Yeniləmək | ReportDataModule.dfm |
| ActionRefresh (F5): builds `Select Transactions.*, … From Provarch Transactions, Account Debet, … Where … (Transactions.ammount = 0 or transactions.ammount_c = 0) … dat between :BeginDate and :EndDate` + currency / filial / operator filters (IntToStr of the selected ID) + `Order by :Title`; binds BeginDate.DateTime / EndDate.DateTime | `refresh_sql()` builds the same text character for character. The IDs are validated as integers by the API before concatenation. | pas:496-548 |
| `:TITLE` is a DOA substitution variable (default `dat`) that survives SQL.Clear | `delphi.subst`; only the grid FieldNames (not RecordNo) are accepted | ReportDataModule.dfm:45-48 |
| TransactionViewerTitleClick: exit when the dataset is empty or the column is RecordNo; Title := FieldName; `DataSet.Refresh` re-runs the **last** SQL and bind values | header click re-sends the last refresh's parameters with the new order (pickers or combos changed since then are ignored, as in Delphi) | pas:570-593 |
| RecordNo (calculated): IntToStr(RecNo) | `recordno` = 1-based row position | ReportDataModule.pas:53-57 |
| Columns № / Tarix / Debet / $ / Kredit / $ / Məbləğ; LAMMOUNT DisplayFormat `#,##.00` | same; `#,##.00` formatting (no forced integer digit, e.g. `,50`) | dfm, ReportDataModule.dfm:71-74 |
| PopupMenu: Yeniləmək (default) / Hesabat / Sürətli axtarış | right-click menu with the same items and shortcuts | dfm |
| ActionReportUpdate: Hesabat and Axtarış enabled only when the dataset is not empty | same | pas:705-709 |
| ActionReport (Ctrl+P): `QReport.Preview` | **on hold**, shows a notice | pas:711-714 |
| ActionSearch (Alt+F): toggle PanelSearch; EDAT / EDEBETACCOUNT / ECREDITACCOUNT / ELAMMOUNT Change: `Locate(name without 'E', text, [loCaseInsensitive, loPartialKey])`; OnExit clears the edit | client-side prefix match, the edit is cleared on blur | pas:686-703 |
| MouseWheelHandler: the wheel moves the current record | not ported (the browser wheel scrolls the grid) | pas:408-419 |

Commit timing: no DML, nothing to commit.

## Held

| Item | Unit | Notes |
|---|---|---|
| Hesabat (ActionReport, Ctrl+P, popup N3) | UnitMainReport (TQReport, QuickReport) | on hold by the user; the report DFM is binary QuickReport |

## Unverified

1. FillCurrency reads `FieldByName('Valu_Name')`. The mock `avalute` has VALU_NAME (as in the Exchange fixtures). Please confirm the column exists on your DB.
2. Locate on DAT / LAMMOUNT compares the field's text form: dd.mm.yyyy, and FloatToStr with `,` as the decimal separator (AsString, not DisplayFormat).
3. The pickers bind `.DateTime`. SetDate copies Get_Date, which is assumed to have no time part, so the web binds midnight.
4. `user$` / `filial` lookups in mock mode come from the shared mock data; `provarch` / `account` from rates.json.
