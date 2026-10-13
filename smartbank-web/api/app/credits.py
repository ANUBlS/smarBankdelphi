"""Credits module - port of Delphi Packages/SB_Credit (production credit manager).

Main list:        Sm_creditsmgr/CreditsmgrImpl.pas (TCreditsmgr_sb, CLSID below) + CMMainUnitImpl.dfm
Credit card/edit: CM_Conclusion/ConclusionMainUnitImpl.pas + DataModuleConclusion.pas/.dfm (plugin CM_Conclusion.bpl)
Filter:           CM_Filter/MainUnitImpl.pas (plugin CMFilter)
Schedule:         CM_Schedule/ScheduleMainFormImpl.pas + AnnutyPaymentFormImpl.pas (calc runs in Oracle CM_SCHEDULE)
Reports:          CM_coefficient/coefficientImpl.pas, CM_DECA/DecaMainForm.pas
SQL is verbatim in cr_sql.py (generated from the DFMs). Pure logic + Oracle semantics for the mock: cr_logic.py.
"""
from __future__ import annotations
import datetime
import io
from decimal import Decimal

from fastapi import APIRouter, Depends
from fastapi.responses import Response
from pydantic import BaseModel, Field

from .db import DBError
from .delphi import subst
from . import cr_sql as Q
from . import cr_logic as L
from .customers import row

CLSID = "{B361BF28-9D86-4D92-A06F-3661B9B2B9CD}"     # Sm_creditsmgr/Creditsmgr_TLB.pas:52 CLASS_Creditsmgr_sb
CONCLUSION_PLUGIN = "CM_Conclusion.bpl"             # CreditsmgrImpl.pas:583

# MainGrid columns (CreditsmgrImpl.dfm:473-883) - the only values accepted for :OrderField (otSubst)
ORDER_FIELDS = ("ID", "NUMBEROFCREDIT", "CONTRACTACCNO", "VAL_NAME", "STATUS", "NAME", "ANNUALYINTERESTRATE", "REST",
                "INTERESTREST", "DUEREST", "DUEINTERESTREST", "CREDITLINEAMOUNT", "INITIALAMOUNT", "ANNUALYOVERDUERATE",
                "ANNUALYPENALTYRATE", "DATEOFCONCLUSION", "DUEDATEFIRSTCONTRACT", "PURPOSEOFCREDIT", "STOPCALCDATE",
                "OBLIGATION", "PLEDGEPRICE", "DUEDATELASTCONTRACT", "BOOROWERREST", "PENALTYREST", "BOOROWERID",
                "IPREST", "IPINTERESTREST", "FILIAL")

# SaveCredit (ConclusionMainUnitImpl.pas:695-775): field -> (Contract_Add/Edit parameter name, AsXxx conversion)
_I, _S, _F, _DT = "int", "str", "float", "date"
SAVE_MAP = [
    ("CURRENCY", "Currency", _I), ("BOOROWERID", "BoorowerID", _I), ("PINCODE", "PINCODE", _S),
    ("CREDITLINEAMOUNT", "CreditLineAmount", _F), ("ANNUALYINTERESTRATE", "AnnualyInterestRate", _F),
    ("ANNUALYOVERDUERATE", "AnnualyOverdueRate", _F), ("ANNUALYPENALTYRATE", "AnnualyPenaltyRate", _F),
    ("ANNUALBANKRATE", "AnnualBankRate", _F), ("DATEOFCONCLUSION", "DateOfConclusion", _DT),
    ("DUEDATEFIRSTCONTRACT", "DueDateFirstContract", _DT), ("NUMBEROFCREDIT", "NumberOfCredit", _S),
    ("PURPOSEOFCREDIT", "PurposeOfCredit", _S), ("CUSTOMERTYPE", "CustomerType", _I), ("CREDITTYPE", "CreditType", _I),
    ("PERSONALTYPE", "PersonalType", _I), ("AUTOPAYMENT", "AutoPayment", _I), ("AUTOEXPIRE", "AutoExpire", _I),
    ("USRGROUP", "UsrGroup", _I), ("BRANCHID", "BranchID", _I), ("NEWFINANCEAMOUNT", "newfinanceamount", _I),
    ("NUMBEROFBANKCREDIT", "numberofBankCredit", _S), ("INTCALCMETHOD", "intcalcmethod", _I),
    ("BOOROWERACCID", "BoorowerAccID", _I), ("LOANACCID", "LoanAccID", _I), ("DUELOANACCID", "DueLoanAccID", _I),
    ("INTERESTACCID", "InterestAccID", _I), ("DUEINTERESTACCID", "DueInterestAccID", _I),
    ("PRIMARYRESERVEACCID", "PrimaryReserveAccID", _I), ("SECONDARYRESERVEACCID", "SecondaryReserveAccID", _I),
    ("OUTCOLLATERALACCID", "OutCollateralAccID", _I), ("OUTGUARANTEEACCID", "OutGuaranteeAccID", _I),
    ("OUTINTERESTACCID", "OutInterestAccID", _I), ("CRDLINEOBLACCID", "CrdLineOblAccID", _I),
    ("OUTLOANACCID", "OUTLoanAccID", _I), ("PRIMARYPURRESERVEACCID", "primarypurreserveaccid", _I),
    ("SECONDARYPURRESERVEACCID", "secondarypurreserveaccid", _I), ("RESERVEID", "ReserveID", _I),
    ("DUERESERVEID", "DueReserveID", _I), ("BOORID", "BOORID", _S), ("COUNTRYCODE", "COUNTRYCODE", _S),
    ("BANKRUPTEYSTATUS", "BANKRUPTEYSTATUS", _I), ("PHONENUMBER", "PHONENUMBER", _S), ("ADDRESS", "ADDRESS", _S),
    ("FIRSTOWNERID", "FIRSTOWNERID", _S), ("FIRSTOWNERNAME", "FIRSTOWNERNAME", _S),
    ("SECONDOWNERID", "SECONDOWNERID", _S), ("SECONDOWNERNAME", "SECONDOWNERNAME", _S),
    ("THIRDOWNERID", "THIRDOWNERID", _S), ("THIRDOWNERNAME", "THIRDOWNERNAME", _S), ("SALARY", "salary", _S),
    ("GUARANTORNAME", "guarantorname", _S), ("GUARANTORID", "guarantorid", _S), ("GUARANTORSALARY", "guarantorsalary", _S),
    ("GUARANTORNAME2", "guarantorname2", _S), ("GUARANTORID2", "guarantorid2", _S),
    ("GUARANTORSALARY2", "guarantorsalary2", _S), ("GUARANTORNAME3", "guarantorname3", _S),
    ("GUARANTORID3", "guarantorid3", _S), ("GUARANTORSALARY3", "guarantorsalary3", _S),
    ("ACTIVITIES", "activities", _I), ("ACTIVITIES_TYPE", "activities_type", _I), ("CREDITACT", "CREDITACT", _I),
    ("AIM_ID", "aim_id", _I), ("PLEDGEID_P", "PLEDGEID_P", _I), ("EXPERTID", "EXPERTID", _I),
    ("PAYPERIOD", "payperiod", _I), ("PAYINTDAY", "payintday", _I), ("MEHSULID", "MEHSULID", _I),
    ("IPRIMARYRESERVEACCID", "iPrimaryReserveAccID", _I), ("ISECONDARYRESERVEACCID", "iSecondaryReserveAccID", _I),
    ("AIF", "aif", _I), ("KOMISION", "komisya", _F),
]
EDITABLE = {f for f, _p, _t in SAVE_MAP}


