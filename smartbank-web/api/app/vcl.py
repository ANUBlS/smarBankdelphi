"""Virtual VCL form for running a whole Delphi form unit verbatim with pascal.py (AZIPS part 2b: filereport.bpl 'Azipsnew').

The form is built from its verbatim .dfm (components, captions, Items, Lines, Visible/Enabled/Checked, event bindings) and
the data module from its verbatim .dfm (TOracleDataSet SQL, TOraclePackage PackageName, TDataSource links, persistent
fields). Event handlers are the verbatim routines of the .pas, run by pascal.Unit. The browser shows the controls and
sends user actions (type text, click, select, leave a field); the server applies them the way the VCL does (OnKeyPress per
typed character, OnChange, OnExit, OnClick, radio siblings, Checked:=True firing OnClick) and returns the new control state.

VCL behaviour reproduced here (documented in PARITY_AZIPS.md §2b):
* TControl.SetText only changes (and fires OnChange) when the text differs; TComboBox text set by code fires no OnChange.
* TRadioButton.Checked:=True unchecks the siblings of the same parent and fires OnClick; :=False fires nothing.
* TMemo/TRichEdit Lines: Lines[i] read past the end = '', Lines[i]:=s past the last Windows line is ignored (EM_LINEINDEX
  -1), Lines.Count does not count a trailing empty line, Lines.Add appends a line; Text keeps the CRLFs.
* TOracleDataSet: FieldByName on a closed dataset with persistent fields gives an empty field, without them raises
  "Field 'x' not found"; on an open dataset with persistent fields only those fields exist.
"""
from __future__ import annotations
import datetime as dt
import re

from . import pascal as P


# ------------------------------------------------------------------------------------------------ dfm parser
_DT = re.compile(r"""\s*(?:(?P<str>(?:'(?:[^']|'')*'|\#\d+)+)|(?P<num>-?\d+(?:\.\d+)?)|(?P<id>[A-Za-z_][\w.]*)|(?P<op>[=()\[\]<>{},+]))""")


def _dfm_tokens(text):
    pos, out = 0, []
    line = 1
    while True:
        m = _DT.match(text, pos)
        if not m:
            if text[pos:].strip() == "":
                return out
            raise ValueError(f"dfm lex at {text[pos:pos+30]!r}")
        k = m.lastgroup
        v = m.group(k)
        line += text[pos:m.start(k)].count("\n")
        out.append((k, P._decode_str(v) if k == "str" else v, line))
        pos = m.end()


class DfmObject:
    def __init__(self, name, cls, line, parent=None):
        self.name, self.cls, self.line, self.parent = name, cls, line, parent
        self.props, self.children = {}, []

    def __deepcopy__(self, memo):          # the parsed .dfm is shared, read-only
        return self


def parse_dfm(text: str) -> DfmObject:
    toks = _dfm_tokens(text)
    i = 0

    def value():
        nonlocal i
        k, v, ln = toks[i]
        if k == "str":
            s = v; i += 1
            while toks[i][1] == "+" and toks[i + 1][0] == "str":        # 'abc' + <newline> 'def' = one string
                s += toks[i + 1][1]; i += 2
            return s
        if k == "num":
            i += 1; return float(v) if "." in v else int(v)
        if k == "id":
            i += 1; return {"True": True, "False": False}.get(v, v)
        if v == "(":
            i += 1; L = []
            while toks[i][1] != ")":
                L.append(value())
            i += 1; return L
        if v == "[":
            i += 1; L = []
            while toks[i][1] != "]":
                if toks[i][1] != ",":
                    L.append(toks[i][1])
                i += 1
            i += 1; return L
        if v == "{":
            while toks[i][1] != "}":
                i += 1
            i += 1; return None
        if v == "<":
            i += 1; items = []
            while toks[i][1] != ">":
                assert toks[i][1] == "item"; i += 1; it = {}
                while toks[i][1] != "end":
                    n = toks[i][1]; i += 2; it[n] = value()
                i += 1; items.append(it)
            i += 1; return items
        raise ValueError(f"dfm value {v!r} line {ln}")

    def obj(parent):
        nonlocal i
        _, kw, ln = toks[i]; assert kw in ("object", "inherited"); i += 1
        name = toks[i][1]; i += 1
        assert toks[i][1].startswith(":") or toks[i][1] == ":" or True
        cls = toks[i][1]
        if cls.startswith(":"):
            cls = cls[1:]
        i += 1
        o = DfmObject(name.rstrip(":"), cls, ln, parent)
        while toks[i][1] != "end":
            if toks[i][1] in ("object", "inherited"):
                o.children.append(obj(o)); continue
            pname = toks[i][1]; i += 1
            assert toks[i][1] == "=", (pname, toks[i]); i += 1
            o.props[pname] = value()
        i += 1
        return o

    # 'object Name: TClass' - the lexer keeps 'Name' then ':'? ':' is not an op here: split it beforehand
    toks2 = []
    for t in toks:
        toks2.append(t)
    toks[:] = toks2
    return obj(None)


