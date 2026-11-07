"""Exchange Manager chunk 2 - the 'Əməliyyatlar' operations of Packages/ExchangeMGR-NBC:
PopupMenu 'Əlavə et' -> Purchase (PurchaseClick2, Unit_ExchangeMGR.pas:1487-1504 + UnitPurchase.pas) / Selling (SellingClick2
:1513-1530 + UnitSelling.pas), 'Təsdiq etmə' (ToolButton27Click :2888-3252) and 'Ləğv et' (ToolButton6Click2 :2118-2138).

Not exposed, as in Delphi: the third menu item ExchangeCurrency (UnitExchange, Unit_ExchangeMGR.dfm:4593 Visible = False),
TBtnEditTrans (Visible = False and its body is commented out, so sePurchaseEdit / seSellingEdit / seExchangeEdit are never
reached) and TBReturnTransClose 'Status' (Visible = False).

Commit timing as in Delphi: BtnRunClick commits after the package calls (sboapiDataModule.SBSession.Commit,
UnitPurchase.pas:509, UnitSelling.pas) and rolls back on any exception; Confirm and Delete commit after the call; the
Confirm handler has no try/except (an error leaves the transaction open, as in Delphi).
"""
from __future__ import annotations
import datetime
import re

from fastapi import APIRouter, Depends
from pydantic import BaseModel, Field

from . import em_sql as Q
from .db import DBError
from .delphi import date_only
from .exchangemgr import CLSID, PKG, SBOP, TITLE_DEFAULT, remainder_rows, rows

TRANS_PKG = "EXCH_TRANS"                      # UnitDateExch.dfm:528-530 sb_transaction
ACA = "SB_ACA"                                # UnitDateExch.dfm:802-804 SBA_ACA
# UnitPurchase.pas:480 / UnitSelling.pas 'if C=0 then' - C is a local Integer that is never assigned (the line
# 'C:=OPExchMgr.CallIntegerFunction('Ex_CourseRates',...)' is commented out), so whether Delphi posts the entries
# right after the insert is undefined. The web treats C as <> 0: the operation is saved with trans_close = 0 and is
# posted by 'Təsdiq etmə' (ToolButton27Click). Set to True to call ex_transaction right after the insert instead.
INSERT_POSTS = False
PURCHASE, SELLING = "purchase", "selling"
RIGHT_OPEN = {PURCHASE: "EXCH_BUYINSERT", SELLING: "EXCH_SELLINSERT"}   # :1491 / :1517
STATUS = {PURCHASE: 1, SELLING: 2}                                       # const ex_status
TEXT = {PURCHASE: " KURSLA ALIŞI ", SELLING: " KURSLA SATIŞI "}          # purchase_status / selling_status
CUST_SETS = (("cust_confirm", Q.DM_ODSCust_Confirm), ("cust_country", Q.DM_ODSCust_Country), ("cust_father", Q.DM_ODSCust_Father),
             ("cust_lname", Q.DM_ODSCust_LName), ("cust_name", Q.DM_ODSCust_Name), ("cust_giving_member", Q.DM_ODSGiving_Member))
_FLOAT = re.compile(r"[+-]?(\d+\.?\d*|\.\d+)([eE][+-]?\d+)?")


def float_to_str(v) -> str:
    """SysUtils.FloatToStr: 15 significant digits (ffGeneral, Precision 15)."""
    if v is None:
        return ""
    s = "%.15G" % float(v)
    if "E" in s:
        m, e = s.split("E")
        s = m + "E" + ("-" if e.startswith("-") else "+") + e.lstrip("+-").lstrip("0").rjust(1, "0")
    return s


def str_to_float(s: str | None) -> float:
    """SysUtils.StrToFloat (DecimalSeparator '.'): EConvertError text on a bad value."""
    t = (s or "").strip()
    if not _FLOAT.fullmatch(t):
        raise ValueError(f"'{s or ''}' is not a valid floating point value")
    return float(t)


