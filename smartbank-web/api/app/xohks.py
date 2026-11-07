"""XÖHKS - port of Delphi Packages/LVPCSSManager_Turan (TLVPCSSForm, CoClass LVPCSS). Step 1: the four tabs' lists and archives.

LVPCSSManager.dpr compiles LVPCSSImpl (main form, 4 tabs) and Data_Unit (TDataMod). SQL: xohks_sql.py (verbatim line lists).
The ':Title' variables are DOA otSubst (text substitution, unlike AZIPS where :title is a bind): only the order strings written
in the Delphi TitleClick handlers are ever substituted. The XS_INCOMINGSUM SQL[6] line and the XS_INCOMING Filter are built from
integers taken from the lookup datasets, as in BitBtn1Click; nothing free-form reaches the SQL text.

Dataset state (the variables Delphi sets with SetVariable and keeps on the data module) lives per user session in
ws.module_state['xohks'], so a sort or refresh re-uses the dates of the last SelectDate exactly like the Delphi form.
"""
from __future__ import annotations
import datetime

from fastapi import APIRouter, Depends
from pydantic import BaseModel

from . import xohks_sql as Q
from .customers import row
from .db.base import DBError
from .delphi import date_only, float_to_str, subst

CLSID = "{E0D210EC-D799-46D2-A172-789782B5F96C}"     # LVPCSSManager_TLB.pas:56 CLASS_LVPCSS

# Status constants Data_Unit.pas:276-287 (GridBatchsDrawColumnCell :1926 draws an image per status)
STATUS = {0: "msDefault", 1: "msCommit", 2: "msReject", 3: "msFileCreated", 4: "msVerifikator", 5: "msFVerifikator",
          6: "msAvtorizator", 7: "msReturnBack", 8: "msReturn"}

# Title.Caption -> SetVariable('Title', ...) of the TitleClick handlers; other captions -> exit (no change)
ORDER_BATCHS = {"№": "x.id,x.status", "F": "x.filial,x.status", "": "x.status",
                "Debet Məbləğ": "x.AMOUNT,x.status"}                         # GridBatchsTitleClick :2734-2787
ORDER_ARCH = dict(ORDER_BATCHS)                                              # DBGridOUTArchBatchsTitleClick :632-678
ORDER_INCOMING = {"№": " x.id,x.status", "": " x.status", "Debet Məbləğ": " x.AMOUNT,x.status",
                  "Тарих": " x.TRANS_DATE,x.status"}                         # GridIncomingTitleClick :4200-4250
# ('Тарих' is Cyrillic; the grid's date column caption is 'Tarix', so in Delphi that branch is never reached - kept.)


class XsError(Exception):
    def __init__(self, key, **extra):
        super().__init__(key)
        self.key, self.extra = key, extra


def _st(ws) -> dict:
    return ws.module_state.setdefault("xohks", {})


def _one(conn, lines, binds=None, **repl):
    r = conn.query(Q.text(lines, **repl), binds or {})
    return r[0] if r else {}


def _right(conn, name) -> bool:
    """try DataMod.SB_ACA.CallProcedure('CheckAdvancedObjectAccess',[name]) ... except ... end."""
    try:
        conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", [name], commit=False)
        return True
    except DBError:
        return False


def get_use_date(conn) -> datetime.date:
    """GetUseDate LVPCSSImpl.pas:934-940: XS_CONFIG.USEBANKDATE = 1 -> Trunc(SBOP.GET_DATE) else Trunc(Date)."""
    c = _one(conn, Q.LINES_XS_CONFIG)
    if int(c.get("USEBANKDATE") or 0) == 1:
        d = conn.call_func(Q.PKG_SBOP, "GET_DATE", [], datetime.datetime)
        return d.date() if isinstance(d, datetime.datetime) else d
    return datetime.date.today()


def _sums(conn) -> dict:
    """edit1..edit3 (:929-931, RefreshDataBatchs :1256-1258): 'Modifikasiya ='+floattostr(summodifikator.cem) ..."""
    m = _one(conn, Q.LINES_SUMMODIFIKATOR).get("CEM")
    v = _one(conn, Q.LINES_SUMVERIFIKATOR).get("CEM")
    a = _one(conn, Q.LINES_SUMAVTORIZATOR).get("CEM")
    return {"edit1": "Modifikasiya =" + float_to_str(float(m or 0)),
            "edit2": "Verifikasiya =" + float_to_str(float(v or 0)),
            "edit3": "Avtorizasiya =" + float_to_str(float(a or 0))}