def _prep(text):
    return re.sub(r"^(\s*(?:object|inherited)\s+)(\w+)\s*:\s*(\w+)", r"\1\2 \3", text, flags=re.M)


def load_dfm(path) -> DfmObject:
    raw = open(path, "rb").read()
    txt = raw[3:].decode("utf-8") if raw[:3] == b"\xef\xbb\xbf" else raw.decode("cp1254")
    return parse_dfm(_prep(txt))


def walk(o):
    yield o
    for c in o.children:
        yield from walk(c)


# ------------------------------------------------------------------------------------------------ strings
class Items(P.PObj):
    """TStrings of a TComboBox (Items)."""

    def __init__(self, owner, L):
        self.owner, self.L = owner, list(L)

    def m_clear(self):
        self.L = []

    def m_add(self, s):
        self.L.append(str(s)); return len(self.L) - 1

    def m_indexof(self, s):
        return self.L.index(s) if s in self.L else -1

    p_count = property(lambda s: len(s.L))

    def index(self, i):
        i = int(i)
        if not 0 <= i < len(self.L):
            raise P.PascalError(f"List index out of bounds ({i})")
        return self.L[i]

    def setindex(self, i, v):
        i = int(i)
        if not 0 <= i < len(self.L):
            raise P.PascalError(f"List index out of bounds ({i})")
        self.L[i] = str(v)

    @property
    def p_text(self):
        return "".join(x + "\r\n" for x in self.L)


class MemoLines(P.PObj):
    """TMemo/TRichEdit Lines over the control text (Windows edit-control line semantics, no word wrap)."""

    def __init__(self, owner):
        self.owner = owner

    def _win(self):
        return self.owner.text.split("\r\n")

    @property
    def p_count(self):
        w = self._win()
        return len(w) - 1 if w[-1] == "" else len(w)

    def index(self, i):
        w = self._win(); i = int(i)
        return w[i] if 0 <= i < len(w) else ""

    def setindex(self, i, v):
        w = self._win(); i = int(i)
        if 0 <= i < len(w):
            w[i] = str(v); self.owner.set_text("\r\n".join(w))

    def m_add(self, s):
        w = self._win(); c = self.p_count
        if c < len(w):
            w.insert(c, str(s))
        else:
            w.append(str(s))
        self.owner.set_text("\r\n".join(w))

    def m_clear(self):
        self.owner.set_text("")

    @property
    def p_text(self):
        w = self._win()[:self.p_count]
        return "".join(x + "\r\n" for x in w)

    @p_text.setter
    def p_text(self, v):
        self.owner.set_text(str(v))


# ------------------------------------------------------------------------------------------------ controls
TEXT_CLASSES = {"TEdit", "TMemo", "TRichEdit", "TSearchEdit", "TComboBox", "TDBLookupComboBox", "TDBLookupComboboxEh"}


