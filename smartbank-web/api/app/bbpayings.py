"""BB payings (cable / broadband subscriber payments) - port of Delphi Packages/BBPayings (BBPayings / TBBPayingsForm;
units BBPayingsImpl, UnitDataModBBPayings (TDataModBBPayings), UnitBBPayingAdd (TFormBBPayingAdd 'Paying' dialog)).
No other copies: CLASS_BBPayingsForm is only in Packages/BBPayings/BBPayings_TLB.pas. SQL verbatim in bb_sql.py.

ActiveFormCreate (BBPayingsImpl.pas): DTPickBegin.Date / DTPickEnd.Date := SBOP.get_date (TDateTimePicker.Date keeps
the design-time time of day: 10:35:38 / 10:35:40, dfm Date 39202.4414185417 / 39202.4414469329); StDate / EndDate :=
DateTime; ODS_ABNServices (StDate, EndDate), ODS_Contracts, ODS_Services Open.
BtnRefreshClick: same variables + DataSet.Filter '1=1 [and (srv_id=K)] [and (status=1|0)]'; Filtered; Close; Open
(the filter is client-side - reproduced in the web page and in the Excel export).
DBGridContractsTitleClick: SQL.Add(' order by '+FieldName); Refresh; SQL[line] := '' (sorted for that Refresh only).
BtnAdd / BtnEdit: dialog; ShowModal = mrOk -> Cable_Manager.AbnServAdd (CallIntegerFunction) / AbnServUpd with
p_done_time := trunc(DTPicker.DateTime) taken BEFORE ShowModal (sb_GetSystemDate for Add, Done_Time for Edit), so the
dialog's date is not used; then Refresh (also after Cancel).
BtnDelClick: MessageDlg Yes / No / Cancel -> AbnServDel(ID, 1) / AbnServDel(ID, 0) / nothing; Refresh.
BtnConfirmClick: for each selected row with STATUS = 0: AbnServCommit(ID); Refresh.
No Commit anywhere in the module (the Cable_Manager calls run without a commit, as in Delphi).
"""
from __future__ import annotations

import datetime
import io

from fastapi import APIRouter, Depends, Response
from pydantic import BaseModel, Field

from . import bb_sql as Q
from .customers import row

CLSID = "{37150233-6F69-4049-AC4C-6381608E99F8}"     # BBPayings_TLB.pas CLASS_BBPayingsForm
T_BEGIN = datetime.timedelta(days=0.4414185417)       # DTPickBegin design-time time of day (dfm:242)
T_END = datetime.timedelta(days=0.4414469329)         # DTPickend design-time time of day (dfm:256)
# DBGridContracts columns (BBPayingsImpl.dfm) - the only FieldNames a title click can append
GRID_FIELDS = ("ID", "ABN_NAME", "CONTRACT_NUM", "SYS_DATE", "SERVICE", "AMOUNT", "DONE_TIME")


def _day(s: str) -> datetime.datetime:
    d = datetime.date.fromisoformat(s)
    return datetime.datetime(d.year, d.month, d.day)


def services_sql(order: str | None) -> str:
    return Q.SQL_BB_ODS_ABNSERVICES + ("\n order by " + order if order else "")


class OpenIn(BaseModel):
    st: str = Field(pattern=r"^\d{4}-\d{2}-\d{2}$")
    end: str = Field(pattern=r"^\d{4}-\d{2}-\d{2}$")
    order: str | None = None


class FilterIn(BaseModel):
    srv_id: int | None = None          # ChBoxSrvType checked -> KeyValue
    status: int | None = None          # 1 / 0 when only one of the two boxes is checked


class XlsIn(OpenIn):
    filter: FilterIn = FilterIn()


class PayIn(BaseModel):
    id: int | None = None
    contract_id: int | None = None
    srv_id: int | None = None
    amount: str = Field(default="", max_length=40)
    paymethod: int = Field(ge=-1, le=1)
    done_time: str | None = Field(default=None, pattern=r"^\d{4}-\d{2}-\d{2}")


class DelIn(BaseModel):
    id: int
    answer: str = Field(pattern=r"^(yes|no|cancel)$")


