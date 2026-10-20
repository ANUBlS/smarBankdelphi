"""DB_MODE=mock: in-memory stand-in for the user's Oracle server, driven by JSON fixtures in api/fixtures.

It emulates ONLY the objects the pilot calls (same package/function names and SQL text as the Delphi
source), so the web app runs end-to-end without a database. Real behaviour always comes from Oracle.
"""
from __future__ import annotations
import datetime
import itertools
import json
import os
import re
import threading

from .base import DBError
from . import mock_azips_new
from .mock_azips_new import AzipsNewMixin
from . import mock_cs
from .mock_cs import CsMixin
from . import mock_cr
from .mock_cr import CrMixin
from . import mock_bal
from .mock_oct import OctMixin
from .mock_otp import OtpMixin
from .mock_ost import OstMixin
from . import mock_ost
from .mock_bal import BalMixin
from . import mock_out
from .mock_out import OutMixin
from . import mock_oacc
from .mock_oacc import OaccMixin
from .mock_oset import OsetMixin
from .mock_omem import OmemMixin
from .mock_orep import OrepMixin
from .mock_oexi import OexiMixin
from . import mock_azips
from .mock_azips import AzipsMixin, AzipsEditMixin
from .mock_azips_in import AzipsInMixin
from .mock_xohks import XohksMixin
from .mock_cards import CardsMixin
from . import mock_dep
from .mock_dep import DepMixin
from . import mock_cards
from . import mock_xohks
from ..config import settings

_lock = threading.Lock()
_state: dict | None = None
_sid = itertools.count(100001)


def _load():
    global _state
    with _lock:
        if _state is None:
            d = settings.mock_fixtures
            rd = lambda n: json.load(open(os.path.join(d, n), encoding="utf-8"))  # noqa: E731
            _state = {"users": rd("users.json"), "ini": rd("smartbank_ini.json"),
                      "companies": rd("companies.json"), "sys": rd("system.json"), "acc": rd("accounts.json")}
        return _state


def reset():
    """Test helper: reload fixtures (drops changed passwords)."""
    global _state
    _state = None
    mock_azips.reset()
    mock_xohks.reset()
    mock_cards.reset()
    mock_dep.reset()
    mock_azips_new.reset()
    mock_cs.reset()
    mock_cr.reset()
    mock_bal.reset()
    mock_out.reset()
    mock_ost._fix = None
    mock_oacc.reset()


def _unwrap(p: str) -> str:
    return p[3:-3] if p.startswith("KLs") and p.endswith("#1$") else p