class Control(P.PObj):
    def __init__(self, form, d: DfmObject):
        self.form, self.d, self.name, self.cls = form, d, d.name, d.cls
        pr = d.props
        self.parent = d.parent.name if d.parent is not None else None
        self.visible = pr.get("Visible", True)
        self.enabled = pr.get("Enabled", True)
        self.checked = pr.get("Checked", False)
        self.caption = pr.get("Caption", "")
        self.readonly = pr.get("ReadOnly", False)
        self.maxlength = pr.get("MaxLength", 0)
        self.items = Items(self, pr.get("Items.Strings", []))
        self.itemindex = pr.get("ItemIndex", -1)
        if d.cls in ("TMemo", "TRichEdit"):
            L = pr.get("Lines.Strings", [])
            self.text = "".join(x + "\r\n" for x in L)
        elif d.cls in ("TEdit", "TSearchEdit", "TComboBox", "TDBLookupComboBox", "TDBLookupComboboxEh"):
            self.text = pr.get("Text", "")
        else:
            self.text = ""
        if d.cls == "TComboBox" and pr.get("Style") == "csDropDownList":
            self.text = self.items.L[self.itemindex] if 0 <= self.itemindex < len(self.items.L) else ""
        self.keyvalue = None
        self.selstart = len(self.text)
        self.extra = {}
        self.datetime = None
        if d.cls == "TDateTimePicker":
            self.datetime = P_dt(pr.get("Date", 0))

    # events --------------------------------------------------------------------------------------------
    def handler(self, ev):
        n = self.d.props.get(ev)
        return self.form.unit_method(n) if n else None

    def fire(self, ev, *args):
        h = self.handler(ev)
        if h:
            return h.invoke([self, *args])

    # Pascal members --------------------------------------------------------------------------------------
    def has(self, name):
        return True

    def get(self, n):
        if n == "text":
            if self.cls in ("TMemo", "TRichEdit"):
                return self.text
            return self.text
        if n == "lines":
            return MemoLines(self)
        if n == "items":
            return self.items
        if n in ("visible", "enabled", "checked", "caption", "readonly", "itemindex", "keyvalue", "selstart", "maxlength"):
            return getattr(self, n)
        if n in ("datetime", "date"):
            return self.datetime
        if n == "name":
            return self.name
        if n in ("datasource", "listsource"):
            return self.extra.get(n, self.form.ref(self.d.props.get("DataSource" if n == "datasource" else "ListSource")))
        if n.startswith("on") and n[2:]:
            for k in self.d.props:
                if k.lower() == n:
                    h = self.handler(k)
                    return P.Bound(lambda *a: h.invoke(list(a)), n)
            return P.Bound(lambda *a: None, n)
        if n == "click":
            return P.Bound(self.click, n)
        if n == "clear":
            return P.Bound(lambda: self.set_text(""), n)
        if n in ("setfocus", "free", "refresh", "repaint", "show", "hide", "selectall", "update"):
            if n == "show":
                return P.Bound(lambda: setattr(self, "visible", True), n)
            if n == "hide":
                return P.Bound(lambda: setattr(self, "visible", False), n)
            return P.Bound(lambda *a: None, n)
        if n == "perform":
            return P.Bound(self.perform, n)
        if n in self.extra:
            return self.extra[n]
        raise P.PascalUnsupported(f"{self.cls}.{n}")

    def set(self, n, v):
        if n == "text":
            if self.cls == "TComboBox":
                self.text = str(v)
                if self.d.props.get("Style") == "csDropDownList":
                    self.itemindex = self.items.m_indexof(self.text)
                return
            if self.cls in ("TDBLookupComboBox", "TDBLookupComboboxEh"):
                self.lookup_text(str(v)); return
            self.set_text(str(v)); return
        if n == "checked":
            self.set_checked(bool(v)); return
        if n in ("visible", "enabled", "caption", "readonly", "maxlength", "selstart"):
            setattr(self, n, v); return
        if n == "itemindex":
            self.itemindex = int(v)
            self.text = self.items.L[self.itemindex] if 0 <= self.itemindex < len(self.items.L) else ("" if self.d.props.get("Style") == "csDropDownList" else self.text)
            return
        if n == "keyvalue":
            self.lookup_key(v); return
        if n in ("datetime", "date"):
            self.datetime = v; return
        if n in ("datasource", "listsource"):
            self.extra[n] = v; return
        self.extra[n] = v

    # behaviour ---------------------------------------------------------------------------------------------
    def set_text(self, s):
        if s == self.text:
            return
        self.text = s
        self.selstart = len(s)
        if self.cls == "TSearchEdit":
            self.search()
        self.fire("OnChange")

    def set_checked(self, v):
        if self.cls == "TRadioButton":
            if v and not self.checked:
                self.checked = True
                for c in self.form.controls.values():
                    if c is not self and c.cls == "TRadioButton" and c.parent == self.parent:
                        c.checked = False
                self.fire("OnClick")
            elif not v:
                self.checked = False
            return
        if v != self.checked:
            self.checked = v
            if self.cls == "TCheckBox":
                self.fire("OnClick")

    def click(self):
        if self.cls == "TRadioButton":
            self.set_checked(True); return
        if self.cls == "TCheckBox":
            self.set_checked(not self.checked); return
        self.fire("OnClick")

    def perform(self, msg, wp, lp):
        if msg == "EM_LINEFROMCHAR":
            return self.text[:int(wp)].count("\r\n")
        if msg == "EM_LINEINDEX":
            w = self.text.split("\r\n"); i = int(wp)
            return sum(len(x) + 2 for x in w[:i]) if 0 <= i < len(w) else -1
        raise P.PascalUnsupported(f"Perform {msg}")

    def lookup_ds(self):
        src = self.get("datasource" if self.cls == "TSearchEdit" else "listsource")
        return src.dataset if isinstance(src, DataSource) else None

    def search(self):
        """TSearchEdit (third-party, no source in the repo): incremental search = Locate(SearchField, Text, partial,
        case-insensitive) on its DataSource's dataset."""
        ds = self.lookup_ds()
        f = self.d.props.get("SearchField")
        if ds is not None and f and ds.active and self.text:
            ds.locate(f, self.text, True, True)

    def lookup_text(self, s):
        ds = self.lookup_ds()
        self.text = s
        if ds is not None and ds.active:
            if ds.locate(self.d.props.get("ListField", ""), s, False, False):
                self.keyvalue = ds.value(self.d.props.get("KeyField", ""))
            else:
                self.keyvalue = None
        self.fire("OnChange")

    def lookup_key(self, v):
        ds = self.lookup_ds()
        self.keyvalue = v
        if ds is not None and ds.active and ds.locate(self.d.props.get("KeyField", ""), v, False, False):
            self.text = str(ds.value(self.d.props.get("ListField", "")) or "")
        else:
            self.text = ""
        self.fire("OnChange")

    def state(self):
        s = {"name": self.name, "cls": self.cls, "parent": self.parent, "visible": bool(self.visible), "enabled": bool(self.enabled)}
        pr = self.d.props
        for k in ("Left", "Top", "Width", "Height", "Align", "TabOrder"):
            if k in pr:
                s[k.lower()] = pr[k]
        if self.cls in TEXT_CLASSES:
            s["text"] = self.text
        if self.cls in ("TButton", "TRadioButton", "TCheckBox", "TLabel", "TGroupBox", "TPanel"):
            s["caption"] = self.caption
        if self.cls in ("TRadioButton", "TCheckBox"):
            s["checked"] = bool(self.checked)
        if self.cls == "TComboBox":
            s["items"] = list(self.items.L); s["itemindex"] = self.itemindex; s["style"] = pr.get("Style", "csDropDown")
        if self.cls == "TDateTimePicker":
            d = self.datetime
            s["date"] = d.strftime("%Y-%m-%d") if isinstance(d, dt.datetime) else None
        if self.cls in ("TEdit", "TMemo", "TRichEdit") and (self.readonly or self.maxlength):
            s["readonly"] = bool(self.readonly); s["maxlength"] = self.maxlength
        if self.cls in ("TDBLookupComboBox", "TDBLookupComboboxEh", "TSearchEdit"):
            ds = self.lookup_ds()
            lf = pr.get("ListField") or pr.get("SearchField")
            s["list"] = {"field": lf, "key": pr.get("KeyField"), "rows": [], "pos": None}
            if ds is not None and ds.active:
                s["list"]["rows"] = [[str(_cell(r, pr.get("KeyField") or lf) or ""), str(_cell(r, lf) or "")] for r in ds.rows]
                s["list"]["pos"] = ds.pos if ds.rows else None
                s["list"]["fields"] = ds.colnames()
            s["keyvalue"] = None if self.keyvalue is None else str(self.keyvalue)
        if self.cls == "TDBGrid":
            ds = self.lookup_ds2()
            s["columns"] = [c.get("FieldName") for c in pr.get("Columns", []) if c.get("FieldName")]
            s["rows"] = [[str(_cell(r, c) if _cell(r, c) is not None else "") for c in s["columns"]] for r in (ds.rows if ds is not None and ds.active else [])]
            s["pos"] = ds.pos if ds is not None and ds.active and ds.rows else None
        ev = [k for k in pr if k.startswith("On")]
        if ev:
            s["events"] = ev
        return s

    def lookup_ds2(self):
        src = self.form.ref(self.d.props.get("DataSource"))
        return src.dataset if isinstance(src, DataSource) else None


