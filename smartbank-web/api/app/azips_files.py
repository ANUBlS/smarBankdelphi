"""AZIPS part 3 - outgoing file generation (Delphi 'Avtorizator' button = CreateFileClick -> PACS0008Execute).

The two Delphi procedures are executed from their verbatim source (delphi_src/CreateFileClick.pas = SWIFT_MAINImpl1.pas
:3115-3203, delphi_src/PACS0008Execute.pas = :686-2071) by the Pascal-subset interpreter in pascal.py, against the runtime
objects below (SWDataModule datasets on the Unit2.dfm SQL, TOraclePackage sw_main / SB_ACA, TStringList, TextFile, the
grids with their selected rows). This keeps every literal, blank, CRLF, field and branch exactly as Delphi has it.

Files: Delphi writes <sw_settings.path_out>\\pacs<00000id>.xml with Writeln on a TextFile, i.e. text + CRLF converted to the
Windows ANSI code page of the client (AZIPS_FILE_CODEPAGE, default cp1254 = Azerbaijani-Latin/Turkish Windows; characters
outside it become '?', as the RTL does). The web returns the files for download and, when AZIPS_OUT_DIR is set, also writes
them into that server folder (the Windows path_out cannot be used on the Linux server).
"""
from __future__ import annotations
import base64
import datetime as dt
import functools
import os
import re
from decimal import Decimal

from . import azips_sql as Q
from . import pascal as P

SRC_DIR = os.path.join(os.path.dirname(__file__), "delphi_src")
CODEPAGE = os.getenv("AZIPS_FILE_CODEPAGE", "cp1254")
DECIMAL_SEPARATOR = os.getenv("AZIPS_DECIMAL_SEPARATOR", ",")      # Windows regional setting of the Delphi client
OUT_DIR = os.getenv("AZIPS_OUT_DIR", "")

# Unit2.dfm datasets used here (verbatim, generated into azips_sql.py)
MR = {"mryes": 6, "mrno": 7, "mrcancel": 2, "mryestoall": 10, "mrok": 1}


@functools.lru_cache(None)
def load(name: str):
    txt = open(os.path.join(SRC_DIR, name + ".pas"), encoding="utf-8").read()
    m = re.match(r"\{ Verbatim copy of .*? lines (\d+)-(\d+) .*?\}\n", txt)
    return P.parse_procedure(txt[m.end():], int(m.group(1)))


# ------------------------------------------------------------------------------------------------ runtime objects
class Field(P.PObj):
    def __init__(self, name, v):
        self.name, self.v = name, v

    @property
    def p_asstring(self):
        v = self.v
        if v is None:
            return ""
        if isinstance(v, bool):
            return "True" if v else "False"
        if isinstance(v, (float, Decimal)):
            return P.float_to_str(v, DECIMAL_SEPARATOR)
        if isinstance(v, dt.datetime):
            return v.strftime("%d.%m.%Y") if v.time() == dt.time() else v.strftime("%d.%m.%Y %H:%M:%S")
        if isinstance(v, dt.date):
            return v.strftime("%d.%m.%Y")
        return str(v)

    @property
    def p_asinteger(self):
        v = self.v
        return 0 if v is None else int(v)

    @property
    def p_asfloat(self):
        return 0.0 if self.v is None else float(self.v)

    @property
    def p_asdatetime(self):
        v = self.v
        if v is None:
            return dt.datetime(1899, 12, 30)
        if isinstance(v, str):
            return dt.datetime.fromisoformat(v)
        return v

    p_value = property(lambda s: s.v)


class StringsSQL(P.PObj):
    def __init__(self, lines):
        self.lines = list(lines)
        self.changed = False

    def m_clear(self):
        self.lines = []; self.changed = True

    def m_add(self, s):
        self.lines.append(s); self.changed = True

    @property
    def p_text(self):
        return "".join(x + "\r\n" for x in self.lines)

    def index(self, i):
        return self.lines[int(i)]


