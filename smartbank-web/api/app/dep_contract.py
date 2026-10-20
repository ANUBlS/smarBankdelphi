"""NewDepositsContract.bpl - the new / edit / view contract form (exportproc 'InsertContract' / 'EditContract' / 'LookContract').

Delphi: NewDepositsManager/NewDepositsContract/NewFormDepositContractImpl.pas (TNewFormDepositContract, cited as F:line),
NewDepositsContractImpl.pas (data module, cited as DM:line), NewContractCommonDecls.pas (TDeposit record SaveDeposit),
NewFormCreditImpl.pas (Kreditin siyahısı). SQL verbatim in dep_contract_sql.py.

The web form keeps the DepositPorps record and the form variables (FInserted, FClientType, FPersonstype, FDepPerSetid,
FPrize, FTocard) in the browser; every Delphi event handler is one 'event' call that runs here and returns the new state.
"""
from __future__ import annotations
import datetime as dt

from fastapi import APIRouter, Depends
from pydantic import BaseModel

from . import dep_contract_sql as Q
from . import deposits as D
from .cr_logic import inc_month
from .customers import row
from .db import DBError

PKG = "dm_contract"                    # DM dfm:207-213 TOraclePackage dm_contract, ParameterMode = pmNamed
CS_ADD, CS_EDIT, CS_LOOK = "InsertContract", "EditContract", "LookContract"     # F:157-159

# Panels of the form (dfm order: name, Top, Visible). dm_contract_type.NAME names a panel (PanelInsert/UpdateVizible).
PANELS = [("CustNomPanel", 0, True), ("CustNamePanel", 29, True), ("FilialPanel", 59, True), ("DepTypePanel", 88, True),
          ("ComboBoxPrizePanel", 117, True), ("ValyutaPanel", 146, True), ("DepAmountPanel", 175, True),
          ("PeriodPanel", 204, True), ("CapitalPeriodPanel", 233, True), ("PlasticCardPanel", 262, True),
          ("PecentDatePanel", 291, False), ("AgentPanel", 320, False), ("ContractNumPanel", 349, True),
          ("OpenDatPanel", 378, True), ("CloseDatPanel", 407, True), ("PercentPanel", 436, True),
          ("PeriodAfterPercentPanel", 465, True), ("PeriodBeforePercentPanel", 494, True), ("CustCategoryPanel", 523, True),
          ("CustTypePanel", 552, True), ("ProlonqasiyaPanel", 581, True), ("CreditParticepatePanel", 610, True),
          ("ThirdPersonNamePanel", 639, True)]
# CheckNeedsFields F:482-483: field -> TField.DisplayLabel (DM dfm:602-728)
NEEDS = [("CUSTOMERID", "Müştərinin No"), ("CONTRACTTYPE", "Depozitin tipi"), ("CURRENCY", "Valyuta"),
         ("CONTRACTNO", "Müqavilənin №"), ("AMOUNT", "Depozitin məbləği"), ("OPENDATE", "Açılma tarixi"),
         ("CLOSEDATE", "Bağlanma tarixi"), ("PERIODID", "Müddət (ay)"), ("CAPITALPERID", "Kapital periodu")]
REC_FIELDS = ["ID", "OPENDATE", "CLOSEDATE", "AMOUNT", "CONTRACTNO", "CONTRACTTYPE", "CLIENTTYPE", "SID#", "BRANCHID",
              "CURRENCY", "PERSONALTYPE", "CUSTOMERID", "CAPITALPERID", "PERIODID", "INTEREST", "OVERDUEINTEREST",
              "DUEINTEREST", "FIRSTINTERESTPAYDAT", "PROLANID", "TOCARD", "AGENTID", "PERSONSID", "PRIZEID", "DEPPERSETID",
              "BONUSSTATUS"]
