"""Cards - port of Delphi Packages/Cards_New/cards_azericard_turan_version (CARDS.dpr, TMAINFORM, CoClass MAINFORM).
Step 1: the main menu (MAINFORMImpl1.pas) and the card-holder list 'Müştərilər' (customers.pas Tclients over DataMod_CARDS.Clients).

The Delphi data module (Unit18.dfm) is shared by all forms of the OCX; the per-session state Delphi keeps on it (Clients SQL[25],
Filter, the TitleClick order line, the 'num' toggle) lives in ws.module_state['cards']. SQL: cards_sql.py (verbatim line lists).
Nothing the user types reaches SQL text: the edit boxes and the Filter panel only build a client-side TDataSet.Filter (as in Delphi),
and the TitleClick field name is checked against the grid's column FieldNames."""
from __future__ import annotations
import datetime

from fastapi import APIRouter, Depends
from pydantic import BaseModel

from . import cards_sql as Q
from . import tdataset_filter as TF
from .customers import row

CLSID = "{D5432094-E84C-4EAE-80FC-D02224B17B93}"     # CARDS_TLB.pas CLASS_MAINFORM

# customers.pas FormActivate :272-326 - SQL[25] for users without CARD_FIL_VIEW
FIL_LINE = "and b.filial  = (SELECT filialid FROM sba_objinf WHERE obj = (SELECT USER FROM DUAL))"

# dbGrid2 (customers.dfm:599, TabOrder 3, on top of DBGrid1 in Panel2 - the grid the user sees and the one SearchRecord uses)
GRID2_COLS = ["CARDNUMBER", "MULTIACC", "RBSNUMBER", "OLD_ACC_NO", "FNAME", "LNAME", "CARDHOLDER", "CREDIT_LIM", "CARDTYPE", "COMPANY",
              "FIL", "CURRENCY", "CARDSTATUS", "DATEOPEN", "EXPIRY", "EMBOSSNAME", "PASSPORT", "BIRTHDAY", "HOMEPHONE", "WORKPHONE",
              "ADDRESS", "RESIDENT", "ID", "CREAT", "MODI", "VERI", "DAT", "CRDAT"]
GRID2_HIDDEN = {"MULTIACC"}                                   # Visible = False
# persistent TFields of Clients (Unit18.dfm:4051-4300) - FieldByName in a Filter fails for others
CLIENT_FIELDS = {"ID", "ACCID", "CARDHOLDER", "FNAME", "LNAME", "PASSPORT", "BIRTHDAY", "HOMEPHONE", "WORKPHONE", "COUNTRY", "CITY",
                 "ADDRESS", "RESIDENT", "CARDNUMBER", "RBSNUMBER", "MAINCARD", "CURRENCY", "CARDTYPE", "CARDSTATUS", "CREDIT_LIM",
                 "DATEOPEN", "EXPIRY", "REFERENCE", "EMBOSSNAME", "COMPANY", "DATECLOSE", "SECURITY", "SEND", "CREATDATE", "FILE_NUM",
                 "MESSTYPE", "WITHP", "URG", "OTHTYPE", "OTHMEMBER", "OTHASSCOD", "OTHIDEN", "OTHEXPRY", "FILENAME", "CON_BALAN",
                 "BALAN_SIGN", "CARDREST", "RBSNUMBER2", "ACCID2", "REFINTEGER", "LANG_CODE", "FILIAL", "ISSUED_BY", "DOC_SINCE",
                 "CONTRACT_NUM", "KREDIT", "KLI_ID", "OP_ID", "TYPES", "TITUL", "STATUS", "DAT", "NMOD_OPID", "CRDAT", "RBSCLOSE",
                 "RBSCLOSEID", "TRANDATE", "FIL", "OLD_ACC_NO", "CREAT", "MODI", "MULTI_ACC", "MULTIACC", "VERI"}
