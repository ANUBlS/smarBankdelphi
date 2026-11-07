"""Cards ▸ Əməliyyat ▸ C File (cards_azericard MAINFORMImpl1 MenuItem1Click :1061, right card_cfile -> Tcfile cfilepas.pas).

Toolbar: ToolButton3 'Yenilə' :82 (reads the C* files of C:\\AZCARD\\IN into CTInboxRich; 'Refresh with Select' (RefwithSel) sums per
card), isertbtn 'Bazaya Göndər' :390 (card_main.delete_trancaction_c, then one card_messages_c row per message line: Append / Post with
CommitOnPost, card_main.carxiv(file)), ToolButton1 'Təsdiq Et' :550 (card_main.transaction_c per selected message, Yes / No / Cancel /
YesToAll), ToolButton7 'Excel' :649 (ExportDataset(messages, 'CFILES')), ToolButton2 'XML Göndər' :643 (TAdditional_cfile, cfile_addi.pas).
DBGrid1 = messages (status 1, 3), DBGrid2 = messages2 (status 2); status icons :698; PopupMenu1 selectall1 :736 on DBGrid1. The
DBGrid1/2TitleClick handlers (:656 / :677) never run: both grids' Options (cfilepas.dfm:156 / :986) have no dgTitleClick. The
'Refresh with Select' SpeedButton is Visible = False, so ToolButton3Click always takes the RefwithSel.Down = False branch.
ToolButton3Click and isertbtnClick (with CheckFileExt) run verbatim (delphi_src/cards_cfilepas.pas) in pascal.py; the file is the one
uploaded by hand (cards_files)."""
from __future__ import annotations

import base64

from fastapi import APIRouter, Depends
from fastapi.responses import Response
from pydantic import BaseModel, Field

from . import cards_files as CF
from . import cards_sql as Q
from .cards import CLSID
from .customers import row

SRC = "cards_cfilepas.pas"
KEY = "cfile"
DS = {"messages": Q.LINES_MESSAGES, "messages2": Q.LINES_MESSAGES2}
MSG_DONE = "Əməliyyatlar günün sənədlərinə göndərildi!"
MSG_ASK = "Əmaliyyat təsdiq edilsin? №"                 # Format(.., [TransactionID]) without %d: the id is not shown
MSG_ALL = "%d  sayda əməliyyat təsdiq edildi?"
SQL_UMUMI = "select card_messages_c.rowid,card_messages_c.* from card_messages_c\r\n"      # :410
SQL_UMUMI1 = "select * from card_messages_c where file_name = :b0\r\n"                     # :419 (literal sent as a bind)
CF.EXTRA_SELECTS += [SQL_UMUMI, SQL_UMUMI1]
CF.DML_TABLES.add("card_messages_c")


def _st(ws) -> dict:
    s = ws.module_state.get("cards_cfile")
    if s is None:
        raise LookupError("cfile")
    return s


def _q(ws, lines, sort=None):
    L = list(lines) + (["ORDER BY " + sort] if sort else [])
    return [dict(r) for r in ws.conn.query(Q.text(L), {})]


def _open(ws, name):
    _st(ws)["rows"][name] = _q(ws, DS[name])


def _view(ws) -> dict:
    s = _st(ws)
    f = CF.uploaded(ws, KEY)
    return {"grid1": [row(r) for r in s["rows"]["messages"]], "grid2": [row(r) for r in s["rows"]["messages2"]],
            "rich": CF.lines_view(s["rich"], s["spans"]), "file": None if not f else {"name": f["name"], "size": len(f["data"])}}


def open_form(ws) -> dict:
    ws.conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["card_cfile"], commit=False)     # MenuItem1Click :1063
    ws.module_state["cards_cfile"] = {"rows": {}, "rich": [], "spans": []}
    for n in DS:
        _open(ws, n)
    return _view(ws)


def _form(ws, rt, refwithsel=False):
    s = _st(ws)
    dm = {"umumi": CF.DataSet(rt, "UMUMI", Q.LINES_UMUMI), "umumi1": CF.DataSet(rt, "UMUMI1", Q.LINES_UMUMI1),
          "messages": CF.DataSet(rt, "messages", DS["messages"]), "messages2": CF.DataSet(rt, "messages2", DS["messages2"]),
          "mainpacket": CF.Package(rt, "card_main"), "sb_aca": CF.Package(rt, "SB_ACA")}
    from .azips_files import Module
    rich = CF.RichEdit(list(s["rich"]), list(s["spans"]))
    form = Module({"ctinboxrich": rich, "filelistbox1": CF.FileListBox(rt.in_files), "refwithsel": CF.Down(refwithsel),
                   "animate1": CF.P.Sink("Animate1")})
    return Module(dm), form, rich


