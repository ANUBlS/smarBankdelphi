"""Mock for Packages/out_memorial (OUT_SB_MEMORIAL + verbatim memorial_datamod.dfm SQL).

MEMORIAL is emulated from out_provarch/out_account of fixtures/oacc.json and writes the per-user table
memorial_<user> (columns of the ODSMain persistent fields). The real package body is not in the repo, so this
only illustrates the parameters: valute, branch (debit account), balance list (DBAL_CN/KBAL_CN of the chosen plan),
debit/credit side, multi-currency. TransactionMode 1 (planned) returns nothing; RateDiff/UseBalance are not emulated.
"""
from __future__ import annotations
import datetime as dt
import re

from .base import DBError
from . import mock_oacc
from .. import out_mem_sql as Q


def _n(s):
    return " ".join(s.lower().split())


class OmemMixin:
    @property
    def _om(self):
        D = mock_oacc._load()
        if "out_memorial" not in D:
            D["out_memorial"] = [{"BALANCE": 9100, "ROWID": "AAAMEM000001"}, {"BALANCE": 9200, "ROWID": "AAAMEM000002"}]
            D["_omem_rid"] = 2
        return D

    def _omem_func(self, key, args):
        if key == "OUT_SB_MEMORIAL.GETUSERNAME":
            return self.username
        if key == "OUT_SB_MEMORIAL.GETBANKDAY":
            return dt.datetime.fromisoformat(self._om["tek_dat"])
        return NotImplemented

    def _omem_proc(self, key, args):
        if key != "OUT_SB_MEMORIAL.MEMORIAL":
            return NotImplemented
        beg, end, valute, btype, bal_or_acc, balance, _rd, kd, _ub, multy, tmode, filial = args
        D = self._om
        acc = {a["ID"]: a for a in D["out_account"]}
        cur = {v["VALUTE"]: v for v in D["out_avalute"]}
        cust = {c["ID"]: c for c in D["customers"]}
        bals = [int(x) for x in re.findall(r"-?\d+", balance or "")]
        out = []
        for t in D["out_provarch"] if tmode == 0 else []:
            d, k = acc[t["DEBT"]], acc[t["KREDIT"]]
            day = dt.datetime.fromisoformat(t["DAT"])
            if not (beg <= day <= end):
                continue
            if valute != -1 and d["VAL_ACC"] != valute:
                continue
            if filial != -1 and d["FILIAL"] != filial:
                continue
            if multy == 1 and d["VAL_ACC"] == k["VAL_ACC"]:
                continue
            db, kb = d["BAL_CN%d" % btype], k["BAL_CN%d" % btype]
            if bal_or_acc == 1 and bals:
                hit = {0: db in bals, 1: kb in bals, 2: db in bals or kb in bals, -1: False}[kd]
                if not hit:
                    continue
            vn = lambda a: cur.get(a["VAL_ACC"], {}).get("VAL_NAME", str(a["VAL_ACC"]))  # noqa: E731
            out.append({"DBAL_CN": db, "KBAL_CN": kb, "DAT": day, "DIFFRATE": t.get("DIFFRATE", 0), "NAME": t.get("NAME"),
                        "ID": t["ID"], "SHIFR": t.get("SHIFR", 1), "VAL_ACC": vn(d), "CURRENCYID_C": vn(k),
                        "AMMOUNT": t["AMMOUNT"], "AMMOUNT_C": t["AMMOUNT_C"], "LAMMOUNT": t["LAMMOUNT"],
                        "OP_ID": t.get("OP_ID", 1), "DEBITOR": d["ACC_NO"], "DEBTINN": None,
                        "DNAME": cust.get(d["KLI_ID"], {}).get("NAME"), "KREDITOR": k["ACC_NO"], "KREDINN": None,
                        "KNAME": cust.get(k["KLI_ID"], {}).get("NAME"), "DEBT": d["ID"], "KREDIT": k["ID"]})
        D["memorial_" + self.username.lower()] = out
        return None

    def _omem_query(self, sql, b):
        if sql == Q.SQL_ODSRATE:
            return [{"VALUTE": v["VALUTE"], "VALU_NAME": v["VALU_NAME"]} for v in self._om["out_avalute"]]
        if sql == Q.SQL_BRANCHES:
            return [dict(x, KOD_FILIAL=str(x["ID"])) for x in self._om["filial"]]
        if sql == Q.SQL_USERSLIST:
            return [dict(x) for x in self._om["users"]]
        if sql == Q.SQL_BANKINFO:
            return [{"BANK": "SmartBank ASC", "INN": "1400000001", "LOGO": None}]
        if sql == Q.SQL_REFER:
            return [dict(x) for x in self._om["out_memorial"]]
        s = _n(sql)
        m = re.fullmatch(r"select \* from memorial_(\w+)(?: where \(id in \(([\d,]+)\)\))?(?: order by (.+))?", s)
        if not m:
            return NotImplemented
        if m.group(1) != self.username.lower() or "memorial_" + m.group(1) not in self._om:
            raise DBError("ORA-00942: table or view does not exist", 942)
        rows = [dict(r) for r in self._om["memorial_" + m.group(1)]]
        if m.group(2):
            ids = {int(x) for x in m.group(2).split(",")}
            rows = [r for r in rows if r["ID"] in ids]
        if m.group(3):
            keys = [k.strip().upper() for k in m.group(3).split(",")]
            rows.sort(key=lambda r: tuple((r.get(k) is None, r.get(k) or 0) for k in keys))
        return rows

    def _omem_plsql_out(self, sql, b):
        if _n(sql) == "begin out_sb_memorial.getbankinfo(:p0, :p1); end;":
            return {"p0": "SmartBank ASC", "p1": "1400000001"}
        return NotImplemented

    def _omem_execute(self, sql, b):
        D = self._om
        t = D["out_memorial"]
        if sql == Q.SQL_REFER_INSERT:
            if b.get("BALANCE") in [x["BALANCE"] for x in t]:
                raise DBError("ORA-00001: unique constraint violated", 1)
            D["_omem_rid"] += 1
            t.append({"BALANCE": b["BALANCE"], "ROWID": "AAAMEM%06d" % D["_omem_rid"]})
            return True
        if sql == Q.SQL_REFER_UPDATE:
            for x in t:
                if x["ROWID"] == b["doa_rowid"]:
                    x["BALANCE"] = b["BALANCE"]
            return True
        if sql == Q.SQL_REFER_DELETE:
            t[:] = [x for x in t if x["ROWID"] != b["doa_rowid"]]
            return True
        return False
