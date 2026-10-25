"""Rates viewer - port of Delphi Packages/RatesViewer (RatesViewer / TFrmRates, UntRatesImpl.pas/.dfm; one form, no
other copies: CLASS_FrmRates is only in Packages/RatesViewer/RatesViewer_TLB.pas).

UntRatesImpl.dfm: Panel1 (alClient) holds FilterPanel (TGroupBox 'Filter Paneli', alLeft, width 185, no child controls,
dfm:25-32) and DBGrid1 (alClient, no DataSource, dfm:33-44). DataSrcRates -> RatesDataSet (TOracleDataSet) has no
SQL.Strings, no Session and Active = False (dfm:45-83). The unit has no OnCreate and no dataset code
(pas:82-324 is only the ActiveX wrapper); the only handler is ActiveFormKeyDown (pas:326-331): Ctrl+F toggles
FilterPanel.Visible. So the dataset is never opened and the grid is empty. The web does the same and runs no SQL.
"""
from __future__ import annotations

from fastapi import APIRouter, Depends

CLSID = "{8E26DE5D-E665-4803-9C18-4658B3D59CFF}"     # RatesViewer_TLB.pas:46 CLASS_FrmRates


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/ratesviewer")
    g = require_module(CLSID)

    @r.get("/init")
    def _init(ws=Depends(g)):
        return {"active": False, "rows": []}           # RatesDataSet: no SQL, never opened

    return r
