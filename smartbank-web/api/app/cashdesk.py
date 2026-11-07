"""Cash desk - port of Delphi Packages/CashDeskLast (TFrmCashDesk, CashDesk.dpr). Production copy confirmed by the user
(Oct 20, 2026); CashDeskLast01112012 / CashDeskLast10122012 / CashDeskLast_20072017 are older copies and are not ported.

Units: CashDeskImpl.pas (main ActiveForm), CashDataModule.pas/.dfm (datasets; verbatim SQL in cd_sql.py), UntFrmInfo.pas
('Əlavə' – order extra information, SB_CASHREPORT add/update/delete_CashInfo), UntCashSettings.pas ('Sazlama' –
update_cashsettings), ..\\payment_rep\\PhotoImpl.pas (settings photo, DBImage on cash_settings.PHOTO).

Not ported - QuickReport prints, on hold by the user (the buttons stay and show the "on hold" notice):
  TBPreview / TBCommon 'Hes. adlarla...' (MainCashReport / CashRpt, ODSCashReport), ToolButton13 + popup 'Kassa kitabı'
  (QRp_CashBook, ODS_L_CHIN, ODS_EVV_SON_QALIQ), TBIncome 'Məd. Jurn' / TBOutlay 'Məx. Jurn' (IOCome / LOICome, ODSIOCome),
  TBOrders 'Order' (QuickRptOrder / QRPTReceiptOrder, ODSRates, ODSValuteName, GetBankInfo, GetCustomerInfo, CheckOICome),
  TBCheck 'Qəbz' (QRptCheks, ForFizFsVoen), ToolButton9 'Yekun' -> 'Analiz 1' (QRTotalReport) / 'Analiz 2' (QRResultReport,
  TotalResult). Their SQL is kept verbatim in cd_sql.py for the later print phase.

Runtime rules reproduced (CashDeskImpl.pas line cited at each place):
  * the grid (DBGrid1 / DataSrcViewer2 = ODSTransactionsViewer2) is a ref cursor of the standalone procedure
    get_cash_transactions; it is empty until 'Yeniləmək' (the load in ActiveFormCreate is commented out :983-1081);
  * TBRefreshClick :1094-1199 ClearVariables + SetVariable rules; the combo OnClick handlers (CBDebetFilialClick
    :1463-1476 -> ActionFilterExecute :1881-2007) only filter the hidden CashViewer dataset and ODS_L_CHIN (print), so
    changing a combo has no visible effect until the next refresh - kept;
  * DBGrid1TitleClick :361-377: SetVariable('p_orderby', FieldName) + Refresh with the variables of the last refresh;
  * SpeedButton1Click :1223-1251 ChooseCashSymbol, SpeedButton2Click :2216-2236 UpdatePackNo, TransCommitClick
    :1208-1221 SB_Transaction.transaction_commit + SBSession.Commit, SpeedButton3Click :2308-2373 Excel export
    (OracleDataSet1 = get_cash_transactions_excel, all fields).
SB_CASHREPORT procedures commit inside the package (Script/sb_cashreport.sql), Delphi does not commit after them, so the
calls here run with commit=False.
"""
from __future__ import annotations
import base64
import datetime
import io
import re

from fastapi import APIRouter, Depends, Response
from pydantic import BaseModel, Field

from . import cd_sql as Q
from .customers import row
from .db import DBError
from .delphi import date_only

CLSID = "{1B013526-9143-4310-A75E-F5F484E50A31}"     # CashDesk_TLB.pas:56 CLASS_FrmCashDesk
PKG = "SB_CASHREPORT"                                 # CashDataModule.dfm:131-133 OPCash.PackageName
ALL_CUR, ALL_BR, ALL_SYM, ALL_OPS = "Bütün valyutalar", "Bütün filiallar", "Bütün", "Butun operatorlar"   # :911, :614, :636, ODSOperator
# DBGrid1 columns (CashDeskImpl.dfm:216-350): FieldName as in the dfm = the text DBGrid1TitleClick passes as p_orderby
GRID_COLS = ["rown", "ID", "DAT", "DEBITACC", "DEBITCURNAME", "CREDITACC", "CREDITCURNAME", "AMMOUNT", "AMMOUNT_C", "LAMMOUNT",
             "KASSA_B", "USERINSERT", "USERCOMMIT", "debtostat", "kredostat"]
