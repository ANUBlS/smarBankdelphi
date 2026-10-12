import os
import pytest
from fastapi.testclient import TestClient
from app import main, sessions
from app.db import mock


@pytest.fixture(autouse=True)
def fresh():
    mock.reset(); sessions.attempts._f.clear(); sessions.store._s.clear()
    if os.path.exists(os.environ["AUDIT_DB_PATH"]): os.remove(os.environ["AUDIT_DB_PATH"])
    yield


def c():
    return TestClient(main.app)


def login(cl, u="ADMIN", p="Admin#2026", **kw):
    return cl.post("/api/login", json={"username": u, "password": p, **kw})


def test_health():
    r = c().get("/health"); assert r.json()["db"] is True


def test_login_ok_and_session_id():
    cl = c(); r = login(cl); assert r.status_code == 200 and r.json()["session_id"] > 0
    assert cl.get("/api/session").status_code == 200


def test_bad_password_ora_text_and_3_attempts():
    cl = c()
    r1 = login(cl, p="x"); assert r1.status_code == 401 and "ORA-01017" in r1.json()["detail"]["ora"]
    assert r1.json()["detail"]["remaining"] == 2
    login(cl, p="x"); r3 = login(cl, p="x"); assert r3.status_code == 429
    assert login(cl).status_code == 429
    sessions.attempts._f.clear()  # even correct password blocked after 3 failures


def test_expiry_warning_teller():
    r = login(c(), "TELLER", "Teller#2026")
    assert {"key": "login.warn_password_expires", "days": 3} in r.json()["warnings"]


def test_expired_password_flow():
    cl = c(); r = login(cl, "EXPIRED", "Expired#2026"); assert r.status_code == 409
    r = login(cl, "EXPIRED", "Expired#2026", new_password="Brand#New1", new_password_retype="Brand#New1")
    assert r.status_code == 200


def test_fingerprint_user_refused():
    assert login(c(), "FINGER", "Finger#2026").json()["detail"]["key"] == "login.err_fingerprint"


def test_system_info():
    cl = c(); login(cl); j = cl.get("/api/system").json()
    assert j["operation_date"] == "2026-10-12" and j["branch"] == 101
    assert j["app_header"].startswith("ADMIN")


def test_last_login_logout_app_side():
    cl = c(); r = login(cl, "TELLER", "Teller#2026"); assert r.json()["last_login"] is None
    cl.post("/api/logout"); r = login(cl, "TELLER", "Teller#2026").json()
    assert r["last_login"] and r["last_logout"] and r["logout_reason"] == "logout"
    assert cl.get("/api/system").json()["last_login"] == r["last_login"]


def test_companies_and_context():
    cl = c(); login(cl); assert [x["name"] for x in cl.get("/api/companies").json()][0] == "SmartBank HQ"
    assert cl.post("/api/companies/select", json={"name": "SmartBank Leasing"}).json()["id"] == 2


def test_tree_rights_server_enforced():
    cl = c(); login(cl, "TELLER", "Teller#2026"); t = cl.get("/api/tree").json()
    acc = t[1]["children"][0]; assert acc["caption"] == "Account card" and acc["allowed"]
    bal = t[1]["children"][2]; assert not bal["allowed"]
    assert cl.post("/api/modules/open", json={"path": bal["path"]}).status_code == 403
    tm = cl.post("/api/modules/open", json={"path": "3.0"}).json(); assert tm["params"] == "Mode=View"
    assert t[0]["allowed"]  # splash module always allowed


def test_admin_all_allowed():
    cl = c(); login(cl)
    def walk(ns):
        for n in ns:
            assert n["allowed"]; walk(n["children"])
    walk(cl.get("/api/tree").json())


def test_password_change_rules():
    cl = c(); login(cl)
    pw = lambda o, n, r: cl.post("/api/password", json={"old_password": o, "new_password": n, "retype_password": r})
    assert pw("wrong", "Abcdef#12", "Abcdef#12").json()["detail"]["key"] == "password.err_old_wrong"
    assert pw("Admin#2026", "Abcdef#12", "x").json()["detail"]["key"] == "password.err_mismatch"
    assert pw("Admin#2026", "simple", "simple").json()["detail"]["key"] == "password.err_not_complex"
    assert pw("Admin#2026", "Abcdef#12", "Abcdef#12").status_code == 200
    cl.post("/api/logout"); assert login(cl, p="Admin#2026").status_code == 401
    assert login(cl, p="Abcdef#12").status_code == 200


def test_logout_and_idle_timeout():
    cl = c(); login(cl); cl.post("/api/logout"); assert cl.get("/api/session").status_code == 401
    login(cl); ws = next(iter(sessions.store._s.values())); ws.last_seen -= 46 * 60
    assert cl.get("/api/session").status_code == 401 and not sessions.store._s


