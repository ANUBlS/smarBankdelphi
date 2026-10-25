"""Exchange Manager chunk 3 - the set-up forms of Packages/ExchangeMGR-NBC reachable from the Delphi UI:

* 'Valyuta D. M.' toolbar: Əlavə et (ToolBtnAddClick2 :1649 -> UnitAddExch), Redaktə et (ToolBtnEditClick2 :1712 ->
  UnitEditExch), Ləğv et (ToolBtnDeleteClick2 :1679), Parametrlər (ToolButton31Click :3259 -> UnitParametr),
  Hesabların sazlanması (ToolButton17Click :2105 -> UnitExchAccount -> UnitExAccModify). All but the account list are
  'SMART' only (UpperCase(Session.LogonUsername) = 'SMART', else 'Hüququnuz Yoxdur!').
* 'Resurslar' toolbar: PopupMenuResurs -> GivingResurs (:648 -> UnitResursGive), ReturnResurs (:1506 ->
  UnitResursReturn), Təsdiq etmə (ToolButton34Click :3276), Ləğv et (ToolButton38Click :3290).
* 'Əməliyyatlar' toolbar: Qalıqlar (TlBOstatClick2 :1635 -> UnitRemainder).
* 'Filiallar üzrə məzənnələr': DBNavigator1 (Edit / Post / Cancel / Refresh on ODSRatesFilial, OnClick = DBNavRateClick2
  :1354, ODSRatesFilialAfterPost UnitDateExch.pas:541) - the only rate editing reachable in Delphi.

Not reachable in Delphi, so not exposed: UnitRate (BitBtn1 'Yeni məzənnələr' Visible = False), UNITRATEOPEN
(ToolButton29Click body commented out, button Visible = False), UnitAdmin (ToolButton25 Visible = False), DBNavRate
(Visible = False), the resource edit button ToolButton48 (Visible = False -> VResInsert/VRetrunInsert are always False).

Commit timing as in Delphi: none of the EXCH_MGR set-up calls is followed by a Commit except ToolButton34Click
(VDMResursTransaction) and the ODSRatesFilial post (DOA CommitOnPost).
"""
from __future__ import annotations
import datetime
import os

from fastapi import APIRouter, Depends
from pydantic import BaseModel, Field

from . import em_sql as Q
from .db import DBError
from .db.base import Out
from .delphi import date_only
from .em_trans import check_right, first_by, remainder
from .exchangemgr import CLSID, PKG, SBOP, rows, remainder_rows, with_exname

SMART = "SMART"
# ExchangeBalance.ini [DefaultBalance] Bal_Manat / Bal_Valuta / Bal_Gelir / Bal_Zerer and Exchange.ini [DefaultBalance]
# Balance_Main_Debt / Balance_Main_Cred - local files next to the Delphi exe (UnitExAccModify.pas FormActivate);
# empty -> '-1'.
INI = {"Bal_Manat": "EM_BAL_MANAT", "Bal_Valuta": "EM_BAL_VALUTA", "Bal_Gelir": "EM_BAL_GELIR", "Bal_Zerer": "EM_BAL_ZERER",
       "Bal_KassaM": "EM_BALANCE_MAIN_DEBT", "Bal_KassaV": "EM_BALANCE_MAIN_CRED"}
RF_COLS = ("VAL_PURCHASE_COURSE_USER", "VAL_SELLING_COURSE_USER", "CASHLESS_PURCHASE_COURSE", "CASHLESS_SELLING_COURSE")  # DBGrid3 editable columns
GIVE_TEXT = "VDM-ə dövriyyədən vəsaitin verilməsi"           # UnitResursGive.pas Button1Click Descript
RETURN_TEXT = "VDM-dən resursun geri qaytarılması"            # UnitResursReturn.pas Button1Click Descript


def ini(name: str) -> str:
    v = os.getenv(INI[name], "")
    return "-1" if v.strip() == "" else v


def is_smart(c) -> bool:
    return (getattr(c, "username", "") or "").upper() == SMART


