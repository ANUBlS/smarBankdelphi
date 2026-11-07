"""Cards ▸ Prosedur ▸ Balans (cards_azericard balans.pas TBalance, MAINFORMImpl1 N21Click :999, right card_balans) and
Prosedur ▸ Payment (payment.pas TPayments, N1Click :1015, right card_payment).

Balans: DBGrid1 = DataMod_CARDS.balans (Unit18.dfm:2202, verbatim cards_sql.LINES_BALANS). FormActivate: DateTimePicker1 := Date.
Button1Click 'Balans yığ' (right cardbalansopen): balans.Open. Button3Click 'Fayl yarat' (right cardbalanscreatefile): the routine runs
from its verbatim source (delphi_src/cards_balans.pas, lines 89-327) in pascal.py: Close / Open, b<BANKID>__N.<day of year of the
picked date> under C:\\AZCARD\\OUT\\<DDMMYY of the picked date>, 'BALANCE FILE CREATED'. Button4Click 'Excel-ə ixrac' (right
cardbalansexcel): ExportDataset(balans, 'payment', True). Button5Click 'Boşalt' (right cardbalansclose): balans.Close.
DBGrid1TitleClick: SQL.Add('ORDER BY '+FieldName); Refresh; SQL[pos] := '' (the next Open is unsorted again).
Button2 / CheckBox1 / Edit1 / Panel3 / Memo1 are Visible = False.

Payment: DBGrid1 = DataMod_CARDS.payment (Unit18.dfm:2110, verbatim LINES_PAYMENT; DAT1 / DAT2 otDate, VIDS otString).
FormCreate: DateTimePicker2 (Visible = False) := tarix.TEK_DAT (sysdat), DateTimePicker1 := the same. Button1Click 'Yenilə': Card_vidop.Open,
payment dat1 / dat2 / vids := Card_vidopVIDOP.AsVariant (the first card_vidops row; Null when empty), Open. Button3Click 'Fayl yarat'
-> Button5.Click (verbatim delphi_src/cards_payment.pas lines 203-445): P<BANKID>__N.<day of year> under ..\\OUT\\<DDMMYY of Date>,
per selected row card_main.delete_payment + insert_payment (no commit), payment.Refresh, 'PAYMENT FILE CREATED'. Button6Click is the
same routine on a hidden button nothing clicks (not ported). Button4Click 'Excel-ə ixrac': ExportDataset(payment, 'payment', True)
(no right check). PopupMenu1 SELECT ALL. Panel4 filters (Edit1-3, DBLookupComboBox1 / 2, CheckBox1 'Filter') only set
payment.Filter; payment.Filtered is never set to True (the lines are commented out), so they filter nothing. Edit1-3 OnExit clear the text.

Files: as cards_app_file (hard coded C:\\AZCARD\\OUT, Writeln CRLF, CARDS_FILE_CODEPAGE, CARDS_OUT_DIR copy, download)."""
from __future__ import annotations
import base64
import datetime as dt
import functools
import io
import os
import re

from fastapi import APIRouter, Depends, Response
from pydantic import BaseModel

from . import cards_app_file as AF
from . import cards_sql as Q
from . import pascal as P
from .azips_files import Grid, Module, Package
from .cards import CLSID
from .customers import row

SRC = {"balans": os.path.join(os.path.dirname(__file__), "delphi_src", "cards_balans.pas"),
       "payment": os.path.join(os.path.dirname(__file__), "delphi_src", "cards_payment.pas")}
BAL_COLS = ["FILIAL", "MULTI_ACC", "QALIQ", "CREDIT", "OSTAT"]                               # balans.dfm DBGrid1 Columns
PAY_COLS = ["ID", "CARDNUMBER", "MULTIACC", "RBSNUMBER_1", "FILIAL", "CURRENCY", "AMMOUNT", "TIP", "NAME", "DAT", "OPID",
            "COMMITEDOPID"]                                                                  # payment.dfm DBGrid1 Columns
BAL_FLOAT = ("ACCID", "QALIQ", "CREDIT", "OSTAT")                                           # balans persistent TFloatFields


@functools.lru_cache(None)
def _unit(k):
    txt = open(SRC[k], encoding="utf-8").read()
    m = re.match(r"\{ Verbatim copy of .*? lines (\d+)-(\d+) .*?\}\n", txt)
    return P.Unit(txt[m.end():], int(m.group(1)))


