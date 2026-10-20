"""Mock for Packages/Cards_New/cards_azericard (DataMod_CARDS, Unit18.dfm). The verbatim SQL of cards_sql.py is
recognised (the TitleClick 'ORDER BY <field> [desc]' line appended by SQL.Add may vary) and executed
in an in-memory SQLite database built from fixtures/cards.json. Dialect shims only: the 'smart.' schema prefix is dropped,
card_main.findfilial / sb_aca.getuserbyid / to_char are SQLite functions, (SELECT USER FROM DUAL) -> the mock user name.
The card_* DDL and the card_main package body are not in the repo: columns come from the persistent TFields."""
from __future__ import annotations
import datetime as dt
import json
import os
import re
import sqlite3

from .. import cards_sql as Q
from .base import DBError, dedupe

_DB = None
_PATS = None
DATE_COLS = {"DATEOPEN", "EXPIRY", "DATECLOSE", "DAT", "CRDAT", "TRANDATE", "OP_DATE", "BEGDAT"}


def reset():
    global _DB
    _DB = None


def _fx():
    from ..config import settings
    return json.load(open(os.path.join(settings.mock_fixtures, "cards.json"), encoding="utf-8"))


def _db():
    global _DB
    if _DB is None:
        D = _fx()
        c = sqlite3.connect(":memory:", check_same_thread=False)
        users = D.get("_users", {})
        fil = {r["ID"]: r["NAME"] for r in D["filial_t"]}
        c.create_function("card_main_findfilial", 1, lambda f: fil.get(f))
        c.create_function("sb_aca_getuserbyid", 1, lambda i: None if i is None else users.get(str(int(i))))
        mains = {r["ID"]: r for r in D["card_clients"]}
        # card_main.mainfind body not in the repo: assumed 'MAIN' for a main card (MAINCARD empty), else 'SUB'
        c.create_function("card_main_mainfind", 1, lambda i: None if i not in mains else ("SUB" if mains[i].get("MAINCARD") else "MAIN"))

        def decode(*a):
            v, rest = a[0], list(a[1:])
            while len(rest) >= 2:
                k, r = rest.pop(0), rest.pop(0)
                if k == v:
                    return r
            return rest[0] if rest else None
        c.create_function("decode", -1, decode)
        c.create_function("to_char", 2, lambda v, f: None if v is None else str(v)[:10])   # to_char(date, 'DD-mon-YYYY') compared
        # with a DATE bind: Oracle converts the char back to DATE (NLS_DATE_FORMAT, unverified) -> a day comparison; the mock binds ISO days
        c.create_function("to_char", 1, lambda v: None if v is None else (str(int(v)) if isinstance(v, (int, float)) else str(v)))
        c.create_function("nvl", 2, lambda a, b: b if a is None else a)
        c.create_function("convertpack_convert_int", 1, lambda v: v)          # convertpack body not in the repo: identity
        refs = {"n": int(D.get("_reference_start", 100000))}

        def setref(_k):                                                        # card_main.setreference body not in the repo: a counter
            refs["n"] += 1
            return refs["n"]
        c.create_function("card_main_setreference", 1, setref)
        kred = {int(k): v for k, v in D.get("_findcredit2", {}).items()}
        c.create_function("card_main_findcredit2", 1, lambda a: kred.get(int(a or 0), 0))
        fk = {int(k): v for k, v in D.get("_filialkod", {}).items()}
        c.create_function("card_main_filialkod", 1, lambda k: fk.get(int(k or 0)))   # card_main.filialkod body not in the repo
        fc = {int(k): v for k, v in D.get("_findcredit", {}).items()}
        c.create_function("card_main_findcredit", 1, lambda a: fc.get(int(a or 0), 0))       # card_main body not in the repo
        co = {int(k): v for k, v in D.get("_curaccountostat", {}).items()}
        c.create_function("card_main_curaccountostat", 1, lambda a: co.get(int(a or 0), 0))  # card_main body not in the repo
        cur = {r.get("RBSNUMBER"): r.get("CURRENCY") for r in D["card_clients"]}
        c.create_function("card_main_getcurr", 1, lambda r: cur.get(r))       # card_main.getcurr body not in the repo: card_clients.currency
        c.execute("create table dual (dummy text)")
        c.execute("insert into dual values ('X')")
        for t, rows in D.items():
            if t.startswith("_"):
                continue
            cols = list(dict.fromkeys(k for r in rows for k in r))
            c.execute(f"create table {t} ({', '.join(cols)})")
            today = dt.datetime.combine(dt.date.today(), dt.time()).isoformat()
            for r in rows:
                r = {k: (today if v == "TODAY" else dt.date.today().isoformat() if v == "TODAY_D" else v) for k, v in r.items()}           # fixture token: the server date
                c.execute(f"insert into {t} ({', '.join(r)}) values ({', '.join('?' * len(r))})", list(r.values()))
        c.commit()
        _DB = c
    return _DB