def _conv(v, t):
    if t == _I:
        return 0 if v in (None, "") else int(float(v))         # AsInteger: NULL -> 0
    if t == _F:
        return 0.0 if v in (None, "") else float(v)            # AsFloat: NULL -> 0
    if t == _S:
        return "" if v is None else str(v)                     # AsString: NULL -> ''
    if v in (None, ""):
        return datetime.datetime(1899, 12, 30)                 # Int(AsDateTime) of NULL -> 0 = 30.12.1899
    d = v if isinstance(v, (datetime.date, datetime.datetime)) else datetime.date.fromisoformat(str(v)[:10])
    return datetime.datetime(d.year, d.month, d.day)


def contract_params(rec: dict, insert: bool, credit_id: int | None = None) -> dict:
    """DataModuleConclusion.pas:297-470 CreditPropsApplyRecord ('I' -> Contract_Add, 'U' -> Contract_Edit).
    Same parameter list/order; insuranceid is 222 on insert and 0 on edit (as in Delphi)."""
    p: dict = {} if insert else {"CreditID": credit_id}
    for f, name, t in SAVE_MAP:
        p[name] = _conv(rec.get(f), t)
        if f == "AIM_ID":
            p["insuranceid"] = 222 if insert else 0
    return p


# ------------------------------------------------------------------------------------------------ list
def list_credits(conn, order: str = "ID", desc: bool = False) -> list[dict]:
    """CR_ACTIVE (CMMainUnitImpl.dfm:8); MainGridTitleBtnClick :618-636 sets OrderField := FieldName [+ ' DESC']."""
    o = order.upper() if order and order.upper() in ORDER_FIELDS else "ID"
    sql = subst(Q.SQL_CR_ACTIVE, "OrderField", o + (" DESC" if desc else ""))
    return conn.query(sql)


def grid_layout(conn) -> dict:
    """LoadFieldsList :480-530: column order = RecNo of cm_fields_list (seqno), VISIBLE=0 means visible,
    FrozenCols = SUM(FROZEN). The status icon is drawn in the column whose index = SeqDataSet.seqno (:595-616)."""
    rows = conn.query(Q.SQL_VISIBLE_FIELDS)
    cols = [{"field": r["FIELDNAME"], "visible": int(r["VISIBLE"] or 0) == 0, "desc": r.get("FIELDDESC")} for r in rows]
    seq = conn.query(Q.SQL_SEQ)
    return {"columns": cols, "frozen": sum(int(r["FROZEN"] or 0) for r in rows),
            "status_col": int(seq[0]["SEQNO"]) if seq else None}


def plugin_access(conn, plugin: str, param: str) -> bool:
    """CreditsMainMenuBeforeLoadPlugin :650-663 (Param '' -> 'NONE')."""
    pid = conn.call_func("CM_ADMINISTRATION", "getpluginid", [plugin, param or "NONE"], int)
    return conn.call_bool("CM_ADMINISTRATION", "pluginaccess", [pid])


