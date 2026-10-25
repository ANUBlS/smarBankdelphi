"""Cards ▸ Əməliyyat file operations (cards_azericard MAINFORMImpl1 PopupMenu2): shared runtime for the verbatim Delphi routines run by
pascal.py (C File, ...).

Delphi reads every file of C:\\AZCARD\\IN (TFileListBox) and writes C:\\AZCARD\\OUT. The web works with ONE file uploaded by hand at a time
(kept in the user's session as the only item of C:\\AZCARD\\IN); generated files are downloaded (CARDS_OUT_DIR keeps a server copy, as
cards_app_file). TOracleDataSet Append / FieldByName(..).AsX := / Post is a DOA INSERT on the dataset's table (no OnApplyRecord) followed
by CommitOnPost (DOA default True); ExecSQL does not commit. MessageDlg questions: the routine is first run as a probe (no procedure call,
no DML, no file written); when it reaches a question that has no answer yet, the question goes to the browser and the routine is run
again with the answers. Text files are read with the client's ANSI code page CARDS_FILE_CODEPAGE (default cp1254); Readln ends a line at
CR LF, LF or CR."""
from __future__ import annotations

import base64
import datetime as dt
import functools
import os
import re

from . import cards_app_file as AF
from . import pascal as P
from .azips_files import Field

IN_DIR = "C:\\AZCARD\\IN"
CODEPAGE = AF.CODEPAGE
DEC = os.getenv("CARDS_DECIMAL_SEPARATOR", ",")
MR = {"mryes": 6, "mrno": 7, "mrcancel": 2, "mryestoall": 10, "mrok": 1, "mrall": 12}
_EPOCH = dt.datetime(1899, 12, 30)
# Statements built at run time by the routines (SQL.Clear / SQL.Add text) - the mock recognises them (db/mock_cards.py)
EXTRA_SELECTS: list[str] = []
DML_TABLES: set[str] = set()


class NeedAnswer(Exception):
    def __init__(self, msg, buttons):
        super().__init__(msg)
        self.msg, self.buttons = msg, buttons


@functools.lru_cache(None)
def unit(src_name: str):
    txt = open(os.path.join(os.path.dirname(__file__), "delphi_src", src_name), encoding="utf-8").read()
    m = re.match(r"\{ Verbatim copy of .*? lines (\d+)-(\d+) .*?\}\n", txt)
    return P.Unit(txt[m.end():], int(m.group(1)))


def to_dt(v):
    if isinstance(v, (int, float)):
        return _EPOCH + dt.timedelta(days=float(v))
    return v


def serial(d) -> float:
    if isinstance(d, (int, float)):
        return float(d)
    if not isinstance(d, dt.datetime):
        d = dt.datetime(d.year, d.month, d.day)
    return (d - _EPOCH).total_seconds() / 86400.0


def split_lines(data: bytes) -> list[str]:
    t = data.decode(CODEPAGE, errors="replace")
    if t.endswith("\x1a"):
        t = t[:-1]
    L = re.split(r"\r\n|\n|\r", t)
    if L and L[-1] == "":
        L.pop()
    return L


# ------------------------------------------------------------------------------------------------ uploads (one file at a time)
def upload(ws, key: str, name: str, data: bytes) -> dict:
    name = os.path.basename(name.replace("\\", "/"))
    if not name or len(data) > 20 * 1024 * 1024:
        raise ValueError("file")
    ws.module_state.setdefault("cards_in", {})[key] = {"name": name, "data": data}
    return {"name": name, "size": len(data)}


def uploaded(ws, key: str) -> dict | None:
    return ws.module_state.get("cards_in", {}).get(key)


# ------------------------------------------------------------------------------------------------ VCL / RTL objects
class TextFile(P.PObj):
    def __init__(self):
        self.name, self.lines, self.pos, self.reading = None, [], 0, False


class Items(P.PObj):
    def __init__(self, items):
        self.items = items

    p_count = property(lambda s: len(s.items))

    def index(self, i):
        i = int(i)
        if i < 0 or i >= len(self.items):
            raise P.PascalError(f"List index out of bounds ({i})")
        return self.items[i]


class FileListBox(P.PObj):
    """TFileListBox: the uploaded file is the only file of C:\\AZCARD\\IN (Mask '*.*'); other directories are empty."""

    def __init__(self, files: dict):
        self.files = files
        self.p_directory, self.p_mask = "", "*.*"

    def m_update(self):
        pass

    @property
    def p_items(self):
        d = self.p_directory.rstrip("\\").upper()
        return Items(sorted(self.files) if d == IN_DIR.upper() else [])


class Strings(P.PObj):
    def __init__(self, lines):
        self.lines = lines

    def m_clear(self):
        self.lines.clear()

    def m_add(self, s):
        self.lines.append(str(s))
        return len(self.lines) - 1

    p_count = property(lambda s: len(s.lines))

    def index(self, i):
        i = int(i)
        if i < 0 or i >= len(self.lines):
            raise P.PascalError(f"List index out of bounds ({i})")      # EStringListError
        return self.lines[i]

    @property
    def p_text(self):
        return "".join(x + "\r\n" for x in self.lines)