# TFrmInfo.ActionInsert/Update/Delete -> OPCash procedures (UntFrmInfo.pas)
INFO_PROC = {"insert": "add_CashInfo", "update": "update_CashInfo", "delete": "delete_CashInfo"}
# UntCashSettings.pas CommitButtonClick: the 19 positional arguments of update_cashsettings, in call order
SETTINGS_ARGS = ["natbalance", "forbalance", "description_az", "description_eng", "signatyre", "responsible_person", "handover",
                 "chief", "p_operator", "cashier", "amount", "chief_", "accountant", "operator_", "cashier_", "controller",
                 "controller_", "operator_title", "accountant_title"]
# DOA default ApplyRecord of the Settings dataset (UpdatingTable derived from 'FROM cash_settings a'); PhotoImpl.pas
# SpeedButton1Click / SpeedButton2Click: Settings.Edit (Insert when empty - TDataSet.Edit) ... Post, CommitOnPost.
SQL_PHOTO_UPDATE = "update cash_settings set PHOTO = :PHOTO where rowid = :ROWID_"
SQL_PHOTO_INSERT = "insert into cash_settings (PHOTO) values (:PHOTO)"


class Filt(BaseModel):
    """The filter controls read by TBRefreshClick / SpeedButton3Click."""
    beg: datetime.date                                   # DTPBegin
    end: datetime.date                                   # DTPEnd
    currency: int = Field(0, ge=0)                       # CmbBoxCurrency.ItemIndex (0 = 'Bütün valyutalar', n = Rate[n-1])
    cash_symbol: str = Field(ALL_SYM, max_length=40)     # CBCashSymbol.Text
    operator: str = Field(ALL_OPS, max_length=60)        # DBLookupOperator.Text
    committer: str = Field(ALL_OPS, max_length=60)       # DBLookupCommitter.Text
    debit_branch: int = Field(0, ge=0)                   # CBDebetFilial.ItemIndex (n -> DebetFilialArray[n-1])
    credit_branch: int = Field(0, ge=0)                  # CBCreditFilial.ItemIndex
    transtype: int = Field(1, ge=1, le=2)                # RadioButton1 'Təsdiq olunmuş' -> 1, RadioButton2 'Planlaşdırılmış' -> 2
    balance: int = Field(0, ge=0, le=3)                  # CmbBoxReference.ItemIndex -> p_balance 1..4
    orderby: str | None = None                           # p_orderby (DBGrid1TitleClick); None after ClearVariables


class SymbolIn(BaseModel):
    id: int = 0                                          # ODSTransactionsViewer2.ID (AsInteger: 0 on an empty grid)
    symbol: str = Field("", max_length=40)               # BSymbol.Text


class PackIn(BaseModel):
    id: int = 0
    packno: str = Field("", max_length=4000)             # EPackNo.Text
    transtype: int = Field(1, ge=1, le=2)                # RadioButton1.Checked at the click (not at the last refresh)


class CommitIn(BaseModel):
    id: int
    d1: str | None = None                                # ODSTransactionsViewer2 'd1' of the current row


class InfoIn(BaseModel):
    action: str
    person_doc: str = Field("", max_length=4000)         # EPersonDoc
    issuedby: str = Field("", max_length=4000)           # EIssuedBy
    seria: str = Field("", max_length=4000)              # ESeria
    docnumber: str = Field("", max_length=4000)          # EDocNumber
    fromwhen: str = Field("", max_length=4000)           # EFromWhen


class SettingsIn(BaseModel):
    natbalance: str = Field("", max_length=4000)
    forbalance: str = Field("", max_length=4000)
    description_az: str = Field("", max_length=4000)
    description_eng: str = Field("", max_length=4000)
    signatyre: str = Field("", max_length=4000)
    responsible_person: str = Field("", max_length=4000)
    handover: str = Field("", max_length=10)
    chief: str = Field("", max_length=10)
    p_operator: str = Field("", max_length=10)
    cashier: str = Field("", max_length=10)
    amount: str = Field("", max_length=10)
    chief_: str = Field("", max_length=10)
    accountant: str = Field("", max_length=10)
    operator_: str = Field("", max_length=10)
    cashier_: str = Field("", max_length=10)
    controller: str = Field("", max_length=10)
    controller_: str = Field("", max_length=10)
    operator_title: str = Field("", max_length=4000)
    accountant_title: str = Field("", max_length=4000)


class PhotoIn(BaseModel):
    name: str = Field("", max_length=260)                # OpenPictureDialog1.FileName ('' = dialog cancelled)
    data: str = Field("", max_length=14_000_000)         # base64 file content


def _s(v):
    """TEdit.Text of an empty field -> DOA passes '' which Oracle stores as NULL."""
    return None if v == "" else v


