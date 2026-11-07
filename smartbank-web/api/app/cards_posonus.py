"""Cards ▸ Əməliyyat ▸ Commission Our POS-ONUS (cards_azericard MAINFORMImpl1 PostCommisiononus1Click :1279, right card_cfile ->
TPostCommisionOnus PostCommisionOnusImpl.pas). Package DataMod_CARDS.card_commission_our_pos_onus (Unit18.dfm, PackageName
'card_commission_our_pos_onus'); its body is not in the repo. No commit anywhere in the unit.

- FormShow :70: DScard_m_commision (Unit18.dfm:3722, trid1 / trid2 NULL, sysdat = :pdate) and DScard_m_commision_commit (:4059, trid1 or
  trid2 set) Close / SetVariable('pdate', DSSysdat.TEK_DAT) / Open; DateTimePicker1 := TEK_DAT. DSSysdat is opened once when the data module
  is created (Unit18.pas :856); the web reads sysdat when the form opens.
- ToolButton2 'Yeniləmək' :352: both reopened with DateTimePicker1.DateTime.
- ToolButton3 'Oxu' :366: ins_card_messages_c_commision; DBGrid1 / DBGrid2 Refresh (the last :pdate).
- ToolButton1 'Təsdiq et' :244: DBGrid1 RecordCount = 0 -> 'Hec bir melumat yoxdur.' + Exit. countBefo := DBGrid2 RecordCount; loop over
  DBGrid1.SelectedRows (Count = 0 -> current row). The per-row question is commented out: only
  Format('%d  sayda seçilmiş əməliyyat təsdiq edilsinmi?', [Count - Index]) [Yes, Cancel] is asked while WaitNextConfirm: Yes -> no more
  questions, Cancel -> Continue (that row is skipped, the next row asks again). card_merchand_c_comission(ID) per row; finally both Refresh +
  IntToStr(|countBefo - DBGrid2 RecordCount|) + ' sayda əməliyyat təsdiqləndi!'.
- DBGrid1 PopupMenu2 'Sil' (Sil2Click :172) del_card_messages_c_commision(ID) / DBGrid2 PopupMenu1 'Sil' (Sil1Click :101)
  del_card_messages_comm_commit(ID): the same loop with '%d  sayda  əməliyyat silinsinmi?'; message ' sayda seçilmiş əməliyyat silindi!'
  with the count difference of that grid. 'Hamısını seçmək' (Ctrl+A) selects all rows of the grid. FormKeyPress Esc -> Close.
- DBGrid1 / DBGrid2: dgRowSelect + dgMultiSelect, dgTitleClick without OnTitleClick (no sorting); ID / TRID1 / TRID2 hidden in DBGrid1, ID in DBGrid2.
  MainMenu1 has no items."""
from __future__ import annotations

import datetime as dt

from fastapi import APIRouter, Depends
from pydantic import BaseModel, Field

from . import cards_sql as Q
from .cards import CLSID
from .customers import row

PKG = "card_commission_our_pos_onus"
_C = ["CARDNUMBER", "RBSNUMBER", "FEEAMOUNT", "TRANDATE", "TRANTIME", "CURRENCY", "BALAN_SIGN", "FEE_CUR", "TRANAMOUNT", "FILE_NAME", "TRAN_NUM",
      "REG_NUM", "TRAN_TYPE", "CONTRACT_T", "ORG_NUM", "CONT_EN12", "ORG_CON", "TRAN_DIR", "TRAN_CUR", "SETT_CUR", "ACC_CUR", "SETT_AM", "ACC_AMOUNT",
      "FEE_DIR", "ACC_TYPE", "EXPRY_DATE", "MERCH_ID", "TRANCOUTRY", "TRAN_CITY", "TRAN_DETAL", "VALUE_DATE", "SETT_DATE", "MERCH_CODE", "REC_CUR",
      "REC_AMOUNT", "CONT_EN13", "SEND", "COUNTRY", "ROWNUMS", "RESERVED1", "RESERVED2", "RESERVED3", "RESERVED4", "REGISTR_NUMBER",
      "AVTORIZASION_NUMBER", "AVTORIZASION_AMOUNT", "CONTRA_ENTRY", "REFERENCE_NUMBER", "ISUED_REFERENCE_NUMBER", "RETRIVAL_REFERENC_NUMBER",
      "TRANSACTION_CONDITION", "CUSTOM_FEE_DIRECTION", "CUSTOM_FEE_AMOUNT", "GLDATE", "DEVICE_FINANCIAL_NUMBER", "RSERVED_5_1", "RSERVED_5_2",
      "RSERVED_5_3", "RSERVED_5_4", "ID_M", "STATUS", "INFO"]
COLS1 = ["INFO_COMMISION"] + _C + ["SYSDAT"]                            # PostCommisionOnusImpl.dfm DBGrid1 visible columns
COLS2 = ["TRID1", "TRID2"] + _C + ["INFO_COMMISION", "SYSDAT"]          # DBGrid2 visible columns
DEL = {"grid1": "del_card_messages_c_commision", "grid2": "del_card_messages_comm_commit"}