def adm_addition(conn, code: str) -> int:
    return conn.call_func("CM_ADMINISTRATION", "getadmaddition", [code], int)


def get_status(conn, credit_id: int) -> int:
    return conn.call_func("CM_CREDIT", "get_status", [], int, named={"p_id": credit_id})


# ------------------------------------------------------------------------------------------------ card
def open_card(conn, credit_id: int) -> dict:
    """DoEdit :947-1013: CreditProps by :creditid + the account ids from 'loc' (cm_accounts) + PeriodContracts."""
    r = conn.query(Q.SQL_CREDIT_PROPS, {"creditid": credit_id})
    if not r:
        raise L.CrError("error.not_found")
    rec = dict(r[0])
    loc = conn.query(Q.SQL_LOC, {"creditid": credit_id})
    if loc:
        for k in ("BOOROWERACCID", "LOANACCID", "PRIMARYRESERVEACCID", "PRIMARYPURRESERVEACCID", "INTERESTACCID",
                  "OUTGUARANTEEACCID", "DUELOANACCID", "DUEINTERESTACCID", "OUTINTERESTACCID"):
            if k in loc[0]:
                rec[k] = loc[0][k]
    rec["PERIODCONTRACTS"] = period(conn, rec.get("DATEOFCONCLUSION"), rec.get("DUEDATEFIRSTCONTRACT"))
    return rec


def period(conn, d1, d2):
    """CreditPropsCalcFields :621-630 -> CM_COMMON.GetPeriod(DATEOFCONCLUSION, DUEDATEFIRSTCONTRACT)."""
    if d1 is None or d2 is None:
        return None
    return conn.call_func("CM_COMMON", "GetPeriod", [d1, d2], int)


def new_card(conn, user_branch: int, current_date: datetime.datetime) -> dict:
    """DoInsert :922-945."""
    br = conn.query(Q.SQL_BRANCHES)
    d = datetime.datetime(current_date.year, current_date.month, current_date.day)
    return {"BRANCHID": br[0]["ID"] if len(br) == 1 else user_branch, "DATEOFCONCLUSION": d,
            "DUEDATEFIRSTCONTRACT": d, "CURRENCY": 0, "COUNTRYCODE": "AZE", "PAYINTDAY": d.day,
            "BANKRUPTEYSTATUS": 0, "PERIODCONTRACTS": 0}


def check_person(conn, personaltype: int) -> bool:
    return conn.call_bool("CM_CREDIT", "checkPerson", [], named={"P_ID": personaltype})


def save_card(conn, rec: dict, insert: bool, credit_id: int | None) -> int:
    """SaveChangesExecute :801-808 -> CheckFields, SaveCredit, Post (ApplyRecord). CommitOnPost=False in the DFM;
    the web commits after a successful call (see PARITY_CREDITS.md - unverified)."""
    L.check_fields(rec, lambda pt: check_person(conn, pt))
    fn = "Contract_Add" if insert else "Contract_Edit"
    res = conn.call_func("CM_CREDIT", fn, [], int, named=contract_params(rec, insert, credit_id))
    conn.commit()
    return res


def post_credit(conn, credit_id: int, status_now: int, approve: bool) -> None:
    """BitpostClick :1476-1515 (approve -> get_post p_status 1) / BitCancelClick :1518-1538 (reject -> 3)."""
    if approve:
        if status_now == 3 and adm_addition(conn, "INK") == 0:
            raise L.CrError("credits.err_right_ink")
        if status_now == 2 and adm_addition(conn, "PLANPOST") == 0:
            raise L.CrError("credits.err_right_planpost")
        conn.call_proc("CM_CREDIT", "get_post", [], named={"p_id": credit_id, "p_status": 1})
    else:
        if adm_addition(conn, "TES") == 0:
            raise L.CrError("credits.err_right")
        conn.call_proc("CM_CREDIT", "get_post", [], named={"p_id": credit_id, "p_status": 3})


ACC_LISTS = {   # lookup -> (SQL, substitution/bind name, bind value) per DataModuleCreate :495-510
    "loan": (Q.SQL_LOAN_ACCS, "loanaccs", "LoanAccs"), "cust": (Q.SQL_CUST_ACCS, "ClientAccs", "ClientAccs"),
    "interest": (Q.SQL_INTERESTS, "InterestAccs", "InterestAccs"),
    "preserve": (Q.SQL_PRESERVE_ACCS, "PReserveAccs", "PReserveAccs"),
    "dueloan": (Q.SQL_DUELOAN_ACCS, "DueLoanAccs", "DueLoanAccs"),
    "dueinterest": (Q.SQL_DUE_INTERESTS, "InterestAccs", "InterestAccs"),
}