def no_right():
    return {"done": False, "message": "em.err_no_right"}                 # Application.MessageBox('Hüququnuz Yoxdur!', ...)


def str_to_int(s: str) -> int:
    t = (s or "").strip()
    if not t.lstrip("+-").isdigit():
        raise ValueError(f"'{s or ''}' is not a valid integer value")
    return int(t)


def null_int(v, what="Integer"):
    """KeyValue (Variant) assigned to an Integer: Null -> EVariantTypeCastError."""
    if v is None:
        raise ValueError(f"Could not convert variant of type (Null) into type ({what})")
    return int(v)


def offices(c):
    o = rows(c.query(Q.DM_ODSExchOffice))
    fil = {f.get("ID"): f.get("NAME") for f in c.query(Q.DM_ODSFilial)}
    for x in o:
        x["filialname"] = fil.get(x.get("filial"))
    return o


def filials(c):
    return rows(c.query(Q.DM_ODSFilial))


# ------------------------------------------------------------------ models
class OfficeIn(BaseModel):
    ex_no: str = Field("", max_length=12)          # Edit_ex_no.Text (StrToInt)
    ex_name: str = Field("", max_length=200)
    ex_address: str = Field("", max_length=300)
    ex_worker_name: str = Field("", max_length=200)
    ex_check_no: str = Field("", max_length=100)
    filial: int | None = None                      # DBLookupComboBox1.KeyValue
    id: int | None = None                          # ODSExchOffice 'id' (edit)


class IdIn(BaseModel):
    id: int | None = None
    confirmed: bool = False


class AccOpenIn(BaseModel):
    ex_no: int | None = None
    mode: int = Field(1, ge=1, le=2)               # FormAccount.EditOrInsert 1 insert / 2 edit
    acc_id: int | None = None                      # ODSExchAcc current row id
    confirmed: bool = False                        # MessageDLG mrYes (delete)


class AccCurIn(BaseModel):
    val_id: int | None = None
    filial: int | None = None


class AccSaveIn(BaseModel):
    mode: int = Field(1, ge=1, le=2)
    ex_no: int | None = None
    acc_id: int | None = None
    val_id: int | None = -1                        # DBCBoxValute.KeyValue
    val_name: str = Field("", max_length=10)
    purchase_acc_id: int | None = None
    selling_acc_id: int | None = None
    profit_acc_id: int | None = None
    harm_acc_id: int | None = None
    cash_acc_id: int | None = None
    pur_acc_id: int | None = None


class ParamIn(BaseModel):
    user_id: int | None = None                     # ODSParametr ID (master of ODSExAdminIn)
    user_name: str = Field("", max_length=60)
    ex_no: int | None = None                       # ODSExOffice EX_NO (DBGrid2 current row)


class RemIn(BaseModel):
    ex_no: int | None = None
    dat: datetime.date                             # FormRemainder.DateTimePicker1


class ResIn(BaseModel):
    ex_no: int | None = None
    dat: datetime.date                             # ExchangeMGR_X.DateTimePicker5 (Daydat)
    sdat: datetime.date | None = None              # SBOPDate.get_date (ODSExRemainder :sdat)
    rem_dat: datetime.date | None = None           # DTP_System_Date (ODSExRemainder :dat)
    rtitle: str = Field("dat", max_length=30)
    val_id: int | None = -1                        # DBLookupComboBox2.KeyValue (-1 after FormShow)
    val_name: str = Field("", max_length=10)
    amount: float = 0                              # CMCurrencyEdit1.Value
    next_day: bool = False                         # CheckBox1 'Növbəti gün'
    next_dat: datetime.date | None = None          # DBDateTimeEditEh1.Value
    id: int | None = None                          # ODSResurs current row (Confirm / Delete)
    confirmed: bool = False


class RfNavIn(BaseModel):
    button: str = Field(pattern="^(edit|cancel|refresh)$")
    ex_id: int = -1
    dat: datetime.date


