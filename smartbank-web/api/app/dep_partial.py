"""SBDM_PartialPayment_new.bpl (qismən ödəmə) - F = FrmPartialPaymentImpl_new.pas, A = FrmPaymentAddImpl_new.pas,
DM = DataModPartialPaymentImpl_new.dfm (SQL verbatim in dep_ops_sql.py, PP_*).

What the production plugin actually does (kept as is):
- Payments = sbcm_tranches_new rows of the contract (AutoNumber №, Tarix, Faiz, Yatrım Məbləği, Qeyd).
- Ləğv et / Excel-ə at: ActnDel / ActnExprt have no OnExecute (VCL DisableIfNoHandler -> disabled); their OnClick handlers
  (ToolButton5Click / ToolButton7Click) only call checkadvancedobjectaccess and nothing else.
- Yeni: INSERT_SBCM_PARTIAL_PEYMENT, then FrmPaymentAdd_new (FormShow zeroes the three amounts).
- FrmPaymentAdd_new: Qəbul is ActionTr, which has only OnUpdate (Enabled := EdMainDebit.Value > 0) and no OnExecute, so a
  click does nothing; EdMainDebitChange (SetPaymentPecentAmount) is not assigned to EdMainDebit.OnChange in the dfm, so the
  interest fields stay 0. N1 'Əməliyyata baxmaq' has no OnClick.
"""
from __future__ import annotations
import datetime as dt

from fastapi import APIRouter, Depends
from pydantic import BaseModel

from . import deposits as D
from . import dep_ops_sql as Q
from .customers import row
from .dep_ops import OErr, selected, _i


def open_form(conn, contract_id):
    """exportproc F:43-87: Payments, DepositInfo, DebitAccs, CreditAccs, PercentAccs, Sysdat."""
    cid = selected(contract_id)
    pays = [row(x) for x in conn.query(Q.PP_SQL_PAYMENTS, {"ContractID": cid})]
    for x in pays:
        x.pop("rowid", None)
    info = conn.query(Q.PP_SQL_DEPOSITINFO, {"ContractID": cid})
    return {"rows": pays, "name": info[0].get("NAME") if info else ""}


def add_open(conn, contract_id, item_id):
    """ActnAddExecute F:120-129 -> FrmPaymentAdd_new: Əməliyyat Tarixi = Sysdat.TEK_DAT, CreditAccs.ACC_NO + client name,
    Əsas məbləğ: DebitAccs.ACC_NO, Qalıq = current Payments.TOTAL; Faiz məbləği: PercentAccs.ACC_NO; FormShow A:62-67 zeroes."""
    cid = selected(contract_id)
    first = lambda sql: (conn.query(sql, {"contractid": cid}) or [{}])[0]          # noqa: E731
    pays = conn.query(Q.PP_SQL_PAYMENTS, {"ContractID": cid})
    cur = next((p for p in pays if _i(p.get("ID")) == _i(item_id)), pays[0] if pays else {})
    sd = conn.query(Q.PP_SYSDAT)[0]["TEK_DAT"]
    info = conn.query(Q.PP_SQL_DEPOSITINFO, {"ContractID": cid})
    return {"tek_dat": sd.strftime("%d.%m.%Y") if isinstance(sd, (dt.date, dt.datetime)) else str(sd),
            "creditacc": first(Q.PP_SQL_CREDITACCS).get("ACC_NO"), "name": info[0].get("NAME") if info else "",
            "debitacc": first(Q.PP_SQL_DEBITACCS).get("ACC_NO"), "total": cur.get("TOTAL"),
            "percentacc": first(Q.PP_SQL_PERCENTACCS).get("ACC_NO"), "main": 0, "rest": 0, "interest": 0}


class IdIn(BaseModel):
    contract_id: int | None = None
    item_id: int | None = None


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/deposits/partial")
    g = require_module(D.CLSID)

    def run(fn, *a):
        try:
            return fn(*a)
        except OErr as e:
            err(400, e.key, **e.kw)

    @r.post("/open")
    def _open(b: IdIn, ws=Depends(g)):
        D.check_right(ws.conn, "NEW_SBCM_PARTIAL_PEYMENT")                 # N15Click (manager)
        return run(open_form, ws.conn, b.contract_id)

    @r.post("/add/open")
    def _add(b: IdIn, ws=Depends(g)):
        D.check_right(ws.conn, "INSERT_SBCM_PARTIAL_PEYMENT")              # ActnAddExecute
        return run(add_open, ws.conn, b.contract_id, b.item_id)

    return r
