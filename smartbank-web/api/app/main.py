"""SmartBank web API (pilot: login, splash data, company, tree, password, logout, health)."""
from __future__ import annotations

import os as _os
# Single-worker guard: sessions (live Oracle connections + uncommitted work) and AZIPS form state are per-process memory.
if int(_os.environ.get("WEB_CONCURRENCY", "1") or 1) > 1:
    raise RuntimeError("SmartBank web API must run with exactly one worker (WEB_CONCURRENCY=1); see README 'Single worker'.")
import asyncio
import logging

from fastapi import Depends, FastAPI, HTTPException, Request, Response
import csv
import io
import re

from fastapi.responses import JSONResponse, StreamingResponse
from pydantic import BaseModel, Field

from . import audit, sb
from .config import settings
from .db import DBError, get_backend
from .sessions import attempts, store

log = logging.getLogger("smartbank")
app = FastAPI(title="SmartBank API", version="0.1.0")
backend = get_backend(settings.db_mode)
COOKIE = "sb_session"


def err(status: int, key: str, ora: str | None = None, **extra):
    """Errors carry an i18n key (translated in web/locales) + raw ORA text when it came from Oracle."""
    raise HTTPException(status, {"key": key, "ora": ora, **extra})


@app.exception_handler(DBError)
async def _dberr(_req, e: DBError):
    return JSONResponse(status_code=400, content={"detail": {"key": "error.oracle", "ora": e.message}})


def current(request: Request):
    # Status polling must not count as user activity.
    touch = request.headers.get("x-sb-activity", "1") != "0"
    ws = store.get(request.cookies.get(COOKIE), touch=touch)
    if not ws:
        err(401, "error.session_expired")
    return ws


def require_module(clsid: str):
    """Server-side enforcement for future module routers: Depends(require_module('{CLSID}'))."""
    def dep(ws=Depends(current)):
        if not sb.check_module_right(ws, clsid):
            err(403, "error.access_denied")
        return ws
    return dep


# ------------------------------------------------------------------ models
class LoginIn(BaseModel):
    username: str = Field(min_length=1, max_length=30)
    password: str = Field(min_length=1, max_length=128)
    new_password: str | None = Field(default=None, max_length=128)
    new_password_retype: str | None = Field(default=None, max_length=128)


class CompanyIn(BaseModel):
    name: str


class PasswordIn(BaseModel):
    old_password: str
    new_password: str
    retype_password: str


class OpenIn(BaseModel):
    path: str


# ------------------------------------------------------------------ routes
@app.get("/health")
def health():
    """Delphi keep-alive query sbMainForm_Unit.dfm:1093. In oracle mode a short-lived check connection is not
    possible without credentials, so health reports API status + DB ping of one live session if any."""
    db = None
    for ws in list(store._s.values())[:1]:
        try:
            db = ws.conn.ping()
        except DBError:
            db = False
    if settings.db_mode == "mock":
        from .db.mock import MockConnection, _load
        db = MockConnection(next(iter(_load()["users"]))).ping()
    return {"status": "ok", "db_mode": settings.db_mode, "db": db}


@app.get("/api/config")
def public_config():
    return {"product_name": settings.product_name, "idle_minutes": settings.session_idle_minutes,
            "max_logon_retry": settings.max_logon_retry, "login_max_failed": audit.MAX_FAILED, "db_mode": settings.db_mode}