class DataSet(P.PObj):
    """TOracleDataSet on a verbatim Unit2.dfm query. Persistent field objects (e.g. settingsPATH) via SWDataModule."""

    def __init__(self, rt, name, lines, rows=None, binds=None):
        self.rt, self.name, self.p_sql = rt, name, StringsSQL(lines)
        self.binds = dict(binds or {})
        self.rows = rows
        self.pos = 0

    def _ensure(self):
        if self.rows is None:
            self.m_open()

    def m_open(self):
        sql, b = self.p_sql.p_text, dict(self.binds)
        if self.p_sql.changed:
            # Delphi concatenates field values as quoted literals (datatemps :1793/:1841); the same text is sent with the
            # literals turned into bind variables - same statement for Oracle, no injection path.
            k = iter(range(100))

            def rep(m):
                n = "b%d" % next(k)
                b[n] = m.group(1).replace("''", "'")
                return ":" + n
            sql = re.sub(r"'((?:[^']|'')*)'", rep, sql)
        self.rows = [dict(x) for x in self.rt.conn.query(sql, b)]
        self.pos = 0

    def m_close(self):
        self.rows = None

    def m_refresh(self):
        self.rt.refreshed.add(self.name)

    def m_setvariable(self, n, v):
        self.binds[n.lower()] = v

    def m_first(self):
        self.pos = 0

    def m_next(self):
        self._ensure()
        if self.pos < len(self.rows):
            self.pos += 1

    @property
    def p_eof(self):
        self._ensure(); return self.pos >= len(self.rows)

    @property
    def p_recordcount(self):
        self._ensure(); return len(self.rows)

    def m_fieldbyname(self, n):
        self._ensure()
        r = self.rows[self.pos] if self.pos < len(self.rows) else None
        if r is None:
            return Field(n, None)
        for k in r:
            if k.upper() == n.upper():
                return Field(n, r[k])
        raise P.PascalError(f"{self.name}: Field '{n}' not found")

    def m_gotobookmark(self, bm):
        self._ensure()
        self.pos = next(i for i, r in enumerate(self.rows) if r.get("ID") == bm)

    def current_id(self):
        self._ensure()
        return self.rows[self.pos].get("ID") if self.pos < len(self.rows) else None


class Package(P.PObj):
    def __init__(self, rt, pkg):
        self.rt, self.pkg = rt, pkg

    def m_callintegerfunction(self, name, args):
        return int(self.rt.conn.call_func(self.pkg, name, list(args), int) or 0)

    def m_callprocedure(self, name, args):
        self.rt.calls.append([self.pkg, name, list(args)])
        self.rt.conn.call_proc(self.pkg, name, list(args), commit=False)


class Bookmarks(P.PObj):
    """TBookmarkList: kept sorted by bookmark (= dataset order), not by click order."""

    def __init__(self, grid, ids):
        self.grid = grid
        order = [r.get("ID") for r in (grid.ds.rows or [])]
        self.items = sorted(set(ids) & set(order), key=order.index)

    p_count = property(lambda s: len(s.items))

    @property
    def p_currentrowselected(self):
        return self.grid.ds.current_id() in self.items

    @p_currentrowselected.setter
    def p_currentrowselected(self, v):
        cid = self.grid.ds.current_id()
        if v and cid not in self.items:
            order = [r.get("ID") for r in self.grid.ds.rows]
            self.items = sorted(self.items + [cid], key=order.index)

    @property
    def p_items(self):
        return self

    def index(self, i):
        return self.items[int(i)]


class Grid(P.PObj):
    def __init__(self, ds, selected):
        self.ds = ds
        self.p_selectedrows = Bookmarks(self, selected)
        self.p_datasource = P.Sink("DataSource")
        self.p_datasource.props["dataset"] = ds
        self.p_canfocus = True

    def m_setfocus(self):
        pass


class Module(P.PObj):
    """SWDataModule: datasets by name and persistent fields <dataset><FIELD> (settingsPATH, settingsINN_FILETYPE)."""

    def __init__(self, items):
        self.items = items

    def has(self, n):
        return n in self.items or self._pf(n) is not None

    def _pf(self, n):
        for k in sorted(self.items, key=len, reverse=True):
            if n.startswith(k) and len(n) > len(k) and isinstance(self.items[k], DataSet):
                return self.items[k], n[len(k):]
        return None

    def get(self, n):
        if n in self.items:
            return self.items[n]
        ds, f = self._pf(n)
        return ds.m_fieldbyname(f)


