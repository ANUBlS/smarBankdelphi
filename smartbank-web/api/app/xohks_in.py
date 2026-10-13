"""XÖHKS step 4 - IN tab: file load (manual upload, one file), Konvert, accept, delete.

Delphi (LVPCSSImpl.pas): MessageInFileLoadExecute :2849 adds the files picked in OpenDialogIn to FileListIncoming (no duplicates);
Convert1Click :2177 converts the selected list item, MessagesInConvertExecute :2523 (ButtonMessInConvert / ConvertAll1Click
:2664) every item, ConvertConfirmeClick :2948 = convert all + MessageInSelAll + MessagesInAccept. Each file goes through
LoadToRich :1394 and ConvertToBase :1412-1848, which are executed from their verbatim source
(delphi_src/LVPCSS_ConvertToBase.pas) by pascal.py against vcl.RichEdit (the hidden RichEdit1, WordWrap=False), the DataMod
datasets DataCheck / DataTemp (SQL.Add with quoted values -> sent with binds) and TOraclePackage Ins (XS_CONTROL).
By the user's decision files are uploaded by hand ONE at a time: the upload replaces the list's only item (the in_dir folder
is not read; MessagesInRefresh's LoadFileNames is not ported). No commit anywhere, as in Delphi (the session keeps the
inserts until a later Commit).
"""
from __future__ import annotations
import base64
import datetime
import os

from fastapi import Depends
from pydantic import BaseModel, Field

from . import azips_files as F
from . import pascal as P
from . import vcl
from . import xohks as X
from . import xohks_sql as Q
from .db.base import DBError
from .delphi import subst

SRC = "LVPCSS_ConvertToBase"
# Line break inside the hidden RichEdit1 as counted by FindText positions: Delphi XE's TRichEdit is RICHEDIT20W -> one CR
# (default). ConvertToBase's ':77B:' test (TempPos = FnEndPos+10 after ':26T:nnn') and its chr(10) replacement only hit with
# CR LF (RichEdit 1.0, the Delphi 7 control) - set XOHKS_RICHEDIT_BREAK=crlf if the bank's real files show add_inf filled.
RICHEDIT_BREAK = os.getenv("XOHKS_RICHEDIT_BREAK", "cr").lower()
_UNIT = None


def _unit():
    global _UNIT
    if _UNIT is None:
        import os
        import re
        txt = open(os.path.join(F.SRC_DIR, SRC + ".pas"), encoding="utf-8").read()
        m = re.match(r"\{ Verbatim copy of .*? lines (\d+)-(\d+) .*?\}\n", txt)
        _UNIT = P.Unit(txt[m.end():], int(m.group(1)))
    return _UNIT


def _st(ws):
    return X._st(ws)


# ------------------------------------------------------------------------------------------------ file list
def load_file(ws, name: str, data: bytes) -> dict:
    """MessageInFileLoadExecute: one uploaded file = the only FileListIncoming item (Delphi lists the OpenDialog paths)."""
    _st(ws)["in_files"] = {name: base64.b64encode(data).decode()}
    return {"files": [name]}


def clear_selected(ws) -> dict:
    """ClearSelected1Click :2843: FileListIncoming.Items.Delete(ItemIndex)."""
    _st(ws)["in_files"] = {}
    return {"files": []}


def _files(ws) -> dict[str, bytes]:
    return {k: base64.b64decode(v) for k, v in (_st(ws).get("in_files") or {}).items()}


# ------------------------------------------------------------------------------------------------ convert
def _strtofloat(s):
    t = str(s).strip()
    ok = t != "" and all(c in "0123456789+-eE" + F.DECIMAL_SEPARATOR for c in t) and t.count(F.DECIMAL_SEPARATOR) <= 1
    try:
        if not ok or str(s) != t:
            raise ValueError
        return float(t.replace(F.DECIMAL_SEPARATOR, "."))
    except ValueError:
        raise P.PascalError(f"'{s}' is not a valid floating point value") from None


def _delete(interp, nodes):
    s = interp.ev(nodes[0]); i = int(interp.ev(nodes[1])); c = int(interp.ev(nodes[2]))
    if 1 <= i <= len(s) and c > 0:
        s = s[:i - 1] + s[i - 1 + c:]
    interp.assign(nodes[0], s)


_delete.pascal_byref = True


def _inc(interp, nodes):
    interp.assign(nodes[0], interp.ev(nodes[0]) + (int(interp.ev(nodes[1])) if len(nodes) > 1 else 1))


