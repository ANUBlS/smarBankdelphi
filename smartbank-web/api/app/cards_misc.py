"""Cards ▸ Əməliyyat small forms (cards_azericard MAINFORMImpl1 PopupMenu2), ported in Python (no file parsing):
- Kliring (Kliring1Click :1143, right card_klirinq -> TKlirinq_form klirinqUnit.pas): FormActivate :81 kliring1 / kliring2 Close / Open;
  isertbtn 'Bazaya Göndər' :71 kliring_delete + insert_kliring + reopen; ToolButton1 'Təsdiq Et' :61 'Klirinq əməliyyatlarını vermək
  istəyirsinizmi?' Yes -> kliring; both grids reopened after Yes AND No (the Close / Open lines are outside the if); ToolButton2 'Sil' :169
  kliring_delete + Refresh; FormClose :176 kliring_delete + Refresh; ToolButton7 'Excel' DropdownMenu PopupMenu1: N11 '1-ci pəncərə'
  (ExportDataset(kliring1, 'kliring')) / N12 '2-ci pəncərə' (kliring2); grid popups EXCEL1 -> N11, EXCEL2 -> N12, SELECT ALL;
  DBGrid1/2TitleClick :213/:234 SQL.Add('ORDER BY F'), Refresh, SQL[pos] := ''. No commit anywhere.
- Limitlər (Limitlr1Click :1152, no right check -> Tlim limittur.pas): OracleDataSet1 (status 1) / OracleDataSet2 (status 2), Active = True in
  limittur.dfm; ToolButton1 'Təsdiq et' :61 card_main.limits + Refresh both + 'Limitlər daxil edildi!'; ToolButton2 'Yenilə' Refresh both.
  The grids have no Columns: every field is shown.
- Excel yükləmələr (N12Click :1259, right card_excelfile -> TEXCELform Unitexcel.pas): FormActivate excels.Open (card_excelform);
  Button1 'Aç' / DBGrid1DblClick open the sub form by the current row's Id: 1 TSalary (Unitsalary.pas), 2 Tnewcardex (EXCELNEWCARD.pas),
  3 TProlongationxls (PROLONGATIONUNIT.pas), 4 Taccountclose (accountcloseunit.pas)."""
from __future__ import annotations

from fastapi import APIRouter, Depends
from fastapi.responses import Response
from pydantic import BaseModel, Field

from . import cards_sql as Q
from .cards import CLSID
from .customers import row

LINES_LIM1 = ["select * FROM card_limits where status=1"]          # limittur.dfm OracleDataSet1
LINES_LIM2 = ["select * FROM card_limits where status=2"]          # limittur.dfm OracleDataSet2
KL_COLS = ("BANKID", "BANKNAME", "HESAB1", "KLIRING1", "MEBLEQ", "INFO")      # klirinqUnit.dfm DBGrid1 / DBGrid2 FieldNames
EXCEL_FORMS = {1: "salary", 2: "newcardex", 3: "prolongationxls", 4: "accountclose"}


def _q(ws, lines, sort=None):
    return [dict(r) for r in ws.conn.query(Q.text(list(lines) + (["ORDER BY " + sort] if sort else [])), {})]


def _p(ws, name, args=()):
    ws.conn.call_proc("card_main", name, list(args), commit=False)


# ------------------------------------------------------------------------------------------------ Kliring
def kl_view(ws, sort=None, **extra):
    g = sort or {}
    out = {"grid1": [row(r) for r in _q(ws, Q.LINES_KLIRING1, g.get("grid1"))], "grid2": [row(r) for r in _q(ws, Q.LINES_KLIRING2, g.get("grid2"))]}
    out.update(extra)
    return out


def kl_open(ws):
    ws.conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["card_klirinq"], commit=False)
    ws.module_state["cards_kliring"] = True
    return kl_view(ws)


def kl_tobase(ws):
    _p(ws, "kliring_delete"); _p(ws, "insert_kliring")
    return kl_view(ws)


def kl_confirm(ws, yes: bool):
    if yes:
        _p(ws, "kliring")
    return kl_view(ws)


def kl_delete(ws):
    _p(ws, "kliring_delete")
    return kl_view(ws)


# ------------------------------------------------------------------------------------------------ Limits
def lim_view(ws, **extra):
    out = {"grid1": [row(r) for r in _q(ws, LINES_LIM1)], "grid2": [row(r) for r in _q(ws, LINES_LIM2)]}
    out.update(extra)
    return out


def lim_confirm(ws):
    _p(ws, "limits")
    return lim_view(ws, messages=["Limitlər daxil edildi!"])


class SortIn(BaseModel):
    grid: str = Field(max_length=10)
    field: str = Field(max_length=40)


class YesIn(BaseModel):
    yes: bool = False


class IdIn(BaseModel):
    id: int | None = None


XLSX = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/cards")
    g = require_module(CLSID)

    def need(ws, k):
        if not ws.module_state.get(k):
            err(409, "error.bad_request")

    @r.post("/kliring/open")
    def _ko(ws=Depends(g)):
        return kl_open(ws)

    @r.post("/kliring/tobase")
    def _kb(ws=Depends(g)):
        need(ws, "cards_kliring"); return kl_tobase(ws)

    @r.post("/kliring/confirm")
    def _kc(b: YesIn, ws=Depends(g)):
        need(ws, "cards_kliring"); return kl_confirm(ws, b.yes)

    @r.post("/kliring/delete")
    def _kd(ws=Depends(g)):
        need(ws, "cards_kliring"); return kl_delete(ws)

    @r.post("/kliring/close")
    def _kx(ws=Depends(g)):
        need(ws, "cards_kliring"); _p(ws, "kliring_delete"); ws.module_state.pop("cards_kliring", None)
        return {"ok": True}

    @r.post("/kliring/sort")
    def _ks(b: SortIn, ws=Depends(g)):
        need(ws, "cards_kliring")
        if b.grid not in ("grid1", "grid2") or b.field.upper() not in KL_COLS:
            return kl_view(ws)
        cur = kl_view(ws)
        if not cur[b.grid]:
            return cur                                   # IsEmpty -> Exit
        try:
            return kl_view(ws, {b.grid: b.field.upper()})
        except Exception as e:      # noqa: BLE001 - Refresh error shown
            return kl_view(ws, error=str(e))

    @r.post("/kliring/excel")
    def _ke(b: SortIn, ws=Depends(g)):
        need(ws, "cards_kliring")
        from .cards_balpay import _excel
        rows = _q(ws, Q.LINES_KLIRING1 if b.grid == "grid1" else Q.LINES_KLIRING2)
        return Response(_excel(rows, "kliring"), media_type=XLSX, headers={"Content-Disposition": 'attachment; filename="kliring.xlsx"'})

    @r.post("/limits/open")
    def _lo(ws=Depends(g)):
        return lim_view(ws)

    @r.post("/limits/refresh")
    def _lr(ws=Depends(g)):
        return lim_view(ws)

    @r.post("/limits/confirm")
    def _lc(ws=Depends(g)):
        return lim_confirm(ws)

    @r.post("/excelforms/open")
    def _eo(ws=Depends(g)):
        ws.conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["card_excelfile"], commit=False)
        return {"grid": [row(x) for x in _q(ws, Q.LINES_EXCELS)]}

    @r.post("/excelforms/pick")
    def _ep(b: IdIn, ws=Depends(g)):
        """Button1Click: FieldByName('Id').AsInteger of the current row -> the sub form (none for other ids)."""
        return {"form": EXCEL_FORMS.get(b.id or 0)}

    return r