# ------------------------------------------------------------------------------------------------ OUT tab
def _batchs(conn, s) -> dict:
    b = {"BeginDate": date_only(s["out_beg"]), "EndDate": date_only(s["out_end"])}
    rows = [row(x) for x in conn.query(subst(Q.text(Q.LINES_XS_BATCHS), "Title", s.get("out_title", Q.TITLE_BATCHS_DEFAULT)), b)]
    sm = _one(conn, Q.LINES_XS_BATCHSSUM, b).get("SUMAMOUNT")
    return {"batchs": rows, "batchs_sum": sm, "batchs_sum_text": "" if sm is None else float_to_str(float(sm)), **_sums(conn)}


def open_form(ws) -> dict:
    """ActiveFormCreate LVPCSSImpl.pas:792-932. Rights only decide PanelBeneficary (XOHKSBENIFICARY, :809-813); the other
    checks (VERIFIKATOR, FVERIFIKATOR, XOHKS_CREATEFILE, AVTORIZATOR, XOHKS_COMMIT) just set the dates again (their filters are
    commented out). Then StDate = EndDate = GetUseDate, selectdate, XS_BATCHS / XS_BatchsSum / XS_BENEFICIARY open,
    XS_IncomingView active (dfm Active = True, ordered by x.id), archive pickers = StDate."""
    conn = ws.conn
    benef = _right(conn, "XOHKSBENIFICARY")
    for r in ("VERIFIKATOR", "FVERIFIKATOR", "XOHKS_CREATEFILE", "AVTORIZATOR", "XOHKS_COMMIT"):
        _right(conn, r)
    d = get_use_date(conn)
    s = _st(ws)
    s.clear()
    s.update(out_beg=d, out_end=d, out_title=Q.TITLE_BATCHS_DEFAULT, in_title=Q.TITLE_DEFAULT, arch_title=Q.TITLE_DEFAULT,
             inarch_sum6="", inarch_filter="", benef=benef)
    return {"use_date": d.isoformat(), "beneficiary_visible": benef, **_batchs(conn, s), "incoming": incoming(ws)}


def refresh_out(ws, beg: datetime.date, end: datetime.date) -> dict:
    """Mt102RefreshExecute :2338 -> RefreshDataBatchs :1242-1259 (SelectDate :1849 sets BeginDate/EndDate from the pickers)."""
    s = _st(ws)
    if not s:
        open_form(ws)
    s.update(out_beg=beg, out_end=end)
    return _batchs(ws.conn, s)


def sort_out(ws, caption: str) -> dict:
    """GridBatchsTitleClick :2734: SetVariable('Title', ...), XS_BATCHS.Refresh (dates of the last SelectDate)."""
    s = _st(ws)
    if caption in ORDER_BATCHS:
        s["out_title"] = ORDER_BATCHS[caption]
    return _batchs(ws.conn, s)


def beneficiary(conn, batch_id: int, archive: bool = False) -> list[dict]:
    """XS_BENEFICIARY / XS_BeneficiaryArchive: Master = XS_BATCHS / XS_BatchsArchive, MasterFields = DetailFields = ID."""
    lines = Q.LINES_XS_BENEFICIARYARCHIVE if archive else Q.LINES_XS_BENEFICIARY
    return [row(x) for x in conn.query(Q.text(lines), {"id": batch_id})]


# ------------------------------------------------------------------------------------------------ IN tab
def incoming(ws, caption: str | None = None) -> list[dict]:
    """XS_IncomingView (select * from xs_incomingview x order by :title). MessagesInRefreshExecute :2577 only Refreshes it
    (the in_dir file list part is replaced by the manual one-file upload, step 4); GridIncomingTitleClick :4200 sets Title.
    StDate_in / EndDate_in are never used: Refresh_mess_in / SelectDateIncoming calls are commented out (:909, :2582, :4204)."""
    s = _st(ws)
    if caption is not None and caption in ORDER_INCOMING:
        s["in_title"] = ORDER_INCOMING[caption]
    return [row(x) for x in ws.conn.query(subst(Q.text(Q.LINES_XS_INCOMINGVIEW), "title", s.get("in_title", Q.TITLE_DEFAULT)))]


