# ExchangeMGR (Packages/ExchangeMGR-NBC) parity

Production source is `Packages/ExchangeMGR-NBC` (confirmed by the user 2026-10-20). ExchangeMGR-Turan, ExchangeMGR_IBAN,
DepositTeze and Teymur copies are ignored. CLSID `{F5E99666-E5B9-4579-B7ED-D83CC51D8FB7}` (ExchangeMGR_TLB.pas:52,
TExchangeMGR_X). Web route `/m/exchangemgr`, API `/api/exchangemgr`. Mock tree: Transactions → Exchange manager (Action #36).

Rules: verbatim SQL (`api/app/em_sql.py`, 70 `DM_*` texts extracted from the binary UnitDateExch.dfm with
`tools/dfm_bin2txt.py` + `tools/dfmsql_bin.py`), Oracle packages called as Delphi calls them, no DB changes, prints on hold.

## Status: chunk 1 of 4 (main form shell + read-only tabs)

| Tab (Unit_ExchangeMGR.dfm) | Web | Status |
|---|---|---|
| Valyuta D. M. (DBGridEh master on ODSExchOffice, lookup filialname from ODSFilial) | tab 0 | ported (read/scroll) – toolbar Add/Edit/Delete/Settings/Parameters/Account settings: chunk 3 |
| Resurslar (ODSResurs, ODSVdmResurs/ODSVdmRResurs) | tab 1 | ported (read, refresh) – Give/Return: chunk 3 |
| Əməliyyatlar (ODSExchProvarch, `:TITLE` sort via DBGridEhTransTitleClick2, FilterRadioGroup client filter, ODSSumTrans) | tab 2 | ported (read, sort, filter, total) – Add/Confirm/Delete: chunk 2; Print on hold |
| Məzənnələr (ODSExchRate / ODSExchRateOther / ODSExchRateAll) | tab 3 | ported (read) – DBNavRate edits (EXCH_UPDATE): chunk 3 |
| Filiallar üzrə məzənnələr (ODSRatesFilial + ODS_RFilial, SQL[3] = '' / 'and ex_id=N') | tab 4 | ported (read, filial filter) – Edit / Excel: chunk 3 |
| V.D.M-də Qalıqlar (EXCH_MGR.ExRemainderSql cursor) | tab 5 | ported (read) |
| Dövriyyə (Əməliyyatlara baxış, Kurslara baxış, Silinmiş, Toplam, Reyestr) | tab 6 | placeholder – non-report parts chunk 4; Toplam/Reyestr reports on hold |

ActiveFormCreate (`GET /init`): ODSSysdat → SBOP.get_date → EXCH_MGR.Ex_Calendar(dat), Ex_Calendar(sdat) →
LastWorkDay_Calendar; `sdat > dat` → message (em.err_sysdate_greater) and nothing opens; otherwise EXCH_MGR.NextResurs
(no web commit – package commits), datasets open; both calendar flags true → em.err_calendar, else ExRemainderSql.
`/remainder/show`: EXCH_MGR.ex_date_change → 0 Ex_RemainderProv_Change, 1 Ex_RemainderLaz_Change, 2 exit.
CURRENT_OSTAT calc field = first + ftpe − pefr + purchase − selling (round 4).

## Remaining data units (chunks 2–4)
UnitPurchase 787, UnitSelling 742, UnitExchange 623, UnitProcAndFunc 431, UnitExAccModify 311, UnitRate 309,
UnitExchAccount 225, UnitAdmin 219, UnitResursGive 195, UnitResursReturn 158, UnitRemainder 143, UnitEditExch 136,
UnitAddExch 134, UNITRATEOPEN 98, UnitParametr 91, UnitExchRep 192 (data part). Hidden TabSheet1, Edit_Src_* search
panel, ToolBtnFile (BDE export).

## On hold (print/report)
UnitRep, UnitRepX, Unit_Rep (not in dpr), UnitRepTurn (QuickReport), UnitReestr, UnitFormReester, UnitReestrEnd,
UnitFastReport, UnitToplam, UnitRemandirReport; Print button on Əməliyyatlar.

## Unverified
1. EXCH_MGR / EXCH_TRANS / EX_ADM package source is not in the repo – commit behaviour assumed "package commits"
   (web never commits after these calls); signatures taken from the dfm Variables/Delphi calls only.
2. Binary dfm lost most `Variables.Data` defaults; only `:TITLE = 'dat'` (ODSExchProvarch, ODSResurs) was recovered from the raw blob.
3. ODSExchRateAll has `:dat` only inside a comment – opened without binds (as Delphi does).
4. ODSRatesFilial val_id list and ODS_RFilial union taken verbatim; the mock filial table is the shared one.
5. Mock: ExRemainderSql result is a fixture table, LastWorkDay_Calendar skips fixture holidays, Ex_Calendar = date in fixture calendar.
6. Delphi FilterRadioGroup filter is applied client-side (TDataSet.Filter) – not re-queried.

## Tests / screenshots
`api/tests/test_exchangemgr.py` (8). `e2e/exchangemgr_screens.py` → 325-em-offices, 326-em-operations,
327-em-resources, 328-em-rates, 329-em-rates-branch, 330-em-remainders.
