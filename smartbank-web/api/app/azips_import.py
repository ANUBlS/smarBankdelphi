"""AZIPS part 3b - incoming import (Delphi toolbar button 'Konvert' = ToolButton4Click, also fired by Timer1Timer).

Executed from the verbatim Delphi source by pascal.py, like part 3a:
  delphi_src/ToolButton4Click.pas    = SWIFT_MAINImpl1.pas :3786-3818  (file list + mask from settings.INN_FILETYPE)
  delphi_src/KonvertexExecute.pas    = :538-684   (INN_FILETYPE 0 / *.SWF: the whole body is commented out -> does nothing)
  delphi_src/konvert3Execute.pas     = :6480-6652 (INN_FILETYPE 1 / *.fin: parses each file, sw_main.insert_in / insert_in_other)
  delphi_src/cheskaccountExecute.pas = :5284-5325 (called at the end of konvert3: check_account for status 2 MT103 rows, commit)
Konver102Execute (:2112) is called only from inside the commented-out Konvertex body, so it is unreachable and not run.

Delphi reads the files that a TFileListBox shows in sw_settings.PATH. Here the user uploads ONE file in the browser (the bank's
current way of working); it is the only FileListBox item when it matches the mask, otherwise the list is empty (same as Delphi:
a file with another extension is not listed). movefile(PATH\\f -> PATH\\ddmmyy\\f) has no folder on the server and is reported
only. Timer1 (Enabled=False in the .dfm) is switched on by ActiveFormCreate :2421-2431 when sw_settings.ConvInterval > 0 and
then clicks Konvert every ConvInterval ms on the folder. The bank uploads incoming files by hand today, so by the user's decision
no scheduled folder poll is added (deliberate difference, documented in PARITY_AZIPS.md).
"""
from __future__ import annotations
import fnmatch

from . import azips_files as F
from . import azips_sql as Q
from . import pascal as P

MEMO3_LINES = 210        # SWIFT_MAINImpl1.dfm:294-512 Memo3.Lines.Strings = 210 empty strings (Visible=False)


class Form(F.Module):
    """TSWIFT_MAIN with its own fields (OutFilePath, struktur are form fields assigned by ToolButton4Click)."""

    def set(self, n, v):
        self.items[n] = v


class Memo(P.PObj):
    """TMemo. Lines[i] := s for i >= Count is silently ignored (TMemoStrings.Put: EM_LINEINDEX returns -1)."""

    def __init__(self, n):
        self.lines = [""] * n
        self.p_lines = self

    def setindex(self, i, v):
        i = int(i)
        if 0 <= i < len(self.lines):
            self.lines[i] = str(v)

    def index(self, i):
        return self.lines[int(i)]

    @property
    def p_text(self):
        return "".join(x + "\r\n" for x in self.lines)


class FileListBox(P.PObj):
    def __init__(self, uploaded):
        self.uploaded = uploaded          # {name: bytes}
        self.p_mask = "*.*"
        self.p_items = self

    def m_applyfilepath(self, *a):
        pass

    m_update = m_refresh = m_repaint = m_applyfilepath

    def _names(self):
        # Windows FindFirst masks are case-insensitive; the list box is sorted
        return sorted((n for n in self.uploaded if fnmatch.fnmatch(n.lower(), self.p_mask.lower())), key=str.lower)

    @property
    def p_count(self):
        return len(self._names())

    def index(self, i):
        return self._names()[int(i)]


def _read_lines(data: bytes):
    """Readln on a TextFile: CR LF, LF or CR end a line (ANSI code page of the client)."""
    s = data.decode(F.CODEPAGE, errors="replace")
    out, i, n = [], 0, len(s)
    while i < n:
        j = i
        while j < n and s[j] not in "\r\n":
            j += 1
        out.append(s[i:j])
        if j < n and s[j] == "\r":
            j += 1
        if j < n and s[j] == "\n":
            j += 1
        i = j
    return out


def import_file(conn, name: str, data: bytes, branch_lines, now=None) -> dict:
    rt = F.Runtime(conn, now)
    st = F._settings_rows(conn)
    flb = FileListBox({name: data})
    sw_in = F.DataSet(rt, "sw_in", branch_lines)
    mod = F.Module({
        "sw_settings": F.DataSet(rt, "sw_settings", Q.LINES_SW_SETTINGS, st),
        "settings": F.DataSet(rt, "settings", Q.LINES_SW_SETTINGS, st),
        "sw_in": sw_in, "sw_in2": F.DataSet(rt, "sw_in2", Q.LINES_SW_IN2, []),
        "sw_in_insert": F.Package(rt, Q.PKG_MAIN), "sb_aca": F.Package(rt, "SB_ACA"),
    })
    form = Form({"swdatamodule": mod, "sw_out_filelistbox": flb, "memo3": Memo(MEMO3_LINES),
                     "richedit2": _sink_with_lines("RichEdit2"),
                     "gridin": F.Grid(sw_in, []), "outfilepath": "", "struktur": ""})
    moved, read = [], []
    b = rt.builtins()

    def reset(interp, args):            # Reset(fl, name) as written at :6497 (= AssignFile + Reset)
        f = interp.ev(args[0])
        if len(args) > 1:
            f.name = interp.ev(args[1])
        if f.name not in flb.uploaded:
            raise P.PascalError(f"File not found: {f.name}")
        f.buf, f.open, f.reading = _read_lines(flb.uploaded[f.name]), True, True
        read.append(f.name)
    reset.pascal_byref = True

    def readln(interp, args):
        f = interp.ev(args[0])
        v = f.buf.pop(0) if f.buf else ""
        if len(args) > 1:
            interp.assign(args[1], v)
    readln.pascal_byref = True

    write_close = b["closefile"]

    def closefile(f):
        if getattr(f, "reading", False):
            f.open = False
        else:
            write_close(f)

    def eof(f):
        return not f.buf

    b.update({"reset": reset, "readln": readln, "closefile": closefile, "eof": eof, "getcurrentdir": lambda: "",
              "pchar": lambda s: s, "date": lambda: rt.now.replace(hour=0, minute=0, second=0, microsecond=0),
              "movefile": lambda a, c: moved.append([a, c]) or True})
    fac = {"textfile": F.TextFile}
    for act, src in (("konvertex", "KonvertexExecute"), ("konvert3", "konvert3Execute"), ("cheskaccount", "cheskaccountExecute")):
        o = P.Sink(act)
        o.props["execute"] = P.Bound((lambda s=src: _run(form, b, s, fac)), "execute")
        form.items[act] = o
    error = None
    try:
        _run(form, b, "ToolButton4Click", fac)
    except P.PascalUnsupported:
        raise
    except Exception as e:      # noqa: BLE001 - Delphi shows the exception text; nothing is committed
        error = str(e)
    if error:
        conn.rollback()
    fmt = int((st[0].get("INN_FILETYPE") if st else 0) or 0)
    return {"file": name, "listed": flb.p_count > 0, "mask": flb.p_mask, "fileformat": fmt, "read": read,
            "calls": rt.calls, "moved": moved, "messages": rt.messages, "error": error, "committed": rt.committed}


def _sink_with_lines(n):
    o = P.Sink(n); o.props["lines"] = P.Sink(n + ".Lines")
    return o


def _run(form, b, src, fac):
    body, vars_ = F.load(src)
    P.Interp(form, b, P.init_locals(vars_, fac)).execute(body)
