"""Off-balance turnovers for period - port of Delphi Packages/Out_turn_over_for_period/ocx (TTurnOvers_Form, CLSID below).

Form TurnOversForPeriodImpl.pas, data module TurnOversDataMod.pas (SQL: out_tp_sql.py, verbatim from TurnOversDataMod.dfm),
report FPTurnOversReportImpl (QuickReport TTurnOversRpt). SBExecuteClick :376-531 rebuilds TurnOversData.SQL from the
design-time text (SQL.CommaText round trip :364/:402) and Format()s lines 52/55/94/97/114/117 (AccPlane),
124 (BalanceList), 125 (CurrencyID), 126 (BranchID) - reproduced line-for-line in turnover_sql().
AccountListEdit.Text was pasted raw by Delphi; here it is validated (integer list) - SQL text identical for valid input.
RGAmountType is read into AmountType (:466) but never used by Delphi (BuildTurnOverQuery ignores it) - kept inert.
"""
from __future__ import annotations
import datetime
import re
from decimal import Decimal

from fastapi import APIRouter, Depends
from pydantic import BaseModel, Field

from . import out_tp_sql as Q
from . import report_render as R
from .balance import Labels, render_spec, file_resp, rows_out
from .delphi import date_only

CLSID = "{EFA0EDF1-911C-42CC-B896-032FCC59C38C}"   # Out_TurnOversForPeriod_TLB.pas:56 CLASS_TurnOvers_Form
_BAL_LIST = re.compile(r"^\s*-?\d+(\s*,\s*-?\d+)*\s*$")
# FPTurnOversReportImpl.dfm detail band QRBand5 (QRDBText15..21, QRDBText5 ACC_NAME when CBWithAccNames)
REPORT_COLS = ["ACCNO", "BEGINACTIVE", "BEGINPASSIVE", "DTURNOVER", "CTURNOVER", "ENDACTIVE", "ENDPASSIVE"]
# SummaryBand1 QRExpr1..6
REPORT_SUMS = ["BEGINACTIVE", "BEGINPASSIVE", "DTURNOVER", "CTURNOVER", "ENDACTIVE", "ENDPASSIVE"]
# TurnOversDataMod.pas:26-50 persistent fields (Excel export column order of the dataset)
EXPORT_COLS = ["ACCOUNTID", "ACCNO", "ACC_NAME", "CURRENCYID", "BRANCHID", "BALANCENO", "BEGINACTIVE", "BEGINPASSIVE",
               "LBEGINACTIVE", "LBEGINPASSIVE", "DTURNOVER", "CTURNOVER", "LDTURNOVER", "LCTURNOVER", "ENDACTIVE",
               "ENDPASSIVE", "LENDACTIVE", "LENDPASSIVE", "CLIENTID", "EXPERT"]
# :521 DataSet.Filter for the QuickReport preview
_FILTER = ["LBEGINACTIVE", "LENDACTIVE", "LDTURNOVER", "LCTURNOVER", "LBEGINPASSIVE", "LENDPASSIVE"]


class TurnIn(BaseModel):
    beg: datetime.date                                # DTPBeginDate
    end: datetime.date                                # DTPEndDate
    currency: int = Field(0, ge=0)                    # CBCurrency.ItemIndex (0 = all -> CurrencyID -1)
    branch: int = Field(0, ge=0)                      # CBBranch.ItemIndex (<=0 -> BranchID -1)
    plan: int = Field(0, ge=0, le=3)                  # CBAccountType.ItemIndex (AccPlane = +1)
    amount_type: int = Field(0, ge=0, le=1)           # RGAmountType.ItemIndex (unused by Delphi)
    balances: str = Field("", max_length=2000)        # AccountListEdit.Text
    with_names: bool = False                          # CBWithAccNames.Checked
    labels: Labels = Field(default_factory=Labels)


def _fmt(line: str, v) -> str:
    """Delphi Format() with a single %d / %s argument."""
    return line.replace("%d", str(int(v)), 1) if "%d" in line else line.replace("%s", str(v), 1)


def turnover_sql(branch_id: int, currency_id: int, acc_plane: int, balance_list: str) -> str:
    """BuildTurnOverQuery TurnOversForPeriodImpl.pas:398-427."""
    sql = Q.SQL_OTP_TURNOVERSDATA.split("\n")                       # :402 SQL.CommaText := FTurnOversDataSQL
    for i in (52, 55, 94, 97, 114, 117):                            # :404-409
        sql[i] = _fmt(sql[i], acc_plane)
    if balance_list.strip() != "":                                  # :411-413
        if not _BAL_LIST.match(balance_list):
            raise ValueError("balances")
        sql[124] = _fmt(sql[124], balance_list)
    else:
        sql[124] = ""
    sql[125] = _fmt(sql[125], currency_id) if currency_id != -1 else ""   # :415-417
    sql[126] = _fmt(sql[126], branch_id) if branch_id != -1 else ""       # :419-421
    return "\n".join(sql)


