"""dBase table written the way the Delphi BDE code does it: CopyFile(<template>, <target>) then TTable.Open +
Insert / FieldByName(..).AsXxx := ... / Post for every record (UntExchangeImpl.pas ActionFileExecute :1002-1076,
ToolButton24Click :745-851). The field layout comes from the template file itself, so the output keeps whatever
structure the bank's template has; nothing about the layout is assumed here.

Field assignment follows TField semantics for the dBase field types (C, N, F, D, L): AsString into a numeric field is
converted with the client's decimal separator, AsInteger / AsFloat into a character field gives the plain text.
"""
from __future__ import annotations
import datetime as dt
import os
import struct
from decimal import Decimal, InvalidOperation

ENCODING = os.getenv("DBF_ENCODING", "cp1251")          # BDE language driver of the templates (unverified)
DECIMAL_SEPARATOR = os.getenv("DBF_DECIMAL_SEPARATOR", ",")   # Windows regional setting of the Delphi client (unverified)


class DbfError(Exception):
    pass


def parse(raw: bytes):
    if len(raw) < 33 or raw[0] not in (0x03, 0x83, 0x30, 0x31, 0xF5, 0x8B):
        raise DbfError("not a dBase file")
    n, hlen, rlen = struct.unpack("<IHH", raw[4:12])
    fields, off = [], 32
    pos = 1
    while off + 32 <= hlen and raw[off] != 0x0D:
        name = raw[off:off + 11].split(b"\0")[0].decode("ascii", "replace").upper()
        fields.append({"name": name, "type": chr(raw[off + 11]), "len": raw[off + 16], "dec": raw[off + 17], "pos": pos})
        pos += raw[off + 16]
        off += 32
    return n, hlen, rlen, fields


def _num_text(v, ln, dec):
    if v is None or v == "":
        return " " * ln
    if isinstance(v, str):
        try:
            v = Decimal(v.strip().replace(DECIMAL_SEPARATOR, "."))
        except InvalidOperation:
            raise DbfError(f"'{v}' is not a valid floating point value")
    s = f"{Decimal(str(v)):.{dec}f}" if dec else str(int(Decimal(str(v)).to_integral_value()))
    if len(s) > ln:
        s = "*" * ln
    return s.rjust(ln)


def _str(v):
    if v is None:
        return ""
    if isinstance(v, (dt.datetime, dt.date)):
        return v.strftime("%d.%m.%Y")
    if isinstance(v, float):
        from .delphi import float_to_str
        return float_to_str(v).replace(".", DECIMAL_SEPARATOR)
    return str(v)


def _cell(f, v) -> bytes:
    ln, t = f["len"], f["type"]
    if t in ("N", "F"):
        return _num_text(v, ln, f["dec"]).encode("ascii")
    if t == "D":
        if v is None or v == "":
            return b" " * 8
        if isinstance(v, str):
            v = dt.datetime.strptime(v.strip(), "%d.%m.%Y")
        return v.strftime("%Y%m%d").encode("ascii")
    if t == "L":
        return (b"T" if v else b"F") if v is not None else b"?"
    return _str(v).encode(ENCODING, "replace")[:ln].ljust(ln, b" ")


def append(template: bytes, records: list[dict]) -> bytes:
    """Copy of the template with records appended. Fields missing from the template raise like TTable.FieldByName
    ("Field 'X' not found")."""
    n, hlen, rlen, fields = parse(template)
    by = {f["name"]: f for f in fields}
    body = template[hlen:hlen + n * rlen]
    out = bytearray()
    for r in records:
        rec = bytearray(b" " * rlen)
        for k, v in r.items():
            f = by.get(k.upper())
            if f is None:
                raise DbfError(f"Field '{k}' not found")
            rec[f["pos"]:f["pos"] + f["len"]] = _cell(f, v)
        out += rec
    today = dt.date.today()
    head = bytearray(template[:hlen])
    head[1:4] = bytes([today.year - 1900, today.month, today.day])
    head[4:8] = struct.pack("<I", n + len(records))
    return bytes(head) + body + bytes(out) + b"\x1a"


def read(raw: bytes) -> list[dict]:
    """Reader used by the tests."""
    n, hlen, rlen, fields = parse(raw)
    rows = []
    for i in range(n):
        rec = raw[hlen + i * rlen: hlen + (i + 1) * rlen]
        rows.append({f["name"]: rec[f["pos"]:f["pos"] + f["len"]].decode(ENCODING).strip() for f in fields})
    return rows


def make_template(fields: list[tuple]) -> bytes:
    """Empty dBase III file (used only to build the mock-mode test templates)."""
    hlen = 32 + 32 * len(fields) + 1
    rlen = 1 + sum(f[2] for f in fields)
    out = bytearray(struct.pack("<BBBBIHH20x", 3, 126, 10, 20, 0, hlen, rlen))
    for name, typ, ln, dec in fields:
        out += struct.pack("<11sc4xBB14x", name.encode(), typ.encode(), ln, dec)
    out += b"\r\x1a"
    return bytes(out)