# ------------------------------------------------------------------ UnitProcAndFunc.pas:211-334 SumNumToFull
_H = {1: "YÜZ ", 2: "İKİ YÜZ ", 3: "ÜÇ YÜZ ", 4: "DÖRD YÜZ ", 5: "BEŞ YÜZ ", 6: "ALTI YÜZ ", 7: "YEDDİ YÜZ ", 8: "SƏKKİZ YÜZ ", 9: "DOQQUZ YÜZ "}
_T1 = {10: "ON ", 11: "ON BİR ", 12: "ON İKİ ", 13: "ON ÜÇ ", 14: "ON DÖRD ", 15: "ON BEŞ ", 16: "ON ALTI ", 17: "ON YEDDİ ", 18: "ON SƏKKİZ ", 19: "ON DOQQUZ "}
_T = {2: "İYİRMİ ", 3: "OTUZ ", 4: "QIRX ", 5: "ƏLLİ ", 6: "ALTMIŞ ", 7: "YETMİŞ ", 8: "SƏKSƏN ", 9: "DOXSAN"}   # 'DOXSAN' without the blank, as in Delphi
_U = {1: "BİR ", 2: "İKİ ", 3: "ÜÇ ", 4: "DÖRD ", 5: "BEŞ ", 6: "ALTI ", 7: "YEDDİ ", 8: "SƏKKİZ ", 9: "DOQQUZ "}


def _div(a: int, b: int) -> int:                                  # Pascal div (truncates toward zero)
    return int(a / b) if b else 0


def sum_num_to_full(number: float) -> str:
    part, d, r = 0, 1000000, 4
    trunc = int(number)
    if trunc != 0:
        while True:
            part = _div(trunc, d)
            r -= 1
            d = _div(d, 1000)
            if part != 0:
                break
    else:
        r = 0
    s = ""
    for i in range(r, 0, -1):
        flag11 = False
        s += _H.get(_div(part, 100), "")
        tmp = _div(part % 100, 10)
        if tmp == 1:
            s += _T1.get(part % 100, "")
            s += {3: "MİLİYON ", 2: "MİN "}.get(i, "")
            flag11 = True
        else:
            s += _T.get(tmp, "")
        tmp = part % 10
        if not flag11:
            s += _U.get(tmp, "")
            if i == 3:
                s += "MİLİYON "
            elif i == 2 and (tmp in (1, 2, 3, 4) or part != 0):
                s += "MİN "
        if i > 1:
            part = _div(trunc % (d * 1000), d) if d else 0
            d = _div(d, 1000)
    return s


# ------------------------------------------------------------------ models
class TransBase(BaseModel):
    ex_no: int | None = None                       # ODSExchOfficeEX_NO (GridMaster current row)
    dat: datetime.date                             # DTP_System_Date (ODSExRemainder / ODSExchRate :dat)
    sdat: datetime.date
    title: str = Field(TITLE_DEFAULT, max_length=30)


class OpenIn(TransBase):
    kind: str = Field(pattern="^(purchase|selling)$")
    rf_ex_id: int = -1                             # current ODSRatesFilial (DBLookupComboBox2) - lookup source
    rf_dat: datetime.date | None = None            # DTP_DateFilial


class CalcIn(BaseModel):
    kind: str = Field(pattern="^(purchase|selling)$")
    amount: str = Field("", max_length=30)         # Edit_Purchase_Amount / Edit_Selling_Amount .Text
    course: str = Field("", max_length=30)         # Edit_purchase_course / Edit_selling_course .Text
    nb_course: str = Field("", max_length=30)      # Edit_nb_course.Text
    val_name: str = Field("", max_length=10)       # DBLC_Currency.ListSource.DataSet val_name


class SaveIn(TransBase):
    kind: str = Field(pattern="^(purchase|selling)$")
    trans_date: datetime.date                      # DTP_Date (ODSSysdatSSDAT, disabled)
    val_id: int | None = None                      # DBLC_Currency.KeyValue
    val_name: str = Field("", max_length=10)       # DBLC_Currency.Text
    amount: str = Field("", max_length=30)
    ekv_amount: str = Field("", max_length=30)     # Edit_Ekv_Amount.Text
    fee_amount: str = Field("", max_length=30)     # Edit_Fee_Amount.Text
    course: str = Field("", max_length=30)
    nb_course: str = Field("", max_length=30)
    setting: str = Field("", max_length=500)       # Edit_Setting.Text (Təyinatı)
    exch_name: str = Field("", max_length=200)     # Edit_Exch (DBEdit EX_NAME)
    cashless: bool = False                         # RadioButton2.Checked
    cust_name: str = Field("", max_length=100)
    cust_lname: str = Field("", max_length=100)
    cust_father: str = Field("", max_length=100)
    cust_passport: str = Field("", max_length=8)   # Edit_Pasport MaxLength = 8
    cust_date: datetime.date | None = None         # Edit_Cust_Date.Value
    cust_confirm: str = Field("", max_length=100)
    cust_giving_member: str = Field("", max_length=100)
    cust_country: str = Field("", max_length=100)
    country: str = Field("AZE", max_length=20)     # Edit_AZE.Text
    val_changed_name: str = Field("AZN", max_length=10)   # Edit_Val_Changed.Text
    val_changed_id: int = 0                        # Edit_Val_Changed.Tag


