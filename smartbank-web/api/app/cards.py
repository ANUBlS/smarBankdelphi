"""Cards - port of Delphi Packages/Cards_New/cards_azericard (the production build, confirmed by the user; CARDS.dpr, TMAINFORM,
CoClass MAINFORM).
Step 1: the main menu (MAINFORMImpl1.pas) and the card-holder list 'Müştərilər' (customers.pas Tclients over DataMod_CARDS.Clients).

The Delphi data module (Unit18.dfm) is shared by all forms of the OCX; the per-session state Delphi keeps on it (Clients
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

# dbGrid2 (customers.dfm:615, TabOrder 3, on top of DBGrid1 in Panel2 - the grid the user sees and the one SearchRecord uses).
# cards_azericard: MULTIACC is visible (3rd column), there is no VERI column (the Turan copy hides MULTIACC and shows VERI).
GRID2_COLS = ["CARDNUMBER", "RBSNUMBER", "MULTIACC", "OLD_ACC_NO", "FNAME", "LNAME", "CARDHOLDER", "CREDIT_LIM", "CARDTYPE", "COMPANY",
              "FIL", "CURRENCY", "CARDSTATUS", "DATEOPEN", "EXPIRY", "EMBOSSNAME", "PASSPORT", "BIRTHDAY", "HOMEPHONE", "WORKPHONE",
              "ADDRESS", "RESIDENT", "ID", "CREAT", "MODI", "DAT", "CRDAT"]
GRID2_HIDDEN: set[str] = set()
# persistent TFields of Clients (Unit18.dfm:3247 Clients, cards_azericard) - FieldByName in a Filter fails for others
CLIENT_FIELDS = {"ID", "ACCID", "CARDHOLDER", "FNAME", "LNAME", "PASSPORT", "BIRTHDAY", "HOMEPHONE", "WORKPHONE", "COUNTRY", "CITY",
                 "ADDRESS", "RESIDENT", "CARDNUMBER", "RBSNUMBER", "MAINCARD", "CURRENCY", "CARDTYPE", "CARDSTATUS", "CREDIT_LIM",
                 "DATEOPEN", "EXPIRY", "REFERENCE", "EMBOSSNAME", "COMPANY", "DATECLOSE", "SECURITY", "SEND", "CREATDATE", "FILE_NUM",
                 "MESSTYPE", "WITHP", "URG", "OTHTYPE", "OTHMEMBER", "OTHASSCOD", "OTHIDEN", "OTHEXPRY", "FILENAME", "CON_BALAN",
                 "BALAN_SIGN", "CARDREST", "RBSNUMBER2", "ACCID2", "REFINTEGER", "LANG_CODE", "FILIAL", "ISSUED_BY", "DOC_SINCE",
                 "CONTRACT_NUM", "KREDIT", "KLI_ID", "OP_ID", "TYPES", "TITUL", "STATUS", "DAT", "NMOD_OPID", "CRDAT", "RBSCLOSE",
                 "RBSCLOSEID", "TRANDATE", "FIL", "OLD_ACC_NO", "CREAT", "MODI", "MULTI_ACC", "MULTIACC", "MULTIVAL"}
# Panel4 edits: OnChange -> Filter := '<FIELD> = '''+Edit.Text+'*''' (customers.pas :293, :338, :876, :885, :937, :982, :1027)
EDIT_FIELDS = ("CARDNUMBER", "RBSNUMBER", "FNAME", "LNAME", "CARDHOLDER", "CREDIT_LIM", "OLD_ACC_NO")


def _st(ws) -> dict:
    return ws.module_state.setdefault("cards", {})


def _q(conn, lines, binds=None, **repl):
    return conn.query(Q.text(lines, **repl), binds or {})


def edit_filter(field: str, text: str) -> str:
    return field + " = '" + text + "*'"


def panel5_filter(c, d1: str, d2: str, fil: str, val: str, ktype: str, kstat: str, comp: str) -> str:
    """Button1Click customers.pas:1138-1273, verbatim (c = CheckBox1..6). Delphi's combination table is incomplete for some
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
    """Clients open / Refresh as designed (Unit18.dfm:3247) plus the TitleClick order line (SQL.Add after the last line)."""
    s = _st(ws)
    lines = list(Q.LINES_CLIENTS)
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
    """MAINFORM N11Click :1007 (right card_clients) -> Tclients.FormActivate customers.pas:271: Clients, CARDSTYPE, CARDTYPES,
    statuscard, apptype open; num := 1. cards_azericard has no CARD_FIL_VIEW branch (that is Turan-only): every user sees all
    filials. Clients is Filtered = True with an empty Filter. settings is Active in the dfm (dateclose for the colours)."""
    conn = ws.conn
    conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["card_clients"], commit=False)
    s = _st(ws)
    s.clear()
    s.update(opened=True, order=None, num=1, filter="", xfilter="")
    s["rows"] = _fetch(ws)
    st = _q(conn, Q.LINES_SETTINGS)
    look = {
        "filial": [r["NAME"] for r in _q(conn, Q.LINES_FILIAL)],                 # DBLookupComboBox1 filialsource -> filial
        "valuta": [r["VAL_NAME"] for r in _q(conn, Q.LINES_VALUTA)],             # DBLookupComboBox2 valutasorce -> valuta
        "cardtype": [r["NAME"] for r in _q(conn, Q.LINES_CARDTYPES)],            # DBLookupComboBox3 CARDTYPESSOURCE
        "cardstatus": [r["CARDSTATUS"] for r in _q(conn, Q.LINES_STATUSCARD)],   # DBLookupComboBox4 statuscardsource
        "company": [r["COMPANY_NAME"] for r in _q(conn, Q.LINES_COMPANY)],       # DBLookupComboBox5 companysource -> COMPANY
    }
    return {"cols": GRID2_COLS, "hidden": sorted(GRID2_HIDDEN),
            "dateclose": int((st[0].get("DATECLOSE") if st else 0) or 0),
            "dord": int((st[0].get("DORD") if st else 0) or 0),          # MAINFORM PopupMenu1Popup :1273: N13 'Verifikasiya' Visible = dord = 1
            "today": datetime.date.today().isoformat(),
            "lookups": look, **_view(ws)}


