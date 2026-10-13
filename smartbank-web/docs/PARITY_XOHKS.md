# XÖHKS parity (Packages/LVPCSSManager_Turan)

Status: **inventory only** (no screens ported yet). Exact port, same conventions as PARITY_AZIPS.md / PILOT_NOTES.md.

## Identity
- ActiveX: `LVPCSSManager.ocx`, CoClass `LVPCSS` = `{E0D210EC-D799-46D2-A172-789782B5F96C}` (LVPCSSManager_TLB.pas:56), form
  `TLVPCSSForm` (LVPCSSImpl.pas, 4 739 lines, 140 methods).
- The same CLSID is used by six source trees: `Packages/LVPCSSManager_Turan` (the bank's, confirmed by the user),
  `_Turan_20160315`, `_Azer`, `_Nbc`, `_Nbc_new` and `Mahmud/LVPCSSManager`. modules.json now points to `_Turan`.
- Tree: Payments (Item9) → Item1 'XÖHKS' → `#31` (`PluginManager\Packages\Item31` = `axinplace:{E0D210EC-…},overlapped`, added to
  the mock SmartBankIni; on the real DB the bank's own SBCONFIG item is used). Route `/m/xohks` (not migrated yet → placeholder).

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

## Resume point
Step 1: read `TLVPCSSForm.ActiveFormCreate` (LVPCSSImpl.pas:792) and the refresh handlers, copy the four grid SQLs verbatim from
Data_Unit.dfm (XS_BATCHS :323, XS_BENEFICIARY :506, XS_INCOMING :734, XS_BatchsArchive :984, XS_BeneficiaryArchive :1142,
GridIncomingArchive's dataset), mock fixtures, API `/api/xohks/*`, page `/m/xohks`.
