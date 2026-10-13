"""Balance report group: Packages/Balance (TFrmBalance), DBDBalance (TFrmDayByDayBalance), TodayBalance
(TFrmTodayBalance), BalanceAnalys (TFormBalanceAnalys), AccBalanceCheck (TAccBalanceCheckForm).

SQL is verbatim in bal_sql.py; what the Delphi code does to it is in bal_logic.py (each step cites unit:line).
Reports are returned as on-screen grids (QuickReport Preview replacement) and rendered to PDF / Excel on request.
"""
from __future__ import annotations

import datetime
from decimal import Decimal

from fastapi import APIRouter, Depends
from fastapi.responses import Response
from pydantic import BaseModel, Field

from .db.base import Out
from . import bal_sql as Q
from . import bal_logic as L
from . import report_render as R
from .customers import row
from . import out_bal_sql as OQ
from . import out_tb_sql as OTQ
from . import out_ba_sql as OBQ
from types import SimpleNamespace

CLSID_BALANCE = "{D93CAE95-900D-11D6-AA87-00C0262B568B}"
CLSID_DBD = "{D077818C-A020-4DF6-A9CD-2421A76A8AFC}"
CLSID_TODAY = "{A06DC10A-2115-4EED-A373-D446BAA6661C}"
CLSID_ANALYS = "{3F8A831B-BCB5-4939-83CB-4DA491A12312}"
CLSID_ACCCHECK = "{3877ACED-C099-400D-AFB4-58C4389DAFB8}"

# Packages/Balance (UnitDataMod.dfm / BalanceImplUnit.dfm) and its off-balance twin Packages/Out_Balance
# (out_UnitDataMod.dfm / Out_BalanceImpl.dfm): same Delphi logic (sb_InitRpt, BitBtnOkClick, BtnCreateFileClick,
# BtnCompBalanceClick are line-for-line identical), different SQL / package.
BAL = SimpleNamespace(prefix="/api/balance", clsid=CLSID_BALANCE, pkg="SB_BalanceFilIDs", unit="BalanceImplUnit.pas",
                      selections=Q.SQL_BAL_SELECTIONS, odsmain=Q.SQL_BAL_ODSMAIN, groups=Q.SQL_BAL_BALANCE_GROUPS,
                      settings=Q.SQL_BAL_SETTINGS, nbinfo=Q.SQL_BAL_NBINFO, rate=Q.SQL_BAL_RATE, branches=Q.SQL_BAL_BRANCHES,
                      bankinfo=Q.SQL_BAL_BANKINFO, comp=Q.SQL_BAL_COMP_BALANCE, balance_settings=Q.SQL_BAL_BALANCE_SETTINGS,
                      settings_edit=True)
CLSID_OUT_BALANCE = "{BD77DB0C-1F02-4C24-A975-B8D8AC882D83}"   # Out_Balance_TLB.pas CLASS_Out_Balance
OBAL = SimpleNamespace(prefix="/api/out-balance", clsid=CLSID_OUT_BALANCE, pkg="out_SB_BALANCEFILIDS", unit="Out_BalanceImpl.pas",
                       selections=OQ.SQL_OBAL_OUT_SB_BALANCEFILIDS, odsmain=OQ.SQL_OBAL_ODSMAIN, groups=OQ.SQL_OBAL_BALANCEGROUPS,
                       settings=OQ.SQL_OBAL_ODS_SETTINGS, nbinfo=OQ.SQL_OBAL_ODSBANKINFO_OUT_BALANCEIMPL, rate=OQ.SQL_OBAL_ODSRATE,
                       branches=OQ.SQL_OBAL_BRANCHDATASET, bankinfo=OQ.SQL_OBAL_ODSBANKINFO, comp=OQ.SQL_OBAL_ODSBALANCE,
                       balance_settings=OQ.SQL_OBAL_ODS_BALANCE_SETTINGS,
                       settings_edit=False)   # Out_BalanceImpl.dfm:388 BtnCompBalanceSettings has no OnClick handler

CLSID_OUT_TODAY = "{06F8748C-EF03-4372-B714-9D98D02F6FD6}"     # out_todaybalance_TLB.pas CLASS_FrmTodayBalance
TB = SimpleNamespace(prefix="/api/todaybalance", clsid=CLSID_TODAY, branches=Q.SQL_TB_BRANCHES, sysdat=Q.SQL_TB_SYSDAT,
                     currency=Q.SQL_TB_CURRENCY, balance=Q.SQL_TB_BALANCE, bankinfo=Q.SQL_TB_BANKINFO, bank_bind=True,
                     transactions=Q.SQL_TB_TRANSACTIONS, account=Q.SQL_TB_ACCOUNT, workdate=None)