def _nz(v) -> bool:
    return v is not None and Decimal(str(v)) != 0


def _sum(rows, cols):
    return {c: sum((Decimal(str(r.get(c) or 0)) for r in rows), Decimal(0)) for c in cols}


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/out-turnovers")
    g = require_module(CLSID)

    def currencies(c):
        return c.query(Q.SQL_OTP_CURRENCYDATA)

    def branches(c):
        return c.query(Q.SQL_OTP_BRANCHDATA)

    @r.get("/init")
    def _init(ws=Depends(g)):
        c = ws.conn                                                  # ActiveFormCreate :354-374
        day = c.query(Q.SQL_OTP_SYSDAT)[0]["TEK_DAT"]
        day = day.date() if isinstance(day, datetime.datetime) else day
        return {"date": day.isoformat(),
                "currencies": [{"index": 0, "name": "*"}] + [{"index": i + 1, "id": x["CURRENCYID"], "name": x["CURRLNAME"]}
                                                           for i, x in enumerate(currencies(c))],
                "branches": [{"index": 0, "name": "*"}] + [{"index": i + 1, "id": x["BRANCHID"], "name": x["BRANCHNAME"]}
                                                         for i, x in enumerate(branches(c))]}

    def period_prefix(c, d: datetime.datetime):
        """GetPeriodPrefix :429-441."""
        rows = c.query(Q.SQL_OTP_PERIODPREFIXDATA, {"ADate": d})
        v = rows[0]["PERIODPREFIX"] if rows else None
        return d if v is None else v

    def data(c, b: TurnIn):
        cur, br = currencies(c), branches(c)
        if b.currency > len(cur) or b.branch > len(br):
            err(400, "error.generic")
        currency_id = -1 if b.currency == 0 else int(cur[b.currency - 1]["CURRENCYID"])   # :453-456
        branch_id = -1 if b.branch <= 0 else int(br[b.branch - 1]["BRANCHID"])           # :458-461
        try:
            sql = turnover_sql(branch_id, currency_id, b.plan + 1, b.balances)            # :463-464, :500
        except ValueError:
            err(400, "out_turnovers.err_balances")
        beg, end = date_only(b.beg), date_only(b.end)                                     # :491-492
        return c.query(sql, {"BeginPeriod": period_prefix(c, beg), "BeginDate": beg, "EndDate": end})   # :503-506

    def report(c, b):
        """RGReportType 0 -> TurnOversRpt.Preview with the :521 filter."""
        rows = [x for x in data(c, b) if any(_nz(x.get(k)) for k in _FILTER)]
        cols = REPORT_COLS[:1] + (["ACC_NAME"] if b.with_names else []) + REPORT_COLS[1:]   # withaccnames :378-396
        bank = c.query(Q.SQL_OTP_BANKINFO)
        bi = bank[0] if bank else {}
        return {"cols": cols, "rows": rows, "totals": _sum(rows, REPORT_SUMS),
                "bank": {k.lower(): bi.get(k) for k in ("BANK", "INN", "MANAGERTITLE", "ACCOUNTANTTITLE", "MANAGER", "ACCOUNTANT")}}

    def export(c, b):
        """RGReportType 1 -> TurnOversExporter.ExportDataset (whole dataset, unfiltered)."""
        rows = data(c, b)
        return {"cols": EXPORT_COLS, "rows": rows, "totals": {}}

    KINDS = {"report": report, "export": export}

    def out(rep):
        o = {"cols": [x.lower() for x in rep["cols"]], "rows": rows_out(rep["rows"]),
             "totals": {k.lower(): float(v) for k, v in rep["totals"].items()}, "groups": None}
        if "bank" in rep:
            o["bank"] = rep["bank"]
        return o

    @r.post("/{kind}.{fmt}")
    def _file(kind: str, fmt: str, b: TurnIn, ws=Depends(g)):
        if kind not in KINDS or fmt not in ("pdf", "xlsx"):
            err(404, "error.generic")
        rep = KINDS[kind](ws.conn, b)
        rep.setdefault("groups", None)
        spec = render_spec(rep, b.labels)
        lab = b.labels.model_dump()
        return file_resp(R.to_pdf(spec, lab) if fmt == "pdf" else R.to_xlsx(spec, lab), fmt, "out-turnovers-" + kind)

    @r.post("/{kind}")
    def _run(kind: str, b: TurnIn, ws=Depends(g)):
        if kind not in KINDS:
            err(404, "error.generic")
        return out(KINDS[kind](ws.conn, b))

    return r
