"""Currency Position - port of Delphi Packages/CurrencyPosition (TFrmCurrencyPosition, CurrencyPosition.dpk; the
production copy - Packages/CurrPos/* is ignored).

Units: CurrencyPositionImpl.pas/.dfm (ActiveForm), DataModCurrPositin.pas/.dfm (CPDataMod), UntMore.pas/.dfm
(TFrmTuning 'Hesabatlar...'), UntChecking.pas/.dfm (TFrmChecking 'Yoxlamalar...'). SQL in cp_sql.py.

Not ported:
  * UntCPReport (TCPReport QuickReport) and TFrmTuning 'Hesabat' / 'Excel-ə at' (InitialReport / To_Excel, OLE
    automation of VALYUTA_MOVQE.xlsx) - reports, on hold by the user (the buttons show the "on hold" notice).
  * UntCapital (TfrmCapital, toolbar 'Kapital') - capital set-up editor, not ported yet (the button says so).

sb_currencyposition (Packages/PACKAGES/SB_CURRENCYPOSITION.sql): Get_CurrencyPosition and DataChecking drop/create
the per-user tables and COMMIT inside; Delphi never commits after them, so every call runs with commit=False.
"""
from __future__ import annotations
import datetime
import os
import re

from fastapi import APIRouter, Depends, Response
from pydantic import BaseModel, Field

from . import cp_sql as Q
from . import dbf_template as DBF
from .customers import row
from .db import DBError
from .delphi import date_only, float_to_str

CLSID = "{E960F06A-6084-4816-8863-DEE6397C9FE7}"     # CurrencyPosition_TLB.pas:46 CLASS_FrmCurrencyPosition
PKG = "sb_currencyposition"                           # DataModCurrPositin.dfm:7-12 OPackage.PackageName
CAP_PKG = "SB_CAPITAL"                                # DataModCurrPositin.dfm:208-214 CAPITAL_PAK
TEMPLATE = "Balansb.dbf"                              # ToolButton5Click :731 ExtractFilePath(Application.ExeName)+'Balansb.dbf'
DEFAULT_FILE = "C:\\Balansb.dbf"                      # CurrencyPositionImpl.dfm:152 Edit1.Text


class ExecIn(BaseModel):
    beg: datetime.date                                # DTPBegin
    end: datetime.date                                # DTPEnd
    plan: int = Field(1, ge=1, le=4)                  # CmbBoxPlan.ItemIndex+1 ('1-ci hesab planı'..'4-cü')


class RefreshIn(BaseModel):
    date: datetime.date | None = None                 # Dates[CmbBoxDate.ItemIndex-1] (None = 'Bütün tarixlər')
    currency: int | None = None                       # Rate[CmbBoxCurrency.ItemIndex-1] (None = 'Bütün valyutalar')


class FileIn(BaseModel):
    filename: str = Field(DEFAULT_FILE, max_length=260)
    active: bool = False                              # CPDataMod.ODSCurrPosition.Active
    capitals: list[str] = Field(default_factory=list)  # InputBox results, one per Dates[] entry


class DateIn(BaseModel):
    date: datetime.date


class TuningIn(BaseModel):
    rowid: str = Field(..., max_length=64)
    values: dict[str, float | str | None]             # modified DBEdit fields (BANK / SVM / CAPITAL)


def user_name(c) -> str:
    """sb_GetUserName :534-538 (GetUserName = USER). Guarded because it is concatenated into the SQL text."""
    u = c.call_func(PKG, "GetUserName", [], str)
    if not re.fullmatch(r"[A-Za-z][A-Za-z0-9_$#]{0,29}", u or ""):
        raise ValueError(f"unexpected user name {u!r}")
    return u


def bank_id(r: dict) -> str:
    """CPDataMod.ODSCurrPositionCalcFields: BANKID := '0' + BANKID."""
    v = r.get("BANKID")
    return "0" + ("" if v is None else str(v))


def positions(c, user: str, where: str | None = None, binds: dict | None = None) -> dict:
    """Do_Open + GetRemainders (where None) or TBRefreshClick DO_OPEN/GETREMAINDERS (where = refresh_where)."""
    if where is None:
        rows = c.query(Q.sql_do_open(user, ""))
        s = c.query(Q.sql_remainders(user, ""))
    else:
        rows = c.query(Q.sql_refresh(user, where), binds)
        s = c.query(Q.sql_refresh_sum(user, where), binds)
    out = [dict(r, BANKID=bank_id(r)) for r in rows]          # raw rows (upper-case keys) with the calc field
    s0 = s[0] if s else {}
    return {"rows": out, "sum_active": s0.get("SUM(ACTIVE)"), "sum_passive": s0.get("SUM(PASSIVE)")}


