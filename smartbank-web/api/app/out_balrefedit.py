"""Off-balance chart of accounts editor - port of Delphi Packages/Out_balancerefeditx/Ocx (TBalanceRefEditX, CLSID below).

OUT_BalanceRefEditX.dpr compiles only BalanceRefEditImpl1.pas (+ the TLB). The form is a DBNavigator + DBGrid + edit
panel over one TOracleDataSet (BalanceDataSet, 'select b.*, b.rowid from OUT_bal_sprN b'). There is no OnApplyRecord,
so posts are applied by DOA itself: INSERT/UPDATE/DELETE on the table of the query, rows addressed by ROWID,
CommitOnPost (DOA default). Those generated statements are reproduced below (no package is involved).
"""
from __future__ import annotations
from decimal import Decimal, InvalidOperation

from fastapi import APIRouter, Depends
from pydantic import BaseModel, Field

from . import out_set_sql as Q
from .customers import row

CLSID = "{8E39E7D2-FC9F-4EB8-8645-9F04944FBD92}"     # OUT_BalanceRefEditX_TLB.pas:56 CLASS_BalanceRefEditX

# BalanceDataSetCalcFields BalanceRefEditImpl1.pas:374-400 (texts are data, kept in Azerbaijani like Delphi)
TYPE_NAMES = {1: "Aktiv", 2: "Passiv", 3: "Aktiv-Passiv"}
RATEDIFF_NAMES = {0: "Hesablanmır", 1: "Hesablanır"}
SALDO_NAMES = {0: "Nəzərə alınmır", 1: "Nəzərə alınır"}
# Editable persistent fields (BalanceRefEditImpl1.dfm:450-487) that the edit panel / grid can change.
EDIT_FIELDS = ("BAL_CN", "TYPEID", "ADDITIONALTYPEID", "ACCGROUP", "SALDO", "PART", "BALNAME", "RATEDIFFERENCE",
               "CURRENCYPOSITION")


def _as_int(v):
    """TField.AsInteger (NULL -> 0); used by the Case statements."""
    try:
        return int(v) if v is not None else 0
    except (TypeError, ValueError):
        return 0


def calc(r: dict) -> dict:
    """OnCalcFields: a Case with no else keeps the calculated field NULL for other values."""
    r["TYPEID_NAME"] = TYPE_NAMES.get(_as_int(r.get("TYPEID")))
    r["ADDITIONALTYPEID_NAME"] = TYPE_NAMES.get(_as_int(r.get("ADDITIONALTYPEID")))
    r["RATEDIFFERENCE_NAME"] = RATEDIFF_NAMES.get(_as_int(r.get("RATEDIFFERENCE")))
    r["SALDO_NAME"] = SALDO_NAMES.get(_as_int(r.get("SALDO")))
    return r


def plan_index(plan: int) -> int:
    if plan not in (0, 1, 2, 3):          # ComboBoxPlan has 4 items; the index never reaches the SQL as text
        raise ValueError("plan")
    return plan


def balance_sql(plan: int) -> str:
    """ComboBoxPlanChange :409-421: BalanceDataSet.SQL[1] := 'out_bal_sprN b'; Close; Open.
    At create (ItemIndex -1) the design-time 'OUT_bal_spr1 b' is used - the same table as plan 0."""
    lines = list(Q.BALANCE_SQL_LINES)
    lines[1] = Q.BALANCE_PLAN_LINES[plan_index(plan)]
    return "\r\n".join(lines)


def list_rows(conn, plan: int) -> list[dict]:
    out = []
    for r in conn.query(balance_sql(plan)):
        rid = r.get("ROWID")
        o = row(calc(dict(r)))
        o["rowid"] = rid
        out.append(o)
    return out


class BalIn(BaseModel):
    """Edit panel GroupBox2 (dfm:75-240) + editable grid columns."""
    bal_cn: str | None = Field(None, max_length=40)        # DBEdit1 BAL_CN (TFloatField)
    typeid: int | None = Field(None, ge=1, le=3)           # ComboBoxTYPEID_NAME ItemIndex+1 (:423-428)
    additionaltypeid: int | None = Field(None, ge=1, le=3) # ComboBoxADDITIONALTYPEID_NAME ItemIndex+1 (:430-435)
    accgroup: str | None = Field(None, max_length=40)      # DBEdit3 ACCGROUP (TFloatField)
    saldo: int | None = Field(None, ge=0, le=1)            # DBCheckBox1 ValueChecked '1' / ValueUnchecked '0'
    ratedifference: int | None = Field(None, ge=0, le=1)   # DBCheckBox2
    part: str | None = Field(None, max_length=40)          # DBEdit5 PART (TIntegerField)
    balname: str | None = Field(None, max_length=181)      # DBEdit6 BALNAME (Size 181)
    currencyposition: int | None = Field(None, ge=0, le=3) # CmbBoxCurrPosition ItemIndex (:443-447)


