"""DB access layer mirroring DOA (Direct Oracle Access) TOraclePackage/TOracleDataSet usage.

Delphi:  SomePkg.CallStringFunction('Name', [args])   -> conn.call_func('PKG', 'Name', args, str)
         SomePkg.CallBooleanFunction('Name', [args])  -> conn.call_bool('PKG', 'Name', args)
         SomePkg.CallProcedure('Name', [args])        -> conn.call_proc('PKG', 'Name', args)
         TOracleDataSet.SQL / Open                    -> conn.query(sql, binds)
         TOracleQuery 'begin :c := pkg.f(:x); end;'   -> conn.cursor_block(sql, 'c', binds)
"""
from __future__ import annotations
import datetime
from typing import Any, Protocol


class DBError(Exception):
    """Carries the ORA-xxxxx text exactly as Oracle returned it (shown to user like EOracleError.Message)."""

    def __init__(self, message: str, code: int | None = None):
        super().__init__(message)
        self.message = message
        self.code = code


class Out:
    """Marks an OUT parameter in a pmNamed call (DOA binds a variable; e.g. SBOP.close_customer RESULT)."""

    def __init__(self, typ=int):
        self.typ = typ


class Connection(Protocol):
    username: str

    def call_func(self, pkg: str, name: str, args: list, rettype: type) -> Any: ...
    def call_bool(self, pkg: str, name: str, args: list) -> bool: ...
    def call_proc(self, pkg: str, name: str, args: list) -> None: ...
    def query(self, sql: str, binds: dict | None = None) -> list[dict]: ...
    def execute(self, sql: str, binds: dict | None = None) -> None: ...
    def cursor_block(self, sql: str, cursor_bind: str, binds: dict | None = None) -> list[dict]: ...
    def plsql(self, sql: str, binds: dict | None = None, ret: type | None = None) -> Any: ...
    def ping(self) -> bool: ...
    def close(self) -> None: ...


class Backend(Protocol):
    def connect(self, user: str, password: str, dsn: str, newpassword: str | None = None) -> Connection: ...


def get_backend(mode: str) -> Backend:
    if mode == "oracle":
        from .oracle import OracleBackend
        return OracleBackend()
    from .mock import MockBackend
    return MockBackend()


RET_TYPES = (str, int, float, datetime.datetime)