def _pats():
    global _PATS
    if _PATS is None:
        _PATS = []
        for n in dir(Q):
            if n.startswith("LINES_"):
                L = list(getattr(Q, n))
                t = re.escape(Q.text(L))
                if n in ("LINES_KLIRING1", "LINES_KLIRING2"):
                    t += r"(?:ORDER BY \w+\r\n)?"
                if n == "LINES_CLIENTS":
                    t += r"(ORDER BY \w+(  desc)?\r\n)?"
                if n in ("LINES_URGENT", "LINES_SIMPLE", "LINES_BALANS", "LINES_PAYMENT", "LINES_CARDTYPES", "LINES_FILIALACCOUNT",
                         "LINES_DOMESTIC", "LINES_BANKOMATS", "LINES_POSCOMISSION", "LINES_MESSAGES2", "LINES_CADDI"):                         # TApplications SQL.Add('ORDER BY ..') / SQL[pos] := ''
                    t += r"(?:(?:ORDER BY \w+)?\r\n)*"
                _PATS.append(re.compile(t + r"\Z", re.S))
        from .. import cards as C                                              # Tkrinfo / TMultiCurrency datasets (not in Unit18)
        from .. import cards_app_file as F
        from .. import cards_misc as M
        for L in (C.LINES_CM_ACTIVE, C.LINES_MULTI_ACC, F.LINES_UMUMI1_BOUND, F.LINES_UMUMI1_BOUND2, M.LINES_LIM1, M.LINES_LIM2):
            _PATS.append(re.compile(re.escape(Q.text(L)) + r"\Z", re.S))
        from .. import cards_files as CF                                       # SQL.Clear / Add texts of the file operations
        from .. import cards_cfile, cards_fileops  # noqa: F401 - register their statements
        for t in CF.EXTRA_SELECTS:
            _PATS.append(re.compile(re.escape(t) + r"\Z", re.S))
    return _PATS


# applicationpas.pas cr_file1 / cr_file2: one call per written message
DONE = {"CARD_MAIN." + n.upper() for n in ("donenewcard", "donesupcard", "doneprolongation", "donereplace", "donecredit",
                                           "doneattempsclear", "donestatuschange", "donerbsnumberchange", "contractclose",
                                           "DONESECURE", "cardnamechange")}