_inc.pascal_byref = True


def _env(ws, files):
    conn = ws.conn
    rt = F.Runtime(conn)
    use = X.get_use_date(conn)
    rich = vcl.RichEdit(files, "\r\n" if RICHEDIT_BREAK == "crlf" else "\r")
    datamod = F.Module({"datacheck": F.DataSet(rt, "DataCheck", []), "datatemp": F.DataSet(rt, "DataTemp", []),
                        "ins": F.Package(rt, Q.PKG_INS if hasattr(Q, "PKG_INS") else "XS_CONTROL")})
    form = F.Module({"datamod": datamod, "richedit1": rich})
    b = rt.builtins()
    enc = P.Sink("TEncoding"); enc.props["utf8"] = "utf8"
    b.update({"getusedate": lambda: datetime.datetime(use.year, use.month, use.day), "strtofloat": _strtofloat,
              "strtoint": vcl._strtoint, "abs": abs, "delete": _delete, "inc": _inc, "decimalseparator": F.DECIMAL_SEPARATOR,
              "stmatchcase": "stMatchCase", "tencoding": enc, "chr": lambda v: chr(int(v))})
    return rt, rich, form, b


def _convert_one(ws, rt, rich, form, b, name) -> str | None:
    """Convert1Click body for one file: ref := LoadToRich(...); ref <> '0' -> ConvertToBase(RichEdit1, ref); else warning."""
    u = _unit()
    ref = P.Routine(u, "tlvpcssform.loadtorich", form, b).invoke([name])
    if ref != "0":
        P.Routine(u, "tlvpcssform.converttobase", form, b).invoke([rich, ref])
        return None
    return "Warning:  <" + name + ">   Artıq konvert olunub !"


def convert(ws, all_items: bool = True) -> dict:
    """Convert1Click (selected item) / MessagesInConvertExecute (all items) - with one file both convert that file.
    An exception stops the loop and is shown (Delphi application handler); nothing is rolled back or committed."""
    files = _files(ws)
    rt, rich, form, b = _env(ws, files)
    warnings, error = [], None
    try:
        for name in sorted(files) if all_items else list(files)[:1]:
            w = _convert_one(ws, rt, rich, form, b, name)
            if w:
                warnings.append(w)
    except P.PascalUnsupported:
        raise
    except (P.PascalError, DBError, ValueError, ZeroDivisionError) as e:
        error = str(e)
    return {"warnings": warnings, "error": error, "calls": rt.calls, "rows": X.incoming(ws)}


# ------------------------------------------------------------------------------------------------ accept / delete
def _ordered(rows, ids):
    order = [r["id"] for r in rows]
    return sorted(set(ids) & set(order), key=order.index)


def accept_prepare(ws, current: int | None) -> dict:
    """MessagesInAcceptExecute :2586 first shows Form20 ('Verification') with Edit1 = REC_CLIENT_ACC, Edit2 = rec_client_inn of
    the current row (empty when there is none); its only button 'Yoxla' closes it."""
    rows = X.incoming(ws)
    r = next((x for x in rows if x["id"] == current), rows[0] if rows else {})
    return {"edit1": r.get("rec_client_acc") or "", "edit2": r.get("rec_client_inn") or ""}


def accept(ws, current: int | None, selected: list[int]) -> dict:
    """After Form20: exit when empty; current row selected; date check of the CURRENT row (trans_date <> GetUseDate and
    <> SBOP.Get_Date -> 'Əməliyyat #%d Dəyişdirilə bilməz!'); SB_ACA.CheckAdvancedObjectAccess('XOHKS_IN') (raises ->
    stops); for each selected bookmark: if the dataset's CURRENT record (still the previous one - the check is made
    before GotoBookmark, kept as in Delphi) has status 1 -> Continue; GotoBookmark; XS_CONTROL.SetIncomingTransaction(ID).
    No commit."""
    conn = ws.conn
    rows = X.incoming(ws)
    if not rows:
        return {"rows": rows}
    cur = next((x for x in rows if x["id"] == current), rows[0])
    sel = _ordered(rows, list(selected) + [cur["id"]])
    raw = ws.conn.query(subst(Q.text(Q.LINES_XS_INCOMINGVIEW), "title", X._st(ws).get("in_title", Q.TITLE_DEFAULT)))
    td = next((x.get("TRANS_DATE") for x in raw if x.get("ID") == cur["id"]), None)
    use = X.get_use_date(conn)
    sysd = conn.call_func(Q.PKG_SBOP, "Get_Date", [], datetime.datetime)
    use_dt = datetime.datetime(use.year, use.month, use.day)
    if td != use_dt and td != sysd:
        raise X.XsError("xohks.in_not_changeable", id=cur["id"])
    try:
        conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["XOHKS_IN"], commit=False)
    except DBError as e:
        raise X.XsError("xohks.db_error", message=str(e))
    done = []
    pos = cur
    for bid in sel:
        if int(pos.get("status") or 0) == 1:
            continue
        pos = next(x for x in rows if x["id"] == bid)
        conn.call_proc("XS_CONTROL", "SetIncomingTransaction", [pos["id"]], commit=False)
        done.append(pos["id"])
    return {"accepted": done, "rows": X.incoming(ws)}


