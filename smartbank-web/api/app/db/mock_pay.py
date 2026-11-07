"""Mock for Packages/Payments (payments.py). Answers only this module's own texts (pay_sql.SQL_PAY_*; ODSPayments with
its :sort substitution and SQL[39] filial line) from fixtures/payments.json. The Oracle select (outer joins on
ibank_client_products, CASE / DECODE columns, status / type / date predicates, outer 'where filial') is evaluated in
Python on the fixture rows; Ibank_change_status is recorded (no commit - the form never commits)."""
from __future__ import annotations
import datetime
import json
import os
import re

from .. import pay_sql as Q

_D = None
CALLS: list = []
_TT = {1: "Bank daxili", 2: "AZIPS", 3: "Konvertasiya", 4: "X.O.H.K.S", 5: "X.O.H.K.S (Büdcə)", 7: "Hesablar arasi",
       8: "Emekhaqqi", 9: "Xarici kocurmeler"}


def reset():
    global _D
    _D = None
    CALLS.clear()


def _db():
    global _D
    if _D is None:
        from ..config import settings
        _D = json.load(open(os.path.join(settings.mock_fixtures, "payments.json"), encoding="utf-8"))
    return _D


def _dt(s):
    return None if s is None else datetime.datetime.fromisoformat(s)


def _match_pay(sql):
    """-> (sort, filial-or-None) when sql is ODSPayments after substitution, else None."""
    a, b = sql.split("\n"), Q.SQL_PAY_ODSPAYMENTS.split("\n")
    if len(a) != len(b) or any(x != y for i, (x, y) in enumerate(zip(a, b)) if i not in (39, 44)):
        return None
    m44 = re.fullmatch(r" order by (\w+)", a[44])
    m39 = re.fullmatch(r"where filial = '(-?\d+)'", a[39]) if a[39] else None
    if not m44 or (a[39] and not m39):
        return None
    return m44.group(1), (int(m39.group(1)) if m39 else None)


def _prod(pid):
    return next((p for p in _db()["ibank_client_products"] if p["id"] == pid), None) if pid is not None else None


def _cols(a, rep=False):
    D = _db()
    fp, tp = _prod(a.get("from_accid")), _prod(a.get("to_accid"))
    tt = a.get("transaction_type")
    def dec(field, recv):                     # decode((select .. where id=a.to_accid), null, recv, -1, recv, value)
        v = tp[field] if tp else None
        return a.get(recv) if v is None or v == -1 or v == "-1" else v
    acc = None if fp is None else D["account"].get(str(fp.get("accid")))
    r = {"ID": a["id"]}
    if not rep:
        r["FILIAL"] = acc["filial"] if acc and acc.get("filial") is not None else -1
    r.update({"AMOUNT": a["amount"], "BANK_ACC": a.get("bank_acc"), "BANK_BIC": a.get("bank_bic"),
              "BANK_CODE": a.get("bank_code"), "BANK_NAME": a.get("bank_name"), "BANK_TIN": a.get("bank_tin"),
              "CURRENCY": a.get("currency"),
              "DESCREPTION": (a.get("descreption") or "") + "**" + (a.get("note") or "")})
    if rep:
        r["TEYNAT"] = (a.get("descreption") or "").replace("|", "\r")
        r["NOTE"] = (a.get("note") or "").replace("|", "\r")
        r["AMOUNT_YAZI"] = "(mock)) " + a.get("currency", "")
    r.update({"PAY_DATE": _dt(a.get("pay_date")), "RECEIVER_BANK_ACC": a.get("receiver_bank_acc"),
              "RECEIVER_BANK_BIC": a.get("receiver_bank_bic"), "RECEIVER_BANK_CODE": a.get("receiver_bank_code"),
              "RECEIVER_BANK_NAME": a.get("receiver_bank_name"), "RECEIVER_BANK_TIN": a.get("receiver_bank_tin"),
              "RECEIVER_TIN": a.get("receiver_tin"), "TRANSACTION_TYPE": str(tt), "CLI_ID": a.get("cli_id"),
              "STATUS": str(a.get("status")), "PIN1": a.get("pin1"), "PIN2": a.get("pin2"), "TRANS_ID": a.get("trans_id"),
              "SUSDAT": _dt(a.get("susdat"))})
    if not rep:
        r["TR_TYPE"] = _TT.get(tt)
    r["GONDEREN_ACC"] = fp["accno"] if fp else None
    r["ALAN_ACC"] = dec("accno", "receiver_acc") if tt in (3, 7) else a.get("receiver_acc")
    r["ALAN_NAME"] = dec("defaultname", "receiver_name") if tt in (3, 7) else a.get("receiver_name")
    r["GONDEREN_NAME"] = fp["defaultname"] if fp else None
    r["ALAN_INN"] = dec("acctin", "receiver_tin") if tt in (3, 7) else a.get("receiver_tin")
    r["GONDEREN_INN"] = fp["acctin"] if fp else None
    return r


def _sortkey(sort):
    if sort == "1":
        return lambda r: r["ID"]                 # order by 1 -> first column of select * = ID
    return lambda r: (r.get(sort) is None, r.get(sort))


class PayMixin:
    def _pay_query(self, sql, b):
        if sql == Q.SQL_PAY_DAT:
            return [{"TEK_DAT": _dt(_db()["sysdat"]["tek_dat"])}]
        if sql == Q.SQL_PAY_DSFILIALS:
            return sorted([dict(x) for x in _db()["Filial"]], key=lambda x: x["ID"])
        if sql == Q.SQL_PAY_ODS_REP:
            D = _db()
            return [_cols(a, rep=True) for a in D["ibank_temp_transaction"]
                    if a["id"] == b.get("v_id") and a["transaction_type"] not in (44, 55, 88)
                    and any(v["VAL_NAME"] == a.get("currency") for v in D["avalute"])]
        m = _match_pay(sql)
        if m is None:
            return NotImplemented
        sort, filial = m
        d1, d2 = b["DAT1"], b["DAT2"]
        out = []
        for a in _db()["ibank_temp_transaction"]:
            sus, pay = _dt(a.get("susdat")), _dt(a.get("pay_date"))
            if a["transaction_type"] in (44, 55, 88) or a.get("trans_id") is None or a["status"] in (0, 9, 10):
                continue
            if sus is None or pay is None or datetime.datetime(sus.year, sus.month, sus.day) < d1 or pay > d2:
                continue
            out.append(_cols(a))
        if filial is not None:
            out = [r for r in out if str(r["FILIAL"]) == str(filial)]   # where filial = '<n>' (implicit conversion)
        return sorted(out, key=_sortkey(sort))

    def _pay_proc(self, key, args):
        if key != "IBANK_CHANGE_STATUS":
            return NotImplemented
        CALLS.append(tuple(args))
        return {}
