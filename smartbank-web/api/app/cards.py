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
from . import cards_cb9 as CB9
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
    # FormCreate :1497 runs button1.Click (Button1Click :583, right card_client_new) before FormActivate
    conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["card_client_new"], commit=False)
    if mode == "NEW":
        conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["card_madd"], commit=False)
    else:
        conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["card_medit"], commit=False)
    apptype = [" "] + [_asstr(r.get("TYPE")) for r in _q(conn, Q.LINES_APPTYPE)]
    cardtypes = [_asstr(r.get("NAME")) for r in _q(conn, Q.LINES_CARDTYPES)]
    today = datetime.date.today().isoformat()
    f = {"Edit19": "BAKU", "Edit20": "AZE", "Edit21": "AZE", "ComboBox12": "CARD OK", "ComboBox5": "WITH"}
    out = {"mode": mode, "apptype": apptype, "companies": [_asstr(r.get("COMPANY_NAME")) for r in _q(conn, Q.LINES_COMPANI)],
           "cb9": {k: v["enabled"] for k, v in CB9.BRANCHES.items()}, "required": REQUIRED,
           "dbedit18": _st(ws).get("valut2", ""), "cardtypes": cardtypes, "cards": [], "operations": [], "credits": [], "accounts": [],
           "grid5": GRID5_COLS, "grid6": GRID6_COLS, "multicard": False, "button3": mode == "EDIT"}
    if mode == "NEW":
        for k in FORM_FIELDS:
            if k not in f:
                f[k] = ""
        f.update(ComboBox12="CARD OK", ComboBox4="RESIDENT", Edit28="0", DateTimePicker5=today, DateTimePicker6=today,
                 DateTimePicker7=today, DateTimePicker8=today, Edit14="", Edit29="", Edit33="", DBLookupComboBox6="")
        out.update(fields=f, enabled=True)
        _form_state(ws, "NEW", [], [])
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
    _form_state(ws, "EDIT", hes, out["cards"], cur)
    _fs_need(ws).update(ops_rbs=multi, ops=[r.get("id") for r in out["operations"]], credits=[r.get("id") for r in out["credits"]])
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


class Cb9In(BaseModel):
    text: str
    edit14: str = ""
    dtp8: datetime.date | None = None


class Edit14In(BaseModel):
    edit14: str


class AccIn(BaseModel):
    acc: str
    edit14: str = ""
    event: str = "change"


class Button3In(BaseModel):
    card_id: int | None = None


class SaveIn(BaseModel):
    fields: dict[str, str]
    checkbox2: bool = False
    checkbox3: bool = False
    checkbox4: bool = False
    combobox9: str = ""
    confirmed: bool = False


class FormIn(BaseModel):
    mode: str
    id: int | None = None


class IdIn(BaseModel):
    id: int


class ComboEnterIn(BaseModel):
    combo: str
    items: list[str] = []
    item_index: int = -1


class MultiIn(BaseModel):
    multi1: bool = False
    multi2: bool = False
    acc1: str = ""
    acc2: str = ""


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

    def _fe(fn, *a):
        try:
            return fn(*a)
        except LookupError:
            err(409, "error.bad_request")

    @r.post("/clients/form/new")
    def _b1(ws=Depends(g)):
        return _fe(button1, ws)

    @r.post("/clients/form/edit")
    def _b3(b: Button3In, ws=Depends(g)):
        return _fe(button3, ws, b.card_id)

    @r.post("/clients/form/apptype")
    def _c9(b: Cb9In, ws=Depends(g)):
        return _fe(combobox9, ws, b.text, b.edit14, b.dtp8)

    @r.post("/clients/form/edit14")
    def _e14(b: Edit14In, ws=Depends(g)):
        return _fe(edit14_enter, ws, b.edit14)

    @r.post("/clients/form/account")
    def _acc(b: AccIn, ws=Depends(g)):
        if b.event not in ("change", "click"):
            err(400, "error.bad_request")
        return _fe(account_select, ws, b.acc, b.edit14, b.event)

    @r.post("/clients/form/save")
    def _sv(b: SaveIn, ws=Depends(g)):
        bad = set(b.fields) - set(SAVE_FIELDS)
        if bad:
            err(400, "error.bad_request")
        return _fe(save, ws, b)

    @r.post("/clients/form/card-click")
    def _g5(b: Button3In, ws=Depends(g)):
        return _fe(grid5_click, ws, b.card_id)

    @r.post("/clients/form/credit-info")
    def _g1(b: IdIn, ws=Depends(g)):
        return _fe(credit_info, ws, b.id)

    @r.post("/clients/form/delete-application")
    def _sil(b: IdIn, ws=Depends(g)):
        return _fe(delete_application, ws, b.id)

    @r.post("/clients/form/combo-enter")
    def _ce(b: ComboEnterIn, ws=Depends(g)):
        if b.combo not in ("ComboBox1", "ComboBox2"):
            err(400, "error.bad_request")
        return _fe(combo_enter, ws, b.combo, b.items, b.item_index)

    @r.post("/clients/form/multi/open")
    def _mo(ws=Depends(g)):
        return _fe(multi_open, ws)

    @r.post("/clients/form/multi/save")
    def _ms(b: MultiIn, ws=Depends(g)):
        return _fe(multi_save, ws, b)

    @r.post("/clients/delete")
    def _de(b: DeleteIn, ws=Depends(g)):
        return delete(ws, b.id, b.confirmed)

    return r


