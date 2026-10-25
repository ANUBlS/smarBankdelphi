# Parity – Currency Position (Packages/CurrencyPosition → `/m/currencyposition`)

Production source confirmed by the user on 2026-10-20: `Packages/CurrencyPosition` (CurrencyPosition.dpk, CLSID
`{E960F06A-6084-4816-8863-DEE6397C9FE7}`, CurrencyPosition_TLB.pas:46). `Packages/CurrPos/*` is ignored.
The API is `api/app/currencyposition.py`, the SQL is in `api/app/cp_sql.py`, the page is
`web/public/modules/currencyposition.js` and the mock is `api/app/db/mock_cp.py` with
`fixtures/currencyposition.json` and `fixtures/dbf/Balansb.dbf`. Tests are in `api/tests/test_currencyposition.py`
(16 tests), and `e2e/currencyposition_screens.py` produces screenshots 312-318. The 'Kapital' form (UntCapital) is
`api/app/cp_capital.py` + `web/public/modules/cp_capital.js`, tested by `api/tests/test_cp_capital.py` (11 tests) and
`e2e/cp_capital_screens.py` (screenshots 319-324).
The menu entry is Transactions → "Currency position" (plugin Item35, tree `Item3\Item5`, Action `#35`).

## SQL and package calls
| Delphi | Web |
|---|---|
| `'CurrencyPosition_'+sb_GetUserName` (GetUserName = `USER`) | `cp_sql.table_name(user)`. The user name is validated against an Oracle identifier pattern before it is concatenated. |
| Do_Open `'Select  *  From '+T+' '+Filter+' Order By  PresentDate,Balance'` :549-564 | `sql_do_open` (same blanks) |
| GetRemainders `'Select Sum(Active),Sum(Passive) From '+T+Filter` :493-508 | `sql_remainders` |
| FillDate `'Select Distinct PresentDate From '+T` :458-491 | `sql_fill_date`. The combo shows `FormatDateTime('dd/mmm/yyyy')`, first item 'Bütün tarixlər'. |
| TBRefreshClick: `' Where '+' (PresentDate=:ADate)'+'And'+' (Currency =:Currency)'` :641-709 | `refresh_where` reproduces the exact concatenation, with `ADate` as a date and `Currency` as an integer bind. |
| ODSCurrency, ODSFillFile, ODSSVM, BankInfo, FrmTuning.OracleDataSet1 (dfm) | Verbatim constants (checked against gensql output). |
| TFrmChecking `'Select  TblChecking.*,TblChecking.RowID From '+' CPSUM_'+user+' TblChecking'` | `sql_checking` (with the leading blank) |
| `sb_currencyposition.Get_CurrencyPosition(Trunc(DTPBegin), Trunc(DTPEnd), CmbBoxPlan.ItemIndex+1)` | `/execute`, called with `commit=False`. The package commits itself and Delphi adds no commit. |
| `sb_currencyposition.DataChecking(Trunc(Dates[i]))` | `/checking/create`, `commit=False` (the package commits). |
| `sb_currencyposition.GetBankDay` | `/init`, which sets the DTPBegin and DTPEnd defaults. |
| `SB_CAPITAL.calculate_capumhes(date)` → `FloatToStr` (GetCapital :878) | `/capital`, using the `,` decimal separator (DBF_DECIMAL_SEPARATOR). |
| FrmTuning SpeedButtonCommit `Edit; Post` (DOA ApplyRecord, CommitOnPost) | `/tuning/save`: `update BankInfo set <modified fields> where rowid = :ROWID_`, then commit |

