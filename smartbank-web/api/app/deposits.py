"""Deposits manager - port of the production Delphi module DepositsManager_New (SBWorld_Tale.groupproj,
Packages/DepositsManager_New/DepositsManagernew.dproj, ActiveX DepositsManagernew.ocx).

Main form: DepositsManagerImpl_new.pas/.dfm (TDepositsManager_new, CLSID below).
Data module: DMDepositManagerImpl_new.pas/.dfm (TDMDepositsManager_new). SQL verbatim in dep_sql.py.
The menu items open the SBDM_*_new.bpl plugins through LoadPlugin (Packages/SBDM_Common_new/CommonDeclsImpl_new.pas:30-40),
most of them after sb_aca.checkadvancedobjectaccess. This module ports the main form: list, FilterPanel (TDataSet.Filter),
Axtarış Paneli (SearchRecord, in the browser), Excel export, Bağlamaq (CloseDeposit over SelectedRows), Hesablamanı
dayandırmaq / davam etdirmək and Yeniləmək. The plugin forms are listed in PLUGINS (see docs/PARITY_DEPOSITS.md).
"""
from __future__ import annotations
import datetime
import io

from fastapi import APIRouter, Depends
from fastapi.responses import Response
from pydantic import BaseModel, Field

from . import dep_sql as Q
from . import tdataset_filter as TF
from .customers import row
from .db import DBError
from .delphi import subst

CLSID = "{FC4F6C2E-FDCA-40AF-AE35-8F57F648EE56}"        # DepositsManager_New_TLB.pas:52 CLASS_DepositsManager_new
PKG = "sbcm_stored_programs_new"                         # DMDepositManagerImpl_new.dfm:160-166 Stored_Programs (pmNamed)

# MainGrid.Columns (DepositsManagerImpl_new.dfm:855-1113). The grid has dgTitleButtons but no OnTitleClick handler and
# :OrderField is only set in DataModuleCreate (DMDepositManagerImpl_new.pas:91), so the order is always 'cont.id'.
GRID = ["CONTRACTNO", "CONTRACTACCNO", "VAL_NAME", "CUSTOMERNAME", "OPENDATE", "CLOSEDATE", "AMOUNT", "INTEREST",
        "FACTICALDEBT", "FACTICALINTERESTDEBT", "STOPCALCULATIONDATE"]
ORDER = "cont.id"

# DepositsData persistent TFields in definition order (DMDepositManagerImpl_new.dfm:322-435): (field, DisplayLabel, Visible, kind)
FIELDS = [("ID", None, False, "f"), ("CONTRACTNO", "Müqavilənin №", True, "s"), ("CONTRACTACCNO", "Hesabın №", True, "s"),
          ("VAL_NAME", "$", True, "s"), ("CUSTOMERNAME", "Müştərinin adı", True, "s"), ("INTERESTACCNO", "Faiz Hesabın №", True, "s"),
          ("OPENDATE", "Açılma tarixi", True, "d"), ("CLOSEDATE", "Bağlanma tarixi", True, "d"), ("AMOUNT", "Məbləğ", True, "f"),
          ("EKAMOUNT", "Ekvivalent", True, "f"), ("INTEREST", "Faiz", True, "s"), ("FACTICALDEBT", "Cari Məbləğ", True, "f"),
          ("EKFACTICALDEBT", "Ekvivalent", True, "f"), ("FACTICALINTERESTDEBT", "Cari Məbləğ üzrə %", True, "f"),
          ("EKFACTICALINTERESTDEBT", "Ekvivalent", True, "f"), ("STOPCALCULATIONDATE", "Son Kapital/Ödəmə tarixi", True, "d"),
          ("CURRENCY", None, False, "f"), ("PERSONALTYPE", None, False, "f"), ("CLIENTTYPE", None, False, "f"),
          ("BRANCHID", None, False, "f"), ("CONTRACTTYPE", None, False, "i"), ("STATUS", None, False, "f"),
          ("CUSTOMERID", None, False, "f"), ("USID", None, False, "f")]
FIELD_NAMES = {f for f, *_ in FIELDS}

