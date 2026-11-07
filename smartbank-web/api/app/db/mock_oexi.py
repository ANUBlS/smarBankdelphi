"""Mock for Packages/OutExcelImport: out_exceltable (per mock user) + excelpkg. The package body is not in the repo, so
OUTEXCELTRANSACTIONS only illustrates: each row becomes an out_provarch row of fixtures/oacc.json when F1/F2 are existing
debit/credit account numbers and F3 is the amount (column meaning is NOT known from the Delphi code). del_outinspayments
removes the rows it inserted."""
from __future__ import annotations
import datetime as dt

from . import mock_oacc
from .. import out_excel_import as Q


class OexiMixin:
    @property
    def _ox(self):
        D = mock_oacc._load()
        D.setdefault("out_exceltable", [])
        D.setdefault("_ox_rid", 0)
        D.setdefault("_ox_ins", [])
        return D

    def _oexi_query(self, sql, b):
        if sql == Q.SQL_LIST:
            uid = self.user.get("user_id", 0)
            return [dict(x) for x in self._ox["out_exceltable"] if x["USERID"] == uid]
        if sql == Q.SQL_VIDOP:
            return [{"ID": 0, "NAME": "Adi"}]
        return NotImplemented

    def _oexi_exec(self, sql, b):
        D = self._ox
        if sql == Q.SQL_INSERT:
            D["_ox_rid"] += 1
            rec = {"ROWID": "AAAOX%07d" % D["_ox_rid"], "USERID": self.user.get("user_id", 0)}   # USERID default (assumed)
            rec.update({f"F{i}": None for i in range(1, 76)})
            rec.update({k: (str(v) if v is not None else None) for k, v in b.items()})
            D["out_exceltable"].append(rec)
            return True
        if sql == Q.SQL_DELETE:
            D["out_exceltable"] = [x for x in D["out_exceltable"] if x["ROWID"] != b["doa_rowid"]]
            return True
        if sql.startswith("update out_exceltable set "):
            col = sql.split()[3]
            for x in D["out_exceltable"]:
                if x["ROWID"] == b["doa_rowid"]:
                    x[col] = b["val"]
            return True
        return False

    def _oexi_proc(self, key):
        D = self._ox
        uid = self.user.get("user_id", 0)
        if key == "EXCELPKG.DEL_OUTEXCEL":
            D["out_exceltable"] = [x for x in D["out_exceltable"] if x["USERID"] != uid]
            return {}
        if key == "EXCELPKG.OUTEXCELTRANSACTIONS":
            acc = {a["ACC_NO"]: a for a in D["out_account"]}
            for x in D["out_exceltable"]:
                if x["USERID"] != uid or x["F1"] not in acc or x["F2"] not in acc:
                    continue
                d, k = acc[x["F1"]], acc[x["F2"]]
                nid = max(p["ID"] for p in D["out_provarch"]) + 1
                amt = float(x["F3"] or 0)
                D["out_provarch"].append({"ID": nid, "DEBT": d["ID"], "KREDIT": k["ID"], "DAT": D["tek_dat"][:10], "AMMOUNT": amt,
                                          "AMMOUNT_C": amt, "LAMMOUNT": amt, "NAME": x.get("F4") or "Excel"})
                D["_ox_ins"].append(nid)
            return {}
        if key == "EXCELPKG.DEL_OUTINSPAYMENTS":
            D["out_provarch"] = [p for p in D["out_provarch"] if p["ID"] not in D["_ox_ins"]]
            D["_ox_ins"] = []
            return {}
        return NotImplemented