def delete_plan(ws, current: int | None, selected: list[int]) -> dict:
    """MessInDeleteExecute :2204: current row selected; the first question is about the first selected row (dataset order)."""
    rows = X.incoming(ws)
    if not rows:
        return {"ids": []}
    cur = next((x for x in rows if x["id"] == current), rows[0])
    return {"ids": _ordered(rows, list(selected) + [cur["id"]])}


def delete(ws, ids: list[int], answer: str, confirm_all: bool = False) -> dict:
    """Answer to 'Əməliyyat silinsinmi #%d ?' [Yes, No, Cancel, All] for ids[0]:
    yes -> xs_incoming_delete(id), Refresh, SelectedRows.Clear; with more rows selected the next loop step then reads
    SelectedRows.Items[1] of the cleared list and Delphi raises the list-index error (kept, reported as an error);
    no -> exit; cancel -> break; all -> '<n> sayda əməliyyat silinsinmi ?' yes -> delete every selected row. No commit."""
    conn = ws.conn
    out = {"deleted": []}
    if not ids or answer in ("no", "cancel"):
        return {**out, "rows": X.incoming(ws)}
    if answer == "yes":
        conn.call_proc("XS_CONTROL", "xs_incoming_delete", [ids[0]], commit=False)
        out["deleted"].append(ids[0])
        if len(ids) > 1:
            out["error"] = "List index out of bounds (1)"
    elif answer == "all" and confirm_all:
        for i in ids:
            conn.call_proc("XS_CONTROL", "xs_incoming_delete", [i], commit=False)
            out["deleted"].append(i)
    return {**out, "rows": X.incoming(ws)}


# ------------------------------------------------------------------------------------------------ router
class SelIn(BaseModel):
    current: int | None = None
    selected: list[int] = []


class DelIn(BaseModel):
    ids: list[int]
    answer: str
    confirm_all: bool = False


class LoadIn(BaseModel):
    name: str = Field(min_length=1, max_length=255)
    b64: str = Field(max_length=14_000_000)       # one file per request (~10 MB)


class ConvIn(BaseModel):
    all: bool = True


def make_router(current, require_module, err):
    from fastapi import APIRouter
    r = APIRouter(prefix="/api/xohks/in")
    g = require_module(X.CLSID)

    def guard(fn, *a, **k):
        try:
            return fn(*a, **k)
        except X.XsError as e:
            err(400, e.key, **e.extra)

    @r.post("/load")
    def _load(b: LoadIn, ws=Depends(g)):
        try:
            data = base64.b64decode(b.b64, validate=True)
        except ValueError:
            err(400, "error.bad_request")
        return load_file(ws, b.name, data)

    @r.post("/clear")
    def _clear(ws=Depends(g)):
        return clear_selected(ws)

    @r.get("/files")
    def _files_(ws=Depends(g)):
        return {"files": sorted(_files(ws))}

    @r.post("/convert")
    def _conv(b: ConvIn, ws=Depends(g)):
        return guard(convert, ws, b.all)

    @r.post("/accept/prepare")
    def _accp(b: SelIn, ws=Depends(g)):
        return accept_prepare(ws, b.current)

    @r.post("/accept")
    def _acc(b: SelIn, ws=Depends(g)):
        return guard(accept, ws, b.current, b.selected)

    @r.post("/delete/plan")
    def _delp(b: SelIn, ws=Depends(g)):
        return delete_plan(ws, b.current, b.selected)

    @r.post("/delete")
    def _del(b: DelIn, ws=Depends(g)):
        if b.answer not in ("yes", "no", "cancel", "all"):
            err(400, "error.bad_request")
        return delete(ws, b.ids, b.answer, b.confirm_all)

    return r
