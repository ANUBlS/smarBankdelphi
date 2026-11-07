"""SBDM_Capitalize_new.bpl (kapitallaşdırma) - K = frmCapitalizeImpl_new.pas, KA = frmAddCapitalizeImpl_new.pas.
SQL verbatim in dep_ops_sql.py (K_SQL_*). sbcm_payment = sbcm_payment_new (pmNamed).
- ActnDel has no OnUpdate: enabled on an empty grid too (DeleteCapitalization(0)).
- ActnExport: enabled when Capitals.RecordCount > 0; sheet 'Kapitallaşdırma', TRID hidden.
- Capitalization(...) is called outside the try (no CommitWithDrawMoney(False) if it raises); TrDelayed_Show caption is
  'Depozit karitallaşdırılması ...' (typo in the source, kept); OK -> mrOk -> Capitals.Refresh; CanAfterRefresh is set
  but never read (the manager grid is not refreshed). İmtina / Esc only close (no rollback).
"""
from __future__ import annotations

from fastapi import APIRouter, Depends
from fastapi.responses import Response
from pydantic import BaseModel

from . import deposits as D
from . import dep_ops_sql as Q
from .customers import row
from .dep_ops import OErr, PKG_PAY, XLSX, bank_date, selected, start_delayed, xlsx, _i

EXPORT = [("ID", "№", "f"), ("HDATE", "Tarix", "d"), ("TOTAL", "Məbləğ", "f")]


def open_form(conn, contract_id, contract_no=None):
    """exportproc K:66-88: DepositInfo, Capitals; Caption := no + ' nömrəli depozitin  kapitallaşdırılması'."""
    cid = selected(contract_id)
    info = conn.query(Q.K_SQL_DEPOSITINFO, {"ContractID": cid})
    caps = [row(x) for x in conn.query(Q.K_SQL_CAPITALS, {"ContractID": cid})]
    return {"caption": (contract_no or "") + " nömrəli depozitin  kapitallaşdırılması", "info": row(info[0]) if info else {},
            "rows": caps}


def add_open(conn, contract_id):
    """FormShow KA: DTPCapital := Get_BankDate (disabled), EdCapital := 0."""
    o = open_form(conn, contract_id)
    return {"info": o["info"], "date": bank_date(conn).date().isoformat(), "total": 0}


class RunIn(BaseModel):
    contract_id: int | None = None
    total: float = 0


def run_cap(conn, b: RunIn):
    """ActnTransExecute KA (ActnTransUpdate: EdCapital.Value > 0): Capitalization(ContractID, HDate => Get_BankDate,
    Total, UseTransactions => True)."""
    if not b.total > 0:
        raise OErr("deposits.m_err_disabled")
    cid = selected(b.contract_id)
    conn.call_proc(PKG_PAY, "Capitalization", [], named={"ContractID": cid, "HDate": bank_date(conn), "Total": float(b.total),
                                                         "UseTransactions": True}, commit=False)


class IdIn(BaseModel):
    contract_id: int | None = None
    contract_no: str | None = None
    item_id: int | None = None


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/deposits/capitalize")
    g = require_module(D.CLSID)

    def run(fn, *a):
        try:
            return fn(*a)
        except OErr as e:
            err(400, e.key, **e.kw)

    @r.post("/open")
    def _open(b: IdIn, ws=Depends(g)):
        D.check_right(ws.conn, "NEW_SBCM_CAPITALIZATION")                  # miCapitalizationClick (manager)
        return run(open_form, ws.conn, b.contract_id, b.contract_no)

    @r.post("/add/open")
    def _add(b: IdIn, ws=Depends(g)):
        D.check_right(ws.conn, "INSERT_SBCM_CAPITALIZATION")               # ActnAddTrExecute
        return run(add_open, ws.conn, b.contract_id)

    @r.post("/run")
    def _run(b: RunIn, ws=Depends(g)):
        D.check_right(ws.conn, "INSERT_SBCM_CAPITALIZATION")
        return run(start_delayed, ws, "capitalize", run_cap, b)

    @r.post("/delete")
    def _del(b: IdIn, ws=Depends(g)):
        """ActnDelExecute: DELETE_SBCM_CAPITALIZATION, confirm, DeleteCapitalization(p_capitalizationID), Refresh; no commit."""
        D.check_right(ws.conn, "DELETE_SBCM_CAPITALIZATION")
        run(selected, b.contract_id)
        ws.conn.call_proc(PKG_PAY, "DeleteCapitalization", [], named={"p_capitalizationID": _i(b.item_id)}, commit=False)
        return run(open_form, ws.conn, b.contract_id, b.contract_no)

    @r.post("/export.xlsx")
    def _xlsx(b: IdIn, ws=Depends(g)):
        rows = ws.conn.query(Q.K_SQL_CAPITALS, {"ContractID": run(selected, b.contract_id)})
        if not rows:
            err(400, "deposits.m_err_disabled")                            # ActnExportUpdate
        D.check_right(ws.conn, "EXCEL_SBCM_CAPITALIZATION")
        return Response(xlsx(rows, EXPORT, "Kapitallaşdırma"), media_type=XLSX,
                        headers={"Content-Disposition": 'attachment; filename="Kapitallasdirma.xlsx"'})

    return r
