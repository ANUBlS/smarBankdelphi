"""Cards ▸ C File ▸ 'XML Göndər' (cfilepas.pas ToolButton2Click :643 -> TAdditional_cfile, cfile_addi.pas, 436 lines).

No right check (ToolButton2Click creates the form and ShowModal's it). DBGrid1 = caddi (Unit18.dfm:4981, status 1, begdat = trunc(sysdate)),
DBGrid2 = c_add_ar (Unit18.dfm:5040, status in (2,3)); neither is Active at design time, so both grids are empty until ToolButton3 'Yenile'
(:426 Close / Open both) runs, directly or from Button1Click / ToolButton1Click.
- isertbtn 'Bazaya Göndər' :233 = button1.Click (everything else in it is commented out). Button1Click :76: OpenDialog1 -> the XML file the
  user uploaded (one file, by hand); XMLDocument1.LoadFromFile; for every child j of DocumentElement.DocTransList: multi_del(DocID); for every
  child i of its SynteticTransList: tr := StrToInt(TransferedAmount.GMTrCurrency), sr := StrToInt(AccountAmount.GMCurrency); tr <> sr ->
  Memo1 lines (Memo1 is Visible = False) + multi_ins(DocID, AccountAmount.GMAmount text, sr). Then ToolButton3.Click. No try: an exception
  stops the loop, the calls made stay (no commit anywhere in the unit; DOA does not commit CallProcedure).
- ToolButton1 'Təsdiq Et' :338: per selected DBGrid1 row (Count = 0 -> the current row) Yes / No / Cancel / Yes to all ('%d  sayda ..'),
  card_main.transaction_multi(ID); finally WillRefresh -> ToolButton3.Click + 'Əməliyyatlar günün sənədlərinə göndərildi!'.
- DBGrid1TitleClick :168: IsEmpty or no FieldName -> Exit; caddi.SQL.Add('ORDER BY '+F); Refresh. The line is never removed: a second click
  appends a second ORDER BY (ORA-00933 on Oracle, as in Delphi). DBGrid2 has dgTitleClick but no OnTitleClick.
- DBGrid1KeyPress :163: any key on DBGrid1 -> S1.Click 'Select All' (PopupMenu1, ShortCut Ctrl+A).
- DBGrid1/2DrawColumnCell: DataCol 1 (the column without FieldName after ID) STATUS 1->25, 2->3, 3->26, 4->13 of ImageList1.
TXMLDocument ChildNodes['X'] with the default doNodeAutoCreate returns an empty new node when X is missing (Text = '')."""
from __future__ import annotations

import base64
from xml.dom import minidom

from fastapi import APIRouter, Depends
from pydantic import BaseModel, Field

from . import cards_files as CF
from . import cards_sql as Q
from .cards import CLSID
from .customers import row

KEY = "caddi"
MSG_DONE = "Əməliyyatlar günün sənədlərinə göndərildi!"


def _st(ws) -> dict:
    s = ws.module_state.get("cards_caddi")
    if s is None:
        raise LookupError("caddi")
    return s


def _view(ws, **extra) -> dict:
    s = _st(ws)
    f = CF.uploaded(ws, KEY)
    out = {"grid1": None if s["g1"] is None else [row(r) for r in s["g1"]], "grid2": None if s["g2"] is None else [row(r) for r in s["g2"]],
           "file": None if not f else {"name": f["name"], "size": len(f["data"])}, "memo": s["memo"]}
    out.update(extra)
    return out


def open_form(ws) -> dict:
    ws.module_state["cards_caddi"] = {"g1": None, "g2": None, "lines1": list(Q.LINES_CADDI), "memo": []}
    return _view(ws)


def _refresh(ws):
    """ToolButton3Click :426: dbgrid1 / dbgrid2 DataSet Close + Open (caddi with the ORDER BY lines added so far)."""
    s = _st(ws)
    s["g1"] = [dict(r) for r in ws.conn.query(Q.text(s["lines1"]), {})]
    s["g2"] = [dict(r) for r in ws.conn.query(Q.text(Q.LINES_C_ADD_AR), {})]


def refresh(ws) -> dict:
    _refresh(ws)
    return _view(ws)


# ------------------------------------------------------------------------------------------------ TXMLDocument (MSXML) subset
class XNode:
    def __init__(self, n=None):
        self.n = n                                # None = a node created by doNodeAutoCreate (empty)

    def kids(self):
        if self.n is None:
            return []
        out = []
        for c in self.n.childNodes:
            if c.nodeType == c.TEXT_NODE and not c.data.strip():
                continue                          # MSXML preserveWhiteSpace = False: whitespace-only text is not a node
            out.append(c)
        return out

    def count(self):
        return len(self.kids())

    def by_index(self, i):
        k = self.kids()
        if i < 0 or i >= len(k):
            raise ValueError(f"List index out of bounds ({i})")
        return XNode(k[i])

    def by_name(self, name):
        if self.n is not None and self.n.nodeType != self.n.ELEMENT_NODE:
            raise ValueError("Operation not supported on this node type")
        for c in self.kids():
            if c.nodeType == c.ELEMENT_NODE and c.tagName == name:
                return XNode(c)
        return XNode(None)

    @property
    def text(self):
        if self.n is None:
            return ""
        k = self.kids()
        if any(c.nodeType == c.ELEMENT_NODE for c in k):
            raise ValueError(f'Element "{self.n.tagName}" does not contain a single text node')
        return "".join(c.data for c in k if c.nodeType in (c.TEXT_NODE, c.CDATA_SECTION_NODE))