class MockConnection(DepMixin, CardsMixin, XohksMixin, AzipsInMixin, AzipsNewMixin, AzipsMixin, AzipsEditMixin, OexiMixin, OrepMixin, OmemMixin, OsetMixin, OaccMixin, OstMixin, OtpMixin, OctMixin, OutMixin, BalMixin, CsMixin, CrMixin):
    def __init__(self, username: str):
        self.username = username.upper()
        self.st = _load()
        self.user = self.st["users"][self.username]
        self.session_id = next(_sid)
        self.context: dict = {}
        self.ini_open = False
        self.cs = mock_cs.load(settings.mock_fixtures)
        self.out = mock_out.load(settings.mock_fixtures)

    # --- packages ---------------------------------------------------------
    def call_func(self, pkg, name, args, rettype=str, named=None):
        key = f"{pkg}.{name}".upper()
        r = self._dep_func(key, named, args)      # DepositsManager_New plugins
        if r is NotImplemented:
            r = self._xs_func(key, args)
        if r is NotImplemented:
            r = self._azi_func(key, args)
        if r is NotImplemented:
            r = self._azn_func(key, args)
        if r is NotImplemented:
            r = self._az_func(key, args)
        if r is not NotImplemented:
            return r
        r = self._orep_func(key, named)
        if r is not NotImplemented:
            return r
        r = self._omem_func(key, args)
        if r is not NotImplemented:
            return r
        r = self._oacc_func(key, named)
        if r is not NotImplemented:
            return r
        r = self._ost_func(key, args)
        if r is not NotImplemented:
            return r
        r = self._out_func(key, args, named)
        if r is not NotImplemented:
            return r
        r = self._bal_func(key, args, named)
        if r is not NotImplemented:
            return r
        r = self._cs_func(key, args, named)
        if r is not NotImplemented:
            return r
        r = self._cr_func(key, args, named)
        if r is not NotImplemented:
            return r
        if key.startswith(("SBOP.ADD_ACCOUNT", "SB_ACA.GETUSERFILIALID")):
            return self._acc_func(key, named or {})
        if key == "SBLOGIN.GETSESSIONID":
            return self.session_id
        if key == "SBLOGIN.USERID":
            return self.user.get("user_id", 0)
        if key == "SBOP.GET_DATE":
            return datetime.datetime.fromisoformat(self.st["sys"]["tek_dat"])
        if key == "SBCONFIG.OPENFILE":
            if args[0] != settings.system_ini_name:
                raise DBError("ORA-20001: INI file not found")
            self.ini_open = True
            return 1
        if key == "SBCONFIG.READVALUE":
            if not self.ini_open:
                raise DBError("ORA-20002: INI file is not opened")
            section, ident, default = args
            return self.st["ini"].get(section, {}).get(ident, default)
        raise DBError(f"ORA-06550: mock: {key} not emulated")

    def call_bool(self, pkg, name, args, named=None):
        key = f"{pkg}.{name}".upper()
        r = self._dep_bool(key, named)            # DepositsManager_New (sbcm_stored_programs_new)
        if r is not NotImplemented:
            return r
        r = self._oacc_bool(key, named)
        if r is not NotImplemented:
            return r
        r = self._bal_bool(key, args, named)
        if r is not NotImplemented:
            return r
        r = self._cr_bool(key, args, named)
        if r is not NotImplemented:
            return r
        if key == "SBUTIL.FLAGEXSIST":
            # real: SBUTIL.FlagExsist(AccountType, FlagChar); emulated as "flag char present in the type string"
            return (named or {}).get("FlagChar", "?") in ((named or {}).get("AccountType") or "").split(",")
        if key == "SB_ACA.CHECKMODRIGHT":
            # real body: SQL_/PARTITION.nur/SCRIPTS/sb_aca.sql:348 (isadm -> true; modules lookup; SPLASH -> true)
            if self.user.get("is_adm"):
                return True
            clsid = args[0].upper()
            if clsid in [c.upper() for c in self.st["sys"].get("splash_modules", [])]:
                return True
            return clsid in [c.upper() for c in self.user.get("rights", [])]
        if key == "SB_ACA.ISADM":
            u = self.st["users"].get(str(args[0]).upper(), {})
            return bool(u.get("is_adm"))
        if key == "SB_ADM.VERIFY_PASSWORD":
            p = _unwrap(args[0])
            return len(p) >= 8 and bool(re.search(r"\d", p)) and bool(re.search(r"[A-Za-z]", p)) \
                and bool(re.search(r"[^A-Za-z0-9]", p))
        raise DBError(f"ORA-06550: mock: {key} not emulated")

    def call_proc(self, pkg, name, args, named=None, commit=True):
        key = f"{pkg}.{name}".upper() if pkg else name.upper()
        r = self._dep_proc(key, named, args)     # DepositsManager_New (sbcm_stored_programs_new)
        if r is NotImplemented:
            r = self._cards_proc(key, args)    # Cards (card_main)
        if r is NotImplemented:
            r = self._xs_proc(key, args)       # XÖHKS step 2 (XS_CONTROL)
        if r is NotImplemented:
            r = self._azi_proc(key, args)      # AZIPS part 4b-2
        if r is NotImplemented:
            r = self._azn_proc(key, args)      # AZIPS part 2b (Unitazips.pas)
        if r is NotImplemented:
            r = self._az_proc(key, args)
        if r is NotImplemented:
            r = self._aze_proc(key, args)
        if r is not NotImplemented:
            return r
        r = self._oexi_proc(key)
        if r is not NotImplemented:
            return r
        r = self._omem_proc(key, args)
        if r is not NotImplemented:
            return r
        r = self._oacc_proc(key, named)
        if r is not NotImplemented:
            return r
        r = self._oset_proc(key, named)
        if r is not NotImplemented:
            return r
        r = self._out_proc(key, args, named)
        if r is not NotImplemented:
            return r
        r = self._bal_proc(key, args, named)
        if r is not NotImplemented:
            return r
        r = self._cs_proc(key, args, named)
        if r is not NotImplemented:
            return r
        r = self._cr_proc(key, args, named)
        if r is not NotImplemented:
            return r
        if key in ("SBOP.UPD_ACCOUNT", "SBOP.CLOSE_ACCOUNT"):
            return self._acc_proc(key, named or {})
        if key == "SBLOGIN.CHANGEUSERPSW":
            new_wrapped, _plain = args
            self.user["password"] = _unwrap(new_wrapped)
            return
        raise DBError(f"ORA-06550: mock: {key} not emulated")

    # --- SQL ---------------------------------------------------------------
    def query(self, sql, binds=None):
        s = " ".join(sql.lower().split())
        b = binds or {}
        r = self._dep_query(sql, b)  # DepositsManager_New (exact verbatim SQL text only)
        if r is NotImplemented:
            r = self._xs_query(sql, b)  # Packages/LVPCSSManager_Turan (XÖHKS)
        if r is NotImplemented:
            r = self._azi_query(sql, b)  # AZIPS part 4b-2
        if r is NotImplemented:
            r = self._azn_query(sql, b)  # AZIPS part 2b (filereport.bpl Unitdatamod.dfm)
        if r is NotImplemented:
            r = self._az_query(sql, b)  # Packages/SWIFT_MANAGER_IBAN_NEW (AZIPS)
        if r is NotImplemented:
            r = self._aze_query(sql, b)
        if r is not NotImplemented:
            return r
        r = self._oexi_query(sql, b)  # Packages/OutExcelImport
        if r is not NotImplemented:
            return r
        r = self._orep_query(sql, b)  # Packages/out_repair
        if r is not NotImplemented:
            return r
        r = self._omem_query(sql, b)  # Packages/out_memorial
        if r is not NotImplemented:
            return r
        r = self._oset_query(sql, b)  # off-balance settings screens (mock_oset)
        if r is not NotImplemented:
            return r
        r = self._oacc_query(sql, b)  # Packages/Out_account (verbatim text match)
        if r is not NotImplemented:
            return r
        r = self._ost_query(sql, b)  # OUT_SB_STATEMENT generated SQL (matches on original text)
        if r is not None:
            return r
        r = self._out_query(sql, binds)  # OutMixin matches on original SQL text
        if r is not NotImplemented:
            return r
        r = self._otp_query(s, b)
        if r is not None:
            return r
        r = self._oct_query(s, b)
        if r is not None:
            return r
        r = self._bal_query(s, b)
        if r is not None:
            return r
        r = self._cs_query(s, b)
        if r is not None:
            return r
        r = self._cr_query(s, b)
        if r is not None:
            return r
        r = self._acc_query(s, b)
        if r is not None:
            return r
        r = self._cards_query(sql, b)  # Packages/Cards_New (DataMod_CARDS) - last, its short lookups overlap others
        if r is not NotImplemented:
            return r
        if "from sysdat" in s:
            sy = self.st["sys"]
            return [{"TEK_DAT": datetime.datetime.fromisoformat(sy["tek_dat"]),
                     "PRED_DAT": datetime.datetime.fromisoformat(sy["pred_dat"])}]
        if "from bankinfo" in s:
            return [{"KOD_FIL": self.st["sys"]["kod_fil"]}]
        if "from companies order by company_name" in s:
            return sorted(self.st["companies"], key=lambda c: c["COMPANY_NAME"])
        if "from companies where" in s:
            return [{"ID": c["ID"], "COMPANYID": self.context.get("user_company")}
                    for c in self.st["companies"] if c["COMPANY_NAME"] == b.get("compname")]
        if "from all_users where username = :u" in s:
            return [{"USERNAME": b["u"]}] if b.get("u") in self.st["users"] else []
        if "from sba_objinf" in s:
            return [{"FINGER3": self.user.get("finger3", 0)}]
        if "from dba_users" in s:
            return [{"EX": self.user.get("expiry_days")}]
        if "select get_app_header from dual" in s:
            return [{"GET_APP_HEADER": f"{self.username} ({self.user.get('full_name', '')})"}]
        if "from dual" in s:
            return [{"CONNECTION": "TRUE"}]
        raise DBError("ORA-00942: mock: query not emulated")

    def execute(self, sql, binds=None):
        if self._azi_execute(sql, binds or {}):
            return
        if self._aze_execute(sql, binds or {}):
            return
        if self._oexi_exec(sql, binds or {}):
            return
        if self._omem_execute(sql, binds or {}):
            return
        if self._oset_execute(sql, binds or {}):
            return
        if self._bal_execute(sql, binds or {}):
            return
        if self._cs_execute(sql, binds or {}):
            return
        if self._cr_execute(sql, binds or {}):
            return
        if self._cards_execute(sql, binds or {}):
            return
        m = re.fullmatch(r'ALTER USER "([A-Z][A-Z0-9_$#]*)" ACCOUNT UNLOCK', sql.strip())
        if m:
            if not self.user.get("is_adm"):
                raise DBError("ORA-01031: insufficient privileges", 1031)
            self.st["users"][m.group(1)]["locked"] = False
            return
        if "dbms_session.set_context('clientcontext','user_company'" in sql.lower().replace(" ", ""):
            self.context["user_company"] = (binds or {}).get("COMP_id")
            return
        raise DBError("ORA-06550: mock: block not emulated")

    def plsql(self, sql, binds=None, ret=None):
        r = self._dep_plsql(sql, binds or {})         # DepositsManager_New plugins
        if r is NotImplemented:
            r = self._cs_plsql(sql, binds or {})
        if r is NotImplemented:
            r = self._cr_plsql(sql, binds or {})
        if r is NotImplemented:
            raise DBError("ORA-06550: mock: block not emulated")
        return r

    def plsql_out(self, sql, binds=None):
        r = self._azi_plsql_out(sql, binds or {})
        if r is NotImplemented:
            r = self._omem_plsql_out(sql, binds or {})
        if r is NotImplemented:
            r = self._bal_plsql_out(sql, binds or {})
        if r is NotImplemented:
            raise DBError("ORA-06550: mock: block not emulated")
        return r

    def cursor_block(self, sql, cursor_bind, binds=None):
        r = self._oacc_cursor(sql, cursor_bind, binds or {})
        if r is not NotImplemented:
            return r
        r = self._bal_cursor(sql, cursor_bind, binds or {})
        if r is not NotImplemented:
            return r
        raise DBError("ORA-06550: mock: cursor block not emulated")

    def commit(self):
        self._dep_commit()
        self._cr_commit()
        self._xs_commit()

    def rollback(self):
        self._dep_rollback()
        self._cr_rollback()
        self._xs_rollback()

    # ------------------------------------------------------------------ accounts emulation
    def _check_access(self, module, action):
        # emulates SB_ACA.CheckObjectAccess raised inside SBOP packages (ORA-20280)
        if self.user.get("is_adm"):
            return
        if action not in self.user.get("object_access", {}).get(module, []):
            raise DBError(f"ORA-20280: Access is denied for {action.capitalize()}", 20280)

    def _acc_view(self, a):
        A = self.st["acc"]
        cur = next((c for c in A["avalute"] if c["VALUTE"] == a["VAL_ACC"]), {})
        d = lambda v: datetime.datetime.fromisoformat(v) if v else None  # noqa: E731
        return {"ACCID": a["ID"], "ACCNO": a["ACC_NO"], "ACCNAME": a["NAME"], "OPENDATE": d(a["OPEN_DAT"]),
                "CLOSEDATE": d(a["CLOSE_DAT"]), "CURRENCYID": a["VAL_ACC"], "SACC": a["BAL_CN1"], "SACC2": a["BAL_CN2"],
                "SACC3": a["BAL_CN3"], "SACC4": a["BAL_CN4"], "CUSTOMERID": a["KLI_ID"], "PAIRACC": a["PAIR_ACC"],
                "ACCLIMIT": a["LIMIT"], "REPORTSYMBOL": a["SIM_OTCET"], "ACCFLAGS": a["TIPACC"], "FILIALID": a["FILIAL"],
                "INSIDER": a["INSIDER"], "AMOUNT": a["OSTAT"], "LAMOUNT": a["POK_OSTAT"], "DEBITTURNOVER": a["OBR_D"],
                "CREDITTURNOVER": a["OBR_K"], "DEBITLTURNOVER": a["POK_OBR_D"], "CREDITLTURNOVER": a["POK_OBR_K"],
                "CURRENCYSNAME": cur.get("VAL_NAME"), "DAYSTARTAMOUNT": a["DSB_OSTAT"], "DAYSTARTLAMOUNT": a["DSB_POK"],
                "DELAYEDAMOUNT": a["DLB_OSTAT"], "DELAYEDLAMOUNT": a["DLB_POK"], "SID#": None, "ROWID": f"AAA{a['ID']}"}

    def _acc_query(self, s, b):
        A = self.st["acc"]
        d = lambda v: datetime.datetime.fromisoformat(v) if v else None  # noqa: E731
        page = lambda rows: rows[b["lo__"]:b["hi__"]] if "hi__" in b else rows  # noqa: E731
        if "from account acc, tenostat t, tempost dsb, lazyrest dlb, avalute currency" in s:
            self._check_access("Accounts", "select")
            rows = list(A["accounts"])
            if "acc.close_dat is null" in s:
                rows = [a for a in rows if not a["CLOSE_DAT"]]
            if "acc.close_dat is not null" in s:
                rows = [a for a in rows if a["CLOSE_DAT"]]
            for bind, col in (("bal_cn", "BAL_CN1"), ("customer_id", "KLI_ID"), ("currency_id", "VAL_ACC"),
                              ("filial_id", "FILIAL"), ("acc_id", "ID")):
                if bind in b:
                    rows = [a for a in rows if a[col] == b[bind]]
            if "flag_like" in b:
                ch = b["flag_like"].strip("%")
                rows = [a for a in rows if ch in (a["TIPACC"] or "")]
            if "order by acc.acc_no" in s:
                rows.sort(key=lambda a: a["ACC_NO"])
            elif "order by acc.name" in s:
                rows.sort(key=lambda a: a["NAME"])
            elif "order by acc.val_acc" in s:
                rows.sort(key=lambda a: a["VAL_ACC"])
            return page([self._acc_view(a) for a in rows])
        for n in (1, 2, 3, 4):
            if f"from bal_spr{n} order by bal_cn" in s:
                return sorted(A[f"bal_spr{n}"], key=lambda r: r["BAL_CN"])
        if "from customers where close_dat is null order by id" in s:
            return [c for c in A["customers"] if not c["CLOSE_DAT"]]
        if s == "select * from avalute":
            return A["avalute"]
        if s == "select * from report_symbol":
            return A["report_symbol"]
        if "from filial order by id" in s:
            return A["filial"]
        if "from account_flags" in s:
            return A["account_flags"]
        if "from account acc order by acc.acc_no" in s:
            rows = sorted(A["accounts"], key=lambda a: a["ACC_NO"])
            if "pair_id" in b:
                return [{"ACCID": a["ID"], "ACCNO": a["ACC_NO"]} for a in rows if a["ID"] == b["pair_id"]]
            rows = [{"ACCID": a["ID"], "ACCNO": a["ACC_NO"]} for a in rows if a["ACC_NO"].startswith(b.get("q", "%").rstrip("%"))]
            return page(rows)
        if "from archost arc where arc.acc_id = :accid" in s:
            rows = sorted([r for r in A["archost"] if r["ACC_ID"] == b["AccID"]], key=lambda r: r["DATDATE"], reverse=True)
            return [{"ARCHIVEDATE": d(r["DATDATE"]), "ACCID": r["ACC_ID"], "AMOUNT": abs(r["OSTAT"]), "LAMOUNT": abs(r["POK_OSTAT"]),
                     "DEBITTURNOVER": abs(r["OBR_D"]), "DEBITLTURNOVER": abs(r["POK_OBR_D"]),
                     "CREDITTURNOVER": abs(r["OBR_K"]), "CREDITLTURNOVER": abs(r["POK_OBR_K"])} for r in rows]
        if "from provarch p, account" in s:
            debit = "p.debt = :debitaccid" in s
            accid = b["DebitAccID"] if debit else b["CreditAccID"]
            accno = {a["ID"]: a["ACC_NO"] for a in A["accounts"]}
            rows = [p for p in A["provarch"] if (p["DEBT"] if debit else p["KREDIT"]) == accid
                    and b["StartDate"] <= d(p["DAT"]) <= b["EndDate"]]
            rows.sort(key=lambda p: p["DAT"])
            out = []
            for p in rows:
                r = {"ID": p["ID"], "OPERATIONDATE": d(p["DAT"]), "DEBITAMOUNT": p["AMMOUNT"], "CREDITAMOUNT": p["AMMOUNT_C"],
                     "LAMOUNT": p["LAMMOUNT"], "DESTINATION": p["NAME"]}
                if debit:
                    r.update(DEBITACCID=p["DEBT"], CREDITACCNO=accno.get(p["KREDIT"]))
                else:
                    r.update(CREDITACCID=p["KREDIT"], DEBITACCNO=accno.get(p["DEBT"]))
                out.append(r)
            return out
        return None

    def _acc_func(self, key, n):
        if key == "SB_ACA.GETUSERFILIALID":
            return self.user.get("filial_id", 0)
        self._check_access("Accounts", "insert")
        A = self.st["acc"]
        if any(a["ACC_NO"] == n["accno"] for a in A["accounts"]):
            raise DBError("ORA-00001: unique constraint (SB.ACCOUNT_ACC_NO_UK) violated", 1)
        new_id = max(a["ID"] for a in A["accounts"]) + 1
        A["accounts"].append(dict(ID=new_id, ACC_NO=n["accno"], NAME=n["NAME"], OPEN_DAT=n["open_dat"].date().isoformat(),
                                  CLOSE_DAT=None, VAL_ACC=n["currencyid"], BAL_CN1=n["balcn"], BAL_CN2=n["bal_cn2"],
                                  BAL_CN3=n["bal_cn3"], BAL_CN4=n["bal_cn4"], KLI_ID=n["customerid"], PAIR_ACC=n["pair_acc"],
                                  LIMIT=n["LIMIT"], SIM_OTCET=n["sim_otcet"], TIPACC=n["typeacc"], FILIAL=n["filial"],
                                  INSIDER="0", OSTAT=0, POK_OSTAT=0, OBR_D=0, OBR_K=0, POK_OBR_D=0, POK_OBR_K=0,
                                  DSB_OSTAT=0, DSB_POK=0, DLB_OSTAT=0, DLB_POK=0))
        return new_id

    def _acc_proc(self, key, n):
        A = self.st["acc"]
        if key == "SBOP.CLOSE_ACCOUNT":
            # emulates SQL_credit/sm_p.sql:7858 close_account
            self._check_access("Accounts", "delete")
            a = next(a for a in A["accounts"] if a["ID"] == n["AccID"])
            tr = sum(1 for t in A["lazy_transactions"] if n["AccID"] in (t["DEBT"], t["KREDIT"]))
            if a["OSTAT"] != 0 or a["POK_OSTAT"] != 0 or tr:
                raise DBError("ORA-20002: Account balance and localized balance must be zero before closing account. "
                              f"State dump: balance: {a['OSTAT']}; localized balance: {a['POK_OSTAT']}.", 20002)
            a["CLOSE_DAT"] = self.st["sys"]["tek_dat"][:10] if n["DoClose"] == 1 else None
            return
        self._check_access("Accounts", "update")
        a = next((a for a in A["accounts"] if a["ID"] == n["v_id"]), None)
        if not a:
            raise DBError("ORA-01403: no data found", 1403)
        a.update(ACC_NO=n["v_accno"], NAME=n["v_NAME"], OPEN_DAT=n["v_open_dat"].date().isoformat(), VAL_ACC=n["v_currencyid"],
                 BAL_CN1=n["v_balcn"], BAL_CN2=n["v_bal_cn2"], BAL_CN3=n["v_bal_cn3"], BAL_CN4=n["v_bal_cn4"],
                 KLI_ID=n["v_customerid"], PAIR_ACC=n["v_pair_acc"], LIMIT=n["v_LIMIT"], SIM_OTCET=n["v_sim_otcet"],
                 TIPACC=n["v_typeacc"], FILIAL=n["v_filial"])

    def ping(self):
        return self.query("select 'TRUE' as connection from dual")[0]["CONNECTION"] == "TRUE"

    def close(self):
        pass


class MockBackend:
    def connect(self, user, password, dsn, newpassword=None):
        st = _load()
        u = st["users"].get((user or "").upper())
        # The Delphi logon dialog sends 'KLs'+password+'#1$' as the Oracle password, so the mock stores the
        # typed password and compares against the wrapped form.
        if not u or password != "KLs" + u["password"] + "#1$":
            raise DBError("ORA-01017: invalid username/password; logon denied", 1017)
        if u.get("locked"):
            raise DBError("ORA-28000: The account is locked.", 28000)
        if u.get("expired"):
            if not newpassword:
                raise DBError("ORA-28001: the password has expired", 28001)
            u["password"] = _unwrap(newpassword)
            u["expired"] = False
        return MockConnection(user)
