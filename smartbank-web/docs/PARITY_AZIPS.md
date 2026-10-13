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
1. **Lists, totals, archives** (this commit) – see §1.
2. Outgoing message editor / creation: `OUT_MT` (Yeni), `Edit_outExecute`, `editmt103`, `Editmt103Show`, `formmt103`, `createmess`.
3. Conversion / export files: `PACS0008Execute` (:686-2110), `KonvertexExecute`, `Konver102Execute`, `fayl102Execute`,
   `CreateFaylExecute`, `createfile2Execute`, `konvertExecute`/`konvert2Execute`/`konvert3Execute`, `ToolButton8Click` (print/list),
   with golden-file tests generated from the Delphi format code (byte-identical, encoding and CRLF as Delphi writes them).
4. Remaining actions: commit/verify/modify/authorise (`comitClick`, `commitingExecute`, `ToolButton11/13Click`, `CreateFileClick`),
   back/delete (`geriExecute`, `out_deleteExecute`, `DeleteExecute`, `Geriqaytar1Click`), incoming postings (`AddTrans*`,
   `AddINTransNew`, `addtrans2`), checks (`cheskaccount`, Checkacc, acc_check, Tranzit_account), settings (Unit3, Azipsn,
   AzipsSett, MTsett, insett), prints (cap, qrp1, qr5, qrp5), UFX credit (UFX71, `ufxcredit`).

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

## Unverified (needs the real database)
- `sw_main` package body is not in the repo: what `new_dat` does exactly (mock: moves status-96 incoming rows dated before the
  operating day into `SW_ARCHIVE`, only to illustrate).
- Column names of `sw_in`, `sw_out_new`, `SW_ARCHIVE`, `sw_out_sba` come from grid FieldNames; the mock tables are illustrative.
- The function columns come back from Oracle named like `SW_MAIN.FIND_USERNAME_OUT(S.ID)`; the web reads them by that name.
