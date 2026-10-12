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
                      "companies": rd("companies.json"), "sys": rd("system.json")}
        return _state


def reset():
    """Test helper: reload fixtures (drops changed passwords)."""
    global _state
    _state = None


def _unwrap(p: str) -> str:
    return p[3:-3] if p.startswith("KLs") and p.endswith("#1$") else p


class MockConnection:
    def __init__(self, username: str):
        self.username = username.upper()
        self.st = _load()
        self.user = self.st["users"][self.username]
        self.session_id = next(_sid)
        self.context: dict = {}
        self.ini_open = False

    # --- packages ---------------------------------------------------------
    def call_func(self, pkg, name, args, rettype=str):
        key = f"{pkg}.{name}".upper()
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

    def call_bool(self, pkg, name, args):
        key = f"{pkg}.{name}".upper()
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

    def call_proc(self, pkg, name, args):
        key = f"{pkg}.{name}".upper()
        if key == "SBLOGIN.CHANGEUSERPSW":
            new_wrapped, _plain = args
            self.user["password"] = _unwrap(new_wrapped)
            return
        raise DBError(f"ORA-06550: mock: {key} not emulated")

    # --- SQL ---------------------------------------------------------------
    def query(self, sql, binds=None):
        s = " ".join(sql.lower().split())
        b = binds or {}
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

    def cursor_block(self, sql, cursor_bind, binds=None):
        raise DBError("ORA-06550: mock: cursor block not emulated")

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