def _cell(r, f):
    if not f:
        return None
    for k in r:
        if k.upper() == f.upper():
            return r[k]
    return None


def P_dt(v):
    return dt.datetime(1899, 12, 30) + dt.timedelta(days=float(v or 0))


# ------------------------------------------------------------------------------------------------ data module
class Field(P.PObj):
    def __init__(self, name, v, dec):
        self.name, self.v, self.dec = name, v, dec

    @property
    def p_asstring(self):
        v = self.v
        if v is None:
            return ""
        if isinstance(v, bool):
            return "True" if v else "False"
        if isinstance(v, float):
            return P.float_to_str(v, self.dec)
        if isinstance(v, dt.datetime):
            return v.strftime("%d.%m.%Y") if v.time() == dt.time() else v.strftime("%d.%m.%Y %H:%M:%S")
        if isinstance(v, dt.date):
            return v.strftime("%d.%m.%Y")
        return str(v)

    p_text = p_asstring
    p_displaytext = p_asstring

    @property
    def p_asinteger(self):
        if self.v is None:
            return 0
        if isinstance(self.v, str):
            return _strtoint(self.v)
        return int(self.v)

    @property
    def p_asfloat(self):
        return 0.0 if self.v is None else float(self.v)

    @property
    def p_asdatetime(self):
        return self.v if self.v is not None else dt.datetime(1899, 12, 30)

    @property
    def p_asvariant(self):
        return self.v

    p_value = p_asvariant

    @property
    def p_isnull(self):
        return self.v is None


