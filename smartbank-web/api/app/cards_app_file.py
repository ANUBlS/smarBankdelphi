"""Cards ▸ Application 'FAYL YARAT' (cards_azericard applicationpas.pas, step 3b).

Button2Click :1416 (urgent grid DBGrid1, urg 1) / Button5Click :1393 (simple grid DBGrid2, urg 0): right cardcreatefilenr,
'Fayl yaratmaq istəyirsiniz?', then cr_file2 (:346, credit limit messages, MessType 5 -> 'RCDN' file) and cr_file1 (:516, the
other message types -> 'CCDN' file), dataset Refresh, 'Fayl yaradıldı!'. The routines (with sysday / whenday / when2Str :73-117)
run from their verbatim source (delphi_src/cards_applicationpas.pas) in pascal.py against the runtime below, so every column,
blank, padding loop, line count (Reset / Readln / Append) and card_main 'done*' call is exactly Delphi's. No commit (Delphi has
none here; the card_main.done* procedures are called on the session as DOA does).

Files: Delphi writes C:\\AZCARD\\OUT\\<DDMMYY>\\a<BANKID>... (hard coded, not card_settings.CARDOUT) with Writeln (CRLF, the client's
ANSI code page CARDS_FILE_CODEPAGE, default cp1254). The number in the name is the first one whose file does not exist yet: the web
remembers the files it created (per server process) and, when CARDS_OUT_DIR is set, also writes them into <CARDS_OUT_DIR>/<DDMMYY>/
and treats the files there as existing. The files are returned for download.
"""
from __future__ import annotations
import base64
import datetime as dt
import functools
import os
import re

from . import cards_sql as Q
from . import pascal as P
from .azips_files import DataSet as _DS, Field, Grid, Module, Package

SRC = os.path.join(os.path.dirname(__file__), "delphi_src", "cards_applicationpas.pas")
CODEPAGE = os.getenv("CARDS_FILE_CODEPAGE", "cp1254")
OUT_DIR = os.getenv("CARDS_OUT_DIR", "")
ROOT = "C:\\AZCARD\\OUT"
_CREATED: set[str] = set()                      # Delphi paths created by this process (FileExists)
# :703 / :867 umumi1.SQL.Add('Select * from card_cardtype where (NAME ='''+cardtype+''')and(currency = '''+currency+''')'):
# the same text with the two literals sent as binds (azips_files.DataSet does it for every SQL.Clear/Add statement)
LINES_UMUMI1_BOUND = ["Select * from card_cardtype where (NAME =:b0)and(currency = :b1)"]           # :703 (new card)
LINES_UMUMI1_BOUND2 = ["Select * from card_cardtype where (name =:b0)and(currency = :b1)"]          # :867 (sub card)
MR = {"mryes": 6, "mrno": 7}
_EPOCH = dt.datetime(1899, 12, 30)


@functools.lru_cache(None)
def _unit():
    txt = open(SRC, encoding="utf-8").read()
    m = re.match(r"\{ Verbatim copy of .*? lines (\d+)-(\d+) .*?\}\n", txt)
    return P.Unit(txt[m.end():], int(m.group(1)))


class DataSet(_DS):
    @property
    def p_active(self):
        return self.rows is not None

    @p_active.setter
    def p_active(self, v):
        if v:
            self.m_open()
        else:
            self.m_close()


class TextFile(P.PObj):
    def __init__(self):
        self.name, self.lines, self.pos = None, [], 0


def _serial(d) -> float:
    if isinstance(d, (int, float)):
        return float(d)
    if not isinstance(d, dt.datetime):
        d = dt.datetime(d.year, d.month, d.day)
    return (d - _EPOCH).total_seconds() / 86400.0


def _strtodate(s):
    """SysUtils.StrToDate with ShortDateFormat dd.mm.yyyy (EConvertError text of the RTL)."""
    m = re.fullmatch(r"\s*(\d{1,2})\.(\d{1,2})\.(\d{2,4})\s*", str(s))
    try:
        if not m:
            raise ValueError
        y = int(m.group(3))
        if len(m.group(3)) <= 2:
            y += 2000 if y < 50 else 1900
        return _serial(dt.datetime(y, int(m.group(2)), int(m.group(1))))
    except ValueError:
        raise P.PascalError(f"'{s}' is not a valid date") from None


def _local(path: str) -> str | None:
    if not OUT_DIR:
        return None
    rel = path[len(ROOT) + 1:] if path.upper().startswith(ROOT) else path.rsplit("\\", 1)[-1]
    return os.path.join(OUT_DIR, *rel.split("\\"))