class DS(AF.DataSet):
    """TOracleDataSet; Open on an active dataset does nothing (TDataSet.Open = Active := True). Bookmarks are row positions
    (the payment UNION ALL can return one provarch ID twice: once as 'D', once as 'C')."""

    def __init__(self, rt, name, lines, rows=None, floats=()):
        super().__init__(rt, name, lines, rows)
        self.floats = floats

    def m_open(self):
        if self.rows is not None:
            return
        super().m_open()
        for i, r in enumerate(self.rows):
            for f in self.floats:
                if r.get(f) is not None:
                    r[f] = float(r[f])
            r["_BM"] = i

    def m_gotobookmark(self, bm):
        self.pos = next(i for i, r in enumerate(self.rows) if r.get("_BM") == bm)

    def current_id(self):
        return self.rows[self.pos].get("_BM") if self.pos < len(self.rows) else None


class Marks(P.PObj):
    def __init__(self, items):
        self.items = list(items)
    p_count = property(lambda s: len(s.items))
    p_items = property(lambda s: s)

    def index(self, i):
        return self.items[int(i)]


class Picker(P.PObj):
    def __init__(self, d):
        self.p_datetime = AF._serial(d)


class Button(P.PObj):
    def __init__(self, fn):
        self.fn = fn

    def m_click(self):
        self.fn()


def _builtins(rt, routines):
    b = rt.builtins(routines)
    dec = os.getenv("CARDS_DECIMAL_SEPARATOR", ",")

    def strtofloat(s):
        try:
            return float(str(s).strip().replace(dec, "."))
        except ValueError:
            raise P.PascalError(f"'{s}' is not a valid floating point value") from None

    def stringreplace(s, a, c, fl):
        fl = [str(x).lower() for x in (fl if isinstance(fl, (list, tuple, set)) else [fl])]
        flags = re.I if "rfignorecase" in fl else 0
        return re.sub(re.escape(a), lambda m: c, str(s), count=0 if "rfreplaceall" in fl else 1, flags=flags)
    b.update({"strtofloat": strtofloat, "stringreplace": stringreplace, "pos": lambda a, s: str(s).find(str(a)) + 1,
              "abs": abs, "trunc": lambda v: int(v), "decimalseparator": dec,
              "rfreplaceall": "rfreplaceall", "rfignorecase": "rfignorecase",
              "getfileattributes": lambda n: 16, "getcurrentdir": lambda: "C:\\", "pchar": lambda s: s, "file_attribute_directory": 16})
    return b


def _files(rt):
    out = []
    for path, f in rt.files.items():
        data = "".join(x + "\r\n" for x in f.lines).encode(AF.CODEPAGE, errors="replace")
        lp = AF._local(path)
        if lp:
            os.makedirs(os.path.dirname(lp), exist_ok=True)
            with open(lp, "wb") as fh:
                fh.write(data)
        out.append({"name": path.rsplit("\\", 1)[-1], "delphi_path": path, "size": len(data), "b64": base64.b64encode(data).decode()})
    return out


def _run(rt, unit, entry, names, dm, form, extra=None):
    u = _unit(unit)
    routines: dict = {}
    b = _builtins(rt, routines)
    b.update({"datamod_cards": dm})
    b.update(extra or {})
    for n in names:
        routines[n] = P.Routine(u, n, form, b)
        routines[n].factories = {"textfile": AF.TextFile}
    b.update(routines)
    error = None
    try:
        r = P.Routine(u, entry, form, b)
        r.factories = {"textfile": AF.TextFile}
        r.invoke([None])
    except P.PascalUnsupported:
        raise
    except Exception as e:      # noqa: BLE001 - Delphi shows the exception; what was written / called stays, no commit
        error = str(e)
    return error


def _st(ws, k) -> dict:
    return ws.module_state.setdefault("cards_" + k, {})


def _sorted_lines(lines, sort):
    return list(lines) + ["ORDER BY " + sort] if sort else list(lines)


def _excel(rows, sheet) -> bytes:
    from openpyxl import Workbook
    wb = Workbook()
    sh = wb.active
    sh.title = sheet
    cols = [k for k in (rows[0].keys() if rows else []) if k not in ("ROWID", "_BM")]
    sh.append(cols)
    for r in rows:
        sh.append([r.get(c) for c in cols])
    bio = io.BytesIO()
    wb.save(bio)
    return bio.getvalue()


def _check(ws, right):
    ws.conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", [right], commit=False)


# ------------------------------------------------------------------------------------------------ Balans
def _bal_rows(ws, sort=None):
    rows = [dict(r) for r in ws.conn.query(Q.text(_sorted_lines(Q.LINES_BALANS, sort)), {})]
    for r in rows:
        for f in BAL_FLOAT:
            if r.get(f) is not None:
                r[f] = float(r[f])
    return rows


def _bal_view(s):
    return {"date": s["date"].isoformat(), "cols": BAL_COLS, "active": s["rows"] is not None,
            "rows": [row(r) for r in (s["rows"] or [])]}