class RowIn(TransBase):
    id: int                                        # ODSExchProvarch current row id
    confirmed: bool = False                        # MessageDLG answered mrYes (Delete)


# ------------------------------------------------------------------ helpers
def check_right(c, code: str):
    """DataModExch.SBA_ACA.CallProcedure('checkadvancedobjectaccess',[code])."""
    c.call_proc(ACA, "checkadvancedobjectaccess", [code], commit=False)


def first_by(rs, key, value):
    """DOA lookup field: the first row of the lookup dataset whose key matches (None = Null)."""
    return next((r for r in rs if r.get(key) == value), None)


def exch_acc(c, ex_no, dat, rf_ex_id, rf_dat) -> list[dict]:
    """ODSExchAcc (Master ODSExchOffice EX_NO -> EX_ID) with its lookup fields: VAL_PURCHASE_COURSE(_END),
    VAL_SELLING_COURSE(_END), VAL_NB_COURSE from ODSExchRate and val_purchase/selling_course_user,
    cashless_purchase/selling_course from ODSRatesFilial - both looked up by VAL_ID only, in whatever the lookup
    datasets hold at the moment (ODSRatesFilial = the 'Filiallar üzrə məzənnələr' tab's current filial/date)."""
    acc = rows(c.query(Q.DM_ODSExchAcc, {"ex_id": ex_no}))
    rate = rows(c.query(Q.DM_ODSExchRate, {"dat": date_only(dat)}))
    rf = rows(c.query(Q.sql_rates_filial(rf_ex_id), {"dat": date_only(rf_dat or dat)}))
    for a in acc:
        r = first_by(rate, "val_id", a.get("val_id")) or {}
        f = first_by(rf, "val_id", a.get("val_id")) or {}
        for k in ("val_purchase_course", "val_purchase_course_end", "val_selling_course", "val_selling_course_end", "val_nb_course"):
            a[k] = r.get(k)
        a["val_purchase_course_user"] = f.get("val_purchase_course_user")
        a["val_selling_course_user"] = f.get("val_selling_course_user")
        a["cashless_purchase_course"] = f.get("cashless_purchase_course")
        a["cashless_selling_course"] = f.get("cashless_selling_course")
    return acc


def cust_sets(c) -> dict:
    """open_cust_data_sets (Unit_ExchangeMGR.pas:479-491) - the DBLC_* customer lookups (Enabled = False in both forms)."""
    return {k: [next(iter(r.values())) for r in c.query(sql)] for k, sql in CUST_SETS}


def date_change(c, ex_no) -> int:
    """FormActivate (UnitPurchase.pas:716-723, UnitSelling.pas): ex_date_change -> 0 Ex_RemainderProv_Change, 1
    Ex_RemainderLaz_Change, 2 exit (the form keeps its previous contents - ClearEdit is skipped)."""
    f = c.call_func(PKG, "ex_date_change", [], int)
    if f == 0:
        c.call_proc(PKG, "Ex_RemainderProv_Change", [ex_no], commit=False)
    if f == 1:
        c.call_proc(PKG, "Ex_RemainderLaz_Change", [ex_no], commit=False)
    return f


def remainder(c, ex_no, dat, sdat) -> list[dict]:
    return remainder_rows(c.cursor_block(Q.SQL_EX_REMAINDER, "result", {"dat": date_only(dat), "ex_id": ex_no, "sdat": date_only(sdat)}))


def ex_rem_ostat(rem, val_id) -> float:
    """ExRemOstat (UnitPurchase.pas:168-186): ODSExRemainder filtered 'val_id=N' -> current_ostat.AsFloat (0 when empty)."""
    r = first_by(rem, "val_id", val_id)
    return float(r["current_ostat"] or 0) if r else 0.0


def acc_id(v) -> int:
    """OPExchMgr.CallStringFunction(...) assigned to an Integer variable (Variant string -> Integer)."""
    if v is None or str(v).strip() == "":
        raise ValueError(f"Could not convert variant of type ({'Null' if v is None else 'String'}) into type (Integer)")
    return int(str(v).strip())


