"""Exchange Manager chunk 4 - the 'Dövriyyə' tab (TabSheet2 / PageControl1, Unit_ExchangeMGR.pas) without its reports:

* Əməliyyatlara baxış (TabSheetTrans): BtnSearchClick :2732 (EXCH_MGR.Get_Turn_Over_Str -> ODSTraffics.SQL, Amountsum with
  SQL[5] := S), ChBoxCurrency/ChBoxExchange (client), BitBtn3 Excel. BtnPrint (QRepTurn) and BitBtn6 (FormRep receipt) = on hold.
* Kurslara baxış (TabSheetRate): BitBtn2Click :2707 (ODSRateTurn :dat = DTP_Dat), BitBtn4 Excel.
* Silinmiş əməliyyatlara baxış (TabSheet3): BitBtn5Click :3357 (Get_Turn_Over_StrDel -> ODSDel_ExProvarch.SQL), BitBtn7 Excel.
* Toplam (TabSheet4): BitBtn9Click :3501 (ODSReporting, sql[15]); BitBtn10 (frxReportToplam) = on hold.
* Reyestr (TabSheet5): BitBtn11Click :814 (ODSReestrReport, SQL[18]); BitBtn13 (FastReport) = on hold.
Read-only: no commit anywhere.
"""
from __future__ import annotations
import datetime
import io

from fastapi import APIRouter, Depends
from fastapi.responses import Response
from pydantic import BaseModel, Field

from . import em_sql as Q
from .db import DBError
from .delphi import date_only
from .exchangemgr import CLSID, PKG, rows

SHEETS = {"search": "Əməliyyatlar", "rates": "Kurslar", "deleted": "Silinmiş Əməliyyatlar"}   # ExportDataset titles


class SearchIn(BaseModel):
    beg: datetime.date                      # DTP_Begin / DateTimePicker1
    end: datetime.date                      # DTP_End / DateTimePicker2
    val_id: int | None = None               # DBLC_Currency / DBLookupComboBox1 KeyValue (Null -> -1)
    status: int = Field(-1, ge=-1, le=2)    # CBox_Status / ComboBox1.ItemIndex (-1 = nothing selected)
    ex_no: int | None = None                # DBLC_Exchange / DBLCBDelete KeyValue (Null -> -1)


class DatIn(BaseModel):
    dat: datetime.date                      # DTP_Dat


class ToplamIn(BaseModel):
    beg: datetime.date                      # DateTimePicker3
    end: datetime.date                      # DateTimePicker4
    val_on: bool = False                    # CheckBox3
    val_id: int | None = None               # DBLookupComboBox3
    val_name: str = Field("", max_length=20)   # DBLookupComboBox3.Text
    ex_on: bool = False                     # CheckBox4
    ex_no: int | None = None                # DBCB_Toplam


class ReestrIn(BaseModel):
    dat: datetime.date                      # DTP_DateReestr
    ex_no: int | None = None                # DBLookupComboBox6
    val_id: int | None = None               # DBLookupComboBox5


def _k(v):
    return -1 if v is None else v


def search(c, b: SearchIn) -> dict:
    beg, end, val_id, exch_no = date_only(b.beg), date_only(b.end), _k(b.val_id), _k(b.ex_no)
    sql = c.call_func(PKG, "Get_Turn_Over_Str", [beg, end, val_id, b.status, exch_no], str)
    traffics = rows(c.query(sql))                                           # ODSTraffics.SQL := query_str
    st = f"and (status={b.status})" if b.status > 0 else ""
    vt = f"and (val_id={val_id})" if val_id > -1 else ""
    et = f" and (ex_id={exch_no})" if exch_no > -1 else ""
    lines = Q.DM_Amountsum.split("\n")
    lines[5] = st + vt + et                                                 # Amountsum.Sql[5] := S
    s = c.query("\n".join(lines), {"dat1": beg, "dat2": end})
    return {"rows": traffics, "sums": list(s[0].values()) if s else [None, None, None]}


def rate_turn(c, b: DatIn) -> dict:
    return {"rows": rows(c.query(Q.DM_ODSRateTurn, {"dat": date_only(b.dat)}))}


def deleted(c, b: SearchIn) -> dict:
    sql = c.call_func(PKG, "Get_Turn_Over_StrDel", [date_only(b.beg), date_only(b.end), _k(b.val_id), b.status, _k(b.ex_no)], str)
    return {"rows": rows(c.query(sql))}                                    # ODSDel_ExProvarch.SQL := query_str