# Out_todaybalance: same Balance_/Account_/Transaction_Selections line edits (TodayBalanceImpl.pas:412-489), but its DFM
# lines 20/21/15 carry no %s (always out_archost / out_provarch) and the AccountData lines 4/10/17/18 none either.
OTB = SimpleNamespace(prefix="/api/out-todaybalance", clsid=CLSID_OUT_TODAY, branches=OTQ.SQL_OTB_BRANCHESINFO, sysdat=OTQ.SQL_OTB_SYSDAT,
                      currency=OTQ.SQL_OTB_CURRENCYINFO, balance=OTQ.SQL_OTB_BALANCEDATA, bankinfo=OTQ.SQL_OTB_BANKINFO, bank_bind=False,
                      transactions=OTQ.SQL_OTB_TRANSACTIONSDATA, account=OTQ.SQL_OTB_ACCOUNTDATA,
                      workdate=OTQ.SQL_OTB_WORKDATEDATA)
BA = SimpleNamespace(prefix="/api/balanceanalys", clsid=CLSID_ANALYS, sysdat=Q.SQL_BA_SYSDAT, branches=Q.SQL_BA_BRANCHES,
                     currency=Q.SQL_BA_CURRENCY, operators=Q.SQL_BA_OPERATORS, period=Q.SQL_BA_PERIOD, balance=Q.SQL_BA_BALANCE,
                     account=Q.SQL_BA_ACCOUNT, credbal=Q.SQL_BA_CREDBAL_ACC, debtbal=Q.SQL_BA_DEBTBAL_ACC, transaction=Q.SQL_BA_TRANSACTION,
                     with_group=True)
# Out_BalanceAnalys shares the CLSID of BalanceAnalys (BalanceAnalys_TLB.pas:56 in both folders), so the web keys it
# as a variant of that CLSID (tree Action '#n@Out'); it is the older form: no credbal/debtbal grids, balances filter
# without the accgroup alternative (BalanceAnalysImpl.pas:556).
OBA = SimpleNamespace(prefix="/api/out-balanceanalys", clsid=CLSID_ANALYS, sysdat=OBQ.SQL_OBA_SYSDAT, branches=OBQ.SQL_OBA_OPERATIONTYPE,
                      currency=OBQ.SQL_OBA_CURRENCY, operators=OBQ.SQL_OBA_OPERATOR, period=OBQ.SQL_OBA_PERIODDATA, balance=OBQ.SQL_OBA_BALANCE,
                      account=OBQ.SQL_OBA_ACCOUNT, credbal=None, debtbal=None, transaction=OBQ.SQL_OBA_TRANSACTION, with_group=False)

XLSX = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"


def dt(d: datetime.date) -> datetime.datetime:
    return datetime.datetime.combine(d, datetime.time())


def rows_out(rows):
    return [row(r) for r in rows]


def _dec(v):
    return float(v) if isinstance(v, Decimal) else v


def spec_out(rep: dict) -> dict:
    """JSON form of a bal_logic report (lower-case keys like every other grid)."""
    o = {"name": rep["name"], "cols": [c.lower() for c in rep["cols"]], "rows": rows_out(rep["rows"]),
         "totals": {k.lower(): _dec(v) for k, v in rep["totals"].items()}, "groups": None}
    if rep.get("groups"):
        o["groups"] = [{"key": g["key"], "rows": rows_out(g["rows"]), "totals": {k.lower(): _dec(v) for k, v in g["totals"].items()}}
                       for g in rep["groups"]]
    return o


class Labels(BaseModel):
    """Captions for exported files, taken from the web locale of the user (never interpreted)."""
    title: str = Field("", max_length=200)
    header: list[str] = Field(default_factory=list, max_length=12)
    cols: dict[str, str] = Field(default_factory=dict)
    total: str = Field("", max_length=80)
    group_total: str = Field("", max_length=80)
    signatures: list[list[str]] = Field(default_factory=list, max_length=6)
    sheet: str = Field("", max_length=31)
    sheet2: str = Field("", max_length=31)


