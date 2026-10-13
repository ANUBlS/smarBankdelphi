"""Mock for Packages/LVPCSSManager_Turan (XÖHKS). The verbatim Data_Unit.dfm SQL is recognised (otSubst ':title' and the
XS_INCOMINGSUM SQL[6] line may vary) and executed as-is in an in-memory SQLite database built from fixtures/xohks.json, so the
mock checks the real joins / where / order by of the Delphi text. Dialect shims only: Oracle nvl -> SQLite function, the
'uid' pseudo-column -> the mock user's id, 'Dual' is a one-row table, dates are stored as 'YYYY-MM-DD HH:MM:SS' text.
The XS_* tables / views are not in the repo (XS_CONTROL body and DDL missing): columns come from the persistent TFields."""
from __future__ import annotations
import datetime as dt
import json
import os
import re
import sqlite3

from .. import xohks_sql as Q

_DB = None
_PATS = None
DATE_COLS = {"TRANSDATE", "VAL_DATE", "SDATE", "TRANS_DATE"}


def reset():
    global _DB
    _DB = None


def _db():
    global _DB
    if _DB is None:
        from ..config import settings
        D = json.load(open(os.path.join(settings.mock_fixtures, "xohks.json"), encoding="utf-8"))
        c = sqlite3.connect(":memory:", check_same_thread=False)
        c.create_function("nvl", 2, lambda a, b: b if a is None else a)
        c.execute("create table dual (dummy text)")
        c.execute("insert into dual values ('X')")
        for t, rows in D.items():
            if t.startswith("_"):
                continue
            cols = list(dict.fromkeys(k for r in rows for k in r))
            c.execute(f"create table {t} ({', '.join(cols)})")
            for r in rows:
                c.execute(f"insert into {t} ({', '.join(r)}) values ({', '.join('?' * len(r))})", list(r.values()))
        _DB = c
    return _DB


def _pats():
    global _PATS
    if _PATS is None:
        _PATS = []
        for n in dir(Q):
            if n.startswith("LINES_"):
                L = list(getattr(Q, n))
                if n == "LINES_XS_INCOMINGSUM":
                    L[6] = "\x00"
                t = re.escape(Q.text(L)).replace("\x00", ".*")
                t = re.sub(r":(title|Title)\b", ".*", t)
                _PATS.append(re.compile(t + r"\Z", re.S))
    return _PATS


def _v(v):
    if isinstance(v, (dt.datetime, dt.date)):
        return (v if isinstance(v, dt.datetime) else dt.datetime(v.year, v.month, v.day)).strftime("%Y-%m-%d %H:%M:%S")
    return v


class XohksMixin:
    def _xs_query(self, sql, b):
        if not any(p.match(sql) for p in _pats()):
            return NotImplemented
        s = re.sub(r":(\w+)", lambda m: ":" + m.group(1).lower(), sql)
        s = re.sub(r"\buid\b", ":uid__", s)
        params = {k.lower(): _v(v) for k, v in (b or {}).items()}
        if ":uid__" in s:
            params["uid__"] = self.user.get("user_id", 0)
        cur = _db().execute(s, params)
        names = [d[0].upper() for d in cur.description]
        out = []
        for r in cur.fetchall():
            o = {}
            for k, v in zip(names, r):
                if k in DATE_COLS and isinstance(v, str):
                    v = dt.datetime.fromisoformat(v)
                o[k] = v
            out.append(o)
        return out