def _strtoint(s):
    t = str(s)
    try:
        if t != t.strip() or not t:
            raise ValueError
        return int(t, 16) if t.startswith("$") else int(t)
    except ValueError:
        raise ValueError(f"'{s}' is not a valid integer value") from None


def load(ws) -> dict:
    """isertbtnClick :233 -> Button1Click :76."""
    s = _st(ws)
    f = CF.uploaded(ws, KEY)
    calls, error = [], None
    try:
        if not f:
            raise ValueError("Cannot open file \"\". The filename, directory name, or volume label syntax is incorrect")   # FName = ''
        data = f["data"]
        if b"<!DOCTYPE" in data[:4096].upper():
            raise ValueError("DTD is prohibited")
        try:
            doc = minidom.parseString(data)
        except Exception as e:      # noqa: BLE001 - EDOMParseError
            raise ValueError(str(e)) from None
        root = XNode(doc.documentElement)
        dl = root.by_name("DocTransList")
        for j in range(dl.count()):
            fname = dl.by_index(j).by_name("DocID").text
            ws.conn.call_proc("card_main", "multi_del", [fname], commit=False); calls.append(["multi_del", [fname]])
            st = dl.by_index(j).by_name("SynteticTransList")
            for i in range(st.count()):
                x = st.by_index(i)
                tr = _strtoint(x.by_name("TransferedAmount").by_name("GMTrCurrency").text)
                sr = _strtoint(x.by_name("AccountAmount").by_name("GMCurrency").text)
                if tr != sr:
                    amt = x.by_name("AccountAmount").by_name("GMAmount").text
                    s["memo"] += ["#" * 20, amt, "*" * 20, dl.by_index(j).by_name("DocID").text]
                    a = [dl.by_index(j).by_name("DocID").text, amt, sr]
                    ws.conn.call_proc("card_main", "multi_ins", a, commit=False); calls.append(["multi_ins", a])
        _refresh(ws)                                                       # ToolButton3.Click :120
    except ValueError as e:
        error = str(e)
    return _view(ws, calls=calls, error=error)


def confirm(ws, ids: list[int], current: int | None, answers: list[str]) -> dict:
    """ToolButton1Click :338, replayed with the browser's answers (as cards_cfile.confirm), card_main.transaction_multi."""
    s = _st(ws)
    order = [r.get("ID") for r in (s["g1"] or [])]
    sel = sorted(set(ids) & set(order), key=order.index)
    if not sel and current in order:
        sel = [current]
    wait, will, done, error = True, False, [], None
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
            ws.conn.call_proc("card_main", "transaction_multi", [int(tid)], commit=False)
            done.append(tid)
            will = True
    except Exception as e:      # noqa: BLE001
        error = str(e)
    msgs = []
    if will:
        _refresh(ws); msgs.append(MSG_DONE)
    return _view(ws, confirmed=done, messages=msgs, error=error)


def sort(ws, field: str) -> dict:
    """DBGrid1TitleClick :168."""
    s = _st(ws)
    if not s["g1"] or field.upper() not in ("ID", "AMMOUNT", "ACCNO", "CURRENCYNAME", "DOCID"):
        return _view(ws)
    s["lines1"].append("ORDER BY " + field.upper())
    try:
        _refresh(ws)
    except Exception as e:      # noqa: BLE001 - Refresh error shown, the line stays
        return _view(ws, error=str(e))
    return _view(ws)


class LoadIn(BaseModel):
    name: str = Field(max_length=255)
    b64: str = Field(max_length=14_000_000)


class ConfIn(BaseModel):
    ids: list[int] = []
    current: int | None = None
    answers: list[str] = []


class SortIn(BaseModel):
    field: str = Field(max_length=40)


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/cards/caddi")
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
        _ = ws.module_state.get("cards_cfile") or err(409, "error.bad_request")    # opened from Tcfile only
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
        return _fe(refresh, ws)

    @r.post("/load")
    def _l(ws=Depends(g)):
        return _fe(load, ws)

    @r.post("/confirm")
    def _c(b: ConfIn, ws=Depends(g)):
        for a in b.answers:
            if a not in ("yes", "no", "cancel", "all", "all_no"):
                err(400, "error.bad_request")
        return _fe(confirm, ws, b.ids, b.current, b.answers)

    @r.post("/sort")
    def _s(b: SortIn, ws=Depends(g)):
        return _fe(sort, ws, b.field)

    return r
