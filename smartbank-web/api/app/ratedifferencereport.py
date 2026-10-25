"""Rate difference report - port of Delphi Packages/RateDifferenceReport (TRateDifferenceReportX,
RateDifferenceReportImpl.pas/.dfm + ReportDataModule.pas/.dfm (TMainDataModule) + UnitMainReport (TQReport, QuickReport);
no other copies). SQL: rdr_sql.py (dfm, verbatim) and REFRESH_SQL below (pas:524-536, verbatim).

ActiveFormCreate :550-563: CheckDataModule; QReport create; FillCurrency (Currency: Valute / Valu_Name, first item
'Bütün valyutalar'), FillOperator (Operators = User$: ID / name, 'Bütün operatorlar'), FillFilial (Filials: ID / name,
'Bütün filiallar'); SetDate :401-406 (BeginDate := SBOP.Get_Date, EndDate := BeginDate); all combos ItemIndex 0.
The Transactions dataset is not opened at create: the grid stays empty until Yeniləmək.
ActionRefreshExecute (F5) :496-548: builds the SQL text with IntToStr of the selected IDs (integers only here),
SQL.Clear/Add, SetVariable BeginDate / EndDate := picker DateTime, Open. :TITLE is a DOA substitution variable
(ReportDataModule.dfm:45-48 Variables.Data type 1, default 'dat'); it survives SQL.Clear.
TransactionViewerTitleClick :570-593: exit when empty or RecordNo; Title := Column.FieldName; DataSet.Refresh - i.e. the
LAST refresh's SQL and bind values are re-run with the new order.
ActionReport (Ctrl+P) -> QReport.Preview: QuickReport print, ON HOLD by the user.
ActionSearch (Alt+F) toggles PanelSearch; EDAT/EDEBETACCOUNT/ECREDITACCOUNT/ELAMMOUNT Change -> Locate(name without 'E',
text, [loCaseInsensitive, loPartialKey]), Exit clears the edit - client side. ActionReportUpdate: Hesabat and Axtarış are
enabled only when the dataset is not empty.
Read-only module: no DML, no commit.
"""
from __future__ import annotations
import datetime

from fastapi import APIRouter, Depends
from pydantic import BaseModel, Field

from . import rdr_sql as Q
from .customers import row
from .delphi import date_only, subst

CLSID = "{8D2E74F4-B8EA-4067-AF79-53EAED0D4834}"     # RateDifferenceReport_TLB.pas CLASS_RateDifferenceReportX
PKG = "SBOP"                                          # ReportDataModule.dfm:117-122 OraclePackage.PackageName
TITLE_DEFAULT = "dat"                                 # ReportDataModule.dfm:45-48 :TITLE initial text
# TransactionViewer Columns FieldNames (RateDifferenceReportImpl.dfm) except RecordNo (TitleClick exits for it)
COLS = ["DAT", "DEBETACCOUNT", "DCURRENCY", "CREDITACCOUNT", "CCURRENCY", "LAMMOUNT"]

# RateDifferenceReportImpl.pas:524-536 SqlStr (verbatim; the three filters are inserted before 'Order by ')
REFRESH_HEAD = ('Select Transactions.*,Debet.acc_no DebetAccount,DebetCurrency.val_name DCurrency, ' +
                'Credit.acc_no CreditAccount,CreditCurrency.val_name CCurrency ' +
                'From ' +
                'Provarch Transactions,Account Debet,Account Credit,Avalute DebetCurrency,Avalute CreditCurrency ' +
                'Where ' +
                '(Transactions.debt = Debet.ID) and (Transactions.kredit = Credit.ID) and ' +
                '(Transactions.ammount = 0 or transactions.ammount_c = 0) and ' +
                '(Transactions.val_acc=DebetCurrency.valute) and  ' +
                '(Transactions.currencyid_c=CreditCurrency.valute) and ' +
                '(Transactions.dat between :BeginDate and :EndDate) ')
REFRESH_TAIL = ('Order by ' +
                ':Title ')


def refresh_sql(currency: int | None, filial: int | None, operator: int | None) -> str:
    """pas:506-536. None = ItemIndex 0 ('Bütün ...')."""
    cf = '' if currency is None else (' and (Transactions.val_acc = ' + str(int(currency)) +
                                      ' or Transactions.currencyID_c = ' + str(int(currency)) + ') ')
    ff = '' if filial is None else (' and (Debet.filial = ' + str(int(filial)) +
                                    ' or Credit.filial = ' + str(int(filial)) + ') ')
    of = '' if operator is None else (' and (Transactions.op_id = ' + str(int(operator)) + ') ')
    return REFRESH_HEAD + cf + ff + of + REFRESH_TAIL


class Refresh(BaseModel):
    beg: datetime.date                                 # BeginDate.DateTime
    end: datetime.date                                 # EndDate.DateTime
    currency: int | None = Field(None, ge=-2**31, le=2**31 - 1)   # RateArray[CBCurrency.ItemIndex-1]
    filial: int | None = Field(None, ge=-2**31, le=2**31 - 1)     # FilialArray[...]
    operator: int | None = Field(None, ge=-2**31, le=2**31 - 1)   # OperatorArray[...]
    title: str | None = Field(None, max_length=30)     # :Title (None = 'dat')


def _title(t):
    return t if t in COLS else TITLE_DEFAULT


def transactions(c, p: Refresh) -> list[dict]:
    sql = subst(refresh_sql(p.currency, p.filial, p.operator), "Title", _title(p.title))
    rows = c.query(sql, {"BeginDate": date_only(p.beg), "EndDate": date_only(p.end)})
    out = []
    for i, r in enumerate(rows, 1):
        x = row(r)
        x["recordno"] = i                              # TransactionsRecordNoGetText: IntToStr(Transactions.RecNo)
        out.append(x)
    return out


def _i(v):
    return None if v is None else int(v)            # FieldByName(..).AsInteger


def _s(v):
    return "" if v is None else str(v)


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/ratedifferencereport")
    g = require_module(CLSID)

    @r.get("/init")
    def _init(ws=Depends(g)):
        c = ws.conn
        cur = [{"id": _i(x.get("VALUTE")), "name": _s(x.get("VALU_NAME"))} for x in c.query(Q.SQL_RDR_CURRENCY)]   # FillCurrency
        ops = [{"id": _i(x.get("ID")), "name": _s(x.get("NAME"))} for x in c.query(Q.SQL_RDR_OPERATORS)]          # FillOperator
        fil = [{"id": _i(x.get("ID")), "name": _s(x.get("NAME"))} for x in c.query(Q.SQL_RDR_FILIALS)]            # FillFilial
        d = c.call_func(PKG, "Get_Date", [], datetime.datetime)                                               # SetDate
        day = date_only(d).date() if d else None
        return {"currencies": cur, "operators": ops, "filials": fil, "date": day.isoformat() if day else None, "title": TITLE_DEFAULT}

    @r.post("/refresh")
    def _refresh(p: Refresh, ws=Depends(g)):
        return {"title": _title(p.title), "rows": transactions(ws.conn, p)}

    return r
