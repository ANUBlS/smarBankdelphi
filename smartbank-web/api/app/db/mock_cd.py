"""Mock for Packages/CashDeskLast (cashdesk.py) and Packages/CashSymbols (cashsymbols.py). The verbatim SQL of cd_sql.py /
csy_sql.py runs in an in-memory SQLite database built from fixtures/cashdesk.json (dialect shim: user$ quoted, a one-row
dual table). SB_CASHREPORT bodies follow Script/sb_cashreport.sql. Not in the repo, so ASSUMED here:
  * get_cash_transactions / get_cash_transactions_excel (standalone procedures): rows of provarch (p_transtype 1) or
    lazytransaction (2) in [p_begindate, p_enddate] with a cash account (bal_spr<p_balance>.cashincoming = 1 on
    bal_cn<p_balance>) on either side; p_currencyid = val_acc with a cash debit or currencyid_c with a cash credit (the
    CASHORNOT rule of ActionFilterExecute); p_userinsert / p_usercommit = user$.name of op_id / commit_opid;
    p_cashsymbol = kassa_b; p_debitbranch / p_creditbranch = account.filial; ORDER BY p_orderby (default id);
    debtostat / kredostat = account.ostat; d1 = the lazytransaction fixture column (NULL in provarch);
  * pkg_report.get_cashinfo = the commented-out SELECT above it in CashDataModule.dfm:940 (group by issuedby);
  * update_cashsettings with 19 parameters (the script has 15; Delphi passes controller, controller_out, OperatorTitle,
    AccountantTitle too) - same insert-or-update rule as the script, NUMBER parameters converted (ORA-06502);
  * SB_Transaction.transaction_commit(id, true) on a lazytransaction row moves it to provarch (commit_opid = user);
    unknown id -> ORA-20001.
"""
from __future__ import annotations
import datetime as dt
import json
import os
import re
import sqlite3

from .. import cd_sql as Q
from .. import csy_sql as QS
from .. import cashdesk as CD
from .base import DBError

_DB = None
DATE_COLS = {"DAT"}


def reset():
    global _DB
    _DB = None


def _db():
    global _DB
    if _DB is None:
        from ..config import settings
        D = json.load(open(os.path.join(settings.mock_fixtures, "cashdesk.json"), encoding="utf-8"))
        c = sqlite3.connect(":memory:", check_same_thread=False)
        for t, rows in D.items():
            cols = list(dict.fromkeys(k for r in rows for k in r)) or ["ID"]
            c.execute(f'create table "{t}" ({", ".join(chr(34) + k + chr(34) for k in cols)})')
            for r in rows:
                c.execute(f'insert into "{t}" ({", ".join(chr(34) + k + chr(34) for k in r)}) values ({", ".join("?" * len(r))})',
                          list(r.values()))
        c.execute("create table dual (dummy)")
        c.execute("insert into dual values ('X')")
        c.commit()
        _DB = c
    return _DB


def _sqlite(sql: str) -> str:
    return re.sub(r"user\$", '"user$"', sql, flags=re.I)


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


_OWN = {Q.SQL_CD_ODSCURRENCY, Q.SQL_CD_FILIALS, Q.SQL_CD_CASHSYMBOLS, Q.SQL_CD_ODSCASHB, Q.SQL_CD_ODSOPERATOR,
        Q.SQL_CD_ORDS_COMITTERS, Q.SQL_CD_ODSVALUTE, Q.SQL_CD_ODSCASHINFO, Q.SQL_CD_SETTINGS, QS.SQL_CSY_ODSCASHSYMBOLS}

_TR_COLS = """t.ID as rown_, t.DAT as DAT, t.ID as ID, d.ACC_NO as DEBITACC, d.KLI_ID as DEBITCUS, d.FILIAL as DEBITBRANCH,
 d.NAME as DEBITNAME, t.VAL_ACC as DCURRENCY, vd.VAL_NAME as DEBITCURNAME, d.BAL_CN{p} as DEBITBALANCE, k.ACC_NO as CREDITACC,
 k.KLI_ID as CREDITCUS, k.NAME as CREDITNAME, k.FILIAL as CREDITBRANCH, t.CURRENCYID_C as CCURRENCY, vk.VAL_NAME as CREDITCURNAME,
 k.BAL_CN{p} as CREDITBALANCE, t.AMMOUNT as AMMOUNT, t.AMMOUNT_C as AMMOUNT_C, t.LAMMOUNT as LAMMOUNT, t.KASSA_B as KASSA_B,
 t.NO_PROV as NO_PROV, t.OP_ID as OP_ID, t.COMMIT_OPID as COMMIT_OPID, ui.NAME as USERINSERT, uc.NAME as USERCOMMIT,
 t.NAME as NAME, d.OSTAT as debtostat, k.OSTAT as kredostat, {d1} as d1"""
_EXCEL_COLS = ["ROWN", "DAT", "DEBITACC", "DEBITNAME", "DEBITCURNAME", "CREDITACC", "CREDITNAME", "CREDITCURNAME", "AMMOUNT",
               "AMMOUNT_C", "LAMMOUNT", "KASSA_B", "NO_PROV", "USERINSERT", "USERCOMMIT", "NAME"]