@app.post("/api/login")
def login(body: LoginIn, request: Request, response: Response):
    uname = body.username.strip().upper()
    ip = request.headers.get("x-forwarded-for") or (request.client.host if request.client else "")
    key = f"{uname}|{ip}"
    # App-side persistent lock (LOGIN_MAX_FAILED consecutive failures): refused before any Oracle logon.
    if audit.is_locked(uname):
        audit.record_blocked(uname, ip)
        err(423, "login.err_user_locked")
    left = attempts.locked(key)
    if left:
        err(429, "login.err_locked", seconds=left)
    if body.new_password is not None and body.new_password != body.new_password_retype:
        err(400, "password.err_mismatch")
    try:
        conn, info = sb.logon(backend, body.username.strip(), body.password, body.new_password)
    except DBError as e:
        if e.code == sb.ORA_EXPIRED:
            # UnitSBOraLogOn.pas:324-332: expired -> show password-change dialog then LogOn with new password
            err(409, "login.password_expired", ora=e.message)
        if e.message == "FINGERPRINT_REQUIRED":
            err(403, "login.err_fingerprint")
        if e.code == 28000:
            audit.record_db_locked(uname, ip, e.message)
            err(423, "login.err_db_locked", ora=e.message)
        st = audit.record_failed(uname, ip, e.message)
        if st["locked"]:
            err(423, "login.err_user_locked", ora=e.message)
        remaining = attempts.fail(key)
        if remaining == 0:
            err(429, "login.err_locked", ora=e.message, seconds=settings.login_lock_seconds)
        err(401, "error.oracle", ora=e.message, remaining=remaining)
    attempts.ok(key)
    ws = store.create(conn, body.username.strip().upper())
    ws.session_id, ws.user_id = info.get("session_id"), info.get("user_id")
    ws.previous = audit.record_login(ws.username, ws.session_id, request.headers.get("x-forwarded-for") or (request.client.host if request.client else None))  # app-side (DB does not record login times)
    ws.pw_salt = sb.new_salt()
    ws.pw_hash = sb.password_fingerprint(sb.wrap_password(body.new_password or body.password), ws.pw_salt)
    response.set_cookie(COOKIE, ws.token, httponly=True, samesite="strict", secure=settings.cookie_secure,
                        path="/")
    return {"username": ws.username, "session_id": ws.session_id, "warnings": info["warnings"],
            **{k: v for k, v in ws.previous.items() if k != "event_id"}}


@app.post("/api/logout")
def logout(request: Request, response: Response):
    tok = request.cookies.get(COOKIE)
    if tok:
        store.drop(tok)
    response.delete_cookie(COOKIE, path="/")
    return {"ok": True}


@app.get("/api/session")
def session_status(ws=Depends(current)):
    return {"username": ws.username, "session_id": ws.session_id, "idle_seconds_left": ws.idle_left(),
            "company": ws.company_name, "is_admin": sb.is_admin(ws)}


@app.post("/api/session/activity")
def activity(ws=Depends(current)):
    return {"idle_seconds_left": ws.idle_left()}


@app.get("/api/system")
def system(ws=Depends(current)):
    return {**sb.system_info(ws.conn), "username": ws.username, "company": ws.company_name,
            **{k: v for k, v in ws.previous.items() if k != "event_id"}}


@app.get("/api/companies")
def companies(ws=Depends(current)):
    return sb.companies(ws.conn)


@app.post("/api/companies/select")
def select_company(body: CompanyIn, ws=Depends(current)):
    c = sb.select_company(ws.conn, body.name)
    ws.company_id, ws.company_name = c["id"], c["name"]
    return c


@app.get("/api/tree")
def tree(ws=Depends(current)):
    return sb.visible_tree(sb.build_tree(ws))


@app.post("/api/modules/open")
def open_module(body: OpenIn, ws=Depends(current)):
    node = sb.find_node(sb.build_tree(ws), body.path)
    if not node:
        err(404, "error.not_found")
    if node["clsid"]:
        # Re-checked on every open (server-enforced, PluginTreeView.pas:111-128)
        if not sb.check_module_right(ws, node["clsid"]):
            err(403, "error.access_denied")
    return {"path": node["path"], "caption": node["caption"], "clsid": node["clsid"], "params": node["params"]}


@app.post("/api/password")
def change_password(body: PasswordIn, ws=Depends(current)):
    try:
        sb.change_password(ws, body.old_password, body.new_password, body.retype_password)
    except sb.PasswordChangeError as e:
        err(400, e.key)
    return {"ok": True, "key": "password.changed"}


# ------------------------------------------------------------------ admin: login history (app-side SQLite)
def require_admin(ws=Depends(current)):
    if not sb.is_admin(ws):
        err(403, "error.access_denied")
    return ws


_DATE = re.compile(r"^\d{4}-\d{2}-\d{2}$")


def _hist(user, date_from, date_to):
    for d in (date_from, date_to):
        if d and not _DATE.match(d):
            err(400, "history.err_date")
    return audit.history(user or None, date_from or None, date_to or None)


@app.get("/api/admin/login-history")
def login_history(user: str = "", date_from: str = "", date_to: str = "", ws=Depends(require_admin)):
    return _hist(user, date_from, date_to)


@app.get("/api/admin/lockouts")
def lockouts(ws=Depends(require_admin)):
    return audit.lockouts()


class UnlockIn(BaseModel):
    username: str = Field(min_length=1, max_length=30)


