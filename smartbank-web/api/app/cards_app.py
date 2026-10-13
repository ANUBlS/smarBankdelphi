"""Cards ▸ Prosedur ▸ Application (cards_azericard applicationpas.pas TApplications), opened by MAINFORMImpl1.pas N9Click :1068
(right card_application). Two grids: DBGrid1 = DataMod_CARDS.urgent (URG = 1), DBGrid2 = DataMod_CARDS.simple (URG = 0), both by
:dat1 = DateTimePicker1 (a DOA otDate variable, Unit18.dfm:1185/1266). Step 3a: list, refresh, title sort, status icons, select all,
Excel. 'FAYL YARAT' (Button2 / Button5 → cr_file1 / cr_file2, :346-1390) is step 3b."""
from __future__ import annotations
import datetime
import io

from fastapi import APIRouter, Depends, Response
from pydantic import BaseModel

from . import cards_sql as Q
from .cards import CLSID
from .customers import row

# applicationpas.dfm DBGrid1 / DBGrid2 Columns (identical); the column after EMELIYYAT has no FieldName: the status icon (DataCol 1)
GRID_COLS = ["EMELIYYAT", "", "CARDNUMBER", "RBSNUMBER", "FNAME", "LNAME", "CARDHOLDER", "CREDIT_LIM", "CARDTYPE", "COMPANY", "fil",
             "CURRENCY", "CARDSTATUS", "DATEOPEN", "EXPIRY", "EMBOSSNAME", "PASSPORT", "BIRTHDAY", "HOMEPHONE", "WORKPHONE", "ADDRESS",
             "RESIDENT", "ID", "CREATer", "Modifier", "crdat", "DAT"]
# DBGrid1/2DrawColumnCell :1476 / :1515: STATUS -> ImageList1 index (img/cards/app_status_N.png, extracted from applicationpas.dfm:984)
STATUS_IMG = {1: 25, 2: 3, 3: 26, 4: 13}
DS = {"urgent": Q.LINES_URGENT, "simple": Q.LINES_SIMPLE}


def _st(ws) -> dict:
    return ws.module_state.setdefault("cards_app", {})


def _ap(ws) -> dict:
    s = _st(ws)
    if "dat1" not in s:
        raise LookupError("applications")
    return s


def _open(ws, name: str) -> list:
    """Close / Open (or Refresh) with the dataset's current SQL lines - SQL.Add / SQL[pos] := '' leave blank lines behind."""
    s = _st(ws)
    rows = ws.conn.query(Q.text(s["lines"][name]), {"dat1": s["dat1"]})
    s["rows"][name] = rows
    return rows


def _sort(ws, name: str, field: str) -> None:
    """Button6/7Click and DBGrid1/2TitleClick: SortPosition := SQL.Add('ORDER BY '+F); Refresh; SQL[SortPosition] := EmptyStr."""
    s = _st(ws)
    s["lines"][name].append("ORDER BY " + field)
    try:
        _open(ws, name)
    finally:
        s["lines"][name][-1] = ""


def _view(ws) -> dict:
    s = _st(ws)
    return {"date": s["dat1"].isoformat(), "cols": GRID_COLS, "status_img": STATUS_IMG,
            "urgent": [row(r) for r in s["rows"]["urgent"]], "simple": [row(r) for r in s["rows"]["simple"]]}


def open_form(ws) -> dict:
    """N9Click :1068 right card_application; FormShow :1444: DateTimePicker1 := Date; urgent / simple dat1 := trunc(Date); Open;
    Button6.Click / Button7.Click (hidden buttons) = an 'ORDER BY STATUS' Refresh of each grid."""
    ws.conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["card_application"], commit=False)
    s = _st(ws)
    s.clear()
    s.update(dat1=datetime.date.today(), lines={k: list(v) for k, v in DS.items()}, rows={})
    _open(ws, "urgent")
    _open(ws, "simple")
    _sort(ws, "urgent", "STATUS")
    _sort(ws, "simple", "STATUS")
    return _view(ws)


def refresh(ws, d: datetime.date) -> dict:
    """Button1Click :119 'YENİLƏ': urgent / simple Close, dat1 := trunc(DateTimePicker1), Open (no STATUS order now)."""
    s = _ap(ws)
    s["dat1"] = d
    _open(ws, "urgent")
    _open(ws, "simple")
    return _view(ws)


def sort(ws, grid: str, field: str) -> dict:
    """DBGrid1TitleClick :1590 / DBGrid2TitleClick :1611: Exit when the dataset is empty or the column has no FieldName."""
    s = _ap(ws)
    if grid not in DS:
        raise ValueError(grid)
    if s["rows"][grid] and field and field in GRID_COLS:
        _sort(ws, grid, field)
    return _view(ws)


def excel(ws, grid: str) -> bytes:
    """Button3Click :1458 (right card_excel1, urgent) / Button4Click :1467 (right card_excel2, simple):
    CMExcelExport1.ExportDataset(dataset, 'Application', True) - every field of the open dataset, a title row, sheet 'Application'.
    Delphi drives a live Excel; the web downloads the same sheet. The rows are the dataset as it is now (no reopen)."""
    s = _ap(ws)
    ws.conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["card_excel1" if grid == "urgent" else "card_excel2"], commit=False)
    from openpyxl import Workbook
    wb = Workbook()
    sh = wb.active
    sh.title = "Application"
    rows = s["rows"][grid]
    cols = [k for k in (rows[0].keys() if rows else []) if k not in ("ROWID",)]
    sh.append(cols)
    for r in rows:
        sh.append([r.get(c) for c in cols])
    bio = io.BytesIO()
    wb.save(bio)
    return bio.getvalue()


class RefreshIn(BaseModel):
    date: datetime.date


class SortIn(BaseModel):
    grid: str
    field: str


class GridIn(BaseModel):
    grid: str


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/cards/applications")
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

    @r.post("/sort")
    def _s(b: SortIn, ws=Depends(g)):
        return _fe(sort, ws, b.grid, b.field)

    @r.post("/excel")
    def _x(b: GridIn, ws=Depends(g)):
        if b.grid not in DS:
            err(400, "error.bad_request")
        data = _fe(excel, ws, b.grid)
        return Response(data, media_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                        headers={"Content-Disposition": 'attachment; filename="Application.xlsx"'})

    return r
