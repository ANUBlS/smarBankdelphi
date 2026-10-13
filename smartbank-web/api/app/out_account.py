"""Off-balance accounts - port of Delphi Packages/Out_account/ocx (TAccountForm, CLSID below).

out_account.dpr compiles AccountImpl.pas (main form), AccountDataModuleImpl.pas (Tout_accdatamodule), AccountPropertiesImpl.pas
(editor), AccountFlagsImpl.pas (symbols), AccountRestState.pas (rests & turnovers), AccountTransactionsImpl.pas + IntervalImpl.pas
(documents for a period). The out_*.pas files in the same folder are NOT in the .dpr and are not ported.
This is a different code base from Packages/Accounts (no shared logic is reused except the DOA helpers). SQL: out_acc_sql.py.
"""
from __future__ import annotations
import datetime
import re
from decimal import Decimal

from fastapi import APIRouter, Depends
from pydantic import BaseModel

from .delphi import subst, page_sql, date_only
from .customers import row
from . import out_acc_sql as Q

CLSID = "{0E7C0852-BA22-45DC-8A22-368D2FF5F4C2}"     # out_account_TLB.pas:56 CLASS_AccountForm
OBJ = "out_account"                                  # SB_ACA.CheckObjectAccess('out_account', ...) AccountImpl.pas:539/550/564
FETCH = 1000                                         # Account.ReadBuffer = 1000 (AccountDataModuleImpl.dfm)

# Grid columns (AccountImpl.dfm:60-213). GridAccountTitleClick (AccountImpl.pas:1014-1027) puts Column.FieldName into the
# :title substitution variable; only these names can reach the SQL (whitelist, never user text).
TITLE_FIELDS = ("ACC_NO", "BAL_CN1", "VAL_ACC", "KLI_ID", "NAME", "OPEN_DAT", "CLOSE_DAT", "SIM_OTCET", "BAL_CN2",
                "OLD_ACC_NO", "EXPERT")
DEFAULT_TITLE = "acc_no"                             # Variables.Data :TITLE = 'acc_no'
OLD_ACC_NO_OK = re.compile(r"^[A-Za-z0-9/\-]*$")     # AccountPropertiesImpl.pas:228-232 DBEdit1KeyPress (#8 = backspace)


class BadInput(Exception):
    def __init__(self, key: str):
        self.key = key


# ------------------------------------------------------------------------------------------------ list / filter
def build_filter(f: dict) -> tuple[str, dict]:
    """ActionFilterExecute AccountImpl.pas:841-963. Same FilterStr text; the Format('%d'/'%s') values are bound instead
    (ints are int()-checked, Tipacc/Bal_cn1 become :binds). Returns (FilterStr after the Status->DECODE replace, binds)."""
    b: dict = {}
    status = int(f.get("status", 1))                         # GBAccountStatus ItemIndex (dfm:482 default 1)
    if status not in (0, 1, 2):
        raise BadInput("error.generic")
    s = "status is not null" if status == 0 else "(Status=%d)" % status           # :906-909
    if f.get("filial") is not None:                                             # CBFilial  (Filial=%d)
        s += " AND " + "(Filial=%d)" % int(f["filial"])
    if f.get("currency") is not None:                                           # CBValyuta (Val_acc=%d)
        s += " AND " + "(Val_acc=%d)" % int(f["currency"])
    if f.get("user") is not None:                                               # CBUser    (Op_ID=%d)
        s += " AND " + "(Op_ID=%d)" % int(f["user"])
    if f.get("tipacc") is not None:                                             # CbAccType (Tipacc like  '%X%')
        s += " AND " + "(Tipacc like  :f_tipacc)"
        b["f_tipacc"] = "%" + str(f["tipacc"]) + "%"
    if f.get("bal_cn") is not None:                                             # CBBal_Cn  (Bal_cn1=<DBLookupBalance.Text>)
        s += " AND " + "(Bal_cn1=:f_bal_cn)"
        b["f_bal_cn"] = str(f["bal_cn"])
    return s, b


def account_sql(f: dict, title: str | None) -> tuple[str, dict]:
    """sql[6] := ' where '+FilterStr; then StringReplace(sql.text,'Status','DECODE (close_dat, NULL, 1, 2)',[rfReplaceAll,
    rfIgnoreCase]) on the whole text (:946-947); :title substituted (DOA otSubst)."""
    flt, b = build_filter(f)
    lines = list(Q.ACCOUNT_SQL_LINES)
    lines[6] = " where " + flt
    text = "\r\n".join(lines) + "\r\n"
    text = re.sub("status", "DECODE (close_dat, NULL, 1, 2)", text, flags=re.IGNORECASE)
    t = (title or DEFAULT_TITLE).strip()
    if t.upper() not in TITLE_FIELDS:
        t = DEFAULT_TITLE
    return subst(text, "title", t), b


