"""SBDM_Contract_new.bpl - new / edit deposit contract form of DepositsManager_New (exportproc 'InsertContract' /
'EditContract'; there is no LookContract in this build).

Delphi (Packages/SBDM_Contract_new): frmDepositContract_new_Impl.pas (TfrmDepositContract_new, cited F:line),
dmDepositContract_new_Impl.pas/.dfm (TdmDepositContract_new, DM:line / dfm:line), ContractCommonDecls_new.pas
(TDeposit record SaveDeposit). SQL verbatim in dep_contract_sql.py. Package sbcm_contract_new (pmNamed).

The browser keeps the DepositPorps record and the form flags (FInserted, FCommited, the ChAutopr check box); every Delphi
event handler is one /event call that runs here and returns the new state. Lookup list datasets follow the EhLib rule
'the ListSource cursor sits on the row of the current key value, else on the first row' (unverified, see PARITY).
"""
from __future__ import annotations
import datetime as dt

from fastapi import APIRouter, Depends
from pydantic import BaseModel, Field

from . import dep_contract_sql as Q
from . import deposits as D
from .cr_logic import inc_month
from .customers import row
from .db import DBError

PKG = "sbcm_contract_new"                    # dfm:547-552 TOraclePackage sbcm_contract (ParameterMode pmNamed)
CS_ADD, CS_EDIT = "InsertContract", "EditContract"   # exportproc F:471-483
DECIMAL_SEPARATOR = "."                      # FloatToStr in GenAnnualInt follows the Windows locale (unverified)
# CheckNeedsFields F:361-362: field -> TField.DisplayName (DisplayLabel, else FieldName) of DepositPorps (dfm:255-363)
NEEDS = [("BRANCHID", "Filial"), ("CONTRACTNO", "Müqavilənin №"), ("OPENDATE", "Açılma tarixi"),
         ("CLOSEDATE", "Bağlanacağı tarix"), ("INTEREST", "INTEREST"), ("OVERDUEINTEREST", "M.Ə.G faiz (%)"),
         ("CONTRACTTYPE", "Depozitin tipi"), ("CLIENTTYPE", "Müştərinin tipi"), ("PERSONALTYPE", "Müştərinin kateqoyası"),
         ("CURRENCY", "Valyuta"), ("AMOUNT", "Depozitin məbləği"), ("CUSTOMERID", "Müştəri")]
REC_FIELDS = ["OPENDATE", "CLOSEDATE", "AMOUNT", "CONTRACTNO", "CONTRACTTYPE", "CLIENTTYPE", "SID#", "BRANCHID", "AUTOPR",
              "CURRENCY", "PERSONALTYPE", "CUSTOMERID", "CAPITALPERID", "PERIODID", "INTEREST", "OVERDUEINTEREST",
              "DUEINTEREST", "CONTRACTACCID", "CLIENTACCID", "INTERESTACCID", "BOOROWERACCID", "BEFO_INTERESTPEYTACCID",
              "FIRSTINTERESTPAYDAT"]
DATE_F = {"OPENDATE", "CLOSEDATE", "FIRSTINTERESTPAYDAT"}
STR_F = {"CONTRACTNO", "INTEREST"}
# Account lookups (ShowAccounts F:586-658): ui key -> (SQL, Master valutes / DetailFields val_acc?)
ACC_LISTS = {"dep": (Q.SQL_DEPOSITACCS, True), "interest": (Q.SQL_INTERESTSACCS, True), "client": (Q.SQL_CLIENTACCS, False),
             "boorower": (Q.SQL_BOOROWERACCS, True), "befo": (Q.SQL_DSBEFO_INTERESTPEYTACC, True)}
VARIANT_NULL = "Could not convert variant of type (Null) into type (Double)"


class CErr(Exception):
    def __init__(self, key, **kw):
        self.key, self.kw = key, kw


class FormState(BaseModel):
    mode: str
    inserted: bool = False             # FInserted
    commited: bool = False             # FCommited (never reset while the form lives)
    browse: bool = False               # DepositPorps in dsBrowse (after İmtina et in insert mode: empty dataset)
    accs_open: bool = False            # DepositAccs & co. opened by ShowAccounts (F5 Refresh needs them active)
    autopr: bool = True                # ChAutopr.Checked
    close_enabled: bool = True         # DBDateTimeEditEh2.Enabled
    selected_id: int | None = None     # Get_SelectedContID (manager grid)
    selected_no: str | None = None     # Get_SelectedContNo
    bank_date: str | None = None       # Get_BankDate
    filial_id: int | None = None       # Get_FilialID