# ------------------------------------------------------------------------------------------------ Tclients2 actions (step 2b)
# TEdit / TComboBox / TDBLookupComboBox with Color = clAqua in Unitclient2.dfm - the Button2Click :689 'Rəngli xanalar' loop
# (DateTimePicker2 is clAqua too but is a TDateTimePicker, which the loop does not test; DBLookupComboBox6 is a TDBLookupComboboxEh)
REQUIRED = ["Edit15", "Edit16", "Edit18", "Edit19", "Edit20", "Edit21", "Edit22", "Edit23", "Edit25", "ComboBox4", "ComboBox1"]
SAVE_FIELDS = ["Edit14", "Edit15", "Edit16", "Edit17", "Edit18", "Edit19", "Edit20", "Edit21", "Edit22", "Edit23", "Edit24", "Edit25",
               "Edit26", "Edit27", "Edit28", "ComboBox1", "ComboBox2", "ComboBox4", "ComboBox5", "ComboBox10", "ComboBox11", "ComboBox12",
               "DBLookupComboBox6", "DateTimePicker2", "DateTimePicker5", "DateTimePicker6", "DateTimePicker7", "DateTimePicker8",
               "Edit29", "Edit33", "DBEdit17", "Edit_acc_name"]


def _form_state(ws, edit1: str, hes: list, cards: list, cur: dict | None = None):
    s = _st(ws)
    s["form"] = {"edit1": edit1, "edit2": "", "dtp1": None, "hesab": list(hes), "hcur": 0, "cards": list(cards), "cur": cur}


def _fs_need(ws) -> dict:
    f = _st(ws).get("form")
    if f is None:
        raise LookupError("form")
    return f


def _hesab(ws, cid, accno) -> list:
    """hesab Close; SetVariable('CID'..); SetVariable('p_AccNO'..); Open (Unit18.dfm hesab). CID is a NUMBER compared with kli_id:
    the digits are bound as an int (Oracle converts the Delphi string the same way)."""
    if isinstance(cid, str):
        cid = int(cid) if cid.strip().lstrip("-").isdigit() else cid
    f = _fs_need(ws)
    f["hesab"] = _q(ws.conn, Q.LINES_HESAB, {"CID": cid, "p_AccNO": accno})
    f["hcur"] = 0
    return f["hesab"]


def _new_cust_name(ws, kid) -> str:
    r = _q(ws.conn, Q.LINES_NEW_CUST, {"kid": kid})
    return _asstr(r[0].get("NAME")) if r else ""


def button1(ws) -> dict:
    """Button1Click :583 'YENI': right card_client_new; Edit1 := 'NEW'; grids closed; boxes cleared/enabled; RESIDENT/BAKU/AZE/AZE/
    CARD OK; Edit28 '' then disabled (Edit28.Text := '0' is overwritten by Edit28.Text := '' at :628); dates := Date; DBEdit18 := ''."""
    _need(ws)
    ws.conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["card_client_new"], commit=False)
    _fs_need(ws)
    today = datetime.date.today().isoformat()
    f = {k: "" for k in SAVE_FIELDS}
    f.update(ComboBox4="RESIDENT", Edit19="BAKU", Edit20="AZE", Edit21="AZE", ComboBox12="CARD OK", DateTimePicker5=today,
             DateTimePicker6=today, DateTimePicker7=today, DateTimePicker8=today)
    for k in ("ComboBox5", "DateTimePicker2"):
        f.pop(k)                                         # not touched by Button1Click
    _st(ws)["valut2"] = ""                              # DBEdit18.Text := '' (the vsource field is cleared)
    _form_state(ws, "NEW", [], [])
    en = {k: True for k in ("Edit15", "Edit16", "Edit18", "DateTimePicker7", "Edit17", "Edit27", "Edit20", "Edit19", "Edit22", "ComboBox4",
                            "DBLookupComboBox6", "ComboBox1", "ComboBox12", "DateTimePicker8", "Edit23", "ComboBox2", "Edit25", "Edit21",
                            "CheckBox2", "Edit14", "ComboBox11", "ComboBox10", "Edit33")}
    en.update(Edit26=False, ComboBox9=False, Edit28=False)
    return {"fields": f, "enabled": en, "cards": [], "operations": [], "credits": [], "dbedit18": "", "checkbox2": False}