def ex_transaction(c, fn, args, a_flags):
    """sb_transaction.CallIntegerFunction(fn, [15 positional values]) - the 14th is the Delphi Boolean a_Flags,
    written into the block as a PL/SQL literal (DOA passes Booleans natively)."""
    ph = [f":p{i}" for i in range(len(args))]
    ph.insert(13, "true" if a_flags else "false")
    sql = f"begin :r := {TRANS_PKG}.{fn}({', '.join(ph)}); end;"
    return c.plsql(sql, {f"p{i}": v for i, v in enumerate(args)}, ret=int)


def provarch(c, b: TransBase) -> list[dict]:
    return rows(c.query(Q.DM_ODSExchProvarch, {"ex_id": b.ex_no, "dat": date_only(b.dat), "Title": b.title}))


def refreshed(c, b: TransBase, **extra) -> dict:
    """ODSExchProvarch.Refresh / ODSExchRate.Refresh / ODSExRemainder.Refresh (+ ODSSumTrans, master-detail)."""
    st = c.query(Q.DM_ODSSumTrans, {"ex_id": b.ex_no})
    return {"provarch": provarch(c, b), "rates": rows(c.query(Q.DM_ODSExchRate, {"dat": date_only(b.dat)})),
            "remainder": remainder(c, b.ex_no, b.dat, b.sdat), "sum_fee": (st[0].get("FEE_AMOUNT") if st else None), **extra}


def calc(c, b: CalcIn) -> dict:
    """Edit_Purchase_AmountChange (UnitPurchase.pas:590-643) / Edit_Selling_AmountChange (UnitSelling.pas:553-609):
    Edit_Setting = SumNumToFull(amount)+' '+val_name+' -nin '+course+status text; Ekv = RoundNew(amount*course),
    Fee = abs(RoundNew(amount*course) - RoundNew(amount*nb_course)) - EXCH_MGR.RoundNew; FloatToStr."""
    if b.amount == "":
        return {"setting": "", "ekv_amount": "", "fee_amount": ""}
    amount = str_to_float(b.amount)
    setting = sum_num_to_full(amount) + " " + b.val_name + " -nin " + b.course + TEXT[b.kind]
    ekv_m = amount * str_to_float(b.course)
    fee_r = amount * str_to_float(b.course)
    fee_m = amount * str_to_float(b.nb_course)
    ekv = c.call_func(PKG, "RoundNew", [ekv_m], float)
    fee_rr = c.call_func(PKG, "RoundNew", [fee_r], float)
    fee_mm = c.call_func(PKG, "RoundNew", [fee_m], float)
    return {"setting": setting, "ekv_amount": float_to_str(ekv), "fee_amount": float_to_str(abs(fee_rr - fee_mm))}


