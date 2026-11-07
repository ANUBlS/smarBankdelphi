"""Cards ▸ Əməliyyat ▸ Card Number Change (cards_azericard MAINFORMImpl1 cARDNUMBERCHANGE1Click :1266, right card_cardnumber ->
TCARDNUMBER cardnumbersource.pas). No commit anywhere in the unit (CallProcedure does not commit).

PageControl1 (ActivePage TabSheet1, FormShow :825 ActivePageIndex := 0):
- TabSheet1 'Auto': TabSheet1Show :706 card_main.DELETCARDNUM (grids not refreshed: the Refresh lines are commented out);
  FormActivate :394 cardnumber1 / cardnumber2 Open (on ShowModal: FormShow, TabSheet1Show, FormActivate).
  isertbtn 'Bazaya Göndər' :330: OpenDialog1.Execute (the ONE file uploaded by hand) -> DELETCARDNUM, inserbase :332: per Readln line
  editcardnumber(trim(copy(s,34,16)), trim(copy(s,51,25)), trim(copy(s,89,16)), trim(copy(s,106,30)), trim(copy(s,1,15))), then
  DBGrid1 / DBGrid2 Refresh. ToolButton1 'Təsdiq Et' :494 / ToolButton2 'Sil' :419: the SelectedRows loop (Count = 0 -> current row,
  Yes / No / Cancel / Yes to all) with cardnumchange(ID) / cardnumdelete(ID); finally WillRefresh -> both Refresh + message.
  ToolButton7 'Excel' DropdownMenu N11 / N12 (ExportDataset(cardnumber1 / 2, 'KART NOMRELERI')); both grids' PopupMenu2: EXCEL1 (cardnumber1),
  SELECTALL1 Ctrl+A (DBGrid1). DBGrid1 / DBGrid2 Options have no dgTitleClick: DBGrid1TitleClick never runs. dgEditing is set, but the
  datasets select no ROWID (DOA cannot update them): read-only in the web.
- TabSheet2 'Manual': TabSheet2Show :169 / Button2 'Clear' :199 clear the boxes (date editors := Date). Edit1 (REFERANCE, ecUpperCase)
  KeyPress :228: Enter -> Edit2.Clear, client2 (Unit18.dfm:2847 `select * from card_clients where reference=:refs`) Close / SetVariable /
  Open, boxes from its fields; any key with Edit1 empty clears every box. Button1 'Save' :125: Edit1 and Edit2 not empty ->
  'Kart nömrəsini daxil etmək istəyirsinizmi?' Yes -> card_main.CARDNUMBER(trim(Edit1), Edit2), client2 reopened (refs = Edit1.Text),
  boxes refilled, 'Kart nömrəsi bazaya qeyd olundu!'. The two texts are Azl Sans Serif code points in the .pas (Cyrillic on screen in
  Delphi); the web shows the decoded Azerbaijani."""
from __future__ import annotations

import base64
import datetime as dt
import re

from fastapi import APIRouter, Depends
from fastapi.responses import Response
from pydantic import BaseModel, Field

from . import cards_files as CF
from . import cards_sql as Q
from .cards import CLSID
from .customers import row
from .delphi import float_to_str

# TabSheet2 boxes <- client2 fields (Button1Click :137-159 / Edit1KeyPress :236-258)
BOXES = [("Edit4", "RBSNUMBER"), ("Edit6", "KLI_ID"), ("ComboBox10", "TITUL"), ("ComboBox11", "TYPES"), ("ComboBox12", "CARDSTATUS"),
         ("Edit15", "FNAME"), ("Edit16", "LNAME"), ("Edit17", "HOMEPHONE"), ("Edit27", "WORKPHONE"), ("Edit18", "PASSPORT"),
         ("DateTimePicker7", "BIRTHDAY"), ("Edit20", "COUNTRY"), ("Edit19", "CITY"), ("Edit21", "LANG_CODE"), ("Edit22", "ADDRESS"),
         ("ComboBox1", "CARDTYPE"), ("DateTimePicker8", "EXPIRY"), ("ComboBox4", "RESIDENT"), ("Edit26", "REFERENCE"),
         ("Edit25", "SECURITY"), ("Edit24", "CARDNUMBER"), ("Edit23", "EMBOSSNAME"), ("ComboBox2", "COMPANY")]