def lists(c) -> dict:
    """ActiveFormCreate :927-1085 (FillCurrency :903, FillFilial :606, FillCashSymbol :631, ODSCashB :969)."""
    cur = c.query(Q.SQL_CD_ODSCURRENCY)
    fil = c.query(Q.SQL_CD_FILIALS)
    return {"rate": [int(x["VALUTE"]) for x in cur], "currencies": cur, "filials": fil,
            "cash_symbols": [x["SYMBOL"] for x in c.query(Q.SQL_CD_CASHSYMBOLS)],
            "operators": c.query(Q.SQL_CD_ODSOPERATOR), "committers": c.query(Q.SQL_CD_ORDS_COMITTERS)}


def binds(f: Filt, L: dict, orderby: bool = True) -> dict:
    """TBRefreshClick :1128-1175 / SpeedButton3Click :2316-2363: ClearVariables, then only the variables whose control is
    not on its 'all' entry are set (the others stay NULL)."""
    b = {k: None for k in ("p_currencyid", "p_userinsert", "p_cashsymbol", "p_creditbranch", "p_usercommit",
                           "p_debitbranch", "p_orderby")}
    b["p_begindate"] = date_only(f.beg)                                  # Integer(Trunc(DTPBegin.DateTime)) -> otDate
    b["p_enddate"] = date_only(f.end)
    if f.currency != 0:
        b["p_currencyid"] = int(str(L["rate"][f.currency - 1]))          # IntToStr(Rate[..]) -> otInteger
    if f.cash_symbol != ALL_SYM:
        b["p_cashsymbol"] = f.cash_symbol
    if f.operator != ALL_OPS:
        b["p_userinsert"] = f.operator
    if f.committer != ALL_OPS:
        b["p_usercommit"] = f.committer
    if f.credit_branch != 0:
        b["p_creditbranch"] = str(L["filials"][f.credit_branch - 1]["ID"])
    if f.debit_branch != 0:
        b["p_debitbranch"] = str(L["filials"][f.debit_branch - 1]["ID"])
    b["p_transtype"] = 1 if f.transtype == 1 else 2
    b["p_balance"] = f.balance + 1                                      # case CmbBoxReference.ItemIndex of 0..3 -> 1..4
    if orderby and f.orderby is not None:
        b["p_orderby"] = f.orderby
    return b


def check(f: Filt, L: dict, err):
    if f.currency > len(L["rate"]) or f.debit_branch > len(L["filials"]) or f.credit_branch > len(L["filials"]):
        err(400, "error.generic")
    if f.orderby is not None and f.orderby not in GRID_COLS:            # only DBGrid1 column FieldNames can be clicked
        err(400, "error.generic")


def transactions(c, f: Filt, L: dict) -> list[dict]:
    """ODSTransactionsViewer2 (CashDataModule.dfm:1562) - ref cursor p_result."""
    return c.cursor_block(Q.SQL_CD_ODSTRANSACTIONSVIEWER2, "p_result", binds(f, L))


def excel(c, f: Filt, L: dict) -> bytes:
    """SpeedButton3Click :2308-2373: OracleDataSet1 (get_cash_transactions_excel, p_orderby never set) ->
    CMExcelExport1.ExportDataset(OracleDataSet1, 'Cashdesk', True); VisibleFieldsOnly = False -> every cursor column."""
    from openpyxl import Workbook
    from openpyxl.styles import Font
    rows = c.cursor_block(Q.SQL_CD_ORACLEDATASET1, "p_result", binds(f, L, orderby=False))
    wb = Workbook()
    ws = wb.active
    ws.title = "Cashdesk"
    cols = list(rows[0].keys()) if rows else []
    ws.append(cols)
    for cell in ws[1]:
        cell.font = Font(bold=True)
    for r in rows:
        ws.append([v.replace(tzinfo=None) if isinstance(v, datetime.datetime) else v for v in r.values()])
    bio = io.BytesIO()
    wb.save(bio)
    return bio.getvalue()


def settings_row(c) -> dict | None:
    rs = c.query(Q.SQL_CD_SETTINGS)
    if not rs:
        return None
    r = rs[0]
    out = {k.lower(): v for k, v in r.items() if k not in ("PHOTO", "ROWID")}
    out["has_photo"] = r.get("PHOTO") is not None
    for k in ("cashbalancenational", "cashbalanceenglish"):
        out[k] = row({"X": out.get(k)})["x"]
    return out


