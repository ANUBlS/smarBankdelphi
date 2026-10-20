"""Mock for the rate modules: Packages/LastRates (oldrates.py) and Packages/RateDifferenceReport (ratedifferencereport.py).
The verbatim SQL runs in an in-memory SQLite database built from fixtures/rates.json. Only this module's own texts are
answered here (ODSCourses with each grid FieldName as :Title_Order, the ActionRefresh text, the Currency lookup); the
generic texts (Select * From Avalute, Filial, User$) are left to the existing mocks so other modules are unaffected.
SBOP.Get_Date comes from the shared mock (2026-10-12)."""
from __future__ import annotations
import datetime as dt
import json
import os
import sqlite3

from .. import or_sql as A
from .. import rdr_sql as B
from .. import oldrates as O
from .. import ratedifferencereport as R
from ..delphi import subst

_DB = None
DATE_COLS = {"DAT"}
_COURSES = {subst(A.SQL_OR_ODSCOURSES, "Title_Order", t) for t in O.COLS + [O.TITLE_DEFAULT]}
_OWN = _COURSES | {B.SQL_RDR_CURRENCY}


def reset():
    global _DB
    _DB = None


def _db():
    global _DB
    if _DB is None:
        from ..config import settings
        D = json.load(open(os.path.join(settings.mock_fixtures, "rates.json"), encoding="utf-8"))
        c = sqlite3.connect(":memory:", check_same_thread=False)
        for t, rows in D.items():
            cols = list(dict.fromkeys(k for r in rows for k in r)) or ["ID"]
            c.execute(f'create table "{t}" ({", ".join(chr(34) + k + chr(34) for k in cols)})')
            for r in rows:
                c.execute(f'insert into "{t}" ({", ".join(chr(34) + k + chr(34) for k in r)}) values ({", ".join("?" * len(r))})',
                          list(r.values()))
        c.commit()
        _DB = c
    return _DB


def _bind(v):
    if isinstance(v, dt.datetime):
        return v.date().isoformat()
    if isinstance(v, dt.date):
        return v.isoformat()
    return v


def _run(sql, binds=None):
    cur = _db().execute(sql, {k: _bind(v) for k, v in (binds or {}).items()})
    names = [d[0].upper().strip('"') for d in cur.description]
    out = []
    for t in cur.fetchall():
        r = {}
        for n, v in zip(names, t):
            if n in DATE_COLS and isinstance(v, str):
                v = dt.datetime.fromisoformat(v)
            r[n] = v
        out.append(r)
    return out


class RtMixin:
    def _rt_query(self, sql, b):
        if sql in _OWN or sql.startswith(R.REFRESH_HEAD):
            return _run(sql, b)
        return NotImplemented
