"""Oracle parity for the login and the main form start-up (Packages/SBCommon50/UnitSBOraLogOn, SBOracleLogOn,
Packages/sboapi50/SBOInitPkg, Programs/SmartBank/sbMainForm_Unit, docs/oracle-parity.md section Login).

A recording fake backend/connection captures every Oracle call; the expected values are taken from the Delphi
sources, and the dataset SQL is re-read from the .dfm files (working tree, or `git show HEAD:` in a sparse checkout)."""
import datetime
import os
import subprocess
import sys

import pytest

from app import sb
from app.db import DBError, Out
from app.sessions import WebSession

sys.path.insert(0, os.path.dirname(__file__))
from test_accounts_oracle_parity import Rec  # noqa: E402

HERE = os.path.dirname(__file__)
ROOT = os.path.normpath(os.path.join(HERE, "..", "..", ".."))


def dfm_props(rel, obj):
    path = os.path.join(ROOT, rel)
    if os.path.isfile(path):
        text = open(path, "rb").read()
    else:
        try:
            text = subprocess.run(["git", "-C", ROOT, "show", f"HEAD:{rel}"], capture_output=True, check=True).stdout
        except (OSError, subprocess.CalledProcessError):
            pytest.skip(f"{rel} not available")
    tmp = os.path.join(HERE, ".dfm_tmp")
    open(tmp, "wb").write(text)
    sys.path.insert(0, os.path.join(HERE, "..", "..", "tools"))
    from dfmdump import dump
    try:
        for o in dump(tmp):
            if o["name"] == obj:
                return o["props"]
    finally:
        os.remove(tmp)
    raise KeyError(obj)


@pytest.mark.parametrize("rel,obj,const", [
    ("Packages/SBCommon50/UnitSBOraLogOn.dfm", "OracleDataSet1", sb.SQL_USER_OBJINF),
    ("Packages/SBCommon50/UnitSBOraLogOn.dfm", "OracleDataSet4", sb.SQL_PASSWORD_EXPIRY),
    ("Programs/SmartBank/sbMainForm_Unit.dfm", "company_list", sb.SQL_COMPANIES),
    ("Programs/SmartBank/sbMainForm_Unit.dfm", "ODS_get_app_header", sb.SQL_APP_HEADER),
])
def test_sql_verbatim_from_dfm(rel, obj, const):
    assert dfm_props(rel, obj)["SQL.Strings"] == const


def test_log_timer_interval():
    assert int(dfm_props("Programs/SmartBank/sbMainForm_Unit.dfm", "LogTimer")["Interval"]) == sb.LOG_POLL_SECONDS * 1000


class RecConn(Rec):
    def __init__(self, log, n, rows=None, outs=None):
        super().__init__(rows)
        self.calls, self.n, self.outs = log, n, outs or []

    def execute(self, sql, binds=None):
        self.calls.append(("exec", self.n, sql, dict(binds or {})))

    def plsql(self, sql, binds=None, ret=None):
        self.calls.append(("plsql", sql, dict(binds or {})))

    def plsql_out(self, sql, binds=None):
        self.calls.append(("plsql_out", sql, {k: ("OUT" if isinstance(v, Out) else v) for k, v in (binds or {}).items()}))
        return self.outs.pop(0) if self.outs else {"status": 1}

    def call_bool(self, pkg, name, args, named=None):
        self.calls.append(("bool", f"{pkg}.{name}", list(args), dict(named or {})))
        return False

    def close(self):
        self.calls.append(("close", self.n))


class RecBackend:
    def __init__(self, rows=None):
        self.log, self.n, self.rows = [], 0, rows or {}

    def connect(self, user, password, dsn, newpassword=None):
        self.n += 1
        self.log.append(("connect", self.n, user, password, newpassword))
        return RecConn(self.log, self.n, self.rows)


ROWS = {"sba_objinf": [{"FINGER3": 0}], "dba_users": [{"EX": 30}]}


