"""Mock for Packages/Exchange (exchange.py). The verbatim SQL of ex_sql.py runs in an in-memory SQLite database built
from fixtures/exchange.json (dialect shim: decode() registered as a function, 'rownum rN' -> row_number() over ()).
SB_Exchange bodies follow SQL_credit/sm_p.sql:42408-42518. ASSUMED (not in the repo): exchanges.ID filled by a
trigger/sequence (max+1 here); excaccount unique on (exchangeID, accountID) (ORA-00001) and accountID referencing
account.ID (ORA-02291) - which is what the Delphi 'The accounts are repeating!' message hints at; SB_MTOUTVIEW.GetBankDay
= SYSDAT.TEK_DAT; exchange / convertation are views in the bank DB, plain tables here."""
from __future__ import annotations
import datetime as dt
import json
import os
import re
import sqlite3

from .. import ex_sql as Q
from .. import exchange as EX
from .base import DBError

_DB = None
DATE_COLS = {"DAT"}


def reset():
    global _DB
    _DB = None


def _decode(*a):
    v, rest = a[0], list(a[1:])
    while len(rest) >= 2:
        k, r = rest.pop(0), rest.pop(0)
        if v == k:
            return r
    return rest[0] if rest else None


def _db():
    global _DB
    if _DB is None:
        from ..config import settings
        D = json.load(open(os.path.join(settings.mock_fixtures, "exchange.json"), encoding="utf-8"))
        c = sqlite3.connect(":memory:", check_same_thread=False)
        c.create_function("decode", -1, _decode)
        for t, rows in D.items():
            cols = list(dict.fromkeys(k for r in rows for k in r)) or ["ID"]
            c.execute(f'create table "{t}" ({", ".join(chr(34) + k + chr(34) for k in cols)})')
            for r in rows:
                c.execute(f'insert into "{t}" ({", ".join(chr(34) + k + chr(34) for k in r)}) values ({", ".join("?" * len(r))})',
                          list(r.values()))
        c.commit()
        _DB = c
    return _DB


def _sqlite(sql: str) -> str:
    return re.sub(r"\brownum\s+(r\d)\b", r"row_number() over () \1", sql, flags=re.I)


def _bind(v):
    if isinstance(v, dt.datetime):
        return v.date().isoformat()
    if isinstance(v, dt.date):
        return v.isoformat()
    return v


def _run(sql, binds=None):
    cur = _db().execute(_sqlite(sql), {k: _bind(v) for k, v in (binds or {}).items()})
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


_OWN = {Q.SQL_EX_FORMONEY, Q.SQL_EX_EXACCOUNT, Q.SQL_EX_TAKEACCOUNTID, Q.SQL_EX_VIEWGRID, Q.SQL_EX_GRID2, Q.SQL_EX_ODSTOOLING,
        Q.SQL_EX_ODSBANKCODE, Q.SQL_EX_EXCHANGE, Q.SQL_EX_TOTALEXCHANGEREPORT, Q.SQL_EX_ODSCONVERTATION, Q.SQL_EX_FULLEXCEL,
        Q.SQL_EX_CONVERTATION}


def _num(v):
    if v is None:
        return None
    try:
        f = float(str(v).replace(",", "."))
    except ValueError:
        raise DBError("ORA-01722: invalid number", 1722)
    return int(f) if f == int(f) else f


class ExMixin:
    def _ex_query(self, sql, b):
        if sql in _OWN:
            return _run(sql, b)
        return NotImplemented

    def _ex_func(self, key, args):
        if key == "SB_MTOUTVIEW.GETBANKDAY":
            return dt.datetime.fromisoformat(self.st["sys"]["tek_dat"])
        if key == "SB_EXCHANGE.GENERATEFILENAME":
            nb = _db().execute("select VAL_MOV from bankinfo").fetchone()
            if nb is None:
                raise DBError("ORA-01403: no data found", 1403)
            return "$MB" + str(nb[0]) + ("01." if int(args[0]) <= 15 else "02.") + "dbf"
        return NotImplemented

    def _ex_proc(self, key, args):
        db = _db()
        if key == "SB_EXCHANGE.ADD_EXCHANGES":
            name, exnum = args
            nid = (db.execute("select max(ID) from exchanges").fetchone()[0] or 0) + 1
            db.execute("insert into exchanges (ID, NAME, EXNUM) values (?,?,?)", [nid, name, _num(exnum)])
            return {}
        if key == "SB_EXCHANGE.UPD_EXCHANGES":
            i, name, exnum = args
            db.execute("update exchanges set NAME = ?, EXNUM = ? where ID = ?", [name, _num(exnum), i])
            db.commit()
            return {}
        if key == "SB_EXCHANGE.DEL_EXCHANGES":
            db.execute("delete from exchanges where ID = ?", [args[0]])
            db.commit()
            return {}
        if key == "SB_EXCHANGE.DEL_ALL_EXCACCOUNT":
            db.execute("delete from excaccount where EXCHANGEID = ?", [args[0]])
            db.commit()
            return {}
        if key in ("SB_EXCHANGE.ADD_EXCACCOUNT", "SB_EXCHANGE.UPD_EXCACCOUNT"):
            ex, acc = args[0], args[1]
            if not db.execute("select 1 from account where ID = ?", [acc]).fetchone():
                raise DBError("ORA-02291: integrity constraint (EXCACCOUNT_ACC_FK) violated - parent key not found", 2291)
            if db.execute("select 1 from excaccount where EXCHANGEID = ? and ACCOUNTID = ?", [ex, acc]).fetchone():
                raise DBError("ORA-00001: unique constraint (EXCACCOUNT_PK) violated", 1)
            if key.endswith("ADD_EXCACCOUNT"):
                db.execute("insert into excaccount (EXCHANGEID, ACCOUNTID) values (?,?)", [ex, acc])
            else:
                db.execute("update excaccount set ACCOUNTID = ? where EXCHANGEID = ? and ACCOUNTID = ?", [acc, ex, args[2]])
                db.commit()
            return {}
        if key == "SB_EXCHANGE.DEL_EXCACCOUNT":
            db.execute("delete from excaccount where EXCHANGEID = ? and ACCOUNTID = ?", [args[0], args[1]])
            db.commit()
            return {}
        return NotImplemented

    def _ex_execute(self, sql, b):
        db = _db()
        if sql == EX.SQL_TOOL_UPDATE:
            db.execute("update setexchange set NAT_BALANCE = ?, FOR_BALANCE = ? where rowid = ?",
                       [b["NAT_BALANCE"], b["FOR_BALANCE"], b["ROWID_"]])
            return True
        if sql == EX.SQL_TOOL_INSERT:
            db.execute("insert into setexchange (NAT_BALANCE, FOR_BALANCE) values (?,?)", [b["NAT_BALANCE"], b["FOR_BALANCE"]])
            return True
        if sql == EX.SQL_TOOL_DELETE:
            db.execute("delete from setexchange where rowid = ?", [b["ROWID_"]])
            return True
        return False

    def _ex_commit(self):
        _db().commit()
