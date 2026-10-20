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
from .. import dep_ops_sql as QO
from .. import dep_settings_sql as QS
from .base import DBError

_DB = None
_FX: dict = {}
DATE_COLS = {"OLDDATE", "NEWDATE", "OPENDATE", "CLOSEDATE", "STOPCALCULATIONDATE", "HDATE", "FIRSTINTERESTPAYDAT", "CLOSE_DAT"}


def reset():
    global _DB
    _DB = None
    _PEND.clear()


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
        col = lambda q: (lambda i: None if i is None else (c.execute(q, [i]).fetchone() or [None])[0])  # noqa: E731
        c.create_function("sp_sbcmopendate", 1, col("select opendate from sbcm_contracts_new where id = ?"))
        # assumed: the closing date before any prolongation (first OLDDATE), else CLOSEDATE
        c.create_function("sp_sbcmgetolddate", 1, col('select coalesce((select olddate from sbcm_prolongations_new p where p."id#" = s.id '
                                                       'order by hdate, id limit 1), s.closedate) from sbcm_contracts_new s where s.id = ?'))
        c.create_function("sp_getoverduepercent_new", 1, lambda i: None if i is None else float(
            (D.get("_rates", {}).get(str((c.execute("select contracttype from sbcm_contracts_new where id = ?", [i]).fetchone() or [0])[0])) or [0, 0])[1]))
        c.create_function("sp_getpercentcollection", 1, lambda i: None if i is None else pc.get(str(int(i))))
        for t, rows in D.items():
            if t.startswith("_"):
                continue
            cols = list(dict.fromkeys(k for r in rows for k in r)) or ["ID"]
            c.execute(f'create table "{t}" ({", ".join(chr(34) + k + chr(34) for k in cols)})')
            for r in rows:
                c.execute(f'insert into "{t}" ({", ".join(chr(34) + k + chr(34) for k in r)}) values ({", ".join("?" * len(r))})', list(r.values()))
        c.execute('delete from "SBCM_DELAYED_TRANSACTIONS_new"')   # the fixture row only defines the columns
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


_PEND: dict = {}
_CTX: dict = {}


def _bank_date():
    return dt.datetime.fromisoformat(_CTX.get("tek_dat", "2026-10-12"))


def _delayed(db, rows, date):
    """Assumed: the operation procedure writes its proposed postings to SBCM_DELAYED_TRANSACTIONS_new (temporary table)."""
    db.execute('delete from "SBCM_DELAYED_TRANSACTIONS_new"')
    for deb, cre, amt, txt in rows:
        a = lambda i: db.execute("select acc_no, (select val_name from avalute where valute = account.val_acc) from account where id = ?", [i]).fetchone() or (None, None)  # noqa: E731
        (dn, dc), (cn, cc) = a(deb), a(cre)
        db.execute('insert into "SBCM_DELAYED_TRANSACTIONS_new" (DEBITACCNO, DEBITCURRENCY, CREDITACCNO, CREDITCURRENCY, TRDATE, INBALANCECHAR, '
                   'FLAGS, DEBITAMOUNT, CREDITAMOUNT, NATAMOUNT, TRDESCRIPTION, CANPROCESS) values (?,?,?,?,?,?,?,?,?,?,?,?)',
                   [dn, dc, cn, cc, date, "+", 0, amt, None, amt, txt, 1])