def test_logon_sequence():
    """UnitSBOraLogOn.btOkClick (form session) -> SBOracleLogOn.CheckForExpire (LogOn; LogOff) -> Sb_Initialize."""
    b = RecBackend(ROWS)
    conn, info = sb.logon(b, "teller", "pw")
    W = "KLspw#1$"
    assert b.log == [
        ("connect", 1, "teller", W, None),
        ("query", sb.SQL_USER_OBJINF, {}),
        ("query", sb.SQL_PASSWORD_EXPIRY, {}),
        ("close", 1),                                   # OracleSession1.Connected := False
        ("connect", 2, "teller", W, None), ("close", 2),  # CheckForExpire
        ("connect", 3, "teller", W, None),             # SBSession.LogOn
        ("exec", 3, "alter session set isolation_level = read committed", {}),
        ("func", "SBLOGIN.GetSessionID", [], {}),
    ]
    assert info == {"warnings": [], "session_id": 7} and conn.n == 3
    assert not any(c[0] == "func" and c[1] == "SBLOGIN.UserID" for c in b.log)


def test_logon_expired_password_and_warning():
    b = RecBackend({"sba_objinf": [{"FINGER3": 0}], "dba_users": [{"EX": 3}]})
    _, info = sb.logon(b, "teller", "old", new_password="new")
    conns = [c for c in b.log if c[0] == "connect"]
    assert conns == [("connect", 1, "teller", "KLsold#1$", "KLsnew#1$"),
                     ("connect", 2, "teller", "KLsnew#1$", None), ("connect", 3, "teller", "KLsnew#1$", None)]
    assert info["warnings"] == [{"key": "login.warn_password_expires", "days": 3}]


def test_logon_fingerprint_stops_after_form_session():
    b = RecBackend({"sba_objinf": [{"FINGER3": 1}]})
    with pytest.raises(DBError):
        sb.logon(b, "teller", "pw")
    assert b.log[-1] == ("close", 1) and b.n == 1


def _ws(rows=None):
    log = []
    ws = WebSession(token="t", conn=RecConn(log, 3, rows), username="TELLER")
    ws.session_id = 7
    return ws, log


TREE = {
    ("<PluginManager>\\Packages", "Count"): "1",
    ("<PluginManager>\\Packages", "Item0"): "axinplace:{AAAA},overlapped",
    ("SmartBank\\Sections", "Count"): "1",
    ("SmartBank\\Sections\\Item0", "Caption"): "Accounts",
    ("SmartBank\\Sections\\Item0", "Action"): "",
    ("SmartBank\\Sections\\Item0", "Count"): "1",
    ("SmartBank\\Sections\\Item0\\Item0", "Caption"): "Card",
    ("SmartBank\\Sections\\Item0\\Item0", "Action"): "#0@Mode=View",
    ("SmartBank\\Sections\\Item0\\Item0", "Icon"): "acc.ico",
    ("SmartBank\\Sections\\Item0\\Item0", "Count"): "0",
}


def _tree_ws(monkeypatch):
    monkeypatch.setattr(sb.settings, "tree_ini_section", "SmartBank")
    monkeypatch.setattr(sb.settings, "plugin_ini_section", "<PluginManager>")
    monkeypatch.setattr(sb.settings, "hide_denied_nodes", False)
    monkeypatch.setattr(sb.settings, "tree_precheck_rights", False)
    monkeypatch.setattr(sb.settings, "tree_caption_keys", False)
    ws, log = _ws()
    ws.conn.call_func = lambda pkg, name, args, rettype=str, named=None: (
        log.append(("func", f"{pkg}.{name}", list(args), {})) or
        (7 if rettype is int else datetime.datetime(2026, 10, 12) if rettype is datetime.datetime
         else TREE.get((args[0], args[1]), args[2]) if name == "ReadValue" else "x"))
    return ws, log


