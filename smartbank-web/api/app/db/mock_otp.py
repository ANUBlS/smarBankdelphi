"""Mock evaluator for Packages/Out_turn_over_for_period (out_turnovers.py / out_tp_sql.py) on the bal.json fixture."""
from __future__ import annotations
import datetime
import re

from .. import bal_logic as L


def _day(v):
    return v.date() if isinstance(v, datetime.datetime) else v


class OtpMixin:
    def _otp_query(self, s: str, b: dict):
        B = self.bal
        if s == "select valute as currencyid , valu_name as currlname from avalute":
            return [{"CURRENCYID": x["VALUTE"], "CURRLNAME": x["VALU_NAME"]} for x in B["avalute"]]
        if s == "select max(dat) as periodprefix from operkurs where dat<:adate":
            ds = [x for x in self._dates() if x < _day(b["ADate"])]
            return [{"PERIODPREFIX": datetime.datetime.combine(max(ds), datetime.time()) if ds else None}]
        if s == "select bank , inn , logo , managertitle , accountanttitle , sedr as manager , buhaltr as accountant from bankinfo":
            r = B["bankinfo"][0]
            return [{"BANK": r["BANK"], "INN": r["INN"], "LOGO": r.get("LOGO"), "MANAGERTITLE": r.get("MANAGERTITLE"),
                     "ACCOUNTANTTITLE": r.get("ACCOUNTANTTITLE"), "MANAGER": r["SEDR"], "ACCOUNTANT": r["BUHALTR"]}]
        if not s.startswith("select restforlastperiod.accountid, restforlastperiod.clientid"):
            return None
        plane = int(re.search(r"out_bal_spr(\d)", s).group(1))
        spr = self._spr(plane)
        bl = re.search(r"restforlastperiod\.balanceno in \(([^)]*)\)", s)
        bl = {int(x) for x in bl.group(1).split(",")} if bl else None
        cu = re.search(r"restforlastperiod\.currencyid = (-?\d+)", s)
        br = re.search(r"restforlastperiod\.branchid = (-?\d+)", s)
        bp, bd, ed = _day(b["BeginPeriod"]), _day(b["BeginDate"]), _day(b["EndDate"])
        old, self._bal_out = self._bal_out, True
        try:
            accs, arch = self._accs(), self._arch()
        finally:
            self._bal_out = old
        def rest(a, day):
            for r in arch:
                if r["ACC_ID"] == a["ID"] and datetime.date.fromisoformat(r["DATDATE"]) == day:
                    return r
        def alive(a, day):
            return a["CLOSE_DAT"] is None or datetime.date.fromisoformat(a["CLOSE_DAT"][:10]) > day
        out = []
        for a in accs.values():
            bal = a[f"BAL_CN{plane}"]
            if bal not in spr:
                continue
            last = rest(a, ed)
            if last is None or not alive(a, ed):
                continue
            if bl is not None and bal not in bl or cu and a["VAL_ACC"] != int(cu.group(1)) or br and a["FILIAL"] != int(br.group(1)):
                continue
            tos = [r for r in arch if r["ACC_ID"] == a["ID"] and bd <= datetime.date.fromisoformat(r["DATDATE"]) <= ed]
            if not tos:
                continue
            first = rest(a, bp) if alive(a, bp) else None
            sp = spr[bal]
            act = lambda r, f: L.mtoutview_active(r.get(f), sp["TYPEID"], sp["ADDITIONALTYPEID"]) if r else None
            pas = lambda r, f: L.mtoutview_passiv(r.get(f), sp["TYPEID"], sp["ADDITIONALTYPEID"]) if r else None
            out.append({"ACCOUNTID": a["ID"], "CLIENTID": a.get("KLI_ID"), "ACCNO": a["ACC_NO"], "ACC_NAME": a["NAME"],
                        "CURRENCYID": a["VAL_ACC"], "BRANCHID": a["FILIAL"], "BALANCENO": bal,
                        "BEGINACTIVE": act(first, "OSTAT"), "BEGINPASSIVE": pas(first, "OSTAT"),
                        "LBEGINACTIVE": act(first, "POK_OSTAT"), "LBEGINPASSIVE": pas(first, "POK_OSTAT"),
                        "DTURNOVER": sum(r["OBR_D"] for r in tos), "CTURNOVER": sum(r["OBR_K"] for r in tos),
                        "LDTURNOVER": sum(r["POK_OBR_D"] for r in tos), "LCTURNOVER": sum(r["POK_OBR_K"] for r in tos),
                        "ENDACTIVE": act(last, "OSTAT"), "ENDPASSIVE": pas(last, "OSTAT"),
                        "LENDACTIVE": act(last, "POK_OSTAT"), "LENDPASSIVE": pas(last, "POK_OSTAT"), "EXPERT": None})
        return sorted(out, key=lambda r: r["ACCNO"])
