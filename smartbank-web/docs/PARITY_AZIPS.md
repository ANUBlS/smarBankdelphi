# AZIPS – parity with Delphi `Packages/SWIFT_MANAGER_IBAN_NEW` (TSWIFT_MAIN)

CLSID `{1D16D2DC-0511-4CC1-AE9A-6C95D648C2C2}` (`SWIFT_MANAGER_TLB.pas:56`). Web route `/m/azips`, tree **Payments → AZIPS**
(`Tree\Sections\Item9\Item0`, Action `#8`). The CLSID was already `PluginManager\Packages\Item8` (legacy "SWIFT" node
`Item3\Item2` points to it as well), so no second plugin entry was added: a duplicate CLSID in the plugin list would make
`#8` and `#31` the same module. Rights: `sb_aca.checkmodright(CLSID)` on every call, as for all modules.
This is an **exact port**. The MX / CBPR+ change comes later and is not part of this work.

## Units compiled (`SWIFT_MANAGER.dpr`)
SWIFT_MAINImpl1 (main form, 7 311 lines), Unit2 (SWDataModule), Unit3 (Sazlama), cap, Unit4 (IN_edit), createmess, ceskin,
Unit19 (inarchiv), editmt103, formmt103, qrp1, Unit7, Unit8, yoxp, archivout, qr5, qrp5, OUT_MT, Editmt103Show, Azipsn,
Unit16, Checkacc, Tranzit_account, AzipsSett, MTsett, insett, acc_check, UFX71. Not compiled (ignored): `*.~pas`, CalculatorEh.

## Crypto / signing
`CRYPTOMODELLib` is **not referenced** by any unit this .dpr compiles (grep of all compiled .pas/.dfm). The only
"crypto" in the module is `Encrypting`/`Decrypt`/`String2Hex`/`Hex2String` in SWIFT_MAINImpl1.pas:6864-6930. These are ported
in the part that uses them (UFX credit, `ufxcredit` :6931), copied from the Delphi code, nothing invented.

## Plan (clean pushed commits)
1. **Lists, totals, archives** (done) – see §1.
2. **Outgoing message editor / creation** (done) – see §2. Open follow-up 2b: `filereport.bpl` `Azipsnew` (`Packages/Cards_New/FileReprt/Unitazips.pas`, 4 707 lines), which is what the visible "Yeni" button and "Redaktə et" for non-103 rows open.
3. Conversion / export files. **3a done** (outgoing files: `CreateFileClick` → `PACS0008Execute`) – see §3.
   **3b done** (incoming import, see §3b); the hidden list print `ToolButton8Click` moves to part 4 prints. Was: incoming import `ToolButton4Click` (button "Konvert", also `Timer1Timer`) → `KonvertexExecute` (:538) / `konvert3Execute` (:6480)
   and `Konver102Execute` (:2112, called from Konvertex); `ToolButton8Click` (:6179, QuickRep list – button Visible=False).
4. Remaining actions: commit/verify/modify/authorise (`comitClick`, `commitingExecute`, `ToolButton11/13Click`, `CreateFileClick`),
   back/delete (`geriExecute`, `out_deleteExecute`, `DeleteExecute`, `Geriqaytar1Click`), incoming postings (`AddTrans*`,
   `AddINTransNew`, `addtrans2`), checks (`cheskaccount`, Checkacc, acc_check, Tranzit_account), settings (Unit3, Azipsn,
   AzipsSett, MTsett, insett), prints (cap, qrp1, qr5, qrp5, `ToolButton8Click` list print), UFX credit (UFX71, `ufxcredit`).