def _ops(key, n, db):
    """sbcm_credit_tranches_new / sbcm_payment_new (bodies not in the repo) - assumed behaviour, see PARITY_DEPOSITS.md."""
    d = lambda v: None if v is None else v.date().isoformat()  # noqa: E731
    accs = lambda cid: db.execute('select clientaccid, contractaccid, interestaccid from sbcm_contract_accounts_new where "id#" = ?', [cid]).fetchone()  # noqa: E731
    if key == "SBCM_CREDIT_TRANCHES_NEW.DEPOSITMONEY":
        cid = int(n["contractid"]); a = accs(cid)
        if not a:
            raise DBError("ORA-01403: no data found", 1403)
        _PEND.clear(); _PEND.update(op="apply", cid=cid, total=n["total"], pct=n["PERCENT"], date=d(n["hdate"]))
        _delayed(db, [(n["P_ClientAccID"], a[1], n["total"], "Depozit yatırımı")], d(n["hdate"]))
        return {}
    if key == "SBCM_PAYMENT_NEW.WITHDRAWMONEY":
        cid = int(n["ContractID"]); a = accs(cid)
        cs = db.execute('select sum(facticaldebt), sum(facticalinterestdebt) from sbcm_contract_state_new where "id#" = ?', [cid]).fetchone() or (0, 0)
        if n["FacticalDebtWithdraw"] > (cs[0] or 0) or n["InterestDebtWithdraw"] > (cs[1] or 0):
            raise DBError("ORA-20103: mock: amount exceeds the deposit balance", 20103)
        _PEND.clear(); _PEND.update(op="extract", cid=cid, main=n["FacticalDebtWithdraw"], int=n["InterestDebtWithdraw"], date=d(n["HDate"]))
        rows = [(a[1], n["P_AccID"], n["FacticalDebtWithdraw"], "Əsas məbləğin ödənilməsi")] if n["FacticalDebtWithdraw"] else []
        rows += [(a[2], n["P_AccID"], n["InterestDebtWithdraw"], "Faizin ödənilməsi")] if n["InterestDebtWithdraw"] else []
        _delayed(db, rows, d(n["HDate"]))
        return {}
    if key == "SBCM_PAYMENT_NEW.UNTIMEWITHDRAWMONEY":      # assumed: principal + interest (full or recalculated at the untimely rate)
        cid = int(n["ContractID"]); a = accs(cid)
        cs = db.execute('select sum(facticaldebt) from sbcm_contract_state_new where "id#" = ?', [cid]).fetchone()
        main = float(cs[0] or 0)
        if not main:
            raise DBError("ORA-20104: mock: the deposit has no balance", 20104)
        if n["p_checdpercentpeyment"]:
            intr = float(n["p_FACTICALINTDEBT"])
        else:
            t = db.execute("select contracttype from sbcm_contracts_new where id = ?", [cid]).fetchone()[0]
            rate = float((_FX.get("_rates", {}).get(str(t)) or [0, 0])[1])
            days = (_bank_date() - n["p_CalcPercentDate"]).days
            intr = round(main * rate / 100 * max(days, 0) / 365, 2)
        _PEND.clear(); _PEND.update(op="untimely", cid=cid, main=main, int=intr, date=_bank_date().date().isoformat())
        rows = [(a[1], n["p_CreditAccID"], main, "Depozitin vaxtından əvvəl ödənilməsi")]
        rows += [(a[2], n["p_CreditAccID"], intr, "Faizin ödənilməsi")] if intr else []
        _delayed(db, rows, _PEND["date"])
        return {}
    if key == "SBCM_PAYMENT_NEW.CAPITALIZATION":            # assumed: move <Total> of the accrued interest into the principal
        cid = int(n["ContractID"]); a = accs(cid)
        cs = db.execute('select sum(facticalinterestdebt) from sbcm_contract_state_new where "id#" = ?', [cid]).fetchone()
        if float(n["Total"]) > float(cs[0] or 0):
            raise DBError("ORA-20105: mock: amount exceeds the accrued interest", 20105)
        _PEND.clear(); _PEND.update(op="capitalize", cid=cid, total=float(n["Total"]), date=d(n["HDate"]))
        _delayed(db, [(a[2], a[1], float(n["Total"]), "Faizin kapitallaşdırılması")], d(n["HDate"]))
        return {}
    if key == "SBCM_PAYMENT_NEW.DELETECAPITALIZATION":
        if db.execute("delete from sbcm_capitalization_new where id = ?", [int(n["p_capitalizationID"])]).rowcount == 0:
            raise DBError("ORA-20106: mock: capitalization not found", 20106)
        return {}
    if key in ("SBCM_CREDIT_TRANCHES_NEW.COMMITDEPOSITMONEY", "SBCM_PAYMENT_NEW.COMMITWITHDRAWMONEY"):
        p = dict(_PEND); _PEND.clear()
        if not n["DoCommit"]:
            db.rollback(); return {}
        nid = lambda t: (db.execute(f"select max(id) from {t}").fetchone()[0] or 9000) + 1  # noqa: E731
        if p.get("op") == "apply":
            db.execute('insert into sbcm_tranches_new ("id#", ID, HDATE, TOTAL, RESERVE, TRID, DESCRIPTION) values (?,?,?,?,?,?,?)',
                       [p["cid"], nid("sbcm_tranches_new"), p["date"], p["total"], p["pct"], 800000 + nid("sbcm_tranches_new"), None])
            db.execute('update sbcm_contract_state_new set facticaldebt = facticaldebt + ? where "id#" = ?', [p["total"], p["cid"]])
        elif p.get("op") == "capitalize":
            db.execute('insert into sbcm_capitalization_new (ID, "id#", HDATE, TOTAL, TRID) values (?,?,?,?,?)',
                       [nid("sbcm_capitalization_new"), p["cid"], p["date"], p["total"], 830000])
            db.execute('update sbcm_contract_state_new set facticaldebt = facticaldebt + ?, facticalinterestdebt = facticalinterestdebt - ? '
                       'where "id#" = ?', [p["total"], p["total"], p["cid"]])
        elif p.get("op") == "untimely":
            db.execute('insert into sbcm_payments_new ("id#", ID, HDATE, FACTICALDEBT, INTERESTDEBT, TRID, INTTRID) values (?,?,?,?,?,?,?)',
                       [p["cid"], nid("sbcm_payments_new"), p["date"], p["main"], p["int"], 820000, 820001])
            db.execute('update sbcm_contract_state_new set facticaldebt = 0, facticalinterestdebt = 0, calculationenabled = 0 where "id#" = ?', [p["cid"]])
        elif p.get("op") == "extract":
            db.execute('insert into sbcm_payments_new ("id#", ID, HDATE, FACTICALDEBT, INTERESTDEBT, TRID, INTTRID) values (?,?,?,?,?,?,?)',
                       [p["cid"], nid("sbcm_payments_new"), p["date"], p["main"], p["int"], 810000, 810001])
            db.execute('update sbcm_contract_state_new set facticaldebt = facticaldebt - ?, facticalinterestdebt = facticalinterestdebt - ? '
                       'where "id#" = ?', [p["main"], p["int"], p["cid"]])
        db.execute('delete from "SBCM_DELAYED_TRANSACTIONS_new"')
        db.commit()
        return {}
    if key in ("SBCM_CREDIT_TRANCHES_NEW.DELETEDEPOSITMONEY", "SBCM_PAYMENT_NEW.DELETEWITHDRAWMONEY"):
        t, k = ("sbcm_tranches_new", "P_DepMoneyID") if "TRANCHES" in key else ("sbcm_payments_new", "P_DepWMoneyID")
        if db.execute(f"delete from {t} where id = ?", [int(n[k])]).rowcount == 0:
            raise DBError("ORA-20102: mock: operation not found", 20102)
        return {}
    return NotImplemented


