"""Exchange Manager (V.D.M. – valyuta dəyişmə məntəqələri) - port of Delphi Packages/ExchangeMGR-NBC (TExchangeMGR_X,
ExchangeMGR.dpr; the production copy confirmed by the user 2026-10-20 - ExchangeMGR-Turan / ExchangeMGR_IBAN are
ignored).

Chunk 1 (this file): ActiveFormCreate (Unit_ExchangeMGR.pas:2146-2354) and the read side of the main form's tabs -
'Valyuta D. M.' (GridMaster on ODSExchOffice), the master-detail sets of the current office ('Əməliyyatlar'
ODSExchProvarch + ODSSumTrans, 'Resurslar' ODSResurs, 'V.D.M-də Qalıqlar' ODSExRemainder), 'Məzənnələr' (ODSExchRate),
'Filiallar üzrə məzənnələr' (ODSRatesFilial). The operation forms (UnitPurchase / UnitSelling / UnitExchange ...),
the set-up forms and the remaining tabs follow in later chunks (PARITY_EXCHANGEMGR.md lists the status per unit).

Packages: EXCH_MGR (OPExchMgr / OPTrans), EXCH_TRANS, EX_ADM, SB_ACA, SBOP (UnitDateExch.dfm). The EXCH_MGR source is
not in the repo, so the commit behaviour of its procedures is unknown; Delphi never commits after them, so the calls
run with commit=False.
"""
from __future__ import annotations
import datetime

from fastapi import APIRouter, Depends
from pydantic import BaseModel, Field

from . import em_sql as Q
from .customers import row
from .db import DBError
from .delphi import date_only

CLSID = "{F5E99666-E5B9-4579-B7ED-D83CC51D8FB7}"     # ExchangeMGR_TLB.pas:52 CLASS_ExchangeMGR_X
PKG = "EXCH_MGR"                                      # UnitDateExch.dfm:57-59 OPExchMgr.PackageName
SBOP = "SBOP"                                         # UnitDateExch.dfm:1178-1180 SBOPDate
TITLE_DEFAULT = "dat"                                 # ODSExchProvarch / ODSResurs Variables.Data :TITLE = 'dat'
# Columns of DBGridEhTrans (Unit_ExchangeMGR.dfm) - DBGridEhTransTitleClick2 SetVariable('Title', Column.FieldName)
TRANS_COLS = ("ROWNUM", "STATUS", "STATUS_STR", "STATUS_CASHLESS", "DAT", "VAL_NAME", "DEBITAMOUNT", "VAL_CHANGED_NAME",
              "LAMOUNT", "FEE_AMOUNT", "OP_COURSE", "TRANS_CLOSE", "OPER_NAME", "SESSIONNAME", "USERNAME")
# Opened by ActiveFormCreate but only used by forms of later chunks (open_cust_data_sets :479-491 and the rest)
OPEN_ONLY = ("DM_ODSCust_Confirm", "DM_ODSCust_Country", "DM_ODSCust_Father", "DM_ODSCust_LName", "DM_ODSCust_Name",
             "DM_ODSGiving_Member")
OPEN_ONLY2 = ("DM_ODSAvalute", "DM_ODSValute", "DM_ODSAvaluteDelete", "DM_ODSAvaluteToplam", "DM_ODSResursValyuta")
OPEN_ONLY3 = ("DM_ODSRResursValyuta",)
OPEN_ONLY4 = ("DM_ODSReestrVdm", "DM_ODSReestrValyuta")


class OfficeIn(BaseModel):
    ex_no: int | None = None                          # ODSExchOfficeEX_NO of the current GridMaster row (None = empty)
    dat: datetime.date                                # DTP_System_Date
    sdat: datetime.date                               # SBOPDate.get_date
    title: str = Field(TITLE_DEFAULT, max_length=30)  # ODSExchProvarch :Title
    rtitle: str = Field(TITLE_DEFAULT, max_length=30)  # ODSResurs :title


class FilialIn(BaseModel):
    ex_id: int = -1                                   # DBLookupComboBox2.KeyValue
    dat: datetime.date                                # DTP_DateFilial


class RateIn(BaseModel):
    dat: datetime.date


def rows(rs) -> list[dict]:
    return [dict(row(r), rowid=str(r["ROWID"])) if r.get("ROWID") is not None else row(r) for r in rs]


