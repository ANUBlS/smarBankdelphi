"""Mock evaluator for the run-time SQL of Packages/Out_control_tape (out_control_tape.py builders) on the bal.json fixture."""
from __future__ import annotations
import datetime
import re


class OctMixin:
    def _oct_query(self, s: str, b: dict):
        if "out_provarch p, out_account a" not in s and "out_provdoc p, out_account a" not in s and "from out_provarch p,out_account d" not in s:
            if s == "select valute,valu_name from avalute":
                return [{"VALUTE": x["VALUTE"], "VALU_NAME": x["VALU_NAME"]} for x in self.bal["avalute"]]
            if s.startswith("select -1 as id, 'bütün filiallar' as name from dual union"):
                return [{"ID": -1, "NAME": "Bütün filiallar"}] + [dict(x) for x in self.bal["filial"]]
            if s == "select bank from bankinfo":
                return [{"BANK": x["BANK"]} for x in self.bal["bankinfo"]][:1] or [{"BANK": ""}]
            return None
        old, self._bal_out = self._bal_out, True
        try:
            accs = self._accs()
        finally:
            self._bal_out = old
        cur = {r["VALUTE"]: r["VAL_NAME"] for r in self.bal["avalute"]}
        day = b.get("ADate") or b.get("TransactionDate")
        day = day.date() if isinstance(day, datetime.datetime) else day
        table = "provdoc" if "out_provdoc p" in s else "provarch"
        provs = [p for p in self.bal[table] if p["DEBT"] in accs and datetime.date.fromisoformat(p["DAT"]) == day]
        col = "BAL_CN2" if "bal_cn2" in s else "BAL_CN1"
        if "from out_provarch p,out_account d" in s:                    # transaction view
            m = re.search(r"d\.val_acc= (-?\d+) and", s)
            out = []
            for p in provs:
                d, c = accs[p["DEBT"]], accs.get(p["KREDIT"])
                if c is None or (m and d["VAL_ACC"] != int(m.group(1))):
                    continue
                out.append({"BALANCEACCOUNT": d[col], "DEBIT": d["ACC_NO"], "DEBITCURRENCY": d["VAL_ACC"], "DVALNAME": cur.get(d["VAL_ACC"]),
                            "CREDIT": c["ACC_NO"], "CREDITCURRENCY": c["VAL_ACC"], "CVALNAME": cur.get(c["VAL_ACC"]),
                            "DEBITAMMOUNT": p["AMMOUNT"], "CREDITAMMOUNT": p["AMMOUNT_C"], "COMMONAMMOUNT": p["LAMMOUNT"], "NAME": p["NAME"]})
            return sorted(out, key=lambda r: r["BALANCEACCOUNT"])
        fil = re.search(r"a\.filial = (-?\d+)", s)
        bl = re.search(r"a\.(bal_cn[12]) in \(([^)]*)\)", s)
        va = re.search(r"a\.val_acc=(-?\d+)", s)
        sel = []
        for p in provs:
            a = accs[p["DEBT"]]
            if fil and a["FILIAL"] != int(fil.group(1)):
                continue
            if bl and a[bl.group(1).upper()] not in {int(x) for x in bl.group(2).split(",")}:
                continue
            if va and a["VAL_ACC"] != int(va.group(1)):
                continue
            sel.append((a, p))
        if "group by" in s:
            g: dict = {}
            for a, p in sel:
                x = g.setdefault(a[col], {"BAL_CN1": a[col], "AMMOUNTS": 0.0, "LAMMOUNTS": 0.0})
                x["AMMOUNTS"] += p["AMMOUNT"]; x["LAMMOUNTS"] += p["LAMMOUNT"]
            return [g[k] for k in sorted(g)]
        rows = [{"BAL_CN1": a[col], "VAL_ACC": p["VAL_ACC"], "CURRENCYNAME": cur.get(p["VAL_ACC"]), "AMMOUNT": p["AMMOUNT"], "LAMMOUNT": p["LAMMOUNT"]}
                for a, p in sel]
        return sorted(rows, key=lambda r: (r["BAL_CN1"], r["VAL_ACC"], r["AMMOUNT"]))
