"""Mock for Packages/Order (order.py). The verbatim SQL of OrderDataModuleUnit.dfm runs in an in-memory SQLite database
built from fixtures/order.json; only this module's own texts (ord_sql.SQL_ORD_*) are answered here."""
from __future__ import annotations
import json
import os
import sqlite3

from .. import ord_sql as Q

_DB = None
_OWN = {Q.SQL_ORD_SYSDAT, Q.SQL_ORD_CURRENCYDATA, Q.SQL_ORD_CONTRACTACCS, Q.SQL_ORD_CLIENTACCS, Q.SQL_ORD_RESERVEACCS,
        Q.SQL_ORD_BANKINFODATA}


def reset():
    global _DB
    _DB = None


def _db():
    global _DB
    if _DB is None:
        from ..config import settings
        D = json.load(open(os.path.join(settings.mock_fixtures, "order.json"), encoding="utf-8"))
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


class OrdMixin:
    def _ord_query(self, sql, b):
        if sql not in _OWN:
            return NotImplemented
        cur = _db().execute(sql, b or {})
        names = [d[0].upper() for d in cur.description]
        return [dict(zip(names, t)) for t in cur.fetchall()]
