"""AZIPS - port of Delphi Packages/SWIFT_MANAGER_IBAN_NEW (TSWIFT_MAIN, CLSID below). Part 1: lists, totals, archives.

SWIFT_MANAGER.dpr compiles SWIFT_MAINImpl1 (main form), Unit2 (SWDataModule), Unit19 (inarchiv = incoming archive),
archivout (archive_out = outgoing archive) and the editor/creation/conversion units ported in later parts.
SQL: azips_sql.py (verbatim line lists). Where Delphi edits SQL[i] by index the same lines are replaced here; every
user value that Delphi concatenates into those lines (message type combo, sort column) is checked against the fixed
Delphi list first and then bound or written as the same literal - nothing free-form reaches the SQL text.
"""
from __future__ import annotations
import base64
import datetime
import re
from typing import Literal

from fastapi import APIRouter, Depends
from pydantic import BaseModel, Field

from . import azips_edit, azips_new
from . import azips_files
from . import azips_import
from . import azips_actions as A
from . import azips_in as I
from . import azips_sett as S
from . import ufx
from . import azips_sql as Q
from .customers import row
from .delphi import date_only

CLSID = "{1D16D2DC-0511-4CC1-AE9A-6C95D648C2C2}"     # SWIFT_MANAGER_TLB.pas:56 CLASS_SWIFT_MAIN

# Grid columns with a FieldName (SWIFT_MAINImpl1.dfm GridIN / DBGrid1) - the only values accepted for 'order by'.
IN_FIELDS = ("ID", "DAT", "REFERANCE", "ACOUNT", "BNK_VOIN", "VALU", "BIC", "VALUTE", "MT", "USERH", "INFO")
IN2_FIELDS = ("ID", "DAT", "REFERANCE", "ACOUNT", "VALU", "BIC", "VALUTE", "MT", "USERH", "INFO")
ARX_IN_FIELDS = ("ID", "MT", "REFERANCE", "ACOUNT", "VALU", "BIC", "VALUTE", "INFO", "DAT")            # Unit19.dfm Gridin
ARX_OUT_FIELDS = ("ID", "MF20_REFERENCE", "MF50_ACCOUNT", "RECEIVERBIC", "MF32A_AMOUNT", "MF32A_CURR", "INFO",
                  "MF32A_DATE", "CREAT", "MODSI", "VERI", "AVTO", "EDITOR", "DELETER", "CDAT", "FDAT")  # archivout.dfm Gridin
ARX_IN_TYPES = ("MT103", "MT102", "MT205", "MT950", "MT900", "MT910", "MT298")      # Unit19.dfm:37-45 ComboBox1 (item 0 = all)
ARX_OUT_TYPES = ("MT103", "MT102", "MT205", "MT999", "MT941", "MT942", "MT298")     # archivout.dfm:48-56


class AzError(Exception):
    def __init__(self, key, **extra):
        super().__init__(key)
        self.key, self.extra = key, extra


# ------------------------------------------------------------------------------------------------ branch rule
def user_filial(conn) -> int:
    """userfil (Unit2.dfm:6410-6413) FieldByName('filialid').AsInteger (NULL / no row -> 0)."""
    r = conn.query(Q.text(Q.LINES_USERFIL))
    return int((r[0].get("FILIALID") if r else 0) or 0)


def branch_restricted(conn, check_sw_in_fil: bool = True) -> bool:
    """ActiveFormCreate SWIFT_MAINImpl1.pas:2436-2508 / Unit19.pas:92-112: filialid<>0 -> SQL[10] := branch line;
    otherwise SB_ACA.checkadvancedobjectaccess_func('SW_IN_FIL') = 1 -> all branches, else the branch line.
    archivout.pas:137-143 (outgoing archive) only looks at filialid (check_sw_in_fil=False)."""
    if user_filial(conn) != 0:
        return True
    if not check_sw_in_fil:
        return False
    return int(conn.call_func("SB_ACA", "checkadvancedobjectaccess_func", ["SW_IN_FIL"], int) or 0) != 1


def _b(restricted: bool) -> dict:
    return {"i10": Q.BRANCH_LINE} if restricted else {}


# ------------------------------------------------------------------------------------------------ main form
def in_order(prev_line: str, field: str) -> str:
    """GridINTitleClick SWIFT_MAINImpl1.pas:4264-4290 + ExtractDesc :4251-4262: 'desc' in SQL[46] -> asc, else desc."""
    if field.upper() not in IN_FIELDS:
        raise AzError("azips.err_sort")
    return "order by " + field.upper() + (" asc" if "desc" in prev_line else " desc")


