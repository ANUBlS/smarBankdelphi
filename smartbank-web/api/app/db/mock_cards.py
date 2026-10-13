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
from .base import DBError

_DB = None
_PATS = None
DATE_COLS = {"DATEOPEN", "EXPIRY", "DATECLOSE", "DAT", "CRDAT", "TRANDATE", "OP_DATE"}


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
                if n == "LINES_CLIENTS":
                    t += r"(ORDER BY \w+(  desc)?\r\n)?"
                if n in ("LINES_URGENT", "LINES_SIMPLE", "LINES_BALANS", "LINES_PAYMENT"):                         # TApplications SQL.Add('ORDER BY ..') / SQL[pos] := ''
                    t += r"(?:(?:ORDER BY \w+)?\r\n)*"
                _PATS.append(re.compile(t + r"\Z", re.S))
        from .. import cards as C                                              # Tkrinfo / TMultiCurrency datasets (not in Unit18)
        from .. import cards_app_file as F
        for L in (C.LINES_CM_ACTIVE, C.LINES_MULTI_ACC, F.LINES_UMUMI1_BOUND, F.LINES_UMUMI1_BOUND2):
            _PATS.append(re.compile(re.escape(Q.text(L)) + r"\Z", re.S))
    return _PATS


# applicationpas.pas cr_file1 / cr_file2: one call per written message
DONE = {"CARD_MAIN." + n.upper() for n in ("donenewcard", "donesupcard", "doneprolongation", "donereplace", "donecredit",
                                           "doneattempsclear", "donestatuschange", "donerbsnumberchange", "contractclose",
                                           "DONESECURE", "cardnamechange")}


class CardsMixin:
    def _cards_query(self, sql, b):
        if sql.startswith(Q.text(Q.LINES_SAZLAMALAR)) and "ORDER BY" in sql[len(Q.text(Q.LINES_SAZLAMALAR)):]:
            # setac.pas DBGrid1TitleClick adds a second ORDER BY after 'order by id': Oracle rejects the statement
            raise DBError("ORA-00933: SQL command not properly ended", 933)
        if not any(p.match(sql) for p in _pats()):
            return NotImplemented
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
        names = [d[0].upper() for d in cur.description]
        out = []
        for r in cur.fetchall():
            o = {}
            for k, v in zip(names, r):
                if (k in DATE_COLS or (k == "BIRTHDAY" and re.match(r"\d{4}-\d\d-\d\dT", str(v)))) and isinstance(v, str):
                    v = dt.datetime.fromisoformat(v)
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
        if key == "CARD_MAIN.DELETE_APPLICATION":
            # card_main body not in the repo: emulated as a delete of the card_client_app row (no commit, as the Delphi caller)
            _db().execute("delete from card_client_app where id = ?", [int(args[0])])
            return {}
        return NotImplemented

    def _cards_execute(self, sql, b):
        """DOA DML of the Sazlama forms (cards_sett.SQL) on the SQLite tables; ROWID = the SQLite rowid the selects return."""
        from .. import cards_sett as S
        if sql not in S.SQL.values():
            return False
        p = {k.lower(): v for k, v in b.items()}
        s = re.sub(r":(\w+)", lambda m: ":" + m.group(1).lower(), sql)
        _db().execute(s, p)
        return True

    def _cards_func(self, key, args):
        return NotImplemented