COLS = ["ID", None, "REFERANCE", "CARDNUMBER", "NAME", "RBSNUMBER", "INFO"]          # cardnumbersource.dfm DBGrid1 / DBGrid2 Columns
LOOP = {  # ToolButton1Click :494 / ToolButton2Click :419
    "change": dict(proc="cardnumchange", ask="Secilmiş kartlar dəyişilsin?? №", all="%d  sayda kart dəyişilsin?", done="Kart nömrələri dəyişildi!"),
    "delete": dict(proc="cardnumdelete", ask="Secilmiş sətir silinsin? ", all="%d  sayda sətir silinsin?", done="Sətir silindi!"),
}


def _st(ws):
    s = ws.module_state.get("cards_cardnum")
    if s is None:
        raise LookupError("cardnum")
    return s


def _p(ws, name, args=()):
    ws.conn.call_proc("card_main", name, list(args), commit=False)


def _refresh(ws):
    s = _st(ws)
    s["grid1"] = [dict(r) for r in ws.conn.query(Q.text(Q.LINES_CARDNUMBER1), {})]
    s["grid2"] = [dict(r) for r in ws.conn.query(Q.text(Q.LINES_CARDNUMBER2), {})]


def _blank():
    """TabSheet2Show / Button2Click: every box '' and DateTimePicker7 / 8 := DATE ('TODAY' for the browser)."""
    return {k: ("TODAY" if k.startswith("DateTimePicker") else "") for k, _ in BOXES}


def _view(ws, **extra):
    s = _st(ws)
    out = {"page": s["page"], "grid1": [row(r) for r in s["grid1"]], "grid2": [row(r) for r in s["grid2"]], "cols": COLS,
           "boxes": s["boxes"], "edit1": s["edit1"], "edit2": s["edit2"],
           "file": None if not CF.uploaded(ws, "cardnum") else {"name": CF.uploaded(ws, "cardnum")["name"]}}
    out.update(extra)
    return out


def open_form(ws):
    ws.conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["card_cardnumber"], commit=False)
    ws.module_state["cards_cardnum"] = {"page": "auto", "grid1": [], "grid2": [], "boxes": _blank(), "edit1": "", "edit2": ""}
    _p(ws, "DELETCARDNUM")                                                 # TabSheet1Show :706
    _refresh(ws)                                                           # FormActivate :394
    return _view(ws)


def tab(ws, page):
    s = _st(ws)
    if page == "auto":
        _p(ws, "DELETCARDNUM")                                             # TabSheet1Show: the grids keep what they showed
    else:
        s["boxes"], s["edit1"], s["edit2"] = _blank(), "", ""            # TabSheet2Show :169
    s["page"] = page
    return _view(ws)


def _fill(ws, refs):
    """client2 Close / SetVariable('refs', Edit1.Text) / Open; FieldByName(..).AsString of the first row ('' when empty; the two
    TDBDateTimeEditEh get AsVariant: Null -> empty)."""
    rs = ws.conn.query(Q.text(Q.LINES_CLIENT2), {"refs": refs})
    r = rs[0] if rs else {}
    out = {}
    for k, f in BOXES:
        v = r.get(f)
        if v is None:
            out[k] = ""
        elif k.startswith("DateTimePicker"):                               # Value := AsVariant (a dd.mm.yyyy string converts to a date)
            if isinstance(v, dt.datetime):
                out[k] = v.date().isoformat()
            else:
                m = re.fullmatch(r"(\d\d)\.(\d\d)\.(\d{4}).*", str(v))
                out[k] = f"{m.group(3)}-{m.group(2)}-{m.group(1)}" if m else str(v)
        else:
            out[k] = float_to_str(v) if isinstance(v, (int, float)) else str(v)    # AsString
    return out


def edit1_enter(ws, text):
    s = _st(ws)
    s["edit1"], s["edit2"] = text, ""                                     # Edit2.Clear
    s["boxes"] = _fill(ws, text)
    if text == "":
        s["boxes"] = _blank()
    return _view(ws)


def save(ws, edit1, edit2, yes):
    s = _st(ws)
    s["edit1"], s["edit2"] = edit1, edit2
    if edit1 == "" or edit2 == "":
        return _view(ws)
    if not yes:
        return _view(ws)
    _p(ws, "CARDNUMBER", [edit1.strip(), edit2])
    s["boxes"] = _fill(ws, edit1)
    return _view(ws, messages=["Kart nömrəsi bazaya qeyd olundu!"])


