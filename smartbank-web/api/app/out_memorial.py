"""Off-balance memorial orders - port of Delphi Packages/out_memorial (Tmemorial_project, CLSID below).

out_memorial.dpr compiles memorialimpl_COPY.pas (NOT memorialimpl.pas), memorial_datamod.pas, unitreport1..4 (QuickReports),
unitreferen.pas (formreference) and unitfilter.pas (filter dialog). SQL: out_mem_sql.py (verbatim memorial_datamod.dfm).
Flow (BitBtnRunClick .pas:620-708): OUT_SB_MEMORIAL.MEMORIAL(...) fills the per-user table 'Memorial_'||GetUserName,
then OpenOracleDataSet (.pas:542-562) reads it with the chosen ORDER BY. Grid filter by operator (SearchCombo1Change
.pas:842-854) and the Locate edits (.pas:709-717, 856-951) are client-side like the Delphi dataset filter/Locate.
Concatenated input is validated: TableName must be a plain identifier, the ORDER BY comes from the fixed list,
the 'Where (ID in (...))' list (miPrintSelectedClick .pas:801-839) is integers only. All other values are bound.
"""
from __future__ import annotations
import datetime
import re
from decimal import Decimal

from fastapi import APIRouter, Depends
from pydantic import BaseModel, Field

from . import out_mem_sql as Q
from . import report_render as R
from .balance import Labels, render_spec, file_resp, rows_out
from .customers import row
from .db.base import DBError, Out
from .delphi import date_only

CLSID = "{AE49F109-D3B9-4334-B841-77B4C90F2A16}"     # out_memorial_TLB.pas:56 CLASS_memorial_project
_IDENT = re.compile(r"^[A-Za-z][A-Za-z0-9_$#]{0,29}$")
EXPORT_COLS = ["VAL_ACC", "DEBITOR", "CURRENCYID_C", "KREDITOR", "AMMOUNT", "AMMOUNT_C", "LAMMOUNT"]   # dfm:841-851
GRID_COLS = EXPORT_COLS                                                                              # DBGrid1 visible columns dfm:40-178

# ---------------------------------------------------------------- CurrencyToHR_Azeri (ODSMainCalcFields datamod.pas:87-106)
# The unit is not in the package folder (comes from the library path); every copy in the repo has the same body:
# integer part in words, fraction part commented out, and the literal 'zaaaaaaa' appended (CurrencyToHR_Azeri_Impl.pas:116-126).
_D1 = ['bir', 'iki', 'üç', 'dörd', 'beş', 'altı', 'yeddi', 'səkkiz', 'doqquz']
_D2 = ['on', 'iyirmi', 'otuz', 'qırx', 'əlli', 'altmış', 'yetmiş', 'səksən', 'doxsan']
_D3 = ['', 'min', 'milyon', 'milyard', 'trillion', 'trilliard', '']