class RfPostIn(BaseModel):
    rowid: str = Field(max_length=40)
    changes: dict[str, float | None]
    ex_id: int = -1                                # DBLookupComboBox2 (refresh)
    dat: datetime.date


# ------------------------------------------------------------------ offices
def office_add(c, b: OfficeIn):
    """SpBtnOkClick UnitAddExch.pas: v_ex_no := StrToInt(Edit_ex_no.Text) (error -> the form stays open);
    T := ex_office_add(...); ODSExchOffice.Refresh; no Commit; Close."""
    ex_no = str_to_int(b.ex_no)
    filial = null_int(b.filial)
    # (Trim(Edit_ex_no.Text)<>'0') or (Trim(Edit_ex_no.Text)<>'') is always true
    c.call_func(PKG, "ex_office_add", [ex_no, b.ex_name, b.ex_address, b.ex_worker_name, b.ex_check_no, filial], int)
    return {"done": True, "offices": offices(c)}


def office_get(c, v_id):
    """TFormEditExch.FormCreate: get_ex_office_out_params(v_id, parInteger, parString x4, parinteger) + GetParameter(1..6)."""
    o = c.plsql_out(f"begin {PKG}.get_ex_office_out_params(:v_id, :p1, :p2, :p3, :p4, :p5, :p6); end;",
                    {"v_id": v_id, "p1": Out(int), "p2": Out(str), "p3": Out(str), "p4": Out(str), "p5": Out(str), "p6": Out(int)})
    return {"ex_no": o["p1"], "ex_name": o["p2"], "ex_address": o["p3"], "ex_worker_name": o["p4"], "ex_check_no": o["p5"], "filial": o["p6"]}


def office_edit(c, b: OfficeIn):
    """SpBtnOkClick UnitEditExch.pas: ex_office_edit(v_id, v_ex_no, ...); ODSExchOffice.Refresh; no Commit."""
    ex_no = str_to_int(b.ex_no)
    filial = null_int(b.filial)
    c.call_proc(PKG, "ex_office_edit", [b.id, ex_no, b.ex_name, b.ex_address, b.ex_worker_name, b.ex_check_no, filial], commit=False)
    return {"done": True, "offices": offices(c)}


# ------------------------------------------------------------------ accounts (UnitExchAccount / UnitExAccModify)
def acc_rows(c, ex_no):
    return rows(c.query(Q.DM_ODSExchAcc, {"ex_id": ex_no}))


def acc_lists(c, filial, val_id):
    """FormActivate (UnitExAccModify.pas): ODSAcc_main_debt (Bal_Manat), ODSAcc_child_debt (Bal_Gelir), ODSAcc_child_cred
    (Bal_Zerer), ODSCashDebt (Bal_KassaM), ODSAcc_main_cred (Bal_Valuta, val_id), ODSCashKredit (Bal_KassaV, val_id)."""
    q = lambda sql, bal, **kw: rows(c.query(sql, {"balance": ini(bal), "filial": filial, **kw}))   # noqa: E731
    return {"main_debt": q(Q.DM_ODSAcc_main_debt, "Bal_Manat"), "child_debt": q(Q.DM_ODSAcc_child_debt, "Bal_Gelir"),
            "child_cred": q(Q.DM_ODSAcc_child_cred, "Bal_Zerer"), "cash_debt": q(Q.DM_ODSCashDebt, "Bal_KassaM"),
            **cred_lists(c, filial, val_id)}


def cred_lists(c, filial, val_id):
    """ODSAcc_main_cred / ODSCashKredit (balance stays Bal_Valuta / Bal_KassaV - DBCBoxValuteClick only resets val_id, filial)."""
    return {"main_cred": rows(c.query(Q.DM_ODSAcc_main_cred, {"balance": ini("Bal_Valuta"), "val_id": val_id, "filial": filial})),
            "cash_kredit": rows(c.query(Q.DM_ODSCashKredit, {"balance": ini("Bal_KassaV"), "val_id": val_id, "filial": filial}))}