def _ops_func(key, n, db):
    if key == "SBCM_CREDIT_TRANCHES_NEW.GETPERSENTTRANSH":     # assumed: the contract's interest (sbcm_interests_new)
        r = db.execute('select interest from sbcm_interests_new where "id#" = ?', [int(n["ContractID"])]).fetchone()
        return float(r[0]) if r and r[0] is not None else 0.0
    if key == "SBCM_CREDIT_TRANCHES_NEW.COUNTTRANCH":
        return db.execute('select count(*) from sbcm_tranches_new where "id#" = ?', [int(n["p_contractid"])]).fetchone()[0]
    chk = {"SBCM_CREDIT_TRANCHES_NEW.CHECKEDTRANCH": 0, "SBCM_CREDIT_TRANCHES_NEW.CHECKEDADDTRANCH": 1,
           "SBCM_CREDIT_TRANCHES_NEW.CHECKEDTRANCH_MAX_LIMIT": 2}
    if key in chk:
        return _FX.get("_tranch_checks", {}).get(str(int(n["p_contractid"])), [1, 3, 5])[chk[key]]
    return NotImplemented


def _sqlite(sql: str) -> str:
    s = re.sub(r"sbcm_stored_programs(?:_new)?\.(Get_ContractAccountName|Get_ContractAccount|GetpercentCollection|SbcmOpenDate|SBCMGetOldDate)\(",
               lambda m: "sp_" + m.group(1).lower() + "(", sql)
    s = s.replace("sbcm_payment_new.GetOverduePercent_new(", "sp_getoverduepercent_new(")
    s = s.replace("user$", '"user$"')
    return re.sub(r"\b(sid|id|type)#", lambda m: '"' + m.group(1).lower() + '#"', s, flags=re.I)