class IdsIn(BaseModel):
    ids: list[int] = Field(max_length=10000)


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/bbpayings")
    g = require_module(CLSID)

    def services(c, o: OpenIn):
        if o.order is not None and o.order not in GRID_FIELDS:
            err(400, "error.generic")
        return [row(x) for x in c.query(services_sql(o.order),
                                         {"StDate": _day(o.st) + T_BEGIN, "EndDate": _day(o.end) + T_END})]

    @r.get("/init")
    def _init(ws=Depends(g)):
        c = ws.conn
        d = c.call_func("SBOP", "get_date", [], datetime.datetime)
        day = d.date().isoformat()
        rows = services(c, OpenIn(st=day, end=day))
        return {"date": day, "rows": rows, "contracts": [row(x) for x in c.query(Q.SQL_BB_ODS_CONTRACTS)],
                "services": [row(x) for x in c.query(Q.SQL_BB_ODS_SERVICES)]}

    @r.post("/open")                                                   # BtnRefresh (Close/Open) / Refresh / title click
    def _open(o: OpenIn, ws=Depends(g)):
        return {"rows": services(ws.conn, o)}

    @r.get("/sysdate")                                                 # BtnAddClick: DTPicker.Date := sb_GetSystemDate
    def _sys(ws=Depends(g)):
        return {"date": ws.conn.call_func("SBOP", "get_date", [], datetime.datetime).date().isoformat()}

    @r.post("/add")                                                    # BtnAddClick, ShowModal = mrOk
    def _add(b: PayIn, ws=Depends(g)):
        c = ws.conn
        p_dt = c.call_func("SBOP", "get_date", [], datetime.datetime)
        p_dt = datetime.datetime(p_dt.year, p_dt.month, p_dt.day)       # trunc(DTPicker.DateTime)
        n = c.call_func("Cable_Manager", "AbnServAdd",
                        [b.contract_id, None, b.srv_id, b.amount, 0, 0, p_dt, b.paymethod], rettype=int)
        return {"result": n}

    @r.post("/update")                                                 # BtnEditClick, ShowModal = mrOk
    def _upd(b: PayIn, ws=Depends(g)):
        if b.id is None or b.done_time is None:
            err(400, "error.generic")
        p_dt = _day(b.done_time[:10])                                   # trunc(Done_Time) set before ShowModal
        ws.conn.call_proc("Cable_Manager", "AbnServUpd",
                          [b.id, b.contract_id, None, b.srv_id, b.amount, 0, 0, p_dt, b.paymethod], commit=False)
        return {"ok": True}

    @r.post("/delete")                                                 # BtnDelClick
    def _del(b: DelIn, ws=Depends(g)):
        if b.answer != "cancel":
            ws.conn.call_proc("Cable_Manager", "AbnServDel", [b.id, 1 if b.answer == "yes" else 0], commit=False)
        return {"ok": True}

    @r.post("/confirm")                                                # BtnConfirmClick: selected rows with STATUS = 0
    def _conf(b: IdsIn, ws=Depends(g)):
        for i in b.ids:
            ws.conn.call_proc("Cable_Manager", "AbnServCommit", [i], commit=False)
        return {"ok": True, "calls": len(b.ids)}

    @r.post("/excel")                                                  # BtnExcelClick: ExportDataset(ODS_ABNServices,'Services')
    def _xls(b: XlsIn, ws=Depends(g)):
        from openpyxl import Workbook
        from openpyxl.styles import Font
        if b.order is not None and b.order not in GRID_FIELDS:
            err(400, "error.generic")
        raw = ws.conn.query(services_sql(b.order), {"StDate": _day(b.st) + T_BEGIN, "EndDate": _day(b.end) + T_END})
        f = b.filter
        keep = [x for x in raw if (f.srv_id is None or x.get("SRV_ID") == f.srv_id)
                and (f.status is None or x.get("STATUS") == f.status)]
        wb = Workbook()
        sh = wb.active
        sh.title = "Services"
        sh.append(list(raw[0].keys()) if raw else list(GRID_FIELDS))
        for cell in sh[1]:
            cell.font = Font(bold=True)
        for x in keep:
            sh.append([v.replace(tzinfo=None) if isinstance(v, datetime.datetime) else v for v in x.values()])
        bio = io.BytesIO()
        wb.save(bio)
        return Response(bio.getvalue(), media_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                        headers={"Content-Disposition": 'attachment; filename="Services.xlsx"'})

    return r
