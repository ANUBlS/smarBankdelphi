"""DB_MODE=mock emulation for the Customers (Packages/Customer_Operations) and TransactionManager modules.

Fixture: api/fixtures/cs.json. Recognises the verbatim Delphi SQL text (whitespace-normalised, lower-cased) and the
package calls those modules make. Real behaviour always comes from Oracle; this only makes the UI demonstrable.
"""
from __future__ import annotations
import datetime
import json
import os
import re

from .base import DBError

_cs: dict | None = None


def load(fixtures_dir: str) -> dict:
    global _cs
    if _cs is None:
        _cs = json.load(open(os.path.join(fixtures_dir, "cs.json"), encoding="utf-8"))
    return _cs


def reset():
    global _cs
    _cs = None


def _d(v):
    return datetime.datetime.fromisoformat(v) if isinstance(v, str) and v else v


def _iso(v):
    if isinstance(v, datetime.datetime):
        return v.date().isoformat()
    if isinstance(v, datetime.date):
        return v.isoformat()
    return v


def _order_key(s: str):
    m = re.search(r"order by (.+)$", s)
    return [x.strip() for x in m.group(1).split(",")] if m else []


def _sorted(rows, keys):
    for k in reversed(keys):
        parts = k.split()
        col, desc = parts[0].upper(), len(parts) > 1 and parts[1] == "desc"
        rows = sorted(rows, key=lambda r: (r.get(col) is None, r.get(col) if r.get(col) is not None else 0), reverse=desc)
    return rows