class SelAttr(P.PObj):
    def __init__(self, re_):
        self.re = re_

    @property
    def p_color(self):
        return 0

    @p_color.setter
    def p_color(self, v):
        self.re.spans.append([self.re.p_selstart, self.re.p_sellength, v])

    p_style = property(lambda s: [], lambda s, v: None)


class RichEdit(P.PObj):
    """TRichEdit: Lines, Text, FindText (EM_FINDTEXT: one character per line break, RichEdit 2.0+), SelStart / SelLength and
    SelAttributes.Color, recorded as [start, length, colour] spans for the browser."""

    def __init__(self, lines=None, spans=None):
        self.lines = lines if lines is not None else []
        self.spans = spans if spans is not None else []
        self.p_selstart, self.p_sellength, self.p_handle = 0, 0, 0
        self.p_selattributes = SelAttr(self)

    @property
    def p_lines(self):
        return Strings(self.lines)

    @property
    def p_text(self):
        return "".join(x + "\r" for x in self.lines)

    def m_findtext(self, s, start, length, opts):
        t = self.p_text
        start = int(start)
        i = t.find(s, max(start, 0), max(start, 0) + int(length))
        return i

    def m_clear(self):
        self.lines.clear(); self.spans.clear()


class Down(P.PObj):
    def __init__(self, v):
        self.p_down = bool(v)


# ------------------------------------------------------------------------------------------------ data access
class DataSet(AF.DataSet):
    """cards_app_file.DataSet + Append / Insert / FieldByName(..).AsX := / Post (DOA INSERT + CommitOnPost) and ExecSQL."""

    pending = None

    def m_append(self):
        self.pending = {}

    m_insert = m_append

    def m_fieldbyname(self, n):
        if self.pending is not None:
            return WField(self.pending, n.upper())
        return super().m_fieldbyname(n)

    def _table(self):
        m = re.search(r"\bfrom\s+([\w.]+)", self.p_sql.p_text, re.I)
        return m.group(1)

    def m_post(self):
        if self.pending is None:
            raise P.PascalError("Dataset not in edit or insert mode")
        cols = list(self.pending)
        sql = f"insert into {self._table()} ({', '.join(cols)}) values ({', '.join(':b%d' % i for i in range(len(cols)))})"
        b = {"b%d" % i: self.pending[c] for i, c in enumerate(cols)}
        self.pending = None
        self.rt.posts.append([self.name, sql, b])
        if not self.rt.probe:
            self.rt.conn.execute(sql, b)
            self.rt.conn.commit()                         # CommitOnPost

    def m_cancel(self):
        self.pending = None

    def m_execsql(self):
        sql, b = self.p_sql.p_text, dict(self.binds)
        k = iter(range(100))

        def rep(m):
            n = "b%d" % next(k)
            b[n] = m.group(1).replace("''", "'")
            return ":" + n
        sql = re.sub(r"'((?:[^']|'')*)'", rep, sql)
        self.rt.calls.append(["ExecSQL", sql.strip(), b])
        if not self.rt.probe:
            self.rt.conn.execute(sql.strip(), b)


class WField(Field):
    """A field of the record being inserted: AsString / AsInteger / AsFloat / AsDateTime assignments."""

    def __init__(self, rec, name):
        self.rec, self.name = rec, name

    v = property(lambda s: s.rec.get(s.name))

    def _put(self, v):
        self.rec[self.name] = v

    p_asstring = property(Field.p_asstring.fget, lambda s, v: s._put(None if v == "" else str(v)))
    p_asinteger = property(Field.p_asinteger.fget, lambda s, v: s._put(int(v)))
    p_asfloat = property(Field.p_asfloat.fget, lambda s, v: s._put(float(v)))
    p_asdatetime = property(Field.p_asdatetime.fget, lambda s, v: s._put(to_dt(v)))


class Package(P.PObj):
    def __init__(self, rt, pkg):
        self.rt, self.pkg = rt, pkg

    def m_callprocedure(self, name, args):
        self.rt.calls.append([self.pkg, name, list(args)])
        if not self.rt.probe:
            self.rt.conn.call_proc(self.pkg, name, list(args), commit=False)

    def m_callintegerfunction(self, name, args):
        return int(self.rt.conn.call_func(self.pkg, name, list(args), int) or 0)


# ------------------------------------------------------------------------------------------------ runtime
def _strtofloat(s):
    t = str(s).strip()
    try:
        if DEC != "." and "." in t:
            raise ValueError
        return float(t.replace(DEC, ".")) if t else float("x")
    except ValueError:
        raise P.PascalError(f"'{s}' is not a valid floating point value") from None


