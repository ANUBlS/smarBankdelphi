"""Deposits manager - port of Delphi NewDepositsManager (DMWorldNew.groupproj, OCX NewDepositsManager.ocx).

Main form: NewDepositsManager/NewDepositsManager/NewDepositsManagerForm.pas (TNewDepositsManagerImpl, CLSID below)
Data module: NewDepositDataModule.pas/.dfm (TNewDepsitDataModule). SQL verbatim in dep_sql.py.
The menu items open 20 separate BPLs (NewDeposits*.bpl, Sb_General.bpl) through LoadPlugin (NewCommonDeclsImpl.pas:31-41).
This step ports the main form: list, Filter panel (TDataSet.Filter), Axtarış Paneli (SearchRecord, in the browser),
title-click sort (:OrderField), Excel export, Bağlamaq (CloseDeposit), Hesablamanı dayandırmaq / davam etdirmək,
Yeniləmək and the advanced-access checks done before a plugin is loaded. The plugin forms are listed in PLUGINS and
answer 'not migrated yet' (see docs/PARITY_DEPOSITS.md).
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

CLSID = "{9ABE87C4-2DB3-41CE-BF01-6B6EED2677C5}"        # NewDepositsManager_TLB.pas:55 CLASS_NewDepositsManagerImpl
PKG = "dm_stored_programs"                               # NewDepositDataModule.dfm:155-162 (ParameterMode = pmNamed)

# MainGrid.Columns (NewDepositsManagerForm.dfm MainGrid) - the only values accepted for :OrderField
GRID = ["ID", "CONTRACTNO", "CUSTOMERID", "CUSTOMERNAME", "OPENDATE", "CLOSEDATE", "PROLONGATIONDATE", "STOPCALCDATE",
        "VAL_NAME", "AMOUNT", "INTEREST", "FACTICALDEBT", "FACTICALINTERESTDEBT", "OSTAT", "AGENTID", "FILIAL"]
DEFAULT_ORDER = "cont.id"                                # DataModuleCreate: SetVariable('OrderField','cont.id')

# DmDataSet persistent TFields in definition order (dfm:274-380): (field, DisplayLabel or None, Visible, kind)
FIELDS = [("ID", "DepozitinİD-si", False, "f"), ("CONTRACTNO", "Müqavilənin №", True, "s"), ("VAL_NAME", "$", True, "s"),
          ("CUSTOMERNAME", "Müştərinin adı", True, "s"), ("OPENDATE", "Açılma tarixi", True, "d"),
          ("CLOSEDATE", "Bağlanma tarixi", True, "d"), ("AMOUNT", "Məbləğ", True, "f"), ("INTEREST", "İllik %", True, "f"),
          ("FACTICALDEBT", "Cari Məbləğ", True, "f"), ("FACTICALINTERESTDEBT", "Cari Məbləğ üzrə %", True, "f"),
          ("OSTAT", "Cari hesabın qalığı", True, "f"), ("CURRENCY", None, False, "f"), ("PERSONALTYPE", None, False, "f"),
          ("CLIENTTYPE", None, False, "f"), ("BRANCHID", None, False, "f"), ("CONTRACTTYPE", "Depozitin tipi", False, "i"),
          ("CUSTOMERID", "Depozit Müştəri id-si", True, "f"), ("USID", None, False, "f"),
          ("PROLONGATIONDATE", "Uzadılma tarixi", True, "d"), ("STOPCALCDATE", "Dayandırılma tarixi", True, "d"),
          ("CONTRACTTYPENAME", "Depozitin tipi", True, "s"), ("USERNAME", "İstifadəçinin adı", True, "s"),
          ("FILIAL", None, True, "s"), ("AGENTID", "Cəlb edənin İD-si", True, "f")]
FIELD_NAMES = {f for f, *_ in FIELDS}

# Menu item -> (advanced right checked first or None, BPL, exportproc parameter). NewDepositsManagerForm.pas handlers.
PLUGINS = {
    "contract_insert": (None, "NewDepositsContract.bpl", "InsertContract"),                # N16Click :808 / ToolButton1
    "contract_edit": ("DM_CONTRACTUPDATE", "NewDepositsContract.bpl", "EditContract"),     # N17Click :813 / ToolButton3
    "contract_look": ("DM_CONTRACTLOOK", "NewDepositsContract.bpl", "LookContract"),       # MainGridDblClick :537
    "apply_money": (None, "NewDepositsApplyMoney.bpl", ""),                               # N23Click :876 (miDeposit too)
    "extract_money": (None, "NewDepositsExtractMoney.bpl", ""),                           # miWithdrawClick :578, N25Click :881
    "capitalize": (None, "NewDepositsCapitalize.bpl", ""),                                 # miCapitalizationClick :567
    "untimely": ("REPAYMENT", "NewDepositsUntimelyEtMoney.bpl", ""),                      # miUntimelyWithdrawClick :572
    "percent_converting": (None, "NewDepositsPercentConverting.bpl", ""),                 # N12Click :803, N27Click :886
    "prolongation": (None, "NewDepositsProlongation.bpl", ""),                            # N9Click :949 (+ DmDataSet.Refresh)
    "shedule": (None, "NewDepositsShedule.bpl", ""),                                      # N36Click :924
    "wreport": (None, "NewDepositsWReport.bpl", ""),                                      # N21Click :871 Müqavilə çapı
    "filter": (None, "NewDepositsFilter.bpl", ""),                                        # N10Click :793 Filter Paneli
    "statement": (None, "Sb_General.bpl", "depozit_stetment"),                            # AccountLookClick :583 (LoadPlugin3)
    "sett_cccgroups": ("DM_ADMIN", "NewDepositsSettings.bpl", "showcccgroups"),           # N2Click :909
    "sett_categories": ("DM_ADMIN", "NewDepositsSettings.bpl", "showcategories"),         # N3Click :929
    "sett_deposittypes": ("DM_ADMIN", "NewDepositsSettings.bpl", "showdeposittypes"),     # N4Click :934
    "sett_accountturning": ("DM_ADMIN", "NewDepositsSettings.bpl", "showaccountturning"),  # N5Click :939
    "sett_wrsetup": ("DM_ADMIN", "NewDepositsWRSetup.bpl", "showSBWRBookmarkSetup"),      # FayllarBukmarklar1Click :332
    "sett_wrgroups": ("DM_ADMIN", "NewDepositsWRGroups.bpl", ""),                         # iplr1Click :352
    "sett_percent": ("DM_ADMIN", "NewDepositsPercentSettings.bpl", ""),                   # N7Click :944
    "sett_balance": ("DM_ADMIN", "NewDepositsBalanceSettings.bpl", ""),                   # N11Click :798
    "rep_mis": (None, "NewDepositsReport.bpl", ""),                                       # N32Click :914 Mis Hesabatı
    "rep_control": (None, "NewDepositsControl.bpl", ""),                                  # Kontrol1Click :778
    "rep_logs": (None, "NewDepositsLogs.bpl", ""),                                        # Loqlar1Click :532
}
# Plugin keys whose BPL form is ported: the browser opens the web form, which runs the same right check itself.
MIGRATED = {"contract_insert", "contract_edit", "contract_look"}
# DM_ADMIN: ToolButton9MouseActivate :1094 checks it when the Sazlamalar button is pressed (before its drop-down opens).
DATE_SEPARATOR = "."   # FormatDateTime('dd/MM/yyyy'): '/' = Windows DateSeparator (az-AZ '.', unverified on the bank PCs)


class DepError(Exception):
    def __init__(self, key, **kw):
        self.key, self.kw = key, kw


class FilterIn(BaseModel):
    """FilterPanel state (CheckBox + lookup KeyValue per GroupBox)."""
    cb_currency: bool = False
    currency: int = 0
    cb_filial: bool = False
    filial: int = 0
    cb_contracttype: bool = False
    contracttype: int = 0
    cb_persons: bool = False          # GroupBox2 'Müştərilərin kateq' -> field clienttype (dm_categories)
    category: int = 0
    cb_clienttype: bool = False       # GroupBox3 'Müştərilərin mənsubiyyəti' -> field personaltype (dm_persons)
    person: int = 0
    cb_status: bool = False
    status_index: int = Field(0, ge=-1, le=1)
    cb_opendat: bool = False
    d1: datetime.date | None = None
    d2: datetime.date | None = None


class ListIn(BaseModel):
    order: str | None = None          # None = DataModuleCreate order 'cont.id'
    desc: bool = False
    filtered: bool = False            # False until ActnFilterExecute first ran (Filtered := True)
    filter: FilterIn = FilterIn()


def build_filter_string(f: FilterIn) -> str:
    """BuildFilterString :611-673, literally."""
    res = ""

    def concat(prefix, checked, key):
        nonlocal res
        if checked:
            tmp = "(%s=%s)" % (prefix, key)                       # csFormat = '(%s=%s)', op = ' and '
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


def order_text(order: str | None, desc: bool) -> str:
    """MainGridTitleClick :543-564: FieldName + ' DESC' (MarkerIndex = 2) or ' ASC'."""
    if not order:
        return DEFAULT_ORDER
    o = order.upper()
    if o not in GRID:
        raise DepError("error.generic")
    return o + (" DESC" if desc else " ASC")


def query_rows(conn, b: ListIn):
    rows = conn.query(subst(Q.SQL_DMDATASET, "OrderField", order_text(b.order, b.desc)))
    expr = build_filter_string(b.filter) if b.filtered else ""
    if expr:
        try:
            rows = TF.apply(rows, expr, FIELD_NAMES)
        except TF.FilterError as e:
            raise DepError("deposits.err_filter", ora=str(e), filter=expr)
    return rows, expr


def init_data(conn):
    """ActiveFormCreate :690-707 + DataModuleCreate + PrepareFilter :676-688 (KeyValue := first record, 0 if empty)."""
    lk = {"valutes": conn.query(Q.SQL_VALUTES), "filials": conn.query(Q.SQL_FILIALS), "types": conn.query(Q.SQL_DM_TYPES),
          "categories": conn.query(Q.SQL_DM_CATEGORIES), "persons": conn.query(Q.SQL_DM_PERSONS)}
    first = lambda k, f: int(lk[k][0][f] or 0) if lk[k] else 0  # noqa: E731 - AsInteger of an empty dataset = 0
    bd = conn.query(Q.SQL_BANKDATE)
    fil = conn.query(Q.SQL_FILIALID)
    bank_date = bd[0]["TEK_DAT"].date().isoformat() if bd and bd[0]["TEK_DAT"] else None
    return {"lookups": {k: [row(x) for x in v] for k, v in lk.items()},
            "defaults": {"currency": first("valutes", "VALUTE"), "filial": first("filials", "ID"), "contracttype": first("types", "ID"),
                         "category": first("categories", "ID"), "person": first("persons", "ID"), "status_index": 0,
                         "d1": bank_date, "d2": bank_date},
            "bank_date": bank_date, "filial_id": int(fil[0]["KOD_FIL"]) if fil else None,
            "grid": GRID, "plugins": {k: {"right": v[0], "bpl": v[1], "param": v[2]} for k, v in PLUGINS.items()}}


def export_xlsx(rows) -> bytes:
    """BitBtnexpClick :600-609: EExport.ExportDataset(DataSet, 'Depozitlər', True, False) - CMExcelExport (Packages/VCL)
    ExportTitles :606-689: every Visible TField (VisibleFieldsOnly default True) in field order, title = DisplayName;
    WideString columns NumberFormat '@', integer fields '000000'."""
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


def close_deposit(conn, contract_id: int):
    """N18Click :819-848: dm_stored_programs.CloseDeposit(ContractID => current ID) then Refresh. The SelectedRows loop is
    commented out, so only the current record is closed even when several rows are selected. No Commit (DOA package call)."""
    conn.call_proc(PKG, "CloseDeposit", [], named={"ContractID": int(contract_id)}, commit=False)


def calc_enabled(conn, contract_id: int) -> bool:
    """N19Click :855-856: CallBooleanFunction('IsCalculationEnabled',['ContractID',Get_SelectedContID])."""
    return conn.call_bool(PKG, "IsCalculationEnabled", [], named={"ContractID": int(contract_id)})


def toggle_calc(conn, contract_id: int, was_enabled: bool):
    """N19Click :861-868: the value read before the confirmation decides Disable/EnableCalculation. No Commit."""
    conn.call_proc(PKG, "DisableCalculation" if was_enabled else "EnableCalculation", [],
                   named={"ContractID": int(contract_id)}, commit=False)


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
        """Right check of the handler, then LoadPlugin. The BPL forms are not ported yet: 'not migrated' answer."""
        if key not in PLUGINS:
            err(404, "error.generic")
        right, bpl, param = PLUGINS[key]
        if right:
            check_right(ws.conn, right)
        return {"ok": key in MIGRATED, "migrated": key in MIGRATED, "bpl": bpl, "param": param}

    @r.post("/settings-menu")
    def _settings(ws=Depends(g)):
        check_right(ws.conn, "DM_ADMIN")                  # ToolButton9MouseActivate :1094-1099
        return {"ok": True}

    @r.post("/{contract_id}/close")
    def _close(contract_id: int, ws=Depends(g)):
        close_deposit(ws.conn, contract_id)
        return {"ok": True, "pending": True}

    @r.get("/{contract_id}/calc")
    def _calc(contract_id: int, ws=Depends(g)):
        return {"enabled": calc_enabled(ws.conn, contract_id)}

    @r.post("/{contract_id}/calc")
    def _calc_toggle(contract_id: int, body: dict, ws=Depends(g)):
        toggle_calc(ws.conn, contract_id, bool(body.get("enabled")))
        return {"ok": True, "pending": True}

    return r