def button3(ws, card_id) -> dict:
    """Button3Click :1506 'REDAKTƏ ET': right card_client_edit; Edit1 := 'EDIT'; DBLookupComboBox6.KeyValue := Clients.multi_acc;
    the boxes are filled from the DBGrid5 (cliencards) current row - DateTimePicker5 gets DATEOPEN then EXPIRY (:1557-1558, as in
    Delphi; DateTimePicker8 is not touched); everything disabled except ComboBox9 and the grids; ComboBox5 := 'WITH'."""
    _need(ws)
    ws.conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["card_client_edit"], commit=False)
    fs = _fs_need(ws)
    cards = fs["cards"]
    c = next((x for x in cards if x.get("id") == card_id), cards[0] if cards else None) if cards else None
    g = (lambda k: _fs((c or {}).get(k.lower())))
    cur = fs.get("cur") or {}
    f = {"DBLookupComboBox6": _asstr(cur.get("MULTI_ACC"))}
    for k, col in (("Edit15", "FNAME"), ("Edit16", "LNAME"), ("Edit18", "PASSPORT"), ("Edit17", "HOMEPHONE"), ("Edit27", "WORKPHONE"),
                   ("Edit20", "COUNTRY"), ("Edit19", "CITY"), ("Edit22", "ADDRESS"), ("ComboBox4", "RESIDENT"), ("ComboBox1", "CARDTYPE"),
                   ("ComboBox12", "CARDSTATUS"), ("Edit28", "CREDIT_LIM"), ("Edit26", "REFERENCE"), ("Edit23", "EMBOSSNAME"),
                   ("ComboBox2", "COMPANY"), ("Edit25", "SECURITY"), ("Edit21", "LANG_CODE"), ("ComboBox11", "TYPES"),
                   ("ComboBox10", "TITUL"), ("Edit24", "CARDNUMBER")):
        f[k] = g(col)
    def d(col):                                          # .AsDateTime of NULL = 0 = 30.12.1899
        v = (c or {}).get(col.lower())
        return (v.date() if isinstance(v, datetime.datetime) else datetime.date(1899, 12, 30)).isoformat()
    f["DateTimePicker7"] = d("BIRTHDAY")
    f["DateTimePicker5"] = d("EXPIRY")
    f["ComboBox5"] = "WITH"
    fs["edit1"] = "EDIT"
    off = ("Edit15", "Edit16", "Edit18", "DateTimePicker7", "Edit17", "Edit27", "Edit20", "Edit19", "Edit22", "ComboBox4", "DBLookupComboBox6",
           "ComboBox1", "ComboBox12", "Edit28", "DateTimePicker8", "Edit26", "Edit23", "ComboBox2", "Edit25", "Edit21", "CheckBox2", "Edit14",
           "ComboBox11", "ComboBox10", "ComboBox8", "ComboBox5")
    en = {k: False for k in off}
    en["ComboBox9"] = True
    return {"fields": f, "enabled": en, "checkbox2": False}


def combobox9(ws, text: str, edit14: str, dtp8) -> dict:
    """ComboBox9Click :1652 (application type): edit2 := the message type and the Enabled deltas of cards_cb9.BRANCHES; 'Prolongation'
    keeps DateTimePicker1 := DateTimePicker8; 'RBS Change' reopens hesab by the customer (CID = Edit14, p_AccNO NULL),
    DBLookupComboBox6.Text := '' and, with rows, Edit_acc_name := new_cust(Edit14).name."""
    _need(ws)
    fs = _fs_need(ws)
    b = CB9.BRANCHES.get(text)
    out = {"enabled": {}, "fields": {}}
    if b is None:
        return out
    fs["edit2"] = b["edit2"]
    out["enabled"] = dict(b["enabled"])
    if text == "Prolongation":
        fs["dtp1"] = dtp8.isoformat() if dtp8 else None
    if text == "RBS Change":
        hes = _hesab(ws, edit14, None)
        out["accounts"] = [r.get("ACC_NO") for r in hes]
        out["fields"]["DBLookupComboBox6"] = ""
        if hes:
            out["fields"]["Edit_acc_name"] = _new_cust_name(ws, edit14)
    return out


