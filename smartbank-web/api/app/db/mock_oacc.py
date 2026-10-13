"""Mock for Packages/Out_account: OUT_ACCOUNT + lookups (fixtures/oacc.json) and OUT_SBOP / OUT_SBUTIL account calls.

The Account SQL is matched on its verbatim text and the WHERE line built by out_account.account_sql() is evaluated
piece by piece (only the pieces ActionFilterExecute can produce). Package bodies (OUT_SBOP.add_account etc.) are not
in the repo; the mock assumes the obvious insert/update/close semantics.
"""
from __future__ import annotations
import copy
import datetime as dt
import json
import os
import re

from .base import DBError
from .. import out_acc_sql as Q

_DATA = None


def reset():
    global _DATA
    _DATA = None


def _load():
    global _DATA
    if _DATA is None:
        from ..config import settings
        _DATA = json.load(open(os.path.join(settings.mock_fixtures, "oacc.json"), encoding="utf-8"))
    return _DATA


def _d(v):
    return dt.datetime.fromisoformat(v) if isinstance(v, str) else v


def _norm(s):
    return " ".join(s.lower().split())


_N = {k: _norm(getattr(Q, k)) for k in dir(Q) if k.startswith("SQL_")}


class OaccMixin:
    @property
    def oa(self):
        if not hasattr(self, "_oa"):
            self._oa = _load()          # shared across connections (one mock DB)
        return self._oa

    # ------------------------------------------------------------------ SQL
    def _oacc_query(self, sql, b):
        s = _norm(sql)
        D = self.oa
        page = None
        if s.startswith("select * from (select q.*, rownum rn__ from ("):
            page = (b["lo__"], b["hi__"])
            s = s[len("select * from (select q.*, rownum rn__ from ("):]
        if "from out_account where" in s and "(select name from cm_expert where id=tempid) expert" in s:
            rows = self._oacc_accounts(s, b)
            return rows[page[0]:page[1]] if page else rows
        for k, src in (("SQL_BRANCHES", "filial"), ("SQL_USERS", "users"), ("SQL_REPORT_SYMBOL", "report_symbol"),
                       ("SQL_EXPERTS", "cm_expert")):
            if s == _N[k]:
                rows = copy.deepcopy(D[src])
                return sorted(rows, key=lambda r: r["NAME"]) if k == "SQL_USERS" else rows
        if s == _N["SQL_CURRENCY"]:
            return copy.deepcopy(D["out_avalute"])
        if s == _N["SQL_ACC_FLAGS"]:
            return [{"SYMBOL": r["SYMBOL"], "NAME": r["SYMBOL"] + "     " + (r["DESCRIPTION"] or "")} for r in D["out_account_flags"]]
        if s in (_N["SQL_BAL_ACC"], _N["SQL_BAL_ACC_NEW"]):
            src = D["out_bal_spr1"] if s == _N["SQL_BAL_ACC"] else D["out_bal_spr2"]
            return [{"BAL_CN": str(r["BAL_CN"]), "BALNAME": r["BALNAME"]} for r in sorted(src, key=lambda r: r["BAL_CN"])]
        if s == _N["SQL_PAIR_ACCOUNT"]:
            return [{"ID": a["ID"], "ACC_NO": a["ACC_NO"], "STATUS": 1 if a["CLOSE_DAT"] is None else 2}
                    for a in sorted(D["out_account"], key=lambda a: a["ACC_NO"])]
        if s == _N["SQL_SYSDAT"]:
            return [{"TEK_DAT": _d(D["tek_dat"])}]
        if s == _N["SQL_TENOSTAT"]:
            return [dict(r) for r in D["out_tenostat"] if r["ACC_ID"] == b["acc_id"]]
        if s == _N["SQL_ACC_STATE"]:
            return [{"ARCHIVEDATE": _d(r["DATDATE"]), "ACCID": r["ACC_ID"], "AMOUNT": abs(r["OSTAT"]), "LAMOUNT": abs(r["POK_OSTAT"]),
                     "DEBITTURNOVER": abs(r["OBR_D"]), "DEBITLTURNOVER": abs(r["POK_OBR_D"]),
                     "CREDITTURNOVER": abs(r["OBR_K"]), "CREDITLTURNOVER": abs(r["POK_OBR_K"])}
                    for r in sorted(D["out_archost"], key=lambda r: r["DATDATE"]) if r["ACC_ID"] == b["AccID"]]
        if s in (_N["SQL_DEBIT_TRANSACTIONS"], _N["SQL_CREDIT_TRANSACTIONS"]):
            deb = s == _N["SQL_DEBIT_TRANSACTIONS"]
            accs = {a["ID"]: a for a in D["out_account"]}
            out = []
            for p in sorted(D["out_provarch"], key=lambda p: p["DAT"]):
                if not (b["StartDate"] <= _d(p["DAT"]) <= b["EndDate"]):
                    continue
                if (p["DEBT"] if deb else p["KREDIT"]) != b["AccountID"]:
                    continue
                other = accs.get(p["KREDIT"] if deb else p["DEBT"])
                if not other:
                    continue
                r = {"ID": p["ID"], ("DEBITACCID" if deb else "CREDITACCID"): b["AccountID"], "OPERATIONDATE": _d(p["DAT"]),
                     "DEBITAMOUNT": p["AMMOUNT"], "CREDITAMOUNT": p["AMMOUNT_C"], "LAMOUNT": p["LAMMOUNT"],
                     ("CREDITACCNO" if deb else "DEBITACCNO"): other["ACC_NO"], "DESTINATION": p["NAME"]}
                out.append(r)
            return out
        return NotImplemented

    def _oacc_accounts(self, s, b):
        m = re.search(r"from out_account where (.*?) order by (\S+)", s)
        where, order = m.group(1), m.group(2)
        preds = []
        for part in where.split(" and "):
            part = part.strip()
            if part == "decode (close_dat, null, 1, 2) is not null":
                continue
            if part == "(id=:f_id)":
                preds.append(lambda a: a["ID"] == b["f_id"]); continue
            mm = re.fullmatch(r"\(decode \(close_dat, null, 1, 2\)=(\d)\)", part)
            if mm:
                st = int(mm.group(1)); preds.append(lambda a, st=st: (1 if a["CLOSE_DAT"] is None else 2) == st); continue
            mm = re.fullmatch(r"\((filial|val_acc|op_id)=(-?\d+)\)", part)
            if mm:
                col, v = mm.group(1).upper(), int(mm.group(2)); preds.append(lambda a, c=col, v=v: a[c] == v); continue
            if part == "(tipacc like :f_tipacc)":
                pat = b["f_tipacc"].strip("%"); preds.append(lambda a, p=pat: p in (a["TIPACC"] or "")); continue
            if part == "(bal_cn1=:f_bal_cn)":
                preds.append(lambda a: str(a["BAL_CN1"]) == b["f_bal_cn"].strip()); continue
            raise DBError(f"ORA-00904: mock: cannot evaluate '{part}'")
        exp = {e["ID"]: e["NAME"] for e in self.oa["cm_expert"]}
        rows = []
        for a in self.oa["out_account"]:
            if all(p(a) for p in preds):
                r = {"ROWID": "R%d" % a["ID"], **a, "OPEN_DAT": _d(a["OPEN_DAT"]), "CLOSE_DAT": _d(a["CLOSE_DAT"]),
                     "STATU1": 1 if a["CLOSE_DAT"] is None else 2, "EXPERT": exp.get(a["TEMPID"])}
                rows.append(r)
        col = order.upper()
        rows.sort(key=lambda r: (r.get(col) is None, r.get(col) if r.get(col) is not None else 0))
        return rows

    # ------------------------------------------------------------------ packages
    def _oacc_cursor(self, sql, bind, b):
        if _norm(sql) == _N["SQL_CUSTOMERS"]:
            return copy.deepcopy(self.oa["customers"])
        return NotImplemented

    def _oacc_func(self, key, named):
        n = named or {}
        D = self.oa
        if key == "OUT_SBOP.ADD_ACCOUNT":
            if not n.get("accno"):
                raise DBError("ORA-01400: cannot insert NULL into (\"SMART\".\"OUT_ACCOUNT\".\"ACC_NO\")", 1400)
            if any(a["ACC_NO"] == n["accno"] for a in D["out_account"]):
                raise DBError("ORA-00001: unique constraint (SMART.OUT_ACCOUNT_ACC_NO) violated", 1)
            D["next_id"] += 1
            D["out_account"].append(self._oacc_rec(D["next_id"], n, ""))
            return D["next_id"]
        if key == "OUT_SBOP.GENERATEACCOUNTNUMBER":
            # real body not in repo: bal(4) + currency(3, AZN 944) + customer(5) + seq(4)
            cur = int(n["CurrencyID"] or 0)
            base = f"{n['BalCn'] or '0000'}{(944 if cur == 0 else cur):03d}{int(n['CustomerID'] or 0):05d}"
            k = 1 + sum(1 for a in D["out_account"] if a["ACC_NO"].startswith(base))
            return f"{base}{k:04d}"
        return NotImplemented

    def _oacc_rec(self, i, n, p):
        g = lambda k: n.get(p + k)
        od = g("open_dat")
        return {"ID": i, "KLI_ID": g("customerid"), "OP_ID": g("op_id"), "ACC_NO": g("accno"), "VAL_ACC": g("currencyid"),
                "NAME": g("name"), "OPEN_DAT": od.isoformat() if od else None, "CLOSE_DAT": None, "BAL_CN1": g("balcn"),
                "BAL_CN2": g("bal_cn2"), "BAL_CN3": g("bal_cn3"), "BAL_CN4": g("bal_cn4"), "FILIAL": g("filial"),
                "SIM_OTCET": g("sim_otcet"), "TIPACC": g("typeacc"), "LIMIT": g("limit"), "OLD_ACC_NO": g("old_acc_no"),
                "PAIR_ACC": g("pair_acc"), "INSIDER": g("insider"), "TEMPID": g("v_tempid") if p == "" else g("tempid")}

    def _oacc_proc(self, key, named):
        n = named or {}
        D = self.oa
        if key == "OUT_SBOP.UPD_ACCOUNT":
            a = next((x for x in D["out_account"] if x["ID"] == n["v_id"]), None)
            if not a:
                raise DBError("ORA-01403: no data found", 1403)
            rec = self._oacc_rec(a["ID"], n, "v_")
            rec["CLOSE_DAT"] = a["CLOSE_DAT"]
            a.update(rec)
            return {}
        if key == "OUT_SBOP.CLOSE_ACCOUNT":
            a = next((x for x in D["out_account"] if x["ID"] == n["accid"]), None)
            if not a:
                raise DBError("ORA-01403: no data found", 1403)
            a["CLOSE_DAT"] = D["tek_dat"]
            return {}
        return NotImplemented

    def _oacc_bool(self, key, named):
        if key == "OUT_SBUTIL.FLAGEXSIST":
            n = named or {}
            a = next((x for x in self.oa["out_account"] if x["ID"] == n["AccID"]), None)
            return bool(a) and n["FlagChar"] in (a["TIPACC"] or "").split(",")
        return NotImplemented
