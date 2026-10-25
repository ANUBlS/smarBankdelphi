"""Mock for Packages/CurrencyPosition (currencyposition.py). The SQL built by cp_sql.py runs in an in-memory SQLite
database made from fixtures/currencyposition.json. sb_currencyposition bodies follow
Packages/PACKAGES/SB_CURRENCYPOSITION.sql: Get_CurrencyPosition (re)creates USER.CurrencyPosition_USER and commits,
DataChecking (re)creates USER.CPSUM_USER with the package's own INSERT ... SELECT (run here as written, the
Oracle-only 'USER.' prefix dropped and the LIMIT column quoted for SQLite) and commits. ASSUMED: the
Account/Archost/BAL_SPRn aggregation with SB_BALANCE.SALDOTOACTIVE/PASSIVE (and the OUT_* copy) is replaced by
fixture rows (cp_source); SB_CAPITAL.calculate_capumhes = fixture 'capumhes' (0 when the date is missing).

TfrmCapital ('Kapital', cp_capital.py): the ds_capital / ds_capital_out texts run as written except the Oracle '(+)'
outer join, rewritten to LEFT JOIN for SQLite (and 'order by id' qualified); SB_CAPITAL.cap_insert / cap_delete follow the package bodies
(sm_p.sql:38368-38381: insert ... values (0, ..., decode(x,0,null,x) ...) / delete where id; both commit). ASSUMED:
the ID trigger behind 'values (0,' (mock: max(ID)+1) and the calculate_* results (fixture 'cap_calc', 0 when missing;
calculate_capumhes keeps 'capumhes')."""
from __future__ import annotations
import datetime as dt
import json
import os
import re
import sqlite3

from .. import cp_sql as Q
from .base import DBError

_DB = None
DATE_COLS = {"PRESENTDATE", "DAT", "OPEN_DAT", "CLOSE_DAT"}


def reset():
    global _DB
    _DB = None


def _db():
    global _DB
    if _DB is None:
        from ..config import settings
        D = json.load(open(os.path.join(settings.mock_fixtures, "currencyposition.json"), encoding="utf-8"))
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


def _exists(name):
    return _db().execute("select 1 from sqlite_master where type='table' and lower(name)=lower(?)", [name]).fetchone()


def _run(sql, binds=None):
    m = re.search(r"\b(CurrencyPosition_\w+|CPSUM_\w+)", sql)
    if m and not _exists(m.group(1)):
        raise DBError("ORA-00942: table or view does not exist", 942)
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


_OWN = {Q.SQL_CP_ODSCURRENCY, Q.SQL_CP_BANKINFO, Q.SQL_CP_ODSFILLFILE, Q.SQL_CP_ODSSVM, Q.SQL_CP_TUNING_BANKINFO,
        Q.SQL_CAP_ACCOUNT, Q.SQL_CAP_ACCOUNT_OUT, Q.SQL_CAP_ADI_DFM, Q.SQL_CAP_ADI_4, Q.SQL_CAP_ADI_5, Q.SQL_CAP_ODS1_DFM,
        Q.SQL_CAP_ODS1_6, Q.SQL_CAP_ODS2, Q.SQL_CAP_ODS3, Q.SQL_CAP_ODS4}
_OUTER = ("\n  where cap.acc=ac.id (+)", " left join {t} ac on cap.acc=ac.id")


def _outer_join(sql):
    """ds_capital / ds_capital_out: 'FROM capital cap,<T> ac where cap.acc=ac.id (+)' -> LEFT JOIN (SQLite)."""
    for t in ("account", "CAPITAL_ACC_OUT"):
        sql = sql.replace("FROM capital cap," + t + " ac" + _OUTER[0], "FROM capital cap" + _OUTER[1].format(t=t))
    # Oracle resolves ORDER BY id to the select-list column; SQLite calls it ambiguous (cap.id / ac.id)
    return sql.replace("\n order by id", "\n order by cap.id")
