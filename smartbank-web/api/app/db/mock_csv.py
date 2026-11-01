"""DB_MODE=mock emulation for the customer service module (Packages/PCustService_irshad). Fixture: api/fixtures/csv.json.

SQL is recognised by comparing the whitespace-normalised text with the verbatim data sets in app/csv_sql.py
(DM / MAIN); the SQL[n] variants written by custservice.py are recognised by their fixed parts. Lookup data
sets read the table named in their FROM clause; "from dual" unions are evaluated from the SQL text itself.
PG_PCustService procedures change the fixture state in memory (reset() reloads it).
"""
from __future__ import annotations
import copy
import datetime
import json
import os
import re

from .base import DBError

_S: dict | None = None


def load(fixtures_dir: str) -> dict:
    global _S
    if _S is None:
        _S = json.load(open(os.path.join(fixtures_dir, "csv.json"), encoding="utf-8"))
    return _S


def reset():
    global _S, _NORM
    _S = None
    _NORM = None


def _n(s: str) -> str:
    return " ".join(s.lower().split())


_NORM: dict | None = None


def _norm_map() -> dict:
    """normalised SQL -> data set name (MAIN first, as custservice._lookup_sql)."""
    global _NORM
    if _NORM is None:
        from .. import csv_sql as Q
        m = {}
        for k, v in list(Q.DM.items()) + list(Q.MAIN.items()):
            if v:
                m.setdefault(_n(v), k)
        for k in ("EstateTypeData", "Ods_WORK_VID_SOB"):           # XFRadioGroupCust_typeClick SQL[4]
            for t in (0, 1):
                m[_n(Q.set_line(Q.DM[k], 4, f"and cust_type in(-1,{t})"))] = k
        for k in ("PEP_BANKINFO",):
            m[_n(getattr(Q, k))] = k
        _NORM = m
    return _NORM


def _dt(v):
    if isinstance(v, str) and re.fullmatch(r"\d{4}-\d\d-\d\dT[\d:]+", v):
        return datetime.datetime.fromisoformat(v)
    return v


def _out(r: dict) -> dict:
    return {k: _dt(v) for k, v in r.items()}


def _like(val, pat) -> bool:
    rx = "^" + re.escape(str(pat).upper()).replace("%", ".*").replace("_", ".") + "$"
    return re.match(rx, str("0" if val is None else val).upper()) is not None


def _dual(sql: str) -> list[dict]:
    out = []
    for part in re.split(r"\bunion(?:\s+all)?\b", re.sub(r"/\*.*?\*/", "", sql, flags=re.S), flags=re.I):
        cols = re.findall(r"('[^']*'|-?\d+)\s+as\s+(\w+)", part, re.I)
        if cols:
            out.append({c.upper(): (v.strip("'") if v.startswith("'") else int(v)) for v, c in cols})
    return out


def _table(sql: str) -> str | None:
    s = re.sub(r"--.*", "", re.sub(r"/\*.*?\*/", "", sql, flags=re.S))
    m = re.search(r"\bfrom\s+(?:\w+\.)?(\w+)", s, re.I)
    return m.group(1).lower() if m else None