def bal_open_form(ws) -> dict:
    _check(ws, "card_balans")                                                     # MAINFORMImpl1 N21Click :999
    s = _st(ws, "bal")
    s.clear()
    s.update(date=dt.date.today(), rows=None)                                     # FormActivate: DateTimePicker1 := Date
    return _bal_view(s)


def _bal(ws):
    s = _st(ws, "bal")
    if "date" not in s:
        raise LookupError("balans")
    return s


def bal_collect(ws) -> dict:
    s = _bal(ws)
    _check(ws, "cardbalansopen")                                                  # Button1Click
    if s["rows"] is None:                                                         # Open on an active dataset: no-op
        s["rows"] = _bal_rows(ws)
    return _bal_view(s)


def bal_close(ws) -> dict:
    s = _bal(ws)
    _check(ws, "cardbalansclose")                                                 # Button5Click
    s["rows"] = None
    return _bal_view(s)


def bal_sort(ws, field: str) -> dict:
    s = _bal(ws)
    if not s["rows"] or field not in BAL_COLS:                                    # IsEmpty or no FieldName: Exit
        return _bal_view(s)
    s["rows"] = _bal_rows(ws, field)
    return _bal_view(s)


def bal_excel(ws) -> bytes:
    s = _bal(ws)
    _check(ws, "cardbalansexcel")
    return _excel(s["rows"] or [], "payment")


def bal_create_file(ws, d: dt.date, now=None) -> dict:
    s = _bal(ws)
    s["date"] = d
    rt = AF.Runtime(ws.conn, now)
    st = [dict(x) for x in ws.conn.query(Q.text(Q.LINES_SETTINGS))]
    bal = DS(rt, "balans", Q.LINES_BALANS, None, BAL_FLOAT)
    if s["rows"] is not None:
        bal.rows = [dict(r, _BM=i) for i, r in enumerate(s["rows"])]
    dm = Module({"balans": bal, "settings": DS(rt, "settings", Q.LINES_SETTINGS, st), "sb_aca": Package(rt, "SB_ACA")})
    form = Module({"datetimepicker1": Picker(dt.datetime.combine(d, dt.time())), "filelistbox1": P.Sink("FileListBox1")})
    err = _run(rt, "balans", "tbalance.button3click",
               ("when2str", "whenday2", "whenday", "viewbalancesign", "insertzero", "directoryexists"), dm, form)
    if bal.rows is not None:                                                      # ODS.Close; ODS.Open: the grid shows the new rows
        s["rows"] = [{k: v for k, v in r.items() if k != "_BM"} for r in bal.rows]
    out = _bal_view(s)
    out.update(files=_files(rt), messages=rt.messages, error=err, server_dir=AF.OUT_DIR or None)
    return out


# ------------------------------------------------------------------------------------------------ Payment
def _pay(ws):
    s = _st(ws, "pay")
    if "dat1" not in s:
        raise LookupError("payment")
    return s


def _pay_query(ws, s, sort=None):
    rows = [dict(r) for r in ws.conn.query(Q.text(_sorted_lines(Q.LINES_PAYMENT, sort)),
                                           {"dat1": s["dat1"], "dat2": s["dat2"], "vids": s["vids"]})]
    for i, r in enumerate(rows):
        r["_BM"] = i
    return rows


def _pay_view(s):
    return {"dat1": s["dat1"].isoformat(), "cols": PAY_COLS, "active": s["rows"] is not None,
            "rows": [dict(row({k: v for k, v in r.items() if k != "_BM"}), _bm=r["_BM"]) for r in (s["rows"] or [])],
            "filials": s["filials"]}


def pay_open_form(ws) -> dict:
    _check(ws, "card_payment")                                                    # MAINFORMImpl1 N1Click :1015
    s = _st(ws, "pay")
    s.clear()
    t = ws.conn.query(Q.text(Q.LINES_TARIX), {})                                  # FormCreate :72
    tek = t[0].get("TEK_DAT") if t else None
    tek = tek.date() if isinstance(tek, dt.datetime) else (dt.date.fromisoformat(str(tek)[:10]) if tek else dt.date(1899, 12, 30))
    fil = [r.get("NAME") for r in ws.conn.query(Q.text(Q.LINES_FILIAL), {})]      # DBLookupComboBox1 (filialsource)
    s.update(dat1=tek, dat2=tek, vids=None, rows=None, filials=fil)
    return _pay_view(s)


def pay_refresh(ws, d1: dt.date) -> dict:
    s = _pay(ws)                                                                  # Button1Click :82
    v = ws.conn.query(Q.text(Q.LINES_CARD_VIDOP), {})
    s["vids"] = (v[0].get("VIDOP") if v else None)
    s["dat1"] = d1
    s["rows"] = _pay_query(ws, s)
    return _pay_view(s)