def _strtoint(s):
    t = str(s).strip() if False else str(s)
    if not re.fullmatch(r"\s*[-+]?(\d+|\$[0-9A-Fa-f]+)\s*", t) or t != t.strip():
        raise P.PascalError(f"'{s}' is not a valid integer value")
    t = t.strip()
    return int(t[1:], 16) if t.startswith("$") else int(t)


_BIND = re.compile(r":(\w+)")


def bind_names(sql):
    s = re.sub(r"'(?:[^']|'')*'", "''", sql)
    s = re.sub(r"/\*.*?\*/", " ", s, flags=re.S)
    s = re.sub(r"--[^\n]*", " ", s)
    return {m.lower() for m in _BIND.findall(s)}


class DataSet(P.PObj):
    """TOracleDataSet on its verbatim .dfm SQL (TStrings lines joined with CRLF). Variables are bind variables."""

    def __init__(self, mod, d: DfmObject):
        self.mod, self.d, self.name = mod, d, d.name
        self.lines = list(d.props.get("SQL.Strings", []))
        self.pfields = [c.props.get("FieldName", "").upper() for c in d.children if c.cls.endswith("Field")]
        self.pf_objs = {c.name.lower(): c.props.get("FieldName", "") for c in d.children if c.cls.endswith("Field")}
        self.binds = {}
        self.rows, self.pos, self.active = [], 0, False

    def sql_text(self):
        return "\r\n".join(self.lines)

    def m_open(self):
        if self.active:
            return
        sql = self.sql_text()
        names = bind_names(sql)
        b = {k: v for k, v in self.binds.items() if k in names}
        for k in names - set(b):
            b[k] = None                          # DOA: a declared variable that was never set is NULL
        self.mod.log.append(["open", self.name, {k: _j(v) for k, v in b.items()}])
        self.rows = [dict(x) for x in self.mod.conn.query(sql, b)]
        self.pos, self.active = 0, True
        self._all = []
        if self._filtered and self._filter:
            self._apply_filter()

    def m_close(self):
        self.active, self.rows, self.pos = False, [], 0
        self._all = []

    # TDataSet.SQL (TStrings; sql[6] := 'order by ...' in Unittemplate.DBGrid1TitleClick) - edits the dataset's own lines
    @property
    def p_sql(self):
        it = Items(self, [])
        it.L = self.lines
        return it

    # TDataSet.Filter / Filtered (Unittemplate.Edit1Change / Edit2Change: "field = 'text*'")
    _filter, _filtered, _all = "", False, []

    @property
    def p_filter(self):
        return self._filter

    @p_filter.setter
    def p_filter(self, v):
        self._filter = str(v); self._apply_filter()

    @property
    def p_filtered(self):
        return self._filtered

    @p_filtered.setter
    def p_filtered(self, v):
        self._filtered = bool(v); self._apply_filter()

    def _apply_filter(self):
        """Only the simple form used here: <field> = '<text>' where a trailing * is a partial (prefix) compare;
        case-sensitive (FilterOptions = []); a NULL field never matches (TDataSet filter null semantics)."""
        if not self.active:
            return
        if not self._all:
            self._all = self.rows
        m = re.fullmatch(r"\s*(\w[\w$#]*)\s*=\s*'((?:[^']|'')*)'\s*", self._filter or "")
        if not self._filtered or not self._filter:
            self.rows = self._all
        elif m is None:
            raise P.PascalError(f"{self.name}: unsupported filter {self._filter!r}")
        else:
            f, t = m.group(1), m.group(2).replace("''", "'")
            def ok(r):
                c = _cell(r, f)
                if c is None:
                    return False
                c = P.float_to_str(c) if isinstance(c, float) else str(c)
                return c.startswith(t[:-1]) if t.endswith("*") else c == t
            self.rows = [r for r in self._all if ok(r)]
        self.pos = 0; self._eof = False

    m_closeall = m_close

    def m_refresh(self):
        if self.active:
            p = self.pos; self.active = False; self.m_open(); self.pos = min(p, max(len(self.rows) - 1, 0))

    def m_setvariable(self, n, v):
        self.binds[str(n).lower()] = v

    def m_getvariable(self, n):
        return self.binds.get(str(n).lower())

    def m_first(self):
        self.pos = 0

    def m_last(self):
        self.pos = max(len(self.rows) - 1, 0)

    def m_next(self):
        if self.pos < len(self.rows):
            self.pos += 1
            if self.pos == len(self.rows):
                self.pos = len(self.rows) - 1; self._eof = True
                return
        self._eof = False

    def m_prior(self):
        self.pos = max(self.pos - 1, 0)

    _eof = False

    @property
    def p_eof(self):
        return not self.rows or self._eof

    @property
    def p_recordcount(self):
        return len(self.rows) if self.active else 0

    @property
    def p_active(self):
        return self.active

    @p_active.setter
    def p_active(self, v):
        self.m_open() if v else self.m_close()

    @property
    def p_isempty(self):
        return not self.rows

    def colnames(self):
        return list(self.rows[0].keys()) if self.rows else self.pfields

    def value(self, f):
        if not self.active or not self.rows:
            return None
        return _cell(self.rows[self.pos], f)

    def m_fieldbyname(self, n):
        u = str(n).upper()
        if self.pfields and u not in self.pfields:
            raise P.PascalError(f"{self.name}: Field '{n}' not found")
        if not self.active:
            if not self.pfields:
                raise P.PascalError(f"{self.name}: Field '{n}' not found")
            return Field(n, None, self.mod.dec)
        if not self.rows:
            return Field(n, None, self.mod.dec)
        r = self.rows[self.pos]
        for k in r:
            if k.upper() == u:
                return Field(n, r[k], self.mod.dec)
        if u in self.pfields:
            return Field(n, None, self.mod.dec)
        raise P.PascalError(f"{self.name}: Field '{n}' not found")

    def m_locate(self, f, v, opts):
        o = [str(x).lower() for x in (opts or [])]
        return self.locate(f, v, "lopartialkey" in o, "locaseinsensitive" in o)

    def locate(self, f, v, partial, ci):
        for i, r in enumerate(self.rows):
            c = _cell(r, f)
            a, b = ("" if c is None else (P.float_to_str(c) if isinstance(c, float) else str(c))), ("" if v is None else str(v))
            if ci:
                a, b = a.upper(), b.upper()
            if (a.startswith(b) if partial else a == b):
                self.pos = i; self._eof = False
                return True
        return False

    def pfield(self, objname):
        return self.m_fieldbyname(self.pf_objs[objname])