def acc_open(c, b: AccOpenIn):
    """ToolBtnAddChildClick (SMART + Check_UserRole + office not empty) / ToolBtnEditChildClick (SMART + office not empty)
    -> TFormExAccModify.Create + ShowModal -> FormActivate."""
    if not is_smart(c):
        return no_right()
    if b.mode == 1 and not c.call_bool(PKG, "Check_UserRole", [c.username.upper()]):
        return {"done": False}                                  # Check_UserRole = false -> nothing happens
    office = first_by(rows(c.query(Q.DM_ODSExchOffice)), "ex_no", b.ex_no)
    if office is None:                                          # ODSExchOffice.IsEmpty
        return {"done": False}
    cur = first_by(acc_rows(c, b.ex_no), "id", b.acc_id) or {}
    valutes = rows(c.query(Q.DM_ODSExchRateAll))               # ODSExchRateAll.Refresh (DBCBoxValute list)
    filial = office.get("filial")                               # all_filial.KeyValue := ODSExchOffice filial
    out = {"done": True, "valutes": valutes, "filials": filials(c), "filial": filial}
    if b.mode == 1:
        # KeyValue := -1 for DBCBoxValute and every account combo except CB_Selling_Acc_No (new form -> Null)
        out.update(acc_lists(c, filial, -1), val_id=-1, sel={k: (None if k == "selling" else -1) for k in ("purchase", "selling", "profit", "harm", "cash", "pur")})
    else:
        val_id = int(cur.get("val_id") or 0)                    # ODSExchAcc.FieldByName('val_id').AsInteger
        out.update(acc_lists(c, filial, val_id), val_id=val_id,
                   sel={k: cur.get(f"{k}_acc_id") for k in ("purchase", "selling", "profit", "harm", "cash", "pur")})
    return out


def acc_save(c, b: AccSaveIn):
    """BtnOkClick (UnitExAccModify.pas): KeyValue <> -1 -> ex_accounts_add (function) / ex_accounts_edit; ODSExchAcc.Refresh;
    no Commit; Close. A Null account KeyValue raises before the call (the form stays open)."""
    if b.val_id == -1:
        return {"done": True, "acc": acc_rows(c, b.ex_no)}
    ids = [null_int(getattr(b, k)) for k in ("val_id", "purchase_acc_id", "selling_acc_id", "profit_acc_id", "harm_acc_id",
                                              "cash_acc_id", "pur_acc_id")]
    if b.mode == 1:
        c.call_func(PKG, "ex_accounts_add", [b.ex_no, ids[0], b.val_name, *ids[1:]], int)
    else:
        c.call_proc(PKG, "ex_accounts_edit", [b.acc_id, b.ex_no, ids[0], b.val_name, *ids[1:]], commit=False)
    return {"done": True, "acc": acc_rows(c, b.ex_no)}


# ------------------------------------------------------------------ resources
def resurs_rows(c, b: ResIn):
    return rows(c.query(Q.DM_ODSResurs, {"ex_id": b.ex_no, "vdat": date_only(b.dat), "title": b.rtitle}))


def fil(c, ex_no):
    """FilNumber := ODSVdmResurs ex_no (Master ODSExchOffice ex_no -> ex_id) .AsInteger; FilName := ODSExchOffice ex_name."""
    v = rows(c.query(Q.DM_ODSVdmResurs, {"ex_id": ex_no}))
    o = first_by(rows(c.query(Q.DM_ODSExchOffice)), "ex_no", ex_no) or {}
    return int(v[0].get("ex_no") or 0) if v else 0, o.get("ex_name") or ""