def render_spec(rep: dict, lab: Labels) -> dict:
    return {"title": lab.title, "header": lab.header, "sheet": lab.sheet or lab.title,
            "cols": [{"field": c, "label": lab.cols.get(c.lower(), c), "money": c in L.MONEY} for c in rep["cols"]],
            "rows": rep["rows"], "totals": rep.get("totals"), "groups": rep.get("groups"),
            "signatures": [tuple(s[:2]) for s in lab.signatures]}


def file_resp(data: bytes, kind: str, name: str) -> Response:
    mt = {"pdf": "application/pdf", "xlsx": XLSX, "dbf": "application/x-dbf"}[kind]
    return Response(data, media_type=mt, headers={"Content-Disposition": f'attachment; filename="{name}.{kind}"'})


# ================================================================================================ Balance
class BalanceIn(BaseModel):
    beg: datetime.date
    end: datetime.date
    plan: int = Field(0, ge=0, le=3)            # ComboBoxPlan.ItemIndex (BalanceType = +1)
    currency: int = -1                           # Rate[CmbBoxRate.ItemIndex]
    format: int = Field(0, ge=0, le=1)           # CmbBoxFormat.ItemIndex (0 currency balance, 1 national)
    branches: list[int] = Field(default_factory=list)
    report: int = Field(0, ge=0, le=5)           # ComboBoxFont.ItemIndex = RptID
    fields: list[str] = Field(default_factory=list)
    labels: Labels = Field(default_factory=Labels)


def bal_get_balance(F, conn, beg, end, plan, currency, fmt, branch_str="-1") -> str:
    """BalanceImplUnit.pas:493-517 sb_GetBalance (SB_BalanceFilIDs TOracleQuery, :P_Procedure = sb_BalanceSelections)."""
    sql = F.selections.replace(":P_Procedure", "sb_BalanceSelections")
    out = conn.plsql_out(sql, {"begDate": dt(beg), "endDate": dt(end), "BalanceType": plan + 1, "CurrencyID": currency,
                               "FormatID": fmt, "Param1": Out(str), "Param2": Out(str), "BranchID": branch_str})
    return L.balance_text(out.get("Param1"), out.get("Param2"))


def bal_open_main(F, conn, text: str) -> list[dict]:
    """sb_OpenDataSet(DataModuleMain.ODSMain, 'AStrParam', V) -> SB_BALANCEFILIDS.OpenCursor(:ACursor, :AStrParam1, :AStrParam2)."""
    p1, p2 = L.split_astr(text)
    return conn.cursor_block(F.odsmain, "ACursor", {"AStrParam1": p1, "AStrParam2": p2})


def bal_bank_info(F, conn) -> dict:
    """sb_GetBankInfo :590-602: CallProcedure('GetBankInfo', ['',0,'','']) + GetParameter(0..3)."""
    o = conn.plsql_out(f"begin {F.pkg}.GetBankInfo(:p0, :p1, :p2, :p3); end;",
                       {"p0": Out(str), "p1": Out(int), "p2": Out(str), "p3": Out(str)})
    return {"bank": o.get("p0") or "", "code": o.get("p1") or 0, "manager": o.get("p2") or "", "accountant": o.get("p3") or ""}


def balance_run(F, conn, b: BalanceIn) -> tuple[list[dict], str]:
    """BitBtnOkClick :842-884."""
    if not b.branches:
        raise L.BalError("balance.err_branch")            # ChListFilialClickCheck: BitBtnOk disabled
    text = bal_get_balance(F, conn, b.beg, b.end, b.plan, b.currency, b.format, L.cr_filial_str(b.branches))
    rows = bal_open_main(F, conn, text)
    L.acc_group_lookup(rows, conn.query(F.groups))
    return rows, text


class F600In(BaseModel):
    beg: datetime.date
    end: datetime.date
    plan: int = Field(0, ge=0, le=3)
    divisor: str = Field("1", max_length=12)

class CompIn(BaseModel):
    beg: datetime.date
    end: datetime.date
    currency: int = -1
    branches: list[int] = Field(default_factory=list)
    labels: Labels = Field(default_factory=Labels)

class SetIn(BaseModel):
    rowid: str = Field(pattern=r"^[A-Za-z0-9+/]{18}$")
    code: str = Field("", max_length=32)
    balance: str = Field("", max_length=4000)
    name: str = Field("", max_length=400)