def test_tree_read_order_no_rights(monkeypatch):
    ws, log = _tree_ws(monkeypatch)
    tree = sb.build_tree(ws)
    reads = [tuple(c[2][:2]) if c[1] == "SBCONFIG.ReadValue" else c[1] for c in log]
    assert reads == [
        "SBCONFIG.OpenFile",
        ("<PluginManager>\\Packages", "Count"), ("<PluginManager>\\Packages", "Item0"),
        ("SmartBank\\Sections", "Count"),
        ("SmartBank\\Sections\\Item0", "Caption"), ("SmartBank\\Sections\\Item0", "Action"),
        ("SmartBank\\Sections\\Item0", "Count"),
        ("SmartBank\\Sections\\Item0\\Item0", "Caption"), ("SmartBank\\Sections\\Item0\\Item0", "Action"),
        ("SmartBank\\Sections\\Item0\\Item0", "Icon"), ("SmartBank\\Sections\\Item0\\Item0", "Count"),
    ]
    assert log[0][2] == [sb.settings.system_ini_name]
    defaults = {tuple(c[2][:2]): c[2][2] for c in log if c[1] == "SBCONFIG.ReadValue"}
    assert defaults[("SmartBank\\Sections\\Item0", "Caption")] == "<no data>"
    leaf = tree[0]["children"][0]
    assert leaf["allowed"] and leaf["icon"] == "acc.ico" and leaf["params"] == "Mode=View"
    assert not any(c[0] == "bool" for c in log)
    # rights only when a node is opened (TPluginTreeView.Change -> AccCheck)
    assert sb.check_module_right(ws, "{aaaa}") is False and log[-1] == ("bool", "sb_aca.checkmodright", ["{AAAA}"], {})


def test_main_form_init_order(monkeypatch):
    ws, log = _tree_ws(monkeypatch)
    sb.main_form_init(ws)
    rest = [c for c in log if c[1] not in ("SBCONFIG.OpenFile", "SBCONFIG.ReadValue")]
    assert rest == [
        ("plsql", "begin dbms_output.enable(:buffer_size); end;", {"buffer_size": 20000}),
        ("plsql", "begin dbms_output.put_line(:line); end;",
         {"line": "SmartBank 4.0, Copyright 1996-2016, Smart Systems Technology, Ltd."}),
        ("plsql", "begin dbms_alert.register(:name); end;", {"name": "MessageBroadcast"}),
        ("plsql", "begin dbms_alert.register(:name); end;", {"name": "MsgToUser_7"}),
        ("plsql", "begin dbms_alert.register(:name); end;", {"name": "SessionShutdown"}),
        ("plsql", "begin dbms_alert.register(:name); end;", {"name": "Shutdown_7"}),
        ("func", "SBOP.get_date", [], {}),
        ("query", "select get_app_header from dual", {}),
        ("func", "SBLOGIN.get_lastlogintime", [], {}),
        ("func", "SBLOGIN.get_lastlogintime", [], {}),
        ("query", "select * from companies order by company_name", {}),
    ]
    assert ws.alerts_active


def test_poll_alerts_and_output():
    ws, log = _ws()
    ws.alerts_active, ws.last_log_drain = True, 0
    ws.conn.outs = [{"name": "MSGTOUSER_7", "message": "hello", "status": 0},
                    {"name": "SHUTDOWN_7", "message": "timeout=5,message=bye", "status": 0},
                    {"line": "l1", "status": 0}, {"line": None, "status": 1}]
    out = sb.poll_session(ws)
    W = ("plsql_out", "begin dbms_alert.waitany(:name, :message, :status, :timeout); end;",
         {"name": "OUT", "message": "OUT", "status": "OUT", "timeout": 0})
    G = ("plsql_out", "begin dbms_output.get_line(:line, :status); end;", {"line": "OUT", "status": "OUT"})
    assert log == [W, W, G, G]  # after a shutdown alert the alert thread stops (InitiateShutdown -> Terminate)
    assert out["alerts"][0] == {"name": "MSGTOUSER_7", "message": "hello"}
    assert out["alerts"][1]["shutdown"] and out["alerts"][1]["timeout"] == "5" and out["alerts"][1]["message"] == "bye"
    assert out["log"] == ["l1"] and not ws.alerts_active
    log.clear()
    assert sb.poll_session(ws) == {"alerts": [], "log": []} and log == []  # LogTimer: once per 60 s


def test_mock_login_flow():
    from fastapi.testclient import TestClient
    from app.main import app
    cl = TestClient(app)
    r = cl.post("/api/login", json={"username": "TELLER", "password": "Teller#2026"})
    assert r.status_code == 200
    s = cl.get("/api/session").json()
    assert s["alerts"] == [] and s["log"] == []
    assert cl.get("/api/system").json()["operation_date"]