class CsvMixin:
    @property
    def csv(self):
        from ..config import settings
        return load(settings.mock_fixtures)

    def pep_response(self, url: str) -> str:
        """bankinfo.tax_regcode = mock://pep/check? ; a hit returns several lines (PEPUnit counts Memo lines > 2)."""
        from urllib.parse import parse_qs, urlsplit
        q = parse_qs(urlsplit(url).query)
        nm = (q.get("surname", [""])[0] + " " + q.get("name", [""])[0]).lower()
        if any(h.lower() in nm for h in self.csv.get("pep_hits", [])):
            return "{\n \"found\": true,\n \"list\": \"PEP\"\n}"
        return "{\"found\": false}"

    # ------------------------------------------------------------------ functions
    def _csv_func(self, key, args, named):
        S = self.csv
        if key == "PG_PCUSTSERVICE.GET_MODLE_COMP":
            return 1 if args and args[0] == "PCustService" else NotImplemented
        if key == "PG_PCUSTSERVICE.GET_MESSAJ":
            req = {k.lower(): v for k, v in S["required"].items()}
            return req.get(str(args[1]).lower(), 0)
        if key == "PG_PCUSTSERVICE.GET_ADD_CUST_YOXLAMA":
            kind, val = args[0], str(args[1] or "")
            col = {"p_inn": ("INN",), "p_passpin": ("PASSPIN",), "p_passer_panum": ("PASSPORT", "PASSP_NUMBER")}.get(kind)
            if not col:
                return -1
            for c in S["customers"]:
                if c.get("CLOSE_DAT"):
                    continue
                v = "".join(str(c.get(x) or "") for x in col)
                if v and v.upper() == val.upper():
                    return c["ID"]
            return -1
        if key == "MSG_CONTROL.GETMESSAGE":
            return S["messages"].get(str(args[0]), str(args[1]))
        if key == "CONVERTPACK.CONVERT_INT":
            return args[0]
        return NotImplemented

    # ------------------------------------------------------------------ procedures
    def _csv_proc(self, key, args, named):
        S = self.csv
        if not key.startswith("PG_PCUSTSERVICE."):          # SB_ACA.CheckObjectAccess: mock_cs (generic)
            return NotImplemented
        name = key.split(".", 1)[1]
        act = {"ADD_CUSTOMERS_PROSESS": "insert", "EDIT_CUSTOMERS_PROSESS": "update", "CLOSE_CUSTOMERS_PROSESS": "update",
               "ADD_CUST_RELATIONS": "insert", "ADD_BANK_STETMENT": "insert", "ADD_CUST_GROP": "insert",
               "DEL_CUSTOMERS_RELATIONS": "delete", "DEL_CUSTOMERS_GROP": "delete", "DEL_CUSTOMERS_PROSESS": "delete",
               "DEL_CUSTOMERS_BANK_STETMENT": "delete"}.get(name)
        if act is None:
            return NotImplemented
        self._check_access("PCUSTSERVICE", act)
        if name in ("ADD_CUSTOMERS_PROSESS", "EDIT_CUSTOMERS_PROSESS"):
            from .. import csv_sql as Q
            names = Q.ADD_PARAMS if name.startswith("ADD") else Q.EDIT_PARAMS
            p = {}
            for n, v in zip(names, args):
                p.setdefault(n, v)
            self._csv_save(p, name.startswith("EDIT"))
        elif name == "CLOSE_CUSTOMERS_PROSESS":
            c = self._csv_cust(args[0])
            c["CLOSE_DAT"] = S["tables"]["sysdat"][0]["TEK_DAT"]
        elif name == "DEL_CUSTOMERS_PROSESS":
            S["customers"] = [c for c in S["customers"] if c["ID"] != int(args[0])]
        elif name == "ADD_CUST_RELATIONS":
            a, b = self._csv_cust(args[0]), self._csv_cust(args[1])
            S["relations"].append({"CUSTID": a["ID"], "CUSTID2": b["ID"], "PRINAD": None, "CUST_NAME": a.get("CUST_NAME"),
                                   "CUST_NAME2": b.get("CUST_NAME")})
        elif name == "DEL_CUSTOMERS_RELATIONS":
            S["relations"] = [r for r in S["relations"] if r["CUSTID2"] != int(args[0])]
        elif name == "ADD_BANK_STETMENT":
            S["bank_stetment"].append({"CUSTID": int(args[0]), "CUSTID1": int(args[1])})
        elif name == "DEL_CUSTOMERS_BANK_STETMENT":
            S["bank_stetment"] = [r for r in S["bank_stetment"] if not (r["CUSTID"] == int(args[0]) and r["CUSTID1"] == int(args[1]))]
        elif name == "ADD_CUST_GROP":
            S["group_info"].append({"CUSTID1": int(args[0]), "CUSTID2": int(args[1])})
        elif name == "DEL_CUSTOMERS_GROP":
            S["group_info"] = [r for r in S["group_info"] if not (r["CUSTID1"] == int(args[0]) and r["CUSTID2"] == int(args[1]))]
        return None

    def _csv_cust(self, cid):
        c = next((c for c in self.csv["customers"] if c["ID"] == int(cid)), None)
        if c is None:
            raise DBError("ORA-01403: no data found", 1403)
        return c

    def _csv_save(self, p: dict, edit: bool):
        S = self.csv
        if edit:
            c = self._csv_cust(p["c_id"])
        else:
            S["next_id"] += 1
            c = {"ID": S["next_id"], "IDCUST": S["next_id"], "CLOSE_DAT": None, "USNAM": self.username,
                 "OPENDATE": (p.get("date") or datetime.datetime(2026, 10, 30)).isoformat(), "FILIAL": self.user.get("filial_id")}
            S["customers"].append(c)
        iso = lambda v: v.isoformat() if isinstance(v, (datetime.date, datetime.datetime)) else v  # noqa: E731
        m = {"c_name": "CUST_NAME", "c_short_name": "SHORT_NAME", "c_inn": "INN", "c_cust_type": "CUST_TYPE",
             "c_cust_phys": "CUST_PHYS", "c_cust_fs": "CUST_FS", "c_nerezident": "NEREZIDENT", "c_category": "CATEGORY",
             "d_name": "FIRSTNAME", "d_soname": "PATRONYMIC", "d_lastname": "LASTNAME", "d_passer": "PASSPORT",
             "d_paspnum": "PASSP_NUMBER", "d_passPIN": "PASSPIN", "d_birthday": "BIRTHDATE", "d_sex": "SEX",
             "d_fam_status": "FAM_STATUS", "d_doc_type": "DOC_TYPE", "d_phone_m": "PHONE_MOB", "d_phone_h": "PHONE",
             "d_address": "ADRESS", "d_fakt_adress": "FAKT_ADRESS", "d_citizenship": "CITIZENSHIP", "c_risk_categ": "RISK_CATEG",
             "d_risk_categ": "CUST_RISK_CATEG", "c_riskdescid": "RISKDESCID", "c_samelydate": "SAMELYDATE",
             "c_incorporation_number": "INCORPORATION_NUMBER", "d_paspplace": "PASPPLACE", "d_paspdate": "PASPDATE",
             "d_passexpire": "PASSEXPIRE", "d_birthplace": "BIRTHPLACE", "d_birth_state": "BIRTH_STATE",
             "d_adrs_state": "ADRS_STATE", "d_city": "ADRS_CITY", "d_note": "NOTE"}
        for k, v in p.items():
            col = m.get(k) or k.split("_", 1)[-1].upper() if k not in ("date", "c_id") else None
            if col:
                c[col] = iso(v) if v not in ("",) else None
        for k in ("CUST_TYPE", "CUST_PHYS", "CUST_FS"):
            if c.get(k) not in (None, ""):
                c[k] = int(c[k])

    # ------------------------------------------------------------------ SQL
    def _csv_query(self, s: str, sql: str, b: dict):
        S = self.csv
        T = S["tables"]
        ds = _norm_map().get(s)
        cust = [c for c in S["customers"] if not c.get("CLOSE_DAT")]
        if ds is None:
            if "from view_customers_relations a where (a.custid = :b_id or a.custid2 = :b_id)" in s:
                i = int(b["b_id"])
                return [_out(r) for r in S["relations"] if r["CUSTID"] == i or r["CUSTID2"] == i]
            if s.startswith("select*from pcust_view where close_dat is null --order by :dd") and "idcust <>:b_self" in s:
                ids = {v for k, v in b.items() if k.startswith(("b1_", "b2_"))}
                return [_out(c) for c in cust if c["IDCUST"] in ids and c["IDCUST"] != b["b_self"]]
            if s.startswith("select id ,cust_name,lastname,firstname,patronymic from pcust_view"):
                rows = [c for c in cust if c["CUST_TYPE"] in (1, 2, 3, 4)]
                if "b_t" in b:
                    col = re.search(r"and (?:upper\()?(\w+)\)? like", s).group(1).upper()
                    rows = [c for c in rows if _like(c.get(col), b["b_t"])]
                return [_out({k: c.get(k) for k in ("ID", "CUST_NAME", "LASTNAME", "FIRSTNAME", "PATRONYMIC")})
                        for c in sorted(rows, key=lambda c: c["ID"])]
            if s.startswith("select p.*, case when cust_type=0 then cust_name"):
                return self._csv_search(s, b, cust)
            if "from dm_active_contracts cont" in s and "cont.customerid=:custid" in s:
                return [_out(r) for r in S["deposits"] if str(r["CUSTOMERID"]) == str(b.get("CUSTID"))]
            if s.startswith("select b.reference,b.dat,b.parentid,tim,p.name from sb_business_opers"):
                bd, ed = b.get("bdat"), b.get("edat")
                rows = [r for r in S["business_opers"] if bd <= datetime.datetime.fromisoformat(r["DAT"]) <= ed]
                if "b_id" in b:
                    rows = [r for r in rows if r.get("CUSTID") == b["b_id"]]
                return [_out(r) for r in rows]
            return NotImplemented
        if ds == "Ods_Customers_PhysFS_yoxlama":
            return [_out(c) for c in cust if c["ID"] == int(b["id_yoxlama"])]
        if ds == "ods_cust_group_info":
            return [_out({**r, "NAME": self._csv_name(r["CUSTID2"])}) for r in S["group_info"] if r["CUSTID1"] == int(b["v_custid"])]
        if ds == "ods_bank_stetment":
            return [_out({**r, "NAME": self._csv_name(r["CUSTID1"])}) for r in S["bank_stetment"] if r["CUSTID"] == int(b["v_custid"])]
        if ds == "ods_cust_notes":
            return [_out(r) for r in S["notes"] if r["STATUS"] == 1 and r["CUSTID"] == int(b["v_custid"])]
        if ds == "ODS_account_tipacc":
            return [_out(r) for r in S["accounts"] if r["KLI_ID"] == int(b["id"]) and re.search(r"[DC]", r.get("TIPACC") or "")]
        if ds == "ODS_BusProc":
            ct = b.get("custtype")
            return [_out(r) for r in S["busproc"] if ct is not None and str(ct) in str(r.get("CUST_TYPE") or "").split(",")]
        if ds == "DScustimage":
            return [_out(r) for r in S["images"] if r["ID"] == int(b["cust_id"])]
        if ds == "CreditDSet":
            return [_out(r) for r in S["credits"] if r["BOOROWERID"] == int(b["custid"])]
        if ds == "ods_months_sysdat":
            d = datetime.datetime.fromisoformat(T["sysdat"][0]["TEK_DAT"])
            m = d.month - 1 + int(b["v_months"])
            y, m = d.year + m // 12, m % 12 + 1
            import calendar
            return [{"DAT": d.replace(year=y, month=m, day=min(d.day, calendar.monthrange(y, m)[1]))}]
        if ds in ("ODS_SYSDATE",):
            return [_out(r) for r in T["sysdat"]]
        tbl = _table(sql)
        if tbl == "dual":
            return _dual(sql)
        if tbl not in T:
            return NotImplemented
        rows = [dict(r) for r in T[tbl]]
        if tbl == "cities":
            v = b.get("v_id", b.get("CID"))
            rows = [r for r in rows if str(r["COUNTRY_ID"]) == str(v if v is not None else 0)]
        elif tbl == "cust_risk_desc":
            rows = [r for r in rows if str(r["RISK_ID"]) == str(b.get("id"))]
        elif tbl == "doc_deps":
            rows = [r for r in rows if str(r["DOC_TYPE"]) == str(b.get("v_doctype"))]
        elif tbl == "vid_sob":
            m = re.search(r"cust_type in\(-1,(\d)\)", s)
            if m:
                rows = [r for r in rows if r["CUST_TYPE"] in (-1, int(m.group(1)))]
        elif tbl == "cust_compani":
            rows = [{**r, "NAME_DES": f"{r['NAME']}  \\  {r['DESCRIPTION']}"} for r in rows]
        elif tbl == "countries" and "phone_code is not null" in s:
            rows = [{"PHONE_CODE": r["PHONE_CODE"]} for r in rows if r.get("PHONE_CODE")]
        return [_out(r) for r in rows]

    def _csv_name(self, cid):
        c = next((c for c in self.csv["customers"] if c["ID"] == cid), {})
        return c.get("CUST_NAME")

    def _csv_search(self, s, b, cust):
        cols = {"b_id": ("ID", "eq"), "b_EditFirstName": ("FIRSTNAME", "like"), "b_EditPatronymic": ("PATRONYMIC", "like"),
                "b_EditLastName": ("LASTNAME", "like"), "b_EditFullName": ("CUST_NAME", "like"), "b_short": ("SHORT_NAME", "like"),
                "b_pin": ("PASSPIN", "eq"), "b_inn": ("INN", "eq"), "b_sex": ("SEX", "eq"), "b_fam": ("FAM_STATUS", "eq"),
                "b_doct": ("DOC_TYPE", "eq"), "b_passport": ("PASSPORT", "like"), "b_passp_number": ("PASSP_NUMBER", "like"),
                "b_CBoxDocPlace2": ("PASPPLACE", "like"), "b_CBoxBirthState": ("BIRTHPLACE", "like"),
                "b_CBoxBirthCity": ("BIRTH_STATE", "like"), "b_CBoxAddressState": ("ADRS_STATE", "like"),
                "b_CBoxAddressCity": ("ADRS_CITY", "like"), "b_EditAddress": ("ADRESS", "like"),
                "b_EditAddressFactical": ("FAKT_ADRESS", "like"), "b_EditPhoneCity": ("PHONE", "like")}
        rows = list(cust)
        for k, v in b.items():
            col, op = cols.get(k, (None, None))
            if col is None:
                continue
            rows = [r for r in rows if (_like(r.get(col), v) if op == "like" else str(r.get(col) if r.get(col) is not None else 0) == str(v))]
        for rx, col in ((r"and cust_type ?= ?(\d)", "CUST_TYPE"), (r"and cust_phys ?= ?(\d)", "CUST_PHYS"),
                        (r"and cust_fs ?= ?(\d)", "CUST_FS"), (r"and nerezident=(\d)", "NEREZIDENT")):
            m = re.search(rx, s)
            if m:
                rows = [r for r in rows if str(r.get(col)) == m.group(1)]
        m = re.search(r"order by (\w+)\s*$", s)
        key = (m.group(1).upper() if m else "ID")
        rows.sort(key=lambda r: (r.get(key) is None, str(r.get(key)) if key != "ID" else r["ID"]))
        out = []
        for r in rows:
            r = copy.deepcopy(r)
            r["PAPA_N"] = r.get("CUST_NAME") if r.get("CUST_TYPE") == 0 else f"{r.get('LASTNAME') or ''} {(r.get('FIRSTNAME') or '')[:1]}"
            r["VOEN"] = r.get("INN")
            out.append(_out(r))
        return out