def flags(s: dict | None) -> dict:
    """TFormCashSettings.FormCreate (UntCashSettings.pas): every check box True (its OnClick writes '1' into the hidden
    edit), then False ('0') when trim(field) = '0'. Runs once, when the form is created in ActiveFormCreate."""
    names = {"handover": "handover", "chief": "chief", "p_operator": "operator", "cashier": "cashier", "amount": "amount",
             "chief_": "chief_out", "accountant": "accountant", "operator_": "operator_out", "cashier_": "cashier_out",
             "controller": "controller", "controller_": "controller_out"}
    return {k: "0" if (s and str(s.get(f) or "").strip() == "0") else "1" for k, f in names.items()}


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/cashdesk")
    g = require_module(CLSID)

    def L(c):
        return lists(c)

    @r.get("/init")
    def _init(ws=Depends(g)):
        c = ws.conn
        lst = L(c)
        c.query(Q.SQL_CD_ODSVALUTE)                                     # :950 ODSValute.Open (lookup only)
        day = c.call_func(PKG, "GetPresentDate", [], datetime.datetime)  # :963-964 GetCurrentDate
        day = day.date() if isinstance(day, datetime.datetime) else day
        s = settings_row(c)                                             # FormCashSettings.Create -> Settings.Active
        return {"date": day.isoformat(),
                "currencies": [{"index": 0, "name": ALL_CUR}] + [{"index": i + 1, "valute": x["VALUTE"], "name": x["VALU_NAME"]}
                                                                 for i, x in enumerate(lst["currencies"])],
                "filials": [{"index": 0, "name": ALL_BR}] + [{"index": i + 1, "id": x["ID"], "name": x["NAME"]}
                                                             for i, x in enumerate(lst["filials"])],
                "cash_symbols": [ALL_SYM] + [str(x) for x in lst["cash_symbols"]],
                "bsymbols": [str(x["SYMBOL"]) for x in c.query(Q.SQL_CD_ODSCASHB)],
                "operators": [row(x) for x in lst["operators"]], "committers": [row(x) for x in lst["committers"]],
                "all_ops": ALL_OPS, "all_sym": ALL_SYM, "grid_cols": GRID_COLS,
                "settings": s, "flags": flags(s)}

    @r.post("/refresh")
    def _refresh(f: Filt, ws=Depends(g)):
        c = ws.conn
        lst = L(c)
        check(f, lst, err)
        return {"rows": [row(x) for x in transactions(c, f, lst)]}

    @r.post("/excel")
    def _excel(f: Filt, ws=Depends(g)):
        c = ws.conn
        lst = L(c)
        check(f, lst, err)
        return Response(excel(c, f, lst), media_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                        headers={"Content-Disposition": 'attachment; filename="Cashdesk.xlsx"'})

    @r.post("/symbol")
    def _symbol(b: SymbolIn, ws=Depends(g)):
        """SpeedButton1Click :1223-1251. FModified = BSymbol.Text <> ''; any exception -> 'Wrong Arguments !' + Abort."""
        if b.symbol == "":
            return {"changed": False}
        try:
            ws.conn.call_proc(PKG, "ChooseCashSymbol", [b.id, b.symbol], commit=False)
        except DBError as e:
            err(400, "cashdesk.wrong_args", ora=e.message)
        return {"changed": True}

    @r.post("/packno")
    def _packno(b: PackIn, ws=Depends(g)):
        """SpeedButton2Click :2216-2236. The package builds 'Update '||TableName||' set no_prov ='''||PackNo||''' ...' and
        runs it with EXECUTE IMMEDIATE (Script/sb_cashreport.sql UpdatePackNo), so a quote in the text is refused here
        (in Delphi it ends the literal: ORA error or injected SQL)."""
        if "'" in b.packno:
            err(400, "cashdesk.err_packno_quote")
        table = " Provarch " if b.transtype == 1 else " lazytransaction "
        ws.conn.call_proc(PKG, "UpdatePackNo", [b.id, b.packno, table], commit=False)
        return {"ok": True}

    @r.post("/commit")
    def _commit(b: CommitIn, ws=Depends(g)):
        """TransCommitClick :1208-1221: only when D1 is NULL, else 'Bu əməliyyat yoxlanılmayıb!!!'."""
        if b.d1 is not None:
            err(400, "cashdesk.not_checked")
        c = ws.conn
        c.plsql("begin :r := SB_Transaction.transaction_commit(:TransactionID, true); end;", {"TransactionID": b.id}, int)
        c.commit()                                                      # sboapiDataModule.SBSession.Commit
        return {"ok": True}

    # ---------------------------------------------------------------- TFrmInfo ('Əlavə')
    @r.get("/cashinfo/{tid}")
    def _info(tid: int, ws=Depends(g)):
        """TBExtraClick :1423-1432 (ODSCashInfo.Refresh; detail of ODSTransactionsViewer2 on ID) + TFrmInfo.FormCreate
        (BrowseCashInfo = pkg_report.get_cashinfo) / FormActivate (edits from ODSCashInfo)."""
        c = ws.conn
        ci = c.query(Q.SQL_CD_ODSCASHINFO, {"ID": tid})
        browse = c.cursor_block(Q.SQL_CD_BROWSECASHINFO, "p_result", {})
        return {"info": row(ci[0]) if ci else None, "browse": [row(x) for x in browse]}

    @r.post("/cashinfo/{tid}")
    def _info_save(tid: int, b: InfoIn, ws=Depends(g)):
        """ActionInsertExecute / ActionUpdateExecute / ActionDeleteExecute; ActionInsertUpdate enables Insert only when
        ODSCashInfo is empty, ActionUpdateUpdate enables Update / Delete only when it is not."""
        if b.action not in INFO_PROC:
            err(400, "error.generic")
        c = ws.conn
        empty = not c.query(Q.SQL_CD_ODSCASHINFO, {"ID": tid})
        if (b.action == "insert") != empty:
            err(400, "error.generic")
        if b.action == "delete":
            c.call_proc(PKG, INFO_PROC["delete"], [tid], commit=False)
        else:
            c.call_proc(PKG, INFO_PROC[b.action], [tid, _s(b.person_doc), _s(b.issuedby), _s(b.seria), _s(b.docnumber),
                                                   _s(b.fromwhen)], commit=False)
        return {"ok": True}

    # ---------------------------------------------------------------- TFormCashSettings ('Sazlama') + TFormPhoto
    @r.get("/settings")
    def _settings(ws=Depends(g)):
        return {"settings": settings_row(ws.conn)}

    @r.post("/settings")
    def _settings_save(b: SettingsIn, ws=Depends(g)):
        """CommitButtonClick: OPCash.CallProcedure('update_cashsettings', [19 edit texts]); Settings.Refresh; Close."""
        c = ws.conn
        d = b.model_dump()
        c.call_proc(PKG, "update_cashsettings", [_s(d[k]) for k in SETTINGS_ARGS], commit=False)
        return {"settings": settings_row(c)}

    @r.get("/settings/photo")
    def _photo(ws=Depends(g)):
        rs = ws.conn.query(Q.SQL_CD_SETTINGS)
        data = rs[0].get("PHOTO") if rs else None
        if data is None:
            err(404, "error.generic")
        if hasattr(data, "read"):
            data = data.read()
        return Response(bytes(data), media_type="image/bmp")

    def _post_photo(c, value):
        rs = c.query(Q.SQL_CD_SETTINGS)
        if rs:
            c.execute(SQL_PHOTO_UPDATE, {"PHOTO": value, "ROWID_": rs[0]["ROWID"]})
        else:
            c.execute(SQL_PHOTO_INSERT, {"PHOTO": value})
        c.commit()                                                      # CommitOnPost

    @r.post("/settings/photo")
    def _photo_load(b: PhotoIn, ws=Depends(g)):
        """PhotoImpl.pas SpeedButton1Click 'Qəbul': Photo.LoadFromFile when the dialog was executed, then Settings.Edit,
        DBImage1.Picture.Assign(Photo), Post. TDBImage.UpdateData stores the picture only when it is a TBitmap and clears
        the field otherwise - a cancelled dialog assigns an empty picture and so clears PHOTO. TPicture.LoadFromFile knows
        .bmp (and .ico/.emf/.wmf) by extension; other extensions raise EInvalidGraphic before the Edit."""
        c = ws.conn
        value = None
        if b.name:
            ext = (re.search(r"(\.[^.\\/]*)$", b.name) or [""])[0].lower()
            if ext not in (".bmp", ".ico", ".emf", ".wmf"):
                err(400, "cashdesk.err_picture_ext", ext=ext)
            raw = base64.b64decode(b.data or "", validate=False)
            if ext == ".bmp":
                if raw[:2] != b"BM":
                    err(400, "cashdesk.err_bitmap")
                value = raw
        _post_photo(c, value)
        return {"settings": settings_row(c)}

    @r.post("/settings/photo/clear")
    def _photo_clear(ws=Depends(g)):
        """PhotoImpl.pas SpeedButton2Click 'Sil': Settings.Edit; FieldByName('PHOTO').Clear; Post."""
        _post_photo(ws.conn, None)
        return {"settings": settings_row(ws.conn)}

    return r
