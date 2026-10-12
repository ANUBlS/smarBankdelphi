"""Server-side per-user sessions. Each holds the user's own DB connection (Delphi: one TOracleSession per client)."""
from __future__ import annotations
import secrets
import threading
import time
from dataclasses import dataclass, field

from .config import settings


@dataclass
class WebSession:
    token: str
    conn: object
    username: str
    session_id: int | None = None
    user_id: int | None = None
    company_id: int | None = None
    company_name: str | None = None
    ini_opened: bool = False
    tree_cache: list | None = None
    plugins_cache: list | None = None
    pw_salt: bytes = b""
    pw_hash: bytes = b""
    is_admin: bool | None = None
    previous: dict = field(default_factory=dict)
    last_seen: float = field(default_factory=time.time)

    def idle_left(self) -> int:
        return max(0, int(settings.session_idle_minutes * 60 - (time.time() - self.last_seen)))


class SessionStore:
    def __init__(self):
        self._s: dict[str, WebSession] = {}
        self._lock = threading.Lock()

    def create(self, conn, username) -> WebSession:
        tok = secrets.token_urlsafe(32)
        ws = WebSession(tok, conn, username)
        with self._lock:
            self._s[tok] = ws
        return ws

    def get(self, tok: str | None, touch: bool = True) -> WebSession | None:
        if not tok:
            return None
        with self._lock:
            ws = self._s.get(tok)
        if ws and time.time() - ws.last_seen > settings.session_idle_minutes * 60:
            self.drop(tok, "idle")
            return None
        if ws and touch:
            ws.last_seen = time.time()
        return ws

    def drop(self, tok: str, reason: str = "logout"):
        with self._lock:
            ws = self._s.pop(tok, None)
        if ws:
            from . import audit
            audit.record_logout(ws.username, reason, ws.previous.get("event_id"))
            ws.conn.close()  # Delphi Sb_Disconnect -> SBSession.LogOff (SBOInitPkg.pas)

    def reap(self):
        now = time.time()
        for tok, ws in list(self._s.items()):
            if now - ws.last_seen > settings.session_idle_minutes * 60:
                self.drop(tok, "idle")


class LoginAttempts:
    """Delphi: Sb_AskForLogin allows MaxLogonRetryCount=3 attempts, then Application.Terminate
    (SBOInitPkg.pas:40, :85-110; sbMainForm_Unit.pas:416-419). Web equivalent: after 3 failed attempts for a
    username+client the login is refused for LOGIN_LOCK_SECONDS."""

    def __init__(self):
        self._f: dict[str, list] = {}
        self._lock = threading.Lock()

    def locked(self, key) -> int:
        with self._lock:
            n, until = self._f.get(key, [0, 0])
            if until and time.time() < until:
                return int(until - time.time())
            if until:
                self._f.pop(key, None)
            return 0

    def fail(self, key) -> int:
        """returns remaining attempts"""
        with self._lock:
            n, until = self._f.get(key, [0, 0])
            n += 1
            if n >= settings.max_logon_retry:
                self._f[key] = [n, time.time() + settings.login_lock_seconds]
                return 0
            self._f[key] = [n, 0]
            return settings.max_logon_retry - n

    def ok(self, key):
        with self._lock:
            self._f.pop(key, None)


store = SessionStore()
attempts = LoginAttempts()
