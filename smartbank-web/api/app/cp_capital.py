"""Currency Position 'Kapital' button - port of Packages/CurrencyPosition/UntCapital.pas/.dfm (TfrmCapital, opened by
TFrmCurrencyPosition.tb_CapitalClick, CurrencyPositionImpl.pas:895-901: created once, ShowModal every time).

The form keeps its datasets open between shows (FormShow :371-382 opens ds_capital / ds_account only when closed), so
the page keeps the rows it got from /capital/form and only asks for refreshes where Delphi calls Refresh.
TDataSet.Filter (Setfilter / SetOUTfilter :316-324) and the current record of every dataset are client state, as in
the VCL. SQL texts are in cp_sql.py (CAP_* / SQL_CAP_*).

SB_CAPITAL (PK_CAPITAL, dfm:2518-2523; spec/body SQL_credit/sm_p.sql:38045-38396): cap_insert and cap_delete COMMIT
inside the package and Delphi adds no commit, so the calls run with commit=False. calculate_AQiymetal /
calculate_PQiymetal are called by BitBtn3Click but are not in the 2008 package script (unverified).

Not ported: the CPReport.QRLabel36/37 captions BitBtn3Click sets from Ametal-Pmetal - they belong to the held
UntCPReport report.
"""
from __future__ import annotations
import datetime

from fastapi import APIRouter, Depends
from pydantic import BaseModel, Field

from . import cp_sql as Q
from .customers import row
from .db import DBError
from .delphi import date_only, float_to_str
from .currencyposition import CLSID, PKG, CAP_PKG, _sep

INT32 = dict(ge=-2147483648, le=2147483647)
TYPES = ("I", "II", "A", "E", "C", "AM", "PM")       # the cap_type literals of Insert_*_capital / Insert_Ametal / _Pmetal
Order = Field(None, pattern="^(BAL|ACC_NO|PERCENT)$")


class Orders(BaseModel):
    order: str | None = Order                         # ds_capital SQL[SQL.Count-1] (ReOrder_Capital)
    order_out: str | None = Order                     # ds_capital_out SQL[SQL.Count-1] (DBGrid3TitleClick)
    out_active: bool = False                          # ds_capital_out.Active (SpeedButton2Click)


class RowsIn(Orders):
    out: bool = False                                 # which dataset is refreshed


class InsertIn(Orders):
    """Insert_capital_proc(cap_type, cap_bal, cap_acc, cap_sum, cap_percent, cap_formula, cap_optype[, cap_baltype])."""
    type: str = Field(..., pattern="^(I|II|A|E|C|AM|PM)$")
    bal: int = Field(..., **INT32)
    acc: int = Field(..., **INT32)
    sum: int = Field(0, **INT32)
    percent: int = Field(0, **INT32)
    formula: str = Field("", max_length=255)
    op_type: int = Field(..., **INT32)
    bal_type: int = Field(0, **INT32)                 # default 0 -> the 7-argument call (:416-418)


class DeleteIn(Orders):
    id: int = Field(..., **INT32)
    out: bool = False                                 # Delete_capital_out (:432-440) vs Delete_capital_proc (:406-412)


class PageIn(BaseModel):
    index: int = Field(..., ge=0, le=6)               # cb_Main.ItemIndex


class CalcIn(BaseModel):
    date: datetime.date                               # Trunc(dp_capdate.DateTime)


class FormulaIn(BaseModel):
    rowid: str = Field(..., max_length=64)
    formula: str | None = Field(None, max_length=255)


def cap_row(r: dict) -> dict:
    return dict(row(r), rowid=str(r.get("ROWID")) if r.get("ROWID") is not None else None)


def acc_rows(rs) -> list[dict]:
    return [{"id": r.get("ID"), "acc_no": r.get("ACC_NO"), "name": r.get("NAME")} for r in rs]


def bal_rows(rs) -> list[dict]:
    return [{"bal_cn": r.get("BAL_CN")} for r in rs]


def capital_rows(c, order=None, out=False) -> list[dict]:
    return [cap_row(r) for r in c.query(Q.sql_capital(order, out))]


