# XÖHKS parity (Packages/LVPCSSManager_Turan)

Status: **steps 1-2 done, step 3a done** (accept actions + status chain), **step 3b done** (status images, TransCode tree, PrepareFile / Gedən fayl) (4 tabs read-only; OUT add / edit / delete of batches and beneficiaries, templates). Exact port, same conventions as PARITY_AZIPS.md / PILOT_NOTES.md.

## Identity
- ActiveX: `LVPCSSManager.ocx`, CoClass `LVPCSS` = `{E0D210EC-D799-46D2-A172-789782B5F96C}` (LVPCSSManager_TLB.pas:56), form
  `TLVPCSSForm` (LVPCSSImpl.pas, 4 739 lines, 140 methods).
- The same CLSID is used by six source trees: `Packages/LVPCSSManager_Turan` (the bank's, confirmed by the user),
  `_Turan_20160315`, `_Azer`, `_Nbc`, `_Nbc_new` and `Mahmud/LVPCSSManager`. modules.json now points to `_Turan`.
- Tree: Payments (Item9) → Item1 'XÖHKS' → `#31` (`PluginManager\Packages\Item31` = `axinplace:{E0D210EC-…},overlapped`, added to
  the mock SmartBankIni; on the real DB the bank's own SBCONFIG item is used). Route `/m/xohks` (migrated: true since step 1).

## Compiled units (LVPCSSManager.dpr)
| Unit | Form | Lines | Role (from names / first look) |
|---|---|---|---|
| LVPCSSImpl | TLVPCSSForm | 4739 | main form: 4 tabs (below) |
| Data_Unit | TDataMod | 407 | data module: ~50 TOracleDataSet, packages XS_CONTROL (Ins/Del/GetReference/PackTemp), SBOP, SB_ACA |
| PrepareFile_Unit | TPrepareFile_Form | 912 | outgoing file preparation |
| Payment_Det | TPaymentDetalsForm | 807 | payment (beneficiary) details editor |
| Transaction_Unit | TTransForm | 511 | batch / transaction editor |
| Properties_Unit | TPropertiesForm | 311 | XS_CONFIG properties |
| Vergi_Unit | TVergiForm | 295 | tax (vergi) payment fields |
| cryptounit | - | 150 | crypto (Crypto/, CryptoModel.ini) |
| Witch | TFormWitch | 138 | |
| ReceiveMessDetals_Unit | TRecMessDet_Form | 132 | incoming message details |
| FileSend_Unit | TSendFileForm | 121 | file sending |
| Unit_setting / Admin_Setting | TForm_Setting / TForm_Admin_Setting | 116 / 105 | settings |
| Get_to_shablon_unit / add_new_shablon | TForm_get_to_shablon / TAdd_new | 103 / 54 | templates (ODS_shablon) |
| AcceptTransUnit | TFormAcceptTransaction | 103 | accept / verify |
| Unit_Report, Unit_Report_in, Unit_ReportX, Unit_ReportinX (TQuickRep) | | ~95 each | reports (→ PDF) |
| Verifying | Tverify | 82 | |
| TransTypeUnit | TTransCodeForm | 73 | transaction type codes |
| Unit20 | TForm20 | 33 | |
Not compiled (do not port): Unit2.pas, auth_check.pas, `Bank List/`, `Script/`, `UTILITS/`, `OCX/`, `__history`, `*.~*`.

## Main form tabs (LVPCSSImpl.dfm)
1. `TabSheet1` 'Lvpcss [ OUT ]' (:43): GridBatchs (XS_BATCHS ⋈ account, avalute, filial_t) + GridBeneficiary (XS_BENEFICIARY);
   toolbars ToolButton1..39, AcceptButton, BtnSendToArchive; actions Mt102Insert/Delete/Refresh/Accept/Edit, MessagesOutAdd/Edit,
   MessOutDelete, MessagesOutAccept, MessageOutSelAll.
2. `TabSheet2` 'Lvpcss [ IN ]' (:1266): GridIncoming (XS_INCOMING = `XS_INCOMINGVIEWALL` by :BeginDate/:EndDate); ButtonMessIn
   Convert/Refresh/Edit/Del/Accept, MessageInFileLoad (manual upload, one file - as AZIPS).
3. `PgOutArchive` 'OUT [Archive]' (:2212): DBGridOUTArchBatchs (XS_BatchsArchive) + DBGridOUTArchBeneficiary (XS_BeneficiaryArchive).
4. `TabSheet3` 'IN [ARCHIVE]' (:3354): GridIncomingArchive.

## Package calls (counts in *.pas)
SB_ACA.CheckAdvancedObjectAccess ×32 (rights XOHKS_ADD / XOHKS_EDIT / XOHKS_DELETE / XOHKS_COMMIT / XOHKS_CREATEFILE, VERIFIKATOR,
FVERIFIKATOR, AVTORIZATOR); XS_CONTROL: xs_beneficiary_ReturnStatus ×9, xs_Batchs_ReturnChangeStatus ×9, xs_batchs_deletetrans ×6,
xs_config_change ×5, xs_beneficiary_VerifStatus, xs_Batchs_VerifStatus, xs_Batchs_ChangeStatus, BatchToReadyBatchs,
BatchToSendingBatchs, xs_*_delete, xs_incoming_insert/update/delete, set_incomingSum(Cod), GetNewBeneficiaryReference,
xs_transtype_*, xs_accounts_add, xs_SentInfo_insert, xs_Filter_Account_add/Delete, xs_Config_Commision_Change, xs_Batchs_update,
xs_Batchs_FVerifStatus/AvtStatus, xs_beneficiary_FVerifStatus/AvtStatus, xs_batchs_error, xs_Admin_in_Add/Del,
setbatchsAVTOtransaction, XS_BranchAccount_Add; SBOP.check_IBAN_acc_num. The XS_CONTROL body is not in the repo.

## Plan
1. Lists + archives (4 tabs, read-only grids, date filters, sums XS_BatchsSum / XS_IncomingViewSum, ActiveFormCreate :792).
2. OUT batch/beneficiary add/edit/delete (Transaction_Unit, Payment_Det, Vergi_Unit), templates.
3. Status chain (modifikator → verifikator → avtorizator), PrepareFile / FileSend + crypto.
4. IN file load (one manual file), convert, accept; reports as PDF; settings forms.

## Step 1. Lists + archives (done)
API `api/app/xohks.py` (`/api/xohks/*`), SQL `api/app/xohks_sql.py` (verbatim Data_Unit.dfm line lists with dfm line ranges), page
`web/public/modules/xohks.js`, mock `api/app/db/mock_xohks.py` + `fixtures/xohks.json`, tests `tests/test_xohks.py`, E2E
`e2e/xohks_screens.py`, screenshots 139-142.
- `POST /open` = ActiveFormCreate :792-932. Right checks in try/except: only XOHKSBENIFICARY matters (fails → PanelBeneficary hidden; the
  web also refuses `/beneficiary` for the OUT grid then). The VERIFIKATOR / FVERIFIKATOR / XOHKS_CREATEFILE / AVTORIZATOR / XOHKS_COMMIT
  blocks only reset the dates (their XS_BATCHS filters are commented out). GetUseDate :934 (XS_CONFIG.USEBANKDATE = 1 → SBOP.GET_DATE,
  else today). XS_BATCHS + XS_BatchsSum (BeginDate/EndDate = use date), edit1..3 from summodifikator / sumverifikator / sumavtorizator
  (`'Modifikasiya ='+floattostr(cem)`, opened in DataModuleCreate Data_Unit.pas:362), XS_IncomingView (dfm Active = True).
- OUT: `/out/refresh` = Mt102RefreshExecute → RefreshDataBatchs :1242 (SelectDate :1849 from the pickers); `/out/sort` = GridBatchsTitleClick
  :2734 (captions №, F, '' (status), 'Debet Məbləğ'; others exit). `:Title` is **otSubst** (Variables.Data type 1, default `x.ID`), so
  the order really applies (unlike the AZIPS bind); only the four Delphi strings are substituted. Sort refresh re-uses the dates of the last
  SelectDate (dataset variables kept per session in `module_state['xohks']`). `/beneficiary` = XS_BENEFICIARY detail (MasterFields ID).
- IN: `/in/list` = XS_IncomingView (`select * from xs_incomingview x order by :title`) refresh / GridIncomingTitleClick :4200 (№, '',
  'Debet Məbləğ'; the 'Тарих' branch is Cyrillic and never matches the 'Tarix' caption - kept). StDate_in/EndDate_in have no effect
  (Refresh_mess_in / SelectDateIncoming calls are commented out), so the IN list is not date filtered. The in_dir file list of
  MessagesInRefreshExecute is not shown (manual one-file upload comes in step 4). XS_IncomingViewSum is never opened in Delphi (its
  DBEdit stays empty; also `sum(...) ... order by x.id` would be ORA-00979) → no IN total.
- OUT [Archive]: `/out-archive` = OutArchRefreshClick :2911 (XS_BatchsArchive + XS_BatchsArchiveSum), `/out-archive/sort` =
  DBGridOUTArchBatchsTitleClick :632; row click → XS_BeneficiaryArchive + DataSetFilial name (XS_BatchsArchiveAfterScroll Data_Unit.pas:353).
- IN [ARCHIVE]: `/in-archive` = ToolButton41Click :4289 (XS_INCOMING + XS_INCOMINGSUM, Filter '' and CheckBox2/3 unchecked);
  `/in-archive/lookups` = ToolButton18Click (Panel38, Data_Admin_in / Data_Code); `/in-archive/filter` = BitBtn1Click :4336 (Filter
  `filial=N` / `TYPECODE=N` / both on the fetched rows, SUM SQL[6] `and filial=N` …). Values must be in the lookup lists. Delphi quirk
  kept: ToolButton41 does not reset XS_INCOMINGSUM SQL[6], so after a filter the next 'Yenilə' shows all rows but a filtered total.
- Mock: the verbatim SQL text runs in in-memory SQLite (nvl function, `uid` → mock user id, Dual table), so joins / where / order by
  of the Delphi text are exercised.
Not in step 1 (read-only port): the toolbar actions, popups, multi-select actions, AfterScroll button enabling (XS_BATCHSAfterScroll etc.),
status images (shown as status text), GridBatchsDrawColumnCell colours, the hidden columns (CurrencyRate, LAMOUNT, FUSERID).
Unverified (needs the real DB): XS_* table / view columns (from TFields only), `xs_batchs_today`, `xs_incomingview` vs
`XS_INCOMINGVIEWALL` contents, `xs_admin_in` columns, the date column types (DATE assumed; Trunc'd binds as in Delphi).

## Step 2. OUT add / edit / delete, templates (done)
API `api/app/xohks_edit.py` (`/api/xohks/tx/*`, `/pd/*`, `/shablon/*`, `/batch/delete`, `/benef/delete`), SQL in `xohks_sql.py`
(step-2 block), mock `XS_CONTROL` emulation in `mock_xohks.py` (DML inside the SQLite transaction; `MockConnection.commit/rollback`
commit / roll it back), tests `tests/test_xohks_edit.py`, web dialogs in `xohks.js`, E2E `e2e/xohks_edit_screens.py`, screenshots 143-146.
The two modal forms are server-side state (`module_state['xohks']['tx']` = TTransForm, `['pd']` = TPaymentDetalsForm) holding the
Delphi globals (new_id, after_add, MT, mess_edit, Batchs_Edit, bnf_count, the current DataAccountIban record, edit8, radios).

| Delphi | Web | Calls / notes |
|---|---|---|
| Mt102InsertExecute :2635 | `/tx/new` | XOHKS_ADD; PrepareTrans(0,false); `XS_BATCHS_insert('CREDIT',0,'','/','',0,valute[0],0)` **before** the form, no commit; FormActivate → `GetNewBatchRefrence(valute)` |
| Mt102EditExecute :2799 | `/tx/edit` | XOHKS_EDIT; PrepareTrans(0,true): DataAccountIban SQL[11] `AND (a.id=:custid)`, BNF `/BNF/`+benef count; batch.status>0 and first benef.status>0 → Batchs_Edit false, SpeedButton1 disabled |
| EditidKeyPress / AccSearchClick | `/tx/customer`, `/tx/account` | SQL[11] `AND (a.kli_id=:custid)`; 'Müştəri tapılmadı'; name, VÖEN ('/' when NULL), FindFilialID label, ViewBankInfo :1141 (filialinfo by kod_fil, bound) |
| Button_addClick | `/pd/open-tx` | CheckField(false) + valute check, cleared edits, '900', new beneficiary reference |
| ButtonPostClick | `/tx/post` | enabled only after a beneficiary add / account pick in edit / ref change (MT205 or edit); CheckField(true) (DataCheck by acc_no, bound), ref not empty, valute = DataAccountIban.val_acc; if BNF ≠ '/BNF/0': edit + same ref + status≠0 → 'Qeydiyyat №-si dəyişilməlidir!'; `xs_Batchs_update(id, edit8, acc_id, name, code, ref, amount, valute, filial, voen, format)`, **Commit**, edit → `xs_Batchs_ChangeStatus(id,0)`; close → FormClose **Rollback** (so that ChangeStatus is rolled back, as in Delphi) |
| Button2Click / Esc / FormClose | `/tx/close` | Rollback (a cancelled new batch disappears) |
| MessagesOutAddExecute :2404 | `/pd/open-add` | XOHKS_ADD; After_Add; Button4 → insert, **Commit**, then xs_BatchAmount_update + xs_Batchs_ChangeStatus (uncommitted) |
| MessagesOutEditExecute :2477 / ShowDetals :1283 | `/pd/open-edit` | XOHKS_EDIT; StrPart :970 splits REMIT_INF / ADD_INF; locked when (batch.status>0 and benef.status>0) or TRANSACTION_ID>0; ButtonFinish disabled until an edit with OnChange changes (Edit_Client_acc_no has none) |
| Payment_Det Button4Click | `/pd/add` | CheckField (required edits; first char of tey/inf in 0-9 A-Z Ə Ü Ö Ğ Ş Ç İ); `xs_beneficiary_insert(new_id, bank, sub, acc, name, code, voen, tey1|..|tey4|, transcode, inf1|inf2|inf3|, valute, ref, amount, bnf_count)`; TransForm BNF `\BNF\n` (backslashes, as in Delphi), amount += |
| ButtonFinishClick | `/pd/finish` | TransCode := '900' first; edit: length 28, `SBOP.check_IBAN_acc_num`, VÖEN 10 or '/', CheckField, status 2 → nothing; `xs_Beneficiary_update`, **Commit**, xs_BatchAmount_update, xs_format_update, xs_beneficiary_ChangeStatus, xs_Batchs_ChangeStatus (uncommitted). Add: CheckField + checks + Button4. MT205: `xs_batchs205(amount, ref)`, Commit, closes both forms |
| Combo_BankNameChange / RB_102TClick | `/pd/bank`, `/pd/lookups-102t` | BankM fields; MT102 T: bank fixed to BANKCODE=210005, client edits from ODS_Institution (ID, NAME, '/'+BOSH, TEK), tey1 = BudgetLevel.ID, tey2 = Destination.ID |
| Button1Click / add_new_shablon | `/shablon/save` | insert_shablon[1..17] → `xs_Beneficiary_shablon_insert` (no commit), Button1 disabled until a new reference. add_new_shablon (15 values) is not opened anywhere - not ported |
| Button5Click / TForm_get_to_shablon | `/shablon/list`, `/pick`, `/delete` | ODS_shablon; title click `order by FieldName` (whitelisted to the 17 fields); pick fills Fields[0..13] + bank by name + new reference; Sil → `xs_Beneficiary_shablon_delete(shablonun_adi)` |
| MT102DeleteExecute :2245 / MessOutDeleteExecute :2280 | `/batch/delete`, `/benef/delete` | XOHKS_DELETE; selected rows + current; dialog Yes / No (exit) / Cancel (break) / All (second confirm, every selected id); `xs_batchs_delete` / `xs_beneficiary_delete` + xs_BatchAmount_update + xs_Batchs_ChangeStatus(0); **no commit** (as Delphi: pending until the next Commit or a TransForm Rollback) |

Notes: a new batch has acc_id NULL until ButtonPost, so it is not in the XS_BATCHS inner join (as in Delphi). Vergi_Unit (TVergiForm) is created in
ActiveFormCreate :806 but never shown - not ported. The TransCode tree (TTransCodeForm, SpeedButton1) is not ported yet: ButtonFinish forces '900'.
Unverified (XS_CONTROL body not in the repo): parameter → column mapping of every XS_CONTROL call (mock follows the Delphi argument order),
what `xs_batchs205` does, `GetNewBatchRefrence` / `GetNewBeneficiaryReference` formats, `xs_beneficiary_shablon` column order vs insert
order, `filialinfo` / `xs_institution` / `xs_budgetlevel` / `xs_destination` columns, and the effect of the Delphi Rollback after
ButtonPost's ChangeStatus on the real DB.

## Step 3a. Accept actions + status chain (done)
API `api/app/xohks_status.py`, mock status emulation in `mock_xohks.py` (step-3 block), tests `tests/test_xohks_status.py`, web buttons /
dialogs in `xohks.js`, E2E `e2e/xohks_status_screens.py`, screenshots 147-149.

| Delphi | Web | Calls / notes |
|---|---|---|
| Mt102AcceptExecute :2343 (AcceptButton 'Modifikator', popup N4) | `/batch/accept` | XOHKS_COMMIT; exit unless status 0 / 3; status 3 → TFormAcceptTransaction first; `xs_Batchs_ChangeStatus(id,1)` = 1 → `SetBatchsTransaction(id)` + **Commit**, else warning 'Batch-də olan bütün messajların düzgünlüyü təsdiq olunmalıdır !' |
| AcceptTransUnit SpeedButton1/2/3, Edit_ReferensKeyPress | `/batch/accept-form`, `/batch/accept-form/ref` | CheckBox2: ref ≠ current, not empty → `PackTemp.UpdateBatchReference(id, ref)`; CheckBox1 unchecked → `xs_Batchs_ChangeStatus(id,1)` and Mt102Accept exits; '...' → `GetNewBatchRefrence(0)`; only a-z A-Z 0-9 accepted |
| MessagesOutAcceptExecute :2496 ('Düzgündür', MenuItem4) | `/benef/accept` | exit when no rows / current benef status ≠ 0 / batch status 2; `xs_beneficiary_ChangeStatus(id,1)` per selected row + current; no right check, no commit |
| ToolButton39Click :3623 + Verifying.pas TVerify | `/batch/verify`, `/batch/verify/confirm` | VERIFIKATOR; status 1 or 8; typed amount = FormCreate text (Frac≠0 → text without ',', else FloatToStr(Int)) → `xs_Batchs_VerifStatus` + `xs_beneficiary_VerifStatus` (dbedit4.Text, a string), else `xs_batchs_error`; no commit |
| ToolButton38Click :3677 'Avtorizator' | `/batch/authorize` | AVTORIZATOR; bankinfo SWIFT = TURAAZ22 → amount band rights XOHKS_CREATEFILE1000/10000/40000/100000 (100000 exactly needs 40000 **and** 100000, kept); status 4 → (filial>0 `setbatchsAVTOtransaction`) `xs_Batchs_AvtStatus`, `xs_beneficiary_AvtStatus`; no commit |
| ToolButton23Click :3720 'Geri qaytar' | `/batch/return` | RETURNBACK; batch/current benef 4/4 (AVTORIZATOR in try) → 7; 8/8 → deletetrans + 0; 7/7 and 1/1 (VERIFIKATOR in try) → deletetrans + 0; `xs_Batchs_ReturnChangeStatus` + `xs_beneficiary_ReturnStatus`; failed try → 'Bu statuslu əməliyyatı geri qaytarmaq hüququnuz yoxdur!...'. The second, commented-out block is not ported |
| ToolButton20Click :3603 'F.Verifikator' | `/batch/fverify` (API only) | button Visible = False (dfm :845) → no web button |
| BtnSendToArchiveClick :2942 | `/archive/send` | `PackTemp.SendToArchive`, 'Messajlar arxivə göndərildi', no refresh |
| XS_BATCHSAfterScroll / XS_BENEFICIARYAfterScroll / PopupMT102Popup | `xohks_status.enable()` + `en()` in xohks.js | Modifikator / Delete batch / Add / Delete / Correct only when status = msDefault; popup N4 overwritten to status in [0,3] |

Mock (bodies unknown): ChangeStatus(id,1) returns 1 only when the batch has beneficiaries and none in status 0; Verif/FVerif/Avt set
4/5/6 (+ vuserid/sdate, fuserid, auserid = user); xs_batchs_error sets 8; Return* set the given status; SetBatchsTransaction,
setbatchsAVTOtransaction, xs_batchs_deletetrans, SendToArchive are recorded only. Sums (summodifikator etc.) come from the static
xs_batchs_today fixture, so they do not change in mock mode.
Unverified: all of the above bodies; whether XS_CONTROL commits internally (Delphi issues no Commit after Verif/Avt/Return/benef accept -
on the web, as in Delphi, those stay pending in the user's session until the next Commit / Rollback); the DBEdit1 display format.

## Step 3b. Status images, TransCode tree, PrepareFile / Gedən fayl (done)
API `api/app/xohks_file.py` (`/api/xohks/transcode/*`, `/pf/*`, `/sent/*`), signer interface `api/app/xohks_crypto.py`, SQL in
`xohks_sql.py` (step-3b block), mock views / procs in `mock_xohks.py`, tests `tests/test_xohks_file.py`, web in `xohks.js`, E2E
`e2e/xohks_file_screens.py`, screenshots 150-154. Images `web/public/img/xohks/status_0..20.png` + `filial_0.png` were extracted
from the ImageList / ImageListFilial bitmaps of LVPCSSImpl.dfm:4299 / :4718 (16x16, 16-bit + mask).

| Delphi | Web | Notes |
|---|---|---|
| GridBatchsDrawColumnCell :1928 | `td()` in xohks.js | the OnDrawColumnCell of **all six** grids (GridIncomingDrawColumnCell :2868 is not assigned). Status 0→3, 1→10, 2→4, 3→5, 4→18, 5→17, 6→19, 7→16, 8→4, drawn instead of **DataCol 2** - on the beneficiary grids that is 'Tarix' (kept; their status column shows the number). Filial icon over DataCol 1 when FILIAL ≠ 0 on the four batch / incoming grids, only when a status image exists |
| createTransCodeTree :1114 (Mt102InsertExecute :2640 only) | `build_tree` in `/tx/new` | XS_transtype_name order by id → children xs_transtype_code (nameID = :ID), StateIndex = CODE. Built only by 'Yeni batch': before that the tree is empty (as in Delphi) |
| Payment_Det SpeedButton1Click :205, TransTypeUnit But_OkClick / DblClick / TreeView1Changing | `GET /transcode/tree`, `/transcode/ok`, '...' next to the trans code | OK accepts only a child node (ImageIndex 2) → Edit_TransCode := StateIndex; on a parent the form stays open. ButtonFinish still forces '900' (step 2), so the code matters for 'Əlavə et' (Button4) |
| ToolButton11Click :2105 'Faylı Hazırla' | `/pf/open` | XOHKS_CREATEFILE (not in try); sender = BankInfo.SWIFT+'AXXX', receiver = XS_CONFIG.NB_SWIFT, Edit1 '150', `XS_CONTROL.BatchToReadyBatchs(0,1)`, ReadyBatchs (`order by :Title`, otSubst, default id) / SendingBatchs |
| But_tosend / All_to_send | `/pf/tosend` {id, all} | limit check of the CURRENT ready record vs XS_CONFIG.amount_limit, then 'Təsdiq olunmuş "Batch" yoxdur !'; `BatchToSendingBatchs(id,0)` / `(0,1)`; `GetBatchAmount`, count |
| But_noSend / All_to_Nosend | `/pf/nosend` | exit when sending is empty; `BatchToReadyBatchs(id,0)` / `(0,1)` |
| GridReadyBatchsTitleClick | `/pf/sort` | №→id, Debet→ACC_NO, 'Debet Məbləğ'→AMOUNT, Tarix→TRANSDATE; others exit |
| SpeedButton1Click / Edit_referenceKeyPress | `/pf/ref`, `/pf/set-ref` | `INS.GetNewFileReference` only when sending is not empty; allowed chars 0-9 a-z A-Z / - : ( ) . , ' + { } space |
| Button_fileClick :798 → CreateFile :152 | `/pf/create` | exit when sending empty; 'Qeydiyyat №-si verilməyib !'; XML as Delphi (header lines CRLF in XOHKS_FILE_CODEPAGE, MessageBody UTF8String raw UTF-8 with #10, :32A: date from the last beneficiary - 991230 when none, MT205 branch by the first sending batch's FORMAT); `xs_SentInfo_insert('S',sender,receiver,Edit1,'N','N','C099',date,ref,0)` (no commit); edits cleared, RefreshDataBatchs. File returned for download + copy in XOHKS_OUT_DIR when set (Delphi: out_dir\<ref>.xml) |
| ToolButton5Click / TSendFileForm RefDate, BitBtn1Click, DBGrid1DblClick | `/sent/list`, `/sent/open` | XS_SENTINFO by Trunc dates; DblClick looks for out_dir\ddmmyy(today)\[Batches\]<ref>.xml (under XOHKS_OUT_DIR); 'File %s not found !'. CreateFile writes without the date folder, so as in Delphi such files are normally not found |
| cryptounit SetSign / SignCheck | `xohks_crypto.Signer` (XOHKS_SIGNER=none / mock) | never called by the Delphi build (SetSign lines in CreateFile are commented out); interface kept for a later signed format |
Not ported: CreateBatchFile / but_batchClick (button Visible = False). ToolButton6 'Baxmaq' :3907 → step 4b-1.
Unverified: XS_CONTROL BatchToReadyBatchs / BatchToSendingBatchs / GetBatchAmount / GetNewFileReference / xs_SentInfo_insert bodies and
the xs_ReadyBatchs / xs_SendingBatchs views (mock: status 6 with send 0 / 1; file → status 3), CreateFile's `xs_batchs.Refresh` on the
never-opened local dataset (:239 - in TDataSet that raises 'closed dataset'; the web assumes DOA re-executes it), the file code page
(cp1254 assumed), XS_SENTINFO columns, bankinfo_t columns.

## Step 4a: IN file load, Konvert, Yoxlanıb, Ləğv et (api/app/xohks_in.py, delphi_src/LVPCSS_ConvertToBase.pas)

| Delphi | Web | Notes |
|---|---|---|
| MessageInFileLoadExecute :2849 (OpenDialogIn → FileListIncoming) | 'Load file' → `/in/load` {name, b64} | User decision: ONE uploaded file at a time, which is the list's only item. in_dir is not read, and the folder part of LoadFileNames / MessagesInRefresh is not ported |
| ClearSelected1Click / Clear List | `/in/clear` | |
| LoadToRich :1394 + ConvertToBase :1412-1848 | run verbatim by pascal.py | `pascal.py` now has nested routines (FindMyText / FindLines / Replace see the outer locals) and `{$R-}` string index 0 / len+1 = #0 (Replace reads s[0] after it deletes a leading '/'). `vcl.RichEdit`: WordWrap=False lines; FindText = EM_FINDTEXTEX down in [start, start+len) with the whole match inside; SelStart/SelLength/SelText; CaretPos.y of the selection end; GetTextLen counts a break as 2 |
| DataCheck / DataTemp SQL.Add with quoted values | same text, with the quoted literals sent as binds | texts in xohks_sql.py LINES_IN_* |
| Ins.CallProcedure('xs_incoming_insert', 27 values) | XS_CONTROL.xs_incoming_insert | no commit (Delphi has none) |
| Convert1Click :2177 / MessagesInConvertExecute :2523 / ConvertAll1Click | 'Convert' / 'Convert All' / toolbar 'Konvert' → `/in/convert` | An already converted file shows 'Warning:  <f>   Artıq konvert olunub !' in Panel_info. An exception stops the run and is shown; inserts made before it stay uncommitted in the session (as in Delphi) |
| ConvertConfirmeClick :2948 | 'Konvert+təsdiq' | convert all, select all, accept |
| MessagesInAcceptExecute :2586 | `/in/accept/prepare` (Form20 'Verification', Yoxla = Close), then `/in/accept` | Date check of the current row against GetUseDate and SBOP.Get_Date; CheckAdvancedObjectAccess('XOHKS_IN'). The status=1 skip tests the dataset's current row BEFORE GotoBookmark (kept as in Delphi). SetIncomingTransaction(ID); no commit |
| MessInDeleteExecute :2204 | `/in/delete/plan`, `/in/delete` | Yes deletes the first selected row and clears the selection. With more rows selected, Delphi's next step then reads Items[1] of the empty list and raises (reported as 'List index out of bounds (1)'). No = exit, Cancel = break, All + Yes = delete all. xs_incoming_delete, no commit |

Unverified: how wide a line break is inside the RichEdit. Delphi XE's TRichEdit (RICHEDIT20W) counts a break as one CR. With that, ConvertToBase's
`:77B:` test (`TempPos = FnEndPos+10`) never matches after a 3-digit `:26T:`, and the chr(10) replacement in `:70:` finds nothing, so a CR is
left in remit_inf. Both only work with RichEdit 1.0's CR LF. `XOHKS_RICHEDIT_BREAK=crlf` switches the model, so check this with a real file.
Also unverified: the bodies of xs_incoming_insert / SetIncomingTransaction / xs_incoming_delete (the mock only emulates them), the layout of a real
incoming file (tests/data/xohks_in_sample.xml is built from the parser's offsets), and the exact EArgumentOutOfRange message text.

## Step 4b-1: Redaktə (RecMessDet_Form) and Baxmaq (FormWitch)

| Delphi | Web | Notes |
|---|---|---|
| MessagesInEditExecute :2570 / GridIncomingDblClick | 'Edit' / double-click → `/in/edit/open` | Exits when XS_IncomingView is empty. DataAccount (Data_Unit.dfm:6, LINES_DATAACCOUNT) opens on first use. FormShow clears SearchEdit1/2, DBEdit3, DBEdit8. The read-only DB fields come from ReceiveMessDetals_Unit.dfm |
| TSearchEdit (SBCM_ComponentsStorage/SearchEdit.pas) SearchEdit1 acc_no / SearchEdit2 inn | `/in/edit/search`, `/in/edit/exit` | KeyDown: Delete/Backspace → Tag 1 (no search). Change: Locate case-insensitive partial key; found → text completed with the rest selected, and DBEdit3/DBEdit8 follow DataAccount; not found → red. DoExit: white, text := field of the current account |
| Button1Click 'Yaddaşa yaz' | `/in/edit/save` {search1, confirmed} | Exits when SearchEdit1 is empty or SearchEdit2 is red. Clicking the button leaves the edit first, so the red test only sees white (kept as in Delphi). Date check ('deyişdirilə bilməz'); 'Əməliyyat #id dəyişdirilsinmi ?'; xs_Incoming_update(id, DataAccount.id, acc_no) and xs_incoming_ChangeStatus(id, 0); no commit |
| ToolButton6Click 'Baxmaq' :3907 | OUT tab 'Baxmaq' → `/in/witch`, `/in/witch/benef` | Uses the current StDate/EndDate picker values. OracleDataSet1 and detail OracleDataSet2 come from Witch.dfm (LINES_WITCH1/2); grid columns as in Witch.dfm |

## Settings forms
Not ported because Delphi never shows them. `Form_Setting` (Unit_setting.pas: XS_FILTER balance accounts, xs_Filter_Account_add / _Delete) and
`Form_Admin_Setting` (Admin_Setting.pas: xs_Admin_in_Add / _Del) are only created in ActiveFormCreate :804-805. No ShowModal / Show call
exists in any unit of the package, and no .dfm event opens them, so neither form can be reached in the Delphi build.

## Resume point
Step 4c: the prints as PDF. Popup menu items on the IN / OUT grids (LVPCSSImpl.dfm ~:4860-4890): N21Click :3066, N22, N23, N24, N25Click
'Hamısını çap et' (ReportinX / Form_Report_in with ODS_CODEID NAMEID branch, :3166-3300), N26. EnterClick :2957 (Form_Report) has no
OnClick in the .dfm, so check whether it is reachable before porting it. QuickReport layouts are in Unit_Report*.dfm / Unit_ReportX.dfm /
Unit_ReportinX.dfm; render them like the AZIPS prints (report_render.py). After that, mark XÖHKS complete.