_ORDER = {c.upper(): c.upper() for c in CD.GRID_COLS}


def _cash_transactions(b: dict, excel=False):
    p = int(b.get("p_balance") or 1)
    if p not in (1, 2, 3, 4):
        raise DBError("ORA-06502: PL/SQL: numeric or value error")
    table = "provarch" if int(b.get("p_transtype") or 1) == 1 else "lazytransaction"
    cash = f'(select a.ID from account a, bal_spr{p} s where s.BAL_CN = a.BAL_CN{p} and s.CASHINCOMING = 1)'
    sql = (f'select {_TR_COLS.format(p=p, d1="t.D1" if table == "lazytransaction" else "null")} from "{table}" t '
           'join account d on d.ID = t.DEBT join account k on k.ID = t.KREDIT '
           'left join avalute vd on vd.VALUTE = t.VAL_ACC left join avalute vk on vk.VALUTE = t.CURRENCYID_C '
           'left join "user$" ui on ui.ID = t.OP_ID left join "user$" uc on uc.ID = t.COMMIT_OPID '
           f'where t.DAT >= :b and t.DAT <= :e and (t.DEBT in {cash} or t.KREDIT in {cash})')
    a = {"b": _bind(b.get("p_begindate")), "e": _bind(b.get("p_enddate"))}
    if b.get("p_currencyid") is not None:
        sql += f" and ((t.VAL_ACC = :cur and t.DEBT in {cash}) or (t.CURRENCYID_C = :cur and t.KREDIT in {cash}))"
        a["cur"] = int(b["p_currencyid"])
    for bind, col in (("p_userinsert", "ui.NAME"), ("p_usercommit", "uc.NAME"), ("p_cashsymbol", "t.KASSA_B")):
        if b.get(bind) is not None:
            sql += f" and {col} = :{bind}"
            a[bind] = b[bind]
    for bind, col in (("p_debitbranch", "d.FILIAL"), ("p_creditbranch", "k.FILIAL")):
        if b.get(bind) is not None:
            sql += f" and {col} = :{bind}"
            a[bind] = int(b[bind])
    ob = None if excel else b.get("p_orderby")
    if ob is not None:
        key = str(ob).upper()
        if key == "ROWN":
            key = "ID"
        if key not in _ORDER:
            raise DBError("ORA-00904: invalid identifier")
        sql += f" order by {key}, t.ID"
    else:
        sql += " order by t.ID"
    cur = _db().execute(sql, a)
    names = [d[0].upper() for d in cur.description]
    out = []
    for i, t in enumerate(cur.fetchall(), 1):
        r = dict(zip(names, t))
        r.pop("ROWN_")
        r = {"ROWN": i, **r}
        r["DAT"] = dt.datetime.fromisoformat(r["DAT"])
        if excel:
            r = {k: r[k] for k in _EXCEL_COLS}
        out.append(r)
    return out


def _num(v, what="number"):
    if v is None:
        return None
    try:
        f = float(str(v).replace(",", "."))
    except ValueError:
        raise DBError("ORA-06502: PL/SQL: numeric or value error: character to number conversion error")
    return int(f) if f == int(f) else f


def _sym(v):
    n = _num(v)
    return None if n is None else str(n)


