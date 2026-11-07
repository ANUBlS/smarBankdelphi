"""Mock for Packages/BBPayings (bbpayings.py). Answers only bb_sql.SQL_BB_* texts (ODS_ABNServices with or without the
title-click ' order by <FieldName>' line) from fixtures/bbpayings.json; the join and the
sys_date >= :StDate-1 and sys_date <= :EndDate predicate are evaluated in Python. Cable_Manager.AbnServAdd / Upd / Del /
Commit change the in-memory bb_abn_services rows (no commit needed in the mock; the form never commits)."""
from __future__ import annotations
import datetime
import json
import os
import re

from .. import bb_sql as Q

_S = None
CALLS: list = []


def reset():
    global _S
    _S = None
    CALLS.clear()


def _st():
    global _S
    if _S is None:
        from ..config import settings
        _S = json.load(open(os.path.join(settings.mock_fixtures, "bbpayings.json"), encoding="utf-8"))
        for r in _S["bb_abn_services"]:
            for k in ("REG_TIME", "DONE_TIME", "SYS_DATE"):
                r[k] = None if r.get(k) is None else datetime.datetime.fromisoformat(r[k])
    return _S


def _rows(b):
    S = _st()
    C = {c["ID"]: c for c in S["bb_contracts"]}
    SV = {s["ID"]: s for s in S["bb_services"]}
    A = {a["ID"]: a for a in S["bb_abonents"]}
    lo, hi = b["StDate"] - datetime.timedelta(days=1), b["EndDate"]
    out = []
    for a in S["bb_abn_services"]:
        c, s = C.get(a["CONTRACT_ID"]), SV.get(a["SRV_ID"])
        if not c or not s or c["ABN_ID"] not in A or a["SYS_DATE"] is None or not (lo <= a["SYS_DATE"] <= hi):
            continue
        out.append({"ID": a["ID"], "ABN_NAME": A[c["ABN_ID"]]["NAME"], "CONTRACT_ID": a["CONTRACT_ID"],
                    "CONTRACT_NUM": c["CONTRACT_NUM"], "REG_TIME": a["REG_TIME"], "SRV_ID": a["SRV_ID"], "SERVICE": s["NAME"],
                    "AMOUNT": a["AMOUNT"], "AMOUNT_EQV": a.get("AMOUNT_EQV"), "CURR_CODE": a.get("CURR_CODE"),
                    "STATUS": a["STATUS"], "DONE_TIME": a["DONE_TIME"], "SYS_DATE": a["SYS_DATE"], "PAYMETHOD": a.get("PAYMETHOD")})
    return out


class BbMixin:
    def _bb_query(self, sql, b):
        S = _st() if sql.startswith(Q.SQL_BB_ODS_ABNSERVICES[:40]) or sql in (Q.SQL_BB_ODS_CONTRACTS, Q.SQL_BB_ODS_SERVICES) else None
        if S is None:
            return NotImplemented
        if sql == Q.SQL_BB_ODS_CONTRACTS:
            A = {a["ID"]: a for a in S["bb_abonents"]}
            return [dict(c, NAME=A[c["ABN_ID"]]["NAME"]) for c in S["bb_contracts"] if c["ABN_ID"] in A]
        if sql == Q.SQL_BB_ODS_SERVICES:
            return [dict(s) for s in S["bb_services"]]
        if sql == Q.SQL_BB_ODS_ABNSERVICES:
            return _rows(b)
        m = re.fullmatch(re.escape(Q.SQL_BB_ODS_ABNSERVICES) + r"\n order by (\w+)", sql)
        if not m:
            return NotImplemented
        f = m.group(1)
        return sorted(_rows(b), key=lambda r: (r.get(f) is None, r.get(f)))

    def _bb_func(self, key, args):
        if key != "CABLE_MANAGER.ABNSERVADD":
            return NotImplemented
        S = _st()
        CALLS.append(("AbnServAdd", tuple(args)))
        nid = max([r["ID"] for r in S["bb_abn_services"]] + [0]) + 1
        amt = float(str(args[3]).replace(",", "."))          # p_amount: Oracle implicit to_number of the text
        S["bb_abn_services"].append({"ID": nid, "CONTRACT_ID": args[0], "REG_TIME": args[1], "SRV_ID": args[2], "AMOUNT": amt,
                                     "AMOUNT_EQV": amt, "CURR_CODE": args[4], "STATUS": args[5], "DONE_TIME": args[6],
                                     "SYS_DATE": datetime.datetime.fromisoformat(S["sysdate"]), "PAYMETHOD": args[7]})
        return nid

    def _bb_proc(self, key, args):
        if not key.startswith("CABLE_MANAGER.ABNSERV"):
            return NotImplemented
        S = _st()
        name = key.split(".")[1]
        CALLS.append((name, tuple(args)))
        rows = {r["ID"]: r for r in S["bb_abn_services"]}
        r = rows.get(args[0])
        if name == "ABNSERVUPD" and r:
            r.update({"CONTRACT_ID": args[1], "SRV_ID": args[3], "AMOUNT": float(str(args[4]).replace(",", ".")),
                      "DONE_TIME": args[7], "PAYMETHOD": args[8]})
        elif name == "ABNSERVDEL" and r:
            S["bb_abn_services"].remove(r)
        elif name == "ABNSERVCOMMIT" and r:
            r["STATUS"] = 1
        return {}
