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
        if key == "SQL_FILTER_EXPERTDAET":
            return g("experts")
        if key == "SQL_TRANCHES":
            cid = str(b["creditid"])
            return C.setdefault("tranches", {}).get(cid, [
                {"ROWID": f"AATR{cid}_1", "ID": 1, "CREDITID": int(cid), "TRANCHEDATE": _dt("2026-01-15"),
                 "AMOUNT": Decimal("10000.00"), "PURPOSE": "İlkin tranş verilişi", "IS_CASH": 0, "STATUS": 1}
            ])
        if key == "SQL_PAYMENTS":
            cid = str(b["creditid"])
            return C.setdefault("payments", {}).get(cid, [
                {"ROWID": f"AAPY{cid}_1", "ID": 1, "CREDITID": int(cid), "PAYDATE": _dt("2026-02-15"),
                 "TOTAL": Decimal("950.00"), "MAIN_AMOUNT": Decimal("800.00"), "DUEMAIN_AMOUNT": Decimal("0.00"),
                 "INTEREST_AMOUNT": Decimal("150.00"), "DUEINTEREST_AMOUNT": Decimal("0.00"),
                 "PENALTY_AMOUNT": Decimal("0.00"), "STATUS": 1, "NOTES": "Aylıq ödəniş"}
            ])
        if key == "SQL_PROLONGATIONS":
            cid = str(b["creditid"])
            return C.setdefault("prolongations", {}).get(cid, [])
        if key == "SQL_EXPIRES":
            cid = str(b["creditid"])
            return C.setdefault("expires", {}).get(cid, [])
        if key == "SQL_TRANCHE_SCHEDULE":
            cid = str(b["creditid"])
            return C.setdefault("tranche_schedule", {}).get(cid, [
                {"ROWID": f"AATS{cid}_1", "ID": 1, "CREDITID": int(cid), "TRANCHEDATE": _dt("2026-01-15"),
                 "AMOUNT": Decimal("10000.00"), "NOTES": "Plan üzrə 1-ci tranş"}
            ])
        if key == "SQL_INTCACHE":
            return C.setdefault("intcache", [
                {"ROWID": f"AAIC{c['ID']}", "CREDITID": c["ID"], "NUMBEROFCREDIT": c["NUMBEROFCREDIT"],
                 "NAME": c["NAME"], "CALCDATE": _dt("2026-10-25"), "MAININT": Decimal("45.20"),
                 "OVERDUEINT": Decimal("0.00"), "PENALTY": Decimal("0.00"), "STATUS": 0}
                for c in C["credits"]
            ])
        if key == "SQL_ENDCALAC":
            return C.setdefault("endcalac", [
                {"CALCDATE": _dt("2026-10-24"), "CREDITS_COUNT": len(C["credits"]), "TOTAL_INT": Decimal("135.60"), "USERNAME": "ADMIN"}
            ])
        if key == "SQL_CURR_STATE":
            c = self._credit(b["creditid"])
            return [{
                "ROWID": f"AACS{c['ID']}", "CREDITID": c["ID"],
                "REST": Decimal(str(c.get("REST") or 0)),
                "INTERESTREST": Decimal(str(c.get("INTERESTREST") or 0)),
                "DUEREST": Decimal(str(c.get("DUEREST") or 0)),
                "DUEINTERESTREST": Decimal(str(c.get("DUEINTERESTREST") or 0)),
                "PENALTYREST": Decimal(str(c.get("PENALTYREST") or 0)),
                "PLEDGEPRICE": Decimal(str(c.get("PLEDGEPRICE") or 0)),
                "OBLIGATION": Decimal(str(c.get("OBLIGATION") or 0)),
                "BOOROWERREST": Decimal(str(c.get("BOOROWERREST") or 0)),
                "RESERVEID": c.get("RESERVEID", 1),
                "DUERESERVEID": c.get("DUERESERVEID", 1),
            }]
        if key == "SQL_HISTORY_AUDIT":
            cid = str(b["creditid"])
            return C.setdefault("history_audit", {}).get(cid, [])
        if key == "SQL_PORTFOLIO_UPDATE":
            cid = str(b["creditid"])
            return C.setdefault("portfolio_update", {}).get(cid, [
                {"CREDITID": int(cid), "UPDDATE": _dt("2026-01-15"), "USERNAME": "ADMIN", "FIELDNAME": "STATUS", "OLDVAL": "2", "NEWVAL": "1"}
            ])
        if key == "SQL_GUARANTEE_CARDS":
            cid = str(b["creditid"])
            c = self._credit(b["creditid"])
            return C.setdefault("guarantee_cards", {}).get(cid, [
                {"ROWID": f"AAGC{cid}_1", "CREDITID": int(cid), "CARDID": 1, "PLEDGEID": c.get("PLEDGEID_P") or 1,
                 "PLEDGEPRICE": Decimal(str(c.get("PLEDGEPRICE") or 15000)), "CURRENCY": c.get("CURRENCY", 0),
                 "ANYINFOTODISTING": "Daşınmaz əmlak girovu", "REGISTRYNO": "REG-001",
                 "REGISTRYDATE": _dt("2026-01-10"), "REGISTRYAGENCY": "DƏDRX", "OWNERNAME": c.get("NAME")}
            ])
        if key == "SQL_GUARANTOR_CARDS":
            cid = str(b["creditid"])
            c = self._credit(b["creditid"])
            return C.setdefault("guarantor_cards", {}).get(cid, [
                {"ROWID": f"AAGZ{cid}_1", "CREDITID": int(cid), "CARDID": 1,
                 "GUARANTORID": c.get("GUARANTORID") or "101", "GUARANTORNAME": c.get("GUARANTORNAME") or "Zamin Şəxs",
                 "GUARANTORSALARY": c.get("GUARANTORSALARY") or "1500", "PINCODE": "1234567",
                 "CUNTRYCODE": "AZE", "CUNTRY": "Azərbaycan", "CITY": "Bakı", "DATEOFBIRTH": _dt("1982-03-10")}
            ])
        if key == "SQL_GUARCOMPANY":
            return C.setdefault("guar_companies", [{"ID": 1, "NAME": "İpoteka və Kredit Zəmanət Fondu"}, {"ID": 2, "NAME": "Aqrar Kredit və İnkişaf Agentliyi"}])
        if key == "SQL_BOOROWERINFO":
            c = self._credit(b["creditid"])
            return [{
                "ROWID": f"AABI{c['ID']}", "CREDITID": c["ID"], "BOOROWERID": c.get("BOOROWERID"),
                "NAME": c.get("NAME"), "COUNTRYCODE": c.get("COUNTRYCODE", "AZE"),
                "BANKRUPTEYSTATUS": c.get("BANKRUPTEYSTATUS", 0), "PHONENUMBER": c.get("PHONENUMBER", ""),
                "ADDRESS": c.get("ADDRESS", ""), "PINCODE": c.get("PINCODE", ""), "SALARY": c.get("SALARY", ""),
                "FIRSTOWNERID": c.get("FIRSTOWNERID", ""), "FIRSTOWNERNAME": c.get("FIRSTOWNERNAME", ""),
                "SECONDOWNERID": c.get("SECONDOWNERID", ""), "SECONDOWNERNAME": c.get("SECONDOWNERNAME", ""),
                "THIRDOWNERID": c.get("THIRDOWNERID", ""), "THIRDOWNERNAME": c.get("THIRDOWNERNAME", ""),
                "GUARANTORNAME": c.get("GUARANTORNAME", ""), "GUARANTORID": c.get("GUARANTORID", ""),
                "GUARANTORSALARY": c.get("GUARANTORSALARY", ""),
            }]
        if key == "SQL_BUSINESS_PLAN":
            cid = str(b["creditid"])
            return C.setdefault("business_plan", {}).get(cid, [
                {"ROWID": f"AABP{cid}_1", "ID": 1, "CREDITID": int(cid), "STAGE": "I mərhələ", "PLANDATE": _dt("2026-06-01"),
                 "EXPECTED_INCOME": Decimal("25000.00"), "EXPECTED_EXPENSE": Decimal("14000.00"), "NOTES": "Biznes plan icrası"}
            ])
        if key == "SQL_LEGAL_MEASURES":
            cid = str(b["creditid"])
            return C.setdefault("legal_measures", {}).get(cid, [])
        if key == "SQL_GRANT_TECH":
            cid = str(b["creditid"])
            return C.setdefault("grant_tech", {}).get(cid, [])
        if key == "SQL_PROTOKOL":
            cid = str(b["creditid"])
            c = self._credit(b["creditid"])
            return [C.setdefault("protokol", {}).get(cid, {
                "ROWID": f"AAPR{cid}", "CREDITID": int(cid), "PROTOKOL_NO": f"PR-{cid}/2026",
                "PROTOKOL_DATE": _dt(c.get("DATEOFCONCLUSION") or "2026-01-10"),
                "CHAIRMAN": "Kredit Komitəsi Sədri", "MEMBERS": "Üzv 1, Üzv 2, Üzv 3",
                "DECISION": "Kreditin ayrılması təsdiq edilsin", "CONDITIONS": c.get("PURPOSEOFCREDIT") or "Standart şərtlərlə"
            })]
        if key == "SQL_NOTES":
            cid = str(b["creditid"])
            return C.setdefault("notes", {}).get(cid, [
                {"ROWID": f"AANT{cid}_1", "ID": 1, "CREDITID": int(cid), "NOTEDATE": _dt("2026-02-01"),
                 "USERNAME": "ADMIN", "NOTE": "Müştəri ilə əlaqə saxlanıldı, ödəniş vaxtında ediləcək."}
            ])
        if key == "SQL_FOLDER_PLACE":
            cid = str(b["creditid"])
            return C.setdefault("folder_place", {}).get(cid, [
                {"ROWID": f"AAFP{cid}_1", "ID": 1, "CREDITID": int(cid), "FOLDER_NO": f"D-{cid}",
                 "LOCATION": "Kredit departamenti arxivi", "STAGE": "Normal", "COURT_NAME": "",
                 "EXEC_OFFICER": "", "SEND_DATE": _dt("2026-01-15"), "RECEIVE_DATE": _dt("2026-01-16"), "BONUS_AMT": Decimal("0.00")}
            ])
        if key == "SQL_ADM_PLUGINS":
            return [{"ROWID": f"AAPL{i}", "ID": v, "PLUGINNAME": k.split("/")[0], "PARAM": k.split("/")[1], "DESCRIPTION": k}
                    for i, (k, v) in enumerate(C["plugins"].items(), 1)]
        if key == "SQL_ADM_USERS":
            return [{"ROWID": f"AAUS{i}", "USERID": i, "USERNAME": u, "GROUPNAME": "Kredit Administratorları",
                     "ADDITIONS": ",".join(C["adm_additions"].get(u, []))}
                    for i, u in enumerate(C["user_plugins"].keys(), 1)]
        if key == "SQL_ADM_GROUPS":
            return [{"ROWID": "AAGR1", "ID": 1, "NAME": "Kredit Administratorları", "DESCRIPTION": "Tam səlahiyyətli qrup"},
                    {"ROWID": "AAGR2", "ID": 2, "NAME": "Kredit Mütəxəssisləri", "DESCRIPTION": "Əməliyyat qrupu"}]
        if key == "SQL_SETUP_ACCOUNTGROUPS":
            return [{"ROWID": f"AAAG{i}", "ID": i, "INAME": gname, "DESCRIPTION": f"{gname} hesab qrupu"}
                    for i, gname in enumerate(["LoanAccs", "ClientAccs", "InterestAccs", "PReserveAccs", "DueLoanAccs", "OutInterestAccs", "ObligationAccs"], 1)]
        if key == "SQL_SETUP_IETUNING":
            return [{"ROWID": "AAIE1", "ID": 1, "OPERATION": "TRANCHE", "DEBIT_GROUP": "LoanAccs", "CREDIT_GROUP": "ClientAccs", "DESCRIPTION": "Kreditin verilməsi müxabirləşməsi"},
                    {"ROWID": "AAIE2", "ID": 2, "OPERATION": "PAYMENT_MAIN", "DEBIT_GROUP": "ClientAccs", "CREDIT_GROUP": "LoanAccs", "DESCRIPTION": "Əsas borcun ödənilməsi"},
                    {"ROWID": "AAIE3", "ID": 3, "OPERATION": "PAYMENT_INT", "DEBIT_GROUP": "ClientAccs", "CREDIT_GROUP": "InterestAccs", "DESCRIPTION": "Faiz borcunun ödənilməsi"}]
        if key == "SQL_SETUP_TRDESCRIPTIONS":
            return [{"ROWID": "AATD1", "ID": 1, "CODE": "TR_GRANT", "TEXT": "Müqavilə üzrə kreditin verilməsi"},
                    {"ROWID": "AATD2", "ID": 2, "CODE": "TR_PAY_MAIN", "TEXT": "Kredit üzrə əsas borcun ödənişi"},
                    {"ROWID": "AATD3", "ID": 3, "CODE": "TR_PAY_INT", "TEXT": "Kredit üzrə hesablanmış faizin ödənişi"}]
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
        if key == "CM_CREDIT.ADD_CM_CUSTOMER":
            custs = C["lookups"]["customers"]
            nid = max(x["ID"] for x in custs) + 1
            custs.append({"ID": nid, "NAME": n.get("NAME") or f"Müştəri {nid}"})
            return nid
        if key == "CM_CREDIT.ADDCREDITACCOUNTS":
            cid = int(n.get("p_custid") or 1)
            val = int(n.get("p_currency") or 0)
            cname = next((x["NAME"] for x in C["lookups"]["customers"] if x["ID"] == cid), f"Cust {cid}")
            created = {}
            for grp, bal, out_flag in [
                ("ClientAccs", "4101", False), ("LoanAccs", "2020", False), ("DueLoanAccs", "2050", False),
                ("InterestAccs", "2501", False), ("PReserveAccs", "2090", False),
                ("ObligationAccs", "9920", True), ("OutInterestAccs", "9950", True),
            ]:
                aid = max(a["ID"] for a in C["accounts"]) + 1
                accno = f"AZ00SMRT{bal}{val:03d}{cid:05d}{aid:04d}"[:24]
                C["accounts"].append({"ID": aid, "CUSTID": cid, "ACCNO": accno, "CLIENTNAME": cname,
                                      "VAL_ACC": val if grp != "PReserveAccs" else 0, "GROUP": grp, "OUT": out_flag})
                created[grp] = aid
            return created
        if key == "CM_TRANCHE.TRANCHE_ADD":
            cid = str(n["p_creditid"])
            lst = C.setdefault("tranches", {}).setdefault(cid, [])
            tid = max([x["ID"] for x in lst] + [0]) + 1
            amt = Decimal(str(n.get("p_amount") or 0))
            lst.append({"ROWID": f"AATR{cid}_{tid}", "ID": tid, "CREDITID": int(cid), "TRANCHEDATE": _dt(n.get("p_date")),
                        "AMOUNT": amt, "PURPOSE": n.get("p_purpose"), "IS_CASH": n.get("p_cash", 0), "STATUS": 0})
            return tid
        if key == "CM_PAYMENT.GET_PLANPAYMENT":
            c = self._credit(args[0])
            return {
                "main_plan": float(Decimal(str(c.get("REST") or 0)) * Decimal("0.1")),
                "interest_plan": float(c.get("INTERESTREST") or 0),
                "duemain_plan": float(c.get("DUEREST") or 0),
                "dueinterest_plan": float(c.get("DUEINTERESTREST") or 0),
                "penalty_plan": float(c.get("PENALTYREST") or 0),
            }
        if key == "CM_PAYMENT.PAYMENTADD":
            cid = str(n["p_creditid"])
            lst = C.setdefault("payments", {}).setdefault(cid, [])
            pid = max([x["ID"] for x in lst] + [0]) + 1
            lst.append({
                "ROWID": f"AAPY{cid}_{pid}", "ID": pid, "CREDITID": int(cid), "PAYDATE": _dt(n.get("p_date")),
                "TOTAL": Decimal(str(n.get("p_total") or 0)),
                "MAIN_AMOUNT": Decimal(str(n.get("p_main") or 0)),
                "DUEMAIN_AMOUNT": Decimal(str(n.get("p_duemain") or 0)),
                "INTEREST_AMOUNT": Decimal(str(n.get("p_interest") or 0)),
                "DUEINTEREST_AMOUNT": Decimal(str(n.get("p_dueinterest") or 0)),
                "PENALTY_AMOUNT": Decimal(str(n.get("p_penalty") or 0)),
                "STATUS": 0, "NOTES": n.get("p_notes") or "Kredit ödənişi",
            })
            return pid
        if key == "CM_PROLONGATION.PROLONGATION_ADD":
            cid = str(n["p_creditid"])
            lst = C.setdefault("prolongations", {}).setdefault(cid, [])
            pid = max([x["ID"] for x in lst] + [0]) + 1
            c = self._credit(int(cid))
            old_due = c.get("DUEDATELASTCONTRACT") or c.get("DUEDATEFIRSTCONTRACT")
            new_due = n.get("p_newduedate")
            c["DUEDATELASTCONTRACT"] = new_due.date().isoformat() if isinstance(new_due, datetime.datetime) else str(new_due)[:10]
            lst.append({
                "ROWID": f"AAPR{cid}_{pid}", "ID": pid, "CREDITID": int(cid),
                "PROLONGDATE": _dt(n.get("p_date")), "OLDDUEDATE": _dt(old_due), "NEWDUEDATE": _dt(new_due),
                "NEWRATE": Decimal(str(n.get("p_rate") or c.get("ANNUALYINTERESTRATE") or 0)),
                "AMOUNT": Decimal(str(n.get("p_amount") or c.get("REST") or 0)),
                "NOTES": n.get("p_notes") or "Müddətin uzadılması",
            })
            return pid
        if key == "CM_EXPIRE.EXPIRE_ADD":
            cid = str(n["p_creditid"])
            lst = C.setdefault("expires", {}).setdefault(cid, [])
            eid = max([x["ID"] for x in lst] + [0]) + 1
            lst.append({
                "ROWID": f"AAEX{cid}_{eid}", "ID": eid, "CREDITID": int(cid), "EXPIREDATE": _dt(n.get("p_date")),
                "MAIN_AMOUNT": Decimal(str(n.get("p_main") or 0)),
                "INTEREST_AMOUNT": Decimal(str(n.get("p_interest") or 0)),
                "STATUS": 0, "NOTES": n.get("p_notes") or "Vaxtı keçmişə köçürmə",
            })
            return eid
        return NotImplemented

    def _cr_bool(self, key, args, named):
        n = named or {}
        if key == "CM_ADMINISTRATION.PLUGINACCESS":
            if self.user.get("is_adm"):
                return True
            return int(args[0]) in self.cr["user_plugins"].get(self.username, [])
        if key == "CM_CREDIT.CHECKPERSON":
            return int(n.get("P_ID") or 0) in self.cr["check_person_true"]
        if key == "CM_TRANCHE.FINDACCFLAG":
            return False
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
        if key == "CM_TRANCHE.COMMITTRANCHE":
            cid = str(n["p_creditid"])
            c = self._credit(int(cid))
            for t in self.cr.setdefault("tranches", {}).get(cid, []):
                if t["ID"] == int(n["p_id"]):
                    t["STATUS"] = 1
                    c["REST"] = float(Decimal(str(c.get("REST") or 0)) + Decimal(str(t["AMOUNT"])))
                    c["INITIALAMOUNT"] = max(float(c.get("INITIALAMOUNT") or 0), c["REST"])
                    c["STATUS"] = 1
            return {}
        if key == "CM_TRANCHE.TRANCHE_DELETE":
            cid = str(n["p_creditid"])
            lst = self.cr.setdefault("tranches", {}).get(cid, [])
            lst[:] = [t for t in lst if t["ID"] != int(n["p_id"])]
            return {}
        if key == "CM_PAYMENT.COMMITPAYMENT":
            cid = str(n["p_creditid"])
            c = self._credit(int(cid))
            for p in self.cr.setdefault("payments", {}).get(cid, []):
                if p["ID"] == int(n["p_id"]):
                    p["STATUS"] = 1
                    c["REST"] = max(0.0, float(Decimal(str(c.get("REST") or 0)) - Decimal(str(p["MAIN_AMOUNT"]))))
                    c["DUEREST"] = max(0.0, float(Decimal(str(c.get("DUEREST") or 0)) - Decimal(str(p["DUEMAIN_AMOUNT"]))))
                    c["INTERESTREST"] = max(0.0, float(Decimal(str(c.get("INTERESTREST") or 0)) - Decimal(str(p["INTEREST_AMOUNT"]))))
                    c["DUEINTERESTREST"] = max(0.0, float(Decimal(str(c.get("DUEINTERESTREST") or 0)) - Decimal(str(p["DUEINTEREST_AMOUNT"]))))
                    c["PENALTYREST"] = max(0.0, float(Decimal(str(c.get("PENALTYREST") or 0)) - Decimal(str(p["PENALTY_AMOUNT"]))))
            return {}
        if key == "CM_PAYMENT.PAYMENTDEL":
            cid = str(n["p_creditid"])
            lst = self.cr.setdefault("payments", {}).get(cid, [])
            lst[:] = [p for p in lst if p["ID"] != int(n["p_id"])]
            return {}
        if key == "CM_PROLONGATION.DELLASTPROLONGATION":
            cid = str(n["p_creditid"])
            lst = self.cr.setdefault("prolongations", {}).get(cid, [])
            if lst:
                lst.pop()
            return {}
        if key == "CM_EXPIRE.COMMITEXPIRE":
            cid = str(n["p_creditid"])
            c = self._credit(int(cid))
            for e in self.cr.setdefault("expires", {}).get(cid, []):
                if e["ID"] == int(n["p_id"]):
                    e["STATUS"] = 1
                    m_amt = float(e["MAIN_AMOUNT"])
                    i_amt = float(e["INTEREST_AMOUNT"])
                    c["REST"] = max(0.0, float(c.get("REST") or 0) - m_amt)
                    c["DUEREST"] = float(c.get("DUEREST") or 0) + m_amt
                    c["INTERESTREST"] = max(0.0, float(c.get("INTERESTREST") or 0) - i_amt)
                    c["DUEINTERESTREST"] = float(c.get("DUEINTERESTREST") or 0) + i_amt
            return {}
        if key == "CM_EXPIRE.EXPIRE_DELETE":
            cid = str(n["p_creditid"])
            lst = self.cr.setdefault("expires", {}).get(cid, [])
            lst[:] = [e for e in lst if e["ID"] != int(n["p_id"])]
            return {}
        if key in ("CM_ACTIVATION.ACTIVATECREDIT", "CM_ACTIVATION.COMMITACTIVATION"):
            c = self._credit(int(n["p_creditid"]))
            c["STATUS"] = 1
            return {}
        if key in ("CM_CALCULATOR.CALCPERCENTS", "CM_CALCULATOR.ACCEPTCALCEDPERCENTS", "CM_CALCULATOR.CANCELCALCULATION", "CM_CALCULATOR.STOPCREDITINTEREST"):
            if key == "CM_CALCULATOR.STOPCREDITINTEREST" and n.get("p_creditid"):
                c = self._credit(int(n["p_creditid"]))
                c["KR_STATUS"] = 1
                c["STOPCALCDATE"] = _dt(n.get("p_date")).date().isoformat()
            return {}
        if key == "CM_CREDIT.UPDATECURRSTATE":
            cid = int(n["p_creditid"])
            c = self._credit(cid)
            for k, pk in [("REST", "p_rest"), ("INTERESTREST", "p_interestrest"), ("DUEREST", "p_duerest"),
                          ("DUEINTERESTREST", "p_dueinterestrest"), ("PENALTYREST", "p_penaltyrest"),
                          ("PLEDGEPRICE", "p_pledgeprice"), ("OBLIGATION", "p_obligation")]:
                if pk in n:
                    c[k] = float(n[pk])
            aud = self.cr.setdefault("history_audit", {}).setdefault(str(cid), [])
            aud.insert(0, {"CREDITID": cid, "OPERDATE": datetime.datetime.now(), "USERNAME": self.username, "REASON": n.get("p_reason")})
            return {}
        if key == "CM_CREDIT.SAVEGUARANTEECARD":
            cid = str(n["p_creditid"])
            if n.get("p_kind") == "guarantor":
                lst = self.cr.setdefault("guarantor_cards", {}).setdefault(cid, [])
                card_id = int(n.get("cardid") or (max([x["CARDID"] for x in lst] + [0]) + 1))
                rec = next((x for x in lst if x["CARDID"] == card_id), None)
                payload = {"ROWID": f"AAGZ{cid}_{card_id}", "CREDITID": int(cid), "CARDID": card_id,
                           "GUARANTORID": n.get("guarantorid", "101"), "GUARANTORNAME": n.get("guarantorname", ""),
                           "GUARANTORSALARY": n.get("guarantorsalary", "0"), "PINCODE": n.get("pincode", ""),
                           "CUNTRYCODE": n.get("cuntrycode", "AZE"), "CUNTRY": n.get("cuntry", "Azərbaycan"),
                           "CITY": n.get("city", "Bakı"), "DATEOFBIRTH": _dt(n.get("dateofbirth") or "1985-01-01")}
                if rec:
                    rec.update(payload)
                else:
                    lst.append(payload)
            else:
                lst = self.cr.setdefault("guarantee_cards", {}).setdefault(cid, [])
                card_id = int(n.get("cardid") or (max([x["CARDID"] for x in lst] + [0]) + 1))
                rec = next((x for x in lst if x["CARDID"] == card_id), None)
                payload = {"ROWID": f"AAGC{cid}_{card_id}", "CREDITID": int(cid), "CARDID": card_id,
                           "PLEDGEID": int(n.get("pledgeid") or 1), "PLEDGEPRICE": Decimal(str(n.get("pledgeprice") or 0)),
                           "CURRENCY": int(n.get("currency") or 0), "ANYINFOTODISTING": n.get("anyinfotodisting", ""),
                           "REGISTRYNO": n.get("registryno", ""), "REGISTRYDATE": _dt(n.get("registrydate") or "2026-01-10"),
                           "REGISTRYAGENCY": n.get("registryagency", ""), "OWNERNAME": n.get("ownername", "")}
                if rec:
                    rec.update(payload)
                else:
                    lst.append(payload)
            return {}
        if key == "CM_CREDIT.DELETEGUARANTEECARD":
            cid = str(n["p_creditid"])
            k = "guarantor_cards" if n.get("p_kind") == "guarantor" else "guarantee_cards"
            lst = self.cr.setdefault(k, {}).get(cid, [])
            lst[:] = [x for x in lst if x["CARDID"] != int(n["p_cardid"])]
            return {}
        if key == "CM_CREDIT.SAVEADVANCEDINFO":
            c = self._credit(int(n["p_creditid"]))
            for k in ("ADDRESS", "PHONENUMBER", "PINCODE", "SALARY", "FIRSTOWNERNAME", "SECONDOWNERNAME", "THIRDOWNERNAME", "GUARANTORNAME"):
                if k.lower() in n:
                    c[k] = n[k.lower()]
            return {}
        if key == "CM_CREDIT.SAVEBUSINESSPLANITEM":
            cid = str(n["p_creditid"])
            tab = n.get("tab") or "business_plan"
            lst = self.cr.setdefault(tab, {}).setdefault(cid, [])
            nid = max([x["ID"] for x in lst] + [0]) + 1
            lst.append({"ROWID": f"AABP{cid}_{nid}", "ID": nid, "CREDITID": int(cid),
                        "STAGE": n.get("stage") or "Yeni mərhələ", "PLANDATE": _dt(n.get("plandate") or "2026-10-25"),
                        "EXPECTED_INCOME": Decimal(str(n.get("expected_income") or 0)),
                        "EXPECTED_EXPENSE": Decimal(str(n.get("expected_expense") or 0)),
                        "NOTES": n.get("notes") or ""})
            return {}
        if key == "CM_CREDIT.UP_PORT_PROTOKOL":
            cid = str(n["p_creditid"])
            pr = self.cr.setdefault("protokol", {}).setdefault(cid, {"CREDITID": int(cid)})
            for k in ("protokol_no", "chairman", "members", "decision", "conditions"):
                if k in n:
                    pr[k.upper()] = n[k]
            if "protokol_date" in n:
                pr["PROTOKOL_DATE"] = _dt(n["protokol_date"])
            return {}
        if key == "CM_CREDIT.ADDCM_NOTES":
            cid = str(n["p_creditid"])
            lst = self.cr.setdefault("notes", {}).setdefault(cid, [])
            nid = max([x["ID"] for x in lst] + [0]) + 1
            lst.insert(0, {"ROWID": f"AANT{cid}_{nid}", "ID": nid, "CREDITID": int(cid),
                           "NOTEDATE": _dt(n.get("p_date") or "2026-10-25"), "USERNAME": n.get("p_user") or "ADMIN",
                           "NOTE": n.get("p_note") or ""})
            return {}
        if key == "CM_CREDIT.DELETE_NOTES":
            cid = str(n["p_creditid"])
            lst = self.cr.setdefault("notes", {}).get(cid, [])
            lst[:] = [x for x in lst if x["ID"] != int(n["p_id"])]
            return {}
        if key == "CM_CREDIT.SAVEFOLDERPLACE":
            cid = str(n["p_creditid"])
            lst = self.cr.setdefault("folder_place", {}).setdefault(cid, [])
            nid = max([x["ID"] for x in lst] + [0]) + 1
            lst.insert(0, {"ROWID": f"AAFP{cid}_{nid}", "ID": nid, "CREDITID": int(cid),
                           "FOLDER_NO": n.get("folder_no") or f"D-{cid}",
                           "LOCATION": n.get("location") or "Kredit departamenti",
                           "STAGE": n.get("stage") or "Normal",
                           "COURT_NAME": n.get("court_name") or "",
                           "EXEC_OFFICER": n.get("exec_officer") or "",
                           "SEND_DATE": _dt(n.get("send_date") or "2026-10-25"),
                           "RECEIVE_DATE": _dt(n.get("receive_date") or "2026-10-25"),
                           "BONUS_AMT": Decimal(str(n.get("bonus_amt") or 0))})
            return {}
        if key == "CM_SCHEDULE.SAVETRANCHESCHEDULE":
            cid = str(n["p_creditid"])
            lst = self.cr.setdefault("tranche_schedule", {}).setdefault(cid, [])
            nid = max([x["ID"] for x in lst] + [0]) + 1
            lst.append({"ROWID": f"AATS{cid}_{nid}", "ID": nid, "CREDITID": int(cid),
                        "TRANCHEDATE": _dt(n.get("tranchedate") or "2026-10-25"),
                        "AMOUNT": Decimal(str(n.get("amount") or 0)),
                        "NOTES": n.get("notes") or "Tranş qrafiki"})
            return {}
        if key == "CM_SCHEDULE.SHIFTSCHEDULEDATES":
            cid = int(n["p_creditid"])
            months = int(n.get("p_months") or 0)
            days = int(n.get("p_days") or 0)
            for r in self._sched(cid):
                d = _d(r["PAYMENTDATE"]) + datetime.timedelta(days=months * 30 + days)
                r["PAYMENTDATE"] = d.isoformat()
            return {}
        if key in ("CM_ADMINISTRATION.SAVEADMITEM", "CM_ADMINISTRATION.SAVESETUPITEM"):
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