def resurs_give(c, b: ResIn):
    """Button1Click UnitResursGive.pas (VResInsert = False): VDMResursInsert(ValNumber, ValName, FilNumber, FilName, Amount,
    Daydat, Nextday, 1, 1, Nextstatus, Descript); ODSResurs.Refresh; no Commit."""
    if b.val_id is None:
        return {"done": False, "message": "em.err_choose_currency"}       # 'Valyutanı seçin!...'
    if b.amount == 0:
        return {"done": False, "message": "em.err_enter_amount"}          # 'Məbləği daxil edin !...'
    if b.next_day and b.next_dat is None:
        return {"done": False, "message": "em.err_enter_date"}            # 'Tarixi daxil edin !...'
    nextday, nextstatus = (date_only(b.next_dat), 1) if b.next_day else (None, 0)
    fno, fname = fil(c, b.ex_no)
    c.call_proc(PKG, "VDMResursInsert", [b.val_id, b.val_name, fno, fname, b.amount, date_only(b.dat), nextday,
                                         1, 1, nextstatus, GIVE_TEXT], commit=False)
    return {"done": True, "resurs": resurs_rows(c, b)}


def resurs_return(c, b: ResIn):
    """Button1Click UnitResursReturn.pas (VRetrunInsert = False): VDMRetrunResursInsert(ValNumber, ValName, FilNumber,
    FilName, Amount, Daydat, 2, 1, Descript); ODSResurs.Refresh; no Commit."""
    if b.val_id is None:
        return {"done": False, "message": "em.err_choose_currency"}
    if b.amount == 0:
        return {"done": False, "message": "em.err_enter_amount"}
    fno, fname = fil(c, b.ex_no)
    c.call_proc(PKG, "VDMRetrunResursInsert", [b.val_id, b.val_name, fno, fname, b.amount, date_only(b.dat),
                                               2, 1, RETURN_TEXT], commit=False)
    return {"done": True, "resurs": resurs_rows(c, b)}


