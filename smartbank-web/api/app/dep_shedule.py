"""Sbdm_Shedule_new.bpl (ödəmə planı) - S = SheduleImpl_new.pas, PS = PaymentSheduleimpl_new.pas,
DM = ScheduleDataModuleImpl_new.pas/.dfm. SQL verbatim in dep_ops_sql.py (S_SQL_*).

What actually works in the Delphi form: every TAction in ScheludeActionList (Yaddaşa yaz, Çap, Çıxış, Yeni, Redaktə,
Silmək, Yeniləmək, Planı dəyiş) has no OnExecute, so VCL (DisableIfNoHandler) shows them disabled. ToolButton1Click
(ApplyUpdates + Commit) and ToolButton14Click (delete selected rows) are not assigned to any OnClick in the dfm, so they
never run; ToolButton18Click ('Plan') sets ToolButton1/ToolButton14.Enabled := True, which only re-enables the buttons
visually (a click executes the handler-less action = no-op). Only 'Plan' -> TPaymentShedule_new -> Qəbul does work:
SBCM_PAYMENT_SCHEDULE1_new.sbcmperiod (pmNamed), then OracleDataSet2.Refresh. No Commit is issued by the plugin.
"""
from __future__ import annotations
import datetime as dt

from fastapi import APIRouter, Depends
from pydantic import BaseModel, Field

from . import deposits as D
from . import dep_ops_sql as Q
from .customers import row
from .dep_ops import OErr, float_to_str, selected

PKG_CONV = "sbcm_percent_converting_new"     # DM dfm:282-287 (positional)
PKG_SCH = "SBCM_PAYMENT_SCHEDULE1_new"       # DM dfm:288-294 (pmNamed)
DTP_DEFAULT = dt.date(2010, 4, 23)           # PS dfm DateTimePicker1.Date = 40292.9028 (the get_date line is commented out)
DTP_TIME = "21:40:02"                       # .9028066 of a day: DateTime keeps it when only the date is changed


def _ds(v):          # TDateTimeField.DisplayText (ShortDateFormat dd.mm.yyyy)
    return v.strftime("%d.%m.%Y") if isinstance(v, (dt.datetime, dt.date)) else ""


def _sd(s):          # StrToDate
    try:
        return dt.datetime.strptime(s, "%d.%m.%Y")
    except ValueError:
        raise OErr("deposits.c_err_date", value=s)


def _sf(s):          # StrToFloat / StrToCurr
    try:
        return float(s.replace(",", "."))
    except ValueError:
        raise OErr("deposits.c_err_number", value=s)


def _state(conn, cid):
    cu = conn.query(Q.S_SQL_CUSTOMERS, {"id": cid})
    it = conn.query(Q.S_SQL_INTERESTS, {"id": cid})
    c = cu[0] if cu else {}
    am = c.get("AMOUNT")
    return {"name": c.get("NAME") or "", "amount": "" if am is None else float_to_str(am),
            "interest": float_to_str(it[0].get("INTEREST")) if it else "",
            "opendate": _ds(c.get("OPENDATE")), "closedate": _ds(c.get("CLOSEDATE"))}


def _rows(conn, cid):
    out = []
    for i, r in enumerate(conn.query(Q.S_SQL_SCHEDULE, {"Id": cid}), 1):
        x = row(r); x["seqno"] = i                    # OracleDataSet2SeqNoGetText: RecNo
        x.pop("rowid", None)
        out.append(x)
    return out


def open_form(conn, contract_id, contract_no):
    """exportproc S:84-118: caption '%s № li müqavilə üçün ödəmə planı.', the four datasets for Get_SelectedContID."""
    cid = selected(contract_id)
    return {"caption": "%s № li müqavilə üçün ödəmə planı." % (contract_no or ""), **_state(conn, cid), "rows": _rows(conn, cid)}


def plan_open(conn, contract_id):
    """ToolButton18Click S:150-166: getdateinterval(StrToDate(DBEdit3), StrToDate(DBEdit4)),
    getconverteddebt(interval, StrToFloat(DBEdit1), StrToFloat(DBEdit2)) (CallIntegerFunction),
    Edit1 := OracleDataSet3DATEINTERVAL.AsString ('' when the type has DATEINTERVAL <= 0: the dataset is empty)."""
    cid = selected(contract_id)
    s = _state(conn, cid)
    a, b = _sd(s["opendate"]), _sd(s["closedate"])
    interval = conn.call_func(PKG_CONV, "getdateinterval", [a, b], int)
    debt = conn.call_func(PKG_CONV, "getconverteddebt", [interval, _sf(s["amount"]), _sf(s["interest"])], int)
    t = conn.query(Q.S_SQL_DEPTYPE, {"v_id": cid})
    di = t[0].get("DATEINTERVAL") if t else None
    return {"date": DTP_DEFAULT.isoformat(), "amount": debt, "periods": "" if di is None else str(int(di)), "time": DTP_TIME, "save_enabled": True}


class PlanIn(BaseModel):
    contract_id: int | None = None
    date: dt.date
    amount: float = 0                                  # CMCurrencyEdit1.Value
    periods: str = Field("", max_length=32)            # Edit1.Text -> StrToInt
    time: str = Field("00:00:00", pattern=r"^\d{2}:\d{2}:\d{2}$")   # DateTimePicker1.DateTime keeps its time part


def plan_accept(conn, b: PlanIn):
    """Button1Click PS:44-66: sbcmperiod(deposid, PaymentDate, per_amount, period => StrToInt(Edit1), perc =>
    StrToCurr(form1.DBEdit2)); OracleDataSet2.Refresh. The form stays open."""
    cid = selected(b.contract_id)
    try:
        period = int(b.periods.strip())
    except ValueError:
        raise OErr("deposits.s_err_int", value=b.periods)
    per = _sf(_state(conn, cid)["interest"])
    h, m, s = map(int, b.time.split(":"))
    conn.call_proc(PKG_SCH, "sbcmperiod", [], named={
        "deposid": cid, "PaymentDate": dt.datetime.combine(b.date, dt.time(h, m, s)), "per_amount": round(float(b.amount), 4),
        "period": period, "perc": per}, commit=False)
    return {"rows": _rows(conn, cid)}


class IdIn(BaseModel):
    contract_id: int | None = None
    contract_no: str | None = Field(None, max_length=64)


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/deposits/shedule")
    g = require_module(D.CLSID)

    def run(fn, *a):
        try:
            return fn(*a)
        except OErr as e:
            err(400, e.key, **e.kw)

    @r.post("/open")
    def _open(b: IdIn, ws=Depends(g)):
        return run(open_form, ws.conn, b.contract_id, b.contract_no)   # N36Click: no right check

    @r.post("/plan/open")
    def _plan(b: IdIn, ws=Depends(g)):
        return run(plan_open, ws.conn, b.contract_id)

    @r.post("/plan/accept")
    def _accept(b: PlanIn, ws=Depends(g)):
        return run(plan_accept, ws.conn, b)

    return r
