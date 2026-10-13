"""Off-balance account types (symbols) editor - port of Delphi Packages/Out_Tuningacctypes (TFlagsEditor, CLSID below).

Out_TuningAcctypes.dpr compiles only TuningAccTypesImpl.pas (+ TLB). One editable DBGrid (DBGrid1 on DataSrcAccTypes) over
Account_Types ('select AT.*, AT.RowID from Out_Account_Flags AT'); no navigator, no OnApplyRecord -> DOA applies
INSERT/UPDATE/DELETE on OUT_ACCOUNT_FLAGS by ROWID with CommitOnPost; AfterPost (:341-352) refreshes and keeps the row.
Account_TypesAfterOpen (:329-339) fills a A..Z PickList on Columns[0] of the *other* grid (FlagsEditor, no DataSource, hidden
under DBGrid1), so the visible grid has no pick list - kept that way (free 1-character SYMBOL).
"""
from __future__ import annotations

from fastapi import APIRouter, Depends
from pydantic import BaseModel, Field

from . import out_set_sql as Q
from .customers import row

CLSID = "{4FD88BAF-D08A-474A-AADA-335E883BBB85}"     # Out_TuningAcctypes_TLB.pas:56 CLASS_FlagsEditor
TABLE = "Out_Account_Flags"
COLS = ("SYMBOL", "NAME", "DESCRIPTION")


class FlagIn(BaseModel):
    """Persistent fields TuningAccTypesImpl.dfm:161-173."""
    symbol: str = Field(min_length=1, max_length=1)          # Required = True, Size = 1
    name: str | None = Field(None, max_length=32)            # Size = 32
    description: str | None = Field(None, max_length=128)    # Size = 128


def _vals(b: FlagIn) -> dict:
    return {"SYMBOL": b.symbol, "NAME": b.name or None, "DESCRIPTION": b.description or None}


# DOA-generated DML (no OnApplyRecord)
SQL_INSERT = "insert into %s (SYMBOL, NAME, DESCRIPTION) values (:SYMBOL, :NAME, :DESCRIPTION)" % TABLE
SQL_UPDATE = "update %s set SYMBOL = :SYMBOL, NAME = :NAME, DESCRIPTION = :DESCRIPTION where rowid = :doa_rowid" % TABLE
SQL_DELETE = "delete from %s where rowid = :doa_rowid" % TABLE


def list_rows(conn) -> list[dict]:
    out = []
    for r in conn.query(Q.SQL_ACCOUNT_TYPES):
        o = row(dict(r))
        o["rowid"] = r.get("ROWID")
        out.append(o)
    return out


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/out-tuningacctypes")
    g = require_module(CLSID)

    def run(c, sql, b):
        try:
            c.execute(sql, b)
            c.commit()                    # CommitOnPost
        except Exception:
            c.rollback()
            raise

    @r.get("")
    def _list(ws=Depends(g)):
        return {"rows": list_rows(ws.conn)}

    @r.post("")
    def _ins(b: FlagIn, ws=Depends(g)):
        run(ws.conn, SQL_INSERT, _vals(b))
        return {"ok": True}

    @r.put("")
    def _upd(b: FlagIn, rowid: str, ws=Depends(g)):
        run(ws.conn, SQL_UPDATE, {**_vals(b), "doa_rowid": rowid})
        return {"ok": True}

    @r.delete("")
    def _del(rowid: str, ws=Depends(g)):
        run(ws.conn, SQL_DELETE, {"doa_rowid": rowid})
        return {"ok": True}

    return r
