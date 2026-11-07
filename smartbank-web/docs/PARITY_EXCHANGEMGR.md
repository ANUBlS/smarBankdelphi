# ExchangeMGR (Packages/ExchangeMGR-NBC) parity

Production source is `Packages/ExchangeMGR-NBC` (confirmed by the user 2026-10-20). ExchangeMGR-Turan, ExchangeMGR_IBAN,
DepositTeze and Teymur copies are ignored. CLSID `{F5E99666-E5B9-4579-B7ED-D83CC51D8FB7}` (ExchangeMGR_TLB.pas:52,
TExchangeMGR_X). Web route `/m/exchangemgr`, API `/api/exchangemgr`. Mock tree: Transactions → Exchange manager (Action #36).

Rules: verbatim SQL (`api/app/em_sql.py`, 70 `DM_*` texts extracted from the binary UnitDateExch.dfm with
`tools/dfm_bin2txt.py` + `tools/dfmsql_bin.py`), Oracle packages called as Delphi calls them, no DB changes, prints on hold.

## Status: complete (chunks 1-4) – prints/reports on hold

| Tab (Unit_ExchangeMGR.dfm) | Web | Status |
|---|---|---|
| Valyuta D. M. (DBGridEh master on ODSExchOffice, lookup filialname from ODSFilial) | tab 0 | ported (read/scroll, Add/Edit/Delete/Sazlama/Parametrlər/Hesabların sazlanması – chunk 3) |
| Resurslar (ODSResurs, ODSVdmResurs/ODSVdmRResurs) | tab 1 | ported (read, refresh, Give/Return, Confirm, Delete – chunk 3); Print on hold |
| Əməliyyatlar (ODSExchProvarch, `:TITLE` sort via DBGridEhTransTitleClick2, FilterRadioGroup client filter, ODSSumTrans) | tab 2 | ported (read, sort, filter, total, Add → Purchase/Selling, Confirm, Delete – chunk 2; Qalıqlar → FormRemainder – chunk 3); Print on hold |
| Məzənnələr (ODSExchRate / ODSExchRateOther / ODSExchRateAll) | tab 3 | ported (read). DBNavRate and BitBtn1 'Yeni məzənnələr' (FormRate) are `Visible = False` – not exposed |
| Filiallar üzrə məzənnələr (ODSRatesFilial + ODS_RFilial, SQL[3] = '' / 'and ex_id=N') | tab 4 | ported (read, filial filter, DBNavigator1 Edit/Post/Cancel/Refresh – chunk 3; Excel = 'Texniki işlər gedir' as in Delphi) |
| V.D.M-də Qalıqlar (EXCH_MGR.ExRemainderSql cursor) | tab 5 | ported (read) |
| Dövriyyə (Əməliyyatlara baxış, Kurslara baxış, Silinmiş, Toplam, Reyestr) | tab 6 | ported (chunk 4: all five sub-tabs' data, Excel); BtnPrint / Qəbzi çap et / Toplam Çap / Reyestr Çap on hold |

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

## Chunk 3 – set-up forms (`api/app/em_setup.py`, `web/public/modules/exchangemgr_setup.js`)

'SMART only' = `UpperCase(Session.LogonUsername) = 'SMART'`, else 'Hüququnuz Yoxdur!' (em.err_no_right). No call below is
followed by a Commit in Delphi except where **Commit** is written.

| Delphi | Web | Notes |
|---|---|---|
| ToolBtnAddClick2 (:1649) → FormAddExch (UnitAddExch.pas) | `Add`, `POST /setup/office/add-open`, `/office/add` | SMART only; ODSFilial re-open, FormActivate clears the edits and sets the filial combo to ODSFilial's current (= first) Id; SpBtnOkClick: StrToInt(Edit_ex_no) (EConvertError → the form stays open), KeyValue Null → variant error, `EXCH_MGR.ex_office_add` (function), ODSExchOffice.Refresh; the `(<>'0') or (<>'')` test is always true |
| ToolBtnEditClick2 (:1712) → FormEditExch | `Edit`, `/office/edit-open`, `/office/edit` | SMART only; `get_ex_office_out_params(v_id, 6 out)` + `ex_office_edit(v_id, …)`. Key filter: AddExch `0-9 , .`, EditExch `0-9` |
| ToolBtnDeleteClick2 (:1679) | `Delete`, `/office/delete` | SMART only, 'Silmək istəyirsiniz? ', `ex_office_delete(id)` |
| ToolButton15Click2 'Sazlama' (:2081), FormAccount TBGBClick | `Settings`, `/setup/role` | SMART + `Check_UserRole(usrname)`, then ShellExecute of the local Exchange.ini / ExchangeBalance.ini – cannot run in a browser: the page shows a notice (em.ini_local). The ini values used by FormExAccModify come from `.env` `EM_BAL_*` / `EM_BALANCE_MAIN_*` |
| ToolButton31Click (:3259) → FormParametr (UnitParametr.pas) | `Parameters`, `/param/open`, `/param/admin-in`, `/param/add`, `/param/del` | ODSExOffice / ODSExAdminIn / ODSParametr open, then SMART check; ODSExAdminIn Master ODSParametr ID → USER_ID; DBGrid2 dbl-click / Enter → `Ex_Admin_In_Add(ID, Filial, NAME, EX_NO, EX_NAME)`; DBGrid3 dbl-click / Delete key → `Ex_Admin_in_Del(USER_ID, USER_NAME, EX_ID, EX_NAME)` |
| ToolButton17Click (:2105) → FormAccount (UnitExchAccount.pas) | `Account settings`, `/acc/list`, `/acc/refresh`, `/acc/delete` | list without right check; Yenilə / İmtina et / Ləğv et SMART only; delete 'Silmək istəyirsiniz? ' → `ex_accounts_delete(id)` |
| ToolBtnAddChild / ToolBtnEditChild → FormExAccModify (UnitExAccModify.pas) | nested dialog, `/acc/open`, `/acc/currency`, `/acc/save` | add: SMART + Check_UserRole + office not empty; edit: SMART + office not empty. FormActivate: ODSExchRateAll, all_filial := office filial (disabled), account lists by ini balance (empty → '-1') and filial; add: combos -1 except CB_Selling_Acc_No (Null), main_cred/cash_kredit with val_id -1; edit: preset from ODSExchAcc. DBCBoxValuteClick re-opens main_cred / cash_kredit. BtnOkClick: KeyValue = -1 → just closes; Null account → variant error before the call; `ex_accounts_add` (function) / `ex_accounts_edit` |
| PopupMenuResurs GivingResursClick (:648) → FormGivenResurs | `Add` menu (Resurslar), `/resurs/give-open`, `/resurs/give` | EXCH_RESURSINSERT; FormShow resets (KeyValue -1); 'Valyutanı seçin!...' (Null only), 'Məbləği daxil edin !...', 'Tarixi daxil edin !...' (Növbəti gün checked); `VDMResursInsert(val, valname, ODSVdmResurs ex_no, office ex_name, amount, DateTimePicker5, Nextday/null, 1, 1, Nextstatus, 'VDM-ə dövriyyədən vəsaitin verilməsi')` |
| ReturnResursClick (:1506) → FormResursRetrun | `/resurs/return-open`, `/resurs/return-amount`, `/resurs/return` | EXCH_RETRUNRESURSINSERT; DBLookupComboBox2CloseUp: ODSExRemainder filter (val_id, ex_id) → CURRENT_OSTAT into the amount (no row → variant Null error); `VDMRetrunResursInsert(…, Daydat, 2, 1, 'VDM-dən resursun geri qaytarılması')` |
| ToolButton34Click 'Təsdiq etmə' (:3276) | `Confirm`, `/resurs/confirm` | EXCH_RESURSCOMMIT, empty / commitstatus = 2 → exit, `VDMResursTransaction(id)`, **Commit** |
| ToolButton38Click 'Ləğv et' (:3290) | `Delete`, `/resurs/delete` | commitstatus = 1 and 'Geri qaytarılımış resurs silmək istəyirsiniz? ' → `VDMResursDelete(id)` (no right check, as Delphi) |
| TlBOstatClick2 (:1635) → FormRemainder | `Balances` (Əməliyyatlar), `/setup/remainder` | DateTimePicker1 := DTP_System_Date; FormShow / Yeniləmək: get_date, Ex_Calendar, LastWorkDay_Calendar, the three SQL branches (none → empty SQL → error); Çap: empty → 'Heç bir məlumat tapılmadı!...', else on hold (FastReport) |
| DBNavigator1 on ODSRatesFilial (VisibleButtons Edit/Post/Cancel/Refresh, OnClick DBNavRateClick2 :1354) + ODSRatesFilialAfterPost | tab 4 nav buttons, `/rates-filial/nav`, `/rates-filial/post` | the four course columns are editable in dsEdit; Post = DOA `update EX_RATES_FILIAL set <modified cols> where rowid = :doa__rowid`, **Commit** (CommitOnPost), then checkadvancedobjectaccess EXCH_UPDATE twice (AfterPost + OnClick) – the error comes after the commit, as in Delphi. Edit / Cancel / Refresh run the check after the action. Scrolling / leaving the tab posts first |
| BitBtn14Click Excel (filial rates) | `Excel` | 'Texniki işlər gedir' (Delphi body) |

Not exposed because Delphi hides them: UnitRate (BitBtn1 `Visible = False`), DBNavRate (`Visible = False`), UNITRATEOPEN (ToolButton29 `Visible = False`, OPENRATE call commented out), UnitAdmin (ToolButton25 `Visible = False`), ToolButton48 resource edit (`Visible = False` → VDMResursUpdate / VDMRetrunResursUpdate never run), the description combo panels of the resource forms (`Visible = False`).

## Chunk 4 – Dövriyyə tab and the search panel (`api/app/em_turnover.py`, `web/public/modules/exchangemgr_turnover.js`)

| Delphi | Web | Notes |
|---|---|---|
| ActiveFormCreate :2184-2204 | sub-tab defaults | DTP_Begin/End, DTP_Dat, DateTimePicker3/4, DTP_DateReestr = ODSSysdat; CBox_Status / ComboBox1 = 0; DBLC_Exchange / DBLC_Currency = -1; DateTimePicker1/2 (Silinmiş) keep the dfm design date 25.11.2006; lookups ODSAvalute, ODSVDMAll, ODSAvaluteDelete, ODSDeleteVDM, ODSAvaluteToplam, ODSToplamVDM, ODSReestrValyuta, ODSReestrVdm (`GET /turnover/lists`) |
| BtnSearchClick :2732 (Əməliyyatlara baxış) | `Search`, `POST /turnover/search` | Null KeyValue → -1; `EXCH_MGR.Get_Turn_Over_Str(beg, end, val_id, status, exch_no)` → ODSTraffics.SQL (the text returned by the package is executed as is); Amountsum with `Sql[5] := St+Vt+Et` (verbatim strings) → the three DBEdit sums |
| ChBoxCurrencyClick / ChBoxExchangeClick / CheckBox1-4 | checkboxes | KeyValue := 1 / -1 on DBLC_Currency / DBLC_Exchange – CheckBox1/2 (Silinmiş) and CheckBox3/4 (Toplam, OnClick = CheckBox1Click / CheckBox2Click) also change the 'Əməliyyatlara baxış' combos, as in Delphi |
| BitBtn2Click :2707 (Kurslara baxış, 'F9') | `F9`, `POST /turnover/rates` | ODSRateTurn :dat = DTP_Dat (ex_rates ∪ ex_rates_archive). DBLC_Exch_Rate / Label10 `Visible = False` |
| BitBtn5Click :3357 (Silinmiş) | `Search`, `POST /turnover/deleted` | `Get_Turn_Over_StrDel(...)` → ODSDel_ExProvarch.SQL |
| BitBtn9Click :3501 (Toplam) | `Search`, `POST /turnover/toplam` | ODSReporting bdat/edat/val_id/val_name, `sql[15] := 'where p.ex_no='+N` or ''; DeltaAmount calc field = PURCHASEAMOUNT − SALESAMOUNT |
| BitBtn11Click :814 (Reyestr) | `Search`, `POST /turnover/reestr` | 'Vdm-i və valyutanı seçin!...' / 'Vdm-i seçin!...' / 'Valyutanı seçin!...'; ODSReestrReport dat/ex_id, `SQL[18] := ''` (-1) or `'and val_id='+N` |
| BitBtn3 / BitBtn4 / BitBtn7 Excel (CMExcelExport.ExportDataset 'Əməliyyatlar' / 'Kurslar' / 'Silinmiş Əməliyyatlar') | `Excel` → .xlsx | RecordCount = 0 → 'Heç bir məlumat tapılmadı!...'; otherwise every dataset field + title row on one sheet |
| PanelSearch Edit_Src_Amount / _Ekv_Amount / _Fee / _Course Change2 + Exit2 (:1389-1445) | 'Axtarış:' row under the Əməliyyatlar grid | ODSExchProvarch.Locate(debitamount / Lamount / fee_amount / op_course, Text, [loCaseInsensitive, loPartialKey]) on the filtered rows → current row; OnExit clears the edit. 'Gəlirlərin cəmi:' = ODSSumTrans FEE_AMOUNT |

On hold (reports): BtnPrint (QRepTurn / UnitRepTurn), BitBtn6 'Qəbzi çap et' (FormRep receipt), BitBtn10 (FormToplam frxReportToplam), BitBtn13 (Reyestr FastReport), FormRemainder 'Çap'.
Hidden in Delphi, not exposed: TabSheet1 (`TabVisible = False`: BtnFile / BtnTrans / BtnAllTrans BDE QueryTrans), ToolBtnFile (`Visible = False`, BDE file export).



## On hold (print/report)
UnitRep, UnitRepX, Unit_Rep (not in dpr), UnitRepTurn (QuickReport), UnitReestr, UnitFormReester, UnitReestrEnd,
UnitFastReport, UnitToplam, UnitRemandirReport; Print button on Əməliyyatlar.

## Unverified
1. **C in BtnRunClick** (UnitPurchase.pas:480, UnitSelling.pas) is a local Integer that is never assigned (`Ex_CourseRates` call commented out) – whether Delphi posts (ex_transaction) right after the insert is undefined. The web does NOT post at insert (`em_trans.INSERT_POSTS = False`); the operation stays trans_close = 0 until 'Təsdiq etmə'. Please confirm on production.
2. op_time: purchase = DTP_System_Time (now), selling = DTP_Date date + current time; decimal separator '.' assumed for FormatFloat/StrToFloat.
3. Selling RadioButton2 caption is 'Nağd  kurs' in UnitSelling.dfm (kept).
4. FormEditExch reads `get_ex_office_out_params` in FormCreate (auto-created form, ODSExchOffice possibly not open yet), so Delphi may show the values of the office current at creation time on every later open. The web reads the CURRENT office each time it opens (deliberate, documented deviation – editing the wrong office would be worse).
5. FormExAccModify ini values (ExchangeBalance.ini / Exchange.ini on the client PC) → `.env` EM_BAL_MANAT, EM_BAL_VALUTA, EM_BAL_GELIR, EM_BAL_ZERER, EM_BALANCE_MAIN_DEBT, EM_BALANCE_MAIN_CRED (empty → '-1'). Please fill them with the production values.
6. ToolBtnEditChild calls ODSExchAcc.Edit; the following ODSExchAcc.Refresh would post the unchanged record (CheckBrowseMode) – DOA skips an UPDATE without modified fields, so the web does nothing there.
7. FormResursRetrun CloseUp with no remainder row: assumed Delphi 2009+ message 'Could not convert variant of type (Null) into type (UnicodeString)'.
8. Mock: EXCH_MGR set-up procedures (ex_office_*, ex_accounts_*, Ex_Admin_In_*, VDMResurs*, Check_UserRole = SMART) emulate the obvious table effect only; `SB_ACA.checkmodaccess_int` = fixture list.
9. EXCH_MGR / EXCH_TRANS / EX_ADM package source is not in the repo – commit behaviour assumed "package commits"
   (web never commits after these calls); signatures taken from the dfm Variables/Delphi calls only.
10. Binary dfm lost most `Variables.Data` defaults; only `:TITLE = 'dat'` (ODSExchProvarch, ODSResurs) was recovered from the raw blob.
11. ODSExchRateAll has `:dat` only inside a comment – opened without binds (as Delphi does).
12. ODSRatesFilial val_id list and ODS_RFilial union taken verbatim; the mock filial table is the shared one.
13. Mock: ExRemainderSql result is a fixture table, LastWorkDay_Calendar skips fixture holidays, Ex_Calendar = date in fixture calendar.
14. Delphi FilterRadioGroup filter is applied client-side (TDataSet.Filter) – not re-queried.
15. Toplam (BitBtn9Click): exch_no / val_id are local Integers assigned only when CheckBox4 / CheckBox3 are checked; unchecked = uninitialised in Delphi. The web uses -1 (all offices / currencies).
16. EXCH_MGR.Get_Turn_Over_Str / Get_Turn_Over_StrDel return the SQL text that is executed – the package source is not in the repo; the mock builds it from the dm text + filters.
17. Search panel Locate with loPartialKey on Float fields: the web matches the start of the value's text (with '.' or ',' as decimal separator); DOA's exact comparison rules for numeric partial keys are not verified.
18. Excel exports re-run the query on the server (Delphi exports the dataset already open in the grid); column order = dataset field order, raw values.
19. Mock: SQLite `||` returns NULL when a part is NULL (Oracle treats NULL as ''), so CUSTNAME / CUSTPASSPORT can be empty in the mock only.

## Tests / screenshots
`api/tests/test_exchangemgr.py` (8), `api/tests/test_em_trans.py` (10), `api/tests/test_em_setup.py` (9), `api/tests/test_em_turnover.py` (6). `e2e/exchangemgr_screens.py` → 325-em-offices, 326-em-operations,
327-em-resources, 328-em-rates, 329-em-rates-branch, 330-em-remainders. `e2e/em_trans_screens.py` → 331-em-add-menu,
332-em-purchase-form, 333-em-purchase-saved, 334-em-confirmed, 335-em-selling-form. `e2e/em_setup_screens.py` (API started
with the EM_BAL_* values listed in the script) → 336-em-office-add, 337-em-accounts, 338-em-account-modify, 339-em-parametr,
340-em-resurs-give, 341-em-resurs-return, 342-em-resurs-confirmed, 343-em-remainder-form, 344-em-rates-filial-edit.
`e2e/em_turnover_screens.py` → 345-em-search-panel, 346-em-turnover-search, 347-em-turnover-rates, 348-em-turnover-deleted,
349-em-turnover-toplam, 350-em-turnover-reestr. Mock users: SMART / Smart#2026 (the Delphi 'SMART' set-up user) added to fixtures/users.json.