class EventIn(BaseModel):
    state: FormState
    rec: dict
    event: str
    amount_text: str | None = None     # DBNumberEditEh.Value (editor text, GenAnnualInt)


def _d(v):
    if v in (None, ""):
        return None
    if isinstance(v, dt.datetime):
        return v.date()
    if isinstance(v, dt.date):
        return v
    try:
        return dt.date.fromisoformat(str(v)[:10])
    except ValueError:
        raise CErr("deposits.c_err_date", value=str(v))


def _i(v):
    """TField.AsInteger: Null -> 0."""
    return 0 if v in (None, "") else int(float(v))


def _f(v):
    return 0.0 if v in (None, "") else float(v)


def _num(v):
    if v in (None, ""):
        return None
    try:
        return float(str(v).replace(",", "."))
    except ValueError:
        raise CErr("deposits.c_err_number", value=str(v))    # TFloatField: ''%s' is not a valid floating point value'


def clean_rec(rec: dict) -> dict:
    out = {}
    for k in REC_FIELDS:
        v = rec.get(k)
        if k in DATE_F:
            out[k] = _d(v)
        elif k in STR_F:
            out[k] = None if v in (None, "") else str(v)
        else:
            out[k] = _num(v)
    return out


def rec_json(r: dict) -> dict:
    return {k: (v.isoformat() if isinstance(v, (dt.date, dt.datetime)) else v) for k, v in r.items()}


def float_to_str(v: float) -> str:
    """SysUtils.FloatToStr (15 significant digits, no trailing zeros)."""
    s = format(float(v), ".15g")
    if "e" in s:
        m, e = s.split("e")
        s = m + "E" + ("+" if int(e) > 0 else "-") + ("%02d" % abs(int(e)))
    return s.replace(".", DECIMAL_SEPARATOR)


# ------------------------------------------------------------------ lookups
def cursor(rows: list, key: str, val):
    """List dataset cursor: the row of the current key value, else the first row (None when empty)."""
    for r in rows:
        if val is not None and r.get(key) is not None and float(r[key]) == float(val):
            return r
    return rows[0] if rows else None


def text_of(rows: list, key: str, lab: str, val):
    """Displayed text of a lookup combo: ListField of the row whose KeyField = value ('' when not found)."""
    for r in rows:
        if val is not None and r.get(key) is not None and float(r[key]) == float(val):
            return r.get(lab) or ""
    return ""


def static_lists(conn):
    """DataModuleCreate DM:158-171: valutes, Filals, DepositTypes1, ClientTypes, persons, Customers (opened)."""
    return {"valutes": [row(x) for x in conn.query(Q.SQL_VALUTES)], "filials": [row(x) for x in conn.query(Q.SQL_FILALS)],
            "types": [row(x) for x in conn.query(Q.SQL_DEPOSITTYPES1)],
            "categories": [row(x) for x in conn.query(Q.SQL_CLIENTTYPES)],
            "persons": [row(x) for x in conn.query(Q.SQL_PERSONS)]}


def customers(conn, q: str = "", cid=None, limit: int = 50):
    """Customers 'select id,name from customers' (DBLookupComboboxEh8 ListSource). The web filters it for the drop-down."""
    rows = [row(x) for x in conn.query(Q.SQL_CUSTOMERS)]
    if cid is not None:
        return [r for r in rows if r.get("id") is not None and float(r["id"]) == float(cid)]
    ql = (q or "").strip().lower()
    return [r for r in rows if not ql or ql in str(r.get("name") or "").lower() or str(r.get("id")).startswith(ql)][:limit]


def periods(conn, depid):
    return [] if depid is None else [row(x) for x in conn.query(Q.SQL_DEPPERIODS, {"depid": int(depid)})]


def capperiods(conn, periodid):
    return [] if periodid is None else [row(x) for x in conn.query(Q.SQL_DEPCAPPERIOD, {"periodid": int(periodid)})]


def valute_cursor(ui: dict, rec: dict):
    v = cursor(ui.get("valutes") or [], "valute", rec.get("CURRENCY"))
    return None if v is None else v.get("valute")