def _part(v: int) -> str:
    s = ""
    i = v // 100
    if i:
        s = (_D1[i - 1] + " " if i != 1 else "") + "yüz"
    v %= 100
    if v // 10:
        s += " " + _D2[v // 10 - 1]
    if v % 10:
        s += " " + _D1[v % 10 - 1]
    return s.strip()


def currency_to_hr_azeri(value) -> str:
    r = ""
    n = round(float(value or 0))                    # Round() - banker's rounding like Delphi
    if n != 0:
        sign = "-" if n < 0 else " "
        n, c, res = abs(n), 0, ""
        while n:
            p, n = n % 1000, n // 1000
            if p:
                res = _part(p) + " " + _D3[c] + " " + res
            c += 1
        r = (sign + res).strip()
    return (r + "zaaaaaaa").strip()


def calc(r: dict) -> dict:
    r["CURRINNATIONAL"] = currency_to_hr_azeri(r.get("LAMMOUNT")) + "/ ədəd"
    return r


# ---------------------------------------------------------------- inputs
class FilterIn(BaseModel):                          # unitfilter.dfm / .pas
    debt: bool = True                               # CBDebt (Checked in dfm)
    kred: bool = False                              # CBKred
    balance: bool = False                           # CheckBoxBalance
    plan: int = Field(0, ge=0, le=3)                # ComboBoxPlan.ItemIndex
    bal_list: str = Field("", max_length=4000)      # EditBalList.Text (bound as a string)


class RunIn(BaseModel):
    beg: datetime.date                              # DTPBegin
    end: datetime.date                              # DTPEnd
    rate: int = Field(0, ge=0)                      # CmbBoxRate.ItemIndex -> Rate[]
    form: int = Field(0, ge=0, le=3)                # CmbBoxForm.ItemIndex
    trans_mode: int = Field(0, ge=0, le=1)          # RGTransMode.ItemIndex
    diff: bool = True                               # CheckBoxDifference (Checked)
    use_balance: bool = True                        # CBUseBalance (Checked)
    branch: int = Field(0, ge=0)                    # BranchesSC.ItemIndex
    order: int = Field(0, ge=0, le=7)               # CmbBoxOrder.ItemIndex (global OrderBy)
    filter: FilterIn = Field(default_factory=FilterIn)


class OpenIn(BaseModel):
    order: int = Field(0, ge=0, le=7)
    ids: list[int] = Field(default_factory=list, max_length=5000)


class ReportIn(OpenIn):
    beg: datetime.date
    end: datetime.date
    rate: int = Field(0, ge=0)
    form: int = Field(0, ge=0, le=3)
    count: bool = False                             # CBCount
    blanck: int = Field(1, ge=0, le=1)              # RGBlanck.ItemIndex (dfm ItemIndex = 1)
    ordercount: bool = True                         # ordercount (QRExpr1.Enabled of memorial_rpt1)
    signer: str = Field("run", pattern="^(run|button|selected)$")   # who set the Memorial_Rpt3 signature captions last
    op_id: int | None = None                        # SearchCombo1 filter (for the Excel export)
    labels: Labels = Field(default_factory=Labels)


class ReferIn(BaseModel):
    balance: float                                  # ReferDataSetBALANCE TFloatField, Required


def debt_kred(f: FilterIn) -> int:
    """BitBtnRunClick .pas:646-655."""
    d = 0
    if f.debt:
        d = 0
    if f.kred:
        d = 1
    if f.debt and f.kred:
        d = 2
    if not f.debt and not f.kred:
        d = -1
    return d


def rates(c):
    """FillCmbBoxRate .pas:568-586: Rate[0] = -1 ('Bütün valyutalar'), then aValute rows in query order."""
    rs = c.query(Q.SQL_ODSRATE)
    return [{"index": 0, "valute": -1, "name": "Bütün valyutalar"}] + \
        [{"index": i + 1, "valute": int(x["VALUTE"]), "name": x.get("VALU_NAME") or ""} for i, x in enumerate(rs)]


def table_name(c) -> str:
    """OpenOracleDataSet .pas:551-553: 'Memorial_' + OUT_SB_MEMORIAL.GetUserName."""
    u = c.call_func(Q.PKG, "GetUserName", [], str) or ""
    if not _IDENT.match(u):
        raise ValueError("table")
    return "Memorial_" + u


def open_main(c, order: int, ids: list[int] | None = None) -> list[dict]:
    where = ""
    if ids:                                                         # miPrintSelectedClick .pas:822-824
        where = "Where (ID in (" + ",".join(str(int(i)) for i in ids) + "))"
    return [calc(dict(r)) for r in c.query(Q.main_sql(table_name(c), where + Q.ORDER[order]))]


def memorial(c, b: RunIn, multy: int, bal_type: int, bal_or_acc: int, balance: str, kred_debt: int, branches):
    """sb_Memorial .pas:414-425 (FilialMode always overwritten from BranchesSC)."""
    rl = rates(c)
    if b.rate >= len(rl):
        raise ValueError("rate")
    if b.branch > len(branches):
        raise ValueError("branch")
    filial = int(branches[b.branch - 1]["ID"]) if b.branch > 0 else -1
    args = [date_only(b.beg), date_only(b.end), rl[b.rate]["valute"], bal_type, bal_or_acc, balance, int(b.diff),
            kred_debt, int(b.use_balance), multy, b.trans_mode, filial]
    c.call_proc(Q.PKG, "MEMORIAL", args, commit=False)


def bank_info(c) -> tuple[str, str, bool]:
    """GetBankInfo .pas:436-448: CallProcedure('GetBankInfo', ['','']) + GetParameter(0/1); on error 'No Actual Parametr"s'."""
    try:
        o = c.plsql_out(f"begin {Q.PKG}.GetBankInfo(:p0, :p1); end;", {"p0": Out(str), "p1": Out(str)})
        return o.get("p0") or "", o.get("p1") or "", True
    except DBError:
        return "", "", False


def _az(v) -> bool:
    return str(v if v is not None else "")[:2] == "AZ"


def report(c, b: ReportIn) -> dict:
    """InitalizeRpt .pas:453-534 - which QuickReport and what it shows."""
    rows = open_main(c, b.order, b.ids)
    name, inn, ok = bank_info(c)
    rl = rates(c)
    if b.rate >= len(rl):
        raise ValueError("rate")
    index = int(rl[b.rate]["valute"] != 0)                          # Word(Rate[RateIndex] <> 0)  .pas:698/786/831
    d1, d2 = b.beg.strftime("%d-%m-%Y"), b.end.strftime("%d-%m-%Y")
    dates = d1 + (" - " + d2 if b.beg != b.end else "")             # QRLDate2.Enabled := Begin <> End
    for i, r in enumerate(rows, 1):
        r["N"] = i                                                  # QRExpr COUNT
        r["MEM_AMOUNT"] = r.get("AMMOUNT_C") if _az(r.get("VAL_ACC")) else r.get("AMMOUNT")   # IF(COPY(VAL_ACC,1,2)='AZ',...)
        r["DINN"], r["KINN"] = r.get("DINN"), r.get("KINN")          # report DataFields DInn/Kinn (dataset has DEBTINN/KREDINN)
        both0 = str(r.get("VAL_ACC")) == "0" and str(r.get("CURRENCYID_C")) == "0"
        r["LAMMOUNT_R"] = None if both0 else r.get("LAMMOUNT")       # IF((VAL_ACC = 0) And (CURRENCYID_C = 0),'  ',LAMMOUNT)
    bank_rows = c.query(Q.SQL_BANKINFO)
    bank_name = (bank_rows[0].get("BANK") if bank_rows else None) or ""
    if b.count:                                                     # .pas:459-478 blanks
        rpt = "rpt2" if b.blanck == 0 else "rpt1"
        cols = (["N"] if rpt == "rpt2" or b.ordercount else []) + ["DAT", "DEBITOR", "DNAME", "DINN", "KREDITOR", "KNAME",
                                                                 "KINN", "VAL_ACC", "CURRENCYID_C", "MEM_AMOUNT", "DIFFRATE",
                                                                 "LAMMOUNT_R", "CURRINNATIONAL", "NAME"]
        out = [dict(r) for r in rows for _ in range(2 if rpt == "rpt2" else 1)]   # rpt2: original + copy (QRImage1/2)
        return {"report": rpt, "cols": cols, "rows": out, "totals": {}, "header": [bank_name], "signatures": [],
                "bank_ok": ok}
    multi = b.form == 3
    cur = "Multi valyuta əməliyyatları " if multi else rl[b.rate]["name"]
    if index == 0:                                                  # Memorial_Rpt4 .pas:482-499
        cols = ["N", "DEBITOR", "DNAME", "DINN", "KREDITOR", "KNAME", "KINN", "VAL_ACC", "CURRENCYID_C", "LAMMOUNT", "NAME"]
        tot = {"LAMMOUNT": sum((Decimal(str(r.get("LAMMOUNT") or 0)) for r in rows), Decimal(0))}
        sig = [["Təhvil verən:", "___________________________"], ["Təhvil alan:", "___________________________"],
               ["Məsul İcraçı", "___________________________"]]
        return {"report": "rpt4", "cols": cols, "rows": rows, "totals": tot, "header": [name, inn, dates, cur],
                "signatures": sig, "bank_ok": ok}
    cur = "Multi valyuta əməliyyatlar " if multi else rl[b.rate]["name"]      # .pas:507-510 (text differs from rpt4)
    try:                                                            # .pas:516-525 current record = first after Open
        xv = "Manatla" if rows and _az(rows[0].get("VAL_ACC")) and _az(rows[0].get("CURRENCYID_C")) else "Xarici valyutada"
    except Exception:
        xv = "Xarici valyutada"
    cols = ["N", "DEBITOR", "DNAME", "DINN", "KREDITOR", "KNAME", "KINN", "VAL_ACC", "CURRENCYID_C"] + \
        (["DIFFRATE"] if multi else []) + ["MEM_AMOUNT", "LAMMOUNT", "NAME"]           # QRDBText8/QRLabel4 only for form 3
    last = rows[-1] if rows else {}
    sm = lambda k: sum((Decimal(str(r.get(k) or 0)) for r in rows), Decimal(0))  # noqa: E731
    tot = {"MEM_AMOUNT": sm("AMMOUNT_C") if _az(last.get("VAL_ACC")) else sm("AMMOUNT"), "LAMMOUNT": sm("LAMMOUNT")}
    sig = {"run": [["Təhvil verən", "_____________________________________"], ["Təhvil alan", "_____________________________________"]],
           "selected": [["Təhvil verən", "_____________________________________"], ["Təhvil alan", "_____________________________________"]],
           "button": [["", ""], ["Baş mühasib", "_____________________________________"]]}[b.signer]
    sig = [s for s in sig if s[0]] + [["Məsul İcraçı", "________________________________________"]]
    return {"report": "rpt3", "cols": cols, "rows": rows, "totals": tot, "header": [name, inn, dates, cur, xv],
            "signatures": sig, "bank_ok": ok}


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/out-memorial")
    g = require_module(CLSID)

    def guard(fn, *a):
        try:
            return fn(*a)
        except ValueError as e:
            err(400, "out_memorial.err_" + str(e))

    @r.get("/init")
    def _init(ws=Depends(g)):
        c = ws.conn                                                 # ActiveFormCreate .pas:587-613, DataModuleCreate :73-78
        day = c.call_func(Q.PKG, "getBankDay", [], datetime.datetime)
        day = day.date() if isinstance(day, datetime.datetime) else day
        return {"date": day.isoformat(), "rates": rates(c),
                "branches": [{"index": i + 1, "id": x["ID"], "name": x.get("NAME") or ""} for i, x in enumerate(c.query(Q.SQL_BRANCHES))],
                "users": [{"index": i + 1, "id": x["ID"], "name": x.get("NAME") or ""} for i, x in enumerate(c.query(Q.SQL_USERSLIST))],
                "orders": len(Q.ORDER)}

    @r.post("/run")
    def _run(b: RunIn, ws=Depends(g)):
        c = ws.conn
        br = c.query(Q.SQL_BRANCHES)
        if b.form == 0:                                             # .pas:630-639 Bütün əməliyyatlar
            guard(memorial, c, b, 0, 1, 0, "", -1, br)
        elif b.form == 1:                                           # .pas:640-664 Müştəri hesabları üzrə (filter dialog)
            f = b.filter
            guard(memorial, c, b, 0, f.plan + 1 if f.balance else 1, int(f.balance), f.bal_list, debt_kred(f), br)
        elif b.form == 2:                                           # .pas:665 separator line: nothing happens
            return {"rows": None}
        else:                                                       # .pas:687-694 multi-currency only
            guard(memorial, c, b, 1, 1, 0, "", -1, br)
        return {"rows": rows_out(guard(open_main, c, b.order))}

    @r.post("/open")
    def _open(b: OpenIn, ws=Depends(g)):                            # CmbBoxOrderChange .pas:720-741
        return {"rows": rows_out(guard(open_main, ws.conn, b.order, b.ids))}

    def rep_out(rep):
        return {**{k: rep[k] for k in ("report", "header", "signatures", "bank_ok")},
                "cols": [x.lower() for x in rep["cols"]], "rows": rows_out(rep["rows"]),
                "totals": {k.lower(): float(v) for k, v in rep["totals"].items()}}

    @r.post("/report")
    def _report(b: ReportIn, ws=Depends(g)):
        return rep_out(guard(report, ws.conn, b))

    def export(c, b: ReportIn):
        """miExcelExportClick .pas:796-799 TransactionsExporter (ExportList dfm:843-850) on the open dataset."""
        rows = guard(open_main, c, b.order, b.ids)
        if b.op_id is not None:
            rows = [x for x in rows if x.get("OP_ID") is not None and int(x["OP_ID"]) == b.op_id]
        return {"cols": EXPORT_COLS, "rows": rows, "totals": {}, "header": [], "signatures": []}

    @r.post("/{kind}.{fmt}")
    def _file(kind: str, fmt: str, b: ReportIn, ws=Depends(g)):
        if (kind, fmt) not in (("report", "pdf"), ("report", "xlsx"), ("export", "xlsx")):
            err(404, "error.generic")
        rep = guard(report, ws.conn, b) if kind == "report" else export(ws.conn, b)
        rep["groups"] = None
        spec = render_spec(rep, b.labels)
        spec["header"] = [h for h in rep["header"] if h] + list(b.labels.header)
        spec["signatures"] = [tuple(s) for s in rep["signatures"]] or spec["signatures"]
        lab = b.labels.model_dump()
        return file_resp(R.to_pdf(spec, lab) if fmt == "pdf" else R.to_xlsx(spec, lab), fmt, "out-memorial-" + kind)

    # ---------------------------------------------------------- formreference (BtnReferClick .pas:791-794)
    def refer(c):
        return [{"rowid": x.get("ROWID"), "balance": row(x).get("balance")} for x in c.query(Q.SQL_REFER)]

    def dml(c, sql, b):
        try:
            c.execute(sql, b)
            c.commit()                                              # CommitOnPost (DOA default)
        except Exception:
            c.rollback()
            raise

    @r.get("/refer")
    def _refer(ws=Depends(g)):
        return {"rows": refer(ws.conn)}

    @r.post("/refer")
    def _refer_post(b: ReferIn, rowid: str | None = None, ws=Depends(g)):
        if rowid:
            dml(ws.conn, Q.SQL_REFER_UPDATE, {"BALANCE": b.balance, "doa_rowid": rowid})
        else:
            dml(ws.conn, Q.SQL_REFER_INSERT, {"BALANCE": b.balance})
        return {"rows": refer(ws.conn)}

    @r.delete("/refer")
    def _refer_del(rowid: str, ws=Depends(g)):
        dml(ws.conn, Q.SQL_REFER_DELETE, {"doa_rowid": rowid})
        return {"rows": refer(ws.conn)}

    return r