# Menu item -> (advanced right checked first or None, BPL, exportproc parameter). DepositsManagerImpl_new.pas handlers.
PLUGINS = {
    "contract_insert": ("NEW_SBCM_CONTRACT", "SBDM_Contract_new.bpl", "InsertContract"),        # ToolButton1Click :1001, N16
    "contract_edit": ("EDIT_SBCM_CONTRACT", "SBDM_Contract_new.bpl", "EditContract"),            # ToolButton3Click :1012, N17
    "apply_money": ("NEW_SBCM_TRANSH", "SBDM_ApplyMoney_new.bpl", ""),                           # miDepositClick :701, N23
    "extract_money": ("NEW_SBCM_PEYMENT", "SBDM_ExtractMoney_new.bpl", ""),                       # miWithdrawClick :719, N25
    "partial_payment": ("NEW_SBCM_PARTIAL_PEYMENT", "SBDM_PartialPayment_new.bpl", ""),          # N15Click :757
    "capitalize": ("NEW_SBCM_CAPITALIZATION", "SBDM_Capitalize_new.bpl", ""),                    # miCapitalizationClick :692, N24
    "untimely": ("NEW_SBCM_UNTIMELY", "SBDM_UntimelyEtMoney_new.bpl", ""),                       # miUntimelyWithdrawClick :710, N26
    "percent_converting": ("NEW_SBCM_CALC_PERCENT", "SBDM_PercentConverting_new.bpl", ""),       # N12Click :743, N27
    "prolongation": ("NEW_SBCM_PROLONGATION", "SBDM_Prolongation_new.bpl", ""),                 # N9Click :856, N8
    "shedule": (None, "Sbdm_Shedule_new.bpl", ""),                                               # N36Click :851 (N14Click :752 invisible)
    "filter": (None, "SBDM_Filter_new.bpl", ""),                                                 # N10Click :738 'Filter Paneli'
    "rep_contract_ops": ("SBCM_PRINT_APPLYMONEY", "SBDM_ContractReport_new.bpl", ""),            # N20Click :833 (on hold)
    "wreport": ("SBCM_PRINT_CONTRACT1", "SBDM_WReport_new.bpl", ""),                             # N21Click :842 (on hold)
    "sett_refer": (None, "SBDM_Settings_new.bpl", "showrefer"),                                  # N1Click :828 (N1 invisible)
    "sett_cccgroups": ("SBCM_ACCOUNT_GROUP", "SBDM_Settings_new.bpl", "showcccgroups"),          # N2Click :1052
    "sett_categories": ("SBCM_CUSTOMERS_TYPE", "SBDM_Settings_new.bpl", "showcategories"),       # N3Click :1095
    "sett_deposittypes": ("SBCM_DEPOSIT_TYPE", "SBDM_Settings_new.bpl", "showdeposittypes"),      # N4Click :1105
    "sett_accountturning": ("SBCM_LOSS_INCOME_ADJUSTMENT_ACC", "SBDM_Settings_new.bpl", "showaccountturning"),  # N5Click :1115
    "sett_wrsetup": ("SBCM_PRINT_CONTRACT", "SBDM_WRSetup_new.bpl", "showSBWRBookmarkSetup"),   # N6Click :1125
    "sett_percent": ("SBCM_PERCENT_SETTING", "SBDM_PercentSettings_new.bpl", ""),               # N7Click :1135
    "sett_accounts": (None, "SBDM_DepozitAccSettings_new.bpl", ""),                             # Hesablarin1Click :462 (invisible)
    "rep_period": ("SBCM_PERIOD_REPORT", "SBDM_PeriodReport_new.bpl", ""),                      # N31Click :1062 (on hold)
    "rep_mis": ("SBCM_MIS_REPORT", "SBDM_Report_new.bpl", ""),                                  # N32Click :1072 (on hold)
    "rep_balance": ("SBCM_OF_BALANCE_REPORT", "SBDM_ReportofBalance_new.bpl", ""),              # N33Click :1081 (on hold)
}
# The deposit contract prints and the deposit reports are on hold by the user: never ported.
ON_HOLD = {"sett_wrsetup", "rep_contract_ops", "wreport", "rep_period", "rep_mis", "rep_balance"}
# Plugin keys whose BPL form is ported: the browser opens the web form after this right check.
MIGRATED: set = {"contract_insert", "contract_edit", "apply_money", "extract_money", "prolongation", "shedule", "untimely"}
DATE_SEPARATOR = "."   # FormatDateTime('dd/MM/yyyy'): '/' = Windows DateSeparator (az-AZ '.', unverified on the bank PCs)
NO_DEPOSIT = "Heç bir Depozit seçilməyib!"               # Get_SelectedContID (CommonDeclsImpl_new.pas:47-52)


class DepError(Exception):
    def __init__(self, key, **kw):
        self.key, self.kw = key, kw


class FilterIn(BaseModel):
    """FilterPanel state (CheckBox + lookup KeyValue per GroupBox), DepositsManagerImpl_new.dfm:19-414."""
    cb_currency: bool = False
    currency: int = 0
    cb_filial: bool = False
    filial: int = 0
    cb_contracttype: bool = False
    contracttype: int = 0
    cb_persons: bool = False          # GroupBox2 'Müştərilərin kateq' (sbcm_categories_new) -> field clienttype
    category: int = 0
    cb_clienttype: bool = False       # GroupBox3 'Müştərilərin mənsubiyyəti' (sbcm_persons_new) -> field personaltype
    person: int = 0
    cb_status: bool = False
    status_index: int = Field(0, ge=-1, le=1)
    cb_opendat: bool = False
    d1: datetime.date | None = None
    d2: datetime.date | None = None