# file operation forms (cards_fileops): procedure -> (table, argument columns) / table
FO_INSERT = {"insert_dxxx": ("card_dxxxfiles", ["INSTITUTION", "CURRENCY", "TRANDATE", "MERCHANT", "AMOUNT", "FEE", "TERMINAL", "TYPES", "TR_TYPE",
                                                "FILENAME", "BANK_KODE", "MERCH_NAME", "AUTH_CODE"]),
             "insert_sms_messages": ("card_smsfiles", ["TERMINALNAME", "CARDNUMBER", "TERMINAL", "AUTH_CODE", "AMOUNT_TR", "TRANDATE", "CURRENCY",
                                                      "POST_DATE", "AMOUNTSET", "FILENAME"]),
             "insert_intretail": ("card_intretalifiles", ["CHANELL", "TR_TYPE", "OUTWORDSTATUS", "TR_CURRENCY", "ACC_CURRENCY", "MERCHANT", "CARDNUMBER",
                                                         "TR_DATE", "AUTH", "TR_AMOUNT", "ACC_AMOUNT", "FEE", "CLEAR_AMOUNT", "TERMINAL", "FILENAME"]),
             "insert_rvisa": ("card_rvisafiles", ["REPORTING_FOR", "REPORTING_CODE", "REPORTING_DATE", "ROLLUP_TO", "ROLLUP_TO_CODE", "PROC_DATE",
                                                  "FUNDS_XFER_ENTITY", "FUNDS_XFER_CODE", "SETTLEMENT_CURRENCY", "INTERCHANGE_TOTAL_AMMOUNT",
                                                  "INTERCHANGE_ISDEBET", "REIMBURSEMENT_FEES_AMOUNT", "REIMBURSEMENT_FEES_ISDEBET", "VISA_CHARGES_AMMOUNT",
                                                  "VISA_CHARGES_ISDEBET", "SETTLEMENT_AMOUNT", "SETTLEMENT_AMOUNT_ISDEBET", "FILENAME"]),
             # insert_dfiles: 25 fixed-width fields + currency + file + 1; named where UnitDfile's commented preview names them (:483-490)
             "insert_dfiles": ("card_dfiles", ["F1", "F2", "F3", "F4", "F5", "BANKNAME", "F7", "LOROACCOUNT", "F9", "F10", "PAYMENTORDERAMMOUNT",
                                               "PAYMENTDIRECTION", "F13", "F14", "F15", "F16", "F17", "SOURCECONTRACT", "TRANSACTIONDATE",
                                               "TRANSACTIONTIME", "F21", "F22", "F23", "F24", "F25", "CURRENCY", "FILENAME", "F28"])}
FO_INSERT.update({                                                             # argument columns unknown (DDL not in the repo): A1..An
    "rbsdofile_insert": ("card_rbsdofile_t", ["FILENAME"] + ["A%d" % i for i in range(2, 31)]),
    "rbstax_insert": ("card_rbstaxfiles", ["A%d" % i for i in range(1, 40)])})
FO_DELETE = {"delete_rbsdofile": "card_rbsdofile_t", "delete_rbstaxfile": "card_rbstaxfiles", "delete_exchangefile": "card_exchange_files",
             "delete_dxxx": "card_dxxxfiles", "empty_sms_messages": "card_smsfiles", "empty_intretail": "card_intretalifiles",
             "delete_dfiles": "card_dfiles", "rvisa_delete": "card_rvisafiles"}
FO_TRANS = {"transaction_dxxx": "card_dxxxfiles", "transaction_sms": "card_smsfiles", "transaction_int": "card_intretalifiles",
            "transaction_d": "card_dfiles", "transaction_exchange": ("card_exchange_files", 1), "transaction_rbstax": ("card_rbstaxfiles", 1)}
FO_NOOP = {"dxxarxiv", "smsarxiv", "intarxiv", "darxiv", "exchangearxiv", "rbsdoarxiv", "rbstaxarxiv", "rbsdopart"}


def _num(v):
    """Oracle's implicit VARCHAR2 -> NUMBER conversion for a NUMBER column bound with a string."""
    try:
        return int(str(v).strip())
    except ValueError:
        return v