DATE_F = {"OPENDATE", "CLOSEDATE", "FIRSTINTERESTPAYDAT"}
# ComboBoxCard / ComboBoxPrize Items.Strings (dfm:1272-1288, 1330-1333)
CARDS = ["Köçürülməsin", "Visa Elektron Salary(Yeni)", "Maestro Salary(Yeni)", "Visa Classic(Yeni)",
         "Master Card Standard(Yeni)", "Visa Gold(Yeni) ", "Master Card Gold(Yeni)", "Visa Platinum(Yeni)",
         "Visa Elektron Salary(Köhnə)", "Maestro Salary(Köhnə)", "Visa Classic(Köhnə)", "Master Card Standard(Köhnə)",
         "Visa Gold(Köhnə) ", "Master Card Gold(Köhnə)", "Visa Platinum(Köhnə)"]
PRIZES = ["Verilməsin", "Verilsin(müddətin əvvəlində)", "Verilsin(müddətin sonunda)"]


class CErr(Exception):
    def __init__(self, key, **kw):
        self.key, self.kw = key, kw


class FormState(BaseModel):
    mode: str                          # InsertContract / EditContract / LookContract
    inserted: bool = False             # FInserted
    commited: bool = False             # FCommited
    browse: bool = False               # DepositPorps not in dsInsert/dsEdit (after İmtina et in insert mode)
    client_type: int = 0               # FClientType
    persons_type: int = 0              # FPersonstype
    depperset_id: int = 0              # FDepPerSetid
    prize: int = 0                     # FPrize / ComboBoxPrize.ItemIndex
    tocard: int = 0                    # FTocard
    card_index: int = 0                # ComboBoxCard.ItemIndex
    custno_text: str = ""              # DBEditNumber.Text
    selected_id: int | None = None     # Get_SelectedContID (main grid)
    selected_no: str | None = None     # Get_SelectedContNo
    filial_id: int | None = None       # FilalsID.AsInteger (current record of Filals)


class EventIn(BaseModel):
    state: FormState
    rec: dict
    event: str


def _d(v):
    if v in (None, ""):
        return None
    if isinstance(v, dt.datetime):
        return v.date()
    if isinstance(v, dt.date):
        return v
    return dt.date.fromisoformat(str(v)[:10])


def _i(v):
    """TField.AsInteger: Null -> 0."""
    if v in (None, ""):
        return 0
    return int(float(v))


def _f(v):
    if v in (None, ""):
        return 0.0
    return float(v)


def _num_or_none(v):
    if v in (None, ""):
        return None
    try:
        return float(v)
    except (TypeError, ValueError):
        raise CErr("deposits.c_err_number", value=str(v))


def clean_rec(rec: dict) -> dict:
    """Browser record -> typed DepositPorps values (dates ISO, numbers float, ints)."""
    out = {}
    for k in REC_FIELDS:
        v = rec.get(k, rec.get(k.lower()))
        if k in DATE_F:
            out[k] = _d(v)
        elif k == "CONTRACTNO":
            out[k] = None if v in (None, "") else str(v)
        else:
            out[k] = _num_or_none(v)
    return out


def rec_json(r: dict) -> dict:
    return {k: (v.isoformat() if isinstance(v, (dt.date, dt.datetime)) else v) for k, v in r.items()}


# ------------------------------------------------------------------ lookups
def panels(conn, mode: str):
    """PanelInsertVizible F:191-222 / PanelUpdateVizible F:223-284 over dm_contract_type (order by topid)."""
    ct = conn.query(Q.SQL_DMCONTRACTTYPE)
    names = {p[0]: [p[1], p[2]] for p in PANELS}
    for r in ct:
        n = r.get("NAME")
        if n not in names:
            continue
        if mode == CS_ADD:
            if _i(r.get("PANELTYPE")) == 1:
                names[n] = [_i(r.get("TOPID")), True]
            else:
                names[n][1] = False
        elif n != "ThirdPersonNamePanel":          # update / look: every listed panel visible at TOPID
            names[n] = [_i(r.get("TOPID")), True]
    out = [{"name": n, "top": t, "visible": v} for n, (t, v) in names.items()]
    return sorted(out, key=lambda p: (p["top"], [x[0] for x in PANELS].index(p["name"])))


def deposit_types(conn, mode: str):
    """exportproc F:642-649: InsertContract -> TDataSet.Filter 'status=0' (Filtered); Edit / Look unfiltered."""
    rows = [row(x) for x in conn.query(Q.SQL_DEPOSITTYPES)]
    if mode == CS_ADD:
        rows = [x for x in rows if x.get("status") is not None and int(x["status"]) == 0]
    return rows