def pay_sort(ws, field: str) -> dict:
    s = _pay(ws)
    f = {c.upper(): c for c in PAY_COLS}.get(field.upper())
    if not s["rows"] or not f:
        return _pay_view(s)
    s["rows"] = _pay_query(ws, s, f)                                              # Refresh with ORDER BY (dataset order changes)
    return _pay_view(s)


def pay_excel(ws) -> bytes:
    s = _pay(ws)
    return _excel(s["rows"] or [], "payment")


def pay_create_file(ws, selected: list[int], now=None) -> dict:
    s = _pay(ws)
    rt = AF.Runtime(ws.conn, now)
    st = [dict(x) for x in ws.conn.query(Q.text(Q.LINES_SETTINGS))]
    pay = DS(rt, "payment", Q.LINES_PAYMENT, None if s["rows"] is None else [dict(r) for r in s["rows"]])
    pay.binds = {"dat1": s["dat1"], "dat2": s["dat2"], "vids": s["vids"]}
    order = [r["_BM"] for r in (s["rows"] or [])]
    grid = Grid(pay, [])
    grid.p_selectedrows = Marks(sorted(set(selected) & set(order), key=order.index))   # TBookmarkList (dataset order)
    dm = Module({"payment": pay, "settings": DS(rt, "settings", Q.LINES_SETTINGS, st), "mainpacket": Package(rt, "card_main"),
                 "sb_aca": Package(rt, "SB_ACA")})
    form = Module({"dbgrid1": grid, "filelistbox1": P.Sink("FileListBox1")})
    u = _unit("payment")
    holder = {}
    form.items["button5"] = Button(lambda: holder["b5"].invoke([None]))
    routines: dict = {}
    b = _builtins(rt, routines)
    b["datamod_cards"] = dm
    for n in ("whenday", "when2str"):
        routines[n] = P.Routine(u, n, form, b)
    b.update(routines)
    holder["b5"] = P.Routine(u, "tpayments.button5click", form, b)
    holder["b5"].factories = {"textfile": AF.TextFile}
    err = None
    try:
        P.Routine(u, "tpayments.button3click", form, b).invoke([None])
    except P.PascalUnsupported:
        raise
    except Exception as e:      # noqa: BLE001
        err = str(e)
    if "payment" in rt.refreshed:                                                 # payment.Refresh: same SQL (sort line emptied)
        s["rows"] = _pay_query(ws, s)
    out = _pay_view(s)
    out.update(files=_files(rt), messages=rt.messages, error=err, calls=rt.calls, server_dir=AF.OUT_DIR or None)
    return out


# ------------------------------------------------------------------------------------------------ router
class DateIn(BaseModel):
    date: dt.date


class SortIn(BaseModel):
    field: str


class SelIn(BaseModel):
    selected: list[int] = []


XLSX = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/cards")
    g = require_module(CLSID)

    def _fe(fn, *a):
        try:
            return fn(*a)
        except LookupError:
            err(409, "error.bad_request")
        except ValueError:
            err(400, "error.bad_request")

    def xl(data):
        return Response(data, media_type=XLSX, headers={"Content-Disposition": 'attachment; filename="payment.xlsx"'})

    r.post("/balance/open")(lambda ws=Depends(g): bal_open_form(ws))
    r.post("/balance/collect")(lambda ws=Depends(g): _fe(bal_collect, ws))
    r.post("/balance/close")(lambda ws=Depends(g): _fe(bal_close, ws))
    @r.post("/balance/sort")
    def _bs(b: SortIn, ws=Depends(g)):
        return _fe(bal_sort, ws, b.field)

    @r.post("/balance/file")
    def _bf(b: DateIn, ws=Depends(g)):
        return _fe(bal_create_file, ws, b.date)

    @r.post("/balance/excel")
    def _bx(ws=Depends(g)):
        return xl(_fe(bal_excel, ws))

    r.post("/payment/open")(lambda ws=Depends(g): pay_open_form(ws))

    @r.post("/payment/refresh")
    def _pr(b: DateIn, ws=Depends(g)):
        return _fe(pay_refresh, ws, b.date)

    @r.post("/payment/sort")
    def _ps(b: SortIn, ws=Depends(g)):
        return _fe(pay_sort, ws, b.field)

    @r.post("/payment/file")
    def _pf(b: SelIn, ws=Depends(g)):
        return _fe(pay_create_file, ws, b.selected)

    @r.post("/payment/excel")
    def _px(ws=Depends(g)):
        return xl(_fe(pay_excel, ws))

    return r