## Main form (TFrmCurrencyPosition)
| Delphi | Web |
|---|---|
| 'Yerinə yetir' runs only while Modified. Afterwards it is disabled, and the date or plan changes re-enable it. It also enables 'Hesabatlar...' and 'Yoxlamalar...' ('Yoxlamalar...' starts disabled, dfm:233). | Same |
| 'Təzələ' with ODSDate closed shows `'No  Records  in  DataSet!'#13'Use  Command for Fill  DataSet'` | Same text (client state = ODSDate.Active) |
| Grid columns Bank nöm. / Valyuta / Cari kurs / Balans hesabı / Aktivlər / Passivlər / Cari tarix. The calc field is BANKID = '0'+BANKID. | Same; numbers shown as FloatToStr |
| Panel4 'Cəmi :' SUM(ACTIVE) / SUM(PASSIVE) | Same |
| 'Fayla yaz': CopyFile of `Balansb.dbf` from the exe folder → Edit1 file. With ODSCurrPosition closed, only the copy is made and no message appears. With it open, the flow is re-open, FillDate, GetRemainders, reset combos, one record per row, then per date an InputBox `'BANKIN  KAPITALI '` (default GetCapital, Cancel = default) and two records, AZM/9601 and USD/9601. | Same. The template comes from DBF_TEMPLATE_DIR (mock: fixtures/dbf) and is returned as a download. A missing template gives 'File Creation UnSuccesful Terminated!'; any later error gives 'Creating  File  UnSuccesful Terminated!.' plus the error. Success shows 'Creating  File was Succesful.' |
| Record values: ACTIVES/PASSIVES `FloatToStrF(ffFixed,15,2)`, POUL `FloatToStr(RATE)`. The AZM row has ACTIVES `FormatFloat('0.00',SVM*Rate)`, PASSIVES = InputBox and POUL '1'. The USD row has ACTIVES = SVM AsString, PASSIVES '0.00' and POUL `FormatFloat('0.00',Rate)`. BANK_CODE of the extra rows comes from the last ODSCurrPosition record (EOF). | Same (`file_records`). The text goes into the template fields as AsString does, and BANK_CODE C(3) is truncated as TStringField does. |
| SpeedButton1 TSaveDialog (FileName 'BALANSB.dbf') | Modal file-name prompt; the base name becomes the download name |
| 'Kapital' (tb_CapitalClick: create TfrmCapital once, ShowModal) | Ported, see the next section. The dialog state is kept for the page, as the form object is. |

## Yoxlamalar... (TFrmChecking)
Dates are the main combo items without 'Bütün tarixlər'. Kapital Edit1 starts at '0', and a date change sets it to
GetCapital. Enter in Edit1 runs 'Yarat/Qaytar'. 'Yarat/Qaytar' calls DataChecking and then re-opens CPSUM_<user>. 'Təzələ'
re-reads the table, or runs 'Yarat/Qaytar' if nothing is open yet. 'Çıxış' closes the form.

The calc fields are computed on the client, as in ODSCheckingCalcFields:
* CalcLimit = FormatFloat('#0.00', (POK_ACTIVES-POK_PASSIVES)*100/Capital).
* Status is 'NORMA' when \|CalcLimit\| < \|LIMIT\|, otherwise 'CƏRİMƏ !'.
* AvialableActive and AvialablePassive follow the formulas at :151-196. A bad or zero capital shows 'Düzgün Kapital daxil edin!'.

CachedUpdates editing works as in Delphi. The RATE (Tag 0), ACTIVES (1), POK_ACTIVES (2), PASSIVES (3) and
POK_PASSIVES (4) cells are editable, and on post `Calculated(Tag, value)` recomputes the paired field. AfterPost sets
Label1 to 'CƏRİMƏ !' (red) when ΣCalcLimit ≥ 20, otherwise 'Normal' (green). Nothing is written to the DB, and the edits
are dropped on close (CancelUpdates). Inserting is impossible (BeforeInsert Abort).

## Hesabatlar... (TFrmTuning)
The form shows Bankın adı (BANK), Məsul şəxs (not stored, kept for the session), Struktur valyuta mövqeyi (SVM) and Cari
Kapital (CAPITAL). The ✓ button (SpeedButtonCommit) is enabled once a field is modified. It saves the changes and
commits. With 'Kapitalın avtomatik hesablanması' checked, a date click sets CAPITAL to GetCapital. Escape and 'Çıxış'
close the form.

## On hold (user decision: reports)
* UntCPReport (TCPReport QuickReport).
* 'Hesabat' (TBReport / InitialReport).
* 'Excel-ə at' (To_Excel, OLE automation of `VALYUTA_MOVQE.xlsx`; note that it reads fields `SdvPassiv` / `SdvPokPassiv`, which the ODSReport SQL does not return).

The ODSReport, ODSSdv and OracleDataSet2 SQL stays in UntMore.pas for when the reports are unheld.