@app.post("/api/admin/unlock")
def unlock(body: UnlockIn, ws=Depends(require_admin)):
    """Unlock BOTH the app-side lock and the Oracle account (ALTER USER "<name>" ACCOUNT UNLOCK in the admin's
    own session). If Oracle refuses (e.g. ORA-01031 insufficient privileges) nothing is unlocked and the ORA text
    is returned; the refusal is logged."""
    name = body.username.strip().upper()
    try:
        db_name = sb.oracle_unlock_user(ws.conn, name)
    except ValueError:
        err(400, "lock.err_invalid_user")
    except DBError as e:
        audit.log_action(ws.username, "unlock_user_failed", name, f"oracle: {e.message}")
        err(400, "lock.err_oracle", ora=e.message)
    res = audit.unlock(name, ws.username, "account unlocked" if db_name else "no such Oracle user (app lock only)")
    return {"ok": True, "oracle_unlocked": bool(db_name), **res}


@app.get("/api/admin/actions")
def admin_actions(ws=Depends(require_admin)):
    return audit.admin_actions()


@app.get("/api/admin/login-history.csv")
def login_history_csv(user: str = "", date_from: str = "", date_to: str = "", ws=Depends(require_admin)):
    rows = _hist(user, date_from, date_to)
    buf = io.StringIO()
    buf.write("\ufeff")  # Excel-friendly UTF-8
    w = csv.writer(buf)
    w.writerow(["username", "status", "time", "logout_at", "logout_reason", "error", "oracle_session_id", "client_ip"])
    for r in rows:
        w.writerow([r["username"], r["status"], r["login_at"], r["logout_at"] or "", r["logout_reason"] or "",
                    r["error"] or "", r["oracle_session_id"] or "", r["client_ip"] or ""])
    return StreamingResponse(iter([buf.getvalue()]), media_type="text/csv; charset=utf-8",
                             headers={"Content-Disposition": "attachment; filename=login-history.csv"})


# ------------------------------------------------------------------ migrated modules
from . import accounts  # noqa: E402
app.include_router(accounts.make_router(current, require_module, err))
from . import customers  # noqa: E402
app.include_router(customers.make_router(current, require_module, err))
from . import transactions  # noqa: E402
app.include_router(transactions.make_router(current, require_module, err))
from . import out_transactions  # noqa: E402
app.include_router(out_transactions.make_router(current, require_module, err))
from . import credits  # noqa: E402
app.include_router(credits.make_router(current, require_module, err))


@app.on_event("startup")
async def _reaper():
    async def loop():
        while True:
            await asyncio.sleep(30)
            store.reap()  # idle sessions: Oracle session closed server-side
    asyncio.create_task(loop())
from . import balance  # noqa: E402
for _r in balance.make_routers(current, require_module, err):
    app.include_router(_r)
from . import out_control_tape  # noqa: E402
app.include_router(out_control_tape.make_router(current, require_module, err))
from . import out_turnovers  # noqa: E402
app.include_router(out_turnovers.make_router(current, require_module, err))
from . import out_statement  # noqa: E402
app.include_router(out_statement.make_router(current, require_module, err))
from . import out_account  # noqa: E402
app.include_router(out_account.make_router(current, require_module, err))
from . import out_balrefedit  # noqa: E402
app.include_router(out_balrefedit.make_router(current, require_module, err))
from . import out_tuningacctypes  # noqa: E402
app.include_router(out_tuningacctypes.make_router(current, require_module, err))
from . import out_avalute  # noqa: E402
app.include_router(out_avalute.make_router(current, require_module, err))
from . import out_memorial  # noqa: E402
app.include_router(out_memorial.make_router(current, require_module, err))
from . import out_repair  # noqa: E402
app.include_router(out_repair.make_router(current, require_module, err))
from . import out_excel_import  # noqa: E402
app.include_router(out_excel_import.make_router(current, require_module, err))
from . import azips  # noqa: E402
app.include_router(azips.make_router(current, require_module, err))
from . import xohks  # noqa: E402
app.include_router(xohks.make_router(current, require_module, err))
from . import xohks_edit  # noqa: E402
app.include_router(xohks_edit.make_router(current, require_module, err))
from . import xohks_status  # noqa: E402
app.include_router(xohks_status.make_router(current, require_module, err))
from . import xohks_file  # noqa: E402
app.include_router(xohks_file.make_router(current, require_module, err))
