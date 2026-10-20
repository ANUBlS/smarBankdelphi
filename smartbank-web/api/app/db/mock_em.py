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
import re
import sqlite3
from decimal import Decimal, ROUND_HALF_UP

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
_ACC_FN = {"EXCH_MGR.GET_PURCHASE_NO": "PURCHASE_ACC_ID", "EXCH_MGR.GET_SELLING_NO": "SELLING_ACC_ID",
           "EXCH_MGR.GET_CASH_ACC_NO": "CASH_ACC_ID", "EXCH_MGR.GET_PUR_ACC_NO": "PUR_ACC_ID"}


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

    def _em_func(self, key, args, named=None):
        if not key.startswith(("SBOP.GET_DATE", "EXCH_MGR.")):
            return NotImplemented
        D = _db()[1]
        n = named or {}
        if key == "SBOP.GET_DATE":
            return dt.datetime.fromisoformat(D["sbop_date"])
        if key == "EXCH_MGR.LASTWORKDAY_CALENDAR":
            d = args[0].date() - dt.timedelta(days=1)
            while d.isoformat() in D["calendar"]:
                d -= dt.timedelta(days=1)
            return dt.datetime(d.year, d.month, d.day)
        if key == "EXCH_MGR.EX_DATE_CHANGE":
            return D["ex_date_change"]
        if key == "EXCH_MGR.USERID":                      # ASSUMED: the user's USR_ID
            return 11
        if key == "EXCH_MGR.ROUNDNEW":                    # ASSUMED: half-up to 2 decimals
            return float(Decimal(repr(float(args[0]))).quantize(Decimal("0.01"), rounding=ROUND_HALF_UP))
        if key in _ACC_FN:                               # ASSUMED: the ex_accounts *_ACC_ID of (ex_id, val_id), as text
            r = _run("select * from ex_accounts where EX_ID = :e and VAL_ID = :v", {"e": args[0], "v": args[1]})
            return None if not r or r[0][_ACC_FN[key]] is None else str(r[0][_ACC_FN[key]])
        if key == "EXCH_MGR.ADD_EX_PROV_TRANS":          # ASSUMED: inserts the ex_provarch row, returns its id
            CALLS.append((key, dict(n)))
            c = _db()[0]
            nid = (c.execute("select max(ID) from ex_provarch").fetchone()[0] or 0) + 1
            rec = {"ID": nid, "EX_ID": n["ex_id"], "DAT": _bind(n["trans_date"]), "STATUS": n["status"], "CASHLESS": n.get("PCashless", 0),
                   "VAL_ID": n["val_id"], "VAL_NAME": n["val_name"], "DEBITAMOUNT": n["debit_amount"], "VAL_CHANGED_NAME": n["val_changed_name"],
                   "VAL_CHANGED_ID": n["val_changed_id"], "VAL_CHANGED_COURSE": n["val_changed_course"], "LAMOUNT": n["l_amount"],
                   "FEE_AMOUNT": n["fee_amount"], "OP_COURSE": n["val_course"], "VAL_NB_COURSE": n["val_nb_course"],
                   "TRANS_CLOSE": n.get("trans_close", 0), "OPER_NAME": n["trans_name"], "SESSIONNAME": n["SessionName"],
                   "OPERATOR_ID": n["operator_id"], "OP_TIME": _bind(n["op_time"]), "CUST_NAME": n["cust_name"],
                   "CUST_LNAME": n["cust_lname"], "CUST_FATHER": n["cust_father"], "CUST_PASSPORT": n["cust_passport"],
                   "CUST_DATE": _bind(n["cust_date"]), "CUST_CONFIRM": n["cust_confirm"], "CUST_GIVING_MEMBER": n["cust_giving_member"],
                   "CUST_COUNTRY": n["cust_country"], "COUNTRY": n["country"]}
            c.execute(f"insert into ex_provarch ({', '.join(rec)}) values ({', '.join(':' + k for k in rec)})", rec)
            return nid
        return NotImplemented

    def _em_bool(self, key, args):
        if key == "EXCH_MGR.EX_CALENDAR":
            return _bind(args[0]) in _db()[1]["calendar"]
        return NotImplemented

    def _em_proc(self, key, args, named=None):
        if key in ("EXCH_MGR.NEXTRESURS", "EXCH_MGR.EX_REMAINDERPROV_CHANGE", "EXCH_MGR.EX_REMAINDERLAZ_CHANGE",
                   "EXCH_MGR.CALCULATE_REMAINDER"):
            CALLS.append((key, [_bind(a) for a in args]))
            return {}
        if key == "EXCH_MGR.EX_CONSTANTS_ADD":            # ASSUMED: one ex_constants row per customer
            n = {k: _bind(v) for k, v in (named or {}).items()}
            CALLS.append((key, n))
            if n.get("a_cust_name"):
                _db()[0].execute("insert into ex_constants (EX_ID, CUST_NAME, CUST_LNAME, CUST_FATHER, CUST_PASSPORT, CUST_DATE, CUST_CONFIRM, "
                                 "CUST_GIVING_MEMBER, CUST_COUNTRY, COUNTRY) values (?,?,?,?,?,?,?,?,?,?)",
                                 [n["a_ex_id"], n["a_cust_name"], n["a_cust_lname"], n["a_cust_father"], n["a_cust_passport"], n["a_cust_date"],
                                  n["a_cust_confirm"], n["a_cust_giving_member"], n["a_cust_country"], n["a_country"]])
            return {}
        if key == "EXCH_MGR.EX_PROVARCH_DELETE":          # ASSUMED: (status, id) -> the row leaves ex_provarch
            CALLS.append((key, list(args)))
            _db()[0].execute("delete from ex_provarch where ID = ?", [args[1]])
            return {}
        return NotImplemented

    def _em_plsql(self, sql, b):
        m = re.fullmatch(r"begin :r := EXCH_TRANS\.(ex_transaction|ex_transaction_additional)\((.*)\); end;", sql)
        if not m:
            return NotImplemented
        flag = "true" in m.group(2).split(", ")
        CALLS.append(("EXCH_TRANS." + m.group(1).upper(), [_bind(b[f"p{i}"]) for i in range(14)], flag))
        _db()[0].execute("update ex_provarch set TRANS_CLOSE = 1 where ID = ?", [b["p0"]])   # ASSUMED: posted -> trans_close = 1
        return 1

    def _em_execute(self, sql, b):
        return False

    def _em_commit(self):
        if _DB is not None:
            if _DB[0].in_transaction:
                CALLS.append(("COMMIT",))
            _DB[0].commit()

    def _em_rollback(self):
        if _DB is not None:
            if _DB[0].in_transaction:
                CALLS.append(("ROLLBACK",))
            _DB[0].rollback()

    def _em_cursor(self, sql, cursor_bind, b):
        if sql == Q.SQL_EX_REMAINDER:
            return _run('select * from ex_remainder where EX_ID = :ex_id order by VAL_ID', {"ex_id": b.get("ex_id")})
        return NotImplemented