class BadValue(Exception):
    def __init__(self, field: str):
        self.field = field


def _num(name, v, integer=False):
    """TFloatField/TIntegerField text entry: empty = NULL, otherwise must be a number ('... is not a valid ...')."""
    if v is None or str(v).strip() == "":
        return None
    s = str(v).strip()
    try:
        d = Decimal(s.replace(",", "."))
    except InvalidOperation:
        raise BadValue(name)
    if integer:
        if d != d.to_integral_value():
            raise BadValue(name)
        return int(d)
    return int(d) if d == d.to_integral_value() else float(d)


def values(b: BalIn) -> dict:
    return {"BAL_CN": _num("BAL_CN", b.bal_cn), "TYPEID": b.typeid, "ADDITIONALTYPEID": b.additionaltypeid,
            "ACCGROUP": _num("ACCGROUP", b.accgroup), "SALDO": b.saldo, "PART": _num("PART", b.part, True),
            "BALNAME": b.balname if b.balname != "" else None, "RATEDIFFERENCE": b.ratedifference,
            "CURRENCYPOSITION": b.currencyposition}


# DOA-generated DML (TOracleDataSet without OnApplyRecord): table = the table of the query, rows by ROWID.
def insert_sql(plan: int, cols) -> str:
    t = Q.BALANCE_PLAN_TABLES[plan_index(plan)]
    return "insert into %s (%s) values (%s)" % (t, ", ".join(cols), ", ".join(":" + c for c in cols))


def update_sql(plan: int, cols) -> str:
    t = Q.BALANCE_PLAN_TABLES[plan_index(plan)]
    return "update %s set %s where rowid = :doa_rowid" % (t, ", ".join("%s = :%s" % (c, c) for c in cols))


def delete_sql(plan: int) -> str:
    return "delete from %s where rowid = :doa_rowid" % Q.BALANCE_PLAN_TABLES[plan_index(plan)]


def lock_sql(plan: int) -> str:
    """roBeforeEdit / lmCheckImmediate: the row is re-read and locked before it is edited."""
    return "select b.*, b.rowid from %s b where rowid = :doa_rowid for update nowait" % Q.BALANCE_PLAN_TABLES[plan_index(plan)]


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/out-balrefedit")
    g = require_module(CLSID)

    def vals(b):
        try:
            return values(b)
        except BadValue as e:
            err(400, "out_balrefedit.err_number", field=e.field)

    def chk(plan):
        if plan not in (0, 1, 2, 3):
            err(400, "error.generic")

    @r.get("")
    def _list(plan: int = 0, ws=Depends(g)):
        chk(plan)
        return {"plan": plan, "rows": list_rows(ws.conn, plan)}

    @r.post("")
    def _ins(b: BalIn, plan: int = 0, ws=Depends(g)):
        chk(plan)
        v = {k: x for k, x in vals(b).items() if x is not None}      # DOA inserts the non-NULL fields
        c = ws.conn
        try:
            if not v:
                err(400, "out_balrefedit.err_empty")
            c.execute(insert_sql(plan, list(v)), v)
            c.commit()                                                 # CommitOnPost
        except Exception:
            c.rollback()
            raise
        return {"ok": True}

    @r.put("")
    def _upd(b: BalIn, rowid: str, plan: int = 0, ws=Depends(g)):
        chk(plan)
        c = ws.conn
        v = vals(b)
        try:
            if not c.query(lock_sql(plan), {"doa_rowid": rowid}):
                err(404, "error.not_found")
            c.execute(update_sql(plan, list(v)), {**v, "doa_rowid": rowid})
            c.commit()
        except Exception:
            c.rollback()
            raise
        return {"ok": True}

    @r.delete("")
    def _del(rowid: str, plan: int = 0, ws=Depends(g)):
        chk(plan)
        c = ws.conn
        try:
            c.execute(delete_sql(plan), {"doa_rowid": rowid})
            c.commit()
        except Exception:
            c.rollback()
            raise
        return {"ok": True}

    return r
