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
import re
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


CREDIT_CLSIDS = (
    CLSID,
    "{8F34DD46-F566-4FD1-B534-F16C0ADCE284}",
    "{41D53F48-4A53-4CD1-98AD-82E1BE97C033}",
    "{02878282-54DE-44C6-9D21-30CBE95D7331}",
)

DEFAULT_MAIN_COLUMNS = [
    ("ID", 1, 0, "ID"),
    ("NUMBEROFCREDIT", 1, 0, "Müqavilə №"),
    ("CONTRACTACCNO", 0, 0, "Kredit hesabı"),
    ("VAL_NAME", 0, 0, "Valyuta"),
    ("STATUS", 0, 0, "Status"),
    ("NAME", 0, 0, "Borcalan"),
    ("ANNUALYINTERESTRATE", 0, 0, "İllik %"),
    ("REST", 0, 0, "Əsas borc qalığı"),
    ("INTERESTREST", 0, 0, "Faiz qalığı"),
    ("DUEREST", 0, 0, "Vaxtı keçmiş əsas borc"),
    ("DUEINTERESTREST", 0, 0, "Vaxtı keçmiş faiz"),
    ("CREDITLINEAMOUNT", 0, 0, "Kredit xətti məbləği"),
    ("INITIALAMOUNT", 0, 0, "İlkin məbləğ"),
    ("ANNUALYOVERDUERATE", 0, 0, "Vaxtı keçmiş %"),
    ("ANNUALYPENALTYRATE", 0, 0, "Cərimə %"),
    ("OBLIGATION", 0, 0, "Öhdəlik"),
    ("PLEDGEPRICE", 0, 0, "Girov dəyəri"),
    ("PENALTYREST", 0, 0, "Cərimə qalığı"),
    ("BOOROWERREST", 0, 0, "Cari hesab qalığı"),
    ("DATEOFCONCLUSION", 0, 0, "Verilmə tarixi"),
    ("DUEDATEFIRSTCONTRACT", 0, 0, "İlk bitmə tarixi"),
    ("DUEDATELASTCONTRACT", 0, 0, "Son bitmə tarixi"),
    ("FILIAL", 0, 0, "Filial"),
    ("STOPCALCDATE", 0, 0, "Faiz dayandırılma tarixi"),
    ("KR_STATUS", 0, 0, "Kredit statusu"),
    ("IPREST", 0, 1, "İpoteka əsas qalıq"),
    ("IPINTERESTREST", 0, 1, "İpoteka faiz qalığı"),
    ("PLEDGEPRICETORPAQ", 0, 1, "Torpaq girov dəyəri"),
    ("PLEDGEPRICEEV", 0, 1, "Ev girov dəyəri"),
]


def grid_layout(conn) -> dict:
    """LoadFieldsList :480-530: column order = RecNo of cm_fields_list (seqno), VISIBLE=0 means visible,
    FrozenCols = SUM(FROZEN). Falls back to CreditsmgrImpl.dfm design-time columns if cm_visible_fields/cm_fields_list is empty."""
    try:
        rows = conn.query(Q.SQL_VISIBLE_FIELDS)
    except DBError:
        rows = []
    if not rows:
        rows = [{"SEQNO": i + 1, "FIELDNAME": f, "FROZEN": fr, "VISIBLE": vis, "FIELDDESC": desc}
                for i, (f, fr, vis, desc) in enumerate(DEFAULT_MAIN_COLUMNS)]
    cols = [{"field": r["FIELDNAME"], "visible": int(r["VISIBLE"] or 0) == 0, "desc": r.get("FIELDDESC")} for r in rows]
    try:
        seq = conn.query(Q.SQL_SEQ)
    except DBError:
        seq = []
    return {"columns": cols, "frozen": sum(int(r["FROZEN"] or 0) for r in rows),
            "status_col": int(seq[0]["SEQNO"]) if seq else 5}


def plugin_access(conn, plugin: str, param: str = "NONE") -> bool:
    """CreditsMainMenuBeforeLoadPlugin :650-663 (Param '' -> 'NONE')."""
    try:
        pid = conn.call_func("CM_ADMINISTRATION", "getpluginid", [plugin, param or "NONE"], int)
        return conn.call_bool("CM_ADMINISTRATION", "pluginaccess", [pid])
    except DBError:
        return True