## 1. Lists, totals, archives (done)
| Delphi | Web | SQL / calls (verbatim, `api/app/azips_sql.py`) |
|---|---|---|
| ActiveFormCreate :2356-2516, RefreshButtonClick :2935-2948, RefreshExecute :3608-3615 | `/api/azips/list`, OUT tab (3 boxes) and IN tab (2 grids) | `sw_main.new_dat` on every refresh (no right check, as Delphi); `sw_out` (status 2,8,15 "New created messages"), `sw_out_2` (5,7,55 "Committed"), `SW_OUT3` (1 "Sending"), `sw_in` (status<>96 and <>10), `sw_in2` (status=96) |
| Branch rule :2436-2508 | same | `userfil` filialid<>0 → `SQL[10] := 'and branch = (SELECT filialid …)'`; else `SB_ACA.checkadvancedobjectaccess_func('SW_IN_FIL')`=1 → all branches, else the branch line |
| Edit2 / Edit3 :2942-2945 | two read-only lines | `swmammount` (status 1), `SW_amount` (status 5); text `'Bu gün göndəriləcək ümumi məbləğ = '+FloatToStr(summ)+' AZN'` |
| GridINTitleClick :4264-4290 + ExtractDesc | header click on Incoming | `sql[46] := 'order by '+Field+' desc'`, toggling to `asc` when the current line contains `desc` |
| DBGrid1TitleClick :2583-2602 | header click on Processed | `sql[46] := 'order by '+Field` |
| ArchiveClick :3899-3904 | "Send to archive!" | `SB_ACA.CheckAdvancedObjectAccess('SW_ARCHIVE')`, `sw_main.new_dat`, message `Məlumatlar arxivə göndərildi!` |
| arxivClick :5407 → Tinarchiv (Unit19.pas) | "Archive" on IN tab | `ARXIVIN` with `:dat1/:dat2` (trunc), `:title`; ComboBox1 `sql[6] := 'and mt<>'' '''` / `'and mt='''+type+''''`; branch rule incl. SW_IN_FIL |
| ToolButton14Click :7082 → Tarchive_out (archivout.pas) | "Archive" on OUT tab | `out_archive`; operator ≠ 'Butun operatorlar' → `SQL[5] := ' and fcreate_opid=:oper'` (bound); `sql[6]` messagetype; branch line only when filialid<>0 (no SW_IN_FIL check, as Delphi); `Operators` list |

Safety: sort columns and message types are accepted only from the fixed Delphi lists (grid FieldNames, ComboBox1 items); then
the same text Delphi builds is written into that line. Dates/operator are bind variables.

Deliberate/kept quirks:
- `ORDER BY :title` in both archives binds a string, so Oracle orders by a constant (Delphi behaviour, kept).
- `grid_outTitleClick`, `GRIDOUT2TitleClick`, `gridout3TitleClick` do `SQL.Add('ORDER BY '+Field)` **after** the existing
  `order by id desc`, which gives ORA-00933 in Delphi. The web does not offer sorting on these three grids (same result: no sort).
- Delphi keeps `SQL[10]` edits on the shared data module (once set, they stay for the session). The web evaluates the rule on every
  call; the outcome is the same because the inputs (filialid, SW_IN_FIL) don't change during a session.
- DateTimePicker3/4 on the OUT tab are not used by any query (`bdat/edat` code commented out) – not shown.
- Search boxes in the archive forms (`SearchRecord`, partial, case-insensitive) – use the browser search / grid; not yet ported.

## 2. Message editor / creation (done)
API `api/app/azips_edit.py` (routes under `/api/azips`), UI `web/public/modules/azips_edit.js`, tests `api/tests/test_azips_edit.py`,
E2E `e2e/azips_edit_screens.py`, screenshots 105-109. New verbatim SQL in `azips_sql.py` (generated, Unit2.dfm line ranges in comments):
`MT`, `mt_select`, `ComboItems`, `Comboselect`, `aftercomboselect`, `valute`, `banks`, `Tobic`, `referans`, `bankinfo`, `CORR`,
`DS_AccsForComission`, `Chk_AccNo`, `Account`.

### What is reachable in Delphi (and therefore ported)
| Delphi entry | How it is reached | Web |
|---|---|---|
| `YeniExecute` :2604 → `TOUT_FORM` (OUT_MT.pas) | action `Yeni`, ShortCut 16462 = **Ctrl+N** (no button uses the action); hidden ToolButton15 'Swift' (Visible=False) | "New message" button + Ctrl+N on the OUT tab |
| `ToolButton2Click` :3530 "Redaktə et" | right `SW_OUT_EDIT`; `SENDERLT<>'103'` → `Pluginloader('filereport.bpl','Azipsnew',id)`; MT103 + FINCOPY<>'AZN' → `TMT103` (editmt103); MT103 + 'AZN' → `TMT103AZN` (formmt103) | "Edit" on the selected *New created messages* row; plugin case → message "not ported yet" |
| `Redakteet1Click` :3578 (action `konvert`) | Committed grid: FINCOPY='AZN' → `Form7` (Unit7, not this step), else `TMT103Show` (Editmt103Show, read-only) | "View committed" |
| `Edit_outExecute` :3205-3528 | **not connected**: action `Edit_out` has `OnExecute = Capet1Click` (SWIFT_MAINImpl1.dfm:2871-2874) | not in UI; mapping ported as `edit_out_prefill()` for reference |
| `createmess.pas` (`TForm5`) | never created (no CreateForm in SWIFT_MANAGER.dpr, no `TForm5.Create`) | not ported |
| ToolButton1 "Yeni" (the visible button) :2337 | `sw_settings.EXpire_t` time check, right `SW_OUT_NEW`, then `Pluginloader('filereport.bpl','Azipsnew','1')` | **not ported yet** (other package, see plan 2b) |

