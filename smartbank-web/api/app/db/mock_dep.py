"""Mock for DepositsManager_New (DMDepositManagerImpl_new.dfm). The verbatim SQL of dep_sql.py is recognised and executed in
an in-memory SQLite database built from fixtures/deposits.json. Dialect shims only: user$ / sid# / id# / type# are quoted and
the sbcm_stored_programs_new functions are SQLite functions. The sbcm_*_new DDL and the sbcm_stored_programs_new body are
not in the repo, so the following is assumed: Get_ContractAccount = account.acc_no, Get_ContractAccountName = account.name,
GetpercentCollection = the fixture string (_percent); CloseDeposit zeroes the sbcm_contract_state_new rows and sets
calculationenabled := 0 (ORA-20101 when already closed); IsCalculationEnabled = calculationenabled = 1;
Disable/EnableCalculation set calculationenabled 0 / 1."""
from __future__ import annotations
import datetime as dt
import json
import os
import re
import sqlite3

from .. import dep_sql as Q
from .. import dep_contract_sql as QC
from .base import DBError

_DB = None
_FX: dict = {}
DATE_COLS = {"OPENDATE", "CLOSEDATE", "STOPCALCULATIONDATE", "HDATE", "FIRSTINTERESTPAYDAT", "CLOSE_DAT"}


def reset():
    global _DB
    _DB = None


def _db():
    global _DB
    if _DB is None:
        from ..config import settings
        D = json.load(open(os.path.join(settings.mock_fixtures, "deposits.json"), encoding="utf-8"))
        c = sqlite3.connect(":memory:", check_same_thread=False)
        global _FX
        _FX = D
        pc = D.setdefault("_percent", {})
        acc = lambda col: (lambda i: None if i is None else (c.execute(f"select {col} from account where id = ?", [i]).fetchone() or [None])[0])  # noqa: E731
        c.create_function("sp_get_contractaccount", 1, acc("acc_no"))
        c.create_function("sp_get_contractaccountname", 1, acc("name"))
        c.create_function("sp_getpercentcollection", 1, lambda i: None if i is None else pc.get(str(int(i))))
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


def _fx():
    _db()
    return _FX


def _save_deposit(db, update: bool, n: dict, user: dict):
    """Assumed sbcm_contract_new.NewDeposit / UpdateDeposit body (not in the repo): one row in sbcm_contracts_new (type# 3),
    sbcm_contract_accounts_new, sbcm_overdueinterests_new and (new only) sbcm_contract_state_new; p_Percent becomes the
    GetpercentCollection text. Duplicate contract numbers raise ORA-00001."""
    d = lambda v: None if v is None else v.date().isoformat()  # noqa: E731
    no = n["p_ContractNo"]
    if update:
        cid = int(n["p_ContractID"])
        if db.execute('select 1 from sbcm_contracts_new where contractno = ? and id <> ?', [no, cid]).fetchone():
            raise DBError("ORA-00001: unique constraint (SMART.SBCM_CONTRACTS_NEW_UK) violated", 1)
        if not db.execute('select 1 from sbcm_contracts_new where id = ?', [cid]).fetchone():
            raise DBError("ORA-01403: no data found", 1403)
    else:
        if db.execute('select 1 from sbcm_contracts_new where contractno = ?', [no]).fetchone():
            raise DBError("ORA-00001: unique constraint (SMART.SBCM_CONTRACTS_NEW_UK) violated", 1)
        cid = (db.execute("select max(id) from sbcm_contracts_new").fetchone()[0] or 5000) + 1
        db.execute('insert into sbcm_contracts_new (id, "type#", "sid#") values (?, 3, ?)', [cid, int(user.get("sid", 23) or 23)])
        db.execute('insert into sbcm_contract_accounts_new ("id#") values (?)', [cid])
        db.execute('insert into sbcm_overdueinterests_new ("id#") values (?)', [cid])
        db.execute('insert into sbcm_contract_state_new ("id#", facticaldebt, facticalinterestdebt, calculationenabled) values (?, 0, 0, 1)', [cid])
    db.execute("""update sbcm_contracts_new set contractno=?, opendate=?, closedate=?, amount=?, currency=?, personaltype=?,
                  clienttype=?, branchid=?, contracttype=?, customerid=?, autopr=?, periodid=?, capitalperid=?, firstinterestpaydat=?
                  where id=?""", [no, d(n["p_OpenDate"]), d(n["p_CloseDate"]), n["p_Amount"], n["p_currency"], n["p_personaltype"],
                                  n["p_ClientType"], n["p_branchid"], n["p_ContractType"], n["p_customerid"], n["p_autopr"],
                                  n["p_PeriodID"], n["p_capitalperid"], d(n["p_stopCalcdate"]), cid])
    db.execute("""update sbcm_contract_accounts_new set contractaccid=?, clientaccid=?, interestaccid=?, booroweraccid=?,
                  befo_interestpeytaccid=? where "id#"=?""", [n["p_ContractAccID"], n["p_ClientAccID"], n["p_InterestAccID"],
                                                             n["p_BoorowerAccID"], n["p_BEFO_INTERESTPEYTACCID"] or None, cid])
    db.execute('update sbcm_overdueinterests_new set overdueinterest=?, dueinterest=? where "id#"=?',
               [n["p_OverduePercent"], n["p_DuePercent"], cid])
    _FX["_percent"][str(cid)] = n["p_Percent"]
    return {}