def remainder_rows(rs) -> list[dict]:
    """ODSExRemainderCalcFields (UnitDateExch.pas:535-539): CURRENT_OSTAT := FIRST+FTPE-PEFR+PURCHASE-SELLING
    (AsCurrency: 4 decimals)."""
    out = []
    for r in rs:
        x = row(r)
        c = lambda k: round(float(x.get(k) or 0), 4)
        x["current_ostat"] = round(c("first_ostat") + c("ftpe_ostat") - c("pefr_ostat") + c("purchase_turn") - c("selling_turn"), 4)
        out.append(x)
    return out


def with_exname(c, rs, rfilial=None):
    """ODSRatesFilial lookup field Exname: ODS_RFilial.NAME by EX_ID (UnitDateExch.dfm:2149-2222)."""
    m = {f["id"]: f["name"] for f in (rfilial if rfilial is not None else rows(c.query(Q.DM_ODS_RFilial)))}
    for r in rs:
        r["exname"] = m.get(r.get("ex_id"))
    return rs


def office_sets(c, ex_no, dat, sdat, title=TITLE_DEFAULT, rtitle=TITLE_DEFAULT) -> dict:
    """Master/detail on ODSExchOffice (EX_NO -> :ex_id): ODSExchProvarch, ODSResurs, ODSExRemainder; ODSSumTrans
    (SetVariable('ex_id', ODSExchOffice.fields[1]) + Refresh :2297-2298)."""
    d, s = date_only(dat), date_only(sdat)
    prov = rows(c.query(Q.DM_ODSExchProvarch, {"ex_id": ex_no, "dat": d, "Title": title}))
    st = c.query(Q.DM_ODSSumTrans, {"ex_id": ex_no})
    res = rows(c.query(Q.DM_ODSResurs, {"ex_id": ex_no, "vdat": d, "title": rtitle}))
    rem = remainder_rows(c.cursor_block(Q.SQL_EX_REMAINDER, "result", {"dat": d, "ex_id": ex_no, "sdat": s}))
    return {"provarch": prov, "sum_fee": (st[0].get("FEE_AMOUNT") if st else None), "resurs": res, "remainder": rem}


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/exchangemgr")
    g = require_module(CLSID)

    @r.get("/init")
    def _init(ws=Depends(g)):
        """ActiveFormCreate :2146-2354."""
        c = ws.conn
        sd = c.query(Q.DM_ODSSysdat)[0]                                   # ODSSysdat: trunc(sysdate), HH24:MI:SS
        dat = date_only(sd["SSDAT"])
        sdat = date_only(c.call_func(SBOP, "get_date", [], datetime.datetime))
        cal = c.call_bool(PKG, "Ex_Calendar", [dat])
        scal = c.call_bool(PKG, "Ex_Calendar", [sdat])
        last = c.call_func(PKG, "LastWorkDay_Calendar", [dat], datetime.datetime)
        out = {"dat": dat, "time": sd.get("STIME"), "sdat": sdat, "opened": False, "message": None}
        if not sdat <= dat:
            out["message"] = "em.err_sysdate_greater"                      # 'Sistemin tarixi Cari tarixdən böyükdür!!!!!!'
            return out
        c.call_proc(PKG, "NextResurs", [dat], commit=False)
        for n in OPEN_ONLY:
            c.query(getattr(Q, n))
        offices = rows(c.query(Q.DM_ODSExchOffice))
        filial = {f.get("ID"): f.get("NAME") for f in c.query(Q.DM_ODSFilial)}           # FILIALNAME lookup
        for o in offices:
            o["filialname"] = filial.get(o.get("filial"))
        ex_no = offices[0]["ex_no"] if offices else None
        out["offices"] = offices
        out["vdm_all"] = rows(c.query(Q.DM_ODSVDMAll))
        c.query(Q.DM_ODSDeleteVDM); c.query(Q.DM_ODSToplamVDM)
        prov = rows(c.query(Q.DM_ODSExchProvarch, {"ex_id": ex_no, "dat": dat, "Title": TITLE_DEFAULT}))
        out["rates"] = rows(c.query(Q.DM_ODSExchRate, {"dat": dat}))
        out["rfilial"] = rows(c.query(Q.DM_ODS_RFilial))
        out["rates_filial"] = with_exname(c, rows(c.query(Q.sql_rates_filial(-1), {"dat": dat})), out["rfilial"])   # DBLookupComboBox2Click(-1)
        c.query(Q.DM_ODSExchRateAll)
        c.query(Q.DM_ODSExchRateOther, {"dat": dat})
        out["kurs"] = rows(c.query(Q.DM_Kurs, {"datdate": dat}))
        for n in OPEN_ONLY2:
            c.query(getattr(Q, n))
        res = rows(c.query(Q.DM_ODSResurs, {"ex_id": ex_no, "vdat": dat, "title": TITLE_DEFAULT}))
        c.query(Q.DM_ODSVdmResurs, {"ex_id": ex_no})
        for n in OPEN_ONLY3:
            c.query(getattr(Q, n))
        c.query(Q.DM_ODSVdmRResurs, {"ex_id": ex_no})
        for n in OPEN_ONLY4:
            c.query(getattr(Q, n))
        st = c.query(Q.DM_ODSSumTrans, {"ex_id": ex_no})
        out.update(provarch=prov, resurs=res, sum_fee=(st[0].get("FEE_AMOUNT") if st else None))
        # ODSExRemainder: one text for every branch (:2309-2321); 'Calendar and SCalendar' -> message + exit before Open
        if (sdat == dat) or (sdat < dat and cal and sdat == last) or (sdat < dat and ((not cal) or sdat < last)):
            if cal and scal:
                out["message"] = "em.err_calendar"
                return out
            out["remainder"] = remainder_rows(c.cursor_block(Q.SQL_EX_REMAINDER, "result", {"dat": dat, "ex_id": ex_no, "sdat": sdat}))
        else:
            err(400, "em.err_db", msg="ORA-00900: invalid SQL statement")  # SQL left empty -> Open fails
        out["opened"] = True
        return out

    @r.post("/office")
    def _office(b: OfficeIn, ws=Depends(g)):
        """GridMaster scroll: the detail datasets re-open with the new EX_NO; DBGridEhTransTitleClick2 / ToolButton11
        (Yeniləmək) refresh ODSExchProvarch with :Title."""
        try:
            return office_sets(ws.conn, b.ex_no, b.dat, b.sdat, b.title, b.rtitle)
        except DBError as e:
            err(400, "em.err_db", msg=str(e))

    @r.post("/remainder/show")
    def _rem_show(b: OfficeIn, ws=Depends(g)):
        """TabRemainderShow :1532-1544: F := ex_date_change; 0 -> Ex_RemainderProv_Change(EX_NO), 1 ->
        Ex_RemainderLaz_Change(EX_NO), 2 -> exit; then ODSExRemainder.Refresh if Active."""
        c = ws.conn
        f = c.call_func(PKG, "ex_date_change", [], int)
        if f == 2:
            return {"refreshed": False}
        if f == 0:
            c.call_proc(PKG, "Ex_RemainderProv_Change", [b.ex_no], commit=False)
        if f == 1:
            c.call_proc(PKG, "Ex_RemainderLaz_Change", [b.ex_no], commit=False)
        rem = remainder_rows(c.cursor_block(Q.SQL_EX_REMAINDER, "result", {"dat": date_only(b.dat), "ex_id": b.ex_no, "sdat": date_only(b.sdat)}))
        return {"refreshed": True, "remainder": rem}

    @r.post("/rates")
    def _rates(b: RateIn, ws=Depends(g)):
        """TabShRateShow :1546-1567: ODSExchRate.Refresh."""
        return {"rates": rows(ws.conn.query(Q.DM_ODSExchRate, {"dat": date_only(b.dat)}))}

    @r.post("/rates-filial")
    def _rates_filial(b: FilialIn, ws=Depends(g)):
        """DBLookupComboBox2Click :1337-1352."""
        c = ws.conn
        return {"rates_filial": with_exname(c, rows(c.query(Q.sql_rates_filial(b.ex_id), {"dat": date_only(b.dat)})))}

    @r.post("/resurs/refresh")
    def _resurs(b: OfficeIn, ws=Depends(g)):
        """ToolButton20Click 'Yeniləmək' (:2356-2364): ODSResurs.Refresh."""
        return {"resurs": rows(ws.conn.query(Q.DM_ODSResurs, {"ex_id": b.ex_no, "vdat": date_only(b.dat), "title": b.rtitle}))}

    return r