def filials(conn, branchid=None):
    """Filals: Insert = unfiltered; EditContract F:742-747 Filter 'id=' + BRANCHID."""
    rows = [row(x) for x in conn.query(Q.SQL_FILALS)]
    if branchid is not None:
        rows = [x for x in rows if int(x["id"]) == int(branchid)]
    return rows


def periods(conn, depid):
    return [row(x) for x in conn.query(Q.SQL_DEPPERIODS, {"depid": int(depid)})]


def capperiods(conn, periodid):
    return [row(x) for x in conn.query(Q.SQL_DEPCAPPERIOD, {"periodid": int(periodid)})]


# ------------------------------------------------------------------ AddContract / EditContract
def add_contract(conn, st: FormState, bank_filial: int):
    """AddContract F:693-718: CloseAll; SetVariable('CONTRACTID',0); Open; Insert (SequenceField ID SEG_DM_CONTRACTS,
    amOnNewRecord); defaults. Date = the PC date (Get_BankDate is commented out)."""
    seq = conn.query(Q.SQL_SEQ_DM_CONTRACTS)
    new_id = int(list(seq[0].values())[0])
    today = dt.date.today()
    rec = {k: None for k in REC_FIELDS}
    rec.update(ID=new_id, CURRENCY=0, BRANCHID=bank_filial, OPENDATE=today, CLOSEDATE=today, FIRSTINTERESTPAYDAT=today,
               AMOUNT=0.0, DUEINTEREST=0.0, OVERDUEINTEREST=0.0, PRIZEID=st.prize, TOCARD=st.card_index, AGENTID=0)
    return rec


def load_contract(conn, contract_id: int):
    rows = conn.query(Q.SQL_DEPOSITPORPS, {"ContractID": int(contract_id)})
    if not rows:
        raise CErr("deposits.c_err_not_found")
    r = rows[0]
    rec = {k: r.get(k) for k in REC_FIELDS}
    for k in DATE_F:
        rec[k] = _d(rec[k])
    return rec


def username(conn, sid):
    """DepositPorpsUSERNAME: fkLookup on usrs (smart.user$ lower(name)) by SID#."""
    if sid is None:
        return ""
    for u in conn.query(Q.SQL_USRS):
        if u.get("ID") is not None and int(u["ID"]) == int(sid):
            return u.get("NAME") or ""
    return ""


# ------------------------------------------------------------------ event handlers
def ev_customer(conn, st: FormState, rec: dict, ui: dict):
    """DBEditNumberChange F:542-581 (DBEditNumber.OnChange and DBLCBValutes.OnChange)."""
    s = "0"
    if st.custno_text != "":
        s = st.custno_text.strip()
    try:
        custid = int(s)                                   # strtoint(St): EConvertError on non-numbers
    except ValueError:
        raise CErr("deposits.c_err_int", value=s)
    cust = conn.query(Q.SQL_CUSTOMERS, {"custid": custid})
    c = cust[0] if cust else {}
    ui["cust_name"] = c.get("NAME") or ""
    st.persons_type = _i(c.get("CUST_TYPE"))
    ui["custtype_name"] = c.get("CUSTTYPE_NAME") or ""
    ui["category"] = ""                                   # ClientTypes.Close
    if cust:
        valkod = _i(rec.get("CURRENCY"))                  # DBLCBValutes list record (located on the selected currency)
        ct = conn.query(Q.SQL_CLIENTTYPES, {"custcategory": _i(c.get("CUST_TYPE")), "rezcategory": _i(c.get("NEREZIDENT")),
                                            "valcategory": 1 if valkod != 0 else 0})
        st.client_type = _i(ct[0].get("ID")) if ct else 0
        ui["category"] = (ct[0].get("CATEGORY") or "") if ct else ""
    # no customer: FClientType keeps its previous value (Delphi does not reset it)