# Panel4 edits: OnChange -> Filter := '<FIELD> = '''+Edit.Text+'*''' (customers.pas :342, :387, :987, :996, :1048, :1093, :1138)
EDIT_FIELDS = ("CARDNUMBER", "RBSNUMBER", "FNAME", "LNAME", "CARDHOLDER", "CREDIT_LIM", "OLD_ACC_NO")


def _st(ws) -> dict:
    return ws.module_state.setdefault("cards", {})


def _q(conn, lines, binds=None, **repl):
    return conn.query(Q.text(lines, **repl), binds or {})


def edit_filter(field: str, text: str) -> str:
    return field + " = '" + text + "*'"


def panel5_filter(c, d1: str, d2: str, fil: str, val: str, ktype: str, kstat: str, comp: str) -> str:
    """Button1Click customers.pas:1249-1376, verbatim (c = CheckBox1..6). Delphi's combination table is incomplete for some
    check box sets (e.g. 1+3+5: f3 stays empty, so the status condition is dropped) - kept as written."""
    c1, c2, c3, c4, c5, c6 = c
    tax = fax = vax = knax = ksax = cax = ""
    f1 = f2 = f3 = f4 = f5 = f6 = ""
    if c1:
        tax1 = "DATEOPEN >= '" + d1 + "'"
        tax2 = "EXPIRY <= '" + d2 + "'"
        tax = "(" + tax1 + ")" + " and (" + tax2 + ")"
    if c2:
        fax = "FIL = '" + fil + "'"
    if c3:
        vax = "CURRENCY = '" + val + "'"
    if c4:
        knax = "CARDTYPE = '" + ktype + "'"
    if c5:
        ksax = "CARDSTATUS = '" + kstat + "'"
    if c6:
        cax = "COMPANY = '" + comp + "'"
    n = lambda x: not x  # noqa: E731
    if c1: f1 = tax
    if n(c1) and c2: f1 = fax
    if n(c1) and n(c2) and c3: f1 = vax
    if n(c1) and n(c2) and n(c3) and c4: f1 = knax
    if n(c1) and n(c2) and n(c3) and n(c4) and c5: f1 = ksax
    if n(c1) and n(c2) and n(c3) and n(c4) and n(c5) and c6: f1 = cax
    if c1 and c2: f2 = fax
    if (n(c1) and c2 and c3) or (c1 and n(c2) and c3): f2 = vax
    if (n(c1) and n(c2) and c3 and c4) or (n(c1) and c2 and n(c3) and c4) or (c1 and n(c2) and n(c3) and c4): f2 = knax
    if ((n(c1) and n(c2) and n(c3) and c4 and c5) or (n(c1) and n(c2) and c3 and n(c4) and c5)
            or (n(c1) and c2 and n(c3) and n(c4) and c5) or (c1 and n(c2) and n(c3) and n(c4) and c5)):
        f2 = ksax
    if ((n(c1) and n(c2) and n(c3) and n(c4) and c5 and c6) or (n(c1) and n(c2) and n(c3) and c4 and n(c5) and c6)
            or (n(c1) and n(c2) and c3 and n(c4) and n(c5) and c6) or (n(c1) and c2 and n(c3) and n(c4) and n(c5) and c6)
            or (c1 and n(c2) and n(c3) and n(c4) and n(c5) and c6)):
        f2 = cax
    if c1 and c2 and c3: f3 = vax
    if n(c1) and c2 and c3 and c4: f3 = knax
    if n(c1) and n(c2) and c3 and c4 and c5: f3 = ksax
    if n(c1) and n(c2) and n(c3) and c4 and c5 and c6: f3 = cax
    if c1 and c2 and c3 and c4: f4 = knax
    if n(c1) and c2 and c3 and c4 and c5: f4 = ksax
    if n(c1) and n(c2) and c3 and c4 and c5 and c6: f4 = cax
    if c1 and c2 and c3 and c4 and c5: f5 = ksax
    if n(c1) and c2 and c3 and c4 and c5 and c6: f5 = cax
    if c1 and c2 and c3 and c4 and c5 and c6: f6 = cax
    if f1 != "" and f1 != tax:
        if c2 or c3 or c4 or c5 or c6:
            f1 = "(" + f1 + ")"
    if f2 != "": f2 = " and (" + f2 + ")"
    if f3 != "": f3 = " and (" + f3 + ")"
    if f4 != "": f4 = " and (" + f4 + ")"
    if f5 != "": f5 = " and (" + f5 + ")"
    if f6 != "": f6 = " and (" + f6 + ")"
    return f1 + f2 + f3 + f4 + f5 + f6