class DbdIn(BaseModel):
    beg: datetime.date
    end: datetime.date
    branch: int = -1                         # BrancheIDs[CBBranches.ItemIndex]
    plan: int = Field(0, ge=0, le=3)         # ComboBox1
    mode: int = Field(0, ge=0, le=1)         # RG1: 0 balance numbers, 1 account numbers
    edit: str = Field("", max_length=10000)  # EditDebt
    symbols: list[str] = Field(default_factory=list)
    currencies: list[int] = Field(default_factory=list)
    with_out: bool = False                   # out_balance checkbox
    labels: Labels = Field(default_factory=Labels)

class TbIn(BaseModel):
    date: datetime.date
    currency: int = -1
    branch: int = -1
    amount_type: int = Field(0, ge=0, le=1)
    accounts: str = Field("", max_length=4000)
    report: int = Field(0, ge=0, le=2)
    rest_only: bool = False
    account_number: int | None = None
    labels: Labels = Field(default_factory=Labels)

class BaIn(BaseModel):
    beg: datetime.date
    end: datetime.date
    branches: list[int] = Field(default_factory=list)
    currency_on: bool = False
    currency: int | None = None
    balances: str = Field("", max_length=4000)
    view: int = Field(0, ge=0, le=1)          # CBBalanceView
    plan: int = Field(0, ge=0, le=3)          # CBBalanceReference
    operator: int | None = None               # CBOperator checked -> Operators.ID
    account_id: int | None = None
    balans: int | None = None
    kind: str = Field("all", pattern="^(all|debt|cred|balance|account)$")
    labels: Labels = Field(default_factory=Labels)


