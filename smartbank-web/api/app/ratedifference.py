"""Rate difference - port of Delphi Packages/RateDifference (TRateDifferenceForm, RateDifferenceFormImpl1.pas/.dfm; one
form, no other copies).

The form has ToolBar1 with DBNavigator1 (no DataSource assigned, dfm:26-32) and DBGrid1 (DataSource1 -> OracleDataSet1,
no persistent columns, dfm:34-48). OracleDataSet1 (rd_sql.SQL_RD_ORACLEDATASET1, temptranz) has no Active = True in the
dfm and the unit has no OnCreate / event handlers (pas:72-336 is only the ActiveX wrapper), so the dataset is never
opened: Delphi shows an empty grid and a navigator with all buttons disabled. The web does the same and runs no SQL.
"""
from __future__ import annotations

from fastapi import APIRouter, Depends

from . import rd_sql as Q  # noqa: F401  (kept for reference: OracleDataSet1 is never opened)

CLSID = "{5B149365-5DC6-11D6-AB01-00C0262B568B}"     # RateDifference_TLB.pas CLASS_RateDifferenceForm


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/ratedifference")
    g = require_module(CLSID)

    @r.get("/init")
    def _init(ws=Depends(g)):
        return {"active": False, "rows": []}           # OracleDataSet1 closed

    return r
