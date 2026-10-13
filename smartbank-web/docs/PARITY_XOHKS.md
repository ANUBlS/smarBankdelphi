# XÖHKS parity (Packages/LVPCSSManager_Turan)

Status: **steps 1-2 done** (4 tabs read-only; OUT add / edit / delete of batches and beneficiaries, templates). Exact port, same conventions as PARITY_AZIPS.md / PILOT_NOTES.md.

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

## Resume point
Step 3: toolbar / popup actions on OUT (Mt102AcceptExecute :2343, MessagesOutAcceptExecute :2496, PopupMT102Popup :2784 n4, BtnSendToArchive,
verifikator / fverifikator / avtorizator status chain, xs_*_ReturnStatus / ReturnChangeStatus), AfterScroll button enabling
(XS_BATCHSAfterScroll), status images + GridBatchsDrawColumnCell colours, TTransCodeForm tree, then PrepareFile / FileSend + crypto,
step 4 IN file load / convert / accept, reports as PDF, settings forms.