def show_accounts(conn, st: FormState, rec: dict, ui: dict):
    """ShowAccounts F:586-658: CloseAll; SetVariable('CustID', CUSTOMERID.AsInteger); Open for the five account lookups
    (DepositAccs, InterestsAccs, ClientAccs, BoorowerAccs, DSBEFO_INTERESTPEYTACC). The four account combos get their
    KeyValue back (OnKeyValueChanged = UpdateData writes the same value), ChAutopr := (Autopr = 1)."""
    cust = _i(rec.get("CUSTOMERID"))
    accs_reopen(conn, cust, rec, ui)
    st.accs_open = True
    st.autopr = _i(rec.get("AUTOPR")) == 1


def accs_reopen(conn, cust: int, rec: dict, ui: dict):
    val = valute_cursor(ui, rec)
    out = {}
    for k, (sql, detail) in ACC_LISTS.items():
        b = {"CustID": cust}
        if detail:                         # Master = valutes, MasterFields valute -> :val_acc (Null when valutes is empty)
            b["val_acc"] = None if val is None else int(val)
        out[k] = [row(x) for x in conn.query(sql, b)]
    ui["accs"] = out


# ------------------------------------------------------------------ event handlers
def ev_type_kv(conn, st, rec, ui):
    """ContractTypesKeyValueChanged F:394-404: DepPeriods / DepCapperiod CloseAll (+ open when KeyValue <> null)."""
    if rec.get("CONTRACTTYPE") is None:
        ui["periods"], ui["capperiods"] = [], []
        return
    ui["periods"] = periods(conn, rec["CONTRACTTYPE"])          # Master DepositTypes1 (ID) -> :depid
    p = cursor(ui["periods"], "id", rec.get("PERIODID"))
    ui["capperiods"] = capperiods(conn, None if p is None else p["id"])   # Master DepPeriods (ID) -> :periodid


def ev_period_kv(conn, st, rec, ui):
    """LCBPeriodsKeyValueChanged F:276-286."""
    if rec.get("PERIODID") is None:
        ui["capperiods"] = []
        return
    p = cursor(ui.get("periods") or [], "id", rec.get("PERIODID"))
    ui["capperiods"] = capperiods(conn, None if p is None else p["id"])


def ev_period_change(conn, st, rec, ui):
    """LCBPeriodsChange F:247-274: 'Ay' -> IncMonth(OpenDate, period); 'Gün' -> OpenDate + period;
    DBDateTimeEditEh2.Enabled := period <> 0. period / period_type are read from the DepPeriods cursor."""
    p = cursor(ui.get("periods") or [], "id", rec.get("PERIODID")) or {}
    period, ptype = _i(p.get("period")), p.get("period_type") or ""
    od = rec.get("OPENDATE") or dt.date(1899, 12, 30)              # AsDateTime of a Null field = 0
    if ptype == "Ay":
        rec["CLOSEDATE"] = inc_month(od, period)
    if ptype == "Gün":
        rec["CLOSEDATE"] = od + dt.timedelta(days=period)
    st.close_enabled = period != 0


def ev_capper_change(conn, st, rec, ui):
    """LCBCapPerChange F:228-239: FIRSTINTERESTPAYDAT := IncMonth(OpenDate, period div 30) (period > 0) else
    IncMonth(OpenDate, period); period from the DepCapperiod cursor (0 when the list is empty)."""
    c = cursor(ui.get("capperiods") or [], "id", rec.get("CAPITALPERID")) or {}
    period = _i(c.get("period"))
    od = rec.get("OPENDATE") or dt.date(1899, 12, 30)
    rec["FIRSTINTERESTPAYDAT"] = inc_month(od, int(period / 30) if period > 0 else period)


