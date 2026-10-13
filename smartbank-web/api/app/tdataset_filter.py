"""TDataSet.Filter evaluation (Filtered = True, FilterOptions = [] -> case-sensitive, partial compare on a trailing '*').

Only the expression forms the ported Delphi code builds are supported: <FIELD> <op> '<literal>' with op in = <> < > <= >=,
'and' / 'or' / 'not' and parentheses. Semantics follow DBCommon TFilterExpr as used by TDataSet:
* a NULL field makes a comparison False;
* string '=' / '<>' with a literal ending in '*' (and foNoPartialCompare not set) compares only the text before the '*';
* a date/time field compared with a string literal converts the literal with StrToDateTime (ShortDateFormat dd.mm.yyyy assumed);
* a numeric field compared with a non-numeric literal raises the conversion error (EConvertError text, unverified).
An expression that does not parse raises FilterError (Delphi: EDatabaseError 'Filter expression incorrectly terminated' etc.)."""
from __future__ import annotations
import datetime
import re


class FilterError(Exception):
    pass


_TOK = re.compile(r"\s*(?:(?P<str>'(?:[^']|'')*')|(?P<op><>|<=|>=|=|<|>)|(?P<par>[()])|(?P<id>[A-Za-z_][\w.]*)|(?P<num>-?\d+(?:\.\d+)?))")


def _tokens(s):
    pos, out = 0, []
    while pos < len(s):
        if not s[pos:].strip():
            break
        m = _TOK.match(s, pos)
        if not m:
            raise FilterError(f"Filter expression incorrectly terminated: {s!r}")
        k = m.lastgroup
        v = m.group(k)
        if k == "str":
            v = v[1:-1].replace("''", "'")
        out.append((k, v))
        pos = m.end()
    return out


def parse(expr: str):
    toks = _tokens(expr)
    i = 0

    def peek():
        return toks[i] if i < len(toks) else (None, None)

    def take():
        nonlocal i
        t = peek(); i += 1; return t

    def primary():
        k, v = peek()
        if k == "par" and v == "(":
            take(); n = orx()
            if take() != ("par", ")"):
                raise FilterError("Filter expression incorrectly terminated")
            return n
        if k == "id" and v.lower() == "not":
            take(); return ("not", primary())
        if k == "id":
            take()
            ko, op = take()
            if ko != "op":
                raise FilterError(f"Filter expression incorrectly terminated near {v!r}")
            kl, lit = take()
            if kl not in ("str", "num"):
                raise FilterError("Filter expression incorrectly terminated")
            return ("cmp", v.upper(), op, lit, kl)
        raise FilterError("Filter expression incorrectly terminated")

    def andx():
        n = primary()
        while peek()[0] == "id" and peek()[1].lower() == "and":
            take(); n = ("and", n, primary())
        return n

    def orx():
        n = andx()
        while peek()[0] == "id" and peek()[1].lower() == "or":
            take(); n = ("or", n, andx())
        return n

    if not toks:
        return None
    n = orx()
    if i != len(toks):
        raise FilterError("Filter expression incorrectly terminated")
    return n


def _str_to_date(s):
    for f in ("%d.%m.%Y %H:%M:%S", "%d.%m.%Y"):
        try:
            return datetime.datetime.strptime(s.strip(), f)
        except ValueError:
            pass
    raise FilterError(f"'{s}' is not a valid date")


def _cmp(a, op, b):
    return {"=": a == b, "<>": a != b, "<": a < b, ">": a > b, "<=": a <= b, ">=": a >= b}[op]


def _eval(n, r, fields):
    t = n[0]
    if t == "and":
        return _eval(n[1], r, fields) and _eval(n[2], r, fields)
    if t == "or":
        return _eval(n[1], r, fields) or _eval(n[2], r, fields)
    if t == "not":
        return not _eval(n[1], r, fields)
    _, f, op, lit, kind = n
    if f not in fields:
        raise FilterError(f"Field '{f}' not found")
    v = r.get(f)
    if v is None:
        return False
    if isinstance(v, (datetime.datetime, datetime.date)):
        if not isinstance(v, datetime.datetime):
            v = datetime.datetime(v.year, v.month, v.day)
        return _cmp(v, op, _str_to_date(str(lit)))
    if isinstance(v, (int, float)) and not isinstance(v, bool):
        try:
            x = float(str(lit).replace(",", "."))
        except ValueError:
            raise FilterError(f"'{lit}' is not a valid floating point value")
        return _cmp(float(v), op, x)
    v, lit = str(v), str(lit)
    if op in ("=", "<>") and lit.endswith("*"):
        res = v.startswith(lit[:-1])
        return res if op == "=" else not res
    return _cmp(v, op, lit)


def apply(rows: list[dict], expr: str, fields) -> list[dict]:
    """rows with upper-case keys; fields = the dataset's field names (FieldByName check)."""
    n = parse(expr or "")
    if n is None:
        return list(rows)
    return [r for r in rows if _eval(n, r, fields)]