class ListIn(BaseModel):
    filtered: bool = False            # False until ActnFilterExecute first ran (Filtered := True)
    filter: FilterIn = FilterIn()


def build_filter_string(f: FilterIn) -> str:
    """BuildFilterString DepositsManagerImpl_new.pas:488-550, literally (ConcatFilter check=true -> ' and ')."""
    res = ""

    def concat(prefix, checked, key):
        nonlocal res
        if checked:
            tmp = "(%s=%s)" % (prefix, key)                       # csFormat = '(%s=%s)'
            res = tmp if res == "" else res + " and " + tmp
    concat("CURRENCY", f.cb_currency, f.currency)
    concat("branchid", f.cb_filial, f.filial)
    concat("contracttype", f.cb_contracttype, f.contracttype)
    concat("clienttype", f.cb_persons, f.category)
    concat("personaltype", f.cb_clienttype, f.person)
    fstatus = fopendat = ""
    if f.cb_status:
        fstatus = {0: "(status = 1)", 1: "(Status = 0)"}.get(f.status_index, "")
    if f.cb_opendat:
        d1, d2 = f.d1 or datetime.date.today(), f.d2 or datetime.date.today()
        fmt = lambda d: d.strftime("%d" + DATE_SEPARATOR + "%m" + DATE_SEPARATOR + "%Y")  # noqa: E731
        fopendat = "((" + " opendate >=  '" + fmt(d1) + "'" + ") and (" + " opendate <=  '" + fmt(d2) + "'" + "))"
    for p in (fstatus, fopendat):                                     # ConcatFilter1
        if res != "" and p != "":
            res = res + " and " + p
        if res == "" and p != "":
            res = p
    return res


def query_rows(conn, b: ListIn):
    rows = conn.query(subst(Q.SQL_DEPOSITSDATA, "OrderField", ORDER))
    expr = build_filter_string(b.filter) if b.filtered else ""
    if expr:
        try:
            rows = TF.apply(rows, expr, FIELD_NAMES)
        except TF.FilterError as e:
            raise DepError("deposits.err_filter", ora=str(e), filter=expr)
    return rows, expr


def init_data(conn):
    """ActiveFormCreate :566-583 + DataModuleCreate (DM.pas:87-102) + PrepareFilter :552-564 (KeyValue := first record)."""
    lk = {"valutes": conn.query(Q.SQL_VALUTES), "filials": conn.query(Q.SQL_FILIALS), "types": conn.query(Q.SQL_DEPOSITTYPES),
          "categories": conn.query(Q.SQL_CATEGORIES), "persons": conn.query(Q.SQL_PERSONS)}
    conn.query(Q.SQL_USERS)                                   # users.Open (its combo LCBUsers is commented out)
    first = lambda k, f: int(lk[k][0][f] or 0) if lk[k] else 0  # noqa: E731 - AsInteger of an empty dataset = 0
    bd = conn.query(Q.SQL_BANKDATE)
    fil = conn.query(Q.SQL_FILIALID)
    bank_date = bd[0]["TEK_DAT"].date().isoformat() if bd and bd[0]["TEK_DAT"] else None
    return {"lookups": {k: [row(x) for x in v] for k, v in lk.items()},
            "defaults": {"currency": first("valutes", "VALUTE"), "filial": first("filials", "ID"), "contracttype": first("types", "ID"),
                         "category": first("categories", "ID"), "person": first("persons", "ID"), "status_index": 0,
                         "d1": bank_date, "d2": bank_date},
            "bank_date": bank_date, "filial_id": int(fil[0]["KOD_FIL"]) if fil else None,
            "grid": GRID, "plugins": {k: {"right": v[0], "bpl": v[1], "param": v[2], "on_hold": k in ON_HOLD} for k, v in PLUGINS.items()}}


def export_xlsx(rows) -> bytes:
    """BitBtnexpClick :477-486: DataSet.Last, then EExport.ExportDataset(DataSet, 'Depozitlər', True) - CMExcelExport
    (Packages/VCL): every Visible TField in field order, title = DisplayName; WideString columns NumberFormat '@'."""
    from openpyxl import Workbook
    from openpyxl.utils import get_column_letter
    wb = Workbook()
    ws = wb.active
    ws.title = "Depozitlər"        # Delphi: SheetName + IntToStr(i), i an uninitialised local (see PARITY)
    cols = [(f, lab or f, k) for f, lab, vis, k in FIELDS if vis]
    for j, (f, lab, k) in enumerate(cols, 1):
        ws.cell(row=1, column=j, value=lab)
    for i, r in enumerate(rows, 2):
        for j, (f, lab, k) in enumerate(cols, 1):
            v = r.get(f)
            if isinstance(v, datetime.datetime):
                v = v.replace(tzinfo=None)
            c = ws.cell(row=i, column=j, value=v)
            if k == "s":
                c.number_format = "@"
            elif k == "i":
                c.number_format = "000000"
            elif k == "d":
                c.number_format = "dd.mm.yyyy"
    for j in range(1, len(cols) + 1):
        ws.column_dimensions[get_column_letter(j)].width = 16
    buf = io.BytesIO()
    wb.save(buf)
    return buf.getvalue()