def account_lists(conn, currency: int, borrower: int | None) -> dict:
    """Account lookups. val_acc follows the currency (DBLookupComboboxEh7Change :1460-1474); CustAccs.SQL[14] and
    Interests :kli_id follow the borrower (DBLookupComboboxEh19Change :1390-1406)."""
    out = {}
    for k, (sql, var, val) in ACC_LISTS.items():
        b = {var: val}
        if ":val_acc" in sql.lower():
            b["val_acc"] = currency
        if k == "cust":
            if borrower is None:
                out[k] = []
                continue
            sql = L.replace_sql_line(sql, 14, L.cust_accs_line14(borrower))
        if ":kli_id" in sql.lower().replace("/*and ac.kli_id=:kli_id*/", ""):
            if borrower is None:
                out[k] = []
                continue
            b["kli_id"] = borrower
        out[k] = [row(x) for x in conn.query(sql, b)]
    return out


def lookups(conn) -> dict:
    g = lambda s: [row(x) for x in conn.query(s)]   # noqa: E731
    res = g(Q.SQL_RESERVES)
    for r in res:   # ReservesCalcFields :616-619
        r["fulldesc"] = f"{r.get('description') or ''} - {_fs(r.get('percent'))} %"
    return {"currencies": g(Q.SQL_CURRENCYS), "branches": g(Q.SQL_BRANCHES), "credit_types": g(Q.SQL_CREDIT_TYPES),
            "person_types": g(Q.SQL_PERSON_TYPES), "usr_groups": g(Q.SQL_USR_GROUPS), "reserves": res,
            "automation": g(Q.SQL_AUTO_PAYMENT), "calc_methods": g(Q.SQL_CALC_INT_METHOD), "customers": g(Q.SQL_CUSTOMER),
            "countries": g(Q.SQL_COUNTRYS), "aims": g(Q.SQL_AIM), "pledges": g(Q.SQL_PLEDGES), "experts": g(Q.SQL_EXPERTS),
            "estate_types": g(Q.SQL_ESTATE_TYPES), "mehsul": g(Q.SQL_MEHSUL), "payint_days": g(Q.SQL_PAYINT),
            "pay_periods": g(Q.SQL_PAYPERIOD)}


CASCADE = {   # ConclusionMainUnitImpl.pas: Eh29Change :1337-1356, Eh28Change :1267-1279, Eh30Change :1281-1288
    "creditcat": (Q.SQL_CREDITCAT, "vid_sob"),          # estate type (ACTIVITIES_TYPE) -> CREDITACT list
    "activities": (Q.SQL_ACTIVITIES, "act_id"),         # CREDITACT -> ACTIVITIES list
    "categories": (Q.SQL_CLIENT_CATEGORIES, "act_id"),  # ACTIVITIES -> CUSTOMERTYPE list
}


def _fs(v):
    if v is None:
        return ""
    f = float(v)
    return str(int(f)) if f == int(f) else repr(f)


def auto_accounts(conn, cust_id: int) -> dict:
    """CMSearchEditLoacAccsKeyUp F2 :1126-1151: CM_COMMON.Get_AccID(CustID, cm_decls.<group>[, 1])."""
    def var(n):
        return conn.plsql(f"begin :r := cm_decls.{n}; end;", {}, int)
    spec = [("BOOROWERACCID", "AcgCust", None), ("PRIMARYPURRESERVEACCID", "Acgres", None),
            ("INTERESTACCID", "AcgInt", None), ("DUELOANACCID", "AcgDueLoan", None),
            ("DUEINTERESTACCID", "AcgDueInt", None), ("OUTCOLLATERALACCID", "AcgPlg", 1),
            ("OUTGUARANTEEACCID", "AcgObl", 1), ("OUTINTERESTACCID", "AcgOutInt", 1), ("CRDLINEOBLACCID", "AcgCrdLine", None)]
    out = {}
    for f, v, third in spec:
        args = [cust_id, var(v)] + ([third] if third is not None else [])
        out[f] = conn.call_func("CM_COMMON", "Get_AccID", args, int)
    return out


# ------------------------------------------------------------------------------------------------ schedule
def schedule(conn, credit_id: int) -> dict:
    ci = conn.query(Q.SQL_SCHEDULE_CREDITINFO, {"ID": credit_id})
    if not ci:
        raise L.CrError("error.not_found")
    return {"rows": [row(x) | {"rowid": x.get("ROWID")} for x in conn.query(Q.SQL_SCHEDULE_SCHEDULEDATA, {"CREDITID": credit_id})],
            "credit": row(ci[0]), "borrower": [row(x) for x in conn.query(Q.SQL_SCHEDULE_BOOROWERINFO, {"CREDITID": credit_id})]}


def credit_info(conn, credit_id: int) -> dict:
    ci = conn.query(Q.SQL_SCHEDULE_CREDITINFO, {"ID": credit_id})
    if not ci:
        raise L.CrError("error.not_found")
    c = dict(ci[0])
    for k in ("DATEOFCONCLUSION", "DUEDATEFIRSTCONTRACT"):
        if isinstance(c.get(k), datetime.datetime):
            c[k] = c[k].date()
    return c


def require_paymentshe(conn):
    """ScheduleMainFormImpl.pas:219-225 / :266-273 / :425-430."""
    if adm_addition(conn, "PAYMENTSHE") == 0:
        raise L.CrError("credits.err_right")


