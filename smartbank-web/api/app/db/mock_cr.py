"""DB_MODE=mock emulation for the credits module (Packages/SB_Credit). Fixture: api/fixtures/cr.json.

SQL is recognised by comparing the whitespace-normalised text with the verbatim constants in app/cr_sql.py.
CM_SCHEDULE.InsertAnnutySchedule / InsertEqualSchedule are emulated with the PL/SQL arithmetic transcribed in
app/cr_logic.py (from SQL_credit/cm_schedule.sql). Transactions: changes are kept until commit; rollback restores.
"""
from __future__ import annotations
import copy
import datetime
import json
import os
import re
from decimal import Decimal

from .base import DBError

_cr: dict | None = None


def load(fixtures_dir: str) -> dict:
    global _cr
    if _cr is None:
        _cr = json.load(open(os.path.join(fixtures_dir, "cr.json"), encoding="utf-8"))
    return _cr


def reset():
    global _cr
    _cr = None


def _n(s: str) -> str:
    return " ".join(s.lower().split())


def _dt(v):
    if isinstance(v, str) and v:
        return datetime.datetime.fromisoformat(v)
    return v


def _d(v):
    if isinstance(v, datetime.datetime):
        return v.date()
    if isinstance(v, str):
        return datetime.date.fromisoformat(v[:10])
    return v


_NORM: dict[str, str] | None = None


def _norm_map():
    global _NORM
    if _NORM is None:
        from .. import cr_sql as Q
        _NORM = {_n(v): k for k, v in vars(Q).items() if k.startswith("SQL_") and isinstance(v, str)}
    return _NORM


def _deca_prefix():
    from .. import cr_sql as Q
    return _n(Q.SQL_DECA_DECADATA_CLOS)[:300]