def edit14_enter(ws, edit14: str) -> dict:
    """Edit14KeyPress :468 (Enter in the customer ID box): '' -> hesab (CID NULL, p_AccNO '%%'), DBLookupComboBox6/Edit14 := '';
    else StrToInt(Edit14) (EConvertError for a non-number), hesab (CID = Edit14, p_AccNO NULL), DBLookupComboBox6 := '';
    with rows Edit_acc_name := new_cust(hesab.KLI_ID).name (mushteriler / HESAB Locate only move cursors)."""
    _need(ws)
    if edit14 == "":
        hes = _hesab(ws, None, "%%")
        return {"accounts": [r.get("ACC_NO") for r in hes], "fields": {"DBLookupComboBox6": "", "Edit14": ""}}
    try:
        int(edit14.strip())
    except ValueError:
        return {"error": f"'{edit14}' is not a valid integer value"}
    hes = _hesab(ws, edit14, None)
    out = {"accounts": [r.get("ACC_NO") for r in hes], "fields": {"DBLookupComboBox6": ""}}
    if hes:
        out["fields"]["Edit_acc_name"] = _new_cust_name(ws, hes[0].get("KLI_ID"))
    return out


def account_select(ws, acc: str, edit14: str, event: str) -> dict:
    """DBLookupComboBox6 (ListSource hsource -> hesab, KeyField ACC_NO). Picking a value moves the hesab cursor to that row
    (TDBLookupComboboxEh list link - assumed). 'click' = DBLookupComboBox6Click / ButtonClick :2120-2150: SetVariable without a
    reopen, Edit14 := mushteriler.Locate(hesab.KLI_ID).id. 'change' = DBLookupComboBox6Change :2152: with hesab rows:
    new_cust / musterinfo (Edit14) fill the name, surname, address (copy 0..47), 'AZE '+passport, phones ('-' removed from phone_m),
    birthday; cariqaliq2(hesab.id) -> Edit33; valut2(hesab.val_acc) -> DBEdit18 (the vsource field)."""
    _need(ws)
    fs = _fs_need(ws)
    hes = fs["hesab"]
    i = next((n for n, r in enumerate(hes) if r.get("ACC_NO") == acc), None)
    if i is not None:
        fs["hcur"] = i
    if not hes:
        return {"fields": {}}
    h = hes[fs["hcur"]]
    kli = h.get("KLI_ID")
    cust = _q(ws.conn, Q.LINES_MUSHTERILER)
    mid = next((_asstr(r.get("ID")) for r in cust if r.get("ID") == kli), _asstr((cust[0] if cust else {}).get("ID")))
    f = {"Edit14": mid}
    if event == "click":
        return {"fields": f}
    f["Edit_acc_name"] = _new_cust_name(ws, int(kli or 0))
    mi = _q(ws.conn, Q.LINES_MUSTERINFO, {"mid": int(mid) if mid.isdigit() else mid})     # Edit14.Text vs NUMBER idcust
    m = mi[0] if mi else {}
    if mi:
        f.update(Edit15=_asstr(m.get("NAME")), Edit16=_asstr(m.get("LASTNAME")), Edit22=_asstr(m.get("ADDRESS"))[:47],
                 Edit18="AZE " + _asstr(m.get("PASPNUM")), Edit17=_asstr(m.get("PHONE_H")),
                 Edit27=_asstr(m.get("PHONE_M")).replace("-", ""))
        b = m.get("BIRTHDAY")
        f["DateTimePicker7"] = (b.date() if isinstance(b, datetime.datetime) else datetime.date(1899, 12, 30)).isoformat()
    else:
        return {"error": "Variant is Null", "fields": f}          # musterinfo empty: .AsVariant of NULL into a string (unverified text)
    car = _q(ws.conn, Q.LINES_CARIQALIQ2, {"acc_id": h.get("ID")})
    f["Edit33"] = _asstr(car[0].get("OSTAT")) if car else ""
    v = _q(ws.conn, Q.LINES_VALUT2, {"valacc": h.get("VAL_ACC")})
    _st(ws)["valut2"] = _asstr(v[0].get("VAL_NAME")) if v else ""
    return {"fields": f, "dbedit18": _st(ws)["valut2"]}


def _d(s: str) -> datetime.datetime:
    return datetime.datetime.combine(datetime.date.fromisoformat(s[:10]), datetime.time())


def _strtofloat(s: str) -> float:
    try:
        return float(s.strip().replace(",", "."))
    except ValueError:
        raise _Conv(f"'{s}' is not a valid floating point value")


class _Conv(Exception):
    pass


def _floattostr(x: float) -> str:
    return str(int(x)) if x == int(x) else repr(x).replace(".", ",")      # DecimalSeparator ',' (Azerbaijani locale - unverified)


def _card_args(f, edit2, urg, kr, edit28, with_tail, wt):
    """The new_card / edit_card argument list of Button2Click (identical in every branch except Edit28, Edit2/1 and the tail)."""
    a = [f["Edit15"] + " " + f["Edit16"], f["Edit15"], f["Edit16"], f["Edit18"], _dts(datetime.date.fromisoformat(f["DateTimePicker7"][:10])),
         f["Edit17"], f["Edit27"], f["Edit20"], f["Edit19"], f["Edit22"], f["ComboBox4"], f["DBLookupComboBox6"], f["DBEdit18"],
         f["ComboBox1"], f["ComboBox12"], edit28, _d(f["DateTimePicker5"]), _d(f["DateTimePicker8"]), f["Edit26"], f["Edit23"],
         f["ComboBox2"], f["Edit25"], edit2, urg, f["Edit21"], kr, f["Edit14"], f["ComboBox11"], f["ComboBox10"]]
    if with_tail:
        a += [f["Edit24"], wt]
    return a + [_d(f["DateTimePicker2"])]