def make_routers(current, require_module, err):
    def run(fn, *a, **k):
        try:
            return fn(*a, **k)
        except L.BalError as e:
            err(400, e.key, **e.kw)

    routers = []
    def build_balance(F):
        # ----------------------------------------------------------------------------------------- Balance
        r = APIRouter(prefix=F.prefix)
        g = require_module(F.clsid)

        @r.get("/init")
        def _binit(ws=Depends(g)):
            c = ws.conn
            day = c.call_func(F.pkg, "GetBankDay", [], datetime.datetime)
            setting = c.query(F.settings)
            nb = c.query(F.nbinfo)
            return {"date": day.date().isoformat(), "currencies": rows_out(c.query(F.rate)),
                    "branches": rows_out(c.query(F.branches)),
                    "comp_visible": bool(setting) and str(setting[0].get("VALUE")) == "2", "settings_edit": F.settings_edit,     # ActiveFormCreate :812-818
                    "nb": row(nb[0]) if nb else {}}

        @r.post("/run")
        def _brun(b: BalanceIn, ws=Depends(g)):
            rows, text = run(balance_run, F, ws.conn, b)
            rep = L.balance_report(rows, b.report)
            about = ws.conn.query(F.bankinfo)
            return {"report": spec_out(rep), "bank": bal_bank_info(F, ws.conn), "about": row(about[0]) if about else {},
                    "dates": L.report_dates(b.beg, b.end), "sql": text, "all_rows": rows_out(rows)}

        @r.post("/report.{kind}")
        def _brep(kind: str, b: BalanceIn, ws=Depends(g)):
            if kind not in ("pdf", "xlsx"):
                err(404, "error.not_found")
            rows, _ = run(balance_run, F, ws.conn, b)
            rep = L.balance_report(rows, b.report)
            spec = render_spec(rep, b.labels)
            data = R.to_pdf(spec, b.labels.model_dump()) if kind == "pdf" else R.to_xlsx(spec, b.labels.model_dump())
            return file_resp(data, kind, "balance")

        @r.post("/export.xlsx")
        def _bexp(b: BalanceIn, ws=Depends(g)):
            """BitBtn1 (Excel, Tag<>1) -> ExportForm: chosen FieldsInfo columns of the unfiltered ODSMain."""
            fields = [f for f in L.EXPORT_FIELDS if f in {x.upper() for x in b.fields}]
            if not fields:
                err(400, "balance.err_fields")
            rows, _ = run(balance_run, F, ws.conn, b)
            spec = render_spec({"cols": fields, "rows": rows, "totals": None}, b.labels)
            return file_resp(R.to_xlsx(spec, b.labels.model_dump()), "xlsx", "balance")


        @r.post("/f600.dbf")
        def _bf600(b: F600In, ws=Depends(g)):
            """BtnCreateFileClick :924-999 (Rate[0] = all currencies, format 0, BranchID default '-1')."""
            try:
                div = int(b.divisor)                       # StrToInt(DivisorEdit.Text) raises EConvertError
            except ValueError:
                err(400, "balance.err_divisor")
            c = ws.conn
            rows = bal_open_main(F, c, bal_get_balance(F, c, b.beg, b.end, b.plan, -1, 0))
            nb = c.query(F.nbinfo)
            nb = nb[0] if nb else {}
            return file_resp(L.write_dbf(L.f600_rows(rows, nb.get("NB"), nb.get("BF"), div)), "dbf", "F600")


        def _comp(c, b: CompIn):
            """BtnCompBalanceClick :1038-1055: OP.CallProcedure('getbalance', [named]) then ODSBalance."""
            if not ws_comp_visible(c):
                err(403, "error.access_denied")
            c.call_proc(None, "getbalance", [], named={"BeginDate": dt(b.beg), "LastDate": dt(b.end),
                                                       "Branchs": L.cr_filial_str(b.branches), "CurrencyID": b.currency})
            rows = c.query(F.comp)
            groups = []
            for x in rows:                               # TQRGroup on ODSBalance.Status
                if not groups or groups[-1]["key"] != x.get("STATUS"):
                    groups.append({"key": x.get("STATUS"), "rows": [], "totals": {}})
                groups[-1]["rows"].append(x)
            return {"name": "comp", "cols": ["CODE", "NAME", "RESTBEGINPERIOD", "RESTLASTPERIOD"], "rows": rows, "totals": {}, "groups": groups}

        def ws_comp_visible(c):
            s = c.query(F.settings)
            return bool(s) and str(s[0].get("VALUE")) == "2"

        @r.post("/comp")
        def _bcomp(b: CompIn, ws=Depends(g)):
            rep = _comp(ws.conn, b)
            about = ws.conn.query(F.bankinfo)
            return {"report": spec_out(rep), "about": row(about[0]) if about else {}}

        @r.post("/comp.{kind}")
        def _bcompf(kind: str, b: CompIn, ws=Depends(g)):
            if kind not in ("pdf", "xlsx"):
                err(404, "error.not_found")
            rep = _comp(ws.conn, b)
            spec = render_spec(rep, b.labels)
            return file_resp(R.to_pdf(spec, b.labels.model_dump()) if kind == "pdf" else R.to_xlsx(spec, b.labels.model_dump()), kind, "comp-balance")

        @r.get("/comp/settings")
        def _bset(ws=Depends(g)):
            if not F.settings_edit or not ws_comp_visible(ws.conn):
                err(403, "error.access_denied")
            return [{"rowid": x["ROWID"], "code": x.get("CODE"), "balance": x.get("BALANCE"), "name": x.get("NAME")}
                    for x in ws.conn.query(F.balance_settings)]


        @r.post("/comp/settings")
        def _bsetp(b: SetIn, ws=Depends(g)):
            """FrmCompBalSettings DBGrid on ODS_BALANCE_SETTINGS (rowid selected -> DOA posts an update by ROWID)."""
            if not F.settings_edit or not ws_comp_visible(ws.conn):
                err(403, "error.access_denied")
            ws.conn.execute("update BALANCE_SETTINGS set CODE = :code, BALANCE = :balance, NAME = :name where rowid = :rid",
                            {"code": b.code, "balance": b.balance, "name": b.name, "rid": b.rowid})
            ws.conn.commit()
            return {"ok": True}

        return r

    routers.append(build_balance(BAL))
    routers.append(build_balance(OBAL))

    # ----------------------------------------------------------------------------------------- DBDBalance
    r = APIRouter(prefix="/api/dbdbalance")
    g2 = require_module(CLSID_DBD)

    @r.get("/init")
    def _dinit(ws=Depends(g2)):
        c = ws.conn
        return {"date": c.query(Q.SQL_DBD_SYSDAT)[0]["TEK_DAT"].date().isoformat(),
                "branches": rows_out(c.query(Q.SQL_DBD_BRANCHES)), "symbols": rows_out(c.query(Q.SQL_DBD_SYMBOLS)),
                "valutes": rows_out(c.query(Q.SQL_DBD_VALUTE))}


    def _drun(c, b: DbdIn):
        all_sym = [x["SYMBOL"] for x in c.query(Q.SQL_DBD_SYMBOLS)]
        all_val = [x["VALUTE"] for x in c.query(Q.SQL_DBD_VALUTE)]
        p = L.dbd_params(b.plan, b.currencies, all_val, b.symbols, all_sym, b.mode, b.edit)
        for pkg, args in L.dbd_calls(p, dt(b.beg), dt(b.end), b.branch, b.with_out):
            c.call_proc(pkg, "NON_EXSIST_DATES", args)
        bal = c.query(Q.SQL_DBD_BALANCE)
        out = c.query(Q.SQL_DBD_OUT_BALANCE) if b.with_out else []
        for x in bal + out:
            x["ID"] = L.dbd_row_id(x)
        return bal, out

    @r.post("/run")
    def _drunp(b: DbdIn, ws=Depends(g2)):
        bal, out = run(_drun, ws.conn, b)
        return {"balance": rows_out(bal), "out": rows_out(out)}

    @r.post("/export.xlsx")
    def _dexp(b: DbdIn, ws=Depends(g2)):
        """BtnExcelClick :721-733: 'Balansdankənar' sheet (if checked and not empty) then 'Balans' (if not empty)."""
        bal, out = run(_drun, ws.conn, b)
        cols = ["ADATE", "ACCOUNTNUM", "ACCOUNTNAME", "ACTIVE", "PASSIVE", "DEBT_TURNOVER", "CREDIT_TURNOVER"]
        mk = lambda rows, sheet: {**render_spec({"cols": cols, "rows": rows, "totals": None}, b.labels), "sheet": sheet}  # noqa: E731
        sheets = ([mk(out, b.labels.sheet2 or "Balansdankənar")] if b.with_out and out else []) + ([mk(bal, b.labels.sheet or "Balans")] if bal else [])
        if not sheets:
            err(400, "balance.err_empty")
        for s in sheets:
            for c in s["cols"]:
                c["money"] = c["field"] in ("ACTIVE", "PASSIVE", "DEBT_TURNOVER", "CREDIT_TURNOVER")
        return file_resp(R.to_xlsx({"sheets": sheets, "cols": sheets[0]["cols"]}, b.labels.model_dump()), "xlsx", "daybyday-balance")

    routers.append(r)

    def build_today(T):
        # ----------------------------------------------------------------------------------------- TodayBalance
        r = APIRouter(prefix=T.prefix)
        g3 = require_module(T.clsid)

        @r.get("/init")
        def _tinit(ws=Depends(g3)):
            c = ws.conn
            br = rows_out(c.query(T.branches))
            return {"date": c.query(T.sysdat)[0]["CURRENTDATE"].date().isoformat(),
                    "currencies": rows_out(c.query(T.currency)), "branches": br,
                    "single_branch": len(br) == 1}            # Sabuhi M. 10.12.2020: one branch -> preselect, lock


        def _target(c, b):
            """On-balance: TargetDate = the picked date (TodayBalanceImpl.pas:556, H.R. 16.09.2012). Out_todaybalance still
            uses Get_BankWorkDate (TodayBalanceImpl.pas:512-522,551): max(Operkurs.dat) <= date; Integer(Trunc(NULL)) = 0."""
            if T.workdate is None:
                return dt(b.date)
            x = c.query(T.workdate, {"RealDate": dt(b.date)})
            v = x[0]["WORKDATE"] if x else None
            return v if v is not None else datetime.datetime(1899, 12, 30)

        def _today(c, d):
            return d == c.query(T.sysdat)[0]["CURRENTDATE"].date()

        def _tbal(c, b: TbIn):
            amount = L.tb_amount_type(b.currency, b.amount_type)
            sql = L.tb_balance_sql(T.balance, b.currency, b.branch, b.accounts, amount, _today(c, b.date))
            return c.query(sql, {"TargetDate": _target(c, b)}), sql

        def _tbank(c, b: TbIn):
            a = -1 if b.branch == -1 else b.branch           # filid := -1 when Branches.Text = 'Ümumi'
            x = c.query(T.bankinfo, {"a": a} if T.bank_bind else {})   # Out_ BankInfo has no :a variable
            return row(x[0]) if x else {}

        @r.post("/run")
        def _trun(b: TbIn, ws=Depends(g3)):
            rows, sql = run(_tbal, ws.conn, b)
            return {"report": spec_out(L.tb_report(rows, b.report)), "bank": _tbank(ws.conn, b), "sql": sql,
                    "target": b.date.strftime("%d/%m/%Y"), "work_date": _target(ws.conn, b).strftime("%d/%m/%Y")}

        @r.post("/report.{kind}")
        def _trep(kind: str, b: TbIn, ws=Depends(g3)):
            if kind not in ("pdf", "xlsx"):
                err(404, "error.not_found")
            rows, _ = run(_tbal, ws.conn, b)
            spec = render_spec(L.tb_report(rows, b.report), b.labels)
            return file_resp(R.to_pdf(spec, b.labels.model_dump()) if kind == "pdf" else R.to_xlsx(spec, b.labels.model_dump()), kind, "today-balance")

        @r.post("/export.xlsx")
        def _texp(b: TbIn, ws=Depends(g3)):
            """RGReportFormat = 2: BalanceExporter.Report (all BalanceData fields, unfiltered)."""
            rows, _ = run(_tbal, ws.conn, b)
            spec = render_spec({"cols": ["ACCOUNTNUMBER", "ACTIVE", "PASSIVE", "DTURNOVER", "CTURNOVER", "ACCOUNTNAME"], "rows": rows, "totals": None}, b.labels)
            return file_resp(R.to_xlsx(spec, b.labels.model_dump()), "xlsx", "today-balance")

        @r.post("/checking")
        def _tchk(b: TbIn, ws=Depends(g3)):
            """RGReportFormat = 1: FrmBalanceChecking (balance grid, accounts of the current balance row, transactions)."""
            c = ws.conn
            rows, _ = run(_tbal, c, b)
            tr = c.query(L.tb_transactions_sql(T.transactions, _today(c, b.date)), {"TargetDate": _target(c, b)})
            return {"balance": rows_out(rows), "transactions": rows_out(tr)}

        @r.post("/checking/accounts")
        def _tacc(b: TbIn, ws=Depends(g3)):
            """AccountData: master-detail on :AccountNumber; CBRest filter."""
            c = ws.conn
            amount = L.tb_amount_type(b.currency, b.amount_type)
            sql = L.tb_account_sql(T.account, b.currency, b.branch, amount, _today(c, b.date))
            rows = c.query(sql, {"TargetDate": _target(c, b), "AccountNumber": b.account_number})
            return rows_out(L.tb_account_filter(rows, b.rest_only))
        return r

    def build_analys(A):
        # ----------------------------------------------------------------------------------------- BalanceAnalys
        r = APIRouter(prefix=A.prefix)
        g4 = require_module(A.clsid)

        @r.get("/init")
        def _ainit(ws=Depends(g4)):
            c = ws.conn
            return {"date": c.query(A.sysdat)[0]["TEK_DAT"].date().isoformat(), "branches": rows_out(c.query(A.branches)),
                    "currencies": rows_out(c.query(A.currency)), "operators": rows_out(c.query(A.operators)),
                    "balacc": A.credbal is not None}


        def _period(c, beg):
            """GetBeginPeriod: max(dat) < BeginDate, or BeginDate when NULL."""
            x = c.query(A.period, {"BeginDate": dt(beg)})
            v = x[0]["BEGINPERIOD"] if x else None
            return v if v is not None else dt(beg)

        def _all_branches(c):
            return [x["ID"] for x in c.query(A.branches)]

        def _abinds(c, b):
            return {"BeginPeriod": _period(c, b.beg), "BeginDate": dt(b.beg), "EndDate": dt(b.end)}

        def _abal(c, b: BaIn):
            if b.currency_on and b.currency is None:
                raise L.BalError("balance.err_valute")
            sql, _ = L.ba_balance_sql(A.balance, b.branches, _all_branches(c), b.currency_on, b.currency, b.balances, b.view, b.plan, with_group=A.with_group)
            return c.query(sql, _abinds(c, b))

        def _aacc(c, b: BaIn):
            sql = L.ba_account_sql(A.account, b.branches, _all_branches(c), b.currency_on, b.currency, b.view, b.plan)
            return c.query(sql, _abinds(c, b))

        def _abalacc(c, b: BaIn, account_id):
            bb = {"BeginDate": dt(b.beg), "EndDate": dt(b.end)}
            return (c.query(A.credbal, {**bb, "Kredits": account_id}),
                    c.query(A.debtbal, {**bb, "debts": account_id}))

        @r.post("/refresh")
        def _arefresh(b: BaIn, ws=Depends(g4)):
            """ActionFullRefreshExecute: BuildBalance; BuildAccount if any; Credbal/DebtbalBuildTransaction if any account."""
            c = ws.conn
            bal = run(_abal, c, b)
            accs = run(_aacc, c, b) if bal else []
            return {"balance": rows_out(bal), "accounts": rows_out(accs)}

        @r.post("/balacc")
        def _aba(b: BaIn, ws=Depends(g4)):
            """credbal_acc / debtbal_acc for the current account (Kredits/debts = ACCOUNTID, NULL -> 0 via AsInteger)."""
            if A.credbal is None:
                err(404, "error.not_found")              # Out_BalanceAnalys has no credbal_acc / debtbal_acc grids
            cr, de = _abalacc(ws.conn, b, b.account_id or 0)
            return {"cred": rows_out(cr), "debt": rows_out(de)}

        def _atr(c, b: BaIn):
            if b.kind in ("debt", "cred") and A.credbal is None:
                raise L.BalError("error.not_found")
            line20 = None
            acc = -1 if b.account_id is None else b.account_id
            if b.kind == "debt":
                line20 = L.ba_debt_line20(acc, b.balans or 0)
            elif b.kind == "cred":
                line20 = L.ba_cred_line20(acc, b.balans or 0)
            sql = L.ba_transaction_sql(A.transaction, b.operator, line20)
            rows = c.query(sql, {"BeginDate": dt(b.beg), "EndDate": dt(b.end), "Title": "ID"})
            return rows if b.kind != "all" else L.ba_transactions_for(rows, b.account_id)

        @r.post("/transactions")
        def _atrp(b: BaIn, ws=Depends(g4)):
            return rows_out(run(_atr, ws.conn, b))

        @r.post("/export.xlsx")
        def _aexp(b: BaIn, ws=Depends(g4)):
            """ActionExcelExportExecute: export of the focused grid."""
            c = ws.conn
            if b.kind == "balance":
                rows = run(_abal, c, b)
                cols = ["BALANCEACCOUNT", "FIRSTACTIVE", "FIRSTPASSIVE", "DTURNOVER", "CTURNOVER", "LASTACTIVE", "LASTPASSIVE"]
            elif b.kind == "account":
                rows = L.ba_accounts_for(run(_aacc, c, b), b.balans) if b.balans is not None else run(_aacc, c, b)
                cols = ["ACCNO", "NAME", "CURRENCYID", "BRANCHID", "BEGINACTIVE", "BEGINPASSIVE", "DTURNOVER", "CTURNOVER", "ENDACTIVE", "ENDPASSIVE"]
            else:
                rows = run(_atr, c, b)
                cols = ["ID", "DAT", "DEBTACC", "DVALNAME", "CREDITACC", "CVALNAME", "AMMOUNT", "AMMOUNT_C", "LAMMOUNT", "NAME", "USERNAME"]
            spec = render_spec({"cols": cols, "rows": rows, "totals": None}, b.labels)
            return file_resp(R.to_xlsx(spec, b.labels.model_dump()), "xlsx", "balance-analysis")
        return r

    routers += [build_today(TB), build_today(OTB), build_analys(BA), build_analys(OBA)]

    # ----------------------------------------------------------------------------------------- AccBalanceCheck
    r = APIRouter(prefix="/api/accbalancecheck")
    g5 = require_module(CLSID_ACCCHECK)
    KEY = "accbalancecheck.status"

    @r.get("/list")
    def _clist(ws=Depends(g5)):
        st = ws.module_state.setdefault(KEY, {})      # FStatusList (TStringList Values) – per form instance
        out = rows_out(ws.conn.query(Q.SQL_ABC_ACCS))
        for x in out:
            x["status"] = st.get(str(x["id"]), "")     # AccsCalcFields
        return out

    def _check(ws, acc_id):
        ok = ws.conn.call_bool("SBCORRECTION", "check_account_balance", [], named={"AccID": acc_id, "ErrorSet": 0})
        ws.module_state.setdefault(KEY, {})[str(acc_id)] = "Ok" if ok else "Error"
        return {"status": "Ok" if ok else "Error"}

    @r.post("/{acc_id}/check")
    def _cchk(acc_id: int, ws=Depends(g5)):
        return _check(ws, acc_id)

    @r.post("/{acc_id}/correct")
    def _ccor(acc_id: int, ws=Depends(g5)):
        """CorrectAccBalanceExecute: SBCORRECTION.correct_account_balance then CheckAccount.Execute."""
        ws.conn.call_proc("SBCORRECTION", "correct_account_balance", [], named={"AccID": acc_id})
        return _check(ws, acc_id)

    routers.append(r)
    return routers