def api(p: dict) -> dict:
    return dict(p, rows=[row(r) for r in p["rows"]])


def fill_date(c, user: str) -> list[datetime.datetime]:
    """FillDate :458-491 (combo text FormatDateTime('dd/mmm/yyyy') is built by the page)."""
    return [r["PRESENTDATE"] for r in c.query(Q.sql_fill_date(user))]


def get_capital(c, d) -> str:
    """GetCapital :878-893: FloatToStr(CAPITAL_PAK.CallFloatFunction('calculate_capumhes', [date]))."""
    v = c.call_func(CAP_PKG, "calculate_capumhes", [date_only(d)], float)
    return float_to_str(0.0 if v is None else float(v)).replace(".", DBF.DECIMAL_SEPARATOR)


def _sep(s: str) -> str:
    return s.replace(".", DBF.DECIMAL_SEPARATOR)


def fixed2(v) -> str:
    """FloatToStrF(x, ffFixed, 15, 2) / FormatFloat('0.00', x); a NULL variant raises like Delphi."""
    if v is None:
        raise ValueError("Could not convert variant of type (Null) into type (Double)")
    return _sep(f"{float(v):.2f}")


def file_records(c, rows: list[dict], dates: list, capitals: list[str]) -> list[dict]:
    """ToolButton5Click :790-848."""
    out = []
    for r in rows:
        out.append({"BANK_CODE": r["BANKID"], "TARIX": r.get("PRESENTDATE"), "VALUTE": "" if r.get("OFFICAL") is None else str(r["OFFICAL"]),
                    "BALANS": float_to_str(r.get("BALANCE")), "ACTIVES": fixed2(r.get("ACTIVE")),
                    "PASSIVES": fixed2(r.get("PASSIVE")),
                    "POUL": _sep(float_to_str(r.get("RATE"))) if r.get("RATE") is not None else fixed2(None)})
    last = rows[-1]["BANKID"] if rows else ""          # ODSCurrPosition is at EOF -> last record
    for i, d in enumerate(dates):
        fr = c.query(Q.SQL_CP_ODSFILLFILE, {"CurrentDate": date_only(d), "Currency": 1})
        rate = fr[0].get("RATE") if fr else None
        sv = c.query(Q.SQL_CP_ODSSVM)
        svm = sv[0].get("SVM") if sv else None
        cap = capitals[i] if i < len(capitals) else get_capital(c, d)
        out.append({"BANK_CODE": last, "TARIX": d, "VALUTE": "AZM", "BALANS": "9601",
                    "ACTIVES": _sep(f"{(svm or 0.0) * (rate or 0.0):.2f}"),     # AsFloat * AsFloat (NULL -> 0)
                    "PASSIVES": cap, "POUL": "1"})
        out.append({"BANK_CODE": last, "TARIX": d, "VALUTE": "USD", "BALANS": "9601",
                    "ACTIVES": "" if svm is None else _sep(float_to_str(svm)), "PASSIVES": "0.00",
                    "POUL": fixed2(rate)})                                     # FormatFloat('0.00', Field.Value)
    return out


def _template() -> bytes | None:
    from .exchange import template_dir
    try:
        with open(os.path.join(template_dir(), TEMPLATE), "rb") as fh:
            return fh.read()
    except OSError:
        return None