def _dts(d: datetime.date) -> str:
    """DateToStr with ShortDateFormat dd.mm.yyyy (Azerbaijani regional settings assumed - unverified)."""
    return d.strftime("%d.%m.%Y")


def _fetch(ws) -> list[dict]:
    """Clients open / Refresh with the session's SQL[25] and the TitleClick order line (SQL.Add after the last line)."""
    s = _st(ws)
    lines = list(Q.LINES_CLIENTS)
    lines[25] = s.get("sql25", "")
    if s.get("order"):
        lines.append(s["order"])
    return ws.conn.query(Q.text(lines), {})


def _view(ws, rows=None) -> dict:
    s = _st(ws)
    if rows is None:
        rows = s.get("rows") or []
    try:
        shown = TF.apply(rows, s.get("filter", ""), CLIENT_FIELDS)
        ferr = None
    except TF.FilterError as e:
        shown, ferr = [], str(e)
    return {"rows": [row(r) for r in shown], "filter": s.get("filter", ""), "filter_error": ferr, "count": len(shown)}


def open_clients(ws) -> dict:
    """MAINFORM N11Click :998 (right card_clients) -> Tclients.FormActivate customers.pas:272: CARD_FIL_VIEW = 1 -> Clients open as
    designed; otherwise SQL[25] := FIL_LINE and reopen (DOA closes the dataset when SQL changes). CARDSTYPE, CARDTYPES, statuscard,
    apptype open; num := 1. Clients is Filtered = True with an empty Filter. settings is Active in the dfm (dateclose for the colours)."""
    conn = ws.conn
    conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["card_clients"], commit=False)
    fil = conn.call_func("SB_ACA", "checkadvancedobjectaccess_func", ["CARD_FIL_VIEW"], int)
    s = _st(ws)
    s.clear()
    s.update(sql25="" if int(fil or 0) == 1 else FIL_LINE, order=None, num=1, filter="")
    s["rows"] = _fetch(ws)
    st = _q(conn, Q.LINES_SETTINGS)
    look = {
        "filial": [r["NAME"] for r in _q(conn, Q.LINES_FILIAL)],                 # DBLookupComboBox1 filialsource -> filial
        "valuta": [r["VAL_NAME"] for r in _q(conn, Q.LINES_VALUTA)],             # DBLookupComboBox2 valutasorce -> valuta
        "cardtype": [r["NAME"] for r in _q(conn, Q.LINES_CARDTYPES)],            # DBLookupComboBox3 CARDTYPESSOURCE
        "cardstatus": [r["CARDSTATUS"] for r in _q(conn, Q.LINES_STATUSCARD)],   # DBLookupComboBox4 statuscardsource
        "company": [r["COMPANY_NAME"] for r in _q(conn, Q.LINES_COMPANY)],       # DBLookupComboBox5 companysource -> COMPANY
    }
    return {"cols": GRID2_COLS, "hidden": sorted(GRID2_HIDDEN), "fil_view": int(fil or 0) == 1,
            "dateclose": int((st[0].get("DATECLOSE") if st else 0) or 0),
            "dord": int((st[0].get("DORD") if st else 0) or 0),          # MAINFORM PopupMenu1Popup: N13 'Verifikasiya' Visible = dord = 1 "today": datetime.date.today().isoformat(),
            "lookups": look, **_view(ws)}


def _need(ws):
    if not _st(ws).get("rows") and "sql25" not in _st(ws):
        open_clients(ws)


