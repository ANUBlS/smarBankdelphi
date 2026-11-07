"""Order ('Sərəncam') - port of Delphi Packages/Order (Order / TOrderForm; units OrderImpl, OrderDataModuleUnit
(TDataModOrder), OrderReportUnit (TOrderRpt, QuickReport), CurrencyToHR_Azeri_ (amount in words, print only),
OrderPropertyPage (ActiveX property page, not a screen); no other copies: CLASS_OrderForm is only in
Packages/Order/Order_TLB.pas). SQL verbatim in ord_sql.py.

TOrderForm.ActiveFormCreate (OrderImpl.pas:391-399): DataModOrder := TDataModOrder.Create -> DataModuleCreate
(OrderDataModuleUnit.pas:55-63) opens SYSDAT, CurrencyData, ContractAccs, ClientAccs, ReserveAccs, BankInfoData;
OrderRpt := TOrderRpt.Create; ContractAccounts.Text := ClientAccs.Acc_No (ContractAccounts' DataSource is
DataSrcClientAccs, OrderImpl.dfm:219-227); ReserveAccounts.Text := ReserveAccs.Acc_No; TranslateAllComponents.
ContractAccs / ClientAccs / ReserveAccs are details of CurrencyData (Master = CurrencyData, MasterFields VALUTE,
DetailFields VAL_ACC, OrderDataModuleUnit.dfm:83-85 / 128-130 / 184-186): :Val_Acc = CurrencyData.VALUTE of the current
record, re-queried when CBCurrencys (TDBViewComboBox on DataSrcCurrency) moves the master record.
SYSDAT, ContractAccs and BankInfoData are opened and never read (DTPSysdate keeps its design-time date).
Button1 'Sərəncam' (pas:401-528) fills OrderRpt and calls Preview - a QuickReport print: on hold.
Read-only module: no DML, no commit.
"""
from __future__ import annotations

from fastapi import APIRouter, Depends
from pydantic import BaseModel

from . import ord_sql as Q
from .customers import row

CLSID = "{7D8ED4E8-ADE8-44C0-9006-428D9F798D86}"     # Order_TLB.pas CLASS_OrderForm
DESIGN_DATE = "2003-06-04"                            # DTPSysdate Date = 37776.5157 (OrderImpl.dfm:115); never set by code


def details(c, valute) -> dict:
    """Master/detail re-open of ContractAccs, ClientAccs, ReserveAccs for :Val_Acc = CurrencyData.VALUTE."""
    if valute is None:
        return {"client": [], "reserve": []}
    b = {"Val_Acc": valute}
    c.query(Q.SQL_ORD_CONTRACTACCS, b)                # opened, never shown or read
    return {"client": [row(x) for x in c.query(Q.SQL_ORD_CLIENTACCS, b)],
            "reserve": [row(x) for x in c.query(Q.SQL_ORD_RESERVEACCS, b)]}


class CurIn(BaseModel):
    valute: int


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/order")
    g = require_module(CLSID)

    @r.get("/init")
    def _init(ws=Depends(g)):
        c = ws.conn
        c.query(Q.SQL_ORD_SYSDAT)                                  # DataModuleCreate :57 (result unused)
        cur = [row(x) for x in c.query(Q.SQL_ORD_CURRENCYDATA)]   # :58
        d = details(c, cur[0]["valute"] if cur else None)         # :59-61 (first master record)
        c.query(Q.SQL_ORD_BANKINFODATA)                            # :62 (result unused)
        return {"date": DESIGN_DATE, "currencies": cur, **d}

    @r.post("/accounts")
    def _acc(b: CurIn, ws=Depends(g)):                             # CBCurrencys moves CurrencyData -> details re-open
        return details(ws.conn, b.valute)

    return r