def ev_type(conn, st: FormState, rec: dict, ui: dict):
    """ContractTypesChange F:506-532 (ContractTypes.OnChange, ComboBoxPrize.OnClick). csAddContract = 'InsertContract'
    is a constant, so the first test only looks at KeyValue."""
    if rec.get("CONTRACTTYPE") is None:
        ui["periods"], ui["capperiods"], ui["settings"] = [], [], []
        return
    ui["periods"] = periods(conn, rec["CONTRACTTYPE"])        # DepPeriods (Master DepositTypes, MasterFields ID)
    pid = rec.get("PERIODID")
    if pid is None or not any(int(p["id"]) == int(pid) for p in ui["periods"]):
        pid = ui["periods"][0]["id"] if ui["periods"] else None
    ui["capperiods"] = capperiods(conn, pid) if pid is not None else []   # DepCapperiod (Master DepPeriods)
    if st.inserted:
        rec["CONTRACTNO"] = conn.call_func(PKG, "getcontractno", [], str, named={
            "dtid": int(rec["CONTRACTTYPE"]), "filialid": _i(st.filial_id), "przid": st.prize})


def ev_period(conn, st: FormState, rec: dict, ui: dict):
    """LCBPeriodsKeyValueChanged F:405-415 (LCBPeriodsChange F:361-403 is commented out)."""
    ui["capperiods"] = [] if rec.get("PERIODID") is None else capperiods(conn, rec["PERIODID"])