def _need(ws):
    if not _st(ws).get("opened"):
        open_clients(ws)


def set_edit_filter(ws, field: str, text: str) -> dict:
    """Panel4 TEdit OnChange: the last edited box replaces the whole Filter."""
    _need(ws)
    if field not in EDIT_FIELDS:
        raise ValueError(field)
    _st(ws)["filter"] = edit_filter(field, text)
    return _view(ws)


def set_panel_filter(ws, c, d1, d2, fil, val, ktype, kstat, comp) -> dict:
    """Button1Click :1138: Filter := f1..f6; Filtered := true (Memo1 shows the text); cards_azericard also sets
    cliexcel.Filter to the same text (:1263), which the Excel export uses."""
    _need(ws)
    f = panel5_filter(c, _dts(d1), _dts(d2), fil or "", val or "", ktype or "", kstat or "", comp or "")
    _st(ws)["filter"] = f
    _st(ws)["xfilter"] = f
    return _view(ws)


def refresh(ws) -> dict:
    """ToolButton14Click 'Yenilə' :624: Filter := 'RBSNUMBER = ''*''' (NULL RBSNUMBER rows are hidden by it), Close; Open.
    The TitleClick order line was already blanked after its Refresh, so the reopen has no ORDER BY."""
    _need(ws)
    s = _st(ws)
    s["filter"] = edit_filter("RBSNUMBER", "")
    s["order"] = None
    s["rows"] = _fetch(ws)
    return _view(ws)