def generate_schedule(conn, credit_id: int, annuity: bool, first_pay: datetime.date, amount, period_index: int,
                      n_periods: int, dovr: int) -> None:
    """ActionAnnutyExecute :306-373. Changes stay uncommitted until Save (ActionSaveExecute :291-298);
    closing the form rolls back (FormClose :170-181)."""
    c = credit_info(conn, credit_id)
    L.annuty_validate(n_periods, dovr)
    name, p = L.schedule_call(annuity, credit_id, float(L.delphi_currency(amount)), float(c["ANNUALYINTERESTRATE"]),
                              datetime.datetime(first_pay.year, first_pay.month, first_pay.day),
                              datetime.datetime.combine(c["DATEOFCONCLUSION"], datetime.time()),
                              n_periods, L.period_rate(period_index), dovr)
    conn.call_proc("CM_SCHEDULE", name, [], named=p, commit=False)


SQL_SCHEDULE_DELETE = "delete from CM_PAYMENT_SCHEDULE where rowid = :doa__rowid"
"""What TOracleDataSet.Delete issues for ScheduleData (SELECT Z.RowID,Z.* FROM CM_PAYMENT_SCHEDULE Z ...)."""


# ------------------------------------------------------------------------------------------------ coefficient
def coefficient(conn, kind: str, date: datetime.date, branches: list[int], cats: list[int]) -> dict:
    """coefficientImpl.pas:215-455 (kind 'interest') / :462-746 (kind 'main')."""
    all_b = [int(r["ID"]) for r in conn.query(Q.SQL_COEFFICIENT_FILIALDATASET)]
    all_c = [int(r["ID"]) for r in conn.query(Q.SQL_COEFFICIENT_PERSONELTYPEDATASET)]
    if not branches:
        raise L.CrError("credits.err_coef_branch")
    if not cats:
        raise L.CrError("credits.err_coef_cat")
    branches = [b for b in branches if b in all_b]
    cats = [c for c in cats if c in all_c]
    extra = L.coefficient_additional_params(branches, all_b, cats, all_c)
    sql = L.replace_sql_line(Q.SQL_COEFFICIENT_CREDIT, 3, extra if extra else "")
    dat = datetime.datetime(date.year, date.month, date.day)
    errors = []
    for cr in conn.query(sql):
        try:
            conn.call_proc("CM_AK_reports", "insinfof1", [], named={"p_id": int(cr["ID"]), "p_bdate": dat, "p_edate": dat},
                           commit=False)
        except DBError as e:
            errors.append({"id": int(cr["ID"]), "message": e.message})   # rsCreditNumber '%d - № li kredit : '
    rows = conn.query(Q.SQL_COEFFICIENT_ACTIVE if kind == "interest" else Q.SQL_COEFFICIENT_MAIN)
    conn.commit()                                        # active.Session.Commit / main.Session.Commit
    res = L.coefficient_interest(rows) if kind == "interest" else L.coefficient_main(rows)
    res["errors"] = errors
    return res


def coefficient_xlsx(kind: str, date: datetime.date, res: dict, bank_title: str) -> bytes:
    """Same sheet layout/formulas as the Excel OLE export (columns, row 7 start, 'Yekun cem' formulas)."""
    from openpyxl import Workbook
    from openpyxl.styles import Font
    wb = Workbook()
    ws = wb.active
    k = 5
    if kind == "interest":
        ws.cell(2, 5, f"{bank_title} % borcu üzrə ödəniş əmsalı").font = Font(bold=True, size=22)
        heads = ["Sıra №", "Filial", "Kredit portfel", "Hesabat tarixinə ödənilməli faiz borcu",
                 "Hesabat tarixinə ödənilmiş faiz borcu", "Gecikdirilmiş faiz borcu",
                 "Gecikdirilmiş faiz borcu üzrə qlıq məbləğ",
                 "Gecikdirilmiş faiz borcu üzrə qlıq məbləğin kreditin portfelinde xüsusi çəkisi sütun7/sütun3",
                 "Ödənilmiş faiz(% nisbətilə sütun5.sütun4)"]
        keys = ["portfel", "odenilmelifaiz", "odenilmish", "gecfaizmeb", "gec", "gf", "f"]
        pct = (8, 9)
    else:
        ws.cell(2, 5, f"{bank_title} əsas borc üzrə ödəniş əmsalı").font = Font(bold=True, size=22, color="0000FF")
        ws.cell(3, 2, "Hesabat tarixi").font = Font(bold=True)
        ws.cell(3, 3, date)
        ws.cell(4, 2, "Kreditin valyutası ").font = Font(bold=True)
        ws.cell(4, 3, "Manatla")
        heads = ["Sıra №", "Filial", "Kredit portfeli", "Hesabat tarixində ödənilməli əsas borc",
                 "Hesabat tarixində ödənilmiş əsas borc", "Əsas borc üzrə artıq ödəmə", "Geikdirilmiş əsas borc",
                 "Gecikdirilmiş əsas borc üzrə qalıq məbləği", "Gecikdirilmiş əsas borcun kredit portfelinə nisbəti % lə)",
                 "Gecikdirilmiş əsas borc üzrə qalıq məbləğin kreditin portfelinə nisbəti % lə)", "Ödəniş faizi (% nisbəti ilə)"]
        keys = ["portfel", "odenilmeli", "odenilmish", "artiq", "geces", "gec"]
        pct = (9, 10, 11)
    for i, h in enumerate(heads, 1):
        c = ws.cell(k + 1, i, h)
        c.font = Font(bold=True)
    for j, r in enumerate(res["rows"], 1):
        rr = k + 1 + j
        ws.cell(rr, 1, j)
        ws.cell(rr, 2, r["name"])
        for ci, key in enumerate(keys, 3):
            v = r.get(key)
            ws.cell(rr, ci, None if v is None else float(v))
        if kind == "main":
            ws.cell(rr, 9, f"=G{j + 6}/C{j + 6}")
            ws.cell(rr, 10, f"=H{j + 6}/C{j + 6}")
            ws.cell(rr, 11, f"=(E{j + 6}-F{j + 6})/D{j + 6}")
            ws.cell(rr, 12, float(r["geces"]))
    w = len(res["rows"])
    tr = w + k + 2
    ws.cell(tr, 1, "Yekun cem").font = Font(bold=True, color="FF0000" if kind == "interest" else None)
    last_sum = "G" if kind == "interest" else "H"
    for col in "CDEFGH":
        if col > last_sum:
            break
        ws[f"{col}{tr}"] = f"=SUM({col}7:{col}{w + 6})"
    if kind == "interest":
        ws[f"H{tr}"] = f"=G{w + 7}/C{w + 7}"
        ws[f"I{tr}"] = f"=E{w + 7}/D{w + 7}"
    else:
        ws[f"I{tr}"] = f"=G{w + 7}/C{w + 7}"
        ws[f"J{tr}"] = f"=H{w + 7}/C{w + 7}"
        ws[f"K{tr}"] = f"=(E{w + 7}-F{w + 7})/D{w + 7}"
    for col in pct:
        for rr in range(1, tr + 1):
            ws.cell(rr, col).number_format = "#,##0.00%"
    bio = io.BytesIO()
    wb.save(bio)
    return bio.getvalue()


