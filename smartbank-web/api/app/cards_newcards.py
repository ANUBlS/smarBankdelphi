"""Cards ▸ Prosedur ▸ Yeni kartlar (cards_azericard U9.pas TForm9 'New Cards'), opened by MAINFORMImpl1.pas N10Click :1082
(right card_newcard). DBGrid1 = DataMod_CARDS.newcard (Unit18.dfm:2491, verbatim in cards_sql.LINES_NEWCARD).

FormShow :86 newcard.Open; FormPaint :118 DBGrid1.DataSource.DataSet.Refresh (the web refreshes on open and after delete);
ToolButton1 'Silmək' :92: 'Kart silinsin?' Yes -> card_main.delete_application(current row id), Refresh either way, no right,
no commit; ToolButton7 'Excel' :105: CMExcelExport.ExportDataset(newcard, 'CARDS', True); ToolButton14 'Bağla' :100 close;
ToolButton21 'Axtarış' :69 toggles Panel4, whose eight edits have no event handlers (nothing is searched, as in Delphi).
ToolButton3 'Redaktə Etmək' is Visible = False with no OnClick. dgTitleClick has no OnTitleClick handler."""
from __future__ import annotations
import io

from fastapi import APIRouter, Depends, Response
from pydantic import BaseModel

from . import cards_sql as Q
from .cards import CLSID
from .customers import row

# U9.dfm DBGrid1 Columns: 21 with FieldName ('FIL' is not a newcard field: an empty column), 4 without (empty columns)
GRID_COLS = ["CARDNUMBER", "RBSNUMBER", "FNAME", "LNAME", "CARDHOLDER", "CREDIT_LIM", "CARDTYPE", "COMPANY", "FIL", "CURRENCY",
             "CARDSTATUS", "DATEOPEN", "EXPIRY", "EMBOSSNAME", "PASSPORT", "BIRTHDAY", "HOMEPHONE", "WORKPHONE", "ADDRESS",
             "RESIDENT", "ID", "", "", "", ""]
TITLES_NOFIELD = ["CREATED USER", "MODIFIED USER", "CREATE DATE", "MODIFY DATE"]
PANEL4 = ["EditCARDHOLDER", "EditRBSNUMBER", "EditCARDNUMBER", "EditCREDIT_LIM", "EditFNAME", "EditLNAME", "EditID", "EditPASSPORT"]


def _st(ws) -> dict:
    return ws.module_state.setdefault("cards_newcards", {})


def _open(ws) -> list:
    rows = ws.conn.query(Q.text(Q.LINES_NEWCARD))
    _st(ws)["rows"] = rows
    return rows


def _view(ws) -> dict:
    return {"cols": GRID_COLS, "titles_nofield": TITLES_NOFIELD, "panel4": PANEL4,
            "rows": [row(r) for r in _st(ws)["rows"]]}


def open_form(ws) -> dict:
    ws.conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["card_newcard"], commit=False)
    _open(ws)
    return _view(ws)


def delete(ws, rid: int | None, confirmed: bool) -> dict:
    """ToolButton1Click :92. The current row (DBGrid1.DataSource.DataSet) - FieldByName('id').AsInteger of an empty set = 0."""
    s = _st(ws)
    if "rows" not in s:
        raise LookupError("newcards")
    ids = [r.get("ID") for r in s["rows"]]
    if rid is not None and rid not in ids:
        raise ValueError(rid)
    if confirmed:
        cur = rid if rid is not None else (ids[0] if ids else None)
        ws.conn.call_proc("card_main", "delete_application", [int(cur or 0)], commit=False)
    _open(ws)                                              # DBGrid1.DataSource.DataSet.Refresh (Yes or No)
    return _view(ws)


def excel(ws) -> bytes:
    s = _st(ws)
    if "rows" not in s:
        raise LookupError("newcards")
    from openpyxl import Workbook
    wb = Workbook()
    sh = wb.active
    sh.title = "CARDS"
    rows = s["rows"]
    cols = [k for k in (rows[0].keys() if rows else []) if k != "ROWID"]
    sh.append(cols)
    for r in rows:
        sh.append([r.get(c) for c in cols])
    bio = io.BytesIO()
    wb.save(bio)
    return bio.getvalue()


class DeleteIn(BaseModel):
    id: int | None = None
    confirmed: bool = False


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/cards/newcards")
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

    @r.post("/delete")
    def _d(b: DeleteIn, ws=Depends(g)):
        return _fe(delete, ws, b.id, b.confirmed)

    @r.post("/excel")
    def _x(ws=Depends(g)):
        data = _fe(excel, ws)
        return Response(data, media_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                        headers={"Content-Disposition": 'attachment; filename="CARDS.xlsx"'})

    return r