class StringList(P.PObj):
    def __init__(self):
        self.lines = []

    @property
    def p_text(self):
        return "".join(x + "\r\n" for x in self.lines)

    @p_text.setter
    def p_text(self, s):
        # TStrings.SetTextStr: CR, LF or CRLF end a line; no empty line after a trailing break
        self.lines = []
        s = str(s)
        i, n = 0, len(s)
        while i < n:
            j = i
            while j < n and s[j] not in "\r\n":
                j += 1
            self.lines.append(s[i:j])
            if j < n and s[j] == "\r":
                j += 1
            if j < n and s[j] == "\n":
                j += 1
            i = j

    p_count = property(lambda s: len(s.lines))

    def index(self, i):
        i = int(i)
        if i < 0 or i >= len(self.lines):
            raise P.PascalError(f"List index out of bounds ({i})")
        return self.lines[i]

    def m_free(self):
        pass


class TStringListClass(P.PObj):
    def m_create(self):
        return StringList()


class TextFile(P.PObj):
    def __init__(self):
        self.name, self.buf, self.open = None, None, False


# ------------------------------------------------------------------------------------------------ runner
class Runtime:
    def __init__(self, conn, now=None):
        self.conn = conn
        self.now = now or dt.datetime.now()
        self.files: dict[str, bytes] = {}
        self.messages: list[str] = []
        self.confirms: list[str] = []
        self.calls: list = []
        self.plugins: list = []
        self.refreshed: set = set()
        self.committed = False

    def builtins(self):
        rt = self

        def assignfile(f, name):
            f.name = name

        def rewrite(f):
            f.buf, f.open = [], True
            rt.files[f.name] = b""

        def writeln(f, *a):
            f.buf.append("".join(str(x) for x in a) + "\r\n")

        def closefile(f):
            rt.files[f.name] = "".join(f.buf).encode(CODEPAGE, errors="replace")
            f.open = False

        def messagedlg(msg, typ, buttons, help_):
            rt.confirms.append(msg)
            # the web asks once for the whole selection = 'Yes to all' + 'Yes' on the count question
            return MR["mryestoall"] if MR["mryestoall"] in buttons else MR["mryes"]

        def pluginloader(name, p1, p2):
            rt.plugins.append([name, p1, p2])

        def commit():
            rt.conn.commit(); rt.committed = True

        session = P.Sink("SBSession"); session.props["commit"] = P.Bound(commit, "commit")
        sboapi = P.Sink("sboapiDataModule"); sboapi.props["sbsession"] = session
        b = {
            "copy": P.d_copy, "trim": P.d_trim, "length": lambda s: len(s), "inttostr": lambda i: str(int(i)),
            "floattostr": lambda v: P.float_to_str(v, DECIMAL_SEPARATOR), "frac": lambda v: v - int(v),
            "formatdatetime": P.format_datetime, "now": lambda: rt.now, "format": P.d_format,
            "stringreplace": lambda s, a, c, fl: s.replace(a, c) if "rfignorecase" not in fl else re.sub(re.escape(a), lambda m: c, s, flags=re.I),
            "rfreplaceall": "rfreplaceall", "rfignorecase": "rfignorecase",
            "replacestr": lambda s, a, c: s.replace(a, c) if a else s, "uppercase": lambda s: s.upper(), "pos": lambda a, s: s.find(a) + 1,
            "directoryexists": lambda d: True, "mkdir": lambda d: None,
            "assignfile": assignfile, "rewrite": rewrite, "writeln": writeln, "closefile": closefile,
            "messagedlg": messagedlg, "showmessage": lambda m: rt.messages.append(str(m)),
            "mtconfirmation": "mtConfirmation", "mtinformation": "mtInformation", "mterror": "mtError",
            "pointer": lambda x: x, "true": True, "false": False, "pluginloader": pluginloader,
            "application": P.Sink("Application"), "tstringlist": TStringListClass(), "sboapidatamodule": sboapi,
        }
        for k in ("mbyes", "mbno", "mbcancel", "mbyestoall", "mbok"):
            b[k] = MR["mr" + k[2:]]
        b.update({k: v for k, v in MR.items()})
        return b