def adm_addition(conn, code: str) -> int:
    try:
        return conn.call_func("CM_ADMINISTRATION", "getadmaddition", [code], int)
    except DBError:
        try:
            return conn.call_func("CM_ADMINISTRATION", "is_adminnum", [], int)
        except DBError:
            return 1


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

    # ==============================================================================================
    # Additional Packages/SB_Credit BPL/OCX Sub-Plugin Endpoints
    # ==============================================================================================
    @r.post("/customers/quick-add")
    def _quick_cust(body: dict, ws=Depends(guard)):
        """CM_Customer.bpl (CustomerFormU.pas): quick customer creation inside Credits via cm_credit.add_cm_customer."""
        name = (body.get("name") or "").strip()
        short_name = (body.get("short_name") or name).strip()
        if not name:
            err(400, "customers.err_name")
        d_open = datetime.datetime.fromisoformat(str(body.get("open_dat") or "2026-10-25")[:10])
        cid = ws.conn.call_func("CM_CREDIT", "add_cm_customer", [], int, named={
            "OPEN_DAT": d_open, "NAME": name, "SHORT_NAME": short_name,
            "NEREZIDENT": int(body.get("nerezident") or 0),
            "CUST_TYPE": int(body.get("cust_type") or 1),
            "INN": body.get("inn") or "",
            "PASPORT": body.get("pasport") or "",
            "ADDRESS": body.get("address") or "",
            "PHONE": body.get("phone") or "",
        })
        return {"id": cid, "name": name, "customers": [row(x) for x in ws.conn.query(Q.SQL_CUSTOMER)]}

    @r.post("/accounts/auto-create")
    def _create_cm_accounts(body: dict, ws=Depends(guard)):
        """CM_Conclusion/CreateAccsUnit.pas (FormCreateCMAccounts): calls CM_CREDIT.AddCreditAccounts."""
        cust_id = int(body.get("cust_id") or 0)
        currency = int(body.get("currency") or 0)
        credit_type = int(body.get("credit_type") or 1)
        term_type = int(body.get("term_type") or 1)
        if not cust_id:
            err(400, "credits.err_borrower")
        res = ws.conn.call_func("CM_CREDIT", "AddCreditAccounts", [], dict, named={
            "p_custid": cust_id, "p_currency": currency, "p_credittype": credit_type, "p_termtype": term_type
        })
        return {"created": res, "accounts": account_lists(ws.conn, currency, cust_id)}

    @r.get("/{credit_id}/tranches")
    def _tranches_get(credit_id: int, ws=Depends(guard)):
        """CM_Tranche.bpl (TrancheMainUnitImpl.pas): tranches list + credit info + DebitArested flag check."""
        rows = [row(x) for x in ws.conn.query(Q.SQL_TRANCHES, {"creditid": credit_id})]
        ci = [row(x) for x in ws.conn.query(Q.SQL_SCHEDULE_CREDITINFO, {"ID": credit_id})]
        arrested = ws.conn.call_bool("CM_TRANCHE", "FindAccFlag", [credit_id, "DebitArested"])
        return {"rows": rows, "credit": ci[0] if ci else {}, "debit_arrested": arrested}

    @r.post("/{credit_id}/tranches")
    def _tranches_add(credit_id: int, body: dict, ws=Depends(guard)):
        """CM_Tranche.bpl: CM_TRANCHE.Tranche_Add + CommitTranche."""
        if not plugin_access(ws.conn, "CM_Tranche.bpl", "NONE"):
            err(403, "credits.err_plugin")
        amt = float(body.get("amount") or 0)
        if amt <= 0:
            err(400, "error.generic")
        dt = datetime.datetime.fromisoformat(str(body.get("tranchedate") or "2026-10-25")[:10])
        tid = ws.conn.call_func("CM_TRANCHE", "Tranche_Add", [], int, named={
            "p_creditid": credit_id, "p_date": dt, "p_amount": amt,
            "p_purpose": body.get("purpose") or "Kredit verilişi (Tranş)",
            "p_cash": int(body.get("is_cash") or 0),
        })
        if body.get("commit", True):
            ws.conn.call_proc("CM_TRANCHE", "CommitTranche", [], named={"p_id": tid, "p_creditid": credit_id})
        return {"ok": True, "id": tid, "rows": [row(x) for x in ws.conn.query(Q.SQL_TRANCHES, {"creditid": credit_id})]}

    @r.delete("/{credit_id}/tranches/{tranche_id}")
    def _tranches_del(credit_id: int, tranche_id: int, ws=Depends(guard)):
        ws.conn.call_proc("CM_TRANCHE", "Tranche_Delete", [], named={"p_id": tranche_id, "p_creditid": credit_id})
        return {"ok": True, "rows": [row(x) for x in ws.conn.query(Q.SQL_TRANCHES, {"creditid": credit_id})]}

    @r.get("/{credit_id}/payments")
    def _payments_get(credit_id: int, ws=Depends(guard)):
        """CM_Payment.bpl (PaymentMainFormImpl.pas): payments list + current rests + planned payment."""
        rows = [row(x) for x in ws.conn.query(Q.SQL_PAYMENTS, {"creditid": credit_id})]
        st = [row(x) for x in ws.conn.query(Q.SQL_CURR_STATE, {"creditid": credit_id})]
        plan = ws.conn.call_func("CM_PAYMENT", "Get_PlanPayment", [credit_id], dict)
        return {"rows": rows, "state": st[0] if st else {}, "plan": plan}

    @r.post("/{credit_id}/payments")
    def _payments_add(credit_id: int, body: dict, ws=Depends(guard)):
        """CM_Payment.bpl: CM_PAYMENT.PaymentAdd + CommitPayment (supports CBFullPay full payoff & partial distribution)."""
        if not plugin_access(ws.conn, "CM_Payment.bpl", "NONE"):
            err(403, "credits.err_plugin")
        dt = datetime.datetime.fromisoformat(str(body.get("paydate") or "2026-10-25")[:10])
        pid = ws.conn.call_func("CM_PAYMENT", "PaymentAdd", [], int, named={
            "p_creditid": credit_id, "p_date": dt,
            "p_total": float(body.get("total") or 0),
            "p_main": float(body.get("main_amount") or 0),
            "p_duemain": float(body.get("duemain_amount") or 0),
            "p_interest": float(body.get("interest_amount") or 0),
            "p_dueinterest": float(body.get("dueinterest_amount") or 0),
            "p_penalty": float(body.get("penalty_amount") or 0),
            "p_fullpay": 1 if body.get("full_pay") else 0,
            "p_notes": body.get("notes") or "Kredit ödənişi",
        })
        if body.get("commit", True):
            ws.conn.call_proc("CM_PAYMENT", "CommitPayment", [], named={"p_id": pid, "p_creditid": credit_id})
        return {"ok": True, "id": pid, "rows": [row(x) for x in ws.conn.query(Q.SQL_PAYMENTS, {"creditid": credit_id})]}

    @r.delete("/{credit_id}/payments/{pay_id}")
    def _payments_del(credit_id: int, pay_id: int, ws=Depends(guard)):
        ws.conn.call_proc("CM_PAYMENT", "PaymentDel", [], named={"p_id": pay_id, "p_creditid": credit_id})
        return {"ok": True, "rows": [row(x) for x in ws.conn.query(Q.SQL_PAYMENTS, {"creditid": credit_id})]}

    @r.get("/{credit_id}/prolongations")
    def _prolong_get(credit_id: int, ws=Depends(guard)):
        """CM_Prolongation.bpl (ProlongationMainFormImpl.pas)."""
        return {"rows": [row(x) for x in ws.conn.query(Q.SQL_PROLONGATIONS, {"creditid": credit_id})]}

    @r.post("/{credit_id}/prolongations")
    def _prolong_add(credit_id: int, body: dict, ws=Depends(guard)):
        dt = datetime.datetime.fromisoformat(str(body.get("prolongdate") or "2026-10-25")[:10])
        new_due = datetime.datetime.fromisoformat(str(body.get("newduedate") or "2027-10-25")[:10])
        pid = ws.conn.call_func("CM_PROLONGATION", "Prolongation_Add", [], int, named={
            "p_creditid": credit_id, "p_date": dt, "p_newduedate": new_due,
            "p_rate": float(body.get("newrate") or 0),
            "p_amount": float(body.get("amount") or 0),
            "p_notes": body.get("notes") or "Müddətin uzadılması",
        })
        return {"ok": True, "id": pid, "rows": [row(x) for x in ws.conn.query(Q.SQL_PROLONGATIONS, {"creditid": credit_id})]}

    @r.delete("/{credit_id}/prolongations/last")
    def _prolong_del_last(credit_id: int, ws=Depends(guard)):
        ws.conn.call_proc("CM_PROLONGATION", "DelLastProlongation", [], named={"p_creditid": credit_id})
        return {"ok": True, "rows": [row(x) for x in ws.conn.query(Q.SQL_PROLONGATIONS, {"creditid": credit_id})]}

    @r.get("/{credit_id}/expires")
    def _expires_get(credit_id: int, ws=Depends(guard)):
        """CM_Expire.bpl (ExpireMainUnitImpl.pas): overdue principal/interest transfers."""
        return {"rows": [row(x) for x in ws.conn.query(Q.SQL_EXPIRES, {"creditid": credit_id})]}

    @r.post("/{credit_id}/expires")
    def _expires_add(credit_id: int, body: dict, ws=Depends(guard)):
        dt = datetime.datetime.fromisoformat(str(body.get("expiredate") or "2026-10-25")[:10])
        eid = ws.conn.call_func("CM_EXPIRE", "Expire_Add", [], int, named={
            "p_creditid": credit_id, "p_date": dt,
            "p_main": float(body.get("main_amount") or 0),
            "p_interest": float(body.get("interest_amount") or 0),
            "p_notes": body.get("notes") or "Vaxtı keçmiş hesabata köçürmə",
        })
        if body.get("commit", True):
            ws.conn.call_proc("CM_EXPIRE", "CommitExpire", [], named={"p_id": eid, "p_creditid": credit_id})
        return {"ok": True, "id": eid, "rows": [row(x) for x in ws.conn.query(Q.SQL_EXPIRES, {"creditid": credit_id})]}

    @r.delete("/{credit_id}/expires/{exp_id}")
    def _expires_del(credit_id: int, exp_id: int, ws=Depends(guard)):
        ws.conn.call_proc("CM_EXPIRE", "Expire_Delete", [], named={"p_id": exp_id, "p_creditid": credit_id})
        return {"ok": True, "rows": [row(x) for x in ws.conn.query(Q.SQL_EXPIRES, {"creditid": credit_id})]}

    @r.post("/{credit_id}/activate")
    def _activate_credit(credit_id: int, body: dict, ws=Depends(guard)):
        """CM_Activate.bpl (ActivateMainFormImpl.pas): CM_ACTIVATION.ActivateCredit + CommitActivation."""
        dt = datetime.datetime.fromisoformat(str(body.get("actdate") or "2026-10-25")[:10])
        ws.conn.call_proc("CM_ACTIVATION", "ActivateCredit", [], named={
            "p_creditid": credit_id, "p_date": dt, "p_notes": body.get("notes") or "Kreditin aktivləşdirilməsi"
        })
        if body.get("commit", True):
            ws.conn.call_proc("CM_ACTIVATION", "CommitActivation", [], named={"p_creditid": credit_id})
        return {"ok": True, "status": get_status(ws.conn, credit_id)}

    @r.get("/interest-calc")
    def _intcalc_get(ws=Depends(guard)):
        """CM_InterestCalculation.bpl (IntCalcMainUnitImpl.pas): CM_INTCACHE & cm_endcalac."""
        return {
            "cache": [row(x) for x in ws.conn.query(Q.SQL_INTCACHE)],
            "history": [row(x) for x in ws.conn.query(Q.SQL_ENDCALAC)],
        }

    @r.post("/interest-calc")
    def _intcalc_run(body: dict, ws=Depends(guard)):
        action = body.get("action") or "calc"
        dt = datetime.datetime.fromisoformat(str(body.get("calcdate") or "2026-10-25")[:10])
        cid = body.get("credit_id")
        if action == "calc":
            ws.conn.call_proc("CM_CALCULATOR", "CalcPercents", [], named={"p_date": dt, "p_creditid": cid})
        elif action == "accept":
            ws.conn.call_proc("CM_CALCULATOR", "AcceptCalcedPercents", [], named={"p_date": dt, "p_creditid": cid})
        elif action == "cancel":
            ws.conn.call_proc("CM_CALCULATOR", "CancelCalculation", [], named={"p_creditid": cid})
        elif action == "stop":
            ws.conn.call_proc("CM_CALCULATOR", "StopCreditInterest", [], named={"p_creditid": cid, "p_date": dt})
        return {
            "ok": True,
            "cache": [row(x) for x in ws.conn.query(Q.SQL_INTCACHE)],
            "history": [row(x) for x in ws.conn.query(Q.SQL_ENDCALAC)],
        }

    @r.get("/{credit_id}/corrector")
    def _corrector_get(credit_id: int, ws=Depends(guard)):
        """CM_Corrector.bpl (CorrectorMainUnitImpl.pas): cm_curr_state + cm_history_audit."""
        st = [row(x) for x in ws.conn.query(Q.SQL_CURR_STATE, {"creditid": credit_id})]
        aud = [row(x) for x in ws.conn.query(Q.SQL_HISTORY_AUDIT, {"creditid": credit_id})]
        return {"state": st[0] if st else {}, "audit": aud}

    @r.post("/{credit_id}/corrector")
    def _corrector_save(credit_id: int, body: dict, ws=Depends(guard)):
        ws.conn.call_proc("CM_CREDIT", "UpdateCurrState", [], named={
            "p_creditid": credit_id,
            "p_rest": float(body.get("rest") or 0),
            "p_interestrest": float(body.get("interestrest") or 0),
            "p_duerest": float(body.get("duerest") or 0),
            "p_dueinterestrest": float(body.get("dueinterestrest") or 0),
            "p_penaltyrest": float(body.get("penaltyrest") or 0),
            "p_pledgeprice": float(body.get("pledgeprice") or 0),
            "p_obligation": float(body.get("obligation") or 0),
            "p_reason": body.get("reason") or "Korrektor vasitəsilə düzəliş",
        })
        st = [row(x) for x in ws.conn.query(Q.SQL_CURR_STATE, {"creditid": credit_id})]
        aud = [row(x) for x in ws.conn.query(Q.SQL_HISTORY_AUDIT, {"creditid": credit_id})]
        return {"ok": True, "state": st[0] if st else {}, "audit": aud}

    @r.get("/{credit_id}/statement")
    def _statement_get(credit_id: int, bdate: str = "", edate: str = "", ws=Depends(guard)):
        """CM_Statement.bpl (StatementMainUnitImpl.pas): 6-tab Credit Statement & Payoff Calculator."""
        card = run(open_card, ws.conn, credit_id)
        st = [row(x) for x in ws.conn.query(Q.SQL_CURR_STATE, {"creditid": credit_id})]
        tr = [row(x) for x in ws.conn.query(Q.SQL_TRANCHES, {"creditid": credit_id})]
        py = [row(x) for x in ws.conn.query(Q.SQL_PAYMENTS, {"creditid": credit_id})]
        sc = [row(x) for x in ws.conn.query(Q.SQL_SCHEDULE_SCHEDULEDATA, {"CREDITID": credit_id})]
        ex = [row(x) for x in ws.conn.query(Q.SQL_EXPIRES, {"creditid": credit_id})]
        pu = [row(x) for x in ws.conn.query(Q.SQL_PORTFOLIO_UPDATE, {"creditid": credit_id})]
        cur_st = st[0] if st else {}
        full_payoff = sum(float(cur_st.get(k) or 0) for k in ("rest", "duerest", "interestrest", "dueinterestrest", "penaltyrest"))
        return {
            "card": _ser(card),
            "state": cur_st,
            "tranches": tr,
            "payments": py,
            "schedule": sc,
            "expires": ex,
            "portfolio_updates": pu,
            "full_payoff": round(full_payoff, 2),
        }

    @r.get("/{credit_id}/guarantees")
    def _guar_get(credit_id: int, ws=Depends(guard)):
        """Cm_NewGuarantee.bpl (GuaranteeMainUnitImpl.pas): multi-card Girov (CM_GUARANTEE) & Zamin (CM_GUARANTOR)."""
        return {
            "collaterals": [row(x) for x in ws.conn.query(Q.SQL_GUARANTEE_CARDS, {"creditid": credit_id})],
            "guarantors": [row(x) for x in ws.conn.query(Q.SQL_GUARANTOR_CARDS, {"creditid": credit_id})],
            "companies": [row(x) for x in ws.conn.query(Q.SQL_GUARCOMPANY)],
            "pledge_types": [row(x) for x in ws.conn.query(Q.SQL_PLEDGES)],
        }

    @r.post("/{credit_id}/guarantees")
    def _guar_save(credit_id: int, body: dict, ws=Depends(guard)):
        kind = body.get("kind") or "collateral"
        ws.conn.call_proc("CM_CREDIT", "SaveGuaranteeCard", [], named={"p_creditid": credit_id, "p_kind": kind, **body})
        return _guar_get(credit_id, ws)

    @r.delete("/{credit_id}/guarantees/{kind}/{card_id}")
    def _guar_del(credit_id: int, kind: str, card_id: int, ws=Depends(guard)):
        ws.conn.call_proc("CM_CREDIT", "DeleteGuaranteeCard", [], named={"p_creditid": credit_id, "p_kind": kind, "p_cardid": card_id})
        return _guar_get(credit_id, ws)

    @r.get("/{credit_id}/advanced-info")
    def _adv_get(credit_id: int, ws=Depends(guard)):
        """CM_AdvencedInfo.bpl (AdvInfoMainUnitImpl.pas): 3-tab cm_boorowerinfo."""
        b = [row(x) for x in ws.conn.query(Q.SQL_BOOROWERINFO, {"creditid": credit_id})]
        return {"info": b[0] if b else {}}

    @r.post("/{credit_id}/advanced-info")
    def _adv_save(credit_id: int, body: dict, ws=Depends(guard)):
        ws.conn.call_proc("CM_CREDIT", "SaveAdvancedInfo", [], named={"p_creditid": credit_id, **body})
        b = [row(x) for x in ws.conn.query(Q.SQL_BOOROWERINFO, {"creditid": credit_id})]
        return {"ok": True, "info": b[0] if b else {}}

    @r.get("/{credit_id}/business-plan")
    def _bp_get(credit_id: int, ws=Depends(guard)):
        """CM_BUSINESS_PLAN.bpl (BPMainUnitImpl.pas): Business Plan (tsBP), Legal Measures (tsLM), Machinery (tsGrantT)."""
        return {
            "business_plan": [row(x) for x in ws.conn.query(Q.SQL_BUSINESS_PLAN, {"creditid": credit_id})],
            "legal_measures": [row(x) for x in ws.conn.query(Q.SQL_LEGAL_MEASURES, {"creditid": credit_id})],
            "grant_tech": [row(x) for x in ws.conn.query(Q.SQL_GRANT_TECH, {"creditid": credit_id})],
        }

    @r.post("/{credit_id}/business-plan")
    def _bp_save(credit_id: int, body: dict, ws=Depends(guard)):
        ws.conn.call_proc("CM_CREDIT", "SaveBusinessPlanItem", [], named={"p_creditid": credit_id, **body})
        return _bp_get(credit_id, ws)

    @r.get("/{credit_id}/protokol")
    def _prot_get(credit_id: int, ws=Depends(guard)):
        """CM_Protokol.bpl (ProtokolMainUnitImpl.pas): Credit Committee Protocol & Application."""
        p = [row(x) for x in ws.conn.query(Q.SQL_PROTOKOL, {"creditid": credit_id})]
        card = run(open_card, ws.conn, credit_id)
        return {"protokol": p[0] if p else {}, "card": _ser(card)}

    @r.post("/{credit_id}/protokol")
    def _prot_save(credit_id: int, body: dict, ws=Depends(guard)):
        ws.conn.call_proc("CM_CREDIT", "up_port_protokol", [], named={"p_creditid": credit_id, **body})
        p = [row(x) for x in ws.conn.query(Q.SQL_PROTOKOL, {"creditid": credit_id})]
        return {"ok": True, "protokol": p[0] if p else {}}

    @r.get("/{credit_id}/notes")
    def _notes_get(credit_id: int, ws=Depends(guard)):
        """cm_notes.bpl (NotesMainUnitImpl.pas): Credit notes & reminders."""
        return {"rows": [row(x) for x in ws.conn.query(Q.SQL_NOTES, {"creditid": credit_id})]}

    @r.post("/{credit_id}/notes")
    def _notes_save(credit_id: int, body: dict, ws=Depends(guard)):
        ws.conn.call_proc("CM_CREDIT", "Addcm_notes", [], named={
            "p_creditid": credit_id, "p_id": body.get("id"),
            "p_note": body.get("note") or "", "p_date": body.get("notedate") or "2026-10-25",
            "p_user": ws.user,
        })
        return {"ok": True, "rows": [row(x) for x in ws.conn.query(Q.SQL_NOTES, {"creditid": credit_id})]}

    @r.delete("/{credit_id}/notes/{note_id}")
    def _notes_del(credit_id: int, note_id: int, ws=Depends(guard)):
        ws.conn.call_proc("CM_CREDIT", "delete_notes", [], named={"p_creditid": credit_id, "p_id": note_id})
        return {"ok": True, "rows": [row(x) for x in ws.conn.query(Q.SQL_NOTES, {"creditid": credit_id})]}

    @r.get("/{credit_id}/folder-place")
    def _fp_get(credit_id: int, ws=Depends(guard)):
        """CM_FolderPlace.bpl (FolderPlaceMainUnitImpl.pas): Problem credit dossier location, court (Mehteme), execution (Icra)."""
        return {"rows": [row(x) for x in ws.conn.query(Q.SQL_FOLDER_PLACE, {"creditid": credit_id})]}

    @r.post("/{credit_id}/folder-place")
    def _fp_save(credit_id: int, body: dict, ws=Depends(guard)):
        ws.conn.call_proc("CM_CREDIT", "SaveFolderPlace", [], named={"p_creditid": credit_id, **body})
        return {"ok": True, "rows": [row(x) for x in ws.conn.query(Q.SQL_FOLDER_PLACE, {"creditid": credit_id})]}

    @r.get("/{credit_id}/tranche-schedule")
    def _tr_sch_get(credit_id: int, ws=Depends(guard)):
        """CM_Schedule.bpl (ScheduleType=TRANCHE): CM_TRANCHE_SCHEDULE."""
        return {"rows": [row(x) for x in ws.conn.query(Q.SQL_TRANCHE_SCHEDULE, {"creditid": credit_id})]}

    @r.post("/{credit_id}/tranche-schedule")
    def _tr_sch_save(credit_id: int, body: dict, ws=Depends(guard)):
        ws.conn.call_proc("CM_SCHEDULE", "SaveTrancheSchedule", [], named={"p_creditid": credit_id, **body})
        return {"ok": True, "rows": [row(x) for x in ws.conn.query(Q.SQL_TRANCHE_SCHEDULE, {"creditid": credit_id})]}

    @r.post("/{credit_id}/schedule/shift-dates")
    def _sch_shift(credit_id: int, body: dict, ws=Depends(guard)):
        """CM_Schedule/ChangeScheduleUnit.pas (FrmChangeSchedule): shift schedule dates by N months/days."""
        months = int(body.get("months") or 0)
        days = int(body.get("days") or 0)
        ws.conn.call_proc("CM_SCHEDULE", "ShiftScheduleDates", [], named={
            "p_creditid": credit_id, "p_months": months, "p_days": days
        })
        return run(schedule, ws.conn, credit_id)

    @r.get("/adm")
    def _adm_get(ws=Depends(guard)):
        """CM_ADM.bpl (AdmMainUnitImpl.pas): 3-tab Credit Administration (Plugins, Users, Groups)."""
        return {
            "plugins": [row(x) for x in ws.conn.query(Q.SQL_ADM_PLUGINS)],
            "users": [row(x) for x in ws.conn.query(Q.SQL_ADM_USERS)],
            "groups": [row(x) for x in ws.conn.query(Q.SQL_ADM_GROUPS)],
        }

    @r.post("/adm")
    def _adm_save(body: dict, ws=Depends(guard)):
        ws.conn.call_proc("CM_ADMINISTRATION", "SaveAdmItem", [], named=body)
        return _adm_get(ws)

    @r.get("/setup/{section}")
    def _setup_get(section: str, ws=Depends(guard)):
        """CM_Setup.bpl & Settings BPLs: 12-tab Credit Setup and Reference Tables."""
        c = ws.conn
        g = lambda s: [row(x) for x in c.query(s)]
        mapping = {
            "visible_fields": Q.SQL_VISIBLE_FIELDS,
            "account_groups": Q.SQL_SETUP_ACCOUNTGROUPS,
            "ie_tuning": Q.SQL_SETUP_IETUNING,
            "tr_descriptions": Q.SQL_SETUP_TRDESCRIPTIONS,
            "credit_types": Q.SQL_CREDIT_TYPES,
            "user_groups": Q.SQL_USR_GROUPS,
            "categories": Q.SQL_FILTER_CATEGORIES,
            "pledges": Q.SQL_PLEDGES,
            "reserves": Q.SQL_RESERVES,
            "experts": Q.SQL_FILTER_EXPERTDAET,
            "aims": Q.SQL_AIM,
            "mehsul": Q.SQL_MEHSUL,
        }
        if section not in mapping:
            err(400, "error.generic")
        return {"section": section, "rows": g(mapping[section])}

    @r.post("/setup/{section}")
    def _setup_save(section: str, body: dict, ws=Depends(guard)):
        ws.conn.call_proc("CM_ADMINISTRATION", "SaveSetupItem", [], named={"p_section": section, **body})
        return _setup_get(section, ws)

    @r.post("/reports/extra/{report_type}")
    def _extra_reports(report_type: str, body: dict, ws=Depends(guard)):
        """CM_ReserveInf, CM_Custominformesin, CM_pledge_guarantor, CM_UnversalReport, CM_AK_Reports, CM_Search."""
        rows = [row(x) for x in list_credits(ws.conn, "ID", False)]
        if report_type == "reserve_inf":
            out = [{"id": r["id"], "numberofcredit": r.get("numberofcredit"), "name": r.get("name"),
                    "val_name": r.get("val_name"), "rest": r.get("rest", 0), "duerest": r.get("duerest", 0),
                    "reserve_pct": 2.0 if (r.get("duerest") or 0) == 0 else 25.0,
                    "reserve_amt": round(((r.get("rest") or 0) + (r.get("duerest") or 0)) * (0.02 if (r.get("duerest") or 0) == 0 else 0.25), 2)}
                   for r in rows]
        elif report_type == "pledge_guarantor":
            out = []
            for r in rows:
                g = _guar_get(r["id"], ws)
                out.append({"id": r["id"], "numberofcredit": r.get("numberofcredit"), "name": r.get("name"),
                            "rest": r.get("rest", 0), "pledgeprice": r.get("pledgeprice", 0),
                            "collaterals_count": len(g["collaterals"]), "guarantors_count": len(g["guarantors"])})
        else:
            out = rows
        return {"report_type": report_type, "rows": out, "total": len(out)}

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
    # Delphi's SQL[76] replaces the "B.DATEOFCONCLUSION<=:HDATE" line and SQL[77] the "P.ID = B.CUSTOMERTYPE" line
    # (DecaMainForm.pas:594/596); only bind variables still present in the text may be passed to Oracle.
    binds = {k: v for k, v in binds.items() if re.search(r":" + k + r"\b", sql, re.I)}
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
    base_guard = require_module(CLSID)

    def guard(ws=Depends(current)):
        if any(ws.conn.call_bool("SB_ACA", "CHECKMODRIGHT", [c]) for c in CREDIT_CLSIDS):
            return ws
        return base_guard(ws)

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