class Runtime:
    def __init__(self, conn, now=None):
        self.conn, self.now = conn, now or dt.datetime.now()
        self.files: dict[str, TextFile] = {}
        self.messages, self.confirms, self.calls = [], [], []
        self.refreshed: set = set()

    def builtins(self, routines):
        rt = self
        today = float(int(_serial(rt.now)))

        def rewrite(f):
            f.lines, f.pos = [], 0
            rt.files[f.name] = f
            _CREATED.add(f.name.upper())

        def readln(f):
            f.pos += 1

        def reset(f):
            f.pos = 0

        def writeln(f, *a):
            f.lines.append("".join(str(x) for x in a))

        def file_exists(path):
            lp = _local(path)
            return path.upper() in _CREATED or (lp is not None and os.path.exists(lp))

        def messagedlg(msg, typ, buttons, help_):
            rt.confirms.append(msg)
            return MR["mryes"]            # the web asked before calling (confirmed=True)

        def dayofweek(d):
            return (dt.date(1899, 12, 30) + dt.timedelta(days=int(_serial(d)))).isoweekday() % 7 + 1

        def isleap(y):
            y = int(y)
            return y % 4 == 0 and (y % 100 != 0 or y % 400 == 0)

        def strtoint(s):
            try:
                return int(str(s).strip())
            except ValueError:
                raise P.PascalError(f"'{s}' is not a valid integer value") from None

        b = {
            "copy": P.d_copy, "trim": P.d_trim, "length": lambda s: len(s), "inttostr": lambda i: str(int(i)),
            "strtoint": strtoint, "strtodate": _strtodate, "uppercase": lambda s: str(s).upper(),
            "floattostr": lambda v: P.float_to_str(v, os.getenv("CARDS_DECIMAL_SEPARATOR", ",")),
            "formatdatetime": P.format_datetime, "date": lambda: today, "time": lambda: _serial(rt.now) - today,
            "dayofweek": dayofweek, "isleapyear": isleap,
            "directoryexists": lambda d: True, "mkdir": lambda d: None, "fileexists": file_exists,
            "assignfile": lambda f, n: setattr(f, "name", n), "rewrite": rewrite, "reset": reset, "append": lambda f: None,
            "eof": lambda f: f.pos >= len(f.lines), "readln": readln, "writeln": writeln,
            "closefile": lambda f: None, "close": lambda f: None,
            "messagedlg": messagedlg, "showmessage": lambda m: rt.messages.append(str(m)),
            "mtconfirmation": "mtConfirmation", "mbyes": MR["mryes"], "mbno": MR["mrno"], "mryes": MR["mryes"], "mrno": MR["mrno"],
            "pointer": lambda x: x, "true": True, "false": False,
        }
        b.update(routines)
        return b


def create_file(conn, grid: str, rows: list, selected: list, now=None) -> dict:
    """Button2Click (grid 'urgent') / Button5Click (grid 'simple') run verbatim; rows = the grid's dataset as the user sees it."""
    rt = Runtime(conn, now)
    st = [dict(x) for x in conn.query(Q.text(Q.LINES_SETTINGS))]
    urgent = DataSet(rt, "urgent", [], rows if grid == "urgent" else [])
    simple = DataSet(rt, "simple", [], rows if grid == "simple" else [])
    dm = Module({
        "urgent": urgent, "simple": simple, "settings": DataSet(rt, "settings", Q.LINES_SETTINGS, st),
        "fcur": DataSet(rt, "FCUR", Q.LINES_FCUR), "cardbr": DataSet(rt, "cardbr", Q.LINES_CARDBR),
        "fkod": DataSet(rt, "fkod", Q.LINES_FKOD), "umumi1": DataSet(rt, "UMUMI1", Q.LINES_UMUMI1),
        "mainpacket": Package(rt, "card_main"), "sb_aca": Package(rt, "SB_ACA"),
    })
    form = Module({"dbgrid1": Grid(urgent, selected if grid == "urgent" else []),
                   "dbgrid2": Grid(simple, selected if grid == "simple" else [])})
    u = _unit()
    routines: dict = {}
    b = rt.builtins(routines)
    apps = P.Sink("Applications"); apps.props["filelistbox1"] = P.Sink("FileListBox1")
    b.update({"datamod_cards": dm, "applications": apps})
    for n in ("sysday", "whenday", "when2str", "cr_file1", "cr_file2"):
        routines[n] = P.Routine(u, n, form, b)
        routines[n].factories = {"textfile": TextFile}
    b.update(routines)
    error = None
    try:
        r = P.Routine(u, "tapplications.button2click" if grid == "urgent" else "tapplications.button5click", form, b)
        r.factories = {"textfile": TextFile}
        r.invoke([None])
    except P.PascalUnsupported:
        raise
    except Exception as e:      # noqa: BLE001 - Delphi shows the exception; what was written / called stays, no commit
        error = str(e)
    files = []
    for path, f in rt.files.items():
        data = "".join(x + "\r\n" for x in f.lines).encode(CODEPAGE, errors="replace")
        lp = _local(path)
        if lp:
            os.makedirs(os.path.dirname(lp), exist_ok=True)
            with open(lp, "wb") as fh:
                fh.write(data)
        files.append({"name": path.rsplit("\\", 1)[-1], "delphi_path": path, "size": len(data), "b64": base64.b64encode(data).decode()})
    return {"files": files, "messages": rt.messages, "confirms": rt.confirms, "error": error, "calls": rt.calls,
            "server_dir": OUT_DIR or None}


__all__ = ["create_file", "Field", "LINES_UMUMI1_BOUND"]