def save(ws, b) -> dict:
    """Button2Click :676 'YADDA SAXLA'. Right card_client_save. No commit anywhere (Delphi has none; whether card_main.new_card /
    edit_card commit inside is not in the repo). Messages come back in Delphi order; 'close' = the form closes (NEW success)."""
    _need(ws)
    conn = ws.conn
    fs = _fs_need(ws)
    conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["card_client_save"], commit=False)
    f = {k: "" for k in SAVE_FIELDS}
    f.update(b.fields)
    f["DBEdit18"] = _st(ws).get("valut2", "")
    today = datetime.date.today().isoformat()
    for k in ("DateTimePicker2", "DateTimePicker5", "DateTimePicker7", "DateTimePicker8"):
        if not f[k]:
            f[k] = today
        datetime.date.fromisoformat(f[k][:10])
    msgs, out = [], {"messages": [], "close": False, "fields": {}}
    urg = 1 if b.checkbox2 else 0
    kr = 1 if b.checkbox3 else 0
    wt = "0003" if f["ComboBox5"] == "WITH" else "0002"
    edit1, edit2 = fs["edit1"], fs["edit2"]

    def reopen_ops():                                    # CARDOPERATION Close / SetVariable('RBS', DBLookupComboBox6.Text) / Open
        out["operations"] = [row(r) for r in _q(conn, Q.LINES_CARDOPERATION, {"RBS": f["DBLookupComboBox6"]})]
        fs.update(ops_rbs=f["DBLookupComboBox6"], ops=[r.get("id") for r in out["operations"]])
        out["fields"]["ComboBox9"] = ""

    def credit_check():                                  # hesabtap / findcredit (:1287-1300, branch 5)
        h = _q(conn, Q.LINES_HESABTAP, {"rbs": f["DBLookupComboBox6"]})
        k = _q(conn, Q.LINES_FINDCREDIT, {"acc": int((h[0].get("ID") if h else 0) or 0)})
        if _strtofloat(f["Edit28"]) != float((k[0].get("KREDIT") if k else 0) or 0):
            out["edit28_red"] = True
            msgs.append(("credit_diff", {}))
        else:
            out["edit28_red"] = False

    def edit_card(edit28=None, tail=True, w=None):
        conn.call_proc("card_main", "edit_card", _card_args(f, edit2, urg, kr, f["Edit28"] if edit28 is None else edit28, tail, w),
                       commit=False)

    try:
        if edit1 in ("NEW", "ONLINE"):
            if any(f[k] == "" for k in REQUIRED):
                msgs.append(("required", {}))
            else:
                ct = _q(conn, Q.LINES_FCARDTYPE, {"cnam": f["ComboBox1"]})
                if f["DBEdit18"] == _asstr(ct[0].get("CURRENCY") if ct else None):
                    ref = _q(conn, Q.LINES_REFERENS)
                    f["Edit26"] = _asstr(ref[0].get("REFE")) if ref else ""
                    out["fields"]["Edit26"] = f["Edit26"]
                    if len(f["Edit23"]) < 21:
                        if datetime.date.fromisoformat(f["DateTimePicker8"][:10]) > datetime.date.today():
                            a = _card_args(f, 1, urg, kr, f["Edit28"], False, None)
                            conn.call_proc("card_main", "new_card", a, commit=False)
                            h = _q(conn, Q.LINES_HESABTAP, {"rbs": f["DBLookupComboBox6"]})
                            _q(conn, Q.LINES_FINDCREDIT, {"acc": int((h[0].get("ID") if h else 0) or 0)})
                            if b.checkbox4:
                                out["multicurrency"] = {"Edit3": f["DBLookupComboBox6"], "Edit4": "new"}
                                fs["multi"] = dict(f=dict(f), urg=urg, kr=kr, wt=wt, edit2=edit2, edit3=f["DBLookupComboBox6"], edit4="new")
                            else:
                                msgs.append(("added", {}))
                            out["close"] = True
                        else:
                            msgs.append(("expiry_bad", {}))
                    else:
                        msgs.append(("emboss_long", {}))
                else:
                    msgs.append(("currency_bad", {}))
        if edit1 == "EDIT" and b.combobox9 != "":
            if edit2 == "2":
                if f["Edit24"] != "":
                    ref = _q(conn, Q.LINES_REFERENS)
                    f["Edit26"] = _asstr(ref[0].get("REFE")) if ref else ""
                    out["fields"]["Edit26"] = f["Edit26"]
                    mc = _q(conn, Q.LINES_FMAINCARD, {"CRD": f["Edit24"]})
                    if _asstr(mc[0].get("MAINCARD") if mc else None) == "":
                        edit_card(w=wt)
                    else:
                        msgs.append(("sub_of_sub", {}))
                    if b.checkbox4:
                        out["multicurrency"] = {"Edit3": f["DBLookupComboBox6"], "Edit4": "edit"}
                        fs["multi"] = dict(f=dict(f), urg=urg, kr=kr, wt=wt, edit2=edit2, edit3=f["DBLookupComboBox6"], edit4="edit")
                    msgs.append(("saved", {}))
                    reopen_ops()
                else:
                    msgs.append(("no_card", {}))
            if edit2 == "3":
                if f["Edit24"] != "":
                    d8 = datetime.date.fromisoformat(f["DateTimePicker8"][:10])
                    if not b.confirmed:
                        out["confirm"] = ("prolong_q", {"date": _dts(d8)})
                    else:
                        d1 = fs.get("dtp1")
                        if d1 is not None and d8 > datetime.date.fromisoformat(d1):
                            edit_card(w=wt)
                            msgs.append(("saved", {}))
                            reopen_ops()
                        else:
                            msgs.append(("date_bad", {}))
                else:
                    msgs.append(("no_card", {}))
            if edit2 == "4":
                if f["Edit24"] != "":
                    edit_card(w=wt); msgs.append(("saved", {})); reopen_ops()
                else:
                    msgs.append(("no_card", {}))
            if edit2 == "12":
                edit_card(w=wt); msgs.append(("saved", {})); reopen_ops()
            if edit2 in ("6", "11"):
                edit_card(w=None); msgs.append(("saved", {})); reopen_ops()
            if edit2 == "7":
                if not _q(conn, Q.LINES_CLOSEFIND, {"crdnum": f["Edit24"]}):
                    edit_card(w=None); msgs.append(("saved", {})); reopen_ops()
                else:
                    msgs.append(("supply_exists", {}))
            if edit2 == "5":
                edit_card(w=None)
                credit_check()
                msgs.append(("saved", {})); reopen_ops()
            if edit2 == "35":
                edit_card(w=None); msgs.append(("saved", {})); reopen_ops()
            if edit2 == "13":
                edit_card(edit28=_floattostr(_strtofloat(f["Edit28"]) * 100), w=None)
                msgs.append(("saved", {})); reopen_ops()
    except _Conv as e:
        out["error"] = str(e)
    out["messages"] = [{"key": k, "args": a} for k, a in msgs]
    if out.get("confirm"):
        out["confirm"] = {"key": out["confirm"][0], "args": out["confirm"][1]}
    return out                                           # edit2 is not reset by Delphi (only ComboBox9.Text := '')


