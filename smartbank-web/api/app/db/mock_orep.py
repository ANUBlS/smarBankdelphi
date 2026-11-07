"""Mock for Packages/out_repair (verbatim RepairNewDataModule.dfm SQL + Out_Correct.Main).

Data: out_provarch / out_account / out_avalute / filial / users of fixtures/oacc.json plus small KASSA_B, CONVERT_ASSIGNMENTS,
OperKurs, vid_op and out_trdestination tables added here. Out_Correct's body is not in the repo, so Main only illustrates
the parameters: Flag 0 deletes, 1 inserts (new ID), 2 updates the out_provarch row; CorMode is recorded, not interpreted.
"""
from __future__ import annotations
import datetime as dt

from . import mock_oacc
from .. import out_rep_sql as Q


def _n(s):
    return " ".join(s.lower().split())


_N = {k: _n(getattr(Q, k)) for k in dir(Q) if k.startswith("SQL_")}
_RAW = {getattr(Q, k) for k in dir(Q) if k.startswith("SQL_")}


def _d(v):
    return dt.datetime.fromisoformat(v) if isinstance(v, str) else v


class OrepMixin:
    @property
    def _orp(self):
        D = mock_oacc._load()
        if "kassa_b" not in D:
            D["kassa_b"] = [{"SYMBOL": "11", "NAME": "Nağd mədaxil", "MEDIOCRITY": 0},
                            {"SYMBOL": "52", "NAME": "Nağd məxaric", "MEDIOCRITY": 1},
                            {"SYMBOL": "99", "NAME": "Digər", "MEDIOCRITY": -1}]
            D["convert_assignments"] = [{"ID": 0, "SHORTNAME": "-", "FULLPATH": "Konvertasiya deyil", "EXTRA": None, "DIFFERENT": 0},
                                        {"ID": 1, "SHORTNAME": "FX", "FULLPATH": "Valyuta mübadiləsi", "EXTRA": None, "DIFFERENT": 0}]
            D["operkurs"] = {0: 1.0, 840: 1.7, 978: 1.85}
            D["vid_op"] = [{"ID": 0, "NAME": "Adi"}, {"ID": 1, "NAME": "Konvertasiya"}, {"ID": 2, "NAME": "Kassa"}]
            D["out_trdestination_r"] = [{"ID": 1, "NAME": "Girov qəbulu"}, {"ID": 2, "NAME": "Girovun qaytarılması"}]
            D["out_correct_log"] = []
        return D

    def _orep_query(self, sql, b):
        if sql not in _RAW:                                     # exact text: other modules share e.g. 'select * from user$'
            return NotImplemented
        s = _n(sql)
        D = self._orp
        acc = {a["ID"]: a for a in D["out_account"]}
        cur = {v["VALUTE"]: v for v in D["out_avalute"]}
        spr = {x["BAL_CN"]: x for x in D["out_bal_spr1"]}
        if s == _N["SQL_TRANSACTIONS"]:
            out = []
            for p in D["out_provarch"]:
                ad, ac = acc.get(p["DEBT"]), acc.get(p["KREDIT"])
                dv, cv = p.get("VAL_ACC", ad and ad["VAL_ACC"]), p.get("CURRENCYID_C", ac and ac["VAL_ACC"])
                day = _d(p["DAT"])
                if not (ad and ac and b["DAT"] <= day <= b["DAT2"] and ad["VAL_ACC"] == dv and ac["VAL_ACC"] == cv):
                    continue
                out.append({"ROWID": "R%d" % p["ID"], "ID": p["ID"], "OPERATORID": p.get("OP_ID", 1), "TRANSACTIONDATE": day,
                            "DEBITID": p["DEBT"], "DEBITACCNO": ad["ACC_NO"], "DEBFIL": ad["FILIAL"], "DEBITCURRENCYID": dv,
                            "DEBITCURRENCYSNAME": cur[dv]["VAL_NAME"], "CREDITID": p["KREDIT"], "CREDITACCNO": ac["ACC_NO"],
                            "CREDFIL": ac["FILIAL"], "CREDITCURRENCYID": cv, "CREDITCURRENCYSNAME": cur[cv]["VAL_NAME"],
                            "DEBITAMOUNT": p["AMMOUNT"], "CREDITAMOUNT": p["AMMOUNT_C"], "LAMOUNT": p["LAMMOUNT"],
                            "DEBITRATE": p.get("RATE_D", 1.0), "CREDITRATE": p.get("RATE_C", 1.0), "DEBITBANK": None, "CREDITBANK": None,
                            "PACKAGENUMBER": None, "CYPHERCODE": None, "OPERATIONCODE": p.get("VID_OP", 0),
                            "INBALANCECHAR": p.get("KASSA_B"), "OUTBALANCECHAR": p.get("KASSA_Z"), "FILIALID": ad["FILIAL"],
                            "DEBITBALANCE": ad["BAL_CN1"], "NAME": p.get("NAME"), "OPERATIONTYPE": p.get("VID_OP", 0)})
            return out                                          # ORDER BY :Title = constant -> storage order
        if s == _N["SQL_RATES"]:
            return [{"ID": k, "NAME": cur[k]["VAL_NAME"], "DESCRIPTION": cur[k]["VALU_NAME"], "RATE": v}
                    for k, v in sorted(D["operkurs"].items()) if k in cur]
        if s == _N["SQL_CURRENCIES"]:
            return [{"VALUTE": v["VALUTE"], "VAL_NAME": v["VAL_NAME"], "VALU_NAME": v["VALU_NAME"]} for v in D["out_avalute"]]
        if s == _N["SQL_VALUTES"]:
            return [{"VALUTE": v["VALUTE"], "VALU_NAME": v["VALU_NAME"]} for v in D["out_avalute"]]
        if s in (_N["SQL_DEBIT_ACCOUNTS"], _N["SQL_CREDIT_ACCOUNTS"]):
            return [{**{k: a[k] for k in ("ID", "KLI_ID", "ACC_NO", "VAL_ACC", "NAME", "BAL_CN1", "BAL_CN2", "BAL_CN3", "BAL_CN4")},
                     "OPEN_DAT": _d(a["OPEN_DAT"]), "ISCACHEACCOUNT": spr[a["BAL_CN1"]]["CASHINCOMING"]}
                    for a in sorted(D["out_account"], key=lambda a: a["ACC_NO"])
                    if a["VAL_ACC"] == b["val_acc"] and a["CLOSE_DAT"] is None and a["BAL_CN1"] in spr]
        if s == _N["SQL_TRDESCRIPTION"]:
            return [dict(x) for x in D["out_trdestination_r"]]
        if s == _N["SQL_CONVERT"]:
            return [dict(x) for x in D["convert_assignments"]]
        if s == _N["SQL_KASSA"]:
            return [dict(x) for x in D["kassa_b"]]
        if s == _N["SQL_USERS"]:
            return [{"ID": u["ID"], "NAME": u["NAME"], "CTIME": None} for u in D["users"]]
        if s == _N["SQL_VIDOP"]:
            return [dict(x) for x in D["vid_op"]]
        if s == _N["SQL_FILIAL"]:
            return [{"ID": f["ID"], "NAME": f["NAME"], "KOD_FILIAL": str(f["ID"])} for f in D["filial"]]
        return NotImplemented

    def _orep_func(self, key, named):
        if key != "OUT_CORRECT.MAIN":
            return NotImplemented
        D, n = self._orp, named
        D["out_correct_log"].append(dict(n))
        P = D["out_provarch"]
        if n["Flag"] == 0:
            D["out_provarch"] = [p for p in P if p["ID"] != n["TransactionID"]]
            return 1
        acc = {a["ID"]: a for a in D["out_account"]}
        rec = {"DEBT": n["DebitID"], "KREDIT": n["CreditID"], "DAT": n["TransactionDate"].date().isoformat(),
               "AMMOUNT": float(n["DebitAmount"]), "AMMOUNT_C": float(n["CreditAmount"]), "LAMMOUNT": float(n["LAmount"]),
               "RATE_D": float(n["DebitRate"]), "RATE_C": float(n["CreditRate"]), "NAME": n["TrName"],
               "VAL_ACC": acc[n["DebitID"]]["VAL_ACC"], "CURRENCYID_C": acc[n["CreditID"]]["VAL_ACC"],
               "KASSA_B": n["InBalanceChar"], "KASSA_Z": n["OutBalanceChar"], "OP_ID": self.user.get("user_id", 1)}
        if n["Flag"] == 1:
            rec["ID"] = max(p["ID"] for p in P) + 1 if P else 1
            P.append(rec)
            return rec["ID"]
        p = next((x for x in P if x["ID"] == n["TransactionID"]), None)
        if p is None:
            from .base import DBError
            raise DBError("ORA-01403: no data found")
        p.update(rec)
        return p["ID"]