def remainder_form(c, b: RemIn):
    """TFormRemainder.ToolButton1Click (FormShow + 'Yeniləmək'): ODS_ExRemain SQL by sdat/dat/Ex_Calendar/LastWorkDay_Calendar;
    no matching branch -> empty SQL -> Open fails. CURRENT_OSTAT = ODS_ExRemainCalcFields."""
    dat = date_only(b.dat)
    sdat = date_only(c.call_func(SBOP, "get_date", [], datetime.datetime))
    cal = c.call_bool(PKG, "Ex_Calendar", [dat])
    last = date_only(c.call_func(PKG, "LastWorkDay_Calendar", [dat], datetime.datetime))
    if (sdat >= dat) or (sdat < dat and cal and sdat == last) or (sdat < dat and ((not cal) or sdat < last)):
        return {"rows": remainder_rows(c.cursor_block(Q.SQL_EX_REMAINDER, "result", {"dat": dat, "ex_id": b.ex_no, "sdat": sdat}))}
    raise DBError("ORA-00900: invalid SQL statement")


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/exchangemgr/setup")
    g = require_module(CLSID)

    def run(fn):
        try:
            return fn()
        except DBError as e:
            err(400, "em.err_db", msg=e.message)
        except ValueError as e:
            err(400, "em.err_db", msg=str(e))

    # ---------------- offices
    @r.post("/office/add-open")
    def _add_open(ws=Depends(g)):
        """ToolBtnAddClick2: SMART -> ODSFilial.Close/Open -> FormAddExch (FormActivate clears the edits,
        DBLookupComboBox1.KeyValue := ODSFilial 'Id' of the current = first record)."""
        c = ws.conn
        if not is_smart(c):
            return no_right()
        f = filials(c)
        return {"done": True, "filials": f, "filial": f[0]["id"] if f else 0}

    @r.post("/office/add")
    def _add(b: OfficeIn, ws=Depends(g)):
        if not is_smart(ws.conn):
            return no_right()
        return run(lambda: office_add(ws.conn, b))

    @r.post("/office/edit-open")
    def _edit_open(b: IdIn, ws=Depends(g)):
        """ToolBtnEditClick2: SMART -> ODSFilial -> FormEditExch. The Delphi form reads get_ex_office_out_params once, in
        FormCreate (before ODSExchOffice is open); the web reads it for the current office every time it opens."""
        c = ws.conn
        if not is_smart(c):
            return no_right()
        return run(lambda: {"done": True, "filials": filials(c), **office_get(c, b.id)})

    @r.post("/office/edit")
    def _edit(b: OfficeIn, ws=Depends(g)):
        if not is_smart(ws.conn):
            return no_right()
        return run(lambda: office_edit(ws.conn, b))

    @r.post("/office/delete")
    def _delete(b: IdIn, ws=Depends(g)):
        """ToolBtnDeleteClick2: SMART -> 'Silmək istəyirsiniz? ' -> ex_office_delete(id); ODSExchOffice.Refresh; no Commit."""
        c = ws.conn
        if not is_smart(c):
            return no_right()
        if not b.confirmed:
            return {"done": False, "ask": True}
        return run(lambda: (c.call_proc(PKG, "ex_office_delete", [b.id], commit=False), {"done": True, "offices": offices(c)})[1])

    # ---------------- accounts
    @r.post("/acc/list")
    def _acc_list(b: AccOpenIn, ws=Depends(g)):
        """ToolButton17Click -> TFormAccount.Create + ShowModal; FormShow: ODSExchAcc.Close/Open (no right check)."""
        return {"acc": acc_rows(ws.conn, b.ex_no)}

    @r.post("/acc/refresh")
    def _acc_refresh(b: AccOpenIn, ws=Depends(g)):
        """ToolButton19Click 'Yenilə' (SMART only)."""
        if not is_smart(ws.conn):
            return no_right()
        return {"done": True, "acc": acc_rows(ws.conn, b.ex_no)}

    @r.post("/acc/open")
    def _acc_open(b: AccOpenIn, ws=Depends(g)):
        return run(lambda: acc_open(ws.conn, b))

    @r.post("/acc/currency")
    def _acc_cur(b: AccCurIn, ws=Depends(g)):
        """DBCBoxValuteClick: ODSAcc_main_cred / ODSCashKredit re-open with the new val_id."""
        return cred_lists(ws.conn, b.filial, b.val_id)

    @r.post("/acc/save")
    def _acc_save(b: AccSaveIn, ws=Depends(g)):
        if not is_smart(ws.conn):
            return no_right()
        return run(lambda: acc_save(ws.conn, b))

    @r.post("/acc/delete")
    def _acc_delete(b: AccOpenIn, ws=Depends(g)):
        """ToolBtnDeleteChClick: SMART -> 'Silmək istəyirsiniz? ' -> ex_accounts_delete(id); ODSExchAcc.Refresh; no Commit."""
        c = ws.conn
        if not is_smart(c):
            return no_right()
        if not b.confirmed:
            return {"done": False, "ask": True}
        return run(lambda: (c.call_proc(PKG, "ex_accounts_delete", [b.acc_id], commit=False), {"done": True, "acc": acc_rows(c, b.ex_no)})[1])

    @r.post("/role")
    def _role(ws=Depends(g)):
        """TBGBClick / ToolButton15Click2 'Sazlama': SMART + Check_UserRole -> ShellExecute of the local .ini file
        (not available in a browser - the page shows a notice)."""
        c = ws.conn
        if not is_smart(c):
            return no_right()
        return run(lambda: {"done": bool(c.call_bool(PKG, "Check_UserRole", [c.username.upper()]))})

    # ---------------- parameters (UnitParametr)
    @r.post("/param/open")
    def _param_open(ws=Depends(g)):
        """ToolButton31Click: ODSExOffice / ODSExAdminIn / ODSParametr open, then SMART -> FormParametr."""
        c = ws.conn

        def go():
            off = rows(c.query(Q.DM_ODSExOffice))
            users = rows(c.query(Q.DM_ODSParametr))
            if not is_smart(c):
                return no_right()
            uid = users[0]["id"] if users else None
            return {"done": True, "offices": off, "users": users, "admin_in": rows(c.query(Q.DM_ODSExAdminIn, {"USER_ID": uid}))}
        return run(go)

    @r.post("/param/admin-in")
    def _param_ai(b: ParamIn, ws=Depends(g)):
        """ODSExAdminIn (Master ODSParametr ID -> USER_ID) on DBGrid1 scroll."""
        return {"admin_in": rows(ws.conn.query(Q.DM_ODSExAdminIn, {"USER_ID": b.user_id}))}

    @r.post("/param/add")
    def _param_add(b: ParamIn, ws=Depends(g)):
        """DBGrid2DblClick / Enter: Ex_Admin_In_Add(ODSParametr ID, ODSExOffice Filial, ODSParametr NAME, EX_NO, EX_NAME); no Commit."""
        c = ws.conn
        if not is_smart(c):
            return no_right()

        def go():
            o = first_by(rows(c.query(Q.DM_ODSExOffice)), "ex_no", b.ex_no) or {}
            c.call_proc(PKG, "Ex_Admin_In_Add", [b.user_id or 0, o.get("filial") or 0, b.user_name, o.get("ex_no") or 0, o.get("ex_name") or ""], commit=False)
            return {"admin_in": rows(c.query(Q.DM_ODSExAdminIn, {"USER_ID": b.user_id}))}
        return run(go)

    @r.post("/param/del")
    def _param_del(b: ParamIn, ws=Depends(g)):
        """DBGrid3DblClick / Delete key: Ex_Admin_in_Del(USER_ID, USER_NAME, EX_ID, EX_NAME) of the ODSExAdminIn row; no Commit."""
        c = ws.conn
        if not is_smart(c):
            return no_right()

        def go():
            a = first_by(rows(c.query(Q.DM_ODSExAdminIn, {"USER_ID": b.user_id})), "ex_id", b.ex_no)
            if a is not None:
                c.call_proc(PKG, "Ex_Admin_in_Del", [a.get("user_id") or 0, a.get("user_name") or "", a.get("ex_id") or 0, a.get("ex_name") or ""], commit=False)
            return {"admin_in": rows(c.query(Q.DM_ODSExAdminIn, {"USER_ID": b.user_id}))}
        return run(go)

    # ---------------- Qalıqlar (UnitRemainder)
    @r.post("/remainder")
    def _rem(b: RemIn, ws=Depends(g)):
        return run(lambda: remainder_form(ws.conn, b))

    # ---------------- resources
    @r.post("/resurs/give-open")
    def _give_open(b: ResIn, ws=Depends(g)):
        """GivingResursClick: checkadvancedobjectaccess('EXCH_RESURSINSERT') -> FormGivenResurs (FormShow clears)."""
        c = ws.conn
        return run(lambda: (check_right(c, "EXCH_RESURSINSERT"),
                            {"done": True, "valutes": rows(c.query(Q.DM_ODSResursValyuta)),
                             "vdm": (rows(c.query(Q.DM_ODSVdmResurs, {"ex_id": b.ex_no})) or [{}])[0].get("ex_name")})[1])

    @r.post("/resurs/give")
    def _give(b: ResIn, ws=Depends(g)):
        return run(lambda: resurs_give(ws.conn, b))

    @r.post("/resurs/return-open")
    def _ret_open(b: ResIn, ws=Depends(g)):
        """ReturnResursClick: checkadvancedobjectaccess('EXCH_RETRUNRESURSINSERT') -> FormResursRetrun."""
        c = ws.conn
        return run(lambda: (check_right(c, "EXCH_RETRUNRESURSINSERT"),
                            {"done": True, "valutes": rows(c.query(Q.DM_ODSRResursValyuta)),
                             "vdm": (rows(c.query(Q.DM_ODSVdmRResurs, {"ex_id": b.ex_no})) or [{}])[0].get("ex_name")})[1])

    @r.post("/resurs/return-amount")
    def _ret_amount(b: ResIn, ws=Depends(g)):
        """DBLookupComboBox2CloseUp: ODSExRemainder filtered (val_id=N) and (ex_id=EX_NO) -> CURRENT_OSTAT.AsVariant."""
        c = ws.conn

        def go():
            rem = remainder(c, b.ex_no, b.rem_dat or b.dat, b.sdat or b.dat)
            row = next((x for x in rem if b.val_id is not None and x.get("val_id") == b.val_id and x.get("ex_id") == b.ex_no), None)
            if row is None:                                     # empty filter -> CURRENT_OSTAT.AsVariant = Null -> Text
                raise ValueError("Could not convert variant of type (Null) into type (UnicodeString)")
            return {"amount": row["current_ostat"]}
        return run(go)

    @r.post("/resurs/return")
    def _ret(b: ResIn, ws=Depends(g)):
        return run(lambda: resurs_return(ws.conn, b))

    @r.post("/resurs/confirm")
    def _res_confirm(b: ResIn, ws=Depends(g)):
        """ToolButton34Click: EXCH_RESURSCOMMIT; RecordCount = 0 / commitstatus = 2 -> exit; VDMResursTransaction(id); Commit."""
        c = ws.conn

        def go():
            check_right(c, "EXCH_RESURSCOMMIT")
            row = first_by(resurs_rows(c, b), "id", b.id)
            if row is None or row.get("commitstatus") == 2:
                return {"done": False}
            c.call_proc(PKG, "VDMResursTransaction", [b.id], commit=False)
            c.commit()
            return {"done": True, "resurs": resurs_rows(c, b)}
        return run(go)

    @r.post("/resurs/delete")
    def _res_delete(b: ResIn, ws=Depends(g)):
        """ToolButton38Click: commitstatus = 1 and 'Geri qaytarılımış resurs silmək istəyirsiniz? ' -> VDMResursDelete(id);
        ODSResurs.Refresh; no Commit."""
        c = ws.conn

        def go():
            row = first_by(resurs_rows(c, b), "id", b.id)
            if row is None or row.get("commitstatus") != 1:
                return {"done": False}
            if not b.confirmed:
                return {"done": False, "ask": True}
            c.call_proc(PKG, "VDMResursDelete", [b.id], commit=False)
            return {"done": True, "resurs": resurs_rows(c, b)}
        return run(go)

    # ---------------- Filiallar üzrə məzənnələr - DBNavigator1
    @r.post("/rates-filial/nav")
    def _rf_nav(b: RfNavIn, ws=Depends(g)):
        """DBNavigator1 nbEdit / nbCancel / nbRefresh: the dataset action, then OnClick DBNavRateClick2 ->
        checkadvancedobjectaccess('EXCH_UPDATE') (an error is only shown - the action has already happened)."""
        c = ws.conn
        out = {"message": None}
        if b.button == "refresh":                               # ODSRatesFilial.Refresh
            out["rates_filial"] = with_exname(c, rows(c.query(Q.sql_rates_filial(b.ex_id), {"dat": date_only(b.dat)})))
        try:
            check_right(c, "EXCH_UPDATE")
        except DBError as e:
            out["message"] = e.message
        return out

    @r.post("/rates-filial/post")
    def _rf_post(b: RfPostIn, ws=Depends(g)):
        """nbPost: DOA update of the modified columns by ROWID + CommitOnPost; AfterPost and OnClick then call
        checkadvancedobjectaccess('EXCH_UPDATE') (after the commit, as in Delphi)."""
        c = ws.conn
        cols = [k.upper() for k in b.changes]
        if not cols or any(k not in RF_COLS for k in cols):
            err(400, "em.err_db", msg="invalid column")

        def go():
            sets = ", ".join(f"{k} = :{k}" for k in cols)
            c.execute(f"update EX_RATES_FILIAL set {sets} where rowid = :doa__rowid",
                      {**{k.upper(): v for k, v in b.changes.items()}, "doa__rowid": b.rowid})
            c.commit()
            msg = None
            try:
                check_right(c, "EXCH_UPDATE")                   # ODSRatesFilialAfterPost
                check_right(c, "EXCH_UPDATE")                   # DBNavRateClick2
            except DBError as e:
                msg = e.message
            rf = with_exname(c, rows(c.query(Q.sql_rates_filial(b.ex_id), {"dat": date_only(b.dat)})))
            return {"done": True, "message": msg, "rates_filial": rf}
        return run(go)

    return r