# ------------------------------------------------------------------------------------------------ OUT [Archive]
def out_archive(ws, beg: datetime.date | None = None, end: datetime.date | None = None, caption: str | None = None) -> dict:
    """OutArchRefreshClick :2911-2934 (Close, SetVariable dates, Open; same for XS_BatchsArchiveSum) and
    DBGridOUTArchBatchsTitleClick :632 (SetVariable Title + Refresh with the previous dates)."""
    s = _st(ws)
    if beg is not None:
        s.update(arch_beg=beg, arch_end=end)
    if caption is not None and caption in ORDER_ARCH:
        s["arch_title"] = ORDER_ARCH[caption]
    if "arch_beg" not in s:
        return {"batchs": [], "sum": None, "sum_text": ""}
    b = {"BeginDate": date_only(s["arch_beg"]), "EndDate": date_only(s["arch_end"])}
    rows = [row(x) for x in ws.conn.query(subst(Q.text(Q.LINES_XS_BATCHSARCHIVE), "Title", s.get("arch_title", Q.TITLE_DEFAULT)), b)]
    sm = _one(ws.conn, Q.LINES_XS_BATCHSARCHIVESUM, b).get("SUMAMOUNT")
    return {"batchs": rows, "sum": sm, "sum_text": "" if sm is None else float_to_str(float(sm))}


def archive_filial(conn, filial_id: int) -> str:
    """XS_BatchsArchiveAfterScroll Data_Unit.pas:353-360: DataSetFilial.SetVariable('FilialID', Filial).Refresh."""
    return _one(conn, Q.LINES_DATASETFILIAL, {"filialID": filial_id}).get("NAME") or ""


# ------------------------------------------------------------------------------------------------ IN [ARCHIVE]
def _filtered(rows, flt):
    """TDataSet.Filter on XS_INCOMING: 'filial=N', 'TYPECODE=N' or '(filial=N)and (TYPECODE=M)'; '' = all."""
    if not flt:
        return rows
    return [r for r in rows if all(r.get(k.lower()) is not None and int(r.get(k.lower())) == v for k, v in flt)]


def in_archive(ws, beg: datetime.date | None = None, end: datetime.date | None = None) -> dict:
    """ToolButton41Click :4289-4317 'Yenilə': XS_INCOMING Close, Filtered := false, Filter := '', CheckBox2/3 unchecked,
    dates, Open; XS_INCOMINGSUM the same - but its SQL[6] (set by BitBtn1Click) is NOT reset there, so a previous filter
    stays in the total while the grid shows everything (Delphi behaviour, kept)."""
    s = _st(ws)
    if beg is not None:
        s.update(inarch_beg=beg, inarch_end=end, inarch_filter=[])
    if "inarch_beg" not in s:
        return {"rows": [], "sum": None, "sum_text": "", "check2": False, "check3": False}
    b = {"BeginDate": date_only(s["inarch_beg"]), "EndDate": date_only(s["inarch_end"])}
    rows = [row(x) for x in ws.conn.query(Q.text(Q.LINES_XS_INCOMING), b)]
    sm = _one(ws.conn, Q.LINES_XS_INCOMINGSUM, b, i6=s.get("inarch_sum6", "")).get("SUMAMOUNT")
    return {"rows": _filtered(rows, s.get("inarch_filter")), "sum": sm, "sum_text": "" if sm is None else float_to_str(float(sm))}


def in_archive_lookups(conn) -> dict:
    """ToolButton18Click :4319-4329 'Filter': Panel38 visible, Data_Admin_in / Data_Code active (lookup lists)."""
    return {"filials": [row(x) for x in conn.query(Q.text(Q.LINES_DATA_ADMIN_IN))],
            "codes": [row(x) for x in conn.query(Q.text(Q.LINES_DATA_CODE))]}