## Kapital (TfrmCapital, UntCapital.pas/.dfm)
| Delphi | Web |
|---|---|
| ds_capital `SELECT cap.rowid,cap.id, cap.type, … FROM capital cap,account ac where cap.acc=ac.id (+) order by id` (dfm:2393) | `cp_sql.sql_capital()` verbatim (lines joined with line breaks) |
| ds_capital_out, same on `CAPITAL_ACC_OUT` (dfm:2582) | `sql_capital(order, out=True)` |
| ReOrder_Capital / DBGrid3TitleClick: `SQL[SQL.Count-1]:='ORDER BY '+Column.FieldName; Refresh` | `/capital/rows`. The field is limited to the grid columns BAL / ACC_NO / PERCENT. The order is kept for later refreshes, as the SQL is in Delphi. |
| ds_account `select * from account order by acc_no`; ds_account_out `SELECT *  FROM CAPITAL_ACC_OUT order by acc_no` | Loaded whole into the page (as the Transactions form does) for TSearchEdit / TDBViewComboBox |
| Design-time Active datasets: ds_AdiEhtiyyat (`… Bal_CN like '%91' … length(Bal_cn)=4`), OracleDataSet1 (`bal_spr1`), OracleDataSet2 (`OP_TYPE=3 and BAL_TYPE=1`), OracleDataSet3 (`OP_TYPE=4 …`), OracleDataSet4 (`select * from capital`, never shown) | All opened by `/capital/form`, verbatim |
| FormShow: ds_capital.Open, `dp_capdate := PK_CAPITAL.GetDate`, ds_account.Open (only while closed) | `/capital/form`, called once per page |
| cb_MainChange: ActivePageIndex, `dp_capdate.Date := sb_GetBankDate` (sb_currencyposition.GetBankDay), pages 4/5 re-open ds_AdiEhtiyyat with the :341 / :348 SQL, page 6 re-opens OracleDataSet1 (:355) | `/capital/page` |
| Setfilter `(BAL_TYPE=1) and (TYPE='x') and (OP_TYPE=n)` / SetOUTfilter `(BAL_TYPE=2) …` from the page OnShow and the `+`/`-` tab sets | TDataSet.Filter on the client. A filter change goes to the first record and posts a pending FORMULA edit first (CheckBrowseMode). |
| Insert_FIRST/SECOND/Risk/Risk_OUT/ADIEHT/CAPEH/Ametal/Pmetal: `StrToIntDef`, account = `ds_accountId.AsInteger` when the text is set, `Exit` when both are 0, `cap_insert(type,bal,acc,0,percent,'',op_type[,bal_type])` | Same on the client, then `/capital/insert`. The 7-argument call is used when cap_baltype = 0 and the 8-argument one otherwise. `commit=False`: cap_insert commits itself. |
| Refresh after insert / delete: ds_capital, OracleDataSet2, OracleDataSet3 (+ ds_capital_out for the off-balance insert); Delete_capital_out refreshes ds_capital_out only | Same sets are returned |
| Delete_capital (`ID>0`), Delete_capital_out (`Active and ID>0`), BitBtn15/17 (`fieldbyname('id').asinteger`, so 0 on an empty grid, no check) | Same; `cap_delete(id)`, `commit=False` |
| Delete key in dbg_balacc / DBGrid1/2/4/5, DBGrid3 and DBGrid6 (DBGrid7 has none) | Same |
| Default buttons BitBtn1/6/4/8 (Enter), Cancel buttons BitBtn2/7/5/9 (Esc) | Same on the visible page. **Esc therefore deletes the current record, exactly as in Delphi.** |
| ed_balKeyPress / ed_capehKeyPress / AmetalKeyPress / PMetalKeyPress (digits, 5 chars), ed_outbalKeyPress (10 chars) | Same. A 10-digit value outside Integer gives 0 (StrToIntDef). |
| OnEnter / OnChange clearing (ed_bal ↔ se_ACC_NO, se_ACC_NOChange clears **ed_balActive**, …) | Same, including se_ACC_NO clearing the risk page's ed_balActive |
| TSearchEdit: `Locate(ACC_NO, Text, [loCaseInsensitive, loPartialKey])`, completes the text, red on no match, Enter/Exit sets the located ACC_NO | Same |
| Unit variable `a: string[10]` (BitBtn10/12/14/16, DBViewComboBox3-6 OnChange) | Kept per page, cut to 10 characters. As in Delphi, Adi ehtiyatlar / tutulmalar / metals insert `acc = ds_accountId` (the current account record) whenever `a` is set. |
| ts_adi / ts_capeh on `-`: no insert (else branch commented out) | Same |
| BitBtn3 'Hesabla': all memos '0', then `FloatToStr(CallFloatFunction(f,[Trunc(dp_capdate)]))` for calculate_First_capital, _second_capital, _risks, _reserv, _capital, _capeht, _capumhes, _AQiymetal, _PQiymetal | `/capital/calc`, in that order. On an error the remaining memos stay '0' and the error is shown. |
| SpeedButton1: `if State=dsEdit then Post` of DBEdit1 (FORMULA), DOA CommitOnPost | `/capital/formula`: `update capital set FORMULA = :FORMULA where rowid = :ROWID_`, then commit |
| SpeedButton2 (Connect): ds_account_out / ds_capital_out Open, SetOutfilter('A',1), enable the off-balance edits; any exception shows `'Балансдан кянар гошулмыйыб'` (Azl font: 'Balansdan kənar qoşulmayıb') | `/capital/out/open`; message key `cp.cap_out_fail` |
| PageControl1 ActivePage = TabSheet2 (Balansdan kənar), PageControl3 ActivePage = TabSheet4 (Passiv) | Same start pages |

