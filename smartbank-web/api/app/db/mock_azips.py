"""Mock for Packages/SWIFT_MANAGER_IBAN_NEW (AZIPS). Tables from fixtures/azips.json. The verbatim SQL is recognised by its
first TStrings line; the edited lines (SQL[5], SQL[6], SQL[10], SQL[46]) are interpreted. The sw_main package body is not in
the repo: new_dat is emulated as 'move status-96 sw_in rows dated before SYSDAT.tek_dat into SW_ARCHIVE' only to make the archive screen show something;
Find_UserName*_out/_in return the fixture user names (C = creator, M = modifier, V = verifier columns)."""
from __future__ import annotations
import copy
import datetime as dt
import json
import os
import re

from .. import azips_sql as Q

_DATA = None


def reset():
    global _DATA
    _DATA = None


def _load():
    global _DATA
    if _DATA is None:
        from ..config import settings
        _DATA = json.load(open(os.path.join(settings.mock_fixtures, "azips.json"), encoding="utf-8"))
    return _DATA


def _d(v):
    return dt.datetime.fromisoformat(v) if isinstance(v, str) else v


def _rows(rs):
    return [{k: (_d(v) if k in ("DAT", "CDAT", "FDAT", "TDAT", "MF32A_DATE") else v) for k, v in r.items()} for r in rs]


class AzipsMixin:
    def _az_user_filial(self):
        return _load()["sba_objinf"].get(str(self.username).upper(), 0)

    def _az_query(self, sql, b):
        D = _load()
        L = sql.split("\r\n")
        first = L[0]
        branch = len(L) > 10 and L[10] == Q.BRANCH_LINE
        fil = self._az_user_filial()
        names = D["user_names"]
        nm = lambda i: names.get(str(i), "")    # noqa: E731
        if first == Q.LINES_USERFIL[0]:
            return [{"FILIALID": fil}]
        if first == Q.LINES_SWMAMMOUNT[0] or first == Q.LINES_SW_AMOUNT[0]:
            st = 1 if first == Q.LINES_SWMAMMOUNT[0] else 5
            xs = [r["MF32A_AMOUNT"] for r in D["sw_out_new"] if r["STATUS"] == st]
            return [{"SUMM": sum(xs) if xs else None}]
        if first == Q.LINES_OPERATORS[0]:
            return [{"ID": -1, "NAME": "Butun operatorlar"}] + sorted(D["users"], key=lambda u: u["NAME"])
        brf = (lambda r: r.get("BRANCH") == fil) if branch else (lambda r: True)
        if first in (Q.LINES_SW_IN[0], Q.LINES_SW_IN2[0]):
            two = first == Q.LINES_SW_IN2[0]
            rs = [r for r in D["sw_in"] if (r["STATUS"] == 96 if two else r["STATUS"] not in (96, 10)) and brf(r)]
            o = L[46] if len(L) > 46 else ""
            m = re.fullmatch(r"order by (\w+)( asc| desc)?", o)
            if m:
                rs = sorted(rs, key=lambda r: (r.get(m.group(1)) is None, str(r.get(m.group(1)))), reverse=m.group(2) == " desc")
            out = _rows(rs)
            for r, src in zip(out, rs):
                r["USERH"] = nm(src.get("USER"))
                r.pop("USER", None)
            return out
        for lines, sts, fns in ((Q.LINES_SW_OUT, (2, 8, 15), ("C",)), (Q.LINES_SW_OUT_2, (5, 7, 55), ("C", "M")),
                                (Q.LINES_SW_OUT3, (1,), ("C", "M", "V"))):
            if first == lines[0]:
                rs = sorted([r for r in D["sw_out_new"] if r["STATUS"] in sts and brf(r)], key=lambda r: -r["ID"])
                out = []
                for src, r in zip(rs, _rows(rs)):
                    for k, col in zip(fns, ("SW_MAIN.FIND_USERNAME_OUT(S.ID)", "SW_MAIN.FIND_USERNAME3_OUT(S.ID)",
                                            "SW_MAIN.FIND_USERNAME2_OUT(S.ID)")):
                        r[col] = nm(src.get(k))
                    for k in ("C", "M", "V"):
                        r.pop(k, None)
                    out.append(r)
                return out
        if first == Q.LINES_ARXIVIN[0]:
            d1, d2 = b["dat1"], b["dat2"]
            mt = L[6]
            rs = [r for r in D["sw_archive"] if d1 <= _d(r["DAT"]) <= d2 and brf(r)]
            m = re.fullmatch(r"and mt='(.*)'", mt)
            if m:
                rs = [r for r in rs if r["MT"] == m.group(1)]
            return _rows(rs)        # ORDER BY :title = constant -> table order
        if first == Q.LINES_OUT_ARCHIVE[0]:
            d1, d2 = b["dat1"], b["dat2"]
            rs = [r for r in D["sw_out_sba"] if d1 <= _d(r["MF32A_DATE"]) <= d2 and brf(r)]
            if L[5] == " and fcreate_opid=:oper":
                rs = [r for r in rs if r["FCREATE_OPID"] == b["oper"]]
            m = re.fullmatch(r"and messagetype='(.*)'", L[6])
            if m:
                rs = [r for r in rs if r["MESSAGETYPE"] == m.group(1)]
            out = _rows(rs)
            for src, r in zip(rs, out):
                r.update(CREAT=nm(src["FCREATE_OPID"]), DELETER="", MODSI="", EDITOR="", AVTO="", VERI="")
            return out
        return NotImplemented

    def _az_proc(self, key, args):
        if key == "SW_MAIN.NEW_DAT":
            D = _load()
            day = dt.datetime.fromisoformat(self.st["sys"]["tek_dat"])
            old = lambda r: r["STATUS"] == 96 and _d(r["DAT"]) < day      # noqa: E731
            moved = [r for r in D["sw_in"] if old(r)]
            D["sw_in"] = [r for r in D["sw_in"] if not old(r)]
            for r in moved:
                a = copy.deepcopy(r)
                a.pop("STATUS"); a.pop("USER", None); a.pop("BNK_VOIN", None)
                D["sw_archive"].append(a)
            return {}
        return NotImplemented

    def _az_func(self, key, args):
        if key == "SB_ACA.CHECKADVANCEDOBJECTACCESS_FUNC":
            return 1 if (self.user.get("is_adm") or args[0] in self.user.get("advanced_access", [])) else 0
        return NotImplemented