### OUT_FORM (CreateMessageBeginExecute OUT_MT.pas:771-1266)
- Defaults (FormActivate :1298): sender = `bankinfo.SWIFT`, 'Institution', FIN, priority/monitoring N, date = today, FIN-copy = **AZN**,
  currency fixed AZN (disabled); `FINChange` :596 clears the option combos, AZN ↔ currency enabled/empty.
- Option combos are filled from `sw_fields` (InsertComboBoxItems :467: `ComboItems.SQL[1] := 'and '+fin+fincopy+' is not null order by sw_field'`,
  `:comboname` = component name, first item ''); `fin`/`fincopy` accepted only from MT list / {'', 'AZN'} before being written into SQL[1].
  Selecting an item runs `aftercomboselect` (hide) / `Comboselect` (show) by `SW_FIELD` (CMF50Change :654).
- Validation message exactly `' '+dolmayan+' Xanalar doldurulmayıb!'`; only MF23B, currency, amount and MF71A block the save
  (MF50/MF57/MF59 are added to the text but their stat stays 'nextprosedure', as in Delphi).
- Reference: `sw_main.Set_Referense(:FORMATS,:currensy)`; amount `StrToFloat` ('.' decimal; keypress allows 0-9 and '.').
- MT103 → `sw_main.savetransaction` with the 20 arguments in Delphi order (incl. constants `0, 1, 'AZN'`, receiver name/city from Edit2/Edit3,
  `DateToStr(mf32_date)`); others (MT205) → `sw_main.saving205` (12 args: sender type 'Institution', constant `25`).
- MF50 account/name per CMF50 index (non-AZN: 1=50A Edit1/Memo1, 2=50F Edit4/Memo2, 3=50K Edit3/Memo2; AZN: index 1 = 50K Edit3/Memo2);
  `Chk_AccNo` is opened but its error is commented out (kept: no check). `voen` is computed and never used (not ported).
- Text rules: name/address memos UpCase, 4×35 (Memo1_MF50KeyPress); OF70 GetRichEditLine (4×35, no Enter, 148 max);
  OF72 GetRichEditLine2 (`/BNF/`+30, `//`+33 ×4, `//`+27); MF20 max 16, MF21 max 3, amount max 15.

### MT103 edit (CreatMessageExecute editmt103.pas:970-1353) – sw_out.Post
- Opens with `open_edit_form` (CMF index from M50/M52/M54/M55/M56/M58/M59, CMF53 fixed to B and disabled, CORR, MF71A, MF71G split at
  `LastDelimiter('|')`, DS_AccsForComission), then FormActivate (runs after TabSheet1Show) sets `Edit3_MF50 := DBEdit_M36.Text` (MF36).
- Validation: MF23B, currency, **currency again** for 'mebleq' (Delphi checks `mf32a_val` twice, not the amount), MF50, MF57, MF59, MF71A – all blocking.
- Writes a **new** `MF20_REFERENCE` from `Set_Referense` on every save (DBEdit bound to the field).
- `if DBEdit_M36.Text<>'' then` governs only `SENDERTYPE` (the rest of the header fields are always written).
- 50K: `TAX := trim(copy(Lines[1],0,20))` of the name memo; Chk_AccNo NULL → `MF50 - Hesab nömrəsi düzgün deyil!`; cust_type 1 → TAX ''.
- CMF57 writes the **58** fields with Delphi's letters: 1→`:58A:`, 2→`:58B:`, 3→`:57C:` (clears MF58_NAME$LOCATION), 4→`:58D:`.
- Post = `update SW_OUT_NEW set <fields> where rowid = :doa__rowid` + commit (DOA CommitOnPost); `sw_outBeforePost` sets `M70=':70:'` when MF70<>''.