# ------------------------------------------------------------------------------------------------ Tclients2 step 2c
# creditinfopas.dfm:296 krinfo.CM_ACTIVE (Tkrinfo form, not in Unit18) - verbatim SQL.Strings
LINES_CM_ACTIVE = ['select *', '  from', '    cm_active where id=:ids', '  ', ' ']
# multiform.dfm OracleDataSet1 (TMultiCurrency) - verbatim SQL.Strings
LINES_MULTI_ACC = ['select *', ' from account  ', 'where ', '',
                   "(close_dat is null) and ((kli_id =:CID) or (Acc_NO like (:p_AccNO))) and (bal_cn1 in (select balans from card_balcn)) order by acc_no ",
                   '']
KRINFO_COLS = ["NUMBEROFCREDIT", "CONTRACTACCNO", "VAL_NAME", "NAME", "ANNUALYINTERESTRATE", "REST", "INTERESTREST", "DUEREST",
               "DUEINTERESTREST", "CREDITLINEAMOUNT", "INITIALAMOUNT", "ANNUALYOVERDUERATE", "ANNUALYPENALTYRATE", "DATEOFCONCLUSION",
               "DUEDATEFIRSTCONTRACT", "PURPOSEOFCREDIT", "ID", "STOPCALCDATE", "OBLIGATION", "PLEDGEPRICE", "DUEDATELASTCONTRACT",
               "BOOROWERREST", "INTERESTACCNO", "DUELOANACCNO", "LOANACCNO", "PENALTYREST"]   # creditinfopas.dfm MainGrid columns


