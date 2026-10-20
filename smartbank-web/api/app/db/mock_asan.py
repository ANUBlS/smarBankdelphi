"""Mock for Packages/ASANFinance (asanfinance.py). Answers only asan_sql.SQL_ASAN_* texts and the two asan_log
inserts; asan_log lives in memory (seeded from fixtures/asan.json). The JSON_TABLE / json_value selects are evaluated in
Python on the stored INFO text with the same paths (lax mode: '$.Status[*]' also matches a single object).
asan_transaction.add_cust returns the next mock customer id and is recorded."""
from __future__ import annotations
import datetime
import json
import os

from .. import asan_sql as Q
from .. import asanfinance as A

_S = None
ADD_CUST: list = []


def reset():
    global _S
    _S = None
    ADD_CUST.clear()


def _st():
    global _S
    if _S is None:
        from ..config import settings
        D = json.load(open(os.path.join(settings.mock_fixtures, "asan.json"), encoding="utf-8"))
        _S = {"D": D, "log": [dict(x) for x in D["asan_log"]], "seq": D["seq_asan_loq"], "pending": [], "cust": 90000}
    return _S


def _arr(v):
    return v if isinstance(v, list) else ([] if v is None else [v])


def _get(o, path):
    for p in path.split("."):
        if not isinstance(o, dict):
            return None
        o = o.get(p)
    return o


def _s(v):
    return None if v is None or isinstance(v, (dict, list)) else (str(v) if not isinstance(v, str) else v)


def _info(i):
    for r in _st()["log"] + _st()["pending"]:
        if r["ID"] == i:
            try:
                return json.loads(r.get("INFO") or "null")
            except ValueError:
                return None
    return None


def _jt(i, base, cols, ordinality=True):
    j = _info(i)
    if j is None:
        return []
    out = []
    for n, e in enumerate(_arr(_get(j, base) if base else j), 1):
        r = {"ID": i}
        if ordinality:
            r["ROW_NUMBER"] = n
        for c, p in cols:
            r[c] = _s(_get(e, p))
        out.append(r)
    return out


EMP = [("VOEN", "Employer.Voen"), ("NAME", "Employer.Name"), ("WORKERCOUNT", "Employer.WorkerCount"),
       ("LEGALADDRESS", "Employer.LegalAddress"), ("FIRM_PHONE", "Employer.Phone"), ("EMLAKNOVU", "Employer.PropertyType.Description"),
       ("ISHCIADI", "Employee.Name"), ("SURNAME", "Employee.Surname"), ("PATRONYMIC", "Employee.Patronymic"), ("PHONE", "Employee.Phone"),
       ("ISHYERINOVU", "Employee.WorkPlaceType.Description"), ("WORKPLACE", "Employee.WorkPlace"), ("POSITION", "Employee.Position"),
       ("POSITIONLABOURCONTRACT", "Employee.PositionLabourContract"), ("SALARY", "Employee.Salary"),
       ("WORKCASUALTYPE", "Employee.WorkCasualType.Description"), ("SSN", "Employee.SSN"), ("BEGINDATE", "Contract.BeginDate"),
       ("ENDDATE", "Contract.EndDate"), ("NEXTENDDATE", "Contract.NextEndDate"), ("PERIODTYPE", "Contract.PeriodType.Description"),
       ("NOMRE", "Contract.Number")]
DEACT = [("VOEN", "Employer.Voen"), ("NAME", "Employer.Name"), ("POSITION", "Employee.Position"), ("SALARY", "Employee.Salary"),
         ("BEGINDATE", "Contract.BeginDate"), ("ENDDATE", "Contract.EndDate")]
PEN = [("NAME", "Name"), ("SURNAME", "Surname"), ("PATRONYMIC", "Patronymic"), ("BIRTHDATE", "BirthDate"),
       ("ALLBEGINDATE", "Allowance.BeginDate"), ("ALLENDDATE", "Allowance.EndDate"), ("ALLTYPE", "Allowance.Type.Description"),
       ("ALLGROUP", "Allowance.Group.Description"), ("ALLAMOUNT", "Allowance.Amount"), ("PENLABEL", "Pension.Type.Label"),
       ("PENDESCRIPTION", "Pension.Type.Description"), ("PENSTARTDATE", "Pension.StartDate"), ("PENENDDATE", "Pension.EndDate"),
       ("PENAMOUNT", "Pension.Amount")]
FPERS = [("PIN", "Pin"), ("FIRSTNAME", "FirstName"), ("LASTNAME", "LastName"), ("FATHERNAME", "FatherName"), ("BIRTHDATE", "BirthDate")]
XERC = [("PIN", "Value"), ("DAT", "Date"), ("SERVICE", "Service"), ("AMOUNT", "Amount"), ("IPADDRESS", "IpAddress")]