def in2_order(field: str) -> str:
    """DBGrid1TitleClick SWIFT_MAINImpl1.pas:2583-2602: sql[46] := 'order by '+TitleName."""
    if field.upper() not in IN2_FIELDS:
        raise AzError("azips.err_sort")
    return "order by " + field.upper()


def lists(conn, in_order_line: str = "", in2_order_line: str = "") -> dict:
    """RefreshButtonClick :2935-2948 -> sw_main.new_dat, Refresh.Execute (:3608-3615 sw_out, sw_out_2, sw_out3) and the
    two totals; the incoming grids sw_in / sw_in2 are opened by ActiveFormCreate with the same branch rule."""
    conn.call_proc(Q.PKG_MAIN, "new_dat", [])                              # :2940 (no right check here, unlike ArchiveClick)
    b = _b(branch_restricted(conn))
    q = lambda lines, **r: [row(x) for x in conn.query(Q.text(lines, **{**b, **r}))]   # noqa: E731
    in_r = {"i46": in_order_line} if in_order_line else {}
    in2_r = {"i46": in2_order_line} if in2_order_line else {}
    s1 = conn.query(Q.text(Q.LINES_SWMAMMOUNT))
    s5 = conn.query(Q.text(Q.LINES_SW_AMOUNT))
    return {
        "sw_in": q(Q.LINES_SW_IN, **in_r), "sw_in2": q(Q.LINES_SW_IN2, **in2_r),
        "sw_out3": q(Q.LINES_SW_OUT3), "sw_out": q(Q.LINES_SW_OUT), "sw_out_2": q(Q.LINES_SW_OUT_2),
        # :2943/2945 'Bu gün göndəriləcək ümumi məbləğ = '+floattostr(summ)+' AZN' (status 1 / status 5)
        "sum_send": float((s1[0].get("SUMM") if s1 else 0) or 0),
        "sum_verify": float((s5[0].get("SUMM") if s5 else 0) or 0),
    }


def float_to_str(v: float) -> str:
    """Delphi FloatToStr (15 significant digits, no thousands separator, '.' decimal as set by the host)."""
    s = "%.15g" % v
    if "e" in s:
        m, e = s.split("e")
        s = m + "E" + ("-" if e[0] == "-" else "") + e[1:].lstrip("0")
    return s


def archive_now(conn) -> str:
    """ArchiveClick SWIFT_MAINImpl1.pas:3899-3904: SW_ARCHIVE right, sw_main.new_dat, 'Məlumatlar arxivə göndərildi!'."""
    conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["SW_ARCHIVE"], commit=False)
    conn.call_proc(Q.PKG_MAIN, "new_dat", [])
    return "Məlumatlar arxivə göndərildi!"


# ------------------------------------------------------------------------------------------------ archives
def archive_in(conn, dat1: datetime.date, dat2: datetime.date, mt_index: int | None = None, title: str | None = None):
    """Tinarchiv (Unit19.pas). Button2Click :76-113 / FormActivate :141-200: :dat1/:dat2 = trunc(dates), :title = 'id'
    or the clicked column (GridinTitleClick :252-271, a bind -> Oracle orders by a constant, kept); ComboBox1Change :121-139
    sql[6] := 'and mt<>'' ''' (item 0) or 'and mt='''+Text+''''. Branch rule as the main form (SW_IN_FIL)."""
    r = _b(branch_restricted(conn))
    if mt_index is not None:
        if mt_index == 0:
            r["i6"] = "and mt<>" + "' '"
        elif 1 <= mt_index <= len(ARX_IN_TYPES):
            r["i6"] = "and mt=" + "'" + ARX_IN_TYPES[mt_index - 1] + "'"
        else:
            raise AzError("azips.err_type")
    t = (title or "id")
    if t.upper() not in ARX_IN_FIELDS:
        raise AzError("azips.err_sort")
    return [row(x) for x in conn.query(Q.text(Q.LINES_ARXIVIN, **r), {"dat1": date_only(dat1), "dat2": date_only(dat2), "title": t})]


def operators(conn) -> list[dict]:
    """Operators (Unit2.dfm:6258-6264) - first row -1 'Butun operatorlar'."""
    return [row(x) for x in conn.query(Q.text(Q.LINES_OPERATORS))]


