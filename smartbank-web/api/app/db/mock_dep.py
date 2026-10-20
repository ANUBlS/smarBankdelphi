"""Mock for NewDepositsManager (NewDepositDataModule.dfm). The verbatim SQL of dep_sql.py is recognised and executed in an
in-memory SQLite database built from fixtures/deposits.json. Dialect shims only: user$ / sid# / id# are quoted,
dm_stored_programs.getcustomername is an SQLite function. The dm_* DDL and the dm_stored_programs body are not in the repo:
dm_active_contracts is a table holding the open contracts; CloseDeposit removes the row (dm_contracts.status := 0);
IsCalculationEnabled = stopcalcdate is null; Disable/EnableCalculation set/clear stopcalcdate (bank date). All assumed."""
from __future__ import annotations
import datetime as dt
import json
import os
import re
import sqlite3

from .. import dep_sql as Q
from .base import DBError

_DB = None
DATE_COLS = {"OPENDATE", "CLOSEDATE", "PROLONGATIONDATE", "STOPCALCDATE", "HDATE"}


def reset():
    global _DB
    _DB = None


def _db():
    global _DB
    if _DB is None:
        from ..config import settings
        D = json.load(open(os.path.join(settings.mock_fixtures, "deposits.json"), encoding="utf-8"))
        c = sqlite3.connect(":memory:", check_same_thread=False)
        cust = D.get("_customers", {})
        c.create_function("dm_stored_programs_getcustomername", 1, lambda i: None if i is None else cust.get(str(int(i))))
        for t, rows in D.items():
            if t.startswith("_"):
                continue
            cols = list(dict.fromkeys(k for r in rows for k in r)) or ["ID"]
            c.execute(f'create table "{t}" ({", ".join(chr(34) + k + chr(34) for k in cols)})')
            for r in rows:
                c.execute(f'insert into "{t}" ({", ".join(chr(34) + k + chr(34) for k in r)}) values ({", ".join("?" * len(r))})', list(r.values()))
        c.commit()
        _DB = c
    return _DB


def _sqlite(sql: str) -> str:
    s = sql.replace("dm_stored_programs.getcustomername(", "dm_stored_programs_getcustomername(")
    s = s.replace("user$", '"user$"')
    s = re.sub(r"\b(sid|id)#", r'"\1#"', s)
    return s


_MAIN = re.compile(re.escape(Q.SQL_DMDATASET.split("order by :OrderField")[0]) + r"order by (cont\.id|\w+ (?:ASC|DESC))     \Z", re.S)
_OWN = {Q.SQL_DM_TYPES, Q.SQL_DM_CATEGORIES, Q.SQL_DM_PERSONS, Q.SQL_USERS, Q.SQL_DM_TRANCHES, Q.SQL_FILIALS, Q.SQL_VALUTES}


def _run(sql, binds=None):
    cur = _db().execute(_sqlite(sql), {k: v for k, v in (binds or {}).items()})
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


class DepMixin:
    def _dep_query(self, sql, b):
        if sql in _OWN or _MAIN.match(sql):
            return _run(sql, b)
        return NotImplemented

    def _dep_bool(self, key, named):
        if key == "DM_STORED_PROGRAMS.ISCALCULATIONENABLED":
            r = _db().execute("select stopcalcdate from dm_active_contracts where id = ?", [int((named or {})["ContractID"])]).fetchone()
            if r is None:
                raise DBError("ORA-01403: no data found", 1403)
            return r[0] is None
        return NotImplemented

    def _dep_proc(self, key, named):
        n = named or {}
        db = _db()
        if key == "DM_STORED_PROGRAMS.CLOSEDEPOSIT":
            cid = int(n["ContractID"])
            if db.execute("delete from dm_active_contracts where id = ?", [cid]).rowcount == 0:
                raise DBError("ORA-20101: mock: deposit is not active", 20101)
            db.execute("update dm_contracts set status = 0 where id = ?", [cid])
            return {}
        if key in ("DM_STORED_PROGRAMS.DISABLECALCULATION", "DM_STORED_PROGRAMS.ENABLECALCULATION"):
            cid = int(n["ContractID"])
            v = self.st["sys"]["tek_dat"][:10] + "T00:00:00" if key.endswith("DISABLECALCULATION") else None
            for t in ("dm_active_contracts", "dm_contracts"):
                db.execute(f"update {t} set stopcalcdate = ? where id = ?", [v, cid])
            return {}
        return NotImplemented