def _j(v):
    return v.isoformat() if isinstance(v, (dt.date, dt.datetime)) else v


class DataSource(P.PObj):
    def __init__(self, mod, d):
        self.mod, self.d = mod, d

    @property
    def dataset(self):
        return self.mod.items.get(str(self.d.props.get("DataSet", "")).lower())

    @property
    def p_dataset(self):
        return self.dataset

    @p_dataset.setter
    def p_dataset(self, v):
        if v is not self.dataset:
            raise P.PascalUnsupported("DataSource.DataSet := other dataset")


class Package(P.PObj):
    def __init__(self, mod, d):
        self.mod, self.pkg = mod, d.props.get("PackageName", d.name)

    def m_callprocedure(self, name, args):
        a = [_j(x) if False else x for x in (args or [])]
        self.mod.log.append(["call", self.pkg, name, [_j(x) for x in a]])
        self.mod.conn.call_proc(self.pkg, name, a, commit=False)

    def m_callintegerfunction(self, name, args):
        self.mod.log.append(["func", self.pkg, name, [_j(x) for x in (args or [])]])
        return int(self.mod.conn.call_func(self.pkg, name, list(args or []), int) or 0)

    def m_callstringfunction(self, name, args):
        self.mod.log.append(["func", self.pkg, name, [_j(x) for x in (args or [])]])
        return str(self.mod.conn.call_func(self.pkg, name, list(args or []), str) or "")