def _run(ws, method: str, answers=None, refwithsel=False) -> dict:
    f = CF.uploaded(ws, KEY)
    files = {f["name"]: f["data"]} if f else {}
    u = CF.unit(SRC)
    for probe in (True, False):
        rt = CF.Runtime(ws.conn, files, answers, probe=probe)
        dm, form, rich = _form(ws, rt, refwithsel)
        b = rt.builtins({})
        b["datamod_cards"] = dm
        error = None
        try:
            CF.run_routine(u, method, form, b, ("checkfileext",))
        except CF.NeedAnswer as q:
            return {"ask": q.msg, "buttons": q.buttons, "answered": len(answers or [])}
        except CF.P.PascalUnsupported:
            raise
        except Exception as e:      # noqa: BLE001 - try..finally: Delphi shows the exception, what was done stays
            error = str(e)
        if probe and error is None:
            continue
        if probe:                   # the probe failed before any question: run for real (same error, side effects as Delphi)
            continue
        s = _st(ws)
        s["rich"], s["spans"] = rich.lines, rich.spans
        if "messages" in rt.refreshed or method == "tcfile.isertbtnclick":
            for n in DS:
                _open(ws, n)
        out = _view(ws)
        out.update(messages=rt.messages, error=error, calls=rt.calls, posts=len(rt.posts))
        return out


def refresh_files(ws, refwithsel: bool) -> dict:
    """ToolButton3Click :82 'Yenilə' (RefwithSel.Down = refwithsel)."""
    _st(ws)
    return _run(ws, "tcfile.toolbutton3click", refwithsel=refwithsel)


def to_base(ws, answers: list[str]) -> dict:
    """isertbtnClick :390 'Bazaya Göndər'. answers: 'mryes' / 'mrno' for "The file .. already exits" (asked when needed)."""
    _st(ws)
    return _run(ws, "tcfile.isertbtnclick", answers=answers)


def confirm(ws, ids: list[int], current: int | None, answers: list[str]) -> dict:
    """ToolButton1Click :550 'Təsdiq Et' replayed with the browser's answers (one per asked row): 'yes' | 'no' | 'cancel' |
    'all' (YesToAll + Yes) | 'all_no' (YesToAll + Cancel -> Continue). mrCancel -> Break. finally: WillRefresh -> both grids
    Refresh + message. No commit."""
    s = _st(ws)
    order = [r.get("ID") for r in s["rows"]["messages"]]
    sel = sorted(set(ids) & set(order), key=order.index)
    if not sel and current in order:
        sel = [current]
    wait, refreshed, done, error = True, False, [], None
    k = iter(answers)
    try:
        for tid in sel:
            if wait:
                a = next(k, "cancel")
                if a in ("no", "all_no"):
                    continue
                if a == "cancel":
                    break
                if a == "all":
                    wait = False
            ws.conn.call_proc("card_main", "transaction_c", [int(tid)], commit=False)
            done.append(tid)
            refreshed = True
    except Exception as e:      # noqa: BLE001
        error = str(e)
    msgs = []
    if refreshed:
        for n in DS:
            _open(ws, n)
        msgs.append(MSG_DONE)
    out = _view(ws)
    out.update(confirmed=done, messages=msgs, error=error)
    return out


def excel(ws) -> bytes:
    """ToolButton7Click :649: ExportDataset(DataMod_CARDS.messages, 'CFILES', True) - all fields, no right check."""
    _st(ws)
    from .cards_balpay import _excel
    return _excel(_q(ws, DS["messages"]), "CFILES")


class LoadIn(BaseModel):
    name: str = Field(max_length=255)
    b64: str = Field(max_length=14_000_000)       # one file per request (~10 MB)


class AnsIn(BaseModel):
    answers: list[str] = []


class ConfIn(BaseModel):
    ids: list[int] = []
    current: int | None = None
    answers: list[str] = []


XLSX = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/cards/cfile")
    g = require_module(CLSID)

    def _fe(fn, *a):
        try:
            return fn(*a)
        except LookupError:
            err(409, "error.bad_request")
        except ValueError as e:
            err(400, "error.bad_request", ora=str(e))

    @r.post("/open")
    def _o(ws=Depends(g)):
        return open_form(ws)

    @r.post("/upload")
    def _u(b: LoadIn, ws=Depends(g)):
        def f():
            _st(ws)
            try:
                data = base64.b64decode(b.b64, validate=True)
            except Exception:       # noqa: BLE001
                raise ValueError("base64") from None
            CF.upload(ws, KEY, b.name, data)
            return _view(ws)
        return _fe(f)

    @r.post("/refresh")
    def _r(ws=Depends(g)):
        return _fe(refresh_files, ws, False)          # RefwithSel (cfilepas.dfm:27) has Visible = False: never Down

    @r.post("/tobase")
    def _b(b: AnsIn, ws=Depends(g)):
        for a in b.answers:
            if a not in ("mryes", "mrno"):
                err(400, "error.bad_request")
        return _fe(to_base, ws, b.answers)

    @r.post("/confirm")
    def _c(b: ConfIn, ws=Depends(g)):
        return _fe(confirm, ws, b.ids, b.current, b.answers)

    @r.post("/excel")
    def _x(ws=Depends(g)):
        return Response(_fe(excel, ws), media_type=XLSX, headers={"Content-Disposition": 'attachment; filename="CFILES.xlsx"'})

    return r