### MT103AZN (Change1Click formmt103.pas:257-272)
59A → `MF59_NAME$ADRESS := RichEdit1`; `MF70 := trim(OF70)`; `MF72 := trim(RichEdit3)`; DB-bound fields (receiver BIC, country, hesabat,
amount, MF32A date, MF50 account/name, MF59 account/name/BIC); Post + commit. FormActivate copies DB memo lines 0-3 / 0-5 into the rich edits.

### MT103Show
Same layout as MT103 on `sw_out_2` (Committed), everything read-only, no save.

### Unverified / to check on the real database (part 2)
- `sw_main` body is not in the repo: `Set_Referense`, `savetransaction`, `saving205` are called with Delphi's arguments; the mock only
  illustrates (status-2 row, reference OUT+yymmdd+counter).
- `DateToStr` uses the Windows short date format of the Delphi client; the web sends `dd.mm.yyyy` (Azerbaijani default).
- `TSearchEdit` (third-party, no source) on `banks` / `Account`: these datasets are opened only by the hidden ToolButton15; the web always
  looks them up. `banks` keeps its `city='BAKU'` line, so only Baku BICs are found (as the SQL says).
- editmt103.dfm binds `MF26T_edit` to `MF26T` and `DBEdit*_MF57` / `DBMemo*_MF57` to `MF57_ACCOUNT` / `MF57_NAME$LOCATION`, which are not
  persistent fields of `sw_out`; in Delphi that normally raises "Field not found" when the form opens. The web shows them but does not save them.
- TRichEdit line separators in `OF70_RichEdit.Text` (CR vs CRLF) – web sends CRLF.
- `Edit3_MF50` in MT103 is filled from MF36 (FormActivate), so a 50K message with empty MF36 fails the account check until the account is retyped – kept.

## 3. Outgoing files – Avtorizator (3a, done)
API `api/app/azips_files.py` (`POST /api/azips/create-files`), UI button "Authorize (create file)" on the OUT tab (Delphi ToolButton
`CreateFile`, caption 'Avtorizator'), tests `api/tests/test_azips_files.py`, golden files `api/tests/golden/azips/`, E2E
`e2e/azips_files_screens.py`, screenshots 110-111.

**How it is ported.** The two procedures are not re-typed. Their source is copied unchanged into `api/app/delphi_src/`
(`CreateFileClick.pas` = SWIFT_MAINImpl1.pas:3115-3203, `PACS0008Execute.pas` = :686-2071) and run by `api/app/pascal.py`, a small
interpreter for the Pascal subset these procedures use (begin/end, if, for, case, try, with, assignment, calls; Delphi `with`
scope rules). Runtime objects give the VCL/DOA behaviour: `TDataSet.FieldByName(..).AsString/AsFloat/AsDateTime/AsInteger`,
`TStringList.Text` (CR, LF or CRLF split; `Lines[i]` out of range → `List index out of bounds (i)`), `TBookmarkList` (sorted in
dataset order), `TOraclePackage.CallProcedure/CallIntegerFunction`, `AssignFile/Rewrite/Writeln/CloseFile`, `Copy` (index 0 → 1),
`FormatDateTime`, `StringReplace`/`ReplaceStr`, `FloatToStr`. An unsupported construct stops with an error, nothing is skipped.