def archive_out(conn, dat1: datetime.date, dat2: datetime.date, oper: int | None = None, mt_index: int | None = None,
                title: str | None = None):
    """Tarchive_out (archivout.pas). Button2Click :104-150: SQL[5] := ' and fcreate_opid=:oper' unless 'Butun operatorlar';
    branch line only when filialid<>0; ComboBox1Change :152-166 sql[6] := 'and messagetype<>'' ''' / '='''+Text+''''."""
    r = _b(branch_restricted(conn, check_sw_in_fil=False))
    binds = {"dat1": date_only(dat1), "dat2": date_only(dat2)}
    if oper is not None and oper != -1:
        r["i5"] = " and fcreate_opid=:oper"
        binds["oper"] = int(oper)
    if mt_index is not None:
        if mt_index == 0:
            r["i6"] = "and messagetype<>" + "' '"
        elif 1 <= mt_index <= len(ARX_OUT_TYPES):
            r["i6"] = "and messagetype=" + "'" + ARX_OUT_TYPES[mt_index - 1] + "'"
        else:
            raise AzError("azips.err_type")
    t = (title or "id")
    if t.upper() not in ARX_OUT_FIELDS:
        raise AzError("azips.err_sort")
    binds["title"] = t
    return [row(x) for x in conn.query(Q.text(Q.LINES_OUT_ARCHIVE, **r), binds)]


# ------------------------------------------------------------------------------------------------ router
class ListIn(BaseModel):
    in_order: str = Field(default="", max_length=60)        # current SQL[46] of sw_in (client keeps it like the dataset)
    in_sort: str | None = Field(default=None, max_length=30)
    in2_sort: str | None = Field(default=None, max_length=30)


class ImportIn(BaseModel):
    name: str = Field(min_length=1, max_length=255)
    b64: str = Field(max_length=14_000_000)       # one file per request (~10 MB)


class FilesIn(BaseModel):
    selected: list[int] = Field(default_factory=list, max_length=500)   # Gridout3.SelectedRows (in click order)
    current: int | None = None                                           # Gridout3 current row (SW_OUT3)
    out2_current: int | None = None                                      # GRIDOUT2 current row (used by sw_out_fileafter :744)


class ArxIn(BaseModel):
    dat1: datetime.date
    dat2: datetime.date
    mt_index: int | None = None
    title: str | None = Field(default=None, max_length=30)
    oper: int | None = None


class Form12In(BaseModel):
    amount: str = Field(default="", max_length=40)
    curr: str = Field(default="", max_length=10)
    close: bool = False


class ActionIn(BaseModel):
    kind: Literal["out_delete", "out_back", "out_commit", "in_delete", "sending_back", "transend", "modifikator"]
    selected: list[int] = Field(default_factory=list, max_length=1000)
    current: int | None = None
    answers: list[Literal["yes", "no", "cancel", "all", "all_no"]] = Field(default_factory=list, max_length=1000)
    form12: list[Form12In] = Field(default_factory=list, max_length=1000)


class InCommitIn(BaseModel):
    current: int
    selected: list[int] = Field(default_factory=list, max_length=1000)


class AnswerIn(BaseModel):
    answer: Literal["yes", "cancel"]


class CheckAccIn(BaseModel):
    id: int
    acc: str = Field(default="", max_length=64)


class RedakteIn(BaseModel):
    id: int
    acount: str = Field(default="", max_length=64)
    voin2: str = Field(default="", max_length=64)


class SettLookupIn(BaseModel):
    kind: Literal["mb_comm", "main", "alter", "banks"]
    fil: int | None = None
    val: int | None = None
    val_text: str = Field(default="", max_length=10)
    bal: str = Field(default="", max_length=20)


class SettSaveIn(BaseModel):
    tab: Literal["mt103", "mt205", "bproc", "names"]
    values: dict[str, str | int | float | None] = Field(default_factory=dict, max_length=20)


class SettDelIn(BaseModel):
    tab: Literal["mt103", "mt205", "bproc", "names"]
    id: int


class PrintIn(BaseModel):
    id: int
    field: Literal["ALL_TEXT2", "ALL_TEXT"]


class TranzitIn(BaseModel):
    main_acc: str = Field(default="", max_length=64)
    tranzit_acc: str = Field(default="", max_length=64)