class CsMixin:
    """Mixed into MockConnection; self.st (base fixtures) and self.cs (cs.json) are available."""

    # ------------------------------------------------------------------ views
    def _cust_rows(self, s):
        C = self.cs
        rows = [dict(c, ROWID=f"AAC{c['ID']}", USNAM="",
                     NAME1=re.sub("[IiİıI]", "`", c["NAME"] or "")) for c in C["customers"]
                if (c.get("CUST_TYPE") or 0) == 0 and not c.get("CLOSE_DAT")]
        for r in rows:
            for k in ("OPEN_DAT", "CLOSE_DAT", "DAT_NAL", "DAT_USTAV", "SAMELYDATE"):
                r[k] = _d(r[k])
        inner = s.split("order by", 1)[1].split(")")[0].strip()
        return _sorted(rows, [inner])

    def _juraccs(self):
        out = []
        cur = {c["VALUTE"]: c["VAL_NAME"] for c in self.st["acc"]["avalute"]}
        for a in self.st["acc"]["accounts"]:
            if a["CLOSE_DAT"]:
                continue
            out.append({"ID": a["ID"], "ACCNO": a["ACC_NO"], "ACCNAME": a["NAME"], "ACCVAL": cur.get(a["VAL_ACC"]),
                        "OPENDATE": _d(a["OPEN_DAT"]), "BALANCE": a["OSTAT"], "LBALANCE": a["POK_OSTAT"],
                        "TYPESYMB": a["SIM_OTCET"], "TIPACC": a["TIPACC"], "CUSTID": a["KLI_ID"], "ACCKLID": a["KLI_ID"]})
        return out

    def _tr_view(self, t):
        A = {a["ID"]: a for a in self.st["acc"]["accounts"]}
        cur = {c["VALUTE"]: c["VAL_NAME"] for c in self.st["acc"]["avalute"]}
        users = {u["ID"]: u["NAME"] for u in self.cs["user_list"]}
        da, ca = A.get(t["DEBITID"], {}), A.get(t["CREDITID"], {})
        r = dict(t)
        r.update(TRANSACTIONDATE=_d(t["TRANSACTIONDATE"]), DEBITACCNO=da.get("ACC_NO"), CREDITACCNO=ca.get("ACC_NO"),
                 DEBITCURRENCYID=da.get("VAL_ACC"), CREDITCURRENCYID=ca.get("VAL_ACC"),
                 DEBITCURRENCYSNAME=cur.get(da.get("VAL_ACC")), CREDITCURRENCYSNAME=cur.get(ca.get("VAL_ACC")),
                 DEBITBRANCH=da.get("FILIAL"), CREDITBRANCH=ca.get("FILIAL"), DEBITBALANCE=da.get("BAL_CN1"),
                 USR=users.get(t["OPERATORID"]), USRCOMMIT=users.get(t.get("COMMIT_OPID")), FLAGS=0, ROWID=f"AAT{t['ID']}")
        r.pop("COMMIT_OPID", None)
        return r

    # ------------------------------------------------------------------ queries
    def _cs_query(self, s, b):
        C = self.cs
        A = self.st["acc"]
        L = C["lookups"]
        if "from customers where nvl(cust_type,0)=0 and close_dat is null" in s:
            self._check_access("Customers", "select")
            rows = self._cust_rows(s)
            for i, r in enumerate(rows, 1):
                r["RN__"] = i
            if "where id = :cust_id" in s:
                return [r for r in rows if r["ID"] == b["cust_id"]]
            if "rn__ > :after" in s:
                if "open_dat = :d" in s:
                    pass
                m = re.search(r"upper\(to_char\((\w+)\)\) like", s)
                if m:
                    col, pre = m.group(1).upper(), b["v"][:-1].replace("\\%", "%").replace("\\_", "_").replace("\\\\", "\\")
                    hit = [r for r in rows if r["RN__"] > b["after"] and str(r.get(col) or "").upper().startswith(pre.upper())]
                    return [{"RN__": hit[0]["RN__"]}] if hit else []
            if "open_dat = :d" in s:
                hit = [r for r in rows if r["OPEN_DAT"] == b["d"]]
                return [{"RN__": hit[0]["RN__"]}] if hit else []
            if "hi__" in b:
                return rows[b["lo__"]:b["hi__"]]
            return rows
        if s.startswith("select * from juraccs where custid =:cid"):
            rows = self._juraccs()
            like = (b.get("p_AccNO") or "")
            return [r for r in rows if r["CUSTID"] == b.get("CID") or (like and r["ACCNO"].startswith(like.rstrip("%")))]
        if "from juraccs where upper(accname) like upper(:p_name)" in s:
            q = b["p_name"].strip("%").upper()
            return [r for r in self._juraccs() if q in r["ACCNAME"].upper()][:1]
        if s.startswith("select * from transactionsp"):
            rows = [self._tr_view(t) for t in C["transactions"] if b["p_AccID"] in (t["DEBITID"], t["CREDITID"])]
            return _sorted(rows, _order_key(s))
        if "count(0) cnt from vid_op" in s:
            return [{"CNT": sum(1 for v in C["vid_op"] if v["ID"] == b["v_ID"] and v["TRDELETE"] == 1)}]
        simple = {"select * from prinad": L["prinad"], "select * from qrp_klie": L["qrp_klie"],
                  "select * from vid_sob where cust_type in(-1,0)": [v for v in L["vid_sob"] if v["CUST_TYPE"] in (-1, 0)],
                  "select * from org_prav": L["org_prav"], "select * from sferadey": L["sferadey"],
                  "select * from nalog": L["nalog"], "select * from otrasli": L["otrasli"]}
        if s in simple:
            return simple[s]
        if "from mmx_contact_type a" in s:
            return L["mmx_contact_type"]
        if "from mmx_communication_type a" in s:
            return L["mmx_communication_type"]
        if "select c.phone_code from countries c" in s:
            return [{"PHONE_CODE": c["PHONE_CODE"]} for c in L["countries"] if c["PHONE_CODE"]]
        if "from countries c where lower(c.cntr_name) <> lower('yox')" in s:
            rows = [c for c in L["countries"] if c["CNTR_NAME"].lower() != "yox"]
            return sorted(rows, key=(lambda c: c["CNTR_NAME"]) if "order by c.cntr_name" in s else (lambda c: c["ID"]))
        if "from cities where country_id = nvl(:cid,0)" in s:
            return [c for c in L["cities"] if c["COUNTRY_ID"] == (b.get("CID") or 0)]
        if "from cust_risk_categ" in s:
            return L["cust_risk_categ"]
        if "from cust_risk_desc a where a.risk_id=:v_riskid" in s:
            return [r for r in L["cust_risk_desc"] if r["RISK_ID"] == b.get("v_riskid")]
        if "from cust_quality a" in s:
            return L["cust_quality"]
        # FormAcc_Unit lists
        if "'bütün valyutalar' as valu_name" in s:
            return [{"VALUTE": -1, "VALU_NAME": "Bütün Valyutalar"}] + [{"VALUTE": c["VALUTE"], "VALU_NAME": c["VALU_NAME"]} for c in A["avalute"]]
        m = re.search(r"from bal_spr(\d) order by bal_cn \)", s)
        if m and "union all" in s:
            return [{"BAL_CN": "-1", "BALNAME": "   "}] + [{"BAL_CN": str(r["BAL_CN"]), "BALNAME": r["BALNAME"]} for r in A[f"bal_spr{m.group(1)}"]]
        if "from filial_t where id in(select filialid from sba_objinf where obj=user)" in s:
            return A["filial"]
        if s == "select * from report_symbol order by id":
            return A["report_symbol"]
        if "from acc_settings order by" in s:
            return [{"ID": 1, "BRANCH_ID": str(self.user.get("filial_id", 101))}]
        if "symbol||' '||description as name from account_flags" in s:
            return [{"SYMBOL": " ", "NAME": "Бцтцн символлар"}] + [{"SYMBOL": f["SYMBOL"], "NAME": f["SYMBOL"] + "     " + f["DESCRIPTION"]} for f in A["account_flags"]]
        if "from archost arc where arc.acc_id = :accid order by arc.datdate --desc" in s:
            rows = sorted([r for r in A["archost"] if r["ACC_ID"] == b["AccID"]], key=lambda r: r["DATDATE"])
            return [{"ARCHIVEDATE": _d(r["DATDATE"]), "ACCID": r["ACC_ID"], "AMOUNT": abs(r["OSTAT"]),
                     "LAMOUNT": abs(r["POK_OSTAT"]), "DEBITTURNOVER": abs(r["OBR_D"]), "DEBITLTURNOVER": abs(r["POK_OBR_D"]),
                     "CREDITTURNOVER": abs(r["OBR_K"]), "CREDITLTURNOVER": abs(r["POK_OBR_K"])} for r in rows]
        if "from smart.provarch p, smart.account" in s:
            debit = "(p.debt = :accountid)" in s
            accno = {a["ID"]: a["ACC_NO"] for a in A["accounts"]}
            rows = sorted([p for p in A["provarch"] if (p["DEBT"] if debit else p["KREDIT"]) == b["AccountID"]
                           and b["StartDate"] <= _d(p["DAT"]) <= b["EndDate"]], key=lambda p: p["DAT"])
            out = []
            for p in rows:
                r = {"ID": p["ID"], "OPERATIONDATE": _d(p["DAT"]), "DEBITAMOUNT": p["AMMOUNT"], "CREDITAMOUNT": p["AMMOUNT_C"],
                     "LAMOUNT": p["LAMMOUNT"], "DESTINATION": p["NAME"]}
                if debit:
                    r.update(DEBITACCID=p["DEBT"], CREDITACCNO=accno.get(p["KREDIT"]))
                else:
                    r.update(CREDITACCID=p["KREDIT"], DEBITACCNO=accno.get(p["DEBT"]))
                out.append(r)
            return out
        # ---------------- TransactionManager
        if "from account ad, account ac, avalute dc, avalute cc, provarch p" in s:
            self._check_access("Transaction", "select")
            rows = [self._tr_view(t) for t in C["transactions"] if _d(t["TRANSACTIONDATE"]) == b["TransactionDate"]]
            return _sorted(rows, _order_key(s))
        if s == "select * from filial order by id":
            return A["filial"]
        if "from user$ where sb_aca.checklockuser_num(name)=0" in s:
            return C["user_list"]
        if s == "select id, name from vid_op order by id":
            return [{"ID": v["ID"], "NAME": v["NAME"]} for v in C["vid_op"]]
        if s == "select * from vid_op where id>=0 order by id":
            return C["vid_op"]
        if s == "select valute,valu_name from avalute order by valute":
            return sorted([{"VALUTE": c["VALUTE"], "VALU_NAME": c["VALU_NAME"]} for c in A["avalute"]], key=lambda r: r["VALUTE"])
        if "from settings s where upper(name)='transaction_statust'" in s:
            return [{"ROWID": "AAS1", "NAME": "TRANSACTION_STATUST", "VALUE": C["settings"]["TRANSACTION_STATUST"]}]
        if "from settings where name='accnosearchpos'" in s:
            return [{"VALUE": C["settings"]["AccNoSearchPos"]}]
        if "from avalute currency, temprate rates" in s:
            rate = {r["VAL_KOD"]: r["OSTAT"] for r in C["temprate"]}
            return [{"ID": c["VALUTE"], "SNAME": c["VAL_NAME"], "NAME": c["VALU_NAME"], "RATE": rate[c["VALUTE"]]}
                    for c in sorted(A["avalute"], key=lambda c: c["VALUTE"]) if c["VALUTE"] in rate]
        if "substr(acc_no,:src_pos,30) as acc_no_search" in s:
            p = int(b["src_pos"])
            rows = [{"ID": a["ID"], "ACC_NO": a["ACC_NO"], "ACC_NO_SEARCH": a["ACC_NO"][p - 1:p - 1 + 30], "VAL_ACC": a["VAL_ACC"],
                     "NAME": a["NAME"], "ISCACHEACCOUNT": C["cashincoming"].get(str(a["BAL_CN1"]), 0)}
                    for a in A["accounts"] if not a["CLOSE_DAT"]]
            return sorted(rows, key=lambda r: r["ACC_NO"])
        if "from tenostat where acc_id =:acc_id" in s:
            a = next((a for a in A["accounts"] if a["ID"] == b["acc_id"]), None)
            return [{"ACC_ID": a["ID"], "OSTAT": a["OSTAT"], "POK_OSTAT": a["POK_OSTAT"]}] if a else []
        if "from kassa_b order by symbol" in s:
            return C["kassa_b"]
        if "from convert_assignments order by id" in s:
            return C["convert_assignments"]
        if s == "select valute from avalute":
            return [{"VALUTE": c["VALUTE"]} for c in A["avalute"]]
        if "from trdestination d order by id" in s:
            return sorted(C["trdestination"], key=lambda r: r["ID"])
        if "from trdestination d order by name" in s:
            return sorted(C["trdestination"], key=lambda r: r["NAME"])
        if "from reportdescs d order by name" in s:
            return sorted(C["reportdescs"], key=lambda r: r["NAME"])
        if "from provcountries d order by name" in s:
            return sorted(C["provcountries"], key=lambda r: r["NAME"])
        if "from commision_trans" in s:
            accno = {a["ID"]: a for a in A["accounts"]}
            cur = {c["VALUTE"]: c["VAL_NAME"] for c in A["avalute"]}
            out = []
            for c in C["commission"]:
                r = dict(c)
                for col, pre in (("DEBT", ""), ("CREDIT", ""), ("ADDITIONALDEBT", "A"), ("ADDITIONALCREDIT", "A")):
                    a = accno.get(c[col]) or {}
                    side = "DEBIT" if "DEBT" in col else "CREDIT"
                    r[f"{pre}{side}ACCOUNT"] = a.get("ACC_NO")
                    r[f"{pre}{side}CURRENCY"] = cur.get(a.get("VAL_ACC"))
                r["DEBITCURRENCYID"] = (accno.get(c["DEBT"]) or {}).get("VAL_ACC")
                r["CREDITCURRENCYID"] = (accno.get(c["CREDIT"]) or {}).get("VAL_ACC")
                out.append(r)
            return out
        return None

    def _cs_execute(self, sql, b):
        s = " ".join(sql.lower().split())
        if s.startswith("update settings s set s.value = :value where upper(s.name)='transaction_statust'"):
            self.cs["settings"]["TRANSACTION_STATUST"] = str(b["Value"])
            return True
        return False

    # ------------------------------------------------------------------ packages
    def _cs_func(self, key, args, named):
        C = self.cs
        n = named or {}
        if key == "CUSTOMER_OPERATIONS.GET_MESSAJ":
            return C["required"].get(args[1], 0)
        if key == "PG_PCUSTSERVICE.GET_WORLD_YOXLAMA":
            nm = (args[0] or "").strip().lower()
            return "Sanctions list hit" if any(nm == x.lower() for x in C["blacklist"]) else None
        if key == "PG_PCUSTSERVICE.GET_MODLE_COMP":
            return 0
        if key == "SBOP.GENERATEACCOUNTNUMBER":
            cur = n.get("CurrencyID") or 0
            return f"AZ00SMRT{n.get('BalCn') or 0:04d}{n.get('BranchID') or 0:03d}{cur:03d}{n.get('CustomerID') or 0:010d}"[:28]
        if key == "CUSTOMER_OPERATIONS.OPEN_ACCOUNT":
            self._check_access("Accounts", "insert")
            acc, val, bal, cust, date, limit, rep, fil, tip, name, _ = args
            A = self.st["acc"]
            if any(a["ACC_NO"] == acc for a in A["accounts"]):
                raise DBError("ORA-00001: unique constraint (SB.ACCOUNT_ACC_NO_UK) violated", 1)
            nid = max(a["ID"] for a in A["accounts"]) + 1
            A["accounts"].append(dict(ID=nid, ACC_NO=acc, NAME=name, OPEN_DAT=_iso(date), CLOSE_DAT=None, VAL_ACC=int(val),
                                      BAL_CN1=int(bal), BAL_CN2=0, BAL_CN3=0, BAL_CN4=0, KLI_ID=int(cust), PAIR_ACC=0,
                                      LIMIT=float(limit or 0), SIM_OTCET=int(rep), TIPACC=tip, FILIAL=int(fil), INSIDER="0",
                                      OSTAT=0, POK_OSTAT=0, OBR_D=0, OBR_K=0, POK_OBR_D=0, POK_OBR_K=0,
                                      DSB_OSTAT=0, DSB_POK=0, DLB_OSTAT=0, DLB_POK=0))
            return nid
        if key == "SB_TRANSACTION.GENERATEID":
            C["next_id"] += 1
            return C["next_id"]
        if key == "SB_TRANSACTION.TRANSACTION_ADD":
            return self._tr_add(n)
        if key == "SB_TRANSACTION.TRANSACTION_REJECT":
            t = self._tr(n["TransactionID"])
            if t["STATUS"] == 2:
                raise DBError("ORA-20101: Transaction is already committed", 20101)
            t.update(STATUS=3, REJECT_REASON=n["RejectReason"])
            return 1
        return NotImplemented

    def _cs_proc(self, key, args, named):
        C = self.cs
        n = named or {}
        if key == "SB_ACA.CHECKOBJECTACCESS":
            self._check_access(args[0], args[1])
            return {}
        if key == "SB_ACA.CHECKADVANCEDOBJECTACCESS":
            if not self.user.get("is_adm") and args[0] not in self.user.get("advanced_access", []):
                raise DBError(f"ORA-20280: Access is denied for {args[0]}", 20280)
            return {}
        if key in ("SBOP.ADD_CUSTOMER", "SBOP.UPD_CUSTOMER"):
            self._check_access("Customers", "insert" if key.endswith("ADD_CUSTOMER") else "update")
            g = lambda k: n.get(k, n.get("v_" + k))  # noqa: E731
            rec = dict(OPEN_DAT=_iso(g("OPEN_DAT")), NAME=g("NAME"), SHORT_NAME=g("SHORT_NAME"), NEREZIDENT=g("NEREZIDENT"),
                       PRINAD_KOD=g("PRINAD_KOD"), GROUP_KLIE=g("GROUP_KLIE"), VID_SOB=g("VID_SOB"), ORG_SOB=g("ORG_SOB"),
                       SFERA_DEY=g("SFERA_DEY"), OTRASL=g("OTRASL"), NALOG_KOD=g("NALOG_KOD"), INN=g("INN"), BIK=g("BIK"),
                       KOD_OKPRO=g("KOD_OKPRO"), DAT_NAL=_iso(g("DAT_NAL")), DAT_USTAV=_iso(g("DAT_USTAV")),
                       INCORPORATION_NUMBER=n.get("v_INCORP_NUM"), TPH_CONTACT_TYPE=n["v_TPH_CONTACT_TYPE"],
                       TPH_COMMUNICATION_TYPE=n["v_TPH_COMMUNICATION_TYPE"], TPH_NUMBER=n["v_TPH_NUMBER"],
                       ADDRESS_TYPE=n["v_ADDRESS_TYPE"], ADDRESS=n["v_ADDRESS"],
                       CITY=int(n["v_CITY"]) if n["v_CITY"] else None,
                       COUNTRY_CODE=int(n["v_COUNTRY_CODE"]) if n["v_COUNTRY_CODE"] else None, EMAIL=n["v_EMAIL"],
                       URL=n["v_URL"], INCORPORATION_STATE=n["v_INCORPORATION_STATE"],
                       INCORPORATION_CNTR=int(n["v_INCORPORATION_CNTR"]) if n["v_INCORPORATION_CNTR"] else None,
                       TPH_EXTENSION=n["v_TPH_EXTENSION"], TPH_ZIP=n["v_TPH_ZIP"], TPH_COUNTRY_PREFIX=n["v_TPH_COUNTRY_PREFIX"],
                       TPH_STATE=n["v_TPH_STATE"], RISK_CATEG=n["v_risk_categ"], RISKDESCID=n["v_riskdescid"],
                       SAMELYDATE=_iso(n["v_samelydate"]), QUALITY_ID=n["v_quality_id"])
            if key == "SBOP.ADD_CUSTOMER":
                nid = max(c["ID"] for c in C["customers"]) + 1
                C["customers"].append(dict(rec, ID=nid, OP_ID=0, CLOSE_DAT=None, CUST_TYPE=0, DIRECTOR_ID=None))
                self.st["acc"]["customers"].append({"ID": nid, "NAME": rec["NAME"], "CLOSE_DAT": None})
            else:
                c = next((c for c in C["customers"] if c["ID"] == n["v_ID"]), None)
                if not c:
                    raise DBError("ORA-01403: no data found", 1403)
                c.update(rec)
            return {}
        if key == "SBOP.CLOSE_CUSTOMER":
            self._check_access("Customers", "delete")
            c = next(c for c in C["customers"] if c["ID"] == n["v_ID"])
            c["CLOSE_DAT"] = _iso(n["CURRENTDATE"])
            return {"RESULT": 0}
        if key == "SB_TRANSACTION.TRANSACTION_DELETE":
            t = self._tr(n["TransactionID"])
            if t["STATUS"] == 2 and not self.user.get("is_adm"):
                raise DBError("ORA-20102: Committed transaction cannot be deleted", 20102)
            C["transactions"].remove(t)
            return {}
        if key == "SB_COMPLEX_TRANSACTIONS.SETTRANSACTIONS":
            com = next(c for c in C["commission"] if c["ID"] == n["CommisionID"])
            self._tr_add({"TransactionDate": n["TransDate"], "DebitID": com["DEBT"], "CreditID": com["CREDIT"],
                          "DebitAmount": 0, "CreditAmount": 0, "LAmount": 0, "TrName": com["COMMISIONASSIGNMENT"],
                          "OperationType": 0})
            return {}
        return NotImplemented

    def _cs_plsql(self, sql, b):
        s = " ".join(sql.lower().split())
        if "sb_transaction.transaction_commit(transactionid => :transactionid, committemp => true)" in s:
            t = self._tr(b["TransactionID"])
            if t["DEBITAMOUNT"] >= 5000 and not self.user.get("is_adm"):
                raise DBError("ORA-20110: Amount exceeds the operator commit limit", 20110)
            t.update(STATUS=2, COMMIT_OPID=self.user.get("user_id", 1), REJECT_REASON=None)
            return 1
        return NotImplemented

    # ------------------------------------------------------------------ helpers
    def _tr(self, tid):
        t = next((t for t in self.cs["transactions"] if t["ID"] == tid), None)
        if not t:
            raise DBError("ORA-01403: no data found", 1403)
        return t

    def _tr_add(self, n):
        C = self.cs
        self._check_access("Transaction", "insert")
        tid = n.get("TransactionID")
        if tid is None:
            C["next_id"] += 1
            tid = C["next_id"]
        if any(t["ID"] == tid for t in C["transactions"]):
            raise DBError("ORA-00001: unique constraint (SB.LAZYTRANSACTION_PK) violated", 1)
        C["transactions"].append(dict(
            ID=tid, STATUS=1, OPERATORID=self.user.get("user_id", 1), OPERATIONNO=n.get("TransactionNo") or tid,
            TRANSACTIONDATE=_iso(n["TransactionDate"]), DEBITID=n["DebitID"], CREDITID=n["CreditID"],
            DEBITAMOUNT=float(n["DebitAmount"] or 0), CREDITAMOUNT=float(n["CreditAmount"] or 0), LAMOUNT=float(n["LAmount"] or 0),
            DEBITRATE=n.get("DebitRate"), CREDITRATE=n.get("CreditRate"), NAME=n.get("TrName"),
            OPERATIONCODE=n.get("OperationType") or 0, INBALANCECHAR=n.get("InBalanceChar"),
            OUTBALANCECHAR=n.get("OutBalanceChar"), REJECT_REASON=None, REPORTID=n.get("pReportID"),
            COUNTRID=n.get("pCountrID"), PACKAGENUMBER=None, CYPHERCODE=None, COMMIT_OPID=None))
        return tid