class DataModule(P.PObj):
    def __init__(self, d: DfmObject, conn, dec=","):
        self.d, self.conn, self.dec, self.log = d, conn, dec, []
        self.items = {}
        for c in d.children:
            k = c.name.lower()
            if c.cls == "TOracleDataSet":
                self.items[k] = DataSet(self, c)
            elif c.cls == "TDataSource":
                self.items[k] = DataSource(self, c)
            elif c.cls == "TOraclePackage":
                self.items[k] = Package(self, c)
        self.created = False

    def create(self):
        """TDataModule.Create: datasets with Active = True in the .dfm are opened (form streaming)."""
        if not self.created:
            self.created = True
            for c in self.d.children:
                if c.cls == "TOracleDataSet" and c.props.get("Active"):
                    self.items[c.name.lower()].m_open()
        return self

    def has(self, n):
        return n in self.items or any(n in ds.pf_objs for ds in self.items.values() if isinstance(ds, DataSet))

    def get(self, n):
        if n in self.items:
            return self.items[n]
        for ds in self.items.values():
            if isinstance(ds, DataSet) and n in ds.pf_objs:
                return ds.pfield(n)
        raise P.PascalUnsupported(f"DataModbpl.{n}")


# ------------------------------------------------------------------------------------------------ TRichEdit (XÖHKS step 4)
class RichEditLines(P.PObj):
    """TRichEditStrings: Lines[i] = EM_GETLINE of display line i (WordWrap=False -> one line per paragraph), '' outside."""

    def __init__(self, re_):
        self.re = re_

    def index(self, i):
        i = int(i)
        L = self.re.text.split(self.re.br)
        return L[i] if 0 <= i < len(L) else ""

    @property
    def p_count(self):
        return len(self.re.text.split(self.re.br)) if self.re.text else 0

    def m_loadfromfile(self, name, encoding=None):
        """Lines.LoadFromFile(FileName, TEncoding.UTF8): preamble skipped, invalid bytes replaced; the RichEdit stores every
        line break (CR LF, LF or CR) as one CR (paragraph mark)."""
        if name not in self.re.files:
            raise P.PascalError(f"Cannot open file \"{name}\".")
        s = self.re.files[name]
        if s[:3] == b"\xef\xbb\xbf":
            s = s[3:]
        t = s.decode("utf-8", errors="replace")
        lines = re.split(r"\r\n|\r|\n", t)
        if lines and lines[-1] == "":
            lines.pop()                       # TStrings.SetTextStr: no empty line after a trailing break
        self.re.text = self.re.br.join(lines) + (self.re.br if lines else "")
        self.re.sel = (0, 0)