| Delphi | Web |
|---|---|
| CreateFileClick :3117-3121 right by `SW_OUT3.mf32a_amount` of the current row: ≤10 000 `SW_OUT10`, ≤100 000 `SW_OUT100`, ≤1 500 000 `SW_OUT15`, ≤2 500 000 `SW_OUT25`, else `SW_OUT250` | same (SB_ACA.CheckAdvancedObjectAccess) |
| :3126-3132 `MT102data` / `mt102sum` opened with `:refer` (Unit2.dfm:6079, :6638 verbatim) – results unused | same |
| :3134 `sw_main.updout(id)` when the grid has rows; else `Heç bir format yoxdur!` | same |
| MT102/MT103/MT205: `Pluginloader('filereport.bpl','Azipsnew','-'+id)` then PACS0008; MT999/MT298: PACS0008 only | Azipsnew not ported yet (plan 2b) – the result says so; PACS0008 runs |
| PACS0008 :709-736 loop over `Gridout3.SelectedRows` (none selected → current row), MessageDlg per row with Yes-to-all | one browser confirm = Yes to all + Yes; the two Delphi dialog texts are returned in `confirms` |
| :738 `sw_out_fileafter(id, GRIDOUT2.MF32A_DATE)` = 6 → file; else `sw_out_CreateFile(GRIDOUT2.id, 'Təsdiq olunmamış əməliyyat var!', 0)` | same; the UI sends the current row of the Committed grid (first row if none clicked), as GRIDOUT2's cursor |
| :749-773 status 1 only; `path_out\pacs`+id left-padded with 0 to 5+`.xml` | file name the same; content returned for download; copy into `AZIPS_OUT_DIR` when set |
| MT298 (mf12 200 camt.056 / 800 pacs.028 / 202), MT205 (codex 99 / other, camt.050), MT999 (MONITORING text/days/pass), MT103 (pacs.008), MT102 (pacs.008 with `datatemps` rows) | run from the source |
| :2010 `Writeln(output, swmessage)` | text + CRLF, encoded `AZIPS_FILE_CODEPAGE` (default cp1254), unmappable → `?` |
| :2018-2019 `sw_out_CreateFile(id,'Fayl yaradılıb!',1)`; :2054 Edit2 total; :2069 `SBSession.Commit` | same (Edit2 text returned) |

`datatemps` (:1793, :1841) is built by concatenating `mf20_reference` as a quoted literal. The web sends the same statement with
each literal turned into a bind variable (`:b0`, `:b1`), so the result is the same and no value reaches the SQL text.

Delphi quirks kept (they come from the source): the UETR is the constant `4e7b08db-…`; `CreDtTm` of camt.056 ends `+04:00+`;
`<Nm>` of Dbtr is `mf50_bic`; MT102 `recinfo`/`recinfo2` are never cleared, so each later transaction repeats the earlier `<Ustrd>`
lines, and its `Mf70` is read from the selected row (`with v_dataset1`), not from `datatemps`; `<NbOfTxs>` is `L01` of the max-L01 row;
the XML says `encoding="UTF-8"` but Writeln writes ANSI, so Azerbaijani **Ə/ə** (not in cp1254) become `?`; on an exception
(e.g. a name/address memo with fewer lines than Delphi indexes) the file already created by `Rewrite` stays empty, earlier rows
keep their files, and there is no commit.

Not reachable in Delphi, therefore not ported: `CreateFaylExecute` (:2612, action not linked and never executed), `createfile2Execute`
(:4570, its only call in CreateFileClick is commented out) and `fayl102Execute` (:334, called only from createfile2),
`konvertExecute` (:5416 – action `konvert` has `OnExecute = Redakteet1Click`), `konvert2Execute` (:5954, never executed),
the commented copy to `\\192.168.1.187\c$\Swift\out` (:2040-2048).

### Unverified / to check on the real database (part 3)
- `sw_main.sw_out_fileafter`, `updout`, `sw_out_CreateFile` bodies are not in the repo (mock: fileafter = 6; CreateFile flag 1 moves the
  row to status 55 – illustrative only).
- ANSI code page of the Delphi client PCs (cp1254 assumed) and their decimal separator (`,` assumed; only reaches places without
  StringReplace – none in PACS0008 amounts).
- `DateTimeToStr`/`AsString` of date fields is not used in the file; `FormatDateTime(..., now)` uses the server clock (Delphi: client PC).
- Golden files: MT298/200 is compared with text typed by hand from the source; MT103, MT205 (codex 99), MT999 (text) and MT102 are
  committed files produced by the interpreter from the fixtures and spot-checked by hand. MT298 800/202, MT205 other, MT999 days/pass
  run but have no golden file yet.

## 3b. Incoming import – "Konvert" (done)
API `POST /api/azips/import` (`api/app/azips_import.py`), UI button **Konvert (import)** on the Incoming tab with **one file per
upload** (the bank uploads incoming files by hand), tests `api/tests/test_azips_import.py`, E2E `e2e/azips_import_screens.py`,
screenshots 112-113. Verbatim source run by `pascal.py`: `delphi_src/ToolButton4Click.pas` (:3786-3818), `KonvertexExecute.pas`
(:538-684), `konvert3Execute.pas` (:6480-6652), `cheskaccountExecute.pas` (:5284-5325).