def list_accounts(conn, f: dict, title: str | None, offset: int = 0, limit: int = FETCH):
    sql, b = account_sql(f, title)
    rows = conn.query(page_sql(sql), {**b, "lo__": offset, "hi__": offset + limit + 1})
    return [row(r) for r in rows[:limit]], len(rows) > limit


def get_account(conn, acc_id: int) -> dict | None:
    """Current record of Account (all statuses) - the row the Delphi dialogs read via FieldByName."""
    sql, b = account_sql({"status": 0}, None)
    sql = sql.replace(" where DECODE (close_dat, NULL, 1, 2) is not null",
                      " where DECODE (close_dat, NULL, 1, 2) is not null AND (ID=:f_id)")
    rows = conn.query(sql, {**b, "f_id": int(acc_id)})
    return row(rows[0]) if rows else None


def rests(conn, acc_id: int) -> dict:
    """Panel3 DBEdit1..4 + editor DayStartStateGB: all bound to Tenostat (OSTAT / POK_OSTAT). Lazyrest is opened but no
    control shows it. Both the 'Plan.' and the plain panel show Tenostat (AccountImpl.dfm:247-335) - kept as is."""
    t = conn.query(Q.SQL_TENOSTAT, {"acc_id": int(acc_id)})
    t = t[0] if t else {}
    return {"ostat": t.get("OSTAT"), "pok_ostat": t.get("POK_OSTAT")}


def lookups(conn) -> dict:
    """InitData AccountImpl.pas:603-639 + editor lookups (Customers via pkg_report.get_customers, cm_expert)."""
    flags = [row(r) for r in conn.query(Q.SQL_ACC_FLAGS)]
    pair = [row(r) for r in conn.query(Q.SQL_PAIR_ACCOUNT)]
    sysdat = conn.query(Q.SQL_SYSDAT)
    td = sysdat[0]["TEK_DAT"] if sysdat else None
    return {
        "branches": [row(r) for r in conn.query(Q.SQL_BRANCHES)],
        "users": [row(r) for r in conn.query(Q.SQL_USERS)],
        "currencies": [row(r) for r in conn.query(Q.SQL_CURRENCY)],
        "acc_flags": flags,
        "bal_acc": [row(r) for r in conn.query(Q.SQL_BAL_ACC)],
        "bal_acc_new": [row(r) for r in conn.query(Q.SQL_BAL_ACC_NEW)],
        "report_symbols": [row(r) for r in conn.query(Q.SQL_REPORT_SYMBOL)],
        "pair_accounts": [p for p in pair if p.get("status") == 1],          # PairAccountBeforeOpen Filter 'Status = 1'
        "customers": [{"id": r.get("ID"), "name": r.get("NAME")} for r in conn.cursor_block(Q.SQL_CUSTOMERS, "p_result")],
        "experts": [{"id": r.get("ID"), "name": r.get("NAME")} for r in conn.query(Q.SQL_EXPERTS)],
        "tek_dat": (td.date() if isinstance(td, datetime.datetime) else td).isoformat() if td else None,
    }


# ------------------------------------------------------------------------------------------------ editor
class AccIn(BaseModel):
    """Fields of AccountPropertiesForm (AccountPropertiesImpl.dfm:152-341, 572-590)."""
    acc_no: str | None = None
    val_acc: int | None = None
    bal_cn1: int | None = None
    kli_id: int | None = None
    open_dat: datetime.date | None = None
    pair_acc: int | None = None
    limit: float | None = None
    sim_otcet: int | None = None
    filial: int | None = None
    name: str | None = None
    tipacc: str | None = None
    old_acc_no: str | None = None
    tempid: int | None = None
    bal_cn2: int | None = None


def _int(v) -> int:
    return int(v) if v is not None else 0          # TField.AsInteger of NULL = 0