# ------------------------------------------------------------------------------------------------ DECA
def deca_closed(conn, bank_id: str, bank_name: str, rep_date: datetime.date, hdate: datetime.date,
                edate: datetime.date, mode: int | None, b: datetime.date, e: datetime.date, number: str) -> tuple[str, int]:
    """SpeedButton5Click :552-652. Edit1 (credit number) is concatenated into SQL[77] in Delphi; here it is a bind."""
    sql = L.replace_sql_line(Q.SQL_DECA_DECADATA_CLOS, 76, L.deca_strdate(mode, b, e))
    binds = {"HDATE": datetime.datetime.combine(hdate, datetime.time()), "EDATE": datetime.datetime.combine(edate, datetime.time())}
    if number:
        sql = L.replace_sql_line(sql, 77, "and b.numberofcredit=:numberofcredit")
        binds["numberofcredit"] = number
    rows = conn.query(sql, binds)
    tags = conn.query(Q.SQL_DECA_TAGSETTINGS)
    return L.deca_closed_export(bank_id, bank_name, rep_date, tags, rows)


# ------------------------------------------------------------------------------------------------ router
class ListIn(BaseModel):
    order: str = "ID"
    desc: bool = False
    filter: dict = {}


class CardIn(BaseModel):
    mode: str = Field(pattern="^(insert|edit)$")
    id: int | None = None
    rec: dict


class AnnuityIn(BaseModel):
    annuity: bool = True
    first_pay_date: datetime.date
    amount: float = 0
    period_rate_index: int = Field(0, ge=0, le=3)
    n_periods: int = Field(ge=1, le=600)
    dovr: int = Field(0, ge=0, le=600)


class CoefIn(BaseModel):
    kind: str = Field(pattern="^(interest|main)$")
    date: datetime.date
    branches: list[int]
    categories: list[int]


class DecaIn(BaseModel):
    bank_id: str = Field("", max_length=32)
    bank_name: str = Field("", max_length=128)
    rep_date: datetime.date
    hdate: datetime.date
    edate: datetime.date
    mode: int | None = None
    bdate: datetime.date | None = None
    edate2: datetime.date | None = None
    number: str = Field("", max_length=32)


def _filter_in(f: dict) -> dict:
    out = {}
    for k in L.CM_FILTER_FIELDS:
        if f.get(k) not in (None, ""):
            out[k] = int(f[k])
    if f.get("DATEOFCONCLUSION"):
        out["DATEOFCONCLUSION"] = datetime.date.fromisoformat(str(f["DATEOFCONCLUSION"])[:10])
    if f.get("TODAY_PAYMENTS"):
        out["TODAY_PAYMENTS"] = True
    return out