def to_base(ws):
    """isertbtnClick :385: OpenDialog1.Execute (no uploaded file = cancelled) -> DELETCARDNUM + inserbase."""
    f = CF.uploaded(ws, "cardnum")
    if not f:
        return _view(ws)
    _p(ws, "DELETCARDNUM")
    n, error = 0, None
    try:
        for s in CF.split_lines(f["data"]):
            cp = lambda i, k: s[i - 1:i - 1 + k].strip()  # noqa: E731 - trim(copy(s, i, k))
            _p(ws, "editcardnumber", [cp(34, 16), cp(51, 25), cp(89, 16), cp(106, 30), cp(1, 15)])
            n += 1
        _refresh(ws)
    except Exception as e:      # noqa: BLE001 - Delphi shows the exception; the calls made stay
        error = getattr(e, "message", None) or str(e)
    return _view(ws, error=error, lines=n)


def loop(ws, kind, ids, current, answers):
    k_ = LOOP[kind]
    s = _st(ws)
    order = [r.get("ID") for r in s["grid1"]]
    sel = sorted(set(ids) & set(order), key=order.index)
    if not sel and current in order:
        sel = [current]                                                    # Count = 0 -> CurrentRowSelected := True
    wait, will, done, error = True, False, [], None
    it = iter(answers)
    try:
        for tid in sel:
            if wait:
                a = next(it, "cancel")
                if a in ("no", "all_no"):
                    continue
                if a == "cancel":
                    break
                if a == "all":
                    wait = False
            _p(ws, k_["proc"], [int(tid)])
            done.append(tid); will = True
    except Exception as e:      # noqa: BLE001
        error = getattr(e, "message", None) or str(e)
    msgs = []
    if will:
        _refresh(ws); msgs.append(k_["done"])
    return _view(ws, done=done, messages=msgs, error=error)


def excel(ws, grid) -> bytes:
    from .cards_balpay import _excel
    _st(ws)
    return _excel([dict(r) for r in ws.conn.query(Q.text(Q.LINES_CARDNUMBER1 if grid == "grid1" else Q.LINES_CARDNUMBER2), {})], "KART NOMRELERI")


class TabIn(BaseModel):
    page: str = Field(pattern="^(auto|manual)$")


class E1In(BaseModel):
    edit1: str = Field("", max_length=100)
    edit2: str = Field("", max_length=100)
    yes: bool = False


class LoadIn(BaseModel):
    name: str = Field(max_length=255)
    b64: str = Field(max_length=14_000_000)


class LoopIn(BaseModel):
    ids: list[int] = []
    current: int | None = None
    answers: list[str] = []


class GridIn(BaseModel):
    grid: str = Field("grid1", pattern="^grid[12]$")


XLSX = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/cards/cardnum")
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

    @r.post("/tab")
    def _t(b: TabIn, ws=Depends(g)):
        return _fe(tab, ws, b.page)

    @r.post("/edit1")
    def _e(b: E1In, ws=Depends(g)):
        return _fe(edit1_enter, ws, b.edit1.upper())                      # ecUpperCase

    @r.post("/save")
    def _sv(b: E1In, ws=Depends(g)):
        return _fe(save, ws, b.edit1.upper(), b.edit2, b.yes)

    @r.post("/clear")
    def _c(ws=Depends(g)):
        def f():
            s = _st(ws); s["boxes"], s["edit1"], s["edit2"] = _blank(), "", ""
            return _view(ws)
        return _fe(f)

    @r.post("/upload")
    def _u(b: LoadIn, ws=Depends(g)):
        def f():
            _st(ws)
            try:
                data = base64.b64decode(b.b64, validate=True)
            except Exception:       # noqa: BLE001
                raise ValueError("base64") from None
            CF.upload(ws, "cardnum", b.name, data)
            return _view(ws)
        return _fe(f)

    @r.post("/tobase")
    def _b(ws=Depends(g)):
        return _fe(to_base, ws)

    @r.post("/{kind}")
    def _l(kind: str, b: LoopIn, ws=Depends(g)):
        if kind not in LOOP or any(a not in ("yes", "no", "cancel", "all", "all_no") for a in b.answers):
            err(400, "error.bad_request")
        return _fe(loop, ws, kind, b.ids, b.current, b.answers)

    @r.post("/excel/{grid}")
    def _x(grid: str, ws=Depends(g)):
        if grid not in ("grid1", "grid2"):
            err(400, "error.bad_request")
        return Response(_fe(excel, ws, grid), media_type=XLSX, headers={"Content-Disposition": 'attachment; filename="KART_NOMRELERI.xlsx"'})

    return r