def build_account(a: AccIn, cur: dict | None) -> dict:
    """AccountApplyRecord.BuildAccount AccountDataModuleImpl.pas:230-255. Fields that are not on the editor (op_id, bal_cn3,
    bal_cn4, insider; close_dat) keep the current record's value (insert: NULL -> AsInteger 0 / AsString '')."""
    c = cur or {}
    if a.old_acc_no and not OLD_ACC_NO_OK.match(a.old_acc_no):
        raise BadInput("out_account.err_old_acc_no")
    od = a.open_dat
    return {
        "customerid": _int(a.kli_id), "op_id": _int(c.get("op_id")), "accno": a.acc_no or "",
        "currencyid": _int(a.val_acc), "name": a.name or "",
        "open_dat": datetime.datetime(od.year, od.month, od.day) if od else None,   # Int(DTPOpenDate.DateTime) :99
        "balcn": _int(a.bal_cn1), "limit": float(Decimal(str(a.limit or 0))),
        "close_dat": None,                                   # AsDateTime of NULL = 0.0 in Delphi, see PARITY
        "bal_cn2": _int(a.bal_cn2), "bal_cn3": _int(c.get("bal_cn3")), "bal_cn4": _int(c.get("bal_cn4")),
        "filial": _int(a.filial), "sim_otcet": _int(a.sim_otcet), "typeacc": a.tipacc or "",
        "old_acc_no": a.old_acc_no or "", "pair_acc": _int(a.pair_acc), "insider": c.get("insider") or "",
        "v_tempid": _int(a.tempid),
    }


def add_account(conn, a: AccIn) -> int:
    conn.call_proc("SB_ACA", "CheckObjectAccess", [OBJ, "insert"], commit=False)          # ToolButton2Click :536-545
    p = build_account(a, None)
    new_id = conn.call_func("OUT_SBOP", "add_account", [], int, named=p)                  # AddAccount :148-172
    conn.commit()                                                                         # CommitOnPost (DOA default)
    return new_id


def update_account(conn, acc_id: int, a: AccIn) -> None:
    conn.call_proc("SB_ACA", "CheckObjectAccess", [OBJ, "update"], commit=False)          # ToolButton3Click :547-557
    cur = get_account(conn, acc_id)
    if not cur:
        raise BadInput("error.not_found")
    p = build_account(a, cur)
    named = {"v_id": int(acc_id)}
    for k, v in p.items():                                                                # UpdateAccount :174-199 ('v_' names)
        named[k if k.startswith("v_") else "v_" + k] = v
    conn.call_proc("OUT_SBOP", "upd_account", [], named=named, commit=False)
    conn.commit()


def close_account(conn, acc_id: int) -> None:
    """ToolButton4Click AccountImpl.pas:559-571: CheckObjectAccess delete, confirm, CloseAccount(accid, doclose=1) :201-208.
    No balance check and no 'already closed' check in this unit (unlike Packages/Accounts)."""
    conn.call_proc("SB_ACA", "CheckObjectAccess", [OBJ, "delete"], commit=False)
    conn.call_proc("OUT_SBOP", "close_account", [], named={"accid": int(acc_id), "doclose": 1}, commit=False)
    conn.commit()   # Delphi: no explicit commit here (next CommitOnPost / session end) - see PARITY


def generate_acc_no(conn, a: AccIn) -> str:
    """SpeedButton1Click AccountPropertiesImpl.pas:192-221: OUT_SBOP.GenerateAccountNumber with the fields AsString;
    AnalitKod = 0 when the report-symbol lookup shows 0, else SIM_OTCET."""
    s = lambda v: "" if v is None else str(v)
    return conn.call_func("OUT_SBOP", "GenerateAccountNumber", [], str, named={
        "BalCn": s(a.bal_cn1), "CurrencyID": s(a.val_acc), "CustomerID": s(a.kli_id), "BranchID": s(a.filial),
        "BalCN2": s(a.bal_cn2), "AnalitKod": 0 if not a.sim_otcet else a.sim_otcet})


def flags_dialog(conn, acc_id: int | None) -> list[dict]:
    """TFormAccFlags.FormCreate AccountFlagsImpl.pas:33-52: AccFlags.First; Next (first row skipped); in edit mode each item is
    checked by OUT_SBUTIL.FlagExsist(AccID=>, FlagChar=>Symbol[1])."""
    rows = [row(r) for r in conn.query(Q.SQL_ACC_FLAGS)][1:]
    out = []
    for r in rows:
        sym = (r.get("symbol") or " ")[0]
        chk = bool(acc_id) and conn.call_bool("OUT_SBUTIL", "FlagExsist", [], named={"AccID": int(acc_id), "FlagChar": sym})
        out.append({"name": r.get("name"), "checked": chk})
    return out


def flag_map(names: list[str]) -> str:
    """ButtonApplyClick AccountFlagsImpl.pas:54-69: ',' + first char of each checked item text, leading ',' deleted."""
    return ",".join((n or " ")[0] for n in names)


# ------------------------------------------------------------------------------------------------ documents / states
def _sum(rows, f):
    t = Decimal(0)                                  # FillAmounts :146-171 (Currency)
    for r in rows:
        t += Decimal(str(r.get(f) or 0))
    return float(t)