def _ser(rec: dict) -> dict:
    out = {}
    for k, v in rec.items():
        if k == "ROWID":
            continue
        if isinstance(v, datetime.datetime):
            v = v.date().isoformat()
        elif isinstance(v, datetime.date):
            v = v.isoformat()
        elif isinstance(v, Decimal):
            v = float(v)
        out[k.upper()] = v
    return out


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/credits")
    guard = require_module(CLSID)

    def run(fn, *a, **k):
        try:
            return fn(*a, **k)
        except L.CrError as e:
            err(400 if e.key != "error.not_found" else 404, e.key, **e.kw)

    @r.get("/init")
    def _init(ws=Depends(guard)):
        c = ws.conn
        g = lambda s: [row(x) for x in c.query(s)]   # noqa: E731
        return {"layout": grid_layout(c), "date": c.query(Q.SQL_FILTER_SYSDAT)[0]["TEK_DAT"].date().isoformat(),
                "filter": {"CURRENCY": g(Q.SQL_FILTER_CURRENCYS), "BRANCHID": g(Q.SQL_FILTER_BRANCHES),
                           "USRGROUP": g(Q.SQL_FILTER_USERGROUPS), "RESERVEID": g(Q.SQL_FILTER_PRESERVES),
                           "AIM_ID": g(Q.SQL_FILTER_SRESERVES), "USID": g(Q.SQL_FILTER_USERS), "PERSONALTYPE": g(Q.SQL_FILTER_PERSONS),
                           "CUSTOMERTYPE": g(Q.SQL_FILTER_CATEGORIES), "CREDITTYPE": g(Q.SQL_FILTER_CREDITTYPES),
                           "PLEDGEID": g(Q.SQL_FILTER_PLEDGES), "BOOROWERID": g(Q.SQL_FILTER_CUSTOMERS),
                           "KR_STATUS": g(Q.SQL_FILTER_ORACLEDATASET1)},
                "coef": {"branches": g(Q.SQL_COEFFICIENT_FILIALDATASET), "categories": g(Q.SQL_COEFFICIENT_PERSONELTYPEDATASET)}}

    @r.post("/list")
    def _list(b: ListIn, ws=Depends(guard)):
        rows = list_credits(ws.conn, b.order, b.desc)
        f = _filter_in(b.filter)
        paid = set()
        if f.get("TODAY_PAYMENTS"):
            paid = {int(x["CREDITID"]) for x in ws.conn.query(SQL_TODAY_PAYMENTS)}
        out = L.cm_filter_apply(rows, f, paid)
        return {"rows": [row(x) for x in out], "total": len(rows), "filter": L.cm_filter_string(f)}

    @r.get("/access/{action}")
    def _access(action: str, ws=Depends(guard)):
        if action not in ("Insert", "Edit", "look", "post"):
            err(400, "error.generic")
        return {"ok": plugin_access(ws.conn, CONCLUSION_PLUGIN, action)}

    def _deny_plugin(ws, action):
        if not plugin_access(ws.conn, CONCLUSION_PLUGIN, action):
            err(403, "credits.err_plugin")

    @r.get("/card/new")
    def _new(ws=Depends(guard)):
        _deny_plugin(ws, "Insert")
        c = ws.conn
        cur = c.call_func("SBOP", "get_date", [], datetime.datetime)
        branch = c.call_func("SB_ACA", "GetUserFilialID", [], int)
        return {"rec": _ser(new_card(c, branch, cur)), "caption": "credits.caption_new"}

    @r.get("/card/{credit_id}")
    def _card(credit_id: int, mode: str = "look", ws=Depends(guard)):
        action = {"edit": "Edit", "look": "look", "post": "post"}.get(mode)
        if not action:
            err(400, "error.generic")
        _deny_plugin(ws, action)
        c = ws.conn
        if mode == "edit":       # Edit :566-576
            if get_status(c, credit_id) == 1 and adm_addition(c, "POST") == 0:
                err(403, "credits.err_right")
        rec = run(open_card, c, credit_id)
        return {"rec": _ser(rec), "status": get_status(c, credit_id) if mode == "post" else rec.get("STATUS")}

    @r.get("/lookups")
    def _lk(currency: int = 0, borrower: int | None = None, ws=Depends(guard)):
        return {**lookups(ws.conn), "accounts": account_lists(ws.conn, currency, borrower)}

    @r.get("/cascade/{name}")
    def _cascade(name: str, value: int, ws=Depends(guard)):
        if name not in CASCADE:
            err(400, "error.generic")
        sql, var = CASCADE[name]
        return [row(x) for x in ws.conn.query(sql, {var: value})]

    @r.get("/accounts")
    def _accs(currency: int = 0, borrower: int | None = None, ws=Depends(guard)):
        return account_lists(ws.conn, currency, borrower)

    @r.get("/borrower/{cust_id}")
    def _borrower(cust_id: int, ws=Depends(guard)):
        x = ws.conn.query(Q.SQL_PRINAD, {"custid": cust_id})   # DBLookupComboboxEh19Change :1362-1374
        return row(x[0]) if x else {}

    @r.get("/check-person/{pt}")
    def _cp(pt: int, ws=Depends(guard)):
        return {"pin_disabled": check_person(ws.conn, pt)}    # DBLookupComboboxEh2Change :1197-1203

    @r.post("/period")
    def _period(body: dict, ws=Depends(guard)):
        try:
            d1 = datetime.datetime.fromisoformat(str(body["d1"])[:10])
            d2 = datetime.datetime.fromisoformat(str(body["d2"])[:10])
        except (KeyError, ValueError):
            err(400, "error.generic")
        return {"period": period(ws.conn, d1, d2)}

    @r.post("/annuty-date")
    def _ad(body: dict, ws=Depends(guard)):
        """DBLookupComboboxEh5Change :1438-1440 (usergroup with schedule=1)."""
        try:
            d = datetime.datetime.fromisoformat(str(body["date"])[:10])
        except (KeyError, ValueError):
            err(400, "error.generic")
        v = ws.conn.call_func("CM_SCHEDULE", "get_annutydate", [], datetime.datetime, named={"p_date": d})
        return {"date": v.date().isoformat() if v else None}

    @r.get("/auto-accounts/{cust_id}")
    def _auto(cust_id: int, ws=Depends(guard)):
        return auto_accounts(ws.conn, cust_id)

    @r.post("/card")
    def _save(b: CardIn, ws=Depends(guard)):
        _deny_plugin(ws, "Insert" if b.mode == "insert" else "Edit")
        rec = {k.upper(): v for k, v in b.rec.items() if k.upper() in EDITABLE}
        if b.mode == "edit":
            if b.id is None:
                err(400, "error.generic")
            if get_status(ws.conn, b.id) == 1 and adm_addition(ws.conn, "POST") == 0:
                err(403, "credits.err_right")
        return {"id": run(save_card, ws.conn, rec, b.mode == "insert", b.id)}

    @r.post("/card/{credit_id}/post")
    def _post(credit_id: int, body: dict, ws=Depends(guard)):
        _deny_plugin(ws, "post")
        st = get_status(ws.conn, credit_id)
        run(post_credit, ws.conn, credit_id, st, bool(body.get("approve")))
        return {"ok": True}

    # schedule ----------------------------------------------------------------------------------
    @r.get("/{credit_id}/schedule")
    def _sch(credit_id: int, ws=Depends(guard)):
        return run(schedule, ws.conn, credit_id)

    @r.get("/{credit_id}/schedule/annuty-defaults")
    def _sch_def(credit_id: int, ws=Depends(guard)):
        d = L.annuty_defaults(run(credit_info, ws.conn, credit_id))
        return {**d, "first_pay_date": d["first_pay_date"].isoformat(), "amount": float(d["amount"])}

    @r.post("/{credit_id}/schedule/annuty")
    def _sch_gen(credit_id: int, b: AnnuityIn, ws=Depends(guard)):
        run(generate_schedule, ws.conn, credit_id, b.annuity, b.first_pay_date, b.amount, b.period_rate_index,
            b.n_periods, b.dovr)
        return {"ok": True, "pending": True}

    @r.post("/{credit_id}/schedule/delete")
    def _sch_del(credit_id: int, body: dict, ws=Depends(guard)):
        run(require_paymentshe, ws.conn)
        ids = [str(x) for x in body.get("rowids", [])][:500]
        valid = {x["ROWID"] for x in ws.conn.query(Q.SQL_SCHEDULE_SCHEDULEDATA, {"CREDITID": credit_id})}
        for rid in ids:
            if rid in valid:
                ws.conn.execute(SQL_SCHEDULE_DELETE, {"doa__rowid": rid})
        return {"ok": True, "pending": True}

    @r.post("/{credit_id}/schedule/save")
    def _sch_save(credit_id: int, ws=Depends(guard)):
        ws.conn.commit()
        return {"ok": True}

    @r.post("/{credit_id}/schedule/close")
    def _sch_close(credit_id: int, ws=Depends(guard)):
        ws.conn.rollback()
        return {"ok": True}

    # reports -----------------------------------------------------------------------------------
    @r.post("/reports/coefficient")
    def _coef(b: CoefIn, ws=Depends(guard)):
        res = run(coefficient, ws.conn, b.kind, b.date, b.branches, b.categories)
        return _jsonable(res)

    @r.post("/reports/coefficient.xlsx")
    def _coefx(b: CoefIn, ws=Depends(guard)):
        res = run(coefficient, ws.conn, b.kind, b.date, b.branches, b.categories)
        data = coefficient_xlsx(b.kind, b.date, res, "TuranBank ASC-də")
        return Response(data, media_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                        headers={"Content-Disposition": f'attachment; filename="coefficient-{b.kind}-{b.date}.xlsx"'})

    @r.post("/reports/deca.xml")
    def _deca(b: DecaIn, ws=Depends(guard)):
        xml, n = deca_closed(ws.conn, b.bank_id, b.bank_name, b.rep_date, b.hdate, b.edate, b.mode,
                             b.bdate or b.rep_date, b.edate2 or b.rep_date, b.number.strip())
        if n == 0:
            err(400, "credits.err_deca_empty")
        return Response(xml.encode("utf-8"), media_type="application/xml",
                        headers={"Content-Disposition": f'attachment; filename="deca-{b.rep_date}.xml"', "X-Exported": str(n)})

    return r


SQL_TODAY_PAYMENTS = "select creditid from cm_payments where paydate=sbop.get_date"
"""CM_Filter :133 sub-select (Delphi builds '(ID=select ...)' which a TDataSet filter cannot evaluate - see parity)."""


def _jsonable(o):
    if isinstance(o, Decimal):
        return float(o)
    if isinstance(o, dict):
        return {k: _jsonable(v) for k, v in o.items()}
    if isinstance(o, list):
        return [_jsonable(v) for v in o]
    return o