def plain_rows(c, sql) -> list[dict]:
    return [cap_row(r) for r in c.query(sql)]


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/currencyposition/capital")
    g = require_module(CLSID)

    def sql_err(fn):
        try:
            return fn()
        except ValueError as e:
            err(400, "cp.err_db", msg=str(e))

    @r.get("/form")
    def _form(ws=Depends(g)):
        """TfrmCapital.Create (design-time Active datasets: ds_AdiEhtiyyat, OracleDataSet1..4) + FormCreate
        (cb_Main.ItemIndex := 0) + FormShow (:371-382: ds_capital.Open, dp_capdate := PK_CAPITAL.GetDate,
        ds_account.Open)."""
        c = ws.conn
        adi = bal_rows(c.query(Q.SQL_CAP_ADI_DFM))
        ods1 = bal_rows(c.query(Q.SQL_CAP_ODS1_DFM))
        ods2 = plain_rows(c, Q.SQL_CAP_ODS2)
        ods3 = plain_rows(c, Q.SQL_CAP_ODS3)
        c.query(Q.SQL_CAP_ODS4)                                       # OracleDataSet4: opened, never shown
        cap = capital_rows(c)
        day = c.call_func(CAP_PKG, "GetDate", [], datetime.datetime)
        acc = acc_rows(c.query(Q.SQL_CAP_ACCOUNT))
        return {"capital": cap, "date": day, "accounts": acc, "adi": adi, "ods1": ods1, "ods2": ods2, "ods3": ods3}

    @r.post("/page")
    def _page(b: PageIn, ws=Depends(g)):
        """cb_MainChange (:333-358): dp_capdate.Date := sb_GetBankDate; page 4/5 re-open ds_AdiEhtiyyat, page 6
        re-opens OracleDataSet1."""
        c = ws.conn
        out = {"date": c.call_func(PKG, "GetBankDay", [], datetime.datetime)}
        if b.index == 4:
            out["adi"] = bal_rows(c.query(Q.SQL_CAP_ADI_4))
        if b.index == 5:
            out["adi"] = bal_rows(c.query(Q.SQL_CAP_ADI_5))
        if b.index == 6:
            out["ods1"] = bal_rows(c.query(Q.SQL_CAP_ODS1_6))
        return out

    def refreshed(c, b: Orders, sets) -> dict:
        out = {}
        if "capital" in sets:
            out["capital"] = capital_rows(c, b.order)
            out["ods2"] = plain_rows(c, Q.SQL_CAP_ODS2)
            out["ods3"] = plain_rows(c, Q.SQL_CAP_ODS3)
        if "out" in sets and b.out_active:
            out["capital_out"] = capital_rows(c, b.order_out, True)
        return out

    @r.post("/rows")
    def _rows(b: RowsIn, ws=Depends(g)):
        """ReOrder_Capital (:543-553) on ds_capital / DBGrid3TitleClick (:745-755) on ds_capital_out:
        SQL[SQL.Count-1] := 'ORDER BY '+Column.FieldName; Refresh."""
        c = ws.conn
        if b.out:
            return {"capital_out": capital_rows(c, b.order_out, True)}
        return {"capital": capital_rows(c, b.order)}

    @r.post("/insert")
    def _insert(b: InsertIn, ws=Depends(g)):
        """Insert_capital_proc (:414-423) - then ds_capital / OracleDataSet2 / OracleDataSet3 Refresh;
        Insert_Risk_capital_OUT (:502-526, cap_baltype 2) also refreshes ds_capital_out."""
        c = ws.conn
        args = [b.type, b.bal, b.acc, b.sum, b.percent, b.formula, b.op_type]
        if b.bal_type != 0:
            args.append(b.bal_type)
        c.call_proc(CAP_PKG, "cap_insert", args, commit=False)
        return refreshed(c, b, ("capital", "out") if b.bal_type == 2 else ("capital",))

    @r.post("/delete")
    def _delete(b: DeleteIn, ws=Depends(g)):
        """Delete_capital_proc (:406-412) / BitBtn15Click / BitBtn17Click; Delete_capital_out (:432-440) refreshes
        ds_capital_out only."""
        c = ws.conn
        c.call_proc(CAP_PKG, "cap_delete", [b.id], commit=False)
        return refreshed(c, b, ("out",) if b.out else ("capital",))

    @r.post("/calc")
    def _calc(b: CalcIn, ws=Depends(g)):
        """BitBtn3Click 'Hesabla' (:562-600): every memo is set to '0' first, then filled in order; an exception leaves
        the remaining memos at '0' and is shown (Delphi has try..finally only)."""
        c = ws.conn
        memos = {m: "0" for m, _ in Q.CAP_CALC}
        d = date_only(b.date)
        for m, fn in Q.CAP_CALC:
            try:
                v = c.call_func(CAP_PKG, fn, [d], float)
            except DBError as e:
                return {"memos": memos, "error": str(e)}
            memos[m] = _sep(float_to_str(0.0 if v is None else float(v)))
        return {"memos": memos}

    @r.post("/formula")
    def _formula(b: FormulaIn, ws=Depends(g)):
        """SpeedButton1Click (:676-681): if ds_capital.State = dsEdit then Post (DBEdit1 on FORMULA, CommitOnPost)."""
        c = ws.conn
        c.execute(Q.SQL_CAP_FORMULA_UPDATE, {"FORMULA": b.formula, "ROWID_": b.rowid})
        c.commit()
        return {"ok": True}

    @r.post("/out/open")
    def _out_open(b: Orders, ws=Depends(g)):
        """SpeedButton2Click (:683-704): ds_account_out.Open; ds_capital_out.Open; SetOutfilter('A',1); on any exception
        ShowMessage('Balansdan kənar qoşulmayıb') (Azl text 'Балансдан кянар гошулмыйыб')."""
        c = ws.conn
        try:
            acc = acc_rows(c.query(Q.SQL_CAP_ACCOUNT_OUT))
            cap = sql_err(lambda: capital_rows(c, b.order_out, True))
        except DBError:
            err(400, "cp.cap_out_fail")
        return {"accounts_out": acc, "capital_out": cap}

    return r