class RichEdit(P.PObj):
    """Minimal text model of a hidden TRichEdit (WordWrap=False) for the verbatim code that parses it (ConvertToBase):
    character positions count a line break as ONE character (RichEdit CR), FindText = EM_FINDTEXTEX searching down in
    [StartPos, StartPos+Length) (the whole match must lie in the range, -1 when not found), SelStart / SelLength =
    EM_EXSETSEL, SelText = EM_GETSELTEXT (line breaks come back as CR), CaretPos.y = EM_LINEFROMCHAR of the selection end,
    GetTextLen = WM_GETTEXTLENGTH (a break counts as CR LF = 2)."""

    def __init__(self, files=None, br="\r"):
        self.files = files or {}
        self.br = br                          # "\r" = RichEdit 2.0+ (RICHEDIT20W, Delphi 2009+); "\r\n" = RichEdit 1.0
        self.text = ""
        self.sel = (0, 0)
        self.p_lines = RichEditLines(self)

    def m_clear(self):
        self.text, self.sel = "", (0, 0)

    def m_gettextlen(self):
        return len(self.text) + (self.text.count("\r") if self.br == "\r" else 0)

    def m_findtext(self, s, start, length, opts=None):
        n = len(self.text)
        a = int(start)
        b = a + int(length)
        if a < 0:
            a = 0
        if b > n or int(length) < 0:
            b = n
        i = self.text.find(str(s), a)
        return i if i != -1 and i + len(s) <= b else -1

    @property
    def p_selstart(self):
        return self.sel[0]

    @p_selstart.setter
    def p_selstart(self, v):
        v = int(v)
        if v < 0 or v > len(self.text):
            v = len(self.text)                # EM_EXSETSEL cpMin -1 / past the end: caret at the end, nothing selected
        self.sel = (v, v)

    @property
    def p_sellength(self):
        return self.sel[1] - self.sel[0]

    @p_sellength.setter
    def p_sellength(self, v):
        a = self.sel[0]
        b = a + int(v)
        b = max(0, min(b, len(self.text)))
        self.sel = (min(a, b), max(a, b)) if b >= a else (b, a)

    @property
    def p_seltext(self):
        return self.text[self.sel[0]:self.sel[1]]

    @property
    def p_caretpos(self):
        y = self.text.count(self.br, 0, self.sel[1])
        o = P.Sink("CaretPos")
        o.props["y"] = y
        o.props["x"] = self.sel[1] - (self.text.rfind(self.br, 0, self.sel[1]) + len(self.br))
        return o