def save(c, b: SaveIn, username: str) -> dict:
    """BtnRunClick, sePurchaseInsert (UnitPurchase.pas:305-583) / seSellingInsert (UnitSelling.pas:277-546)."""
    say = sum(1 for v in (b.cust_name, b.cust_lname, b.cust_father, b.cust_confirm, b.cust_giving_member, b.cust_country,
                          b.cust_passport) if v == "") + (1 if b.cust_date is None else 0)
    if say not in (8, 0):
        return {"closed": False, "message": "em.err_cust_incomplete"}       # '   Məlumatlar tam doldurulmayıb     ! '
    sysdate = date_only(c.call_func(SBOP, "get_date", [], datetime.datetime))
    a_flags = sysdate < date_only(b.trans_date)
    if b.val_name == "AZN":                                               # DBLC_Currency.Text<>'AZN' ... else
        return {"closed": False, "message": "em.err_same_currency"}       # 'Valyutalar eynidir!' (the form stays open)
    out = {"closed": True, "message": None}
    try:
        operator_id = c.call_func(PKG, "UserID", [], int)
        trans_date = date_only(b.trans_date)
        debit_amount = str_to_float(b.amount)
        l_amount = str_to_float(b.ekv_amount)
        fee_amount = str_to_float(b.fee_amount)
        val_course = str_to_float(b.course)
        val_nb_course = str_to_float(b.nb_course)
        if b.val_id is None:
            raise ValueError("Could not convert variant of type (Null) into type (Integer)")
        now = datetime.datetime.now().replace(microsecond=0)
        # Purchase: DTP_System_Time.DateTime (Timer: Time); Selling: DTP_Date.DateTime (UnitSelling.pas 'op_time := DTP_Date.DateTime')
        op_time = now if b.kind == PURCHASE else datetime.datetime.combine(trans_date.date(), now.time())
        rem = remainder(c, b.ex_no, b.dat, b.sdat)
        r_debit, r_l = ex_rem_ostat(rem, b.val_id), ex_rem_ostat(rem, 0)
        cust_date = date_only(b.cust_date) if b.cust_date else None
        result_id = c.call_func(PKG, "add_ex_prov_trans", [], int, named={
            "status": STATUS[b.kind], "operator_id": operator_id, "trans_date": trans_date, "debit_amount": debit_amount,
            "l_amount": l_amount, "fee_amount": fee_amount, "val_course": val_course, "trans_name": b.setting,
            "cust_name": b.cust_name, "cust_lname": b.cust_lname, "cust_passport": b.cust_passport, "exch_name": b.exch_name,
            "val_id": b.val_id, "ex_id": b.ex_no, "cust_father": b.cust_father, "cust_date": cust_date,
            "cust_confirm": b.cust_confirm, "cust_giving_member": b.cust_giving_member, "val_nb_course": val_nb_course,
            "op_time": op_time, "val_name": b.val_name, "val_changed_name": "AZN", "val_changed_id": b.val_changed_id,
            "val_changed_course": 1, "cust_country": b.cust_country, "country": b.country, "trans_close": 0,
            "SessionName": username, "RDebitAmount": r_debit, "RLAmount": r_l, "PCashless": 1 if b.cashless else 0})
        c.call_proc(PKG, "ex_constants_add", [], named={
            "a_ex_id": b.ex_no, "a_cust_name": b.cust_name, "a_cust_lname": b.cust_lname, "a_cust_passport": b.cust_passport,
            "a_cust_father": b.cust_father, "a_cust_date": cust_date, "a_cust_confirm": b.cust_confirm,
            "a_cust_giving_member": b.cust_giving_member, "a_cust_country": b.cust_country, "a_country": b.country}, commit=False)
        out["cust"] = cust_sets(c)                                        # open_cust_data_sets
        kredit = acc_id(c.call_func(PKG, "get_purchase_no", [b.ex_no, b.val_id], str))
        debit = acc_id(c.call_func(PKG, "get_selling_no", [b.ex_no, b.val_id], str))
        cash = acc_id(c.call_func(PKG, "get_cash_acc_no", [b.ex_no, b.val_id], str))
        pur = acc_id(c.call_func(PKG, "get_pur_acc_no", [b.ex_no, b.val_id], str))
        if INSERT_POSTS:
            if b.kind == PURCHASE:   # UnitPurchase.pas:485-503
                ex_transaction(c, "ex_transaction", [result_id, debit, kredit, cash, pur, b.ex_no, debit_amount, debit_amount,
                                                     l_amount, val_course, 1, val_nb_course, b.setting, operator_id], a_flags)
            else:                    # UnitSelling.pas: ex_transaction_additional (Kredit/Debit and the courses swapped)
                ex_transaction(c, "ex_transaction_additional", [result_id, kredit, debit, cash, pur, b.ex_no, debit_amount,
                                                                debit_amount, l_amount, 1, val_course, val_nb_course, b.setting,
                                                                operator_id], a_flags)
        c.commit()
        out["result_id"] = result_id
    except (DBError, ValueError) as e:
        c.rollback()
        out["message"] = "em.err_raw"
        out["text"] = e.message if isinstance(e, DBError) else str(e)
    out.update(refreshed(c, b))
    return out