def set_edit_filter(ws, field: str, text: str) -> dict:
    """Panel4 TEdit OnChange: the last edited box replaces the whole Filter."""
    _need(ws)
    if field not in EDIT_FIELDS:
        raise ValueError(field)
    _st(ws)["filter"] = edit_filter(field, text)
    return _view(ws)


def set_panel_filter(ws, c, d1, d2, fil, val, ktype, kstat, comp) -> dict:
    """Button1Click: Filter := f1..f6; Filtered := true (Memo1 shows the text)."""
    _need(ws)
    _st(ws)["filter"] = panel5_filter(c, _dts(d1), _dts(d2), fil or "", val or "", ktype or "", kstat or "", comp or "")
    return _view(ws)


def refresh(ws) -> dict:
    """ToolButton14Click 'Yenilə' :737: Filter := 'RBSNUMBER = ''*''' (NULL RBSNUMBER rows are hidden by it), Close; Open.
    The TitleClick order line was already blanked after its Refresh, so the reopen has no ORDER BY."""
    _need(ws)
    s = _st(ws)
    s["filter"] = edit_filter("RBSNUMBER", "")
    s["order"] = None
    s["rows"] = _fetch(ws)
    return _view(ws)


def sort(ws, field: str) -> dict:
    """dbGrid2TitleClick :702: exit when empty or no FieldName; num = 1 -> 'ORDER BY f', num := 2, else '... desc', num := 1;
    Refresh; then SQL[pos] := '' (the next reopen has no order). Rows keep that order until the next Refresh / reopen."""
    _need(ws)
    s = _st(ws)
    if not s.get("rows") or field not in GRID2_COLS:
        return _view(ws)
    if s.get("num", 1) == 1:
        s["order"] = "ORDER BY " + field
        s["num"] = 2
    else:
        s["order"] = "ORDER BY " + field + "  desc"
        s["num"] = 1
    s["rows"] = _fetch(ws)
    s["order"] = None
    return _view(ws)


def delete(ws, rid: int, confirmed: bool) -> dict:
    """ToolButton1Click 'Silmək' :1385: right card_mdelete; 'Silmək istəyirsiniz?' Yes -> card_main.delnew(id); Refresh in both
    cases (outside the if). No commit (Delphi has none)."""
    _need(ws)
    conn = ws.conn
    conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["card_mdelete"], commit=False)
    if confirmed:
        conn.call_proc("card_main", "delnew", [rid], commit=False)
    s = _st(ws)
    s["rows"] = _fetch(ws)
    return _view(ws)


# ------------------------------------------------------------------------------------------------ router
class EditFilterIn(BaseModel):
    field: str
    text: str = ""


class PanelFilterIn(BaseModel):
    checks: list[bool]
    d1: datetime.date
    d2: datetime.date
    filial: str | None = None
    valuta: str | None = None
    cardtype: str | None = None
    cardstatus: str | None = None
    company: str | None = None


class SortIn(BaseModel):
    field: str


class DeleteIn(BaseModel):
    id: int
    confirmed: bool = False


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/cards")
    g = require_module(CLSID)

    @r.post("/clients/open")
    def _open(ws=Depends(g)):
        return open_clients(ws)

    @r.post("/clients/edit-filter")
    def _ef(b: EditFilterIn, ws=Depends(g)):
        if b.field not in EDIT_FIELDS:
            err(400, "error.bad_request")
        return set_edit_filter(ws, b.field, b.text)

    @r.post("/clients/filter")
    def _pf(b: PanelFilterIn, ws=Depends(g)):
        if len(b.checks) != 6:
            err(400, "error.bad_request")
        return set_panel_filter(ws, b.checks, b.d1, b.d2, b.filial, b.valuta, b.cardtype, b.cardstatus, b.company)

    @r.post("/clients/refresh")
    def _rf(ws=Depends(g)):
        return refresh(ws)

    @r.post("/clients/sort")
    def _so(b: SortIn, ws=Depends(g)):
        return sort(ws, b.field)

    @r.post("/clients/delete")
    def _de(b: DeleteIn, ws=Depends(g)):
        return delete(ws, b.id, b.confirmed)

    return r
