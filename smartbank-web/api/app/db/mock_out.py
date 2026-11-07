"""Mock handlers for Packages/Out_transaction_manager (OUT_* tables / OUT_SB_TRANSACTION)."""
from __future__ import annotations
import copy
import datetime as dt
from pathlib import Path

from .base import DBError

_DATA = None


def reset():
    global _DATA
    _DATA = None


def load(fixtures_dir: Path):
    global _DATA
    if _DATA is None:
        import json
        _DATA = json.loads((Path(fixtures_dir) / "out.json").read_text())
    return copy.deepcopy(_DATA)


def _iso(v):
    if v is None:
        return None
    if isinstance(v, dt.datetime):
        return v.date().isoformat()
    if isinstance(v, dt.date):
        return v.isoformat()
    return str(v)[:10]


class OutMixin:
    """Mixin for MockConnection: OUT_ SQL + OUT_SB_* package calls."""

    def _out_tr(self, tid):
        t = next((x for x in self.out["out_transactions"] if x["ID"] == int(tid)), None)
        if not t:
            raise DBError("ORA-01403: no data found", 1403)
        return t

    def _out_tr_add(self, n):
        tid = n.get("TransactionID")
        if tid in (None,):
            self.out["next_id"] += 1
            tid = self.out["next_id"]
        else:
            tid = int(tid)
            self.out["out_transactions"] = [x for x in self.out["out_transactions"] if x["ID"] != tid]
        rec = {
            "ID": tid, "OP_ID": 1, "NO_PROV": n.get("TransactionNo"), "DAT": _iso(n["TransactionDate"]),
            "DEBT": int(n["DebitID"]), "KREDIT": int(n["CreditID"]),
            "VAL_ACC": 0, "CURRENCYID_C": 0,
            "AMMOUNT": float(n.get("DebitAmount") or 0), "AMMOUNT_C": float(n.get("CreditAmount") or 0),
            "LAMMOUNT": float(n.get("LAmount") or 0),
            "RATE_D": float(n.get("DebitRate") or 0), "RATE_C": float(n.get("CreditRate") or 0),
            "BANK_D": None, "BANK_K": None, "NO_PACK": None, "SHIFR": None,
            "VID_OP": int(n.get("OperationType") or 0),
            "KASSA_B": n.get("InBalanceChar"), "KASSA_Z": int(n.get("OutBalanceChar") or 0),
            "NO_FILIAL": 1, "NAME": n.get("TrName"), "COMMIT_OPID": None,
            "STATUS": 1, "REJECT_REASON": None,
        }
        # currency from accounts
        accs = {a["ID"]: a for a in self.out["out_accounts"]}
        if rec["DEBT"] in accs:
            rec["VAL_ACC"] = accs[rec["DEBT"]]["VAL_ACC"]
        if rec["KREDIT"] in accs:
            rec["CURRENCYID_C"] = accs[rec["KREDIT"]]["VAL_ACC"]
        self.out["out_transactions"].append(rec)
        return tid

    def _out_func(self, key, args, named):
        n = named or {}
        if key == "OUT_SB_TRANSACTION.GENERATEID":
            self.out["next_id"] += 1
            return self.out["next_id"]
        if key == "OUT_SB_TRANSACTION.TRANSACTION_ADD":
            return self._out_tr_add(n)
        if key == "OUT_SB_TRANSACTION.TRANSACTION_REJECT":
            t = self._out_tr(n["TransactionID"])
            if t["STATUS"] == 2:
                raise DBError("ORA-20101: Transaction is already committed", 20101)
            t.update(STATUS=3, REJECT_REASON=n.get("RejectReason"))
            return 1
        if key == "OUT_SB_TRANSACTION.TRANSACTION_COMMIT":
            t = self._out_tr(n["TransactionID"])
            if t["STATUS"] == 2:
                raise DBError("ORA-20101: already committed", 20101)
            t["STATUS"] = 2
            t["COMMIT_OPID"] = 1
            return 1
        if key == "OUT_SB_TRANSACTION.TRANSACTIONS_DELAYED_COMMIT":
            ids = [int(x) for x in str(n.get("OverloadIDsStr") or "").split(",") if x.strip()]
            done = 0
            for i in ids:
                t = self._out_tr(i)
                if t["STATUS"] != 2:
                    t.update(STATUS=2, COMMIT_OPID=1); done += 1
            return done
        if key.startswith("OUT_SB_COMPLEX_TRANSACTIONS.GETACCOUNT"):
            return ""
        return NotImplemented

    def _out_proc(self, key, args, named):
        n = named or {}
        if key == "OUT_SB_TRANSACTION.TRANSACTION_DELETE":
            t = self._out_tr(n["TransactionID"])
            if t["STATUS"] == 2 and not self.user.get("is_adm"):
                raise DBError("ORA-20102: Committed transaction cannot be deleted", 20102)
            self.out["out_transactions"].remove(t)
            return {}
        if key == "OUT_SB_COMPLEX_TRANSACTIONS.SETTRANSACTIONS":
            com = next(c for c in self.out["out_commission"] if c["ID"] == n["CommisionID"])
            self._out_tr_add({"TransactionDate": n["TransDate"], "DebitID": com["DEBT"], "CreditID": com["CREDIT"],
                             "DebitAmount": n.get("DebitAmmount") or 0, "CreditAmount": n.get("CreditAmmount") or 0,
                             "LAmount": 0, "TrName": com.get("COMMISIONASSIGNMENT"), "OperationType": 0})
            return {}
        return NotImplemented

    def _out_query(self, sql, binds):
        s = " ".join(sql.lower().split())
        O = self.out
        b = binds or {}

        if s == "select * from user$":
            # Out Users dataset (TransactionDataModuleUnit.dfm:688) - no lock filter
            return [{"ID": u.get("user_id", 0), "NAME": name} for name, u in self.st["users"].items()
                    if name not in ("EXPIRED", "LOCKED", "FINGER")]
        if "from convert_assignments" in s:
            return self.cs.get("convert_assignments") or [{"ID": 1, "NAME": "FX"}]
        if "from out_sb_complex_transactions" in s or ("from commision_trans" in s and "out_sb_complex" in s):
            pass  # fall through to commission handler below
        if "from out_account ad" in s and ("out_provarch" in s or "out_lazytransaction" in s):
            # list query: union of committed (status 2) and lazy (1/3) - our fixture stores STATUS on all
            date = _iso(b.get("TransactionDate"))
            cur = {c["VALUTE"]: c for c in self.st.get("sys", {}).get("avalute", self._avalute())}
            # fall back currencies from system fixture via existing mock
            rows = []
            for p in O["out_transactions"]:
                if _iso(p["DAT"]) != date:
                    continue
                ad = next((a for a in O["out_accounts"] if a["ID"] == p["DEBT"]), None)
                ac = next((a for a in O["out_accounts"] if a["ID"] == p["KREDIT"]), None)
                if not ad or not ac:
                    continue
                rows.append({
                    "ID": p["ID"], "OPERATORID": p["OP_ID"], "OPERATIONNO": p["NO_PROV"],
                    "TRANSACTIONDATE": p["DAT"], "DEBITID": p["DEBT"], "DEBITACCNO": ad["ACC_NO"],
                    "DEBITCURRENCYID": p["VAL_ACC"], "DEBITCURRENCYSNAME": "AZN",
                    "DEBITBRANCH": ad["FILIAL"], "CREDITID": p["KREDIT"], "CREDITACCNO": ac["ACC_NO"],
                    "CREDITCURRENCYID": p["CURRENCYID_C"], "CREDITCURRENCYSNAME": "AZN",
                    "CREDITBRANCH": ac["FILIAL"], "DEBITAMOUNT": p["AMMOUNT"], "CREDITAMOUNT": p["AMMOUNT_C"],
                    "LAMOUNT": p["LAMMOUNT"], "DEBITRATE": p["RATE_D"], "CREDITRATE": p["RATE_C"],
                    "DEBITBANK": p["BANK_D"], "CREDITBANK": p["BANK_K"], "PACKAGENUMBER": p["NO_PACK"],
                    "CYPHERCODE": p["SHIFR"], "OPERATIONCODE": p["VID_OP"],
                    "INBALANCECHAR": p["KASSA_B"], "OUTBALANCECHAR": p["KASSA_Z"],
                    "FILIALID": p["NO_FILIAL"], "DEBITBALANCE": ad["BAL_CN1"], "NAME": p["NAME"],
                    "USR": "ADMIN", "USRCOMMIT": "ADMIN" if p.get("COMMIT_OPID") else "",
                    "FLAGS": 0, "STATUS": p["STATUS"], "REJECT_REASON": p.get("REJECT_REASON") or "",
                    "DCUSTID": ad["KLI_ID"], "CCUSTID": ac["KLI_ID"],
                })
            return rows
        if "from out_account" in s and "out_bal_spr1" in s and "a.kli_id=:v_custid" in s.replace(" ", ""):
            cid = int(b.get("v_custid") or -999999)
            out = []
            for a in O["out_accounts"]:
                if a.get("CLOSE_DAT"):
                    continue
                if a["KLI_ID"] != cid:
                    continue
                spr = next((x for x in O["out_bal_spr1"] if x["BAL_CN"] == a["BAL_CN1"]), {"CASHINCOMING": 0})
                out.append({"ID": a["ID"], "ACC_NO": a["ACC_NO"], "VAL_ACC": a["VAL_ACC"], "NAME": a["NAME"],
                            "ISCACHEACCOUNT": spr["CASHINCOMING"]})
            return out
        if "from out_account a, out_bal_spr1 p" in s and "a.id=:id" in s.replace(" ", ""):
            aid = int(b["id"])
            a = next((x for x in O["out_accounts"] if x["ID"] == aid), None)
            if not a:
                return []
            spr = next((x for x in O["out_bal_spr1"] if x["BAL_CN"] == a["BAL_CN1"]), {"CASHINCOMING": 0})
            return [{"ID": a["ID"], "ACC_NO": a["ACC_NO"], "VAL_ACC": a["VAL_ACC"], "NAME": a["NAME"],
                     "ISCACHEACCOUNT": spr["CASHINCOMING"]}]
        if "from out_trdestination" in s:
            return list(O["out_trdestination"])
        if "from out_tenostat" in s:
            aid = int(b.get("acc_id") or 0)
            return [x for x in O["out_tenostat"] if x["ACC_ID"] == aid]
        if "from commision_trans" in s and "out_sb_complex" in s:
            # commission SQL uses out_sb_complex_transactions getters - treat as out_commission
            rows = []
            for c in O["out_commission"]:
                rows.append({
                    "ID": c["ID"], "NAME": c["NAME"], "DEBT": c["DEBT"], "CREDIT": c["CREDIT"],
                    "DEBITACCOUNT": "OUT001001", "CREDITACCOUNT": "OUT001002",
                    "DEBITCURRENCY": "AZN", "CREDITCURRENCY": "AZN",
                    "DEBITCURRENCYID": 0, "CREDITCURRENCYID": 0,
                    "ADDITIONALDEBT": c.get("ADDITIONALDEBT"), "ADDITIONALCREDIT": c.get("ADDITIONALCREDIT"),
                    "ADEBITACCOUNT": None, "ACREDITACCOUNT": None,
                    "ADEBITCURRENCY": None, "ACREDITCURRENCY": None,
                    "ADDDEBITCURRENCYID": None, "ADDCREDITCURRENCYID": None,
                    "ASSIGNMENT": c.get("ASSIGNMENT"), "COMMISIONASSIGNMENT": c.get("COMMISIONASSIGNMENT"),
                    "USERID": c.get("USERID", 0),
                })
            return rows
        return NotImplemented

    def _avalute(self):
        return [{"VALUTE": 0, "VAL_NAME": "AZN", "VALU_NAME": "Azerbaijani Manat"}]