def toplam(c, b: ToplamIn) -> dict:
    """BitBtn9Click: exch_no / val_id are only assigned when CheckBox4 / CheckBox3 are checked (otherwise Delphi uses an
    uninitialised local - the web uses -1, see PARITY unverified). DeltaAmount = ODSReportingCalcFields."""
    exch_no = _k(b.ex_no) if b.ex_on else -1
    val_id = _k(b.val_id) if b.val_on else -1
    lines = Q.DM_ODSReporting.split("\n")
    lines[15] = f"where p.ex_no={int(exch_no)}" if exch_no != -1 else ""
    rs = rows(c.query("\n".join(lines), {"bdat": date_only(b.beg), "edat": date_only(b.end), "val_id": val_id, "val_name": b.val_name}))
    for r in rs:
        r["deltaamount"] = float(r.get("purchaseamount") or 0) - float(r.get("salesamount") or 0)
    return {"rows": rs}


def reestr(c, b: ReestrIn) -> dict:
    if b.ex_no is None and b.val_id is None:
        return {"message": "em.err_choose_vdm_val"}                          # 'Vdm-i və valyutanı seçin!...'
    if b.ex_no is None:
        return {"message": "em.err_choose_vdm"}                              # 'Vdm-i seçin!...'
    if b.val_id is None:
        return {"message": "em.err_choose_currency"}                         # 'Valyutanı seçin!...'
    lines = Q.DM_ODSReestrReport.split("\n")
    lines[18] = "" if b.val_id == -1 else f"and val_id={int(b.val_id)}"
    return {"rows": rows(c.query("\n".join(lines), {"dat": date_only(b.dat), "ex_id": b.ex_no}))}


def xlsx(rs: list[dict], title: str) -> bytes:
    """CMExcelExport1.ExportDataset(ds, title, True, True): every dataset field with a title row on one sheet."""
    from openpyxl import Workbook
    wb = Workbook()
    sh = wb.active
    sh.title = title[:31]
    cols = [k for k in (rs[0].keys() if rs else []) if k != "rowid"]
    sh.append([k.upper() for k in cols])
    for r in rs:
        sh.append([r.get(k) for k in cols])
    bio = io.BytesIO()
    wb.save(bio)
    return bio.getvalue()


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/exchangemgr/turnover")
    g = require_module(CLSID)

    def run(fn):
        try:
            return fn()
        except DBError as e:
            err(400, "em.err_db", msg=e.message)

    @r.get("/lists")
    def _lists(ws=Depends(g)):
        """Lookup sources opened by ActiveFormCreate: ODSAvalute, ODSVDMAll, ODSAvaluteDelete, ODSDeleteVDM, ODSAvaluteToplam,
        ODSToplamVDM, ODSReestrValyuta, ODSReestrVdm."""
        c = ws.conn
        return run(lambda: {k: rows(c.query(getattr(Q, n))) for k, n in (
            ("avalute", "DM_ODSAvalute"), ("vdm_all", "DM_ODSVDMAll"), ("avalute_del", "DM_ODSAvaluteDelete"), ("vdm_del", "DM_ODSDeleteVDM"),
            ("avalute_top", "DM_ODSAvaluteToplam"), ("vdm_top", "DM_ODSToplamVDM"), ("reestr_val", "DM_ODSReestrValyuta"), ("reestr_vdm", "DM_ODSReestrVdm"))})

    @r.post("/search")
    def _search(b: SearchIn, ws=Depends(g)):
        return run(lambda: search(ws.conn, b))

    @r.post("/rates")
    def _rates(b: DatIn, ws=Depends(g)):
        return run(lambda: rate_turn(ws.conn, b))

    @r.post("/deleted")
    def _deleted(b: SearchIn, ws=Depends(g)):
        return run(lambda: deleted(ws.conn, b))

    @r.post("/toplam")
    def _toplam(b: ToplamIn, ws=Depends(g)):
        return run(lambda: toplam(ws.conn, b))

    @r.post("/reestr")
    def _reestr(b: ReestrIn, ws=Depends(g)):
        return run(lambda: reestr(ws.conn, b))

    def _x(kind, rs):
        data = xlsx(rs, SHEETS[kind])
        return Response(data, media_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                        headers={"Content-Disposition": f'attachment; filename="exchangemgr-{kind}.xlsx"'})

    # BitBtn3 / BitBtn4 / BitBtn7: RecordCount = 0 -> 'Heç bir məlumat tapılmadı!...' (checked on the page, which holds the
    # grid's dataset); otherwise the server re-runs the same query and returns the sheet.
    @r.post("/search/xlsx")
    def _sx(b: SearchIn, ws=Depends(g)):
        return run(lambda: _x("search", search(ws.conn, b)["rows"]))

    @r.post("/rates/xlsx")
    def _rx(b: DatIn, ws=Depends(g)):
        return run(lambda: _x("rates", rate_turn(ws.conn, b)["rows"]))

    @r.post("/deleted/xlsx")
    def _dx(b: SearchIn, ws=Depends(g)):
        return run(lambda: _x("deleted", deleted(ws.conn, b)["rows"]))

    return r
