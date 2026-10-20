"""Mock for Packages/ExchangeMGR-NBC (exchangemgr.py). The verbatim em_sql texts run in an in-memory SQLite database
made from fixtures/exchangemgr.json, with these SQLite rewrites only: 'rownum' -> row_number() over (), Oracle
decode() registered as a function, ODSSysdat (trunc(sysdate) from dual) answered from the fixture 'sysdate'.
ASSUMED (the EXCH_MGR source is not in the repo): Ex_Calendar = date in fixture 'calendar'; LastWorkDay_Calendar =
the last earlier date not in 'calendar'; NextResurs / Ex_RemainderProv_Change / Ex_RemainderLaz_Change only record
the call; ExRemainderSql = fixture 'ex_remainder' rows of v_exid; ex_date_change = fixture 'ex_date_change'."""
from __future__ import annotations
import datetime as dt
import json
import os
import sqlite3

from .. import em_sql as Q
from .base import DBError

_DB = None
CALLS: list = []
DATE_COLS = {"DAT", "SSDAT", "OPEN_DAT", "CLOSE_DAT"}


def reset():
    global _DB
    _DB = None
    CALLS.clear()


def _decode(*a):
    v = a[0]
    for i in range(1, len(a) - 1, 2):
        if v is not None and str(v) == str(a[i]):
            return a[i + 1]
    return a[-1] if len(a) % 2 == 0 else None


def _db():
    global _DB
    if _DB is None:
        from ..config import settings
        D = json.load(open(os.path.join(settings.mock_fixtures, "exchangemgr.json"), encoding="utf-8"))
        c = sqlite3.connect(":memory:", check_same_thread=False)
        c.create_function("decode", -1, _decode)
        for t, rows in D.items():
            if not isinstance(rows, list) or (rows and not isinstance(rows[0], dict)):
                continue
            cols = list(dict.fromkeys(k for r in rows for k in r)) or ["ID"]
            c.execute(f'create table "{t}" ({", ".join(chr(34) + k + chr(34) for k in cols)})')
            for r in rows:
                c.execute(f'insert into "{t}" ({", ".join(chr(34) + k + chr(34) for k in r)}) values ({", ".join("?" * len(r))})', list(r.values()))
        c.execute("create table dual (DUMMY)"); c.execute("insert into dual values ('X')")
        c.commit()
        _DB = (c, D)
    return _DB


def _bind(v):
    if isinstance(v, dt.datetime):
        return v.date().isoformat()
    if isinstance(v, dt.date):
        return v.isoformat()
    return v


def _run(sql, binds=None):
    c = _db()[0]
    s = sql.replace("rownum,", "row_number() over () as rownum,")
    used = {k: _bind(v) for k, v in (binds or {}).items() if ":" + k in sql}
    try:
        cur = c.execute(s, used)
    except sqlite3.Error as e:
        raise DBError(f"ORA-00904: mock: {e}")
    names = [d[0].upper().strip('"') for d in cur.description]
    out = []
    for t in cur.fetchall():
        r = {}
        for n, v in zip(names, t):
            if n in DATE_COLS and isinstance(v, str) and len(v) >= 10:
                v = dt.datetime.fromisoformat(v)
            r[n] = v
        out.append(r)
    return out


_ALL = {getattr(Q, n) for n in dir(Q) if n.startswith("DM_")} - {Q.DM_ODSSysdat}
# texts that touch EXCHANGEMGR-only tables are answered first; generic texts (bankinfo, filial,
# avalute, account ...) are shared with other modules, so they are only answered as a last resort
_OWN = {q for q in _ALL if any(t in q.lower() for t in ("ex_", "operkurs", "from dual"))}
_LATE = _ALL - _OWN


class EmMixin:
    def _em_query(self, sql, b):
        if sql == Q.DM_ODSSysdat:
            s = _db()[1]["sysdate"]
            return [{"SSDAT": dt.datetime.fromisoformat(s["date"]), "STIME": s["time"]}]
        if sql in _OWN or sql.startswith(Q.DM_ODSRatesFilial.split("\n")[0] + "\n"):
            return _run(sql, b)
        return NotImplemented

    def _em_query_late(self, sql, b):
        return _run(sql, b) if sql in _LATE else NotImplemented

    def _em_func(self, key, args):
        if not key.startswith(("SBOP.GET_DATE", "EXCH_MGR.")):
            return NotImplemented
        D = _db()[1]
        if key == "SBOP.GET_DATE":
            return dt.datetime.fromisoformat(D["sbop_date"])
        if key == "EXCH_MGR.LASTWORKDAY_CALENDAR":
            d = args[0].date() - dt.timedelta(days=1)
            while d.isoformat() in D["calendar"]:
                d -= dt.timedelta(days=1)
            return dt.datetime(d.year, d.month, d.day)
        if key == "EXCH_MGR.EX_DATE_CHANGE":
            return D["ex_date_change"]
        return NotImplemented

    def _em_bool(self, key, args):
        if key == "EXCH_MGR.EX_CALENDAR":
            return _bind(args[0]) in _db()[1]["calendar"]
        return NotImplemented

    def _em_proc(self, key, args):
        if key in ("EXCH_MGR.NEXTRESURS", "EXCH_MGR.EX_REMAINDERPROV_CHANGE", "EXCH_MGR.EX_REMAINDERLAZ_CHANGE"):
            CALLS.append((key, [_bind(a) for a in args]))
            return {}
        return NotImplemented

    def _em_cursor(self, sql, cursor_bind, b):
        if sql == Q.SQL_EX_REMAINDER:
            return _run('select * from ex_remainder where EX_ID = :ex_id order by VAL_ID', {"ex_id": b.get("ex_id")})
        return NotImplemented
