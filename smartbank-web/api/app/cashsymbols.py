"""Cash symbols - port of Delphi Packages/CashSymbols (TCashSymbolX, CashSymbolImpl.pas). SQL verbatim in csy_sql.py.

ActiveFormCreate: ODSCashSymbols.Open, CBAssignment.ItemIndex := 0. Grid popup Add / Update / Delete (ActionList):
Add / Update show PanelAdd (ESymbol, EName, CBAssignment 'Mədaxil' / 'Məxaric'), 'Qəbul' (Button1Click) calls
SB_CashReport.AddCashSymbols(ESymbol.text, EName.text, CBAssignment.ItemIndex) or
UpdateCashSymbols(FieldByName('Symbol').Value, ESymbol.text, EName.text, CBAssignment.ItemIndex), then Refresh and hides
the panel. Delete asks 'Do you want delete this cash symbol?' (mbYesNoCancel) and calls DeleteCashSymbols(Symbol).
The procedures commit inside the package (CashSymbols.sql / CashDeskLast Script/sb_cashreport.sql) - no client commit.
Calculated field Assignment (ODSCashSymbolsCalcFields): mediocrity 0 -> 'Mədaxil', 1 -> 'Məxaric', otherwise empty.
"""
from __future__ import annotations

from fastapi import APIRouter, Depends
from pydantic import BaseModel, Field

from . import csy_sql as Q
from .customers import row
from .delphi import float_to_str

CLSID = "{46FBEA93-C8CB-4B3F-A24E-4BD200321FC1}"     # CashSymbols_TLB.pas:56 CLASS_CashSymbolX
PKG = "SB_CashReport"                                 # CashSymbolImpl.dfm:253-255 OPCashSymbols.PackageName


class SymIn(BaseModel):
    symbol: str = Field("", max_length=4000)           # ESymbol.Text
    name: str = Field("", max_length=4000)             # EName.Text
    mediocrity: int = Field(0, ge=0, le=1)             # CBAssignment.ItemIndex
    old_symbol: str | None = Field(None, max_length=4000)   # FieldByName('Symbol').Value (omEdit)


class DelIn(BaseModel):
    symbol: str = Field(..., max_length=4000)


def assignment(m):
    if m == 0:
        return "Mədaxil"
    if m == 1:
        return "Məxaric"
    return None


def rows(c) -> list[dict]:
    out = []
    for r in c.query(Q.SQL_CSY_ODSCASHSYMBOLS):
        x = row(r)
        x["symbol"] = None if r.get("SYMBOL") is None else (r["SYMBOL"] if isinstance(r["SYMBOL"], str) else float_to_str(r["SYMBOL"]))
        x["assignment"] = assignment(x.get("mediocrity"))
        out.append(x)
    return out


def _s(v):
    return None if v == "" else v


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/cashsymbols")
    g = require_module(CLSID)

    @r.get("")
    def _list(ws=Depends(g)):
        return {"rows": rows(ws.conn)}

    @r.post("/add")
    def _add(b: SymIn, ws=Depends(g)):
        ws.conn.call_proc(PKG, "AddCashSymbols", [_s(b.symbol), _s(b.name), b.mediocrity], commit=False)
        return {"rows": rows(ws.conn)}

    @r.post("/update")
    def _update(b: SymIn, ws=Depends(g)):
        ws.conn.call_proc(PKG, "UpdateCashSymbols", [b.old_symbol, _s(b.symbol), _s(b.name), b.mediocrity], commit=False)
        return {"rows": rows(ws.conn)}

    @r.post("/delete")
    def _delete(b: DelIn, ws=Depends(g)):
        ws.conn.call_proc(PKG, "DeleteCashSymbols", [b.symbol], commit=False)
        return {"rows": rows(ws.conn)}

    return r