class CardsMixin:
    def _cards_query(self, sql, b):
        if sql.startswith(Q.text(Q.LINES_MESSAGES)) and "ORDER BY" in sql[len(Q.text(Q.LINES_MESSAGES)):]:
            raise DBError("ORA-00933: SQL command not properly ended", 933)       # cfilepas DBGrid1TitleClick after 'order by status'
        if sql.startswith(Q.text(Q.LINES_SAZLAMALAR)) and "ORDER BY" in sql[len(Q.text(Q.LINES_SAZLAMALAR)):]:
            # setac.pas DBGrid1TitleClick adds a second ORDER BY after 'order by id': Oracle rejects the statement
            raise DBError("ORA-00933: SQL command not properly ended", 933)
        if not any(p.match(sql) for p in _pats()):
            return NotImplemented
        if sql.startswith(Q.text(Q.LINES_CADDI)) and sql.count("ORDER BY") > 1:
            raise DBError("ORA-00933: SQL command not properly ended", 933)       # cfile_addi DBGrid1TitleClick: the lines accumulate
        if "trunc(sysdate)" in sql:
            sql = sql.replace("trunc(sysdate)", "'" + dt.datetime.combine(dt.date.today(), dt.time()).isoformat() + "'")
        if sql.startswith(Q.text(Q.LINES_DOMESTIC)):
            # domesticbank.pas TitleClick on the three acc_no columns: 'ORDER BY ACC_NO' is ambiguous, ACC_NO_1 / _2 are only DOA field names
            m = re.search(r"ORDER BY (ACC_NO(?:_\d)?)\r\n", sql[len(Q.text(Q.LINES_DOMESTIC)):])
            if m:
                raise DBError("ORA-00918: column ambiguously defined" if m.group(1) == "ACC_NO" else
                              f'ORA-00904: "{m.group(1)}": invalid identifier', 918 if m.group(1) == "ACC_NO" else 904)
        if "SYSDATE" in sql:                                                   # cardbr_upd: TO_CHAR(SYSDATE, fmt) with Oracle format codes
            now = dt.datetime.now()
            sql = sql.replace("TO_CHAR(SYSDATE, 'HH:MM:SS')", "'" + now.strftime("%I:%m:%S") + "'")   # HH = 12-hour, MM = month (as written)
            sql = sql.replace("TO_CHAR(SYSDATE, 'YYYY-mm-dd')", "'" + now.strftime("%Y-%m-%d") + "'")
        s = re.sub(r"\bsmart\.", "", sql)
        s = re.sub(r"card_main\.findfilial", "card_main_findfilial", s, flags=re.I)
        s = re.sub(r"sb_aca\.getuserbyid", "sb_aca_getuserbyid", s, flags=re.I)
        s = re.sub(r"card_main\.mainfind", "card_main_mainfind", s, flags=re.I)
        s = re.sub(r"card_main\.setreference", "card_main_setreference", s, flags=re.I)
        s = re.sub(r"card_main\.(findcredit|curaccountostat|getcurr)\b", r"card_main_\1", s, flags=re.I)
        s = re.sub(r"card_main\.findcredit2", "card_main_findcredit2", s, flags=re.I)
        s = re.sub(r"card_main\.filialkod", "card_main_filialkod", s, flags=re.I)
        s = re.sub(r"convertpack\.convert_int", "convertpack_convert_int", s, flags=re.I)
        s = s.replace("(SELECT USER FROM DUAL)", ":user__")
        params = {k.lower(): (v.isoformat() if type(v) is dt.date else v) for k, v in (b or {}).items()}
        s = re.sub(r":(\w+)", lambda m: ":" + m.group(1).lower() if m.group(1).lower() in params else m.group(0), s)
        if ":user__" in s:
            params["user__"] = self.username
        s = re.sub(r"--[^\r\n]*", "", s)
        cur = _db().execute(s, params)
        names = dedupe([d[0].upper() for d in cur.description])
        out = []
        for r in cur.fetchall():
            o = {}
            for k, v in zip(names, r):
                if (k in DATE_COLS or (k == "BIRTHDAY" and re.match(r"\d{4}-\d\d-\d\dT", str(v)))) and isinstance(v, str):
                    try:
                        v = dt.datetime.fromisoformat(v)
                    except ValueError:
                        pass                                                   # a VARCHAR2 date column (e.g. card_dxxxfiles.TRANDATE)
                o[k] = v
            out.append(o)
        return out

    def _cards_proc(self, key, args):
        if key == "CARD_MAIN.DELNEW":
            # card_main body not in the repo: emulated as a delete of the card_clients row (no commit, as the Delphi caller)
            _db().execute("delete from card_clients where id = ?", [int(args[0])])
            return {}
        if key in ("CARD_MAIN.NEW_CARD", "CARD_MAIN.EDIT_CARD"):
            # card_main body not in the repo: emulated as one card_client_app row per call (STATUS 1, MESSTYPE = the edit2 argument)
            a = list(args)
            multi = a.pop() if a and isinstance(a[-1], str) else None             # TMultiCurrency passes Edit3 (the main RBS) last
            iso = lambda v: v.isoformat() if isinstance(v, (dt.date, dt.datetime)) else v  # noqa: E731
            db = _db()
            nid = (db.execute("select max(id) from card_client_app").fetchone()[0] or 0) + 1
            rec = dict(ID=nid, CARDHOLDER=a[0], FNAME=a[1], LNAME=a[2], PASSPORT=a[3], BIRTHDAY=a[4], HOMEPHONE=a[5], WORKPHONE=a[6],
                       COUNTRY=a[7], CITY=a[8], ADDRESS=a[9], RESIDENT=a[10], RBSNUMBER=a[11], MULTI_ACC=a[11], CURRENCY=a[12],
                       CARDTYPE=a[13], CARDSTATUS=a[14], CREDIT_LIM=a[15], DATEOPEN=iso(a[16]), EXPIRY=iso(a[17]), REFERENCE=a[18],
                       EMBOSSNAME=a[19], COMPANY=a[20], SECURITY=a[21], MESSTYPE=int(a[22]), URG=a[23], LANG_CODE=a[24], KLI_ID=a[26] or None,
                       TYPES=a[27], TITUL=a[28], STATUS=1, OP_ID=1, FILIAL=101, TRANDATE=iso(a[-1]), DAT=dt.datetime.now().isoformat())
            if multi is not None:
                rec["MULTI_ACC"] = multi
            if key.endswith("EDIT_CARD"):
                rec.update(CARDNUMBER=a[29], WITHP=a[30])
            db.execute(f"insert into card_client_app ({', '.join(rec)}) values ({', '.join('?' * len(rec))})", list(rec.values()))
            self.cards_calls = getattr(self, "cards_calls", []) + [(key, a)]
            return {}
        if key in DONE:
            # card_main bodies not in the repo: emulated as STATUS 2 (= sent, the urgent / simple lists show 1-3) on the
            # card_client_app row; donenewcard also stores its file name argument. No commit (as the Delphi caller)
            sets = "STATUS = 2" + (", FILENAME = ?" if key == "CARD_MAIN.DONENEWCARD" else "")
            _db().execute(f"update card_client_app set {sets} where id = ?", list(args[1:2]) + [int(args[0])]
                          if key == "CARD_MAIN.DONENEWCARD" else [int(args[0])])
            self.cards_calls = getattr(self, "cards_calls", []) + [(key, list(args))]
            return {}
        if key == "CARD_MAIN.DELETE_PAYMENT":
            # card_main body not in the repo: emulated as 'delete from card_payment' (payment.pas Button5Click; no commit)
            _db().execute("delete from card_payment")
            self.cards_calls = getattr(self, "cards_calls", []) + [(key, list(args))]
            return {}
        if key == "CARD_MAIN.INSERT_PAYMENT":
            # card_main body not in the repo: emulated as one card_payment row with the 14 arguments (no commit)
            a = [v.isoformat() if isinstance(v, (dt.date, dt.datetime)) else v for v in args]
            _db().execute("insert into card_payment (ID, CARDNUMBER, RBSNUMBER_1, ACCID, CURRENCY, AMMOUNT, LAMMOUNT, NAME, TIP, DAT, OPID, "
                          "COMMITEDOPID, FILIAL, TIM) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)", a)
            self.cards_calls = getattr(self, "cards_calls", []) + [(key, list(args))]
            return {}
        if key == "CARD_MAIN.CARD_UFX_PROC":
            # card_main.card_ufx_proc body not in the repo: no-op in the mock (card_ufx is the fixture)
            self.cards_calls = getattr(self, "cards_calls", []) + [(key, list(args))]
            return {}
        if key == "CARD_MAIN.VERIFI":
            # card_main.verifi body not in the repo: emulated as STATUS 4 -> 1 (the row moves to the Application lists); no commit
            _db().execute("update card_client_app set STATUS = 1 where id = ?", [int(args[0])])
            self.cards_calls = getattr(self, "cards_calls", []) + [(key, list(args))]
            return {}
        r = self._fo_proc(key, list(args))
        if r is not NotImplemented:
            return r
        r = self._sett_proc(key, list(args))
        if r is not NotImplemented:
            return r
        if key == "CARD_MAIN.DELETE_APPLICATION":
            # card_main body not in the repo: emulated as a delete of the card_client_app row (no commit, as the Delphi caller)
            _db().execute("delete from card_client_app where id = ?", [int(args[0])])
            return {}
        return NotImplemented

    def _fo_proc(self, key, a):
        """File operation forms (cards_fileops): card_main bodies not in the repo. delete_<x> drops the not yet posted rows (status 1),
        insert_<x> adds one status-1 row with the arguments in FO_INSERT order, <x>arxiv is a no-op, transaction_<x> sets STATUS 2."""
        db = _db()
        k = key.split(".", 1)[-1].lower()
        if k in FO_INSERT:
            t, cols = FO_INSERT[k]
            nid = (db.execute(f"select max(id) from {t}").fetchone()[0] or 0) + 1
            rec = dict(zip(cols, a), ID=nid, STATUS=1)
            have = {r[1].upper() for r in db.execute(f"pragma table_info({t})")}
            for col in rec:
                if col.upper() not in have:
                    db.execute(f"alter table {t} add column {col}")              # the real DDL is not in the repo
            db.execute(f"insert into {t} ({', '.join(rec)}) values ({', '.join('?' * len(rec))})",
                       [v.isoformat() if isinstance(v, (dt.date, dt.datetime)) else v for v in rec.values()])
        elif k in FO_DELETE:
            db.execute(f"delete from {FO_DELETE[k]}" + ("" if k in ("rvisa_delete", "delete_rbsdofile") else
                                                          " where status = 0" if k in ("delete_exchangefile", "delete_rbstaxfile") else " where status = 1"))
        elif k in FO_TRANS:
            t, new = FO_TRANS[k] if isinstance(FO_TRANS[k], tuple) else (FO_TRANS[k], 2)
            if a:
                db.execute(f"update {t} set STATUS = ? where id = ?", [new, int(a[0])])
            else:                                                              # transaction_d: no argument, every loaded row
                db.execute(f"update {t} set STATUS = ? where status in (1, 3)", [new])
        elif k == "kliring_delete":                                          # klirinqUnit: bodies not in the repo
            db.execute("delete from CARD_KLIRING where status in (1, 3)")
        elif k == "insert_kliring":
            nid = (db.execute("select max(id) from CARD_KLIRING").fetchone()[0] or 0) + 1
            for i, (bid, name, h, kl, amt) in enumerate([("NBAZ", "KAPITAL BANK", 9001, 9002, 150.0), ("PAHA", "PASHA BANK", 9001, 9002, 25.5)]):
                db.execute("insert into CARD_KLIRING (ID, BANKID, BANKNAME, HESAB, KLIRINQ, MEBLEQ, INFO, STATUS) values (?,?,?,?,?,?,?,1)",
                           [nid + i, bid, name, h, kl, amt, None])
        elif k == "kliring":
            db.execute("update CARD_KLIRING set STATUS = 2 where status = 1")
        elif k == "limits":
            db.execute("update card_limits set STATUS = 2 where status = 1")
        elif k in FO_NOOP:
            pass
        else:
            return NotImplemented
        self.cards_calls = getattr(self, "cards_calls", []) + [(key, a)]
        return {}

    def _sett_proc(self, key, a):
        """Sazlama sub forms (cards_sett2): the card_main bodies are not in the repo; emulated as one insert / delete on the table the
        form's grid shows (names / ids resolved from the lookup texts). No commit, as the Delphi callers."""
        db = _db()
        one = lambda q, p: (db.execute(q, p).fetchone() or [None])[0]  # noqa: E731
        acc = lambda n: one("select id from account where acc_no = ?", [n]) if n else None  # noqa: E731
        val = lambda n: one("select valute from avalute_t where val_name = ?", [n])  # noqa: E731
        fil = lambda n: one("select id from filial_t where name = ?", [n])  # noqa: E731
        nid = lambda t: (one(f"select max(id) from {t}", []) or 0) + 1  # noqa: E731
        ins = lambda t, r: db.execute(f"insert into {t} ({', '.join(r)}) values ({', '.join('?' * len(r))})", list(r.values()))  # noqa: E731
        if key in ("CARD_MAIN.DELETE_TRANCACTION_C", "CARD_MAIN.CARXIV"):
            pass                                                               # bodies not in the repo: no-op (recorded)
        elif key == "CARD_MAIN.MULTI_DEL":                                    # cfile_addi Button1Click: body not in the repo
            db.execute("delete from card_messages_c_additional where docid = ? and status = 1", [_num(a[0])])
        elif key == "CARD_MAIN.MULTI_INS":
            ins("card_messages_c_additional", dict(ID=nid("card_messages_c_additional"), DOCID=_num(a[0]), AMMOUNT=float(str(a[1]).replace(",", ".") or 0),
                                                   VALUTE=a[2], CURRENCYNAME=one("select val_name from avalute_t where valute = ?", [a[2]]),
                                                   STATUS=1, BEGDAT=dt.datetime.combine(dt.date.today(), dt.time()).isoformat()))
        elif key == "CARD_MAIN.TRANSACTION_MULTI":
            db.execute("update card_messages_c_additional set STATUS = 2, TRANID = id + 9000 where id = ?", [int(a[0])])
        elif key == "CARD_MAIN.TRANSACTION_C":
            db.execute("update card_messages_c set STATUS = 2 where id = ?", [int(a[0])])   # posted -> messages2 (status 2)
        elif key == "CARD_MAIN.NEW_CARTTYPE":
            ins("CARD_CARDTYPE", dict(ID=nid("CARD_CARDTYPE"), NAME=a[0], CODE=a[1], CURRENCY=a[2], SERVICE=a[3], SCHEME=a[4], BIN=a[5]))
        elif key == "CARD_MAIN.FILIALACOUNT":
            ins("filialaccounts", dict(ID=nid("filialaccounts"), FILIALID=fil(a[0]), VALID=val(a[1]), ACCID28=acc(a[2]), ACCID48=acc(a[3]),
                                       ACCID64=acc(a[4]), DILING_GELIR=a[5], DILING_XERC=a[6], KOD=a[7], REZ28=a[8], REZ48=a[9]))
        elif key == "CARD_MAIN.INSERT_DOMESTIC":
            ins("card_domestic", dict(ID=nid("card_domestic"), BANKID=a[0], BANKNAME=a[1], VALID=val(a[2]), H25ID=acc(a[3]), H45ID=acc(a[4]),
                                      H64ID=acc(a[5])))
        elif key == "CARD_MAIN.NEW_BANKOMAT":
            ins("card_bankomats", dict(ID=nid("card_bankomats"), ATMPOS=a[0], ATMID=a[1], ATMNAME=a[2], FILIAL=fil(a[3]), VAL=val(a[4]),
                                       MAINACOUNT=acc(a[5]), INTERACCOUNT=acc(a[6]), PROFITACOUNT=acc(a[7]), CONTRACTNUMBER=a[8]))
        elif key == "CARD_MAIN.ATM_DELETE":
            db.execute("delete from card_bankomats where id = ?", [a[0]])
        elif key == "CARD_MAIN.INSERT_NOPROVS":
            ins("card_noprov", dict(STR=a[0]))
        elif key == "CARD_MAIN.ADDBRANCHESCODE":
            ins("card_branch_codes", dict(ID=nid("card_branch_codes"), BRANCHID=a[0], BRANCH_NAME=a[1], BRANCH_CODE=a[2]))
        elif key == "CARD_MAIN.DEL_BRANCHESCODE":
            db.execute("delete from card_branch_codes where branchid = ?", [a[0]])
        elif key == "CARD_MAIN.ADDEXCHANGEACC":
            ins("card_exchange_sett", dict(ID=nid("card_exchange_sett"), ATMAZN=a[0], VDMAZN=a[1], ATMUSD=a[2], VDMUSD=a[3], ATMEUR=a[4],
                                           VDMEUR=a[5], BRANCH=a[6], MIDDLEACC=a[7], AZNINCOME=a[8], CONTRACTNUM=a[9], ATMNAME=a[10]))
        elif key == "CARD_MAIN.RBS_TAX_ACC_SETTINGS":
            ins("rbstax_acc_settings", dict(ID=nid("rbstax_acc_settings"), BRANCH=a[0], VALUTE=a[1], TAX1=a[2], TAX10=a[3], TAX18=a[4]))
        else:
            return NotImplemented
        self.cards_calls = getattr(self, "cards_calls", []) + [(key, a)]
        return {}

    def _cards_execute(self, sql, b):
        """DOA DML of the Sazlama forms (cards_sett.SQL / cards_sett2.SQL) on the SQLite tables; ROWID = the SQLite rowid the selects return."""
        from .. import cards_sett as S
        from .. import cards_sett2 as S2
        from .. import cards_files as CF
        m = re.match(r"\s*(?:insert\s+into|delete\s+from)\s+(\w+)", sql, re.I)
        if sql not in S.SQL.values() and sql not in S2.SQL.values() and not (m and m.group(1).lower() in CF.DML_TABLES):
            return False
        p = {k.lower(): (v.isoformat() if isinstance(v, (dt.date, dt.datetime)) else v) for k, v in b.items()}
        s = re.sub(r":(\w+)", lambda m: ":" + m.group(1).lower(), sql)
        if m and sql.lower().startswith("insert") and m.group(1).lower() in CF.DML_TABLES and not re.search(r"\bID\b", sql.split(")")[0], re.I):
            # ID is not set by the Delphi Append / Post (trigger / sequence on the real table, not in the repo): max + 1
            t = m.group(1)
            nid = (_db().execute(f"select max(id) from {t}").fetchone()[0] or 0) + 1
            s = s.replace(f"{t} (", f"{t} (ID, ", 1).replace("values (", "values (:nid__, ", 1)
            p["nid__"] = nid
        mi = re.match(r"\s*insert\s+into\s+\w+\s*\(([^)]*)\)\s*values\s*\(([^)]*)\)", s, re.I)
        if mi:                                                                 # Oracle NUMBER column bound with AsString '0': stored as a number
            for col, ph in zip(mi.group(1).split(","), mi.group(2).split(",")):
                if col.strip().upper() == "STATUS" and ph.strip().startswith(":"):
                    p[ph.strip()[1:]] = _num(p[ph.strip()[1:]])
        _db().execute(s, p)
        return True

    def _cards_func(self, key, args):
        return NotImplemented