def gen_annual_int(conn, st, rec, ui, amount_text):
    """GenAnnualInt F:165-226 (Enter in ContractTypes, LCBPeriods, LCBCapPer, DBLCBValutes, DBNumberEditeh).
    Amount := DBNumberEditEh.Value - a Variant; Null raises EVariantTypeCastError before anything else."""
    if amount_text is None or str(amount_text).strip() == "":
        raise CErr("deposits.c_err_variant", ora=VARIANT_NULL)
    amount = _num(amount_text)
    if None in (rec.get("CONTRACTTYPE"), rec.get("CURRENCY"), rec.get("PERIODID"), rec.get("CAPITALPERID")):
        return
    t = cursor(ui.get("types") or [], "id", rec.get("CONTRACTTYPE")) or {}
    v = cursor(ui.get("valutes") or [], "valute", rec.get("CURRENCY")) or {}
    p = cursor(ui.get("periods") or [], "id", rec.get("PERIODID")) or {}
    c = cursor(ui.get("capperiods") or [], "id", rec.get("CAPITALPERID")) or {}
    b = {"p_DepositType": _i(t.get("id")), "p_Currency": _i(v.get("valute")), "p_periodID": _i(p.get("id")),
         "p_CapitalperID": _i(c.get("id")), "p_Amount": amount}

    def rate(defint: bool, untime: bool):
        # CallFloatFunction with PL/SQL BOOLEAN arguments: literal TRUE/FALSE in the block, values bound
        sql = ("begin :r := sbcm_contract_new.Get_DefaultContractRate(p_DepositType => :p_DepositType, p_Currency => :p_Currency, "
               "p_periodID => :p_periodID, p_CapitalperID => :p_CapitalperID, p_Amount => :p_Amount, "
               f"p_defint => {'true' if defint else 'false'}, p_defUntimeint => {'true' if untime else 'false'}); end;")
        return conn.plsql(sql, b, ret=float)
    r1 = rate(True, False)
    rec["INTEREST"] = None if r1 is None else float_to_str(r1)     # FieldByName('INTEREST').AsString := <float>
    r2 = rate(False, True)
    rec["OVERDUEINTEREST"] = r2
    r3 = rate(False, False)
    rec["DUEINTEREST"] = r3


def _texts(ui, rec):
    return (text_of(ui.get("periods") or [], "id", "description", rec.get("PERIODID")),
            text_of(ui.get("capperiods") or [], "id", "description", rec.get("CAPITALPERID")))


def run_event(conn, st: FormState, rec: dict, event: str, ui: dict, amount_text=None):
    """One user action -> the Delphi handlers it fires, in DataLink order. A lookup combo fires OnChange when its
    displayed text changes (e.g. its list was reopened)."""
    before = _texts(ui, rec)
    if event == "customer":                      # DepositPorpsCUSTOMERIDChange DM:271-275 -> ShowAccounts
        show_accounts(conn, st, rec, ui)
        return
    if event == "currency":                      # DBLCBValutes: valutes cursor moves -> detail account lists re-query
        if st.accs_open:
            accs_reopen(conn, _i(rec.get("CUSTOMERID")), rec, ui)
        return
    if event == "genint":
        gen_annual_int(conn, st, rec, ui, amount_text)
        return
    if event in ("type", "load"):
        ev_type_kv(conn, st, rec, ui)
    if event in ("period", "load"):
        ev_period_kv(conn, st, rec, ui)
    after = _texts(ui, rec)
    if event == "period" or (event != "capper" and after[0] != before[0]):
        ev_period_change(conn, st, rec, ui)
    if event == "capper" or after[1] != before[1]:
        ev_capper_change(conn, st, rec, ui)


# ------------------------------------------------------------------ AddContract / EditContract
def add_contract(st: FormState):
    """AddContract F:488-503: DepositPorps CloseAll; SetVariable('CONTRACTID',0); Open; Insert; CURRENCY := 0,
    Branchid := Get_FilialID, OpenDate / Closedate / FIRSTINTERESTPAYDAT := Get_BankDate."""
    bd = _d(st.bank_date)
    rec = {k: None for k in REC_FIELDS}
    rec.update(CURRENCY=0, BRANCHID=st.filial_id, OPENDATE=bd, CLOSEDATE=bd, FIRSTINTERESTPAYDAT=bd)
    st.accs_open = st.accs_open           # the account lookups keep their state (not closed by AddContract)
    return rec


def load_contract(conn, contract_id: int):
    rows = conn.query(Q.SQL_DEPOSITPORPS, {"ContractID": int(contract_id)})
    if not rows:
        raise CErr("deposits.c_err_not_found")
    r = rows[0]
    rec = {k: r.get(k) for k in REC_FIELDS}
    for k in DATE_F:
        rec[k] = _d(rec[k])
    # DepositPorpsCalcFields DM:262-269: PeriodContracts := sbcm_contract.GetPeriod(bdat, edat) (not shown on the form)
    conn.call_func(PKG, "GetPeriod", [], int, named={"bdat": _dtt(rec["OPENDATE"]), "edat": _dtt(rec["CLOSEDATE"])})
    return rec


def _dtt(d):
    return None if d is None else dt.datetime.combine(d, dt.time())