def ev_capper(conn, st: FormState, rec: dict, ui: dict):
    """LCBCapPerChange F:286-353. The list datasets sit on the selected key values (lookup combos locate them)."""
    per = next((p for p in ui.get("periods") or [] if rec.get("PERIODID") is not None and int(p["id"]) == int(rec["PERIODID"])), {})
    cap = next((p for p in ui.get("capperiods") or [] if rec.get("CAPITALPERID") is not None and int(p["id"]) == int(rec["CAPITALPERID"])), {})
    period = _i(per.get("period"))
    periodtype = per.get("period_type") or ""
    depid, periodid, capitalperid, currency = _i(rec.get("CONTRACTTYPE")), _i(per.get("id")), _i(cap.get("id")), _i(rec.get("CURRENCY"))
    amount = 0.00 if rec.get("AMOUNT") is None else float(rec["AMOUNT"])
    od = rec.get("OPENDATE")
    if od is not None:
        if periodtype == "İL":
            rec["CLOSEDATE"] = inc_month(od, 12 * period)            # IncYear
        if periodtype == "AY":
            rec["CLOSEDATE"] = inc_month(od, period)
        if periodtype == "GÜN":
            rec["CLOSEDATE"] = od + dt.timedelta(days=period)
    ui["dtclose_enabled"] = period != 0
    sett = conn.query(Q.SQL_DMDEPOSITPERSETTINGS, {"depid": depid, "periodid": periodid, "capitalid": capitalperid,
                                                   "currencyid": currency, "amount": amount})
    ui["settings"] = [row(x) for x in sett]
    ui["percent_list_visible"] = len(sett) > 1               # DBLookupPercent.Visible
    s0 = sett[0] if sett else {}
    if st.inserted:
        rec["INTEREST"] = _f(s0.get("INTERESTRATE"))
        rec["DUEINTEREST"] = _f(s0.get("DUEINTRATE"))
        rec["OVERDUEINTEREST"] = _f(s0.get("BEFOINTRATE"))
    else:                                                    # the edit controls show the record values again
        rec["INTEREST"] = _f(rec.get("INTEREST"))
        rec["DUEINTEREST"] = _f(rec.get("DUEINTEREST"))
        rec["OVERDUEINTEREST"] = _f(rec.get("OVERDUEINTEREST"))
    st.depperset_id = _i(s0.get("ID"))
    capp = _i(cap.get("period"))                             # LCBCapPer list field 'period'
    if od is not None:
        rec["FIRSTINTERESTPAYDAT"] = inc_month(od, capp // 30) if capp > 0 else inc_month(od, capp)


EVENTS = {"customer": [ev_customer], "type": [ev_type], "period": [ev_period], "capper": [ev_capper],
          # data-aware controls firing OnChange when a record is loaded (unverified order, see PARITY_DEPOSITS.md)
          "load": [ev_customer, ev_type, ev_period, ev_capper]}


def run_event(conn, st: FormState, rec: dict, event: str, ui: dict | None = None):
    ui = dict(ui or {})
    if event == "card":                                      # ComboBoxCardChange F:501-504
        st.tocard = st.card_index
        return st, rec, ui
    for fn in EVENTS[event]:
        if fn is ev_capper and rec.get("CAPITALPERID") is None and event == "load":
            continue                                         # a lookup with no value raises no OnChange
        fn(conn, st, rec, ui)
    return st, rec, ui


# ------------------------------------------------------------------ open / save
def open_form(conn, mode: str, selected_id: int | None, selected_no: str | None, bank_filial: int):
    if mode not in (CS_ADD, CS_EDIT, CS_LOOK):
        raise CErr("error.generic")
    st = FormState(mode=mode, selected_id=selected_id, selected_no=selected_no)
    ui = {"panels": panels(conn, mode), "buttons": mode != CS_LOOK, "types": deposit_types(conn, mode),
          "valutes": [row(x) for x in conn.query(Q.SQL_VALUTES)], "prolan": [row(x) for x in conn.query(Q.SQL_DMPROLANQASIYA)],
          "cards": CARDS, "prizes": PRIZES, "periods": [], "capperiods": [], "settings": [], "dtclose_enabled": True,
          "percent_list_visible": False, "cust_name": "", "custtype_name": "", "category": ""}
    if mode == CS_ADD:                                       # New F:915-927
        st.inserted = True
        ui["filials"] = filials(conn)
        st.prize = st.card_index = 0
        rec = add_contract(conn, st, bank_filial)
        ui["caption"] = "Müqavilənin  əlavə olunması"
        ui["user"] = None
    else:                                                    # Edit F:929-941 / EditContract F:720-753
        if selected_id is None:
            raise CErr("deposits.err_no_deposit")             # Get_SelectedContID: 'Heç bir Depozit seçilməyib!'
        rec = load_contract(conn, selected_id)
        ui["filials"] = filials(conn, _i(rec.get("BRANCHID")))
        st.prize, st.card_index = _i(rec.get("PRIZEID")), _i(rec.get("TOCARD"))
        ui["caption"] = "%s № li müqavilənin redaktə olunması" % (selected_no or "")
        ui["user"] = username(conn, rec.get("SID#"))
    st.filial_id = int(ui["filials"][0]["id"]) if ui["filials"] else 0
    ui["filial_name"] = ui["filials"][0]["name"] if ui["filials"] else ""     # DBLCBFilial: Filals.NAME (current record)
    st.custno_text = "" if rec.get("CUSTOMERID") is None else str(int(rec["CUSTOMERID"]))
    st, rec, ui = run_event(conn, st, rec, "load", ui)
    return st, rec, ui


def check_needs(rec: dict):
    """CheckNeedsFields F:443-498: first Null field -> ContractHint '"%s" sahəsinə qiymət daxil olunmayıb! ' + Abort."""
    for f, lab in NEEDS:
        if rec.get(f) is None:
            raise CErr("deposits.c_err_empty", field=lab)


def save(conn, st: FormState, rec: dict, bank_filial: int):
    """XFBitBtn1Click F:883-893: CheckNeedsFields; SaveDeposits; SaveState(True); FCommited := True."""
    if st.browse:
        check_needs({})                                      # empty dataset: every field Null
    check_needs(rec)
    if st.mode == CS_LOOK:
        raise CErr("error.generic")                          # Qeyd et is invisible in LookContract
    # SaveDeposits F:942-979
    rec["AGENTID"] = rec.get("AGENTID")
    rec["CLIENTTYPE"], rec["PERSONALTYPE"], rec["DEPPERSETID"] = st.client_type, st.persons_type, st.depperset_id
    rec["TOCARD"], rec["PRIZEID"] = st.tocard, st.prize
    sd = {"contractid": _i(rec["ID"]), "TypeD": 3, "ContractNo": rec["CONTRACTNO"], "opendate": rec["OPENDATE"],
          "CloseDate": rec["CLOSEDATE"], "amount": _f(rec["AMOUNT"]), "contracttype": _i(rec["CONTRACTTYPE"]),
          "clienttype": _i(rec["CLIENTTYPE"]), "branchid": _i(rec["BRANCHID"]), "currency": _i(rec["CURRENCY"]),
          "personaltype": _i(rec["PERSONALTYPE"]), "customerid": _i(rec["CUSTOMERID"]), "interest": _f(rec["INTEREST"]),
          "overdueinterest": _f(rec["DUEINTEREST"]),         # F:965-966: the two are crossed over in Delphi
          "dueinterest": _f(rec["OVERDUEINTEREST"]), "FirstPayDateforInt": rec["FIRSTINTERESTPAYDAT"],
          "PeriodID": _i(rec["PERIODID"]), "CapitalperID": _i(rec["CAPITALPERID"]), "autopr": _i(rec["PROLANID"]),
          "tocard": _i(rec["TOCARD"]), "personsid": _i(rec["PERSONSID"]), "agentid": rec["AGENTID"],
          "prizeid": _i(rec["PRIZEID"]), "deppersetid": _i(rec["DEPPERSETID"]), "bonusstatus": _i(rec["BONUSSTATUS"])}
    dtt = lambda d: None if d is None else dt.datetime.combine(d, dt.time())  # noqa: E731
    params = {"p_Type": sd["TypeD"], "p_OpenDate": dtt(sd["opendate"]), "p_CloseDate": dtt(sd["CloseDate"]),
              "p_Amount": sd["amount"], "p_ContractNo": sd["ContractNo"], "p_ContractType": sd["contracttype"],
              "p_ClientType": sd["clienttype"], "p_Percent": sd["interest"], "p_OverduePercent": sd["overdueinterest"],
              "p_DuePercent": sd["dueinterest"], "p_personaltype": sd["personaltype"], "p_currency": sd["currency"],
              "p_branchid": sd["branchid"], "p_customerid": sd["customerid"], "p_stopCalcdate": dtt(sd["FirstPayDateforInt"]),
              "p_PeriodID": sd["PeriodID"], "p_capitalperid": sd["CapitalperID"], "p_autopr": sd["autopr"],
              "p_tocard": sd["tocard"], "p_agentid": sd["agentid"], "p_personsid": sd["personsid"], "p_prizeid": sd["prizeid"],
              "p_deppersetid": sd["deppersetid"], "p_bonusstatus": sd["bonusstatus"]}
    # SaveState(True) F:981-1004 -> Post -> DepositPorpsApplyRecord DM:203-279, then DOA CommitOnPost (default True)
    if st.inserted:
        conn.call_proc(PKG, "dmaddcontract", [], named={"p_ContractID": sd["contractid"], **params}, commit=False)
    else:
        if st.selected_id is None:
            raise CErr("deposits.err_no_deposit")
        conn.call_proc(PKG, "dmupdatecontract", [], named={"p_ContractID": int(st.selected_id), **params}, commit=False)
    conn.commit()
    st.commited = True
    if not st.inserted:
        return st, None, {"closed": True}
    # AddAccount F:835-878 (no commit), then AddContract (the next blank record; the form stays open)
    conn.call_proc(PKG, "dmgenerateaccountnumber", [], named={
        "DmType": _i(rec["CONTRACTTYPE"]), "Filialid": _i(st.filial_id), "CustomerID": _i(rec["CUSTOMERID"]),
        "Valid": _i(rec["CURRENCY"]), "begindat": dtt(rec["OPENDATE"]), "enddate": dtt(rec["CLOSEDATE"]),
        "cardcode": st.card_index, "contractid": sd["contractid"]}, commit=False)
    accs = conn.query(Q.SQL_ODSACCNO)
    for i, a in enumerate(accs):
        conn.call_func(PKG, "getaddaccount", [], int, named={
            "p_id": i, "v_contractid": sd["contractid"], "v_customerid": _i(a.get("CUSTOMERID")), "v_accno": a.get("ACCNO") or "",
            "v_val_id": _i(a.get("VAL_ID")), "v_nameaccno": a.get("NAMEACCNO") or "", "v_opendat": a.get("OPENDAT"),
            "v_old_balcn": _i(a.get("OLD_BALCN")), "v_new_balcn": _i(a.get("NEW_BALCN")), "v_filial": _i(a.get("FILIAL")),
            "v_fieldname": a.get("DEPOSITFIELDACCNO") or "", "v_simvoltype": _i(a.get("SIMVOLTYPE"))})
    new = add_contract(conn, st, bank_filial)
    st.custno_text = ""
    return st, new, {"closed": False, "accounts": len(accs), "pending": True}


def credits(conn, rec: dict, cust_id, branch_name: dict):
    """XFPanel22Click F:906-913 (not FInserted) -> TFormCredit.FormShow: CreditContractno with contractid := DepositPorpsSID
    (the SID# field, as in Delphi). Lookup fields Name (Customers - the one customer of the form) and FilialName (Filals)."""
    rows = conn.query(Q.SQL_CREDITCONTRACTNO, {"contractid": _i(rec.get("SID#"))})
    out = []
    for r in rows:
        x = row(r)
        x["name"] = branch_name.get("cust_name") if cust_id is not None and x.get("boorowerid") is not None and int(x["boorowerid"]) == int(cust_id) else None
        x["filialname"] = branch_name.get("filials", {}).get(str(_i(x.get("branchid"))))
        out.append(x)
    return out


# ------------------------------------------------------------------ router
class OpenIn(BaseModel):
    mode: str
    selected_id: int | None = None
    selected_no: str | None = None


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

    def bank_filial(conn):
        f = conn.query(D.Q.SQL_FILIALID)
        return int(f[0]["KOD_FIL"]) if f else 0

    @r.post("/open")
    def _open(b: OpenIn, ws=Depends(g)):
        right = {CS_ADD: None, CS_EDIT: "DM_CONTRACTUPDATE", CS_LOOK: "DM_CONTRACTLOOK"}.get(b.mode)
        if right:
            D.check_right(ws.conn, right)
        st, rec, ui = run(open_form, ws.conn, b.mode, b.selected_id, b.selected_no, bank_filial(ws.conn))
        return {"state": st.model_dump(), "rec": rec_json(rec), "ui": ui}

    @r.post("/event")
    def _event(b: EventIn, ws=Depends(g)):
        rec = run(clean_rec, b.rec)
        st, rec, ui = run(run_event, ws.conn, b.state, rec, b.event, b.rec.get("_ui") or {})
        return {"state": st.model_dump(), "rec": rec_json(rec), "ui": ui}

    @r.post("/save")
    def _save(b: SaveIn, ws=Depends(g)):
        rec = run(clean_rec, b.rec) if not b.state.browse else {}
        try:
            st, new, res = run(save, ws.conn, b.state, rec, bank_filial(ws.conn))
        except DBError:
            ws.conn.rollback()                                # failed Post: the DOA transaction is not committed
            raise
        out = {"state": st.model_dump(), **res}
        if new is not None:
            st2, new, ui = run_event(ws.conn, st, new, "load", b.rec.get("_ui") or {})
            out.update(state=st2.model_dump(), rec=rec_json(new), ui=ui)
        return out

    @r.post("/credits")
    def _credits(b: SaveIn, ws=Depends(g)):
        if b.state.inserted:
            return {"rows": []}                              # FInserted: the panel click does nothing
        rec = run(clean_rec, b.rec)
        ui = b.rec.get("_ui") or {}
        names = {"cust_name": ui.get("cust_name"), "filials": {str(f["id"]): f["name"] for f in ui.get("filials") or []}}
        return {"rows": credits(ws.conn, rec, rec.get("CUSTOMERID"), names)}

    @r.post("/refresh")
    def _refresh(b: SaveIn, ws=Depends(g)):
        """F5 RefreshListLblClick -> RefreshDataSets DM:169-178 (Valutes, Filals, DepositTypes, ClientTypes, persons,
        Customers, ODSAccno refreshed; the form record is untouched)."""
        ui = dict(b.rec.get("_ui") or {})
        ui["valutes"] = [row(x) for x in ws.conn.query(Q.SQL_VALUTES)]
        ui["types"] = deposit_types(ws.conn, b.state.mode)
        rec = run(clean_rec, b.rec)
        ui["filials"] = filials(ws.conn, None if b.state.mode == CS_ADD else _i(rec.get("BRANCHID")))
        return {"ui": ui}

    return r