class CdMixin:
    def _cd_query(self, sql, b):
        if sql in _OWN:
            return _run(sql, b)
        return NotImplemented

    def _cd_cursor(self, sql, cursor_bind, b):
        if sql == Q.SQL_CD_ODSTRANSACTIONSVIEWER2:
            return _cash_transactions(b)
        if sql == Q.SQL_CD_ORACLEDATASET1:
            return _cash_transactions(b, excel=True)
        if sql == Q.SQL_CD_BROWSECASHINFO:
            return _run("SELECT issuedby, max(id) as id, max(person_doc) as person_doc, max(seria) as seria, "
                        "max(docnumber) as docnumber, max(fromwhen) as fromwhen FROM cashinfo group by issuedby order by issuedby")
        return NotImplemented

    def _cd_func(self, key, args):
        if key == "SB_CASHREPORT.GETPRESENTDATE":                    # Select TEK_DAT Into PresentDate From SYSDAT
            return dt.datetime.fromisoformat(self.st["sys"]["tek_dat"])
        return NotImplemented

    def _cd_proc(self, key, args):
        db = _db()
        if key == "SB_CASHREPORT.CHOOSECASHSYMBOL":                  # update Provarch set KASSA_B=... where ID=...; commit
            tid, sym = args
            db.execute('update provarch set KASSA_B = ? where ID = ?', [_sym(sym), tid])
            db.commit()
            return {}
        if key == "SB_CASHREPORT.UPDATEPACKNO":                      # Execute Immediate 'Update '||TableName||' set no_prov =...'
            tid, pack, table = args
            t = table.strip().lower()
            if t not in ("provarch", "lazytransaction"):
                raise DBError("ORA-00942: table or view does not exist")
            db.execute(f'update "{t}" set NO_PROV = ? where ID = ?', [pack if pack != "" else None, tid])
            db.commit()
            return {}
        if key in ("SB_CASHREPORT.ADD_CASHINFO", "SB_CASHREPORT.UPDATE_CASHINFO"):
            tid, doc, iss, ser, num, frm = args
            if key.endswith("ADD_CASHINFO"):
                if db.execute("select 1 from cashinfo where ID = ?", [tid]).fetchone():
                    raise DBError("ORA-00001: unique constraint (CASHINFO_PK) violated", 1)
                db.execute("insert into cashinfo (ID, PERSON_DOC, ISSUEDBY, SERIA, DOCNUMBER, FROMWHEN) values (?,?,?,?,?,?)",
                           [tid, doc, iss, ser, num, frm])
            else:
                db.execute("update cashinfo set PERSON_DOC=?, ISSUEDBY=?, SERIA=?, DOCNUMBER=?, FROMWHEN=? where ID=?",
                           [doc, iss, ser, num, frm, tid])
            db.commit()
            return {}
        if key == "SB_CASHREPORT.DELETE_CASHINFO":
            db.execute("delete from cashinfo where ID = ?", [args[0]])
            db.commit()
            return {}
        if key == "SB_CASHREPORT.UPDATE_CASHSETTINGS":
            if len(args) != 19:
                raise DBError("ORA-06550: PLS-00306: wrong number or types of arguments in call to 'UPDATE_CASHSETTINGS'")
            vals = list(args)
            vals[0], vals[1] = _num(vals[0]), _num(vals[1])
            cols = ["CASHBALANCENATIONAL", "CASHBALANCEENGLISH", "DESCRIPTION_AZ", "DESCRIPTION_ENG", "SIGNATYRE",
                    "RESPONSIBLE_PERSON", "HANDOVER", "CHIEF", "OPERATOR", "CASHIER", "AMOUNT", "CHIEF_OUT", "ACCOUNTANT",
                    "OPERATOR_OUT", "CASHIER_OUT", "CONTROLLER", "CONTROLLER_OUT", "OPERATORTITLE", "ACCOUNTANTTITLE"]
            n = db.execute("select count(*) from cash_settings").fetchone()[0]
            if n == 0:
                db.execute(f"insert into cash_settings ({', '.join(cols)}) values ({', '.join('?' * 19)})", vals)
            elif n == 1:
                db.execute(f"update cash_settings set {', '.join(c + ' = ?' for c in cols)}", vals)
            db.commit()
            return {}
        if key == "SB_CASHREPORT.ADDCASHSYMBOLS":
            sym, name, med = args
            s = _sym(sym)
            if s is None:
                raise DBError("ORA-01400: cannot insert NULL into (\"KASSA_B\".\"SYMBOL\")", 1400)
            if db.execute("select 1 from kassa_b where SYMBOL = ?", [s]).fetchone():
                raise DBError("ORA-00001: unique constraint (KASSA_B_PK) violated", 1)
            db.execute("insert into kassa_b (SYMBOL, NAME, MEDIOCRITY) values (?,?,?)", [s, name, _num(med)])
            db.commit()
            return {}
        if key == "SB_CASHREPORT.UPDATECASHSYMBOLS":
            old, sym, name, med = args
            s = _sym(sym)
            if s != _sym(old) and db.execute("select 1 from kassa_b where SYMBOL = ?", [s]).fetchone():
                raise DBError("ORA-00001: unique constraint (KASSA_B_PK) violated", 1)
            db.execute("update kassa_b set SYMBOL = ?, NAME = ?, MEDIOCRITY = ? where SYMBOL = ?", [s, name, _num(med), _sym(old)])
            db.commit()
            return {}
        if key == "SB_CASHREPORT.DELETECASHSYMBOLS":
            db.execute("delete from kassa_b where SYMBOL = ?", [_sym(args[0])])
            db.commit()
            return {}
        return NotImplemented

    def _cd_plsql(self, sql, b):
        if sql == "begin :r := SB_Transaction.transaction_commit(:TransactionID, true); end;":
            db = _db()
            tid = b["TransactionID"]
            r = db.execute('select * from lazytransaction where ID = ?', [tid])
            names = [d[0] for d in r.description]
            t = r.fetchone()
            if not t:
                raise DBError("ORA-20001: Transaction not found", 20001)
            rec = dict(zip(names, t))
            rec.pop("D1", None)
            rec["COMMIT_OPID"] = self.user.get("user_id", 1)
            db.execute(f'insert into provarch ({", ".join(rec)}) values ({", ".join("?" * len(rec))})', list(rec.values()))
            db.execute('delete from lazytransaction where ID = ?', [tid])
            return 0
        return NotImplemented

    def _cd_execute(self, sql, b):
        db = _db()
        if sql == CD.SQL_PHOTO_UPDATE:
            db.execute("update cash_settings set PHOTO = ? where rowid = ?", [b["PHOTO"], b["ROWID_"]])
            return True
        if sql == CD.SQL_PHOTO_INSERT:
            db.execute("insert into cash_settings (PHOTO) values (?)", [b["PHOTO"]])
            return True
        return False

    def _cd_commit(self):
        _db().commit()