def confirm(c, b: RowIn) -> dict:
    """ToolButton27Click 'Təsdiq etmə' (Unit_ExchangeMGR.pas:2888-3252, the live part :2916-3045)."""
    check_right(c, "EXCH_TRANS")
    rs = provarch(c, b)
    row = first_by(rs, "id", b.id)
    if row is None or row.get("trans_close") == 1:           # RecordCount = 0 / trans_close = 1 -> exit
        return {"done": False, "provarch": rs}
    rem = remainder(c, b.ex_no, b.dat, b.sdat)
    t = {k: row.get(k) for k in ("ex_id", "val_id", "debitamount", "lamount", "dat", "op_course", "val_changed_course",
                                  "val_nb_course", "oper_name", "status")}
    f = lambda k: float(t[k] or 0)                           # noqa: E731  (TField.AsFloat)
    r_debit, r_l = ex_rem_ostat(rem, t["val_id"]), ex_rem_ostat(rem, 0)
    operator_id = c.call_func(PKG, "UserID", [], int)
    c.call_proc(PKG, "calculate_remainder", [t["status"], t["ex_id"], t["dat"], t["val_id"], f("debitamount"), f("lamount"),
                                              r_debit, r_l], commit=False)
    kredit = acc_id(c.call_func(PKG, "get_purchase_no", [t["ex_id"], t["val_id"]], str))
    debit = acc_id(c.call_func(PKG, "get_selling_no", [t["ex_id"], t["val_id"]], str))
    cash = acc_id(c.call_func(PKG, "get_cash_acc_no", [t["ex_id"], t["val_id"]], str))
    pur = acc_id(c.call_func(PKG, "get_pur_acc_no", [t["ex_id"], t["val_id"]], str))
    name = t["oper_name"] or ""
    if t["status"] == 1:
        ex_transaction(c, "ex_transaction", [b.id, debit, kredit, cash, pur, t["ex_id"], f("debitamount"), f("debitamount"),
                                             f("lamount"), f("op_course"), f("val_changed_course"), f("val_nb_course"), name,
                                             operator_id], False)
    else:
        ex_transaction(c, "ex_transaction_additional", [b.id, kredit, debit, cash, pur, t["ex_id"], f("debitamount"),
                                                        f("debitamount"), f("lamount"), f("val_changed_course"), f("op_course"),
                                                        f("val_nb_course"), name, operator_id], False)
    c.commit()
    return {"done": True, "provarch": provarch(c, b)}


def delete(c, b: RowIn) -> dict:
    """ToolButton6Click2 'Ləğv et' (:2118-2138) - the confirmation ('Silmək istəyirsiniz? ') is asked by the page first."""
    check_right(c, "EXCH_DELETE")
    rs = provarch(c, b)
    row = first_by(rs, "id", b.id)
    if row is None or row.get("trans_close") not in (0, 1):
        return {"done": False, "provarch": rs}
    if not b.confirmed:                                      # MessageDLG('Silmək istəyirsiniz? ') - asked by the page
        return {"done": False, "ask": True}
    c.call_proc(PKG, "ex_provarch_delete", [row.get("status"), b.id], commit=False)
    c.commit()
    return {"done": True, **refreshed(c, b)}


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/exchangemgr/trans")
    g = require_module(CLSID)

    def guard(fn):
        try:
            return fn()
        except DBError as e:
            err(400, "em.err_db", msg=e.message)

    @r.post("/open")
    def _open(b: OpenIn, ws=Depends(g)):
        """PurchaseClick2 / SellingClick2: right check, ODSExchRate.Refresh, IsEmpty -> 'Yeni kurslar daxil edin!!!',
        ODSExchAcc.Open, ShowModal -> FormActivate (ODSSysdat date/time, ex_date_change)."""
        c = ws.conn

        def run():
            check_right(c, RIGHT_OPEN[b.kind])
            if not c.query(Q.DM_ODSExchRate, {"dat": date_only(b.dat)}):
                return {"opened": False, "message": "em.err_no_rates"}
            acc = exch_acc(c, b.ex_no, b.dat, b.rf_ex_id, b.rf_dat)
            sd = c.query(Q.DM_ODSSysdat)[0]
            f = date_change(c, b.ex_no)
            return {"opened": True, "acc": acc, "cust": cust_sets(c), "date": date_only(sd["SSDAT"]), "time": sd.get("STIME"),
                    "clear": f != 2}
        return guard(run)

    @r.post("/calc")
    def _calc(b: CalcIn, ws=Depends(g)):
        try:
            return calc(ws.conn, b)
        except ValueError as e:
            return {"error": str(e)}
        except DBError as e:
            err(400, "em.err_db", msg=e.message)

    @r.post("/save")
    def _save(b: SaveIn, ws=Depends(g)):
        return guard(lambda: save(ws.conn, b, ws.conn.username))

    @r.post("/confirm")
    def _confirm(b: RowIn, ws=Depends(g)):
        return guard(lambda: confirm(ws.conn, b))

    @r.post("/delete")
    def _delete(b: RowIn, ws=Depends(g)):
        return guard(lambda: delete(ws.conn, b))

    return r