- `ToolButton4Click`: mask from `settings.INN_FILETYPE` (0 → `*.SWF`, 1 → `*.fin`, case-insensitive like Windows); the uploaded
  file is the only FileListBox item when it matches, otherwise the list is empty and nothing is read. `sw_settings.INN_FILETYPE`
  0 → `Konvertex`, 1 → `konvert3`.
- **`KonvertexExecute` does nothing**: its whole body is inside `{ ... }` comments (checked with a Pascal comment-aware lexer;
  the interpreter parses it to an empty block). So `Konver102Execute` (:2112), called only from that commented body, is
  unreachable and not ported. With INN_FILETYPE = 0 the web, like Delphi, imports nothing.
- `konvert3Execute`: line parsing exactly as Delphi (`{1:` → `mt` from `INN_MT_READLINE`, bic `copy(7,8)+copy(16,3)`; `:20:`,
  `:32A:`, `:59:` + 4 following lines, `:50x:` + next line); `all` = `Memo3.Text`: the hidden Memo3 has **210** lines from the .dfm,
  `Lines[z] := s` beyond them is ignored (TMemoStrings.Put), line 0 stays empty, the `-}{5:` line is not stored, and the memo is
  never cleared. MT103 → `sw_main.insert_in` (15 args), other → `insert_in_other` (6 args); `SW_KONVERT` right first. Then
  `cheskaccount` → `check_account(id, ACOUNT)` for every status-2 MT103 row of `sw_in`, and **commit** (`SBSession.Commit`).
- `movefile(PATH\\f → PATH\\ddmmyy\\f)`: there is no folder for an uploaded file; the move is only reported in the response.
- On an exception Delphi shows the text and does not commit; the web rolls back the request.

Deliberate differences / unverified:
- **Timer**: ActiveFormCreate :2421-2431 enables Timer1 (clicks Konvert every `sw_settings.ConvInterval` ms) when ConvInterval > 0.
  User decision: incoming files are uploaded by hand, so **no scheduled folder poll** and no `AZIPS_IN_DIR`.
- Upload accepts one file at a time (user decision; Delphi processes every file in the folder in name order).
- `num`, `num2`, `m` in konvert3 are uninitialised integers in Delphi (garbage); the interpreter starts them at 0. Effect: before
  the `:59:`/`:50x:` line of the first file, line 1..4 temporarily fill describ2/tax/kod/kor/describ and are overwritten once the
  tags appear. A file without `:50x:` gets describ = line 1 here (Delphi: depends on the garbage value).
- `reset(fl, name)` (2 arguments, :6497) is treated as AssignFile + Reset. Memo3 WordWrap (default True, width 487) could split
  very long lines into several memo lines in Delphi; not emulated.
- `sw_main.insert_in`, `insert_in_other`, `check_account` bodies are not in the repo (mock: illustrative row with status 2).
- Mock `sw_settings` now has INN_FILETYPE = 1 and INN_MT_READLINE = 34 (position of the MT in `{1:F01<BIC12><10>}{2:O103`); check the
  real values.
- `ToolButton8Click` (:6179, "Çap et", Visible=False) is reached from the OUT grid popups `Capet1Click`/`N3Click`/`CapEt2Click`
  (:2953, :6748, :6790) – a QuickReport print; ported with the other prints in part 4.


## Unverified (part 1, needs the real database)
- `sw_main` package body is not in the repo: what `new_dat` does exactly (mock: moves status-96 incoming rows dated before the
  operating day into `SW_ARCHIVE`, only to illustrate).
- Column names of `sw_in`, `sw_out_new`, `SW_ARCHIVE`, `sw_out_sba` come from grid FieldNames; the mock tables are illustrative.
- The function columns come back from Oracle named like `SW_MAIN.FIND_USERNAME_OUT(S.ID)`; the web reads them by that name.

## Resume point
Next: 2b (`filereport.bpl`
Azipsnew = `Packages/Cards_New/FileReprt/Unitazips.pas`) and part 4.
