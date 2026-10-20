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
from .. import dep_contract_sql as QC
from .base import DBError

_DB = None
DATE_COLS = {"OPENDATE", "CLOSEDATE", "PROLONGATIONDATE", "STOPCALCDATE", "HDATE", "FIRSTINTERESTPAYDAT", "DATEOFCONCLUSION",
             "DUEDATEFIRSTCONTRACT", "OPENDAT", "CLOSE_DAT"}
_SEQ: dict = {}
_LAST: dict = {}


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
        c.create_function("nvl", 2, lambda a, b: b if a is None else a)
        _SEQ.clear(); _SEQ.update(D.get("_seq", {})); _LAST.clear()
        schema = D.get("_schema", {})
        for t, rows in D.items():
            if t.startswith("_"):
                continue
            cols = list(dict.fromkeys(k for r in rows for k in r)) or schema.get(t) or ["ID"]
            c.execute(f'create table "{t}" ({", ".join(chr(34) + k + chr(34) for k in cols)})')
            for r in rows:
                c.execute(f'insert into "{t}" ({", ".join(chr(34) + k + chr(34) for k in r)}) values ({", ".join("?" * len(r))})', list(r.values()))
        c.commit()
        _DB = c
    return _DB


def _sqlite(sql: str) -> str:
    s = sql.replace("dm_stored_programs.getcustomername(", "dm_stored_programs_getcustomername(")
    s = s.replace("smart.user$", "user$").replace("user$", '"user$"')
    s = re.sub(r"\b(sid|id|type)#", r'"\1#"', s)
    return s


_MAIN = re.compile(re.escape(Q.SQL_DMDATASET.split("order by :OrderField")[0]) + r"order by (cont\.id|\w+ (?:ASC|DESC))     \Z", re.S)
_OWN = {Q.SQL_DM_TYPES, Q.SQL_DM_CATEGORIES, Q.SQL_DM_PERSONS, Q.SQL_USERS, Q.SQL_DM_TRANCHES, Q.SQL_FILIALS, Q.SQL_VALUTES}
_OWN |= {v for k, v in vars(QC).items() if k.startswith("SQL_") and k != "SQL_SEQ_DM_CONTRACTS"}


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
        if sql in _OWN or _MAIN.match(sql):
            return _run(sql, b)
        m = re.fullmatch(r"select (\w+)\.nextval from dual", sql)
        if m and m.group(1).upper() in _SEQ:                  # DOA SequenceField
            _db()
            _SEQ[m.group(1).upper()] += 1
            return [{"NEXTVAL": _SEQ[m.group(1).upper()]}]
        return NotImplemented

    def _dep_contract(self, key, n):
        db = _db()
        cols = {"ID": n["p_ContractID"], "OPENDATE": _bind(n["p_OpenDate"]), "CLOSEDATE": _bind(n["p_CloseDate"]), "AMOUNT": n["p_Amount"],
                "CONTRACTNO": n["p_ContractNo"], "CONTRACTTYPE": n["p_ContractType"], "CLIENTTYPE": n["p_ClientType"],
                "INTEREST": n["p_Percent"], "OVERDUEINTEREST": n["p_OverduePercent"], "DUEINTEREST": n["p_DuePercent"],
                "PERSONALTYPE": n["p_personaltype"], "CURRENCY": n["p_currency"], "BRANCHID": n["p_branchid"],
                "CUSTOMERID": n["p_customerid"], "FIRSTINTERESTPAYDAT": _bind(n["p_stopCalcdate"]), "PERIODID": n["p_PeriodID"],
                "CAPITALPERID": n["p_capitalperid"], "PROLANID": n["p_autopr"], "TOCARD": n["p_tocard"], "AGENTID": n["p_agentid"],
                "PERSONSID": n["p_personsid"], "PRIZEID": n["p_prizeid"], "DEPPERSETID": n["p_deppersetid"], "BONUSSTATUS": n["p_bonusstatus"]}
        if not db.execute("select 1 from customers where id = ?", [cols["CUSTOMERID"]]).fetchone():
            raise DBError("ORA-02291: integrity constraint (DM_CONTRACTS_CUST_FK) violated - parent key not found", 2291)
        _LAST["n"] = n
        if key.endswith("DMADDCONTRACT"):
            u = db.execute('select id from "user$" where name = ?', [self.username]).fetchone()
            cols.update({"sid#": u[0] if u else None, "STATUS": 1})
            for t in ("dm_contracts", "dm_active_contracts"):
                db.execute(f'insert into {t} ({",".join(chr(34) + k + chr(34) for k in cols)}) values ({",".join("?" * len(cols))})', list(cols.values()))
            db.execute('insert into dm_contract_accounts ("id#","CLIENTACCID") values (?, NULL)', [cols["ID"]])
        else:
            cid = cols.pop("ID")
            for t in ("dm_contracts", "dm_active_contracts"):
                db.execute(f'update {t} set {",".join(chr(34) + k + chr(34) + "=?" for k in cols)} where id = ?', list(cols.values()) + [cid])
        return {}

    def _dep_func(self, key, named):
        n = named or {}
        if key == "DM_CONTRACT.GETCONTRACTNO":               # body not in the repo: <type>-<filial>-<seq>[-P<prize>]
            db = _db()
            k = db.execute("select count(*) from dm_contracts where contracttype = ?", [int(n["dtid"])]).fetchone()[0] + 1
            return "DM%s-%s-%04d%s" % (n["dtid"], n["filialid"], k, "-P%s" % n["przid"] if int(n["przid"] or 0) else "")
        if key == "DM_CONTRACT.GETADDACCOUNT":
            _db().execute('insert into dm_contract_accno ("CONTRACTID","P_ID","ACCNO","FIELDNAME","NAMEACCNO") values (?,?,?,?,?)',
                          [n["v_contractid"], n["p_id"], n["v_accno"], n["v_fieldname"], n["v_nameaccno"]])
            return 1
        return NotImplemented

    def _dep_commit(self):
        if _DB is not None:
            _DB.commit()

    def _dep_rollback(self):
        if _DB is not None:
            _DB.rollback()

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
        if key in ("DM_CONTRACT.DMADDCONTRACT", "DM_CONTRACT.DMUPDATECONTRACT"):
            return self._dep_contract(key, n)
        if key == "DM_CONTRACT.DMGENERATEACCOUNTNUMBER":   # assumed: fills dm_accno_columname for the new contract
            db.execute("delete from dm_accno_columname")
            for i, (fld, nm, bal) in enumerate([("CONTRACTACCID", "Depozit hesabı", 2101), ("INTERESTACCID", "Faiz hesabı", 2102),
                                                ("CLIENTACCID", "Müştəri hesabı", 2011)]):
                db.execute('insert into dm_accno_columname ("ID","NAME","CUSTOMERID","NAMEACCNO","ACCNO","OLD_BALCN","NEW_BALCN",'
                           '"VAL_ID","FILIAL","OPENDAT","DEPOSITFIELDACCNO","SIMVOLTYPE") values (?,?,?,?,?,?,?,?,?,?,?,?)',
                           [i + 1, nm, n["CustomerID"], nm, "%d%03d%s%07d" % (bal, int(n["Valid"]) % 1000, n["Filialid"], int(n["contractid"])),
                            bal, bal, n["Valid"], n["Filialid"], _bind(n["begindat"]), fld, 0])
            return {}
        return NotImplemented
