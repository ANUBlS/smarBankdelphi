"""Mock for Packages/Cards_New/cards_azericard_turan_version (DataMod_CARDS, Unit18.dfm). The verbatim SQL of cards_sql.py is
recognised (Clients SQL[25] filial line and the TitleClick 'ORDER BY <field> [desc]' line appended by SQL.Add may vary) and executed
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
DATE_COLS = {"DATEOPEN", "EXPIRY", "DATECLOSE", "DAT", "CRDAT", "TRANDATE"}


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
        c.create_function("to_char", 1, lambda v: None if v is None else (str(int(v)) if isinstance(v, (int, float)) else str(v)))
        c.execute("create table dual (dummy text)")
        c.execute("insert into dual values ('X')")
        for t, rows in D.items():
            if t.startswith("_"):
                continue
            cols = list(dict.fromkeys(k for r in rows for k in r))
            c.execute(f"create table {t} ({', '.join(cols)})")
            for r in rows:
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
                if n == "LINES_CLIENTS":
                    L[25] = "\x00"
                t = re.escape(Q.text(L)).replace("\x00", ".*")
                if n == "LINES_CLIENTS":
                    t += r"(ORDER BY \w+(  desc)?\r\n)?"
                _PATS.append(re.compile(t + r"\Z", re.S))
    return _PATS


class CardsMixin:
    def _cards_query(self, sql, b):
        if not any(p.match(sql) for p in _pats()):
            return NotImplemented
        s = re.sub(r"\bsmart\.", "", sql)
        s = re.sub(r"card_main\.findfilial", "card_main_findfilial", s, flags=re.I)
        s = re.sub(r"sb_aca\.getuserbyid", "sb_aca_getuserbyid", s, flags=re.I)
        s = s.replace("(SELECT USER FROM DUAL)", ":user__")
        params = {k.lower(): v for k, v in (b or {}).items()}
        if ":user__" in s:
            params["user__"] = self.username
        s = re.sub(r"--[^\r\n]*", "", s)
        cur = _db().execute(s, params)
        names = [d[0].upper() for d in cur.description]
        out = []
        for r in cur.fetchall():
            o = {}
            for k, v in zip(names, r):
                if k in DATE_COLS and isinstance(v, str):
                    v = dt.datetime.fromisoformat(v)
                o[k] = v
            out.append(o)
        return out

    def _cards_proc(self, key, args):
        if key == "CARD_MAIN.DELNEW":
            # card_main body not in the repo: emulated as a delete of the card_clients row (no commit, as the Delphi caller)
            _db().execute("delete from card_clients where id = ?", [int(args[0])])
            return {}
        return NotImplemented

    def _cards_func(self, key, args):
        return NotImplemented