_DYN = re.compile(r"\bFrom\s+(CurrencyPosition_|CPSUM_)", re.I)
_UPD = re.compile(r"^update BankInfo set ((?:\w+ = :\w+(?:, )?)+) where rowid = :ROWID_$")


class CpMixin:
    def _cp_user(self):
        return self.username.upper()

    def _cp_query(self, sql, b):
        if sql in _OWN or _DYN.search(sql):
            return _run(sql, b)
        if sql.startswith(Q.CAP_LINES[0] + "\n"):
            return _run(_outer_join(sql), b)
        return NotImplemented

    def _cp_func(self, key, args):
        if key == "SB_CURRENCYPOSITION.GETUSERNAME":
            return self._cp_user()
        if key == "SB_CURRENCYPOSITION.GETBANKDAY":
            return dt.datetime.fromisoformat(_db().execute("select TEK_DAT from sysdat").fetchone()[0])
        if key == "SB_CAPITAL.CALCULATE_CAPUMHES":
            r = _db().execute("select CAPITAL from capumhes where DAT = ?", [_bind(args[0])]).fetchone()
            return float(r[0]) if r else 0.0
        if key == "SB_CAPITAL.GETDATE":                                     # select tek_dat into Dum from sysdat
            return dt.datetime.fromisoformat(_db().execute("select TEK_DAT from sysdat").fetchone()[0])
        if key.startswith("SB_CAPITAL.CALCULATE_"):
            r = _db().execute("select VALUE from cap_calc where FN = ? and DAT = ?", [key[11:], _bind(args[0])]).fetchone()
            return float(r[0]) if r else 0.0
        return NotImplemented

    def _cp_proc(self, key, args):
        db = _db()
        u = self._cp_user()
        if key == "SB_CURRENCYPOSITION.GET_CURRENCYPOSITION":
            fdate, ldate, btype = _bind(args[0]), _bind(args[1]), int(args[2])
            t = Q.table_name(u)
            if _exists(t):                                                  # CreateTable: Drop Table if it exists
                db.execute(f"drop table {t}")
            db.execute(f'create table {t} (BankID, ShortName, "Using", PresentDate, Currency, Offical, Balance, '
                       'Incoming, Active, Passive, Rate, Extra)')
            d_off, d_used = db.execute('select OFFICAL, "USING" from avalute where VALUTE = 0').fetchone()
            bank = db.execute("select VAL_MOV from bankinfo").fetchone()[0]
            days = [r[0] for r in db.execute("select distinct DAT from operkurs where DAT >= ? and DAT <= ?", [fdate, ldate])]
            for day in days:
                for cur, off, used, short in db.execute('select VALUTE, OFFICAL, "USING", VAL_NAME from avalute').fetchall():
                    rr = db.execute("select OSTAT from operkurs where DAT = ? and VAL_KOD = ?", [day, cur]).fetchone()
                    if rr is None:
                        continue
                    for s in db.execute("select BALANCE, INCOMING, ACTIVE, PASSIVE, POK_ACTIVE, POK_PASSIVE from cp_source "
                                        "where DAT = ? and PLAN = ? and CURRENCY = ?", [day, btype, cur]).fetchall():
                        db.execute(f"insert into {t} values (?,?,?,?,?,?,?,?,?,?,?,0)",
                                   [bank, short, used, day, cur, off, s[0], s[1], s[2], s[3], rr[0]])
                        if cur != 0:
                            db.execute(f"insert into {t} values (?,'AZM',?,?,0,?,?,?,?,?,1,0)",
                                       [bank, d_used, day, d_off, s[0], s[1], s[4], s[5]])
            db.execute(f"Delete From {t} Where Active=0 And Passive=0")
            db.commit()
            return {}
        if key == "SB_CAPITAL.CAP_INSERT":
            a = list(args) + [1] * (8 - len(args))                          # in_bal_type default 1
            z = lambda v: None if v == 0 else v                              # decode(x,0,null,x)
            nid = (db.execute("select max(ID) from capital").fetchone()[0] or 0) + 1
            db.execute('insert into capital (ID, TYPE, BAL, ACC, SUM, PERCENT, FORMULA, OP_TYPE, BAL_TYPE) '
                       'values (?,?,?,?,?,?,?,?,?)', [nid, a[0], z(a[1]), z(a[2]), z(a[3]), z(a[4]), a[5] or None, a[6], a[7]])
            db.commit()
            return {}
        if key == "SB_CAPITAL.CAP_DELETE":
            db.execute("delete from capital where id=?", [args[0]])
            db.commit()
            return {}
        if key == "SB_CURRENCYPOSITION.DATACHECKING":
            adate = _bind(args[0])
            r = db.execute("select OSTAT from operkurs where DAT = ? and VAL_KOD = 1", [adate]).fetchone()
            if r is None:
                raise DBError("ORA-01403: no data found", 1403)
            svm = db.execute("select SVM from bankinfo").fetchone()[0]
            pok = round(svm * r[0])
            main, tbl = "CPSUM_" + u, Q.table_name(u)
            if _exists(main):
                db.execute(f"drop table {main}")
            db.execute(f'create table {main} (ShortName, Currency, Rate, Actives, Pok_Actives, Passives, Pok_Passives, "Limit")')
            if not _exists(tbl):
                raise DBError("ORA-00942: table or view does not exist", 942)
            sql = _DATACHECKING_INSERT.replace("<MAIN>", main).replace("<TBL>", tbl)
            db.execute(sql, {"ADate": adate})
            db.execute(f"Update {main} Set Passives=Passives+{svm},Pok_Passives=Pok_Passives+{pok} Where Currency=1")
            db.commit()
            return {}
        return NotImplemented

    def _cp_execute(self, sql, b):
        if sql == Q.SQL_CAP_FORMULA_UPDATE:
            _db().execute("update capital set FORMULA = ? where rowid = ?", [b["FORMULA"], int(b["ROWID_"])])
            return True
        m = _UPD.match(sql)
        if not m:
            return False
        cols = re.findall(r"(\w+) = :", m.group(1))
        _db().execute(f"update bankinfo set {', '.join(c + ' = ?' for c in cols)} where rowid = ?",
                      [b[c] for c in cols] + [b["ROWID_"]])
        return True

    def _cp_commit(self):
        _db().commit()


