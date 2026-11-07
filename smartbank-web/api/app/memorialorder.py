"""Memorial order - port of Delphi Packages/MemorialOrder (MemorialOrder / TfrmMemorialOrder; units MemorialOrderImpl,
MOrdDataModImpl (TMOrdDataMod), TuningAccountsUnit (TfrmTuning 'Sazlama'); no other copies: CLASS_frmMemorialOrder is
only in Packages/MemorialOrder/MemorialOrder_TLB.pas:56). SQL verbatim in mo_sql.py.

TfrmMemorialOrder.ActiveFormCreate (MemorialOrderImpl.pas:363-368): MOrdDataMod := TMOrdDataMod.Create;
frmTuning := TfrmTuning.Create; UseFilterCBClick(UseFilterCB).
TMOrdDataMod.DataModuleCreate (MOrdDataModImpl.pas:55-62): CurrencysData / BankInfo / Sysdat / Branches / Memorial .Open.
The three TSearchCombos (CurrencysCB / BranchesCB / UsersCB, MemorialOrderImpl.dfm:106-162) fill themselves in
CreateWnd -> Refresh (SBSearchComboBox/SearchCombo.pas:59-93): Items := [DefaultString] + every ViewField value, and
'if not(Active) then Open' - so Users (not opened by the data module) is opened by UsersCB.
BankInfo / Sysdat are opened and never read (no code uses them); the web runs them too and does not use the result.
Transactions (dfm:14-79, its SQL ends with a dangling 'and') is never opened: TransactionsViewer stays empty.
RefreshTB 'Yeniləmək' and ShowReportTB 'Hesabat' have no OnClick (dfm:305-324): they do nothing.
ToolButton4 'Sazlama' (pas:404-407): frmTuning.ShowModal - DBGrid1 + DBNavigator1 (Insert, Delete, Edit, Post, Cancel,
Refresh) on DataSrcMemorial (TuningAccountsUnit.dfm:17-50). Memorial has one persistent field BALANCE (TFloatField,
Required, MOrdDataModImpl.dfm:272-275), so the grid shows BALANCE only. No OnApplyRecord -> DOA's default
insert / update / delete on Memorial by rowid; CommitOnPost = True (dfm:264) commits after each Post / Delete.
"""
from __future__ import annotations

from fastapi import APIRouter, Depends
from pydantic import BaseModel, Field

from . import mo_sql as Q
from .customers import row
from .db import DBError

CLSID = "{AF598220-AE7C-447A-BF17-4A5D0424A330}"     # MemorialOrder_TLB.pas:56 CLASS_frmMemorialOrder
DESIGN_DATE = "2003-11-21"                            # DTPFirstDate / DTPLastDate Date = 37946.609 (dfm:75, 89); never set by code
# DOA default ApplyRecord (UpdatingTable = Memorial from the FROM clause, the only data field BALANCE)
SQL_INS = "insert into Memorial (BALANCE) values (:BALANCE)"
SQL_UPD = "update Memorial set BALANCE = :BALANCE where rowid = :RID"
SQL_DEL = "delete from Memorial where rowid = :RID"


class MoErr(Exception):
    def __init__(self, key, **kw):
        self.key, self.kw = key, kw


def memorial(conn) -> list[dict]:
    """Memorial.Open / Refresh: rows with the rowid (kept as 'rid') and BALANCE."""
    out = []
    for r in conn.query(Q.SQL_MO_MEMORIAL):
        x = row(r)
        rid = r.get("ROWID")
        x["rid"] = None if rid is None else str(rid)
        out.append(x)
    return out


def _balance(v):
    """TFloatField: Required (Post -> "Field 'BALANCE' must have a value"); AsString := text -> StrToFloat."""
    if v is None or str(v).strip() == "":
        raise MoErr("mo.err_required", field="BALANCE")
    try:
        x = float(str(v).strip().replace(",", "."))
    except ValueError:
        raise MoErr("mo.err_float", value=str(v)[:64])
    return int(x) if x == int(x) else x


def post(conn, rid, balance):
    """TDataSet.Post -> DOA insert (rid None, dsInsert) or update by rowid (dsEdit); CommitOnPost."""
    b = _balance(balance)
    try:
        if rid is None:
            conn.execute(SQL_INS, {"BALANCE": b})
        else:
            conn.execute(SQL_UPD, {"BALANCE": b, "RID": rid})
        conn.commit()
    except DBError:
        conn.rollback()
        raise


def delete(conn, rid):
    """DBNavigator nbDelete (ConfirmDelete asked in the browser) -> DOA delete by rowid; CommitOnPost."""
    if rid is None:
        raise MoErr("mo.err_empty")
    try:
        conn.execute(SQL_DEL, {"RID": rid})
        conn.commit()
    except DBError:
        conn.rollback()
        raise


class PostIn(BaseModel):
    rid: str | None = Field(None, max_length=64)
    balance: str | float | int | None = Field(None)


class DelIn(BaseModel):
    rid: str | None = Field(None, max_length=64)


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/memorialorder")
    g = require_module(CLSID)

    def _wrap(fn):
        try:
            return fn()
        except MoErr as e:
            err(400, e.key, **e.kw)

    @r.get("/init")
    def _init(ws=Depends(g)):
        c = ws.conn
        cur = c.query(Q.SQL_MO_CURRENCYSDATA)            # DataModuleCreate :57
        c.query(Q.SQL_MO_BANKINFO)                       # :58 (result unused)
        c.query(Q.SQL_MO_SYSDAT)                         # :59 (result unused)
        br = c.query(Q.SQL_MO_BRANCHES)                  # :60
        mem = memorial(c)                                # :61
        us = c.query(Q.SQL_MO_USERS)                     # UsersCB.Refresh: 'if not(Active) then Open'
        return {"first": DESIGN_DATE, "last": DESIGN_DATE,
                "currencies": [x.get("CURRENCYLNAME") for x in cur],    # ViewField CURRENCYLNAME
                "branches": [x.get("BRANCHNAME") for x in br],          # ViewField BRANCHNAME
                "users": [x.get("USERNAME") for x in us],               # ViewField USERNAME
                "memorial": mem, "transactions": []}

    @r.get("/memorial")
    def _mem(ws=Depends(g)):                             # DBNavigator1 nbRefresh
        return {"memorial": memorial(ws.conn)}

    @r.post("/memorial/post")
    def _post(b: PostIn, ws=Depends(g)):
        _wrap(lambda: post(ws.conn, b.rid, b.balance))
        return {"memorial": memorial(ws.conn)}

    @r.post("/memorial/delete")
    def _del(b: DelIn, ws=Depends(g)):
        _wrap(lambda: delete(ws.conn, b.rid))
        return {"memorial": memorial(ws.conn)}

    return r
