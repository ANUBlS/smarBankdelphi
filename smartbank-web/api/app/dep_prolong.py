"""SBDM_Prolongation_new.bpl (Prolonqasiya) - P = frmProlongationImpl_new.pas, PA = frmAddProlongationImpl_new.pas.
SQL verbatim from frmProlongationImpl_new.dfm. sbcm_prolongation (sbcm_prolongation_new) has no ParameterMode in the
dfm, i.e. DOA's default pmPositional: CallProcedure args are passed positionally. Neither AddProlongation nor
DelLastProlongation is followed by a Commit in the plugin (the session transaction stays open, as in Delphi).
"""
from __future__ import annotations
import datetime as dt

from fastapi import APIRouter, Depends
from fastapi.responses import Response
from pydantic import BaseModel

from . import deposits as D
from .customers import row
from .dep_ops import OErr, XLSX, bank_date, selected, xlsx
from . import dep_ops_sql as Q

PKG = "sbcm_prolongation_new"          # frmProlongationImpl_new.dfm:428-433

# ExportDataset(prolongations, 'Prolonqasiya', True): visible fields (ID# is Visible = False)
EXPORT = [("ID", "№", "f"), ("HDATE", "Tarix", "d"), ("OLDDATE", "Əvvəlki tarix", "d"), ("NEWDATE", "Yeni tarix", "d")]


def _d(v):
    return v.date().isoformat() if isinstance(v, dt.datetime) else (v.isoformat() if isinstance(v, dt.date) else v)


def open_form(conn, contract_id):
    """exportproc P:68-89: prolongations + DepositInf for Get_SelectedContID."""
    cid = selected(contract_id)
    pr = [row(x) for x in conn.query(Q.P_SQL_PROLONGATIONS, {"Contractid": cid})]
    di = conn.query(Q.P_SQL_DEPOSITINF, {"ContractID": cid})
    return {"rows": pr, "closedate": _d(di[0]["CLOSEDATE"]) if di else None}


def add_open(conn, contract_id):
    """FormShow PA:94-98: DTPNew := Get_BankDate; DTPLast := DepositInf CloseDate."""
    o = open_form(conn, contract_id)
    o["newdate"] = bank_date(conn).date().isoformat()
    return o


class IdIn(BaseModel):
    contract_id: int | None = None


class AddIn(BaseModel):
    contract_id: int | None = None
    newdate: dt.date


def add(conn, b: AddIn):
    """BitBtnOkClick PA:44-72: ProlongDate <= CloseDate -> rsInvalidDate; else AddProlongation(ContractID, Get_BankDate,
    ProlongDate); prolongations.Refresh; DepositInf.Refresh."""
    cid = selected(b.contract_id)
    di = conn.query(Q.P_SQL_DEPOSITINF, {"ContractID": cid})
    close = di[0]["CLOSEDATE"] if di else None                     # FieldByName('CloseDate').AsDateTime: Null -> 0
    pd = dt.datetime.combine(b.newdate, dt.time())
    if close is not None and pd <= close or close is None and pd <= dt.datetime(1899, 12, 30):
        raise OErr("deposits.p_err_date")                           # 'Tarixi düzgün  daxil edin !'
    conn.call_proc(PKG, "AddProlongation", [cid, bank_date(conn), pd], commit=False)
    return open_form(conn, cid)


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/deposits/prolong")
    g = require_module(D.CLSID)

    def run(fn, *a):
        try:
            return fn(*a)
        except OErr as e:
            err(400, e.key, **e.kw)

    @r.post("/open")
    def _open(b: IdIn, ws=Depends(g)):
        D.check_right(ws.conn, "NEW_SBCM_PROLONGATION")                # N9Click (manager)
        return run(open_form, ws.conn, b.contract_id)

    @r.post("/add/open")
    def _add_open(b: IdIn, ws=Depends(g)):
        D.check_right(ws.conn, "INSERT_SBCM_PROLONGATION")             # ActnAddProlongExecute P:93-100
        return run(add_open, ws.conn, b.contract_id)

    @r.post("/add")
    def _add(b: AddIn, ws=Depends(g)):
        D.check_right(ws.conn, "INSERT_SBCM_PROLONGATION")
        return run(add, ws.conn, b)

    @r.post("/delete")
    def _del(b: IdIn, ws=Depends(g)):
        """ActnDelExecute P:102-117 (ActnDelUpdate: RecordCount > 0): DelLastProlongation(Get_SelectedContID)."""
        o = run(open_form, ws.conn, b.contract_id)
        if not o["rows"]:
            err(400, "deposits.m_err_disabled")
        D.check_right(ws.conn, "DELETE_SBCM_PROLONGATION")
        ws.conn.call_proc(PKG, "DelLastProlongation", [run(selected, b.contract_id)], commit=False)
        return run(open_form, ws.conn, b.contract_id)

    @r.post("/export.xlsx")
    def _xlsx(b: IdIn, ws=Depends(g)):
        rows = ws.conn.query(Q.P_SQL_PROLONGATIONS, {"Contractid": run(selected, b.contract_id)})
        if not rows:
            err(400, "deposits.m_err_disabled")                        # ActnExportUpdate
        D.check_right(ws.conn, "EXCEL_SBCM__PROLONGATION")             # sic: double underscore in P:127
        return Response(xlsx(rows, EXPORT, "Prolonqasiya"), media_type=XLSX,
                        headers={"Content-Disposition": 'attachment; filename="Prolonqasiya.xlsx"'})

    return r