def _st(ws):
    s = ws.module_state.get("cards_posonus")
    if s is None:
        raise LookupError("posonus")
    return s


def _open(ws):
    s = _st(ws)
    d = dt.datetime.fromisoformat(s["pdate"])
    s["grid1"] = [dict(r) for r in ws.conn.query(Q.text(Q.LINES_DSCARD_M_COMMISION), {"pdate": d})]
    s["grid2"] = [dict(r) for r in ws.conn.query(Q.text(Q.LINES_DSCARD_M_COMMISION_COMMIT), {"pdate": d})]


def _view(ws, **extra):
    s = _st(ws)
    out = {"date": s["date"], "grid1": [row(r) for r in s["grid1"]], "grid2": [row(r) for r in s["grid2"]], "cols1": COLS1, "cols2": COLS2}
    out.update(extra)
    return out


def open_form(ws):
    ws.conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["card_cfile"], commit=False)
    sy = ws.conn.query(Q.text(Q.LINES_DSSYSDAT), {})
    tek = sy[0].get("TEK_DAT") if sy else None
    if tek is None:
        raise ValueError("DSSysdat: TEK_DAT")
    tek = dt.datetime.combine(tek.date() if isinstance(tek, dt.datetime) else tek, dt.time()) if not isinstance(tek, dt.datetime) else tek
    ws.module_state["cards_posonus"] = {"pdate": tek.isoformat(), "date": tek.date().isoformat(), "grid1": [], "grid2": []}
    _open(ws)
    return _view(ws)


def refresh(ws, date):
    s = _st(ws)
    s["date"] = date
    s["pdate"] = dt.datetime.combine(dt.date.fromisoformat(date), dt.time()).isoformat()   # SetVariable('pdate', DateTimePicker1.DateTime)
    _open(ws)
    return _view(ws)


def read(ws):
    ws.conn.call_proc(PKG, "ins_card_messages_c_commision", [], commit=False)
    _open(ws)
    return _view(ws)


def _loop(ws, grid, proc, ids, current, answers):
    s = _st(ws)
    order = [r.get("ID") for r in s[grid]]
    sel = sorted(set(ids) & set(order), key=order.index)
    if not sel and current in order:
        sel = [current]
    wait, will, done, error = True, False, [], None
    it = iter(answers)
    try:
        for tid in sel:
            if wait:
                if next(it, "cancel") == "yes":
                    wait = False
                else:
                    continue                                              # mrCancel -> Continue
            ws.conn.call_proc(PKG, proc, [int(tid)], commit=False)
            done.append(tid); will = True
    except Exception as e:      # noqa: BLE001
        error = getattr(e, "message", None) or str(e)
    return will, done, error


def confirm(ws, ids, current, answers):
    s = _st(ws)
    if len(s["grid1"]) == 0:
        return _view(ws, messages=["Hec bir melumat yoxdur."])
    before = len(s["grid2"])
    will, done, error = _loop(ws, "grid1", "card_merchand_c_comission", ids, current, answers)
    msgs = []
    if will:
        _open(ws)
        msgs.append(str(abs(before - len(s["grid2"]))) + " sayda əməliyyat təsdiqləndi!")
    return _view(ws, done=done, messages=msgs, error=error)


def delete(ws, grid, ids, current, answers):
    s = _st(ws)
    before = len(s[grid])
    will, done, error = _loop(ws, grid, DEL[grid], ids, current, answers)
    msgs = []
    if will:
        _open(ws)
        msgs.append(str(abs(before - len(s[grid]))) + " sayda seçilmiş əməliyyat silindi!")
    return _view(ws, done=done, messages=msgs, error=error)


class DateIn(BaseModel):
    date: str = Field(pattern=r"^\d{4}-\d\d-\d\d$")


class LoopIn(BaseModel):
    grid: str = Field("grid1", pattern="^grid[12]$")
    ids: list[int] = []
    current: int | None = None
    answers: list[str] = []


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/cards/posonus")
    g = require_module(CLSID)

    def _fe(fn, *a):
        try:
            return fn(*a)
        except LookupError:
            err(409, "error.bad_request")
        except ValueError as e:
            err(400, "error.bad_request", ora=str(e))

    def ok(b):
        if any(a not in ("yes", "cancel") for a in b.answers):
            err(400, "error.bad_request")

    @r.post("/open")
    def _o(ws=Depends(g)):
        return _fe(open_form, ws)

    @r.post("/refresh")
    def _r(b: DateIn, ws=Depends(g)):
        return _fe(refresh, ws, b.date)

    @r.post("/read")
    def _rd(ws=Depends(g)):
        return _fe(read, ws)

    @r.post("/confirm")
    def _c(b: LoopIn, ws=Depends(g)):
        ok(b); return _fe(confirm, ws, b.ids, b.current, b.answers)

    @r.post("/delete")
    def _d(b: LoopIn, ws=Depends(g)):
        ok(b); return _fe(delete, ws, b.grid, b.ids, b.current, b.answers)

    return r