def transactions(conn, acc: dict, start: datetime.date, end: datetime.date) -> dict:
    """OpenDataControls AccountTransactionsImpl.pas:94-115; CalcFields set DebitAccNo / CreditAccNo to the account's acc_no."""
    b = {"AccountID": int(acc["id"]), "StartDate": date_only(start), "EndDate": date_only(end)}
    deb = [{**row(r), "debitaccno": acc["acc_no"]} for r in conn.query(Q.SQL_DEBIT_TRANSACTIONS, b)]
    cre = [{**row(r), "creditaccno": acc["acc_no"]} for r in conn.query(Q.SQL_CREDIT_TRANSACTIONS, b)]
    return {"debit": deb, "credit": cre, "debit_total": _sum(deb, "debitamount"), "debit_ltotal": _sum(deb, "lamount"),
            "credit_total": _sum(cre, "creditamount"), "credit_ltotal": _sum(cre, "lamount")}


def states(conn, acc_id: int) -> list[dict]:
    return [row(r) for r in conn.query(Q.SQL_ACC_STATE, {"AccID": int(acc_id)})]      # AccountRestState.FormActivate :88-108


# ------------------------------------------------------------------------------------------------ router
def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/out-account")
    g = require_module(CLSID)

    def bad(e: BadInput):
        err(404 if e.key == "error.not_found" else 400, e.key)

    def acc_or_404(c, acc_id):
        a = get_account(c, acc_id)
        if not a:
            err(404, "error.not_found")
        return a

    @r.get("/lookups")
    def _lk(ws=Depends(g)):
        return lookups(ws.conn)

    @r.get("")
    def _list(status: int = 1, filial: int | None = None, currency: int | None = None, user: int | None = None,
              tipacc: str | None = None, bal_cn: str | None = None, title: str | None = None,
              offset: int = 0, limit: int = FETCH, ws=Depends(g)):
        try:
            rows, more = list_accounts(ws.conn, dict(status=status, filial=filial, currency=currency, user=user,
                                                     tipacc=tipacc, bal_cn=bal_cn), title,
                                       max(0, offset), max(1, min(limit, FETCH)))
        except BadInput as e:
            bad(e)
        return {"rows": rows, "more": more, "offset": offset}

    @r.get("/flags/new")
    def _flags_new(ws=Depends(g)):
        return flags_dialog(ws.conn, None)

    @r.post("/flag-map")
    def _fmap(names: list[str], ws=Depends(g)):
        return {"tipacc": flag_map(names)}

    @r.post("/generate-acc-no")
    def _gen(body: AccIn, ws=Depends(g)):
        return {"acc_no": generate_acc_no(ws.conn, body)}

    @r.get("/{acc_id}")
    def _get(acc_id: int, ws=Depends(g)):
        return {**acc_or_404(ws.conn, acc_id), "rests": rests(ws.conn, acc_id)}

    @r.get("/{acc_id}/flags")
    def _flags(acc_id: int, ws=Depends(g)):
        return flags_dialog(ws.conn, acc_id)

    @r.post("")
    def _add(body: AccIn, ws=Depends(g)):
        try:
            return {"id": add_account(ws.conn, body)}
        except BadInput as e:
            bad(e)

    @r.put("/{acc_id}")
    def _upd(acc_id: int, body: AccIn, ws=Depends(g)):
        try:
            update_account(ws.conn, acc_id, body)
        except BadInput as e:
            bad(e)
        return {"ok": True}

    @r.post("/{acc_id}/close")
    def _close(acc_id: int, ws=Depends(g)):
        acc_or_404(ws.conn, acc_id)
        close_account(ws.conn, acc_id)
        return {"ok": True}

    @r.get("/{acc_id}/transactions")
    def _tr(acc_id: int, start: datetime.date | None = None, end: datetime.date | None = None, ws=Depends(g)):
        a = acc_or_404(ws.conn, acc_id)
        if start is None:                    # ActionAccTransExecute :703-727: Start = Sysdat.tek_dat, End = Start
            td = ws.conn.query(Q.SQL_SYSDAT)[0]["TEK_DAT"]
            start = td.date() if isinstance(td, datetime.datetime) else td
        end = end or start
        return {"start": start.isoformat(), "end": end.isoformat(), "acc_no": a["acc_no"], **transactions(ws.conn, a, start, end)}

    @r.get("/{acc_id}/states")
    def _st(acc_id: int, ws=Depends(g)):
        a = acc_or_404(ws.conn, acc_id)
        return {"acc_no": a["acc_no"], "rows": states(ws.conn, acc_id)}

    return r