def _file_name(fn: str) -> str:
    base = re.split(r"[\\/]", fn or "")[-1] or TEMPLATE
    return re.sub(r'[\r\n"]', "", base)


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/currencyposition")
    g = require_module(CLSID)

    def uname(c):
        try:
            return user_name(c)
        except ValueError as e:
            err(400, "cp.err_db", msg=str(e))

    @r.get("/init")
    def _init(ws=Depends(g)):
        """ActiveFormCreate :566-580 (+ CPDataMod / FrmChecking create)."""
        c = ws.conn
        c.query(Q.SQL_CP_BANKINFO)                                     # CPDataMod.DataModuleCreate BankInfo.Open
        day = c.call_func(PKG, "GetBankDay", [], datetime.datetime)    # DTPBegin / DTPEnd := sb_GetBankDate
        uname(c)                                                       # TFrmChecking.FormCreate sb_GetUserName
        c.query(Q.SQL_CP_TUNING_BANKINFO)                              # ... FrmTuning.OracleDataSet1 Open/Close (SVM)
        cur = [{"valute": x.get("VALUTE"), "name": x.get("VALU_NAME")} for x in c.query(Q.SQL_CP_ODSCURRENCY)]
        return {"bank_day": day, "currencies": cur, "file": DEFAULT_FILE}

    @r.post("/execute")
    def _exec(b: ExecIn, ws=Depends(g)):
        """ToolButton1Click :596-639 (only while Modified - the page keeps the button disabled otherwise)."""
        c = ws.conn
        c.call_proc(PKG, "Get_CurrencyPosition", [date_only(b.beg), date_only(b.end), b.plan], commit=False)
        u = uname(c)
        out = api(positions(c, u))
        out["dates"] = fill_date(c, u)
        return out

    @r.post("/refresh")
    def _refresh(b: RefreshIn, ws=Depends(g)):
        """TBRefreshClick :641-709 (the page shows 'No  Records  in  DataSet!' itself while ODSDate is closed)."""
        c = ws.conn
        u = uname(c)
        if b.date is None and b.currency is None:
            return api(positions(c, u))
        binds = {}
        if b.date is not None:
            binds["ADate"] = date_only(b.date)
        if b.currency is not None:
            binds["Currency"] = b.currency
        return api(positions(c, u, Q.refresh_where(b.date is not None, b.currency is not None), binds))

    @r.post("/capital")
    def _capital(b: DateIn, ws=Depends(g)):
        """GetCapital - InputBox default (ToolButton5Click :827), CmbBoxDatesChange, ComBoxPresentDatesClick."""
        return {"capital": get_capital(ws.conn, b.date)}

    @r.post("/file/prepare")
    def _file_prepare(ws=Depends(g)):
        """The dates the InputBox loop (ToolButton5Click :803-847) will ask about, with their GetCapital default."""
        c = ws.conn
        u = uname(c)
        ds = fill_date(c, u)
        return {"dates": [{"date": d, "capital": get_capital(c, d)} for d in ds]}

    @r.post("/file")
    def _file(b: FileIn, ws=Depends(g)):
        """ToolButton5Click :718-866. CopyFile failing -> 'File Creation UnSuccesful Terminated!'; any later error ->
        'Creating  File  UnSuccesful Terminated!.'; with ODSCurrPosition closed only the template copy is made."""
        c = ws.conn
        tpl = _template()
        if tpl is None:
            err(400, "cp.err_copy")
        data = tpl
        if b.active:
            try:
                u = user_name(c)
                rows = positions(c, u)["rows"]                  # Close; Do_Open('')
                dates = fill_date(c, u)                          # FillDate
                positions(c, u)                                  # GetRemainders('')
                data = DBF.append(tpl, file_records(c, rows, dates, b.capitals))
            except (DBF.DbfError, ValueError, DBError) as e:
                err(400, "cp.err_file", msg=str(e))
        return Response(data, media_type="application/x-dbf",
                        headers={"Content-Disposition": f'attachment; filename="{_file_name(b.filename)}"'})

    # ------------------------------------------------------------ TFrmChecking ('Yoxlamalar...')
    def checking_rows(c, u):
        return [row(x) for x in c.query(Q.sql_checking(u))]

    @r.post("/checking/create")
    def _chk_create(b: DateIn, ws=Depends(g)):
        """TBCreateClick (UntChecking.pas:134-149): DataChecking(Trunc(Dates[i])); ODSChecking Close/Open."""
        c = ws.conn
        c.call_proc(PKG, "DataChecking", [date_only(b.date)], commit=False)
        return {"rows": checking_rows(c, uname(c))}

    @r.post("/checking/refresh")
    def _chk_refresh(ws=Depends(g)):
        """TBRefreshClick (UntChecking.pas:198-206) while ODSChecking is active: Refresh."""
        c = ws.conn
        return {"rows": checking_rows(c, uname(c))}

    # ------------------------------------------------------------ TFrmTuning ('Hesabatlar...')
    @r.get("/tuning")
    def _tuning(ws=Depends(g)):
        """FormShow (UntMore.pas:233-249): OracleDataSet1.Open."""
        rs = ws.conn.query(Q.SQL_CP_TUNING_BANKINFO)
        return {"row": dict(row(rs[0]), rowid=str(rs[0].get("ROWID"))) if rs else None}

    @r.post("/tuning/save")
    def _tuning_save(b: TuningIn, ws=Depends(g)):
        """SpeedButtonCommitClick (UntMore.pas:538-546): Edit; Post -> DOA ApplyRecord + CommitOnPost."""
        cols = [f for f in Q.TUNING_FIELDS if f in b.values]
        if not cols:
            return {"ok": True}
        binds = {}
        for f in cols:
            v = b.values[f]
            if f in ("SVM", "CAPITAL") and isinstance(v, str):
                try:
                    v = float(v.strip().replace(DBF.DECIMAL_SEPARATOR, ".")) if v.strip() else None
                except ValueError:
                    err(400, "cp.err_float", value=v)
            binds[f] = v
        binds["ROWID_"] = b.rowid
        ws.conn.execute(Q.sql_tuning_update(cols), binds)
        ws.conn.commit()
        return {"ok": True}

    return r
