"""Payments ('Köçürmələr', internet-banking payments) - port of Delphi Packages/Payments (Payments / TPaymentsForm;
units PaymentsImpl1 (TPaymentsForm), Unit4 (TDM data module), Unit1 (TRep, QuickReport print - on hold),
UnitPaymentsProperties (TFormPaymentProperties - only referenced from commented-out code, never shown)).
No other copies: CLASS_PaymentsForm is only in Packages/Payments/Payments_TLB.pas. SQL verbatim in pay_sql.py.

ActiveFormCreate (PaymentsImpl1.pas:687-706): dm := TDM.Create (Dat and dsfilials are Active = True in Unit4.dfm);
DTPBEGIN / DTPEND := Dat.TEK_DAT; ODSPayments: sort := '1', DAT1 / DAT2 := trunc(dates); Open.
BtnRefreshClick (:708-724): same re-open with the picker dates, then SpeedButton3.Click.
SpeedButton3Click 'Statusları yoxla' (:1033-1061): First; for i := 0 to RecordCount do -> RecordCount + 1 calls of
pack.CallProcedure('Ibank_change_status', [TRANS_ID, j]); Next. `pack` has no PackageName (Unit4.dfm:516-521) ->
the standalone procedure Ibank_change_status. j is always 3: the third test
`(tt<>4) or (tt<>2) or (tt<>5)` is true for every value and overrides the AZIPS / XÖHKS values. After the last Next the
dataset is at EOF and stays on the last record, so the last record is called twice. No commit in the form.
ODSPayments variables (Unit4.dfm:87-89): DAT1 / DAT2 dates, SORT type 1 = otSubst (default 'id').
DBGridPaymentsTitleClick (:790-807): sort := Column.FieldName ('STATUS' for a column without one); Open; Refresh.
CheckBox1Click (:1223-1244): unchecked -> SQL[39] := '' and BtnRefresh.Click; DBLookupComboBox1CloseUp (:552-564):
SQL[39] := 'where filial = ''<KeyValue>''' and BtnRefresh.Click (the outer select * from (...) where filial = ..).
ActionFilterExecute (:197-381): client-side DataSet.Filter (types / statuses) - reproduced in the web page; the Excel
export (SpeedButton2Click :952-961, CMExcelExport.ExportDataset(dm.ODSPayments)) gets the same filter here.
A1Click / P1Click (:176-195, :586-600) and DBGridPaymentsDblClick (-> P1.Click): ods_rep (v_id) then ShellExecute of
\\\\10.0.11.90\\adocs\\<cli_id>-<id>.adoc / .pdf on a Windows share - on hold (the web returns the path only).
Print1 (Visible = False) / capClick: QuickReport TRep - print on hold.
"""
from __future__ import annotations

import datetime
import io

from fastapi import APIRouter, Depends, Response
from pydantic import BaseModel, Field

from . import pay_sql as Q
from .customers import row

CLSID = "{49670110-C03F-4C40-AE66-3708A5C1FBE4}"    # Payments_TLB.pas CLASS_PaymentsForm
# DBGridPayments columns (PaymentsImpl1.dfm Columns) - the only values a title click can put into :sort (otSubst)
GRID_FIELDS = ("ID", "STATUS", "TRANS_ID", "TR_TYPE", "SUSDAT", "GONDEREN_NAME", "GONDEREN_ACC", "GONDEREN_INN",
               "AMOUNT", "CURRENCY", "ALAN_NAME", "ALAN_ACC", "ALAN_INN", "DESCREPTION")
SORT_DEFAULT = "1"                                   # ActiveFormCreate / BtnRefreshClick setvariable('sort','1')
SHARE = "\\\\10.0.11.90\\adocs\\"                     # A1Click / P1Click (turanbank)


def _day(s: str) -> datetime.datetime:
    d = datetime.date.fromisoformat(s)               # trunc(DTP.DateTime)
    return datetime.datetime(d.year, d.month, d.day)


def payments_sql(sort: str, filial: int | None) -> str:
    """ODSPayments.SQL with the otSubst :sort substituted and SQL[39] set by DBLookupComboBox1CloseUp."""
    lines = Q.SQL_PAY_ODSPAYMENTS.split("\n")
    if filial is not None:
        lines[39] = "where filial = '" + str(int(filial)) + "'"
    assert lines[44] == " order by :sort"
    lines[44] = " order by " + sort
    return "\n".join(lines)


class OpenIn(BaseModel):
    dat1: str = Field(pattern=r"^\d{4}-\d{2}-\d{2}$")
    dat2: str = Field(pattern=r"^\d{4}-\d{2}-\d{2}$")
    sort: str = SORT_DEFAULT
    filial: int | None = None


