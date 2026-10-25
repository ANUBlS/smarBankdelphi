"""SBDM_UntimelyEtMoney_new.bpl (vaxtından əvvəl ödəmə) - U = frmUntimelyEtMoneyImpl_new.pas, SQL verbatim in
dep_ops_sql.py (U_SQL_*). frmUntimelyEtMoneyImpl.pas/.dfm in the same folder is an unused older copy (no handlers).

- AccountListCB has no ListSource (empty) and DBEditEh8 (DepositAccno.ACC_NO) lies on top of it, so 'Kredit Hesabın №'
  shows the outComeAccForDeposit account, and Button1Click uses DepositAccno.ID as p_CreditAccID. CreditAccs is opened
  (KeyValue := first row) but never used.
- UntimeWithDrawMoney is called outside the try: if it raises, no CommitWithDrawMoney(False) is issued.
- TrDelayed_Show OK -> ModalResult := mrOk (form closes); dismissed -> the form stays open.
- İmtina: Session.Rollback + Close; Esc (KeyPreview) only closes.
"""
from __future__ import annotations
import datetime as dt

from fastapi import APIRouter, Depends
from pydantic import BaseModel

from . import deposits as D
from . import dep_ops_sql as Q
from .customers import row
from .dep_ops import OErr, PKG_PAY, bank_date, selected, start_delayed, _i


def _d(v):
    return v.date().isoformat() if isinstance(v, dt.datetime) else None


def open_form(conn, contract_id, contract_no=None):
    """exportproc U:83-112 + FormShow U:224-228: DepositInfo, CreditAccs, DepositAccno; DTPCalcPercent := OpenDate,
    DTPBankDate := Get_BankDate. Caption := Get_SelectedContNo + ' nömrəli depozitin vaxtından əvvəl ödənilməsi'."""
    cid = selected(contract_id)
    info = conn.query(Q.U_SQL_DEPOSITINFO, {"ContractID": cid})
    conn.query(Q.U_SQL_CREDITACCS)                                     # opened, unused (see module doc)
    da = conn.query(Q.U_SQL_DEPOSITACCNO, {"ContractID": cid})
    i = info[0] if info else {}
    return {"caption": (contract_no or "") + " nömrəli depozitin vaxtından əvvəl ödənilməsi",
            "info": row(i) if i else {}, "depositacc": row(da[0]) if da else {},
            "calcdate": _d(i.get("OPENDATE")) or "1899-12-30", "bankdate": bank_date(conn).date().isoformat(), "full": False}


class RunIn(BaseModel):
    contract_id: int | None = None
    calcdate: dt.date                    # DTPCalcPercent (Trunc)
    full: bool = False                   # XFCheckBox1 'Hesablanmış % tam ödənsin'


def run_untimely(conn, b: RunIn):
    """Button1Click U:114-160: UntimeWithDrawMoney(ContractID, p_CalcPercentDate, p_CreditAccID => DepositAccno.ID,
    p_checdpercentpeyment => 1/0, p_FACTICALINTDEBT => DepositInfo.FACTICALINTERESTDEBT)."""
    cid = selected(b.contract_id)
    da = conn.query(Q.U_SQL_DEPOSITACCNO, {"ContractID": cid})
    info = conn.query(Q.U_SQL_DEPOSITINFO, {"ContractID": cid})
    fid = info[0].get("FACTICALINTERESTDEBT") if info else None
    conn.call_proc(PKG_PAY, "UntimeWithDrawMoney", [], named={
        "ContractID": cid, "p_CalcPercentDate": dt.datetime.combine(b.calcdate, dt.time()),
        "p_CreditAccID": _i(da[0].get("ID")) if da else 0, "p_checdpercentpeyment": 1 if b.full else 0,
        "p_FACTICALINTDEBT": float(fid or 0)}, commit=False)


class IdIn(BaseModel):
    contract_id: int | None = None
    contract_no: str | None = None


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/deposits/untimely")
    g = require_module(D.CLSID)

    def run(fn, *a):
        try:
            return fn(*a)
        except OErr as e:
            err(400, e.key, **e.kw)

    @r.post("/open")
    def _open(b: IdIn, ws=Depends(g)):
        D.check_right(ws.conn, "NEW_SBCM_UNTIMELY")                       # miUntimelyWithdrawClick (manager)
        return run(open_form, ws.conn, b.contract_id, b.contract_no)

    @r.post("/run")
    def _run(b: RunIn, ws=Depends(g)):
        D.check_right(ws.conn, "NEW_SBCM_UNTIMELY")
        return run(start_delayed, ws, "untimely", run_untimely, b)

    @r.post("/cancel")
    def _cancel(ws=Depends(g)):
        """Button2Click U:162-166: sbcm_payment.Session.Rollback; Close."""
        ws.conn.rollback()
        return {"ok": True}

    return r
