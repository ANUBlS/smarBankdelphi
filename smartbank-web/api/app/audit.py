"""App-side login/logout times (SQLite on the api volume).

The bank DB does not record login/logout times (confirmed with the bank). The Delphi caption calls
SBLOGIN.get_lastlogintime (Programs/SmartBank/sbMainForm_Unit.pas:1002-1004), but it has no reliable data
behind it, so the web app keeps its own record. The Oracle schema is NOT changed.
"""
from __future__ import annotations
import datetime
import os
import sqlite3
import threading

_lock = threading.Lock()
PATH = os.getenv("AUDIT_DB_PATH", os.path.join(os.path.dirname(__file__), "..", "data", "smartbank-web.sqlite"))


def _db():
    os.makedirs(os.path.dirname(os.path.abspath(PATH)), exist_ok=True)
    c = sqlite3.connect(PATH)
    c.execute("""create table if not exists user_logins(
        username text primary key, last_login text, last_logout text, prev_login text, logout_reason text)""")
    c.execute("""create table if not exists login_events(
        id integer primary key autoincrement, username text not null, login_at text not null,
        logout_at text, logout_reason text, oracle_session_id integer, client_ip text)""")
    for col in ("status text default 'success'", "error text"):
        try:
            c.execute(f"alter table login_events add column {col}")
        except sqlite3.OperationalError:
            pass
    c.execute("""create table if not exists user_lockout(
        username text primary key, failed_count integer not null default 0, locked_at text,
        last_failed_at text)""")
    c.execute("""create table if not exists admin_actions(
        id integer primary key autoincrement, at text not null, admin text not null, action text not null,
        target text, details text)""")
    c.execute("create index if not exists ix_login_events_user on login_events(username, login_at)")
    return c


def _now():
    return datetime.datetime.now().astimezone().isoformat(timespec="seconds")


def record_login(username: str, session_id=None, client_ip=None) -> dict:
    """Returns the PREVIOUS login/logout (what the user is shown), then stores now as last_login."""
    with _lock, _db() as c:
        row = c.execute("select last_login, last_logout, logout_reason from user_logins where username=?",
                        (username,)).fetchone()
        prev = {"last_login": row[0], "last_logout": row[1], "logout_reason": row[2]} if row else \
            {"last_login": None, "last_logout": None, "logout_reason": None}
        c.execute("""insert into user_logins(username,last_login,prev_login) values(?,?,?)
                     on conflict(username) do update set prev_login=last_login, last_login=excluded.last_login""",
                  (username, _now(), prev["last_login"]))
        c.execute("update user_lockout set failed_count=0, locked_at=null where username=?", (username,))
        cur = c.execute("insert into login_events(username,login_at,oracle_session_id,client_ip) values(?,?,?,?)",
                        (username, _now(), session_id, client_ip))
        prev["event_id"] = cur.lastrowid
        return prev


def record_logout(username: str, reason: str = "logout", event_id=None):
    with _lock, _db() as c:
        if event_id:
            c.execute("update login_events set logout_at=?, logout_reason=? where id=? and logout_at is null",
                      (_now(), reason, event_id))
        c.execute("update user_logins set last_logout=?, logout_reason=? where username=?", (_now(), reason, username))


def history(user: str | None = None, date_from: str | None = None, date_to: str | None = None,
            limit: int = 5000) -> list[dict]:
    """date_from/date_to: YYYY-MM-DD (inclusive)."""
    sql = ("select id, username, login_at, logout_at, logout_reason, oracle_session_id, client_ip, "
           "coalesce(status,'success'), error from login_events where 1=1")
    b: list = []
    if user:
        sql += " and username like ?"; b.append(user.upper().replace("*", "%") + ("" if "*" in user else "%"))
    if date_from:
        sql += " and substr(login_at,1,10) >= ?"; b.append(date_from)
    if date_to:
        sql += " and substr(login_at,1,10) <= ?"; b.append(date_to)
    sql += " order by login_at desc limit ?"; b.append(limit)
    with _lock, _db() as c:
        cols = ["id", "username", "login_at", "logout_at", "logout_reason", "oracle_session_id", "client_ip",
                "status", "error"]
        return [dict(zip(cols, r)) for r in c.execute(sql, b).fetchall()]


