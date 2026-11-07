"""Old rates ('Old Courses') - port of Delphi Packages/LastRates (OldRatesProj, TOldRatesFormX = TFrmOldCourses,
OldRatesFormImpl.pas/.dfm; one form, no other copies). SQL verbatim in or_sql.py.

ActiveFormCreate :390-400: TranslateAllComponents; DTP_BEG / DTP_END := SBOP.Get_Date (OraclePackage, dfm:488-493);
ODSCourses.Open; ODSValute.Open (opened, never used further); ODSValute.First.
ODSCoursesBeforeOpen :288-295: beg_dat := DTP_BEG.Date, end_dat := DTP_END.Date.
DTP_BEGChange / DTP_ENDChange :267-277: Close / Open (with the current :Title_Order).
DBGrid1TitleClick :245-250: Title_ORDER := Column.FieldName; Close / Open. :TITLE_ORDER is a DOA substitution variable
(Variables.Data type 1, default text 'Val_kod', dfm:413-417) -> delphi.subst with the grid FieldNames only.
Sürətli axtarış edits (EVal_name / EVal_kod / EOstat / EDat Change :407-425): ODSCourses.Locate(field, text,
[loCaseInsensitive, loPartialKey]) - client side (modules/oldrates.js).
XFSpeedButton1Click :383-388: CMExcelExport.ExportDataset(ODSCourses, 'Valyuta məzənnələri', True, False).
ODSFiltr / DSFiltr: only used by commented-out code (:427-441, BitBtn1Click is empty) - not exposed.
Read-only module: no DML, no commit.
"""
from __future__ import annotations
import datetime

from fastapi import APIRouter, Depends, Response
from pydantic import BaseModel, Field

from . import or_sql as Q
from .customers import row
from .delphi import date_only, subst
from .exchange import xlsx, XLSX

CLSID = "{B64EFF5B-E81F-11D6-A53D-00E04C774264}"     # OldRatesProj_TLB.pas CLASS_OldRatesFormX
PKG = "SBOP"                                          # OldRatesFormImpl.dfm:488-493 OraclePackage.PackageName
TITLE_DEFAULT = "Val_kod"                             # dfm:413-417 :TITLE_ORDER initial text
COLS = ["DAT", "VAL_NAME", "VAL_KOD", "OSTAT"]       # DBGrid1.Columns FieldNames (dfm:61-120)
# Persistent fields in field order (dfm:426-444): FieldName, DisplayLabel, kind (see exchange.xlsx)
FIELDS = [("DAT", "Tarix", "d"), ("VAL_NAME", "$", "s"), ("VAL_KOD", "Valyutanın kodu", "i"), ("OSTAT", "Rəsmi məzənnə", "f")]
SHEET = "Valyuta məzənnələri"


class Period(BaseModel):
    beg: datetime.date                                 # DTP_BEG.Date
    end: datetime.date                                 # DTP_END.Date
    title: str | None = Field(None, max_length=30)     # last DBGrid1TitleClick FieldName (None = 'Val_kod')


def _title(t):
    return t if t in COLS else TITLE_DEFAULT


def courses(c, p: Period) -> list[dict]:
    sql = subst(Q.SQL_OR_ODSCOURSES, "Title_Order", _title(p.title))
    return c.query(sql, {"beg_dat": date_only(p.beg), "end_dat": date_only(p.end)})


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/oldrates")
    g = require_module(CLSID)

    @r.get("/init")
    def _init(ws=Depends(g)):
        c = ws.conn
        d = c.call_func(PKG, "Get_Date", [], datetime.datetime)
        day = date_only(d).date() if d else None
        rows = courses(c, Period(beg=day, end=day)) if day else []
        c.query(Q.SQL_OR_ODSVALUTE)                    # ODSValute.Open / First (result unused in Delphi)
        return {"date": day.isoformat() if day else None, "title": TITLE_DEFAULT, "rows": [row(x) for x in rows]}

    @r.post("/courses")
    def _courses(p: Period, ws=Depends(g)):
        return {"title": _title(p.title), "rows": [row(x) for x in courses(ws.conn, p)]}

    @r.post("/excel")
    def _excel(p: Period, ws=Depends(g)):
        rows = courses(ws.conn, p)
        return Response(xlsx(rows, FIELDS, SHEET), media_type=XLSX,
                        headers={"Content-Disposition": 'attachment; filename="Valyuta_mezenneleri.xlsx"'})

    return r
