"""python-oracledb THIN mode implementation (no Oracle Instant Client needed)."""
from __future__ import annotations
import datetime
import re
import threading

import oracledb

from .base import DBError, Out, dedupe

_IDENT = re.compile(r"^[A-Za-z][A-Za-z0-9_$#]{0,127}$")


def _ident(*parts: str) -> str:
    for p in parts:
        if not _IDENT.match(p):
            raise ValueError(f"invalid identifier {p!r}")
    return ".".join(parts)


def _wrap(exc: oracledb.Error) -> DBError:
    err = exc.args[0] if exc.args else None
    msg = getattr(err, "message", None) or str(exc)
    code = getattr(err, "code", None)
    return DBError(msg, code)


_TYPES = {str: oracledb.DB_TYPE_VARCHAR, int: oracledb.DB_TYPE_NUMBER, float: oracledb.DB_TYPE_NUMBER,
          datetime.datetime: oracledb.DB_TYPE_DATE}


def _rows(cur) -> list[dict]:
    cols = dedupe([d[0].upper() for d in cur.description or []])
    return [dict(zip(cols, r)) for r in cur.fetchall()]


class OracleConnection:
    """One physical Oracle session per logged-in web user (same as one TOracleSession per Delphi client),
    so USER, SYS_CONTEXT('CLIENTCONTEXT',..), package state and SBCONFIG.OpenFile state behave identically."""

    def __init__(self, conn: oracledb.Connection, username: str):
        self._c = conn
        self.username = username
        self.lock = threading.RLock()

    def call_func(self, pkg, name, args, rettype=str, named=None):
        """named: DOA ParameterMode=pmNamed ('param', value, ...) pairs -> PL/SQL named notation."""
        with self.lock, self._c.cursor() as cur:
            try:
                v = cur.callfunc(_ident(pkg, name), _TYPES[rettype], list(args), keyword_parameters=named or None)
            except oracledb.Error as e:
                raise _wrap(e)
            return int(v) if rettype is int and v is not None else v

    def call_bool(self, pkg, name, args, named=None):
        # PL/SQL BOOLEAN cannot be fetched by older DB versions -> wrapper block (works on 11g..23ai).
        named = named or {}
        ph = [f":a{i}" for i in range(len(args))] + [f"{_ident(k)} => :n_{k}" for k in named]
        sql = f"begin :r := case when {_ident(pkg, name)}({', '.join(ph)}) then 1 else 0 end; end;"
        with self.lock, self._c.cursor() as cur:
            r = cur.var(int)
            try:
                cur.execute(sql, {"r": r, **{f"a{i}": a for i, a in enumerate(args)},
                                  **{f"n_{k}": v for k, v in named.items()}})
            except oracledb.Error as e:
                raise _wrap(e)
            return r.getvalue() == 1

    def call_proc(self, pkg, name, args, named=None, commit=True):
        """Returns {param: value} for Out() parameters (empty dict otherwise)."""
        with self.lock, self._c.cursor() as cur:
            kw, outs = {}, {}
            for k, v in (named or {}).items():
                if isinstance(v, Out):
                    outs[k] = kw[k] = cur.var(_TYPES[v.typ])
                else:
                    kw[k] = v
            try:
                cur.callproc(_ident(*[x for x in (pkg, name) if x]), list(args), keyword_parameters=kw or None)
                if commit:
                    self._c.commit()
            except oracledb.Error as e:
                raise _wrap(e)
            return {k: v.getvalue() for k, v in outs.items()}

    def plsql(self, sql, binds=None, ret=None):
        """Anonymous block. Used where a call needs a PL/SQL BOOLEAN argument (e.g. CommitTemp => true), which
        DOA passes natively; the literal is written into the block text, values stay bind variables.
        If ret is given the block must assign :r."""
        with self.lock, self._c.cursor() as cur:
            b = dict(binds or {})
            r = None
            if ret is not None:
                r = b["r"] = cur.var(_TYPES[ret])
            try:
                cur.execute(sql, b)
            except oracledb.Error as e:
                raise _wrap(e)
            if r is None:
                return None
            v = r.getvalue()
            return int(v) if ret is int and v is not None else v

    def plsql_out(self, sql, binds=None):
        """Anonymous block with OUT binds (values given as Out(type)); returns {name: value} of the OUT binds.
        Used for TOracleQuery blocks such as 'begin Pkg.Proc(:a, :Param1, :Param2); end;' (DOA GetVariable)."""
        with self.lock, self._c.cursor() as cur:
            b, outs = {}, {}
            for k, v in (binds or {}).items():
                if isinstance(v, Out):
                    outs[k] = b[k] = cur.var(_TYPES[v.typ], 32767) if v.typ is str else cur.var(_TYPES[v.typ])
                else:
                    b[k] = v
            try:
                cur.execute(sql, b)
            except oracledb.Error as e:
                raise _wrap(e)
            return {k: v.getvalue() for k, v in outs.items()}

    def query(self, sql, binds=None):
        with self.lock, self._c.cursor() as cur:
            try:
                cur.execute(sql, binds or {})
                return _rows(cur)
            except oracledb.Error as e:
                raise _wrap(e)

    def execute(self, sql, binds=None):
        with self.lock, self._c.cursor() as cur:
            try:
                cur.execute(sql, binds or {})
            except oracledb.Error as e:
                raise _wrap(e)

    def cursor_block(self, sql, cursor_bind, binds=None):
        with self.lock, self._c.cursor() as cur:
            rc = cur.var(oracledb.DB_TYPE_CURSOR)
            try:
                cur.execute(sql, {cursor_bind: rc, **(binds or {})})
                return _rows(rc.getvalue())
            except oracledb.Error as e:
                raise _wrap(e)

    def commit(self):
        with self.lock:
            self._c.commit()

    def rollback(self):
        with self.lock:
            self._c.rollback()

    def ping(self):
        # Delphi keep-alive dataset: sbMainForm_Unit.dfm:1093  select 'TRUE' as connection from dual
        return self.query("select 'TRUE' as connection from dual")[0]["CONNECTION"] == "TRUE"

    def close(self):
        try:
            self._c.close()
        except oracledb.Error:
            pass


class OracleBackend:
    def connect(self, user, password, dsn, newpassword=None):
        try:
            kw = {"user": user, "password": password, "dsn": dsn}
            if newpassword:
                kw["newpassword"] = newpassword  # ORA-28001 handling, like TfmPassChange+SetPassword
            c = oracledb.connect(**kw)
        except oracledb.Error as e:
            raise _wrap(e)
        return OracleConnection(c, user.upper())
