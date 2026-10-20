# ExchangeMGR (Packages/ExchangeMGR-NBC) parity

Production source is `Packages/ExchangeMGR-NBC` (confirmed by the user 2026-10-20). ExchangeMGR-Turan, ExchangeMGR_IBAN,
DepositTeze and Teymur copies are ignored. CLSID `{F5E99666-E5B9-4579-B7ED-D83CC51D8FB7}` (ExchangeMGR_TLB.pas:52,
TExchangeMGR_X). Web route `/m/exchangemgr`, API `/api/exchangemgr`. Mock tree: Transactions → Exchange manager (Action #36).

Rules: verbatim SQL (`api/app/em_sql.py`, 70 `DM_*` texts extracted from the binary UnitDateExch.dfm with
`tools/dfm_bin2txt.py` + `tools/dfmsql_bin.py`), Oracle packages called as Delphi calls them, no DB changes, prints on hold.

## Status: chunks 1-2 of 4 (main form shell, read-only tabs, Əməliyyatlar operations)

| Tab (Unit_ExchangeMGR.dfm) | Web | Status |
|---|---|---|
| Valyuta D. M. (DBGridEh master on ODSExchOffice, lookup filialname from ODSFilial) | tab 0 | ported (read/scroll) – toolbar Add/Edit/Delete/Settings/Parameters/Account settings: chunk 3 |
| Resurslar (ODSResurs, ODSVdmResurs/ODSVdmRResurs) | tab 1 | ported (read, refresh) – Give/Return: chunk 3 |
| Əməliyyatlar (ODSExchProvarch, `:TITLE` sort via DBGridEhTransTitleClick2, FilterRadioGroup client filter, ODSSumTrans) | tab 2 | ported (read, sort, filter, total, Add → Purchase/Selling, Confirm, Delete – chunk 2); Print on hold |
| Məzənnələr (ODSExchRate / ODSExchRateOther / ODSExchRateAll) | tab 3 | ported (read) – DBNavRate edits (EXCH_UPDATE): chunk 3 |
| Filiallar üzrə məzənnələr (ODSRatesFilial + ODS_RFilial, SQL[3] = '' / 'and ex_id=N') | tab 4 | ported (read, filial filter) – Edit / Excel: chunk 3 |
| V.D.M-də Qalıqlar (EXCH_MGR.ExRemainderSql cursor) | tab 5 | ported (read) |
| Dövriyyə (Əməliyyatlara baxış, Kurslara baxış, Silinmiş, Toplam, Reyestr) | tab 6 | placeholder – non-report parts chunk 4; Toplam/Reyestr reports on hold |

ActiveFormCreate (`GET /init`): ODSSysdat → SBOP.get_date → EXCH_MGR.Ex_Calendar(dat), Ex_Calendar(sdat) →
LastWorkDay_Calendar; `sdat > dat` → message (em.err_sysdate_greater) and nothing opens; otherwise EXCH_MGR.NextResurs
(no web commit – package commits), datasets open; both calendar flags true → em.err_calendar, else ExRemainderSql.
`/remainder/show`: EXCH_MGR.ex_date_change → 0 Ex_RemainderProv_Change, 1 Ex_RemainderLaz_Change, 2 exit.
CURRENT_OSTAT calc field = first + ftpe − pefr + purchase − selling (round 4).

## Chunk 2 – Əməliyyatlar operations (`api/app/em_trans.py`, `web/public/modules/exchangemgr_ops.js`)

| Delphi | Web | Notes |
|---|---|---|
| ToolBtnAddTrans DropdownMenu = PopupMenu → Purchase (PurchaseClick2 :1487) / Selling (SellingClick2 :1513) | `Add` menu, `POST /trans/open` | checkadvancedobjectaccess EXCH_BUYINSERT / EXCH_SELLINSERT, ODSExchRate.Refresh, IsEmpty → 'Yeni kurslar daxil edin!!!', ODSExchAcc (Master EX_NO) with its lookup fields (ODSExchRate + ODSRatesFilial by VAL_ID only – the filial-rates tab's current filial/date is the lookup source, as in Delphi) |
| FormActivate (UnitPurchase.pas:700-773, UnitSelling.pas:668-729) | dialog open | ODSSysdat date/time, ex_date_change → Ex_RemainderProv_Change / Ex_RemainderLaz_Change / 2 = exit before ClearEdit (the form keeps its previous contents) |
| DBLC_CurrencyClick, RadioButton1/2Click (ClearEdit), Edit_*_AmountChange, Edit_*_AmountExit (rate range messages), Edit_PasportKeyPress (purchase only), Timer | dialog | FormatFloat('0.000000') purchase / ('#.0000000') selling; Setting = SumNumToFull + val_name + ' -nin ' + course + ' KURSLA ALIŞI/SATIŞI '; Ekv/Fee via EXCH_MGR.RoundNew (`POST /trans/calc`); FloatToStr = 15 significant digits |
| BtnRunClick insert (UnitPurchase.pas:305-583, UnitSelling.pas:277-546) | `POST /trans/save` | 8-field customer check (all or none), AZN check, OPTrans (pmNamed) add_ex_prov_trans + ex_constants_add, open_cust_data_sets, get_purchase_no/get_selling_no/get_cash_acc_no/get_pur_acc_no, **Commit**; any exception → **Rollback** + message, form closes |
| ToolButton27Click 'Təsdiq etmə' (:2888-3045) | `Confirm`, `POST /trans/confirm` | EXCH_TRANS right, trans_close = 1 → exit, calculate_remainder, get_*_no, status 1 → EXCH_TRANS.ex_transaction, else ex_transaction_additional (accounts / courses swapped), **Commit**; no try/except (as Delphi) |
| ToolButton6Click2 'Ləğv et' (:2118-2138) | `Delete`, `POST /trans/delete` | EXCH_DELETE right, trans_close in (0,1) + 'Silmək istəyirsiniz? ', ex_provarch_delete(status, id), **Commit**, refresh |
| UnitProcAndFunc.SumNumToFull (:211-334) | `em_trans.sum_num_to_full` | verbatim incl. 'DOXSAN' without the trailing blank |

Not exposed because Delphi hides them: PopupMenu.ExchangeCurrency (UnitExchange – `Visible = False`), TBtnEditTrans (`Visible = False`, body commented out → the *Edit branches of all three forms are dead code), TBReturnTransClose 'Status' (`Visible = False`).

## Remaining data units (chunks 3–4)
UnitProcAndFunc (rest), UnitExAccModify 311, UnitRate 309,
UnitExchAccount 225, UnitAdmin 219, UnitResursGive 195, UnitResursReturn 158, UnitRemainder 143, UnitEditExch 136,
UnitAddExch 134, UNITRATEOPEN 98, UnitParametr 91, UnitExchRep 192 (data part). Hidden TabSheet1, Edit_Src_* search
panel, ToolBtnFile (BDE export).

## On hold (print/report)
UnitRep, UnitRepX, Unit_Rep (not in dpr), UnitRepTurn (QuickReport), UnitReestr, UnitFormReester, UnitReestrEnd,
UnitFastReport, UnitToplam, UnitRemandirReport; Print button on Əməliyyatlar.

## Unverified
0. **C in BtnRunClick** (UnitPurchase.pas:480, UnitSelling.pas) is a local Integer that is never assigned (`Ex_CourseRates` call commented out) – whether Delphi posts (ex_transaction) right after the insert is undefined. The web does NOT post at insert (`em_trans.INSERT_POSTS = False`); the operation stays trans_close = 0 until 'Təsdiq etmə'. Please confirm on production.
0. op_time: purchase = DTP_System_Time (now), selling = DTP_Date date + current time; decimal separator '.' assumed for FormatFloat/StrToFloat.
0. Selling RadioButton2 caption is 'Nağd  kurs' in UnitSelling.dfm (kept).
1. EXCH_MGR / EXCH_TRANS / EX_ADM package source is not in the repo – commit behaviour assumed "package commits"
   (web never commits after these calls); signatures taken from the dfm Variables/Delphi calls only.
2. Binary dfm lost most `Variables.Data` defaults; only `:TITLE = 'dat'` (ODSExchProvarch, ODSResurs) was recovered from the raw blob.
3. ODSExchRateAll has `:dat` only inside a comment – opened without binds (as Delphi does).
4. ODSRatesFilial val_id list and ODS_RFilial union taken verbatim; the mock filial table is the shared one.
5. Mock: ExRemainderSql result is a fixture table, LastWorkDay_Calendar skips fixture holidays, Ex_Calendar = date in fixture calendar.
6. Delphi FilterRadioGroup filter is applied client-side (TDataSet.Filter) – not re-queried.

## Tests / screenshots
`api/tests/test_exchangemgr.py` (8), `api/tests/test_em_trans.py` (10). `e2e/exchangemgr_screens.py` → 325-em-offices, 326-em-operations,
327-em-resources, 328-em-rates, 329-em-rates-branch, 330-em-remainders. `e2e/em_trans_screens.py` → 331-em-add-menu,
332-em-purchase-form, 333-em-purchase-saved, 334-em-confirmed, 335-em-selling-form.