def _sqlite(sql: str) -> str:
    s = re.sub(r"sbcm_stored_programs_new\.(Get_ContractAccountName|Get_ContractAccount|GetpercentCollection)\(",
               lambda m: "sp_" + m.group(1).lower() + "(", sql)
    s = s.replace("user$", '"user$"')
    return re.sub(r"\b(sid|id|type)#", r'"\1#"', s)


_MAIN = Q.SQL_DEPOSITSDATA.replace(":OrderField", "cont.id")
_OWN = {Q.SQL_VALUTES, Q.SQL_FILIALS, Q.SQL_DEPOSITTYPES, Q.SQL_CATEGORIES, Q.SQL_PERSONS, Q.SQL_USERS, Q.SQL_TRANCHES, _MAIN}
_OWN |= {v for k, v in vars(QC).items() if k.startswith("SQL_")}                # SBDM_Contract_new


def _bind(v):
    if isinstance(v, dt.datetime):
        return v.date().isoformat() if v.time() == dt.time() else v.isoformat()
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


class DepMixin:
    def _dep_query(self, sql, b):
        if sql in _OWN:
            return _run(sql, b)
        return NotImplemented

    def _dep_func(self, key, named):
        n = named or {}
        if key == "SBCM_CONTRACT_NEW.GETPERIOD":          # assumed: whole months between bdat and edat
            b, e = n["bdat"], n["edat"]
            if b is None or e is None:
                return 0
            return (e.year - b.year) * 12 + e.month - b.month - (1 if e.day < b.day else 0)
        return NotImplemented

    def _dep_plsql(self, sql, binds):
        if "sbcm_contract_new.Get_DefaultContractRate(" in sql:   # assumed: fixture _rates[depid] = [int, untimely, due]
            rates = _fx().get("_rates", {}).get(str(int(binds["p_DepositType"])))
            if rates is None:
                return None
            if "p_defint => true" in sql:
                return float(rates[0])
            return float(rates[1] if "p_defUntimeint => true" in sql else rates[2])
        return NotImplemented

    def _dep_commit(self):
        if _DB is not None:
            _DB.commit()

    def _dep_rollback(self):
        if _DB is not None:
            _DB.rollback()

    def _dep_bool(self, key, named):
        if key == "SBCM_CONTRACT_NEW.CHECK_BANKACCOUNT":
            n = named or {}
            k = [int(n["p_categoryID"]), int(n["p_currencyID"]), int(n["p_BranchID"])]
            return k not in _fx().get("_bankacc_missing", [])
        if key == "SBCM_STORED_PROGRAMS_NEW.ISCALCULATIONENABLED":
            r = _db().execute('select max(calculationenabled) from sbcm_contract_state_new where "id#" = ?',
                              [int((named or {})["ContractID"])]).fetchone()
            if r is None or r[0] is None:
                raise DBError("ORA-01403: no data found", 1403)
            return r[0] == 1
        return NotImplemented

    def _dep_proc(self, key, named):
        n = named or {}
        db = _db()
        if key == "SBCM_STORED_PROGRAMS_NEW.CLOSEDEPOSIT":
            cid = int(n["ContractID"])
            r = db.execute('select sum(facticaldebt), max(calculationenabled) from sbcm_contract_state_new where "id#" = ?', [cid]).fetchone()
            if r is None or r[0] is None or (not r[0] and not r[1]):
                raise DBError("ORA-20101: mock: deposit is already closed", 20101)
            db.execute('update sbcm_contract_state_new set facticaldebt = 0, facticalinterestdebt = 0, calculationenabled = 0 where "id#" = ?', [cid])
            return {}
        if key in ("SBCM_STORED_PROGRAMS_NEW.DISABLECALCULATION", "SBCM_STORED_PROGRAMS_NEW.ENABLECALCULATION"):
            db.execute('update sbcm_contract_state_new set calculationenabled = ? where "id#" = ?',
                       [0 if key.endswith("DISABLECALCULATION") else 1, int(n["ContractID"])])
            return {}
        if key in ("SBCM_CONTRACT_NEW.NEWDEPOSIT", "SBCM_CONTRACT_NEW.UPDATEDEPOSIT"):
            return _save_deposit(db, key.endswith("UPDATEDEPOSIT"), n, getattr(self, "user", {}) or {})
        return NotImplemented