def test_status_poll_does_not_touch():
    cl = c(); login(cl); ws = next(iter(sessions.store._s.values())); ws.last_seen -= 100
    left = cl.get("/api/session", headers={"x-sb-activity": "0"}).json()["idle_seconds_left"]
    assert left <= 45 * 60 - 99


def test_login_history_admin_only_and_csv():
    t = c(); login(t, "TELLER", "Teller#2026"); t.post("/api/logout")
    assert t.get("/api/admin/login-history").status_code == 401
    login(t, "TELLER", "Teller#2026"); assert t.get("/api/admin/login-history").status_code == 403
    ws = [w for w in sessions.store._s.values()][0]; ws.last_seen -= 46 * 60; sessions.store.reap()
    a = c(); login(a); assert a.get("/api/session").json()["is_admin"]
    rows = a.get("/api/admin/login-history?user=TELL").json()
    assert len(rows) == 2 and {r["logout_reason"] for r in rows} == {"logout", "idle"}
    assert a.get("/api/admin/login-history?date_from=2099-01-01").json() == []
    assert a.get("/api/admin/login-history?date_from=bad").status_code == 400
    csvr = a.get("/api/admin/login-history.csv"); assert "username,status,time" in csvr.text and "TELLER" in csvr.text


def test_failed_logins_recorded_lock_after_5_and_unlock():
    cl = c()
    for i in range(5):
        sessions.attempts._f.clear()
        r = login(cl, "TELLER", "bad")
    assert r.status_code == 423 and r.json()["detail"]["key"] == "login.err_user_locked"
    sessions.attempts._f.clear()
    assert login(cl, "TELLER", "Teller#2026").status_code == 423   # blocked before Oracle
    a = c(); login(a)
    hist = a.get("/api/admin/login-history?user=TELLER").json()
    st = [h["status"] for h in hist]
    assert st.count("failed") == 5 and "locked" in st and "blocked" in st
    assert any("ORA-01017" in (h["error"] or "") for h in hist)
    assert a.get("/api/admin/lockouts").json()[0]["username"] == "TELLER"
    assert a.post("/api/admin/unlock", json={"username": "TELLER"}).json()["oracle_unlocked"]
    assert a.get("/api/admin/actions").json()[0]["action"] == "unlock_user"
    assert login(cl, "TELLER", "Teller#2026").status_code == 200


def test_success_resets_counter():
    cl = c()
    for _ in range(2):
        login(cl, "TELLER", "bad")
    sessions.attempts._f.clear()
    assert login(cl, "TELLER", "Teller#2026").status_code == 200; cl.post("/api/logout")
    for _ in range(2):
        login(cl, "TELLER", "bad")
    sessions.attempts._f.clear()
    for _ in range(2):
        r = login(cl, "TELLER", "bad")
    assert r.status_code != 423  # only 4 consecutive since last success


def test_ora_28000_db_locked():
    cl = c(); r = login(cl, "LOCKED", "Locked#2026")
    assert r.status_code == 423 and r.json()["detail"]["key"] == "login.err_db_locked" and "ORA-28000" in r.json()["detail"]["ora"]
    a = c(); login(a); h = a.get("/api/admin/login-history?user=LOCKED").json()
    assert h[0]["status"] == "db_locked"
    assert a.get("/api/admin/lockouts").json() == [] or all(x["username"] != "LOCKED" for x in a.get("/api/admin/lockouts").json())


def test_admin_unlocks_oracle_account():
    cl = c(); assert login(cl, "LOCKED", "Locked#2026").status_code == 423
    a = c(); login(a)
    assert a.post("/api/admin/unlock", json={"username": 'X" ACCOUNT LOCK; --'}).json()["detail"]["key"] == "lock.err_invalid_user"
    r = a.post("/api/admin/unlock", json={"username": "locked"}).json(); assert r["oracle_unlocked"]
    assert login(cl, "LOCKED", "Locked#2026").status_code == 200
    r = a.post("/api/admin/unlock", json={"username": "NOSUCH"}).json(); assert r["ok"] and not r["oracle_unlocked"]
    acts = a.get("/api/admin/actions").json(); assert acts[0]["admin"] == "ADMIN" and acts[1]["target"] == "LOCKED"


def test_unlock_without_privilege_shows_ora(monkeypatch):
    a = c(); login(a); ws = next(iter(sessions.store._s.values()))
    ws.conn.user = {**ws.conn.user, "is_adm": False}  # admin in SB_ACA but no ALTER USER privilege
    r = a.post("/api/admin/unlock", json={"username": "LOCKED"})
    assert r.status_code == 400 and "ORA-01031" in r.json()["detail"]["ora"]
    assert a.get("/api/admin/actions").json()[0]["action"] == "unlock_user_failed"