def sort(ws, field: str) -> dict:
    """dbGrid2TitleClick :589: exit when empty or no FieldName; num = 1 -> 'ORDER BY f', num := 2, else '... desc', num := 1;
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
    """ToolButton1Click 'Silmək' :1275: right card_mdelete; 'Silmək istəyirsiniz?' Yes -> mainpacket (card_main, Unit18.dfm:1141).delnew(id); Refresh in both
    cases (outside the if). No commit (Delphi has none)."""
    _need(ws)
    conn = ws.conn
    conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["card_mdelete"], commit=False)
    if confirmed:
        conn.call_proc("card_main", "delnew", [rid], commit=False)
    s = _st(ws)
    s["rows"] = _fetch(ws)
    return _view(ws)


# ------------------------------------------------------------------------------------------------ Tclients2 (Unitclient2.pas)
# DBGrid5 'Kartlar' (clientcardssource -> cliencards) and DBGrid6 (CARDOPERATIONSOURCE -> CARDOPERATION) columns, Unitclient2.dfm
GRID5_COLS = ["TIP", "CARDNUMBER", "RBSNUMBER", "FNAME", "LNAME", "CARDHOLDER", "CREDIT_LIM", "CARDTYPE", "COMPANY", "FIL", "CURRENCY",
              "CARDSTATUS", "DATEOPEN", "EXPIRY", "EMBOSSNAME", "PASSPORT", "BIRTHDAY", "HOMEPHONE", "WORKPHONE", "ADDRESS", "RESIDENT",
              "ID", "CREAT", "MODI", "DAT", "CRDAT"]
GRID6_COLS = ["EMELIYYAT", "CARDNUMBER", "RBSNUMBER", "RBSCLOSE", "FNAME", "LNAME", "CARDHOLDER", "CREDIT_LIM", "CARDTYPE", "COMPANY",
              "FIL", "CURRENCY", "CARDSTATUS", "DATEOPEN", "EXPIRY", "EMBOSSNAME", "PASSPORT", "BIRTHDAY", "HOMEPHONE", "WORKPHONE",
              "ADDRESS", "RESIDENT", "ID", "CREAT", "MODI", "DAT", "CRDAT"]
# edit box -> Clients field, as FormActivate :172 (EDIT branch) fills them
FORM_FIELDS = {"Edit15": "FNAME", "Edit16": "LNAME", "Edit18": "PASSPORT", "DateTimePicker7": "BIRTHDAY", "Edit17": "HOMEPHONE",
               "Edit27": "WORKPHONE", "Edit20": "COUNTRY", "Edit19": "CITY", "Edit22": "ADDRESS", "ComboBox4": "RESIDENT",
               "ComboBox1": "CARDTYPE", "ComboBox12": "CARDSTATUS", "Edit28": "CREDIT_LIM", "DateTimePicker5": "DATEOPEN",
               "DateTimePicker6": "EXPIRY", "DateTimePicker8": "EXPIRY", "Edit26": "REFERENCE", "Edit23": "EMBOSSNAME",
               "ComboBox2": "COMPANY", "Edit25": "SECURITY", "Edit21": "LANG_CODE", "ComboBox11": "TYPES", "ComboBox10": "TITUL",
               "Edit24": "CARDNUMBER"}


def _fs(v) -> str:
    """Field.AsString for the edit boxes (dates as DateToStr)."""
    if isinstance(v, datetime.datetime):
        return v.date().isoformat()
    return _asstr(v)


def form_open(ws, mode: str, rid: int | None = None) -> dict:
    """isertbtnClick :208 (right card_madd) / ToolButton3Click :228 (right card_medit) -> Tclients2 (Unitclient2.pas).
    FormShow :2254: CARDTYPES names into ComboBox1; Edit19 'BAKU', Edit20 'AZE', Edit21 'AZE', ComboBox12 'CARD OK'.
    FormActivate :172: apptype -> ComboBox9 (' ' first); NEW clears and enables the boxes (dates = Date, ComboBox4 'RESIDENT',
    Edit28 '0' disabled); EDIT fills them from the current Clients row, all disabled, and opens multicount / hesab / cliencards /
    CARDOPERATION (by Clients.multi_acc), editval, cariqaliq2 (by ACCID) and allclientcredits (by DBLookupComboBox6.Text).
    ComboBox5 := 'WITH' in both. Read-only in the web for now: saving (Button2Click :676) is the next step."""
    _need(ws)
    conn = ws.conn
    if mode not in ("NEW", "EDIT"):
        raise ValueError(mode)
    if mode == "NEW":
        conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["card_madd"], commit=False)
    else:
        conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["card_medit"], commit=False)
    apptype = [" "] + [_asstr(r.get("TYPE")) for r in _q(conn, Q.LINES_APPTYPE)]
    cardtypes = [_asstr(r.get("NAME")) for r in _q(conn, Q.LINES_CARDTYPES)]
    today = datetime.date.today().isoformat()
    f = {"Edit19": "BAKU", "Edit20": "AZE", "Edit21": "AZE", "ComboBox12": "CARD OK", "ComboBox5": "WITH"}
    out = {"mode": mode, "apptype": apptype, "cardtypes": cardtypes, "cards": [], "operations": [], "credits": [], "accounts": [],
           "grid5": GRID5_COLS, "grid6": GRID6_COLS, "multicard": False, "button3": mode == "EDIT"}
    if mode == "NEW":
        for k in FORM_FIELDS:
            if k not in f:
                f[k] = ""
        f.update(ComboBox12="CARD OK", ComboBox4="RESIDENT", Edit28="0", DateTimePicker5=today, DateTimePicker6=today,
                 DateTimePicker7=today, DateTimePicker8=today, Edit14="", Edit29="", Edit33="", DBLookupComboBox6="")
        out.update(fields=f, enabled=True)
        return out
    cur = next((r for r in _st(ws).get("rows") or [] if r.get("ID") == rid), None)
    if cur is None:
        raise LookupError(rid)
    multi = cur.get("MULTI_ACC")
    mc = _q(conn, Q.LINES_MULTICOUNT, {"rbs": multi})
    out["multicard"] = int((mc[0].get("MULTI") if mc else 0) or 0) > 1               # CheckBox4 'MultiCard'
    hes = _q(conn, Q.LINES_HESAB, {"CID": None, "p_AccNO": multi})
    out["accounts"] = [r.get("ACC_NO") for r in hes]
    out["cards"] = [row(r) for r in _q(conn, Q.LINES_CLIENCARDS, {"numb": multi})]
    out["operations"] = [row(r) for r in _q(conn, Q.LINES_CARDOPERATION, {"RBS": multi})]
    ev = _q(conn, Q.LINES_EDITVAL, {"RBSNUMBER": multi})
    car = _q(conn, Q.LINES_CARIQALIQ2, {"acc_id": cur.get("ACCID")})
    lookup_text = multi if multi in out["accounts"] else ""          # DBLookupComboBox6.Text = KeyValue when it is in the hesab list
    out["credits"] = [row(r) for r in _q(conn, Q.LINES_ALLCLIENTCREDITS, {"rbsnumber": lookup_text})]
    for k, col in FORM_FIELDS.items():
        f[k] = _fs(cur.get(col))
        if k.startswith("DateTimePicker"):
            v = f[k]                                     # .AsDateTime into a picker; a string field goes through StrToDate (dd.mm.yyyy)
            if len(v) >= 10 and v[2] == "." and v[5] == ".":
                v = v[6:10] + "-" + v[3:5] + "-" + v[0:2]
            f[k] = v[:10]
    f.update(Edit14=str(int((hes[0].get("KLI_ID") if hes else 0) or 0)),                 # inttostr(hesab.kli_id.AsInteger)
             Edit29=_asstr(ev[0].get("VAL_NAME")) if ev else "", DBLookupComboBox6=lookup_text,
             DBEdit17=_asstr(car[0].get("OSTAT")) if car else "")                        # Edit33 is hidden at the end; DBEdit17 shows OSTAT
    out.update(fields=f, enabled=False)
    return out


# toexcelExecute customers.pas:672-776 header row (Cells[1, 1..28]) and the cliexcel field per column
EXCEL_COLS = [(" #", None), ("RBSNUMBER", "RBSNUMBER"), ("CARDHOLDER", "CARDHOLDER"), ("CARDNUMBER", "CARDNUMBER"), ("FIRST NAME", "FNAME"),
              ("LAST NAME", "LNAME"), ("CURRENCY", "CURRENCY"), ("CARDTYPE", "CARDTYPE"), ("CARDSTATUS", "CARDSTATUS"),
              ("PASSPORT", "PASSPORT"), ("ISSUED_BY", "ISSUED_BY"), ("DOC_SINCE", "DOC_SINCE"), ("BIRTHDAY", "BIRTHDAY"),
              ("HOMEPHONE", "HOMEPHONE"), ("WORKPHONE", "WORKPHONE"), ("CREDIT_LIM", "CREDIT_LIM"), ("RESIDENT", "RESIDENT"),
              ("COUNTRY", "COUNTRY"), ("CITY", "CITY"), ("ADDRESS", "ADDRESS"), ("DATEOPEN", "DATEOPEN"), ("EXPIRY", "EXPIRY"),
              ("REFERENCE", "REFERENCE"), ("EMBOSSNAME", "EMBOSSNAME"), ("COMPANY", "COMPANY"), ("CONTRACT_NUM", "CONTRACT_NUM"),
              ("TYPES", "TYPES"), ("OLD_ACCOUNT", "OLD_ACC_NO")]
EXCEL_TEXT_COLS = {2, 4, 5, 28}           # NUMBERFORMAT := '@'
EXCEL_WIDTH20 = {2, 3, 4, 8}              # ColumnWidth := 20


def _asstr(v) -> str:
    if v is None:
        return ""
    if isinstance(v, datetime.datetime):
        return _dts(v.date()) + ("" if v.time() == datetime.time() else " " + v.strftime("%H:%M:%S"))
    if isinstance(v, float) and v.is_integer():
        return str(int(v))
    return str(v)


def excel(ws) -> bytes:
    """ToolButton7Click :778 (no right check - the card_mexcel line is commented out): Clients.QueryAllRecords := true; Refresh;
    toexcel.Execute; QueryAllRecords := False; Refresh. toexcelExecute :672: cliexcel Close/Open - its own dataset
    (Unit18.dfm:4935, WHERE s.multiacc is null ORDER BY s.rbsnumber), Filtered = True with the Filter Button1Click last set
    (the Panel4 edit boxes and 'Yenilə' do not touch it). Delphi fills a live Excel instance; the web returns the same sheet as .xlsx."""
    import io
    from openpyxl import Workbook
    from openpyxl.styles import Font
    from openpyxl.utils import get_column_letter
    _need(ws)
    s = _st(ws)
    s["rows"] = _fetch(ws)                       # the two Clients.Refresh calls (no ORDER BY - the TitleClick line is blank)
    xrows = _q(ws.conn, Q.LINES_CLIEXCEL)
    fields = {k.upper() for r in xrows for k in r} or {c for _, c in EXCEL_COLS if c}
    xrows = TF.apply(xrows, s.get("xfilter", ""), fields)
    wb = Workbook()
    sh = wb.active
    for ci, (h, _) in enumerate(EXCEL_COLS, 1):
        c = sh.cell(1, ci, h)
        c.font = Font(bold=True, color="FF0000")              # Selection.Font.BOLD := TRUE; COLOR := clRed
    for ri, r in enumerate(xrows, 2):
        sh.cell(ri, 1, ri - 1)
        for ci, (_, f) in enumerate(EXCEL_COLS[1:], 2):
            v = r.get(f)
            if f in ("DATEOPEN", "EXPIRY"):                    # .AsDateTime (NULL -> 0 = 30.12.1899)
                cell = sh.cell(ri, ci, v if isinstance(v, datetime.datetime) else datetime.datetime(1899, 12, 30))
                cell.number_format = "dd.mm.yyyy"
            else:
                cell = sh.cell(ri, ci, _asstr(v))
            if ci in EXCEL_TEXT_COLS:
                cell.number_format = "@"
    for ci in EXCEL_WIDTH20:
        sh.column_dimensions[get_column_letter(ci)].width = 20
    bio = io.BytesIO()
    wb.save(bio)
    return bio.getvalue()


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


class FormIn(BaseModel):
    mode: str
    id: int | None = None


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

    @r.post("/clients/excel")
    def _xl(ws=Depends(g)):
        from fastapi import Response
        return Response(excel(ws), media_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                        headers={"Content-Disposition": 'attachment; filename="CARDS.xlsx"'})

    @r.post("/clients/form")
    def _fo(b: FormIn, ws=Depends(g)):
        if b.mode not in ("NEW", "EDIT"):
            err(400, "error.bad_request")
        try:
            return form_open(ws, b.mode, b.id)
        except LookupError:
            err(404, "error.not_found")

    @r.post("/clients/delete")
    def _de(b: DeleteIn, ws=Depends(g)):
        return delete(ws, b.id, b.confirmed)

    return r
