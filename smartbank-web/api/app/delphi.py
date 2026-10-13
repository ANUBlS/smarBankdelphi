"""Small, exact re-implementations of Delphi/DOA runtime behaviour that the ported modules depend on.

Everything here is pure (no DB) so it is unit-tested directly (tests/test_delphi.py).
"""
from __future__ import annotations
import datetime
import math
from decimal import Decimal, ROUND_HALF_EVEN


# ------------------------------------------------------------------ DOA substitution variables
def subst(sql: str, name: str, value: str) -> str:
    """DOA otSubst variable (Variables.Data type 1): the text of the variable replaces ':name' in the SQL.
    Callers MUST pass only whitelisted text (column names) - never user input."""
    import re
    return re.sub(r":" + re.escape(name) + r"\b", value, sql, flags=re.IGNORECASE)


def page_sql(sql: str) -> str:
    """rownum window (works on Oracle 11g+). Delphi fetched incrementally; the web pages the same query."""
    return f"select * from (select q.*, rownum rn__ from (\r\n{sql}) q where rownum <= :hi__) where rn__ > :lo__"


def like_prefix(text: str) -> str:
    """Bind value for "field starts with text" (DOA SearchRecord srPartialMatch). LIKE wildcards typed by the
    user are escaped so they match literally (DOA compares in memory, no wildcards). Use with ESCAPE '\\'."""
    return text.replace("\\", "\\\\").replace("%", "\\%").replace("_", "\\_") + "%"


# ------------------------------------------------------------------ Delphi string helpers
def az_i_to_backtick(text: str) -> str:
    """customers_operation_impl.pas:1749-1758 EditNameKeyPress: StringReplace of i, I, İ, I, ı by '`' (in that
    order) - matches the NAME1 column  translate(name, 'IiİiIı', '``````')  of the Customers query."""
    for ch in ("i", "I", "İ", "I", "ı"):
        text = text.replace(ch, "`")
    return text


def float_to_str(v) -> str:
    """Delphi FloatToStr / TField.AsString for numbers: shortest form, no trailing '.0'."""
    if v is None:
        return ""
    if isinstance(v, bool):
        return str(int(v))
    if isinstance(v, int):
        return str(v)
    f = float(v)
    if f == int(f) and abs(f) < 1e15:
        return str(int(f))
    s = repr(f)
    return s


# ------------------------------------------------------------------ Delphi numeric semantics
def delphi_round(x: float) -> int:
    """System.Round: banker's rounding (x87 default round-to-nearest-even). Python round() is the same."""
    return int(round(x))


def delphi_frac(x: float) -> float:
    return x - math.trunc(x)


def round_new(x: float, precision: int) -> float:
    """TransactionPropertiesImpl.pas:355-367 RoundNew (the version 'Written by Hesen R.')."""
    scaled = delphi_frac(x) * precision
    temp = delphi_frac(scaled)
    scaled = float(math.trunc(scaled))
    if delphi_round(temp * 100) >= 50:
        scaled += 1
    if delphi_round(temp * 100) <= -50:
        scaled -= 1
    return math.trunc(x) + scaled / precision


def to_currency(x) -> Decimal:
    """Assignment of a Double to a Delphi Currency (fixed 4 decimals, rounded to nearest-even)."""
    return Decimal(repr(float(x))).quantize(Decimal("0.0001"), rounding=ROUND_HALF_EVEN)


def date_only(d) -> datetime.datetime | None:
    """Trunc()/Int() of a TDateTime -> midnight."""
    if d is None:
        return None
    return datetime.datetime(d.year, d.month, d.day)