# SB_CURRENCYPOSITION.DataChecking QueryStr (SB_CURRENCYPOSITION.sql:300-347), '"Limit"' quoted for SQLite
_DATACHECKING_INSERT = """Insert  Into <MAIN>
 Select
 ActiveSet.ShortName as ShortName
,ActiveSet.Currency as Currency
,ActiveSet.Rate  as Rate
,Round(ActiveSet.Actives) as Actives
,Round(ActiveSet.Pok_Actives) as Pok_Actives
,Round(PassiveSet.Passives) as Passives
,Round(PassiveSet.Pok_Passives) as Pok_Passives
,AValute."LIMIT" as  "Limit"
From
(Select
 Currency
,Max(Extra) as Extra
,Max(Shortname) as ShortName
,Max(Rate) as Rate
,Round(Sum(Active)) as Actives
,Round(Sum(Active))*Max(Rate) as Pok_Actives
From <TBL> Where
 Currency<>0 and
 Extra=0 and
 ((Incoming=1)or(Incoming=3)) and
 PresentDate=:ADate
 Group by
 Currency) ActiveSet,
(Select
 Currency
,Max(Shortname) as ShortName
,Max(Rate) as Rate
,Round(Sum(Passive)) as Passives
,Round(Sum(Passive))*Max(Rate) as Pok_Passives
 From <TBL> Where
 Currency<>0 and
 Extra=0 and
 ((Incoming=2)or(Incoming=3)) and
 PresentDate=:ADate
 Group by Currency) PassiveSet
,AValute
 Where
 (ActiveSet.Currency=PassiveSet.Currency)
 and(ActiveSet.Currency=AValute.Valute)"""