# ---------------------------------------------------------------- failed logins / app-side lockout
MAX_FAILED = int(os.getenv("LOGIN_MAX_FAILED", "5"))


def is_locked(username: str) -> bool:
    with _lock, _db() as c:
        r = c.execute("select locked_at from user_lockout where username=?", (username,)).fetchone()
        return bool(r and r[0])


def record_failed(username: str, client_ip: str | None, error: str) -> dict:
    """Store a failed attempt; lock the username app-side after MAX_FAILED consecutive failures."""
    now = _now()
    with _lock, _db() as c:
        c.execute("insert into login_events(username,login_at,client_ip,status,error) values(?,?,?,'failed',?)",
                  (username, now, client_ip, error))
        c.execute("""insert into user_lockout(username,failed_count,last_failed_at) values(?,1,?)
                     on conflict(username) do update set failed_count=failed_count+1, last_failed_at=excluded.last_failed_at""",
                  (username, now))
        n = c.execute("select failed_count from user_lockout where username=?", (username,)).fetchone()[0]
        locked = n >= MAX_FAILED
        if locked:
            c.execute("update user_lockout set locked_at=coalesce(locked_at, ?) where username=?", (now, username))
            c.execute("insert into login_events(username,login_at,client_ip,status,error) values(?,?,?,'locked',?)",
                      (username, now, client_ip, f"app-side lock after {n} consecutive failed attempts"))
        return {"failed_count": n, "locked": locked}


def record_db_locked(username: str, client_ip: str | None, error: str):
    """ORA-28000: account locked in Oracle (profile FAILED_LOGIN_ATTEMPTS). Not counted as an app-side failure;
    only a DBA can unlock it (ALTER USER .. ACCOUNT UNLOCK) - the app never does that."""
    with _lock, _db() as c:
        c.execute("insert into login_events(username,login_at,client_ip,status,error) values(?,?,?,'db_locked',?)",
                  (username, _now(), client_ip, error))


def record_blocked(username: str, client_ip: str | None):
    with _lock, _db() as c:
        c.execute("insert into login_events(username,login_at,client_ip,status,error) values(?,?,?,'blocked',?)",
                  (username, _now(), client_ip, "attempt while locked (Oracle logon not attempted)"))


def lockouts() -> list[dict]:
    with _lock, _db() as c:
        return [dict(zip(["username", "failed_count", "locked_at", "last_failed_at"], r)) for r in
                c.execute("select username, failed_count, locked_at, last_failed_at from user_lockout "
                          "where failed_count>0 or locked_at is not null order by locked_at desc, last_failed_at desc")]


def unlock(username: str, admin: str, oracle_result: str) -> dict:
    """App-side unlock + audit (who unlocked whom, and what happened in Oracle)."""
    with _lock, _db() as c:
        r = c.execute("select failed_count, locked_at from user_lockout where username=?", (username,)).fetchone()
        c.execute("update user_lockout set failed_count=0, locked_at=null where username=?", (username,))
        details = f"app_lock: failed_count={r[0] if r else 0} locked_at={r[1] if r else None}; oracle: {oracle_result}"
        c.execute("insert into admin_actions(at,admin,action,target,details) values(?,?,?,?,?)",
                  (_now(), admin, "unlock_user", username, details))
        c.execute("insert into login_events(username,login_at,status,error) values(?,?,'unlocked',?)",
                  (username, _now(), f"unlocked by {admin}; oracle: {oracle_result}"))
        return {"app_lock_cleared": bool(r and (r[0] or r[1])), "oracle": oracle_result}


def log_action(admin: str, action: str, target: str, details: str):
    with _lock, _db() as c:
        c.execute("insert into admin_actions(at,admin,action,target,details) values(?,?,?,?,?)",
                  (_now(), admin, action, target, details))


def admin_actions(limit: int = 500) -> list[dict]:
    with _lock, _db() as c:
        return [dict(zip(["id", "at", "admin", "action", "target", "details"], r)) for r in
                c.execute("select id, at, admin, action, target, details from admin_actions order by id desc limit ?", (limit,))]
