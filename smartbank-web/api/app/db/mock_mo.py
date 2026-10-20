"""Mock for Packages/MemorialOrder (memorialorder.py). The verbatim SQL of MOrdDataModImpl.dfm runs in an in-memory
SQLite database built from fixtures/memorialorder.json; only this module's own texts (mo_sql.SQL_MO_* and the DOA
insert / update / delete on Memorial written by memorialorder.py) are answered here, everything else falls through."""
from __future__ import annotations
import datetime as dt
import json
import os
import sqlite3

from .. import mo_sql as Q
from .. import memorialorder as M
from .base import DBError

_DB = None
DATE_COLS = {"TEK_DAT"}
_OWN_Q = {Q.SQL_MO_CURRENCYSDATA, Q.SQL_MO_BRANCHES, Q.SQL_MO_BANKINFO, Q.SQL_MO_MEMORIAL, Q.SQL_MO_SYSDAT, Q.SQL_MO_USERS}
_OWN_X = {M.SQL_INS, M.SQL_UPD, M.SQL_DEL}


def reset():
    global _DB
    _DB = None


def _db():
    global _DB
    if _DB is None:
        from ..config import settings
        D = json.load(open(os.path.join(settings.mock_fixtures, "memorialorder.json"), encoding="utf-8"))
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


def _run(sql, binds=None):
    cur = _db().execute(sql, binds or {})
    names = [d[0].upper().strip('"') for d in cur.description]
    out = []
    for t in cur.fetchall():
        r = {}
        for n, v in zip(names, t):
            if n in DATE_COLS and isinstance(v, str):
                v = dt.datetime.fromisoformat(v)
            r[n] = str(v) if n == "ROWID" else v
        out.append(r)
    return out


class MoMixin:
    def _mo_query(self, sql, b):
        if sql in _OWN_Q:
            return _run(sql, b)
        return NotImplemented

    def _mo_execute(self, sql, b):
        if sql not in _OWN_X:
            return False
        b = dict(b)
        if "RID" in b:
            try:
                b["RID"] = int(b["RID"])
            except (TypeError, ValueError):
                raise DBError("ORA-01410: invalid ROWID", 1410)
        cur = _db().execute(sql, b)
        if sql != M.SQL_INS and cur.rowcount == 0:
            raise DBError("ORA-01403: no data found", 1403)
        return True

    def _mo_commit(self):
        if _DB is not None:
            _DB.commit()

    def _mo_rollback(self):
        if _DB is not None:
            _DB.rollback()