_MAIN = Q.SQL_DEPOSITSDATA.replace(":OrderField", "cont.id")
_OWN = {Q.SQL_VALUTES, Q.SQL_FILIALS, Q.SQL_DEPOSITTYPES, Q.SQL_CATEGORIES, Q.SQL_PERSONS, Q.SQL_USERS, Q.SQL_TRANCHES, _MAIN}
_OWN |= {v for k, v in vars(QC).items() if k.startswith("SQL_")}                # SBDM_Contract_new
_OWN |= {v for k, v in vars(QS).items() if "_SQL_" in k}                         # SBDM_Settings_new
_OWN |= {v for k, v in vars(QO).items() if "SQL_" in k}                          # SBDM_ApplyMoney_new, SBDM_ExtractMoney_new, TrDelayed_Show, SBDM_Prolongation_new


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

    def _dep_func(self, key, named, args=()):
        n = named or {}
        if key == "SBCM_PERCENT_CONVERTING_NEW.GETDATEINTERVAL":   # assumed: whole months between the dates
            a, b = args
            return (b.year - a.year) * 12 + b.month - a.month - (1 if b.day < a.day else 0)
        if key == "SBCM_PERCENT_CONVERTING_NEW.GETCONVERTEDDEBT":  # assumed: simple interest for <interval> months, Integer
            iv, amount, rate = args
            return int(round(amount * rate / 100 * iv / 12))
        r = _ops_func(key, n, _db())
        if r is not NotImplemented:
            return r
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

    def _dep_execute(self, sql, binds):
        """DOA default ApplyRecord DML of the SBDM_Settings_new datasets (dep_settings.post / delete)."""
        m = re.match(r"\s*(insert into|update|delete from)\s+(sbcm_categories_new|sbcm_acc_zone_info_new|sbcm_deposit_types_new|sbcm_settings_new)\b", sql, re.I)
        if not m:
            return False
        db = _db()
        try:
            cur = db.execute(_sqlite(sql), {k: _bind(v) for k, v in binds.items()})
        except sqlite3.Error as e:
            raise DBError(f"ORA-00904: mock: {e}", 904)
        if m.group(1).lower() == "insert into":                  # assumed BEFORE INSERT trigger: ID from a sequence
            t = m.group(2)
            cols = [r[1].upper() for r in db.execute(f"pragma table_info({t})")]
            if "ID" in cols:
                db.execute(f"update {t} set id = (select coalesce(max(id), 0) + 1 from {t}) where rowid = ? and id is null", [cur.lastrowid])
        elif cur.rowcount == 0:
            raise DBError("ORA-01403: no data found", 1403)
        return True

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

    def _dep_proc(self, key, named, args=()):
        n = named or {}
        db = _db()
        _CTX["tek_dat"] = self.st["sys"]["tek_dat"][:10]
        if key == "SBCM_RPDEPOSITORY_NEW.DELDEPOSITTYPES":        # assumed: refuses a type used by a contract
            tid = int(args[0])
            if db.execute("select count(*) from sbcm_contracts_new where contracttype = ?", [tid]).fetchone()[0]:
                raise DBError("ORA-02292: integrity constraint violated - child record found", 2292)
            db.execute("delete from sbcm_deposit_types_new where id = ?", [tid])
            return {}
        if key == "SBCM_RPDEPOSITORY_NEW.UPD_SBCM_REFERENCES":
            db.execute('update "SBCM_References_new" set name = ?, lname = ?, parentid = ?, value = ?, sourcelist = ? where id = ?',
                       [args[1], args[2], args[3], args[4], args[5], int(args[0])])
            return {}
        if key == "SBCM_PAYMENT_SCHEDULE1_NEW.SBCMPERIOD":          # assumed: <period> monthly rows from PaymentDate, equal parts
            cid, start, amount, period = int(n["deposid"]), n["PaymentDate"], float(n["per_amount"]), int(n["period"])
            if period <= 0:
                raise DBError("ORA-01476: divisor is equal to zero", 1476)
            db.execute('delete from "SBCM_PAYMENT_SCHEDULE_new" where "id#" = ?', [cid])
            nid = (db.execute('select max(id) from "SBCM_PAYMENT_SCHEDULE_new"').fetchone()[0] or 6000)
            for k in range(period):
                mth = start.month - 1 + k
                y, mo = start.year + mth // 12, mth % 12 + 1
                import calendar
                d = dt.date(y, mo, min(start.day, calendar.monthrange(y, mo)[1]))
                db.execute('insert into "SBCM_PAYMENT_SCHEDULE_new" (ID, "id#", HDATE, INTEREST, IPINTEREST) values (?,?,?,?,?)',
                           [nid + k + 1, cid, d.isoformat(), n["perc"], round(amount / period, 2)])
            return {}
        if key == "SBCM_PROLONGATION_NEW.ADDPROLONGATION":          # assumed: log the change and move the closing date
            cid, hd, nd = int(args[0]), args[1].date().isoformat(), args[2].date().isoformat()
            old = db.execute("select closedate from sbcm_contracts_new where id = ?", [cid]).fetchone()
            nid = (db.execute("select max(id) from sbcm_prolongations_new").fetchone()[0] or 7000) + 1
            db.execute('insert into sbcm_prolongations_new (ID, "id#", HDATE, OLDDATE, NEWDATE) values (?,?,?,?,?)', [nid, cid, hd, old[0] if old else None, nd])
            db.execute("update sbcm_contracts_new set closedate = ? where id = ?", [nd, cid])
            return {}
        if key == "SBCM_PROLONGATION_NEW.DELLASTPROLONGATION":      # assumed: drop the newest row, restore OLDDATE
            cid = int(args[0])
            r = db.execute('select id, olddate from sbcm_prolongations_new where "id#" = ? order by hdate desc, id desc', [cid]).fetchone()
            if r is None:
                raise DBError("ORA-01403: no data found", 1403)
            db.execute("delete from sbcm_prolongations_new where id = ?", [r[0]])
            db.execute("update sbcm_contracts_new set closedate = ? where id = ?", [r[1], cid])
            return {}
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
        r = _ops(key, n, db)
        if r is not NotImplemented:
            return r
        if key in ("SBCM_CONTRACT_NEW.NEWDEPOSIT", "SBCM_CONTRACT_NEW.UPDATEDEPOSIT"):
            return _save_deposit(db, key.endswith("UPDATEDEPOSIT"), n, getattr(self, "user", {}) or {})
        return NotImplemented