def _settings_rows(conn):
    return [dict(x) for x in conn.query(Q.text(Q.LINES_SW_SETTINGS))]


def create_files(conn, out3_rows, out2_rows, selected: list[int], current: int, out2_current: int | None, now=None) -> dict:
    """CreateFileClick (SWIFT_MAINImpl1.pas:3115-3203) with PACS0008Execute (:686-2071) run verbatim.
    out3_rows / out2_rows: the SW_OUT3 ('Sending') and sw_out_2 ('Committed') grid rows as the user sees them."""
    rt = Runtime(conn, now)
    sw_out3 = DataSet(rt, "sw_out3", Q.LINES_SW_OUT3, out3_rows)
    sw_out_2 = DataSet(rt, "sw_out_2", Q.LINES_SW_OUT_2, out2_rows)
    for ds, cid in ((sw_out3, current), (sw_out_2, out2_current)):
        ids = [r.get("ID") for r in ds.rows]
        ds.pos = ids.index(cid) if cid in ids else 0
    st = _settings_rows(conn)
    mod = Module({
        "sw_out3": sw_out3, "sw_out_2": sw_out_2, "sw_out": DataSet(rt, "sw_out", Q.LINES_SW_OUT, []),
        "sw_settings": DataSet(rt, "sw_settings", Q.LINES_SW_SETTINGS, st),
        "settings": DataSet(rt, "settings", Q.LINES_SW_SETTINGS, st),
        "mt102data": DataSet(rt, "MT102data", Q.LINES_MT102DATA), "mt102sum": DataSet(rt, "mt102sum", Q.LINES_MT102SUM),
        "datatemps": DataSet(rt, "datatemps", Q.LINES_DATATEMPS), "swmammount": DataSet(rt, "swmammount", Q.LINES_SWMAMMOUNT),
        "sw_in_insert": Package(rt, Q.PKG_MAIN), "sb_aca": Package(rt, "SB_ACA"),
    })
    edit2 = P.Sink("Edit2")
    form = Module({"swdatamodule": mod, "gridout3": Grid(sw_out3, selected), "gridout2": Grid(sw_out_2, []),
                   "memo1": P.Sink("Memo1"), "edit2": edit2})
    b = rt.builtins()
    act = P.Sink("PACS0008"); act.props["execute"] = P.Bound(_pacs_action(form, b), "execute")
    form.items["pacs0008"] = act
    body, vars_ = load("CreateFileClick")
    error = None
    try:
        P.Interp(form, b, P.init_locals(vars_, {})).execute(body)
    except P.PascalUnsupported:
        raise
    except Exception as e:      # noqa: BLE001 - Delphi shows the exception; files already written stay, no commit/rollback
        error = str(e)
    return _result(rt, edit2, error)


def _pacs_action(form, b):
    def run():
        body, vars_ = load("PACS0008Execute")
        P.Interp(form, b, P.init_locals(vars_, {"textfile": TextFile, "tstringlist": lambda: None})).execute(body)
    return run


def _result(rt, edit2, error=None):
    files = []
    for full, data in rt.files.items():
        name = full.replace("/", "\\").rsplit("\\", 1)[-1]
        if OUT_DIR:
            os.makedirs(OUT_DIR, exist_ok=True)
            with open(os.path.join(OUT_DIR, name), "wb") as fh:
                fh.write(data)
        files.append({"name": name, "delphi_path": full, "size": len(data), "b64": base64.b64encode(data).decode()})
    return {"files": files, "messages": rt.messages, "confirms": rt.confirms, "error": error, "committed": rt.committed, "calls": rt.calls, "plugins": rt.plugins,
            "edit2": edit2.props.get("text"), "server_dir": OUT_DIR or None}