def open_form(conn, mode: str, selected_id, selected_no, bank_date, filial_id):
    if mode not in (CS_ADD, CS_EDIT):
        raise CErr("error.generic")
    st = FormState(mode=mode, selected_id=selected_id, selected_no=selected_no, bank_date=bank_date, filial_id=filial_id)
    ui = static_lists(conn)
    ui.update(periods=[], capperiods=[], accs={k: [] for k in ACC_LISTS}, cust_name="")
    if mode == CS_ADD:                           # New F:663-674
        st.inserted = True
        rec = add_contract(st)
        ui["caption"] = "Müqavilənin  əlavə olunması"
        ui["user"] = None                        # Lbluser / Label13 invisible
        st.autopr = True                         # ChAutopr.checked := true
    else:                                        # Edit F:676-688 -> EditContract F:505-527
        if selected_id is None:
            raise CErr("deposits.err_no_deposit")
        rec = load_contract(conn, selected_id)
        ui["caption"] = "%s № li müqavilənin redaktə olunması" % (selected_no or "")
        # Lbluser.Caption := USERNAME (fkLookup on usrs, which is never opened -> empty; see PARITY)
        ui["user"] = ""
        run_event(conn, st, rec, "load", ui)     # DataChange of the bound combos when the record is opened
        show_accounts(conn, st, rec, ui)
    c = customers(conn, cid=rec.get("CUSTOMERID")) if rec.get("CUSTOMERID") is not None else []
    ui["cust_name"] = c[0]["name"] if c else ""
    return st, rec, ui


def check_needs(conn, st: FormState, rec: dict, ui: dict):
    """CheckNeedsFields F:322-384: first failing check -> ContractHint.ShowMessage + Abort."""
    for f, lab in NEEDS:
        if rec.get(f) is None:
            raise CErr("deposits.c_err_empty", field=lab)
    for f, key in (("CONTRACTACCID", "c_err_depacc"), ("INTERESTACCID", "c_err_intacc"), ("CLIENTACCID", "c_err_clientacc"),
                   ("BOOROWERACCID", "c_err_boracc")):
        if _i(rec.get(f)) == 0:
            raise CErr("deposits." + key)
    if not conn.call_bool(PKG, "Check_BankAccount", [], named={"p_categoryID": _i(rec.get("CLIENTTYPE")),
                                                               "p_currencyID": _i(rec.get("CURRENCY")),
                                                               "p_BranchID": _i(rec.get("BRANCHID"))}):
        raise CErr("deposits.c_err_bankacc")
    t = cursor(ui.get("types") or [], "id", rec.get("CONTRACTTYPE")) or {}   # DepositTypes1 current record
    if (t.get("withdrawtype") or "") == "BefoPercent" and _i(rec.get("BEFO_INTERESTPEYTACCID")) == 0:
        raise CErr("deposits.c_err_befoacc")


def save(conn, st: FormState, rec: dict, ui: dict):
    """BitBtnOkClick F:298-304: CheckNeedsFields; SaveDeposits; SaveState(True); FCommited := True."""
    if st.browse:
        rec = {k: None for k in REC_FIELDS}      # empty dataset after Cancel: every field Null
    check_needs(conn, st, rec, ui)
    rec["AUTOPR"] = 1 if st.autopr else 0         # SaveDeposits F:715-725
    sd = {"p_Type": 3, "p_OpenDate": _dtt(rec["OPENDATE"]), "p_CloseDate": _dtt(rec["CLOSEDATE"]),
          "p_Amount": _f(rec["AMOUNT"]), "p_ContractNo": rec["CONTRACTNO"] or "", "p_ContractType": _i(rec["CONTRACTTYPE"]),
          "p_ClientType": _i(rec["CLIENTTYPE"]), "p_ContractAccID": _i(rec["CONTRACTACCID"]),
          "p_ClientAccID": _i(rec["CLIENTACCID"]), "p_InterestAccID": _i(rec["INTERESTACCID"]),
          "p_BoorowerAccID": _i(rec["BOOROWERACCID"]), "p_Percent": rec["INTEREST"] or "",
          "p_OverduePercent": _f(rec["OVERDUEINTEREST"]), "p_DuePercent": _f(rec["DUEINTEREST"]),
          "p_personaltype": _i(rec["PERSONALTYPE"]), "p_currency": _i(rec["CURRENCY"]), "p_branchid": _i(rec["BRANCHID"]),
          "p_customerid": _i(rec["CUSTOMERID"]), "p_stopCalcdate": _dtt(rec["FIRSTINTERESTPAYDAT"]) or dt.datetime(1899, 12, 30),
          "p_PeriodID": _i(rec["PERIODID"]), "p_capitalperid": _i(rec["CAPITALPERID"]), "p_autopr": rec["AUTOPR"],
          "p_BEFO_INTERESTPEYTACCID": _i(rec["BEFO_INTERESTPEYTACCID"])}
    # SaveState(True) F:731-749 -> Post -> DepositPorpsApplyRecord DM:190-260 -> DOA CommitOnPost (default True)
    if st.inserted:
        conn.call_proc(PKG, "NewDeposit", [], named=sd, commit=False)
    else:
        if st.selected_id is None:
            raise CErr("deposits.err_no_deposit")
        conn.call_proc(PKG, "UpdateDeposit", [], named={"p_ContractID": int(st.selected_id), **sd}, commit=False)
    conn.commit()
    st.commited = True
    if not st.inserted:
        return st, None, {"closed": True}         # Self.Close -> FormClose: RefreshWithSavely(True)
    return st, add_contract(st), {"closed": False}   # AddContract: the next blank record, the form stays open