def check_right(conn, code: str):
    """sb_aca.CallProcedure('checkadvancedobjectaccess',[code]) - raises the ORA error when denied."""
    conn.call_proc("sb_aca", "checkadvancedobjectaccess", [code], commit=False)


def close_deposits(conn, ids: list[int]):
    """N18Click :767-800: CloseDeposit(ContractID) for every SelectedRows bookmark, in selection order, then Refresh.
    No Commit (DOA package call); an error stops the loop (no try/except), the earlier calls stay in the transaction."""
    for cid in ids:
        conn.call_proc(PKG, "CloseDeposit", [], named={"ContractID": int(cid)}, commit=False)


def calc_enabled(conn, contract_id: int) -> bool:
    """N19Click :810-811: CallBooleanFunction('IsCalculationEnabled',['ContractID',get_SelectedContID])."""
    return conn.call_bool(PKG, "IsCalculationEnabled", [], named={"ContractID": int(contract_id)})


def toggle_calc(conn, contract_id: int, was_enabled: bool):
    """N19Click :816-823: the value read before the confirmation decides Disable/EnableCalculation. No Commit, no Refresh."""
    conn.call_proc(PKG, "DisableCalculation" if was_enabled else "EnableCalculation", [],
                   named={"ContractID": int(contract_id)}, commit=False)


class CloseIn(BaseModel):
    ids: list[int] = Field(default_factory=list, max_length=10000)   # MainGrid.SelectedRows (bookmarks)


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/deposits")
    g = require_module(CLSID)

    def run(fn, *a):
        try:
            return fn(*a)
        except DepError as e:
            err(400, e.key, **e.kw)

    @r.get("/init")
    def _init(ws=Depends(g)):
        return init_data(ws.conn)

    @r.post("/list")
    def _list(b: ListIn, ws=Depends(g)):
        rows, expr = run(query_rows, ws.conn, b)
        return {"rows": [dict(row(x), rowid=x.get("ROWID")) for x in rows], "filter": expr}

    @r.post("/export.xlsx")
    def _xlsx(b: ListIn, ws=Depends(g)):
        rows, _ = run(query_rows, ws.conn, b)
        return Response(export_xlsx(rows), media_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                        headers={"Content-Disposition": 'attachment; filename="Depozitler.xlsx"'})

    @r.post("/plugin/{key}")
    def _plugin(key: str, ws=Depends(g)):
        """Right check of the handler, then LoadPlugin. Not ported plugins answer 'not migrated' / 'on hold'."""
        if key not in PLUGINS:
            err(404, "error.generic")
        right, bpl, param = PLUGINS[key]
        if right:
            check_right(ws.conn, right)
        return {"ok": key in MIGRATED, "migrated": key in MIGRATED, "on_hold": key in ON_HOLD, "bpl": bpl, "param": param}

    @r.post("/close")
    def _close(b: CloseIn, ws=Depends(g)):
        check_right(ws.conn, "SBCM_CLOSE_CONTRACT")         # N18Click :772-775, before the confirmation (UI asks first: /right)
        close_deposits(ws.conn, b.ids)
        return {"ok": True, "pending": bool(b.ids), "closed": len(b.ids)}

    @r.post("/right/{code}")
    def _right(code: str, ws=Depends(g)):
        """Handler right checks that Delphi runs before a confirmation dialog (N18Click, N19Click)."""
        if code not in ("SBCM_CLOSE_CONTRACT", "SBCM_STOP_START_CALCPERCENT"):
            err(404, "error.generic")
        check_right(ws.conn, code)
        return {"ok": True}

    @r.get("/{contract_id}/calc")
    def _calc(contract_id: int, ws=Depends(g)):
        check_right(ws.conn, "SBCM_STOP_START_CALCPERCENT")  # N19Click :807-809
        return {"enabled": calc_enabled(ws.conn, contract_id)}

    @r.post("/{contract_id}/calc")
    def _calc_toggle(contract_id: int, body: dict, ws=Depends(g)):
        check_right(ws.conn, "SBCM_STOP_START_CALCPERCENT")
        toggle_calc(ws.conn, contract_id, bool(body.get("enabled")))
        return {"ok": True, "pending": True}

    return r