class CrMixin:
    @property
    def cr(self) -> dict:
        from ..config import settings
        return load(settings.mock_fixtures)

    # -------------------------------------------------------------- tx
    def _cr_touch(self):
        if getattr(self, "_cr_snap", None) is None:
            self._cr_snap = copy.deepcopy({"credits": self.cr["credits"], "schedule": self.cr["schedule"]})

    def _cr_commit(self):
        self._cr_snap = None

    def _cr_rollback(self):
        snap = getattr(self, "_cr_snap", None)
        if snap is not None:
            self.cr["credits"][:] = snap["credits"]
            self.cr["schedule"].clear()
            self.cr["schedule"].update(snap["schedule"])
        self._cr_snap = None

    # -------------------------------------------------------------- helpers
    def _credit(self, cid):
        c = next((c for c in self.cr["credits"] if c["ID"] == int(cid)), None)
        if c is None:
            raise DBError("ORA-01403: no data found", 1403)
        return c

    def _crow(self, c):
        r = {k: _dt(v) if k in ("DATEOFCONCLUSION", "DUEDATEFIRSTCONTRACT", "DUEDATELASTCONTRACT", "STOPCALCDATE") else v
             for k, v in c.items()}
        tr = str.maketrans({"I": "`", "i": "`", "İ": "`", "ı": "`"})
        r["INAME"] = (c.get("NAME") or "").translate(tr)
        r["INUMBEROFCREDIT"] = (c.get("NUMBEROFCREDIT") or "").translate(tr)
        return r

    def _sched(self, cid) -> list:
        return self.cr["schedule"].setdefault(str(int(cid)), [])

    def _sched_rows(self, cid):
        out = []
        for i, r in enumerate(sorted(self._sched(cid), key=lambda x: x["PAYMENTDATE"])):
            out.append({"ROWID": r["ROWID"], "ID": r["ID"], "CREDITID": int(cid), "PAYMENTDATE": _dt(r["PAYMENTDATE"]),
                        "PRINCIPAL": Decimal(str(r["PRINCIPAL"])), "INTEREST": Decimal(str(r["INTEREST"])),
                        "REST": None if r["REST"] is None else Decimal(str(r["REST"]))})
        return out

    def _accs(self, group, val_acc=None, kli=None, out=False):
        res = []
        for a in self.cr["accounts"]:
            if a["GROUP"] != group or bool(a["OUT"]) != out:
                continue
            if val_acc is not None and a["VAL_ACC"] != val_acc:
                continue
            if kli is not None and a["CUSTID"] not in kli:
                continue
            res.append({k: a[k] for k in ("ID", "CUSTID", "ACCNO", "CLIENTNAME", "VAL_ACC")})
        return sorted(res, key=lambda a: (a["ACCNO"], a["CUSTID"]))

    def _admin_right(self, code):
        u = self.username
        return 1 if code in self.cr["adm_additions"].get(u, []) else 0

    # -------------------------------------------------------------- SQL
    def _cr_query(self, s, b):
        C = self.cr
        Lk = C["lookups"]
        if s.startswith("select a.*,translate(a.name") and "from cm_active a where id is not null" in s:
            m = re.search(r"order by (.+)$", s)
            parts = (m.group(1).strip() if m else "id").split()
            col, desc = parts[0].upper(), len(parts) > 1 and parts[1] == "desc"
            rows = [self._crow(c) for c in C["credits"]]
            return sorted(rows, key=lambda r: (r.get(col) is None, r.get(col) if r.get(col) is not None else 0), reverse=desc)
        if "from cm_accounts a" not in s and "from account ac" in s or "from out_account ac" in s:
            return self._acc_lookup(s, b)
        key = _norm_map().get(s)
        if key is None:
            if s.startswith("select * from cm_active_credits p where id is not null"):
                key = "SQL_COEFFICIENT_CREDIT"
            elif s[:300] == _deca_prefix():
                key = "SQL_DECA_DECADATA_CLOS"
            elif s == "select creditid from cm_payments where paydate=sbop.get_date":
                return [{"CREDITID": x} for x in C["today_paid"]]
            elif s == "delete from cm_payment_schedule where rowid = :doa__rowid":
                return None
            else:
                return None
        g = lambda name: [dict(x) for x in Lk[name]]    # noqa: E731
        if key == "SQL_VISIBLE_FIELDS":
            return [dict(x) for x in C["fields_list"]]
        if key == "SQL_SEQ":
            return [dict(x) for x in C["fields_list"] if x["FIELDNAME"] == "STATUS"]
        if key in ("SQL_FILTER_SYSDAT", "SQL_COEFFICIENT_SYSDATE"):
            sy = self.st["sys"]
            return [{"TEK_DAT": datetime.datetime.fromisoformat(sy["tek_dat"]), "PRED_DAT": datetime.datetime.fromisoformat(sy["pred_dat"])}]
        if key == "SQL_CREDIT_PROPS":
            c = self._credit(b["creditid"])
            return [dict(self._crow(c), ROWID=f"AAP{c['ID']}", BOORID=c["BOORID"])]
        if key == "SQL_LOC":
            c = self._credit(b["creditid"])
            return [{k: c.get(k) for k in ("BOOROWERACCID", "LOANACCID", "PRIMARYRESERVEACCID", "PRIMARYPURRESERVEACCID",
                                            "INTERESTACCID", "OUTGUARANTEEACCID", "DUELOANACCID", "DUEINTERESTACCID",
                                            "OUTINTERESTACCID")}]
        simple = {"SQL_CURRENCYS": "currencies", "SQL_BRANCHES": "branches", "SQL_FILTER_BRANCHES": "branches",
                  "SQL_COEFFICIENT_FILIALDATASET": "branches", "SQL_CREDIT_TYPES": "credit_types",
                  "SQL_FILTER_CREDITTYPES": "credit_types", "SQL_PERSON_TYPES": "persons", "SQL_COEFFICIENT_PERSONTYPES": "persons", "SQL_FILTER_PERSONS": "persons",
                  "SQL_USR_GROUPS": "usr_groups", "SQL_FILTER_USERGROUPS": "usr_groups", "SQL_RESERVES": "reserves",
                  "SQL_DUE_RESERVES": "reserves", "SQL_FILTER_PRESERVES": "reserves", "SQL_AUTO_PAYMENT": "automation",
                  "SQL_AUTO_EXPIRE": "automation", "SQL_CALC_INT_METHOD": "calc_methods", "SQL_CUSTOMER": "customers",
                  "SQL_FILTER_CUSTOMERS": "customers", "SQL_COUNTRYS": "countries", "SQL_AIM": "aims",
                  "SQL_FILTER_SRESERVES": "aims", "SQL_PLEDGES": "pledges", "SQL_FILTER_PLEDGES": "pledges",
                  "SQL_EXPERTS": "experts", "SQL_ESTATE_TYPES": "estate_types", "SQL_MEHSUL": "mehsul",
                  "SQL_PAYPERIOD": "payperiod", "SQL_FILTER_USERS": "users", "SQL_FILTER_CATEGORIES": "categories",
                  "SQL_COEFFICIENT_PERSONELTYPEDATASET": "categories"}
        if key in simple:
            rows = g(simple[key])
            if key == "SQL_FILTER_CURRENCYS":
                pass
            return rows
        if key == "SQL_FILTER_CURRENCYS":
            return [{"VALUTE": c["CURRID"], "VALU_NAME": c["CURRNAME"]} for c in Lk["currencies"]]
        if key == "SQL_FILTER_ORACLEDATASET1":
            return [{"ID": 0, "NAME": "Faiz hesablanan"}, {"ID": 1, "NAME": "Faiz heablaması dayandırılmş"}]
        if key == "SQL_PAYINT":
            names = ["Biri", "Ikisi", "Üçü", "Dördü", "Beşi", "Altısı"]
            return [{"ID": i + 1, "NAME": n} for i, n in enumerate(names)] + [{"ID": i, "NAME": str(i)} for i in range(7, 32)]
        if key == "SQL_CREDITCAT":
            return [x for x in g("creditcat") if x["VID_SOB"] == b.get("vid_sob")]
        if key == "SQL_ACTIVITIES":
            return sorted([x for x in g("activities") if x["ACT_ID"] == b.get("act_id")], key=lambda x: x["DESCRIPTION"])
        if key == "SQL_CLIENT_CATEGORIES":
            return [x for x in g("categories") if x["ACT_ID"] == b.get("act_id")]
        if key == "SQL_PRINAD":
            c = next((c for c in C["credits"] if c["BOOROWERID"] == b.get("custid")), None)
            if not c:
                return []
            return [{"ID": c["BOOROWERID"], "TELS": f"Mob-{c['PHONENUMBER']} Ev- Ish-", "NAME": "Rezident",
                     "PASSPIN": c["PINCODE"], "PASNUM": "AZE" + str(b["custid"]), "ADDRESS": c["ADDRESS"]}]
        if key == "SQL_SCHEDULE_SCHEDULEDATA":
            return self._sched_rows(b["CREDITID"])
        if key == "SQL_SCHEDULE_CREDITINFO":
            c = self._credit(b["ID"])
            from ..cr_logic import cm_common_getperiod, ora_round
            d1, d2 = _dt(c["DATEOFCONCLUSION"]), _dt(c["DUEDATEFIRSTCONTRACT"])
            return [{"ID": c["ID"], "CURRENCY": c["CURRENCY"], "CREDITLINEAMOUNT": c["CREDITLINEAMOUNT"],
                     "ANNUALYINTERESTRATE": c["ANNUALYINTERESTRATE"],
                     "ANNUALYINTERESTRATE1": float(ora_round(Decimal(str(c["ANNUALYINTERESTRATE"])) / 12, 2)),
                     "DATEOFCONCLUSION": d1, "ANNUALBANKRATE": c["ANNUALBANKRATE"], "ANNUALYPENALTYRATE": c["ANNUALYPENALTYRATE"],
                     "INTCALCMETHOD": c["INTCALCMETHOD"], "DUEDATEFIRSTCONTRACT": d2,
                     "ENDDAT": _dt(c["DUEDATELASTCONTRACT"]) or d2, "CREDITTYPE": c["CREDITTYPE"], "BRANCHID": c["BRANCHID"],
                     "NUMBER_TEX": f"{d1.strftime('%d-%b-%y').upper()}tarixli{c['NUMBEROFCREDIT']} Saylı kredit müqaviləsinə 1№- li  əlavə",
                     "FIFD": 0, "PERIOD": cm_common_getperiod(d1.date(), d2.date()), "VAL_NAME": c["VAL_NAME"],
                     "REST": c["REST"] + c["DUEREST"]}]
        if key == "SQL_SCHEDULE_BOOROWERINFO":
            c = self._credit(b["CREDITID"])
            acc = {a["ID"]: a["ACCNO"] for a in C["accounts"]}
            return [{"NAME": c["NAME"], "CUSTACCNO": acc.get(c.get("BOOROWERACCID")), "LOANACCNO": acc.get(c.get("LOANACCID"))}]
        if key == "SQL_COEFFICIENT_CREDIT":
            ids = [c for c in C["credits"]]
            m = re.search(r"and p\.branchid in\(([\d,]+)\)", s)
            if m:
                bs = {int(x) for x in m.group(1).split(",")}
                ids = [c for c in ids if c["BRANCHID"] in bs]
            m = re.search(r"and p\.customertype in\(([\d,]+)\)", s)
            if m:
                cs = {int(x) for x in m.group(1).split(",")}
                ids = [c for c in ids if c["CUSTOMERTYPE"] in cs]
            return [self._crow(c) for c in ids]
        if key in ("SQL_COEFFICIENT_ACTIVE", "SQL_COEFFICIENT_MAIN"):
            out = []
            for r in C["report_f1"]:
                k = Decimal(str(r["KURUS"]))
                v = lambda f: Decimal(str(r[f])) * k   # noqa: E731
                if key == "SQL_COEFFICIENT_ACTIVE":
                    out.append({"NAME": r["BRANCH"], "PORTFEL": v("DEBTMAIN"), "ODENILMELIFAIZ": v("DATEDEBTINT"),
                                "ODENILMISH": v("PAYEDINT"), "GECFAIZMEB": v("DEBTOVERINT"), "GEC": v("GECFAIZQALIQ"),
                                "GF": v("GECFAIZQALIQ") / v("DEBTMAIN"), "F": v("PAYEDINT") / v("DATEDEBTINT")})
                else:
                    out.append({"NAME": r["BRANCH"], "PORTFEL": v("DEBTMAIN"), "ODENILMELI": v("DATEDEBTMAIN"),
                                "ODENILMISH": v("PAYEDMAIN"), "ARTIQ": v("ARTIQESAS"), "GECES": v("DEBTOVERMAIN"),
                                "GEC": v("GECESASQALIQ")})
            return out
        if key == "SQL_DECA_TAGSETTINGS":
            return sorted([dict(x, ROWID=f"T{x['NUM']}") for x in C["deca_tags"]], key=lambda x: x["NUM"])
        if key == "SQL_DECA_DECADATA_CLOS":
            return self._deca_rows(s, b)
        return None

    def _deca_rows(self, s, b):
        rows = []
        for c in self.cr["credits"]:
            if "and b.numberofcredit=:numberofcredit" in s and c["NUMBEROFCREDIT"] != b.get("numberofcredit"):
                continue
            m = re.search(r"and dateofconclusion between '(\d\d)-([a-z]{3})-(\d{4})' and '(\d\d)-([a-z]{3})-(\d{4})'", s)
            if m:
                mon = ["jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"]
                lo = datetime.date(int(m.group(3)), mon.index(m.group(2)) + 1, int(m.group(1)))
                hi = datetime.date(int(m.group(6)), mon.index(m.group(5)) + 1, int(m.group(4)))
                if not lo <= _d(c["DATEOFCONCLUSION"]) <= hi:
                    continue
            rows.append({"ID": c["BOOROWERID"], "NAME": c["NAME"].replace("&", "_") if c["NAME"] == "&" else c["NAME"],
                         "PINCODE": c["PINCODE"] or None, "GID": None, "GNAME": None, "ACCOUNTNO": c["ID"],
                         "CURRENCY": c["VAL_NAME"], "DISOUSUM": Decimal(str(c["REST"])) + Decimal(str(c["DUEREST"]))})
        return rows

    def _acc_lookup(self, s, b):
        group = None
        for k in ("loanaccs", "clientaccs", "interestaccs", "preserveaccs", "dueloanaccs", "outinterestaccs", "obligationaccs"):
            if f"g.iname = :{k}" in s:
                group = {kk.lower(): kk for kk in b}.get(k)
                group = b.get(group) if group else None
        if group is None:
            return None             # not a credits account lookup (e.g. the Accounts module)
        val = 0 if "where val_acc = 0" in s else b.get("val_acc")
        kli = None
        m = re.search(r"and ac\.kli_id in \((\d+),502\)", s) or re.search(r" and ac\.kli_id=(\d+)", s)
        if m and "/*and ac.kli_id" not in s[m.start() - 3:m.start() + 3]:
            kli = {int(m.group(1))} | ({502} if ",502)" in m.group(0) else set())
        if "ac.kli_id=:kli_id" in s.replace("/*and ac.kli_id=:kli_id*/", "").replace("--and ac.kli_id=:kli_id", ""):
            kli = {b.get("kli_id")}
        return self._accs(group, val, kli, out="from out_account ac" in s)

    def _cr_execute(self, sql, b):
        if _n(sql) == "delete from cm_payment_schedule where rowid = :doa__rowid":
            self._cr_touch()
            for k, lst in self.cr["schedule"].items():
                lst[:] = [r for r in lst if r["ROWID"] != b["doa__rowid"]]
            return True
        return False

    def _cr_plsql(self, sql, b):
        m = re.fullmatch(r"begin :r := cm_decls\.(\w+); end;", sql.strip())
        if m:
            grp = self.cr["decls"].get(m.group(1))
            return {"ClientAccs": 1, "PReserveAccs": 2, "InterestAccs": 3, "DueLoanAccs": 4, "ObligationAccs": 5,
                    "OutInterestAccs": 6}.get(grp, 0)
        return NotImplemented

    # -------------------------------------------------------------- packages
    _GRP = {1: "ClientAccs", 2: "PReserveAccs", 3: "InterestAccs", 4: "DueLoanAccs", 5: "ObligationAccs", 6: "OutInterestAccs"}

    def _cr_func(self, key, args, named):
        C = self.cr
        n = named or {}
        if key == "CM_ADMINISTRATION.GETPLUGINID":
            return C["plugins"].get(f"{args[0]}/{args[1]}", 0)
        if key == "CM_ADMINISTRATION.GETADMADDITION":
            return 1 if self.user.get("is_adm") else self._admin_right(args[0])
        if key == "CM_CREDIT.GET_STATUS":
            return int(self._credit(n["p_id"]).get("STATUS") or 0)
        if key == "CM_COMMON.GETPERIOD":
            from ..cr_logic import cm_common_getperiod
            return cm_common_getperiod(_d(args[0]), _d(args[1]))
        if key == "CM_COMMON.GET_ACCID":
            cust, grp = args[0], self._GRP.get(args[1])
            out = len(args) > 2 and args[2] == 1
            a = next((a for a in C["accounts"] if a["CUSTID"] == cust and a["GROUP"] == grp and bool(a["OUT"]) == out), None)
            return a["ID"] if a else 0
        if key == "CM_SCHEDULE.GET_ANNUTYDATE":
            from ..cr_logic import is_sunday
            d = _d(n["p_date"])
            sel = {datetime.date.fromisoformat(x) for x in C["seldates"]}
            if is_sunday(d):
                d += datetime.timedelta(days=1)
            while d in sel:
                d += datetime.timedelta(days=1)
            return datetime.datetime.combine(d, datetime.time())
        if key in ("CM_CREDIT.CONTRACT_ADD", "CM_CREDIT.CONTRACT_EDIT"):
            return self._contract(key.endswith("ADD"), n)
        return NotImplemented

    def _cr_bool(self, key, args, named):
        n = named or {}
        if key == "CM_ADMINISTRATION.PLUGINACCESS":
            if self.user.get("is_adm"):
                return True
            return int(args[0]) in self.cr["user_plugins"].get(self.username, [])
        if key == "CM_CREDIT.CHECKPERSON":
            return int(n.get("P_ID") or 0) in self.cr["check_person_true"]
        return NotImplemented

    def _cr_proc(self, key, args, named):
        n = named or {}
        if key == "CM_CREDIT.GET_POST":
            self._cr_touch()
            self._credit(n["p_id"])["STATUS"] = int(n["p_status"])
            self._cr_commit()     # mock assumption: get_post commits itself (package source not in repo)
            return {}
        if key in ("CM_SCHEDULE.INSERTANNUTYSCHEDULE", "CM_SCHEDULE.INSERTEQUALSCHEDULE"):
            from .. import cr_logic as L
            self._cr_touch()
            cid = int(n["p_CreditID"])
            c = self._credit(cid)
            sel = frozenset(datetime.date.fromisoformat(x) for x in self.cr["seldates"])
            if key.endswith("ANNUTYSCHEDULE"):
                rows = L.insert_annuty_schedule(n["p_Amount"], n["p_Rate"], _d(n["p_FirstPayDate"]), _d(n["p_StartDate"]),
                                                n["p_Periods"], n["p_PeriodRate"], c["CREDITLINEAMOUNT"], sel)
            else:
                rows = L.insert_equal_schedule(n["p_Amount"], n["p_Rate"], _d(n["p_FirstPayDate"]), _d(n["p_StartDate"]),
                                               n["p_Periods"], n["p_PeriodRate"])
            lst = self._sched(cid)
            nid = max([r["ID"] for v in self.cr["schedule"].values() for r in v] + [0]) + 1
            for r in rows:
                lst.append({"ID": nid, "ROWID": f"AAS{nid}", "PAYMENTDATE": r["PAYMENTDATE"].isoformat(),
                            "PRINCIPAL": str(r["PRINCIPAL"]), "INTEREST": str(r["INTEREST"]),
                            "REST": None if r["REST"] is None else str(r["REST"])})
                nid += 1
            return {}
        if key == "CM_AK_REPORTS.INSINFOF1":
            if int(n["p_id"]) in self.cr["coef_fail_ids"]:
                raise DBError("ORA-01476: divisor is equal to zero", 1476)
            return {}
        return NotImplemented

    def _contract(self, insert, n):
        self._cr_touch()
        C = self.cr
        from ..credits import SAVE_MAP
        if insert:
            cid = max(c["ID"] for c in C["credits"]) + 1
            c = {"ID": cid, "STATUS": 2, "INITIALAMOUNT": 0, "REST": 0, "INTERESTREST": 0, "DUEREST": 0, "DUEINTERESTREST": 0,
                 "OBLIGATION": 0, "PLEDGEPRICE": 0, "PLEDGEID": n.get("PLEDGEID_P"), "PENALTYREST": 0, "BOOROWERREST": 0,
                 "KR_STATUS": 0, "STOPCALCDATE": None, "DUEDATELASTCONTRACT": None, "IPREST": 0, "IPINTERESTREST": 0,
                 "PLEDGSORTS": None, "PLEDGEPRICETORPAQ": 0, "PLEDGEPRICEEV": 0, "USID": self.user.get("user_id", 0)}
            C["credits"].append(c)
        else:
            c = self._credit(n["CreditID"])
        if any(x.get("NUMBEROFCREDIT") == n["NumberOfCredit"] and x["ID"] != c["ID"] for x in C["credits"]):
            raise DBError("ORA-00001: unique constraint (CREDITSMGR.UK_NUMBEROFCREDIT) violated", 1)
        for f, p, t in SAVE_MAP:
            v = n.get(p)
            if t == "date":
                v = v.date().isoformat() if isinstance(v, datetime.datetime) else v
            c[f] = v
        cur = {x["CURRID"]: x for x in C["lookups"]["currencies"]}.get(c["CURRENCY"], {})
        c["VAL_NAME"] = cur.get("VAL_NAME", "")
        c["NAME"] = next((x["NAME"] for x in C["lookups"]["customers"] if x["ID"] == c["BOOROWERID"]), "")
        c["FILIAL"] = next((x["NAME"] for x in C["lookups"]["branches"] if x["ID"] == c["BRANCHID"]), "")
        acc = {a["ID"]: a["ACCNO"] for a in C["accounts"]}
        c["CONTRACTACCNO"] = acc.get(c.get("LOANACCID"), "")
        return c["ID"]