def _insert(interp, nodes):
    """System.Insert(Source, var S, Index)."""
    src = str(interp.ev(nodes[0])); s = interp.ev(nodes[1]); i = int(interp.ev(nodes[2]))
    i = max(i, 1)
    s = s + src if i > len(s) else s[:i - 1] + src + s[i - 1:]
    interp.assign(nodes[1], s)


_insert.pascal_byref = True


def _inc(interp, nodes):
    interp.assign(nodes[0], interp.ev(nodes[0]) + (int(interp.ev(nodes[1])) if len(nodes) > 1 else 1))


_inc.pascal_byref = True


def _extractfileext(n):
    n = str(n)
    i = max(n.rfind("."), -1)
    if i < 0 or i < max(n.rfind("\\"), n.rfind(":")):
        return ""
    return n[i:]


def _encodedate(y, m, d):
    try:
        return serial(dt.datetime(int(y), int(m), int(d)))
    except ValueError:
        raise P.PascalError("Invalid argument to date encode") from None


class Runtime(AF.Runtime):
    def __init__(self, conn, files: dict, answers=None, probe=False, now=None):
        super().__init__(conn, now)
        self.in_files, self.answers, self.probe = files, list(answers or []), probe
        self.posts, self.asked = [], []

    def builtins(self, routines):
        b = super().builtins(routines)
        rt = self

        def reset(interp, nodes):
            f = interp.ev(nodes[0])
            n = (f.name or "")
            base = n.rsplit("\\", 1)[-1]
            if n.upper().startswith(IN_DIR.upper() + "\\") and base in rt.in_files:
                f.lines = split_lines(rt.in_files[base])
            elif n in rt.files:
                f.lines = rt.files[n].lines
            else:
                raise P.PascalError("File not found")
            f.pos, f.reading = 0, True
        reset.pascal_byref = True

        def readln(interp, nodes):
            f = interp.ev(nodes[0])
            v = f.lines[f.pos] if f.pos < len(f.lines) else ""
            f.pos = min(f.pos + 1, len(f.lines))
            if len(nodes) > 1:
                interp.assign(nodes[1], v)
        readln.pascal_byref = True

        def messagedlg(msg, typ, buttons, help_):
            btn = buttons if isinstance(buttons, list) else [buttons]
            if btn == [MR["mrok"]]:
                rt.messages.append(str(msg)); return MR["mrok"]
            rt.asked.append(str(msg))
            if rt.answers:
                return MR[rt.answers.pop(0)]
            raise NeedAnswer(str(msg), btn)

        b.update({
            "reset": reset, "readln": readln, "messagedlg": messagedlg, "insert": _insert, "encodedate": _encodedate, "extractfileext": _extractfileext, "inc": _inc,
            "now": lambda: serial(rt.now), "strtofloat": _strtofloat, "abs": abs, "pos": lambda sub, s: str(s).find(str(sub)) + 1,
            "getcurrentdir": lambda: "C:\\SmartBank", "sendmessage": lambda *a: 0, "em_linescroll": 0xB6,
            "decimalseparator": DEC, "mtinformation": "mtInformation", "mtconfirmation": "mtConfirmation",
            "mbok": MR["mrok"], "mbcancel": MR["mrcancel"], "mbyestoall": MR["mryestoall"], "mrok": MR["mrok"],
            "mrcancel": MR["mrcancel"], "mryestoall": MR["mryestoall"], "clblue": "clBlue", "clred": "clRed",
            "stmatchcase": "stMatchCase", "application": P.Sink("Application"),
        })
        return b

    def out_files(self) -> list[dict]:
        out = []
        for path, f in self.files.items():
            data = "".join(x + "\r\n" for x in f.lines).encode(CODEPAGE, errors="replace")
            lp = AF._local(path)
            if lp and not self.probe:
                os.makedirs(os.path.dirname(lp), exist_ok=True)
                with open(lp, "wb") as fh:
                    fh.write(data)
            out.append({"name": path.rsplit("\\", 1)[-1], "delphi_path": path, "size": len(data), "b64": base64.b64encode(data).decode()})
        return out


def run_routine(u, name, form, b, routines=()):
    r = P.Routine(u, name, form, b)
    r.factories = {"textfile": TextFile}
    for n in routines:
        rr = P.Routine(u, n, form, b)
        rr.factories = {"textfile": TextFile}
        b[n] = rr
    return r.invoke([None])


def lines_view(lines, spans) -> list[dict]:
    """Rich text -> lines with coloured ranges (span positions count one character per line break)."""
    out, pos = [], 0
    starts = []
    for ln in lines:
        starts.append(pos); pos += len(ln) + 1
    res = [{"text": ln, "marks": []} for ln in lines]
    for st, n, col in spans:
        st, n = int(st), int(n)
        if st < 0 or n <= 0:
            continue
        for i, s0 in enumerate(starts):
            e0 = s0 + len(lines[i])
            a, z = max(st, s0), min(st + n, e0)
            if a < z:
                res[i]["marks"].append([a - s0, z - a, str(col)])
    return res