def in_archive_filter(ws, check2: bool, filial: int | None, check3: bool, code: int | None) -> dict:
    """BitBtn1Click :4336-4430 'Təsdiq et'. a = CheckBox2 and DBLookupComboBox2.KeyValue <> -1, b = CheckBox3 and
    DBLookupComboBox3.KeyValue <> -1: a only -> Filter 'filial=N', SUM SQL[6] 'and filial=N'; b only -> TYPECODE; both ->
    both; neither -> Filter '' (Filtered := true), SQL[6] ''. XS_INCOMING is not reopened (Filter on the rows already
    fetched); XS_INCOMINGSUM is closed and opened with the old date variables."""
    s = _st(ws)
    lk = in_archive_lookups(ws.conn)
    if filial is not None and filial not in [int(r["filial_id"]) for r in lk["filials"]]:
        raise XsError("xohks.err_lookup")
    if code is not None and code not in [int(r["code"]) for r in lk["codes"]]:
        raise XsError("xohks.err_lookup")
    a = bool(check2 and filial is not None and filial != -1)
    bb = bool(check3 and code is not None and code != -1)
    if a and not bb:
        s["inarch_filter"] = [("FILIAL", int(filial))]
        s["inarch_sum6"] = "and filial=" + str(int(filial))
    if bb and not a:
        s["inarch_filter"] = [("TYPECODE", int(code))]
        s["inarch_sum6"] = "and TYPECODE=" + str(int(code))
    if a and bb:
        s["inarch_filter"] = [("FILIAL", int(filial)), ("TYPECODE", int(code))]
        s["inarch_sum6"] = " and (filial=" + str(int(filial)) + ")" + "and (TYPECODE=" + str(int(code)) + ")"
    if not a and not bb:
        s["inarch_filter"] = []
        s["inarch_sum6"] = ""
    return in_archive(ws)


# ------------------------------------------------------------------------------------------------ API
class DatesIn(BaseModel):
    beg: datetime.date
    end: datetime.date


class SortIn(BaseModel):
    caption: str


class BenefIn(BaseModel):
    id: int
    archive: bool = False
    filial: int | None = None


class FilterIn(BaseModel):
    check2: bool = False
    filial: int | None = None
    check3: bool = False
    code: int | None = None


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/xohks")
    g = require_module(CLSID)

    def guard(fn, *a, **k):
        try:
            return fn(*a, **k)
        except XsError as e:
            err(400, e.key, **e.extra)

    def _benef_guard(ws):
        if not _st(ws).get("benef", True):
            err(403, "error.access_denied")

    @r.post("/open")
    def _open(ws=Depends(g)):
        return open_form(ws)

    @r.post("/out/refresh")
    def _oref(b: DatesIn, ws=Depends(g)):
        return refresh_out(ws, b.beg, b.end)

    @r.post("/out/sort")
    def _osort(b: SortIn, ws=Depends(g)):
        if not _st(ws):
            open_form(ws)
        return sort_out(ws, b.caption)

    @r.post("/beneficiary")
    def _benef(b: BenefIn, ws=Depends(g)):
        if not b.archive:
            _benef_guard(ws)
        res = {"rows": beneficiary(ws.conn, b.id, b.archive)}
        if b.archive and b.filial is not None:
            res["filial_name"] = archive_filial(ws.conn, b.filial)
        return res

    @r.post("/in/list")
    def _in(b: SortIn | None = None, ws=Depends(g)):
        return {"rows": incoming(ws, b.caption if b else None)}

    @r.post("/out-archive")
    def _oarch(b: DatesIn, ws=Depends(g)):
        return out_archive(ws, b.beg, b.end)

    @r.post("/out-archive/sort")
    def _oasort(b: SortIn, ws=Depends(g)):
        return out_archive(ws, caption=b.caption)

    @r.post("/in-archive")
    def _iarch(b: DatesIn, ws=Depends(g)):
        return in_archive(ws, b.beg, b.end)

    @r.get("/in-archive/lookups")
    def _ilk(ws=Depends(g)):
        return in_archive_lookups(ws.conn)

    @r.post("/in-archive/filter")
    def _iflt(b: FilterIn, ws=Depends(g)):
        return guard(in_archive_filter, ws, b.check2, b.filial, b.check3, b.code)

    return r
