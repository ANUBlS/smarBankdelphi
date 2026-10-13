"""Cards ▸ Prosedur ▸ Verifikasiya (cards_azericard unitverification.pas Tverification), opened by MAINFORMImpl1.pas N13Click
:1286 (right VERIF). DBGrid1 = DataMod_CARDS.urgent2 (URG 1), DBGrid2 = simple2 (URG 0), both STATUS = 4 by :dat1 (verbatim
cards_sql.LINES_URGENT2 / LINES_SIMPLE2).

FormShow: DateTimePicker1 := Date, dat1, Open (FormActivate opens again: same rows); Button6.Click / Button7.Click have no OnClick
(no sort, unlike TApplications). Button1Click 'YENİLƏ' reopens by the picked date. Button2Click (DBGrid1) / Button5Click (DBGrid2)
'VERİFİKASİYA': per selected row (Count = 0 -> the current row) MessageDlg 'Əmaliyyat verifikasiya edilsin? №' (Format with no %d:
the id is not shown) Yes / No / Cancel / YesToAll ('%d  sayda əməliyyat verifikasiya edildi?' with Count-Index, Yes / Cancel; Cancel
-> Continue), card_main.verifi(ID); finally: when any call was made, Refresh and 'Əməliyyatlar verifikasiya edildi!'. No commit.
Button3Click / Button4Click 'EXCEL': ExportDataset(urgent2 / simple2, 'Verification', True). PopupMenu SELECT ALL. Status icons
as TApplications (DBGrid1/2DrawColumnCell: STATUS 1 25, 2 3, 3 26, 4 13). No OnTitleClick."""
from __future__ import annotations
import datetime
import io

from fastapi import APIRouter, Depends, Response
from pydantic import BaseModel

from . import cards_sql as Q
from .cards import CLSID
from .cards_app import STATUS_IMG
from .customers import row

GRID_COLS = ["EMELIYYAT", "", "CARDNUMBER", "RBSNUMBER", "FNAME", "LNAME", "CARDHOLDER", "CREDIT_LIM", "CARDTYPE", "COMPANY", "FIL",
             "CURRENCY", "CARDSTATUS", "DATEOPEN", "EXPIRY", "EMBOSSNAME", "PASSPORT", "BIRTHDAY", "HOMEPHONE", "WORKPHONE", "ADDRESS",
             "RESIDENT", "ID", "CREATER", "MODIFIER", "CRDAT", "DAT"]
DS = {"urgent": Q.LINES_URGENT2, "simple": Q.LINES_SIMPLE2}
MSG_ROW = "Əmaliyyat verifikasiya edilsin? №"
MSG_ALL = "%d  sayda əməliyyat verifikasiya edildi?"
MSG_DONE = "Əməliyyatlar verifikasiya edildi!"


def _st(ws) -> dict:
    return ws.module_state.setdefault("cards_verif", {})


def _ap(ws) -> dict:
    s = _st(ws)
    if "dat1" not in s:
        raise LookupError("verification")
    return s


def _open(ws, name):
    s = _st(ws)
    s["rows"][name] = ws.conn.query(Q.text(DS[name]), {"dat1": s["dat1"]})


def _view(ws) -> dict:
    s = _st(ws)
    return {"date": s["dat1"].isoformat(), "cols": GRID_COLS, "status_img": STATUS_IMG,
            "msg_row": MSG_ROW, "msg_all": MSG_ALL,
            "urgent": [row(r) for r in s["rows"]["urgent"]], "simple": [row(r) for r in s["rows"]["simple"]]}


def open_form(ws) -> dict:
    ws.conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["VERIF"], commit=False)
    s = _st(ws)
    s.clear()
    s.update(dat1=datetime.date.today(), rows={})
    _open(ws, "urgent")
    _open(ws, "simple")
    return _view(ws)


def refresh(ws, d: datetime.date) -> dict:
    s = _ap(ws)
    s["dat1"] = d
    _open(ws, "urgent")
    _open(ws, "simple")
    return _view(ws)


def verify(ws, grid: str, ids: list[int], current: int | None, answers: list[str]) -> dict:
    """Button2Click / Button5Click replayed with the browser's answers (one per asked row, in the order asked):
    'yes' | 'no' | 'cancel' | 'all' (YesToAll + Yes) | 'all_no' (YesToAll + Cancel). A missing answer = Cancel (dialog closed)."""
    s = _ap(ws)
    if grid not in DS:
        raise ValueError(grid)
    order = [r.get("ID") for r in s["rows"][grid]]
    sel = sorted(set(ids) & set(order), key=order.index)          # TBookmarkList order
    if not sel and current in order:                              # if Count = 0 then CurrentRowSelected := True
        sel = [current]
    wait, refreshed, done, error = True, False, [], None
    k = iter(answers)
    try:
        for index, tid in enumerate(sel):
            if wait:
                a = next(k, "cancel")
                if a == "no":
                    continue
                if a == "cancel":
                    break
                if a == "all_no":
                    continue
                if a == "all":
                    wait = False
            ws.conn.call_proc("card_main", "verifi", [int(tid)], commit=False)
            done.append(tid)
            refreshed = True
    except Exception as e:      # noqa: BLE001 - the finally block runs, then Delphi shows the error
        error = str(e)
    msgs = []
    if refreshed:
        _open(ws, grid)
        msgs.append(MSG_DONE)
    out = _view(ws)
    out.update(verified=done, messages=msgs, error=error)
    return out


def excel(ws, grid: str) -> bytes:
    s = _ap(ws)
    if grid not in DS:
        raise ValueError(grid)
    from openpyxl import Workbook
    wb = Workbook()
    sh = wb.active
    sh.title = "Verification"
    rows = s["rows"][grid]
    cols = [k for k in (rows[0].keys() if rows else []) if k != "ROWID"]
    sh.append(cols)
    for r in rows:
        sh.append([r.get(c) for c in cols])
    bio = io.BytesIO()
    wb.save(bio)
    return bio.getvalue()


class RefreshIn(BaseModel):
    date: datetime.date


class VerifyIn(BaseModel):
    grid: str
    ids: list[int] = []
    current: int | None = None
    answers: list[str] = []


class GridIn(BaseModel):
    grid: str


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/cards/verification")
    g = require_module(CLSID)

    def _fe(fn, *a):
        try:
            return fn(*a)
        except LookupError:
            err(409, "error.bad_request")
        except ValueError:
            err(400, "error.bad_request")

    @r.post("/open")
    def _o(ws=Depends(g)):
        return open_form(ws)

    @r.post("/refresh")
    def _r(b: RefreshIn, ws=Depends(g)):
        return _fe(refresh, ws, b.date)

    @r.post("/verify")
    def _v(b: VerifyIn, ws=Depends(g)):
        return _fe(verify, ws, b.grid, b.ids, b.current, b.answers)

    @r.post("/excel")
    def _x(b: GridIn, ws=Depends(g)):
        data = _fe(excel, ws, b.grid)
        return Response(data, media_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                        headers={"Content-Disposition": 'attachment; filename="Verification.xlsx"'})

    return r