class RowidIn(BaseModel):
    rowid: str = Field(min_length=1, max_length=64)


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/azips")
    g = require_module(CLSID)

    def guard(fn, *a, **k):
        try:
            return fn(*a, **k)
        except (AzError, azips_edit.AzEditError) as e:
            err(400, e.key, **e.extra)

    @r.post("/list")
    def _list(b: ListIn, ws=Depends(g)):
        m = re.fullmatch(r"order by (\w+) (asc|desc)", b.in_order or "")
        o1 = b.in_order if m and m.group(1) in IN_FIELDS else ""      # only a line this module produced is accepted back
        if b.in_sort:
            o1 = guard(in_order, o1, b.in_sort)
        o2 = guard(in2_order, b.in2_sort) if b.in2_sort else ""
        res = lists(ws.conn, o1, o2)
        return {**res, "in_order": o1, "sum_send_text": float_to_str(res["sum_send"]),
                "sum_verify_text": float_to_str(res["sum_verify"])}

    @r.post("/archive-now")
    def _arch(ws=Depends(g)):
        return {"message": archive_now(ws.conn)}

    @r.post("/archive-in")
    def _ain(b: ArxIn, ws=Depends(g)):
        return {"rows": guard(archive_in, ws.conn, b.dat1, b.dat2, b.mt_index, b.title), "types": ARX_IN_TYPES}

    @r.get("/operators")
    def _ops(ws=Depends(g)):
        return operators(ws.conn)

    @r.post("/archive-out")
    def _aout(b: ArxIn, ws=Depends(g)):
        return {"rows": guard(archive_out, ws.conn, b.dat1, b.dat2, b.oper, b.mt_index, b.title), "types": ARX_OUT_TYPES}

    @r.post("/create-files")
    def _files(b: FilesIn, ws=Depends(g)):
        """'Avtorizator' ToolButton (CreateFile) -> CreateFileClick :3115 -> PACS0008Execute :686 (part 3)."""
        bl = _b(branch_restricted(ws.conn))
        o3 = ws.conn.query(Q.text(Q.LINES_SW_OUT3, **bl))
        o2 = ws.conn.query(Q.text(Q.LINES_SW_OUT_2, **bl))
        ids = {x.get("ID") for x in o3}
        sel = [i for i in dict.fromkeys(b.selected) if i in ids]
        cur = b.current if b.current in ids else (sel[-1] if sel else None)
        if cur is None:
            err(400, "azips.pick_row")
        return azips_files.create_files(ws.conn, o3, o2, sel, cur, b.out2_current)

    @r.post("/import")
    def _import(b: ImportIn, ws=Depends(g)):
        """'Konvert' ToolButton4 -> ToolButton4Click :3786 -> KonvertexExecute :538 / konvert3Execute :6480 (part 3b).
        One uploaded file = the FileListBox content."""
        import base64, binascii
        name = b.name.replace("\\", "/").rsplit("/", 1)[-1]
        if not name or name in (".", "..") or any(c in name for c in "\x00:*?\"<>|"):
            err(400, "azips.bad_file")
        try:
            data = base64.b64decode(b.b64, validate=True)
        except (binascii.Error, ValueError):
            err(400, "azips.bad_file")
        lines = list(Q.LINES_SW_IN)
        if branch_restricted(ws.conn):
            lines[10] = Q.BRANCH_LINE
        return azips_import.import_file(ws.conn, name, data, lines)

    @r.post("/action")
    def _action(b: ActionIn, ws=Depends(g)):
        """Part 4a row actions (azips_actions.py): out_delete, out_back, out_commit, in_delete, sending_back, transend."""
        c, rs = ws.conn, branch_restricted(ws.conn)
        if b.kind == "out_delete":
            return A.out_delete(c, rs, b.selected, b.current, b.answers)
        if b.kind == "out_back":
            return A.out_back(c, rs, b.selected, b.current, b.answers)
        if b.kind == "out_commit":
            return A.out_commit(c, rs, b.selected, b.current, b.answers, [f.model_dump() for f in b.form12])
        if b.kind == "in_delete":
            lines = list(Q.LINES_SW_IN)
            if rs:
                lines[10] = Q.BRANCH_LINE
            return A.in_delete(c, lines, b.selected, b.current, b.answers)
        if b.kind == "sending_back":
            return A.sending_back(c, rs, b.current)
        if b.kind == "modifikator":
            try:
                return A.modifikator(c, rs, b.selected, b.current, b.answers)
            except A.ProwError:
                err(400, "azips.prow_bad")
        return A.transend(c, rs, b.current)

    @r.get("/commit-currencies")
    def _ccur(ws=Depends(g)):
        return A.commit_currencies(ws.conn)

    # part 4b-2: incoming postings (comitClick -> AddINTransNewExecute, UFX), Checkacc, Tranzit_account (azips_in.py)
    def _in_lines(c):
        lines = list(Q.LINES_SW_IN)
        if branch_restricted(c):
            lines[10] = Q.BRANCH_LINE
        return lines

    def _pending(ws):
        if not hasattr(ws, "azips_in_pending"):
            ws.azips_in_pending = {}
        return ws.azips_in_pending

    def _run_in(fn, *a):
        try:
            return fn(*a)
        except (I.DelphiConvertError, ufx.UfxError) as e:
            err(400, "azips.runtime", ora=str(e))

    @r.post("/in-commit")
    def _incommit(b: InCommitIn, ws=Depends(g)):
        return _run_in(I.comit_start, ws.conn, _in_lines(ws.conn), b.current, b.selected, _pending(ws))

    @r.post("/in-commit/answer")
    def _incommit2(b: AnswerIn, ws=Depends(g)):
        return _run_in(I.comit_answer, ws.conn, b.answer, _pending(ws), ufx.client())

    @r.post("/in-checkacc")
    def _checkacc(b: CheckAccIn, ws=Depends(g)):
        res = I.checkinacc(ws.conn, _in_lines(ws.conn), b.id, b.acc)
        if res is None:
            err(400, "azips.pick_row")
        return res

    @r.post("/in-redakte")
    def _inred(b: RedakteIn, ws=Depends(g)):
        res = I.in_redakte(ws.conn, _in_lines(ws.conn), b.id, b.acount, b.voin2)
        if res is None:
            err(400, "azips.pick_row")
        return res

    # part 4c: settings forms (azips_sett.py) - form 'in' = insett.pas, 'out' = MTsett.pas
    @r.get("/settings/{form}")
    def _sett(form: Literal["in", "out"], ws=Depends(g)):
        d = S.open_form(ws.conn, form)
        d["grids"] = {k: [row(x) for x in v] for k, v in d["grids"].items()}
        for k in ("filial", "avalute", "bproc"):
            d[k] = [row(x) for x in d[k]]
        return d

    @r.post("/settings/{form}/lookup")
    def _sett_lk(form: Literal["in", "out"], b: SettLookupIn, ws=Depends(g)):
        c = ws.conn
        if b.kind == "mb_comm":
            return {k: [row(x) for x in v] for k, v in S.mb_comm(c, b.fil, b.val, b.val_text).items()}
        if b.kind == "banks":
            return [row(x) for x in S.all_banks(c, b.val_text)]
        return _run_in(lambda: [row(x) for x in S.bal_accounts(c, b.kind, b.val, b.bal)])

    @r.post("/settings/{form}/save")
    def _sett_save(form: Literal["in", "out"], b: SettSaveIn, ws=Depends(g)):
        res = S.save(ws.conn, form, b.tab, b.values)
        if res is None:
            err(400, "azips.pick_row")
        return res

    @r.post("/settings/{form}/delete")
    def _sett_del(form: Literal["in", "out"], b: SettDelIn, ws=Depends(g)):
        res = S.delete(ws.conn, form, b.tab, b.id)
        if res is None:
            err(400, "azips.pick_row")
        return res

    @r.post("/in-print")
    def _inprint(b: PrintIn, ws=Depends(g)):
        """printClick :3984 / GridINDblClick (ALL_TEXT2), ToolButton17Click 'XML CAP' (ALL_TEXT)."""
        res = I.in_print(ws.conn, _in_lines(ws.conn), b.id, b.field)
        if res is None:
            err(400, "azips.pick_row")
        res["pdf_b64"] = base64.b64encode(I.text_pdf(res["text"])).decode()
        return res

    @r.get("/tranzit")
    def _tr(ws=Depends(g)):
        return [{**row(x), "rowid": str(x.get("ROWID"))} for x in I.tranzit_list(ws.conn)]

    @r.post("/tranzit")
    def _tradd(b: TranzitIn, ws=Depends(g)):
        return I.tranzit_add(ws.conn, b.main_acc, b.tranzit_acc)

    @r.post("/tranzit/delete")
    def _trdel(b: RowidIn, ws=Depends(g)):
        return {"done": I.tranzit_delete(ws.conn, b.rowid)}

    azips_edit.add_routes(r, g, guard)      # part 2: editor / creation
    azips_new.add_routes(r, g, err)         # part 2b: filereport.bpl 'Azipsnew' (Unitazips.pas)
    return r