def refresh_lists(conn, st: FormState, rec: dict, ui: dict):
    """F5 / RefreshListLbl -> RefreshDataSets DM:145-157: valutes, Filals, DepositTypes1, ClientTypes, persons, Customers,
    DepositAccs, ClientAccs, InterestsAccs, DSBEFO_INTERESTPEYTACC .Refresh - TDataSet.Refresh of a closed dataset raises."""
    ui.update(static_lists(conn))
    if not st.accs_open:
        raise CErr("deposits.c_err_closed_ds", ora="Cannot perform this operation on a closed dataset")
    accs_reopen(conn, _i(rec.get("CUSTOMERID")), rec, ui)


# ------------------------------------------------------------------ router
class OpenIn(BaseModel):
    mode: str
    selected_id: int | None = None
    selected_no: str | None = Field(None, max_length=64)


class SaveIn(BaseModel):
    state: FormState
    rec: dict


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/deposits/contract")
    g = require_module(D.CLSID)

    def run(fn, *a):
        try:
            return fn(*a)
        except CErr as e:
            err(400, e.key, **e.kw)

    def ui_of(b):
        return dict(b.rec.get("_ui") or {})

    @r.post("/open")
    def _open(b: OpenIn, ws=Depends(g)):
        # rights of the manager handlers ToolButton1Click / ToolButton3Click (re-checked server-side)
        D.check_right(ws.conn, {CS_ADD: "NEW_SBCM_CONTRACT", CS_EDIT: "EDIT_SBCM_CONTRACT"}.get(b.mode, "NEW_SBCM_CONTRACT"))
        init = D.init_data(ws.conn)
        st, rec, ui = run(open_form, ws.conn, b.mode, b.selected_id, b.selected_no, init["bank_date"], init["filial_id"])
        return {"state": st.model_dump(), "rec": rec_json(rec), "ui": ui}

    @r.post("/event")
    def _event(b: EventIn, ws=Depends(g)):
        if b.state.browse:
            return {"state": b.state.model_dump(), "rec": b.rec, "ui": {}}
        rec = run(clean_rec, b.rec)
        ui = ui_of(b)
        run(run_event, ws.conn, b.state, rec, b.event, ui, b.amount_text)
        if b.event == "customer":
            c = run(customers, ws.conn, "", rec.get("CUSTOMERID")) if rec.get("CUSTOMERID") is not None else []
            ui["cust_name"] = c[0]["name"] if c else ""
        return {"state": b.state.model_dump(), "rec": rec_json(rec), "ui": ui}

    @r.get("/customers")
    def _customers(q: str = "", ws=Depends(g)):
        return {"rows": customers(ws.conn, q[:64])}

    @r.post("/save")
    def _save(b: SaveIn, ws=Depends(g)):
        rec = run(clean_rec, b.rec) if not b.state.browse else {}
        try:
            st, new, res = run(save, ws.conn, b.state, rec, ui_of(b))
        except DBError:
            ws.conn.rollback()                    # failed Post: nothing is committed
            raise
        out = {"state": st.model_dump(), **res}
        if new is not None:
            out["rec"] = rec_json(new)
        return out

    @r.post("/refresh")
    def _refresh(b: SaveIn, ws=Depends(g)):
        rec = run(clean_rec, b.rec)
        ui = ui_of(b)
        run(refresh_lists, ws.conn, b.state, rec, ui)
        return {"ui": ui}

    return r