def _asdate(v) -> str:
    """.AsDateTime into a TDateTimePicker: a date value, a string field via StrToDate (dd.mm.yyyy), NULL = 0 = 30.12.1899."""
    if isinstance(v, datetime.datetime):
        return v.date().isoformat()
    if isinstance(v, datetime.date):
        return v.isoformat()
    s = _asstr(v)
    if len(s) >= 10 and s[2] == "." and s[5] == ".":
        return s[6:10] + "-" + s[3:5] + "-" + s[0:2]
    if len(s) >= 10 and s[4] == "-":
        return s[:10]
    return "1899-12-30"


def grid5_click(ws, card_id) -> dict:
    """DBGrid5CellClick :2406 = DBGrid5DblClick :2278 (identical bodies): the boxes are filled from the clicked cliencards row
    (Edit28 is not - commented out; DateTimePicker5 := DATEOPEN, DateTimePicker6/8 := EXPIRY; CheckBox2 := False), then every box
    is disabled including ComboBox9, ComboBox8 and ComboBox5 (grids stay enabled). No right check, no SQL."""
    _need(ws)
    fs = _fs_need(ws)
    c = next((x for x in fs["cards"] if x.get("id") == card_id), None)
    if c is None:
        raise LookupError(card_id)
    f = {}
    for k, col in (("Edit15", "FNAME"), ("Edit16", "LNAME"), ("Edit18", "PASSPORT"), ("Edit17", "HOMEPHONE"), ("Edit27", "WORKPHONE"),
                   ("Edit20", "COUNTRY"), ("Edit19", "CITY"), ("Edit22", "ADDRESS"), ("ComboBox4", "RESIDENT"), ("ComboBox1", "CARDTYPE"),
                   ("ComboBox12", "CARDSTATUS"), ("Edit26", "REFERENCE"), ("Edit23", "EMBOSSNAME"), ("ComboBox2", "COMPANY"),
                   ("Edit25", "SECURITY"), ("Edit21", "LANG_CODE"), ("ComboBox11", "TYPES"), ("ComboBox10", "TITUL"), ("Edit24", "CARDNUMBER")):
        f[k] = _fs(c.get(col.lower()))
    f["DateTimePicker7"] = _asdate(c.get("birthday"))
    f["DateTimePicker5"] = _asdate(c.get("dateopen"))
    f["DateTimePicker6"] = _asdate(c.get("expiry"))
    f["DateTimePicker8"] = _asdate(c.get("expiry"))
    off = ("Edit15", "Edit16", "Edit18", "DateTimePicker7", "Edit17", "Edit27", "Edit20", "Edit19", "Edit22", "ComboBox4", "DBLookupComboBox6",
           "ComboBox1", "ComboBox12", "Edit28", "DateTimePicker8", "Edit26", "Edit23", "ComboBox2", "Edit25", "Edit21", "CheckBox2", "Edit14",
           "ComboBox11", "ComboBox10", "ComboBox9", "ComboBox8", "ComboBox5")
    return {"fields": f, "enabled": {k: False for k in off}, "checkbox2": False}


def credit_info(ws, credit_id) -> dict:
    """DBGrid1DblClick :556: if allclientcredits.RecordCount > 0 -> Tkrinfo, CM_ACTIVE(ids = allclientcredits.id) Open, ShowModal.
    The id must be a row of the allclientcredits grid the form opened."""
    _need(ws)
    fs = _fs_need(ws)
    if credit_id not in (fs.get("credits") or []):
        raise LookupError(credit_id)
    rows = [row(r) for r in _q(ws.conn, LINES_CM_ACTIVE, {"ids": int(credit_id)})]
    return {"columns": KRINFO_COLS, "rows": rows}


def delete_application(ws, app_id) -> dict:
    """SIL1Click :2114 (DBGrid6 PopupMenu1 'SIL'): mainpacket (card_main).delete_application(DBGrid6.id) - no confirmation, no right
    check, no commit (as Delphi) - then DBGrid6 (CARDOPERATION) Refresh with its current RBS variable."""
    _need(ws)
    fs = _fs_need(ws)
    if app_id not in (fs.get("ops") or []):
        raise LookupError(app_id)
    ws.conn.call_proc("card_main", "delete_application", [int(app_id)], commit=False)
    ops = [row(r) for r in _q(ws.conn, Q.LINES_CARDOPERATION, {"RBS": fs.get("ops_rbs")})]
    fs["ops"] = [r.get("id") for r in ops]
    return {"operations": ops}


