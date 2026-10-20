# Parity: BB payings (BBPayings / TBBPayingsForm, Packages/BBPayings)

**Status: ported** (2026-10-20). Nothing on hold (the module has no prints).

| | |
|---|---|
| Source | `Packages/BBPayings`: `BBPayingsImpl.pas/.dfm`, `UnitDataModBBPayings.pas/.dfm`, `UnitBBPayingAdd.pas/.dfm` ('Paying' dialog). No duplicate folders. |
| CLSID | `{37150233-6F69-4049-AC4C-6381608E99F8}` CLASS_BBPayingsForm |
| Oracle objects | `bb_abn_services`, `bb_contracts`, `bb_services`, `bb_abonents`; `SBOP.get_date`; `Cable_Manager.AbnServAdd` (function), `AbnServUpd`, `AbnServDel`, `AbnServCommit` |
| Web | API `api/app/bbpayings.py`; SQL `api/app/bb_sql.py` (verbatim); mock `api/app/db/mock_bb.py` + `api/fixtures/bbpayings.json`; UI `web/public/modules/bbpayings.js`, route `/m/bbpayings` |
| Tree / modules.json | mock tree Payments → "BB payings" (`#45`); `migrated: true` |
| Tests | `api/tests/test_bbpayings.py`; E2E `e2e/bbpayings_screens.py`; screenshots 372–374 |

| Delphi | Web | Ref |
|---|---|---|
| ToolBar1 (Əlavə etmək, Redaktə, Ləğv, Təsdiq, Yenilə, Filter paneli, Excel); PanelSettings hidden at start (Tarix, Xidmət növü check + lookup, Təsdiq edilmiş / edilməmiş); DBGridContracts (multi-select) | same | dfm |
| ActiveFormCreate: both pickers := SBOP.get_date; the pickers keep their design-time time of day (10:35:38 / 10:35:40), so StDate / EndDate carry it; ODS_ABNServices / Contracts / Services open | same binds (`sys_date >= :StDate-1 and sys_date <= :EndDate`) | pas ActiveFormCreate, dfm:242/256 |
| BtnRefreshClick: Filter `1=1 [and (srv_id=K)] [and (status=1|0)]`, Filtered, Close/Open; empty service with the box checked → variant Null error | client-side filter, same rule and error | BtnRefreshClick |
| Title click: SQL.Add(' order by ' + FieldName); Refresh; line removed | `order` appended for that open only (grid FieldNames only) | DBGridContractsTitleClick |
| Add / Edit: dialog, mrOk → AbnServAdd(contract, null, srv, amount text, 0, 0, p_DT, paymethod) / AbnServUpd(id, …); p_DT = trunc(date) taken before ShowModal (sysdate for Add, Done_Time for Edit), so the dialog date is ignored; Refresh also after Cancel; double-click = Edit | same | BtnAddClick, BtnEditClick |
| Ləğv: 'Əməliyyat günün sənədlərindən silinsinmi?' Yes → AbnServDel(ID, 1), No → AbnServDel(ID, 0), Cancel → nothing; Refresh | same | BtnDelClick |
| Təsdiq: each selected row with STATUS = 0 → AbnServCommit(ID) | same | BtnConfirmClick |
| DrawColumnCell: status image (0 → 3, 1 → 6) in DataCol 1 = the ABN_NAME column (the name is not drawn) | same: glyph in the 'Adı' column | DBGridContractsDrawColumnCell |
| Excel: ExportDataset(ODS_ABNServices, 'Services') | `POST /excel` with the current filter | BtnExcelClick |

Commit timing: the module never commits; the Cable_Manager calls run with `commit=False`.

## Unverified

1. Whether `TDateTimePicker.Date :=` really keeps the design-time time of day on the client (it narrows the end of the window to 10:35:40).
2. Cable_Manager package bodies are not in the repo (whether they commit, how `p_amount` text is converted).
3. ImageList bitmaps are binary; the web shows ○ / ✔.