def _farms(i):
    j = _info(i)
    out = []
    for e in _arr(_get(j, "Response")):
        fa = _get(e, "Farms") or {}
        for fn, f in enumerate(_arr(fa.get("Fields")), 1):
            pls = _arr(f.get("Plants")) or [None]
            for pn, p in enumerate(pls, 1):
                out.append({"ID": i, "FID": _s(fa.get("Id")), "NAME": _s(fa.get("Name")), "FIELDS": fn,
                            "VILLAGENAME": _s(f.get("VillageName")), "DOCTYPE": _s(f.get("DocType")),
                            "FIELDAMOUNT": _s(f.get("FieldAmount")), "UNIT": _s(f.get("Unit")),
                            "PLANTS": pn if p else None, "PLNAME": _s((p or {}).get("Name")),
                            "PLFIELDAMOUNT": _s((p or {}).get("FieldAmount")), "PLUNIT": _s((p or {}).get("Unit"))})
    return out


class AsanMixin:
    def _asan_query(self, sql, b):
        S = _st()
        if sql == Q.SQL_ASAN_BANKINFO:
            return [dict(S["D"]["bankinfo_t"])]
        if sql == Q.SQL_ASAN_ODS_LINK:
            return [dict(S["D"]["asan_info"])]
        if sql == Q.SQL_ASAN_IDDSET:
            S["seq"] += 1
            return [{"ID": S["seq"]}]
        if sql == Q.SQL_ASAN_LOGDSEST:
            today = datetime.date.fromisoformat(S["D"]["sysdate"][:10])
            rows = [r for r in S["log"] + S["pending"] if r.get("STATUS") == "success" and r.get("SERVICE") == b.get("service")
                    and r.get("PIN") == (b.get("pin") or None) and (r.get("DOCNUMBER") or "XX") == (b.get("doc") or "XX")
                    and datetime.date.fromisoformat(r["DAT"][:10]) >= today - datetime.timedelta(days=3)]
            return [{"INFO": r["INFO"]} for r in sorted(rows, key=lambda r: -r["ID"])]
        i = b.get("id")
        if sql == Q.SQL_ASAN_STATUS:
            return _jt(i, "Status", [("CODE", "Code"), ("MESSAGE", "Message")], ordinality=False)
        if sql == Q.SQL_ASAN_EMPLOYERDATASET:
            r = _jt(i, "Response.Active", EMP)
            for x in r:
                x["MQAVILE_BITME"] = x["ENDDATE"] if x["ENDDATE"] is not None else x["PERIODTYPE"]
            return r
        if sql == Q.SQL_ASAN_DEACTIVEEMPDSET:
            return _jt(i, "Response.Deactive", DEACT)
        if sql == Q.SQL_ASAN_PENSIONDSET:
            return _jt(i, "Response", PEN, ordinality=False)
        if sql == Q.SQL_ASAN_FARMPERSONDSET:
            return _jt(i, "Response.Person", FPERS, ordinality=False) if not isinstance(_get(_info(i), "Response"), list) else \
                [r for e in _arr(_get(_info(i), "Response")) for r in [dict({"ID": i}, **{c: _s(_get(p_, p)) for c, p in FPERS}) for p_ in _arr(e.get("Person"))]]
        if sql == Q.SQL_ASAN_FARMSET:
            return _farms(i) if isinstance(_get(_info(i), "Response"), list) else []
        if sql == Q.SQL_ASAN_XERCSET:
            r = _jt(i, "Response.Expenses", XERC)
            for x in r:
                x["AMOUNT"] = None if x["AMOUNT"] is None else float(x["AMOUNT"])
            return r
        if sql == Q.SQL_ASAN_VOENSET:
            j = _info(i)
            if j is None and not any(r["ID"] == i for r in S["log"] + S["pending"]):
                return []
            g = lambda p: _s(_get(j, p))
            cn = [g("Response.Chief.Name"), g("Response.Chief.Surname"), g("Response.Chief.Patronymic")]
            return [{"ID": i, "PAYER_TYPE": g("Response.PayerType.Type"), "PAYER_DESCRIPTION": g("Response.PayerType.Description"),
                     "LEGAL_ADDRESS": g("Response.NaturalPerson.LegalAddress") or g("Response.LegalEntity.LegalAddress"),
                     "VOEN": g("Response.VOENInfo.VOEN"), "VOEN_CREATE_DATE": g("Response.VOENInfo.CreateDate"),
                     "CHIEF_NAME": cn[0], "CHIEF_SURNAME": cn[1], "CHIEF_PATRONYMIC": cn[2],
                     "FULL_NAME": (cn[0] or "") + " " + (cn[1] or "") + " " + (cn[2] or "")}]
        return NotImplemented

    def _asan_execute(self, sql, b):
        if sql not in (A.SQL_INS_LOG_DUP, A.SQL_INS_LOG_OK):
            return False
        S = _st()
        r = {k: (None if v == "" else v) for k, v in b.items()}
        r["DAT"] = S["D"]["sysdate"]
        r["USR"] = self.username
        S["pending"].append(r)
        return True

    def _asan_commit(self):
        S = _S
        if S is not None and S["pending"]:
            S["log"].extend(S["pending"])
            S["pending"].clear()

    def _asan_func(self, key, named):
        if key != "ASAN_TRANSACTION.ADD_CUST":
            return NotImplemented
        S = _st()
        S["cust"] += 1
        ADD_CUST.append(dict(named or {}))
        return S["cust"]