class FilterIn(BaseModel):
    """ActionFilterExecute state: None = Filtered never switched on (all rows)."""
    types: list[int] | None = None
    statuses: list[int] | None = None


class XlsIn(OpenIn):
    filter: FilterIn = FilterIn()


class CheckIn(BaseModel):
    trans_ids: list[str | None] = Field(max_length=100000)


class IdIn(BaseModel):
    id: int
    ext: str = Field(pattern=r"^(adoc|pdf)$")


def open_payments(c, o: OpenIn, err) -> list[dict]:
    if o.sort != SORT_DEFAULT and o.sort not in GRID_FIELDS:
        err(400, "error.generic")
    return [row(x) for x in c.query(payments_sql(o.sort, o.filial), {"DAT1": _day(o.dat1), "DAT2": _day(o.dat2)})]


def apply_filter(rows: list[dict], f: FilterIn) -> list[dict]:
    """DataSet.Filter = '((status =a)or(status =b)or(status =c)) AND ((transaction_type=t1)OR ...)' (Word(Checked)*Tag)."""
    if f.types is None and f.statuses is None:
        return rows
    def num(v):
        try:
            return int(v)
        except (TypeError, ValueError):
            return None
    return [r for r in rows if num(r.get("status")) in (f.statuses or []) and num(r.get("transaction_type")) in (f.types or [])]


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/payments")
    g = require_module(CLSID)

    @r.get("/init")
    def _init(ws=Depends(g)):
        c = ws.conn
        dat = c.query(Q.SQL_PAY_DAT)                                          # Dat (Active = True)
        filials = [row(x) for x in c.query(Q.SQL_PAY_DSFILIALS)]              # dsfilials (Active = True)
        tek = dat[0]["TEK_DAT"] if dat else None
        tek = tek.date().isoformat() if isinstance(tek, datetime.datetime) else (str(tek)[:10] if tek else None)
        rows = open_payments(c, OpenIn(dat1=tek, dat2=tek), err) if tek else []
        return {"tek_dat": tek, "filials": filials, "rows": rows}

    @r.post("/open")                                                          # BtnRefresh / title click / filial
    def _open(o: OpenIn, ws=Depends(g)):
        return {"rows": open_payments(ws.conn, o, err)}

    @r.post("/check_status")                                                  # SpeedButton3Click 'Statusları yoxla'
    def _check(b: CheckIn, ws=Depends(g)):
        ids = list(b.trans_ids)
        if ids:
            ids.append(ids[-1])                                               # RecordCount + 1 iterations (last at EOF)
        for t in ids:
            ws.conn.call_proc("", "Ibank_change_status", [t, 3], commit=False)
        return {"calls": len(ids)}

    @r.post("/doc_path")                                                      # A1Click / P1Click: ods_rep + ShellExecute
    def _doc(b: IdIn, ws=Depends(g)):
        rep = ws.conn.query(Q.SQL_PAY_ODS_REP, {"v_id": b.id})
        x = rep[0] if rep else {}
        cli = "" if x.get("CLI_ID") is None else str(x.get("CLI_ID"))
        i = "" if x.get("ID") is None else str(row({"ID": x.get("ID")})["id"])
        return {"path": SHARE + cli + "-" + i + "." + b.ext}

    @r.post("/excel")                                                         # SpeedButton2Click: ExportDataset(ODSPayments)
    def _xls(b: XlsIn, ws=Depends(g)):
        from openpyxl import Workbook
        from openpyxl.styles import Font
        o = OpenIn(dat1=b.dat1, dat2=b.dat2, sort=b.sort, filial=b.filial)
        if o.sort != SORT_DEFAULT and o.sort not in GRID_FIELDS:
            err(400, "error.generic")
        raw = ws.conn.query(payments_sql(o.sort, o.filial), {"DAT1": _day(o.dat1), "DAT2": _day(o.dat2)})
        keep = {id(x) for x, y in zip(raw, [row(z) for z in raw]) if apply_filter([y], b.filter)}
        wb = Workbook()
        sh = wb.active
        sh.title = "Transactions"
        cols = list(raw[0].keys()) if raw else []
        sh.append(cols)
        for cell in sh[1]:
            cell.font = Font(bold=True)
        for x in raw:
            if id(x) in keep:
                sh.append([v.replace(tzinfo=None) if isinstance(v, datetime.datetime) else v for v in x.values()])
        bio = io.BytesIO()
        wb.save(bio)
        return Response(bio.getvalue(), media_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                        headers={"Content-Disposition": 'attachment; filename="Transactions.xlsx"'})

    return r