def combo_enter(ws, combo: str, items: list, item_index: int) -> dict:
    """ComboBox1Enter :1462 / ComboBox2Enter :1623, verbatim behaviour including the quirks:
    ComboBox1: ItemIndex = 0 -> Clear, CARDTYPES reopened (ItemIndex is then -1); ItemIndex <> 0 -> for i := 0 to RecordCount:
      i = 0 adds ' ' to *ComboBox9* (not ComboBox1), else ComboBox1 gets NAME and Next - so the names are appended again (duplicates
      when the list was not cleared).
    ComboBox2: always Clear, COMPANi reopened; ItemIndex is -1 after Clear, so ' ' + every COMPANY_NAME is added."""
    _need(ws)
    _fs_need(ws)
    out = {"combobox9_add": 0}
    if combo == "ComboBox1":
        names = None
        if item_index == 0:
            items, item_index = [], -1
            names = [_asstr(r.get("NAME")) for r in _q(ws.conn, Q.LINES_CARDTYPES)]
        if item_index != 0:
            if names is None:                            # CARDTYPES is not reopened: its cursor is where FormShow / the last Enter left it
                names = [_asstr(r.get("NAME")) for r in _q(ws.conn, Q.LINES_CARDTYPES)]   # unverified: the web re-reads from First
            items = list(items) + names
            out["combobox9_add"] = 1
        out.update(items=items, item_index=item_index)
        return out
    rows = _q(ws.conn, Q.LINES_COMPANI)
    out.update(items=[" "] + [_asstr(r.get("COMPANY_NAME")) for r in rows], item_index=-1)
    return out


def multi_open(ws) -> dict:
    """TMultiCurrency FormShow: OracleDataSet1 (CID = clients2.Edit14, p_AccNO NULL) Open. Shown after Button2Click with CheckBox4."""
    _need(ws)
    m = _fs_need(ws).get("multi")
    if not m:
        raise LookupError("multi")
    cid = m["f"].get("Edit14", "")
    cid = int(cid) if cid.strip().lstrip("-").isdigit() else cid
    rows = _q(ws.conn, LINES_MULTI_ACC, {"CID": cid, "p_AccNO": None})
    m["accounts"] = {_asstr(r.get("ACC_NO")): _asstr(r.get("CURRENCYNAME")) for r in rows}
    return {"edit3": m["edit3"], "edit4": m["edit4"],
            "accounts": [{"acc": a, "currency": c} for a, c in m["accounts"].items()]}


def multi_save(ws, b) -> dict:
    """TMultiCurrency.Button1Click (multiform.pas): max Close/Open; Edit1/Edit2 = currencyname of the picked account
    (DBLookupComboBox1Change / DBLookupComboboxEh2Change). 'new': multi2 then multi1, each new_card(..., acc, currency, ..., edit2 = 1,
    ..., DateTimePicker2, Edit3) after referens Close/Open (its value is discarded); the multi1 call shows 'Yeni Multikart əlavə edildi!'.
    'edit': referens -> clients2.Edit26; fmaincard(CRD = Edit24) opened (not tested); multi1 then multi2, each edit_card(..., acc,
    clients2.DBEdit18, ..., Edit2, ..., Edit24, wt, DateTimePicker2, Edit3); multi1 shows ' Sub Multikart əlavə edildi!'. No commit."""
    _need(ws)
    conn = ws.conn
    fs = _fs_need(ws)
    m = fs.get("multi")
    if not m or "accounts" not in m:
        raise LookupError("multi")
    acc = m["accounts"]
    for a, on in ((b.acc1, b.multi1), (b.acc2, b.multi2)):
        if on and a not in acc and a != "":
            raise LookupError(a)
    e1, e2 = acc.get(b.acc1, ""), acc.get(b.acc2, "")
    f = dict(m["f"])
    _q(conn, Q.LINES_MAX)
    msgs = []

    def args(accno, cur, edit2, tail):
        g = dict(f, DBLookupComboBox6=accno, DBEdit18=cur)
        return _card_args(g, edit2, m["urg"], m["kr"], f["Edit28"], tail, m["wt"]) + [m["edit3"]]

    if m["edit4"] == "new":
        if b.multi2:
            _q(conn, Q.LINES_REFERENS)
            conn.call_proc("card_main", "new_card", args(b.acc2, e2, 1, False), commit=False)
        if b.multi1:
            _q(conn, Q.LINES_REFERENS)
            conn.call_proc("card_main", "new_card", args(b.acc1, e1, 1, False), commit=False)
            msgs.append("multi_added")
    if m["edit4"] == "edit":
        ref = _q(conn, Q.LINES_REFERENS)
        f["Edit26"] = _asstr(ref[0].get("REFE")) if ref else ""
        _q(conn, Q.LINES_FMAINCARD, {"CRD": f["Edit24"]})
        if b.multi1:
            conn.call_proc("card_main", "edit_card", args(b.acc1, f["DBEdit18"], m["edit2"], True), commit=False)
            msgs.append("multi_sub_added")
        if b.multi2:
            conn.call_proc("card_main", "edit_card", args(b.acc2, f["DBEdit18"], m["edit2"], True), commit=False)
    fs["multi"] = None
    return {"messages": [{"key": k, "args": {}} for k in msgs], "edit1": e1, "edit2": e2, "fields": {"Edit26": f["Edit26"]},
            "multiacc": b.acc1, "multival": e1}