Held: BitBtn3Click also sets `CPReport.QRLabel36/37` from Ametal−Pmetal. Those labels belong to the held UntCPReport, so this is not ported.

## Unverified items
1. **Currency codes.** The Delphi code hard-codes Currency/VAL_KOD = 1 for USD (ODSFillFile `SetVariable('Currency',1)`; DataChecking `VAL_KOD=1` and `Where Currency=1`). If the production DB uses 840, DataChecking raises ORA-01403 and the file's USD/AZM 9601 rows get an empty rate (FormatFloat(Null) → error). The mock uses the old codes 0/1/2/3.
2. **Template.** `Balansb.dbf` is not in the repo. The mock template uses the field list of the commented-out CreateTable (:774-784), with BCD assumed as N(20,2) / N(20,4). The real template must be placed in DBF_TEMPLATE_DIR.
3. **Calc field.** Writing the BANKID data field in OnCalcFields ('0'+BANKID) is assumed to work under DOA, as production uses it. BANK_CODE C(3) then gets e.g. '012'.
4. **Combo dates.** The `dd/mmm/yyyy` combo text depends on the Windows ShortMonthNames and DateSeparator; the web shows English month abbreviations with '/'.
5. **Distinct order.** `Select Distinct PresentDate` has no ORDER BY, so the date order comes from Oracle.
6. **ApplyRecord.** The DOA update is assumed to cover the modified fields only, `where rowid`.
7. **Empty date list.** Opening Hesabatlar or Yoxlamalar before 'Yerinə yetir' hits `Items.Delete(0)` on an empty list in Delphi. The web shows 'List index out of bounds (0)' and does not open the dialog.
8. **Overwrite check.** The 'Overrite the Existing File ?' check (FileExists on the client disk) has no browser equivalent. The browser's download handling applies instead.
9. **Mock aggregation.** The mock replaces the Account/Archost/BAL_SPRn aggregation of Get_CurrencyPosition (SB_BALANCE.SALDOTOACTIVE/PASSIVE, OUT_* tables) with fixture rows. DataChecking runs the package's own INSERT…SELECT.
10. **No Oracle run.** Nothing has run against a real Oracle yet. The per-user DDL (Drop/Create Table in the packages) needs the schema rights the Delphi users had.
11. **SB_CAPITAL version.** The repo's package script (SQL_credit/sm_p.sql:38045, generated 2008) has no `calculate_AQiymetal` / `calculate_PQiymetal`, which BitBtn3Click calls. The production package must have them; otherwise 'Hesabla' stops after `calculate_capumhes` with ORA-06550 / PLS-00302.
12. **capital.ID.** cap_insert inserts `values (0, …)`; a trigger presumably assigns the ID. The mock uses max(ID)+1.
13. **Account lists.** ds_account is the whole ACCOUNT table and is sent to the page in full. On a large production DB this may be slow. Delphi fetched it on demand (QueryAllRecords = False).
14. **NULL ordering in the mock.** SQLite sorts NULLs first under `ORDER BY BAL`, Oracle sorts them last. Only the mock differs.
15. **TDBViewComboBox.** The combo is shown as a drop-down list that moves the dataset cursor and copies the text into the search edit (its OnChange). Its own display of the current record is not reproduced.
