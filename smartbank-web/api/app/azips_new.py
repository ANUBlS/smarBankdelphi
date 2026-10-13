"""AZIPS part 2b - filereport.bpl 'Azipsnew' = Packages/Cards_New/FileReprt/Unitazips.pas (Tazips, 4 707 lines).

Opened from the AZIPS main form (SWIFT_MAINImpl1.pas) with Pluginloader('filereport.bpl','Azipsnew', k):
* ToolButton1Click :2337-2353 (toolbar 'Yeni'): k = '1' (new message), after the time check and SW_OUT_NEW right;
* ToolButton2Click :3530-3548 ('Redaktə et', right SW_OUT_EDIT) and grid_outDblClick :3057-3084: k = id (edit),
  ToolButton2 only when SENDERLT <> '103' (MT103 rows go to the part-2 editors);
* GRIDOUT2DblClick :6815-6830 / gridout3DblClick :6832-6838 and CreateFileClick: k = '-'+id (view, all buttons hidden).
Filereportform.pas:188-197 (InitPlugin): v_dey := StrToInt(k); azips := Tazips.Create(nil); azips.ShowModal.

The whole unit runs from its verbatim source (delphi_src/filereport/Unitazips.pas, .dfm, Unitdatamod.dfm, Unit17.pas/.dfm)
on the virtual VCL form of vcl.py. The browser keeps nothing but the control state it is shown; every user action is
sent here and executed by the Delphi event handlers. Modal sub-forms: Tform17 (template name, Unit17.pas) is ported -
when a handler reaches form17.ShowModal and the browser has not answered it yet, the action is undone (state snapshot)
and the browser is asked for the form17 input, then the same action is replayed with the answer. Ttemplate (Unittemplate.pas,
Button2 'Şablondan yüklə' :518-522, which only does Create + ShowModal) runs as a live sub-form: ShowModal fires FormActivate
and returns to the browser without undoing anything; the grid, filters, title sort, 'Şablonu sil' and the double click are
then sent as sub-form actions (template_act) and run the verbatim Unittemplate handlers on the same form state.
TFormat102 (Unit15) is unreachable: RadioButton3Click :3862-3864 has Create/ShowModal commented out, so the MT102 radio
only rearranges the form (run verbatim). The guard below stays in case another path ever reaches it.
"""
from __future__ import annotations
import copy
import datetime as dt
import functools
import os
import secrets

from . import pascal as P
from . import vcl

SRC = os.path.join(os.path.dirname(__file__), "delphi_src", "filereport")
DECIMAL_SEPARATOR = os.getenv("AZIPS_DECIMAL_SEPARATOR", ",")
MAX_FORMS = 5
NOT_PORTED = {"tformat102": "TFormat102 (Unit15.pas, MT102)"}


class NeedModal(Exception):
    def __init__(self, spec):
        super().__init__("modal")
        self.spec = spec


class NotPorted(Exception):
    pass


class SubForm(Exception):
    """A modal form that stays open across requests (Ttemplate): nothing is undone."""
    def __init__(self, spec):
        super().__init__("subform")
        self.spec = spec


@functools.lru_cache(None)
def _unit_src(name):
    src = open(os.path.join(SRC, name + ".pas"), encoding="utf-8-sig").read()
    i = src.index("\nimplementation")
    return src[i + len("\nimplementation"):], src[:i].count("\n") + 2


@functools.lru_cache(None)
def _unit(name):
    return P.Unit(*_unit_src(name))


@functools.lru_cache(None)
def _dfm(name):
    return vcl.load_dfm(os.path.join(SRC, name + ".dfm"))


class Form(P.PObj):
    """A Delphi form instance: controls from the .dfm, methods from the unit, unit-level globals."""

    def __init__(self, app, unit_name, cls_name):
        self.app, self.cls_name = app, cls_name.lower()
        self.dfm = _dfm(unit_name)
        self.unit_name = unit_name
        self.controls = {}
        for o in vcl.walk(self.dfm):
            if o is not self.dfm:
                self.controls[o.name.lower()] = vcl.Control(self, o)
        self.caption = self.dfm.props.get("Caption", "")
        self.closed = False

    @property
    def unit(self):
        return _unit(self.unit_name)

    def routine(self, n):
        return P.Routine(self.unit, n, self, self.app.builtins)

    def unit_method(self, name):
        return self.routine(self.cls_name + "." + name.lower())

    def ref(self, dotted):
        """'DataModbpl.bankssource' in a .dfm property -> object."""
        if not dotted:
            return None
        parts = str(dotted).lower().split(".")
        if parts[0] == "datamodbpl":
            return self.app.dm.items.get(parts[1])
        return self.controls.get(parts[0])

    def _g(self, n):
        """Unit-level variable of this form's unit; Unittemplate has its own 'codex' (interface var, :38-40)."""
        return "template.codex" if (self.unit_name == "Unittemplate" and n == "codex") else n

    def has(self, n):
        n = self._g(n)
        return (n in self.controls or self.unit.has(self.cls_name + "." + n) or self.unit.has(n)
                or n in self.app.globals or n in ("caption", "close", "self", "visible", "modalresult", "showmodal", "free"))

    def get(self, n):
        if n in self.controls:
            return self.controls[n]
        if self.unit.has(self.cls_name + "." + n):
            return self.routine(self.cls_name + "." + n)
        if self.unit.has(n):
            return self.routine(n)
        if self._g(n) in self.app.globals:
            return self.app.globals[self._g(n)]
        if n == "self":
            return self
        if n == "caption":
            return self.caption
        if n == "close":
            return P.Bound(self.close, n)
        if n == "showmodal":
            return P.Bound(lambda: self.app.show_modal(self), n)
        if n in ("free", "visible", "modalresult"):
            return P.Bound(lambda *a: None, n)
        raise P.PascalUnsupported(f"{self.cls_name}.{n}")

    def set(self, n, v):
        if self._g(n) in self.app.globals:
            self.app.globals[self._g(n)] = v; return
        if n == "caption":
            self.caption = v; return
        if n == "modalresult":
            self.closed = bool(v); return
        raise P.PascalUnsupported(f"set {self.cls_name}.{n}")

    def close(self):
        self.closed = True
        h = self.dfm.props.get("OnClose")
        if h and not getattr(self, "_closing", False):
            self._closing = True
            self.unit_method(h).invoke([self, "caFree"])


class FormClass(P.PObj):
    def __init__(self, app, key):
        self.app, self.key = app, key

    def m_create(self, owner):
        if self.key in NOT_PORTED:
            raise NotPorted(NOT_PORTED[self.key])
        if self.key == "tform17":
            return Form(self.app, "Unit17", "TForm17")
        if self.key == "ttemplate":
            return Form(self.app, "Unittemplate", "Ttemplate")
        if self.key == "tdatamodbpl":
            return self.app.dm.create()
        raise P.PascalUnsupported(self.key)


class App:
    """One opened 'Azipsnew' plugin: data module + Tazips + its modal forms, with the Delphi unit globals."""

    def __init__(self, conn, k: str):
        self.conn = conn
        self.messages: list[str] = []
        self.answers: list[dict] = []
        self.asked = 0
        self.dm = vcl.DataModule(_dfm("Unitdatamod"), _ConnRef(self), DECIMAL_SEPARATOR)
        self.globals = {
            # Unitazips.pas:234-239
            "azips": None, "isempty": False, "canclose": False, "n": 0, "codex": 0, "kod": 0, "a": "",
            # Filereportform.pas:85-86
            "v_deyx": "", "x": "", "v_dey": 0, "v_dey2": 0,
            # Unit17.pas / Unitdatamod.pas / Unittemplate / Unit15 form variables
            "form17": None, "datamodbpl": None, "template": None, "format102": None,
            "template.codex": 0,
        }
        self.sub = None
        self.k = k
        self.form = None

    def builtins(self):
        app = self

        def strtoint(s):
            return vcl._strtoint(s)

        def strtofloat(s):
            t = str(s).strip()
            ok = t != "" and all(c in "0123456789+-eE" + DECIMAL_SEPARATOR for c in t)
            try:
                if not ok:
                    raise ValueError
                return float(t.replace(DECIMAL_SEPARATOR, "."))
            except ValueError:
                raise P.PascalError(f"'{s}' is not a valid floating point value") from None

        def delete(interp, nodes):
            s = interp.ev(nodes[0]); i = int(interp.ev(nodes[1])); c = int(interp.ev(nodes[2]))
            if 1 <= i <= len(s) and c > 0:
                s = s[:i - 1] + s[i - 1 + c:]
            interp.assign(nodes[0], s)
        delete.pascal_byref = True

        b = {
            "copy": P.d_copy, "trim": P.d_trim, "length": lambda s: len(s), "inttostr": lambda i: str(int(i)),
            "strtoint": strtoint, "strtofloat": strtofloat, "floattostr": lambda v: P.float_to_str(v, DECIMAL_SEPARATOR),
            "pos": lambda a, s: str(s).find(str(a)) + 1, "uppercase": lambda s: str(s).upper(), "delete": delete,
            "now": lambda: dt.datetime.now(), "date": lambda: dt.datetime.combine(dt.date.today(), dt.time()),
            "timetostr": lambda d: d.strftime("%H:%M:%S"), "datetostr": lambda d: d.strftime("%d.%m.%Y"),
            "stringreplace": lambda s, a, c, fl: str(s).replace(a, c) if "rfignorecase" not in fl else _ireplace(str(s), a, c, "rfreplaceall" in fl),
            "rfreplaceall": "rfreplaceall", "rfignorecase": "rfignorecase",
            "locaseinsensitive": "locaseinsensitive", "lopartialkey": "lopartialkey",
            "char": lambda v: chr(v) if isinstance(v, int) else str(v), "chr": lambda v: chr(int(v)),
            "ord": lambda v: ord(v) if isinstance(v, str) else int(v),
            "showmessage": lambda m: app.messages.append(str(m)), "true": True, "false": False, "nil": None,
            "em_linefromchar": "EM_LINEFROMCHAR", "em_lineindex": "EM_LINEINDEX", "vk_back": 8, "vk_delete": 46,
            "cafree": "caFree", "exception": "exception",
            "screen": P.Sink("Screen"), "crsqlwait": "crSQLWait", "crdefault": "crDefault",   # Screen.Cursor (Unittemplate :279)
            "tform17": FormClass(app, "tform17"), "ttemplate": FormClass(app, "ttemplate"),
            "tformat102": FormClass(app, "tformat102"), "tdatamodbpl": FormClass(app, "tdatamodbpl"),
        }
        return b

    # Filereportform.pas:188-197
    def open(self):
        self.globals["v_dey"] = vcl._strtoint(self.k)
        f = Form(self, "Unitazips", "Tazips")
        self.form = self.globals["azips"] = f
        self._run_form_event(f, "OnCreate")
        self._run_form_event(f, "OnShow")
        self._run_form_event(f, "OnActivate")

    def _run_form_event(self, f, ev):
        h = f.dfm.props.get(ev)
        if h:
            f.unit_method(h).invoke([f])

    def show_modal(self, f):
        if f.cls_name == "ttemplate":
            # TCustomForm.ShowModal -> Show -> OnActivate (FormActivate: DBGrid1.DataSource := sourcetempl, Close, Open)
            self._run_form_event(f, "OnActivate")
            self.sub = f
            raise SubForm(sub_state(f))
        """form17.ShowModal (Unit17): the browser answers with {'edit1': text, 'ok': bool}; 'ok' = Button1 'Yadda saxla'."""
        if self.asked < len(self.answers):
            ans = self.answers[self.asked]; self.asked += 1
            f.controls["edit1"].set_text(str(ans.get("edit1", ""))[:200])
            if ans.get("ok"):
                f.controls["button1"].click()
            return 1 if ans.get("ok") else 2
        raise NeedModal({"form": f.dfm.name, "caption": f.caption,
                         "controls": [c.state() for c in f.controls.values()]})


class _ConnRef:
    """The DB connection of the current request (the plugin state outlives one HTTP request)."""

    def __init__(self, app):
        self.app = app

    def query(self, *a, **k):
        return self.app.conn.query(*a, **k)

    def call_proc(self, *a, **k):
        return self.app.conn.call_proc(*a, **k)

    def call_func(self, *a, **k):
        return self.app.conn.call_func(*a, **k)


def _ireplace(s, a, c, all_):
    import re
    return re.sub(re.escape(a), lambda m: c, s, count=0 if all_ else 1, flags=re.I)


# ------------------------------------------------------------------------------------------------ user actions
TYPE_CLASSES = ("TEdit", "TMemo", "TRichEdit", "TSearchEdit")


def type_text(c: vcl.Control, value: str):
    """The user typed `value` into the control. Characters added at the end go through OnKeyPress one by one, like
    keystrokes (a key set to #0 is dropped, 'ı' becomes 'I' ...); a line break from the browser is the line end of a
    multi-line control. Any other edit (delete, paste in the middle) is applied as the new text."""
    old = c.text
    new = value.replace("\r\n", "\n").replace("\r", "\n")
    if c.cls in ("TMemo", "TRichEdit"):
        new = new.replace("\n", "\r\n")
    else:
        new = new.replace("\n", "")
    if c.maxlength and len(new) > c.maxlength:
        new = new[:c.maxlength]
    h = c.d.props.get("OnKeyPress")
    if not h or not new.startswith(old):
        c.set_text(new)
        return
    i = len(old)
    while i < len(new):
        if new.startswith("\r\n", i):
            c.set_text(c.text + "\r\n"); i += 2; continue
        ch = new[i]; i += 1
        loc = {"key": ch}
        r = c.form.unit_method(h)
        _invoke_key(r, c, loc)
        k = loc["key"]
        if k == "\r":
            continue
        if k and k != "\x00" and k != "\x08":
            if c.maxlength and len(c.text) >= c.maxlength:
                continue
            c.set_text(c.text + k)


def _invoke_key(r, c, loc):
    """Call an OnKeyPress handler (Sender; var Key: Char) and read the var parameter back."""
    class _N:
        pass
    holder = {"key": loc["key"]}

    class _I:
        def ev(self, n):
            return holder["key"] if n == ("k",) else c

        def assign(self, n, v):
            if n == ("k",):
                holder["key"] = v
    it = _I()
    r.invoke([c, holder["key"]], it, [("s",), ("k",)])
    loc["key"] = holder["key"]


def act(app: App, a: dict):
    """One browser action. kinds: type, enter, exit, click, select (combo/lookup/grid row), key (#13), date, close."""
    f = app.form
    name = str(a.get("name", "")).lower()
    kind = a.get("kind")
    if kind == "close":
        f.close(); return
    c = f.controls.get(name)
    if c is None or not c.visible or not c.enabled:
        raise ValueError("control")
    if kind == "type" and c.cls in TYPE_CLASSES and not c.readonly:
        type_text(c, str(a.get("value", ""))[:2000])
    elif kind == "enter":
        c.fire("OnEnter")
    elif kind == "exit":
        c.fire("OnExit")
    elif kind == "key" and a.get("value") == "\r":
        h = c.d.props.get("OnKeyPress")
        if h:
            loc = {"key": "\r"}; _invoke_key(f.unit_method(h), c, loc)
    elif kind == "click" and c.cls in ("TButton", "TRadioButton", "TCheckBox"):
        c.click()
    elif kind == "dblclick":
        c.fire("OnDblClick")
    elif kind == "date" and c.cls == "TDateTimePicker":
        d = dt.datetime.strptime(str(a.get("value")), "%Y-%m-%d")
        c.datetime = d; c.fire("OnChange")
    elif kind == "select" and c.cls == "TComboBox":
        i = int(a.get("value"))
        if not 0 <= i < len(c.items.L):
            raise ValueError("item")
        c.itemindex = i; c.text = c.items.L[i]
        c.fire("OnChange"); c.fire("OnCloseUp"); c.fire("OnSelect")
    elif kind == "select" and c.cls in ("TDBLookupComboBox", "TDBLookupComboboxEh", "TSearchEdit"):
        ds = c.lookup_ds()
        i = int(a.get("value"))
        if ds is None or not ds.active or not 0 <= i < len(ds.rows):
            raise ValueError("row")
        ds.pos = i
        if c.cls == "TSearchEdit":
            c.set_text(str(ds.value(c.d.props.get("SearchField")) or ""))
        else:
            c.keyvalue = ds.value(c.d.props.get("KeyField")); c.text = str(ds.value(c.d.props.get("ListField")) or "")
            c.fire("OnChange"); c.fire("OnCloseUp")
    elif kind == "select" and c.cls == "TDBGrid":
        ds = c.lookup_ds2(); i = int(a.get("value"))
        if ds is None or not ds.active or not 0 <= i < len(ds.rows):
            raise ValueError("row")
        ds.pos = i
    else:
        raise ValueError("action")


class _Column(P.PObj):
    """TColumn passed to OnTitleClick: Column.FieldName, Column.Field.Calculated (no calculated fields on templ)."""
    def __init__(self, fieldname):
        self.p_fieldname = fieldname
        self.p_field = self

    p_calculated = False


TEMPLATE_KINDS = ("type", "title", "select", "dblclick", "delete", "close")


def sub_state(f) -> dict:
    return {"form": f.dfm.name, "caption": f.caption, "closed": f.closed, "controls": [c.state() for c in f.controls.values()]}


def template_act(app: App, a: dict):
    """One action on the open Ttemplate (Unittemplate.pas): Edit1/Edit2 typed (OnChange -> Filter), title click
    (DBGrid1TitleClick, column must be a grid column), row select, double click (DBGrid1DblClick fills azips and closes),
    popup 'Şablonu sil' (ablonusil1Click), close (the form's X)."""
    f = app.sub
    kind = a.get("kind")
    if f is None or kind not in TEMPLATE_KINDS:
        raise ValueError("action")
    g = f.controls["dbgrid1"]
    if kind == "close":
        f.close()
    elif kind == "type":
        name = str(a.get("name", "")).lower()
        if name not in ("edit1", "edit2"):
            raise ValueError("control")
        type_text(f.controls[name], str(a.get("value", ""))[:200])
    elif kind == "title":
        cols = [c.get("FieldName") for c in g.d.props.get("Columns", []) if c.get("FieldName")]
        col = str(a.get("value", ""))
        if col not in cols:                          # only the grid's own column names reach "order by" (sql[6])
            raise ValueError("action")
        f.unit_method(g.d.props["OnTitleClick"]).invoke([_Column(col)])
    else:
        ds = g.lookup_ds2()
        if kind == "select":
            i = int(a.get("value"))
            if ds is None or not ds.active or not 0 <= i < len(ds.rows):
                raise ValueError("row")
            ds.pos = i
        elif kind == "dblclick":
            g.fire("OnDblClick")
        elif kind == "delete":
            f.unit_method("ablonusil1Click").invoke([f])
    if f.closed:
        app.sub = None


def run_sub_action(app: App, a: dict) -> dict:
    app.messages = []
    error = None
    try:
        template_act(app, a)
    except NeedModal:
        error = {"key": "azips.n_unsupported", "what": "modal from Ttemplate"}
    except P.PascalUnsupported as e:
        error = {"key": "azips.n_unsupported", "what": str(e)}
    except ValueError as e:
        error = {"key": "azips.n_bad_action"} if str(e) in ("control", "item", "row", "action") else {"text": str(e)}
    except Exception as e:      # noqa: BLE001 - Application.HandleException
        error = {"text": str(e)}
    r = {"messages": app.messages, "error": error}
    if app.sub is not None:
        r["sub"] = sub_state(app.sub)
    return r


def snapshot(app):
    conn = app.conn
    app.conn = None
    try:
        return copy.deepcopy(app)
    finally:
        app.conn = conn


def run_action(app: App, a: dict | None, answers: list | None = None) -> dict:
    before = snapshot(app)
    app.answers = [x for x in (answers or []) if isinstance(x, dict)][:5]
    app.asked = 0
    app.messages = []
    error = modal = None
    try:
        if a is None:
            app.open()
        else:
            act(app, a)
    except NeedModal as e:
        modal = e.spec
    except SubForm as e:
        return {"messages": app.messages, "error": None, "sub": e.spec}
    except NotPorted as e:
        error = {"key": "azips.n_not_ported", "what": str(e)}
    except P.PascalUnsupported as e:
        error = {"key": "azips.n_unsupported", "what": str(e)}
    except ValueError as e:
        if str(e) in ("control", "item", "row", "action"):
            error = {"key": "azips.n_bad_action"}
        else:
            error = {"text": str(e)}
    except Exception as e:      # noqa: BLE001 - Delphi: Application.HandleException shows the message, the event is aborted
        error = {"text": str(e)}
    if modal is not None:
        msgs = app.messages
        before.conn = app.conn
        return {"_restore": before, "modal": modal, "messages": msgs}
    return {"messages": app.messages, "error": error}


def state(app: App) -> dict:
    f = app.form
    return {"caption": f.caption, "closed": f.closed, "width": f.dfm.props.get("ClientWidth"), "height": f.dfm.props.get("ClientHeight"),
            "controls": [c.state() for c in f.controls.values()]}


# ------------------------------------------------------------------------------------------------ entry points
def store(ws) -> dict:
    return ws.module_state.setdefault("azipsnew", {})


def open_form(ws, k: str) -> dict:
    app = App(ws.conn, k)
    r = run_action(app, None)
    if "_restore" in r:
        r.pop("_restore")
    st = store(ws)
    while len(st) >= MAX_FORMS:
        st.pop(next(iter(st)))
    fid = secrets.token_hex(8)
    if app.form is None:
        return {"fid": None, **r}
    st[fid] = app
    return {"fid": fid, **r, **state(app), "log": app.dm.log}


def form_action(ws, fid: str, a: dict, answers: list | None) -> dict:
    st = store(ws)
    app = st.get(fid)
    if app is None:
        return {"gone": True}
    app.conn = ws.conn
    n0 = len(app.dm.log)
    if a.get("sub") == "template":
        r = run_sub_action(app, a)
        if app.form.closed:
            st.pop(fid, None)
        return {"fid": fid, **r, **state(app), "log": app.dm.log[n0:]}
    if app.sub is not None:                 # the modal Ttemplate is open: the main form gets no input
        return {"fid": fid, "messages": [], "error": {"key": "azips.n_bad_action"}, "sub": sub_state(app.sub), **state(app)}
    r = run_action(app, a, answers)
    if "_restore" in r:
        st[fid] = app = r.pop("_restore")
        app.conn = ws.conn
        return {"fid": fid, **r}
    if app.form.closed:
        st.pop(fid, None)
    return {"fid": fid, **r, **state(app), "log": app.dm.log[n0:]}


def close_form(ws, fid: str):
    store(ws).pop(fid, None)


# ------------------------------------------------------------------------------------------------ callers in SWIFT_MAINImpl1.pas
SQL_TIME = "select to_char(sysdate,'hh24:mi:ss') as time from dual"     # SWIFT_MAINImpl1.dfm:3022 OracleDataSet2 (verbatim)


def toolbutton1(conn) -> dict | None:
    """ToolButton1Click :2337-2353: OracleDataSet2.time > sw_settings.EXpire_t (string compare, as Delphi) -> message;
    else SB_ACA.CheckAdvancedObjectAccess('SW_OUT_NEW') then Pluginloader(..,'1')."""
    from . import azips_sql as Q
    st = conn.query(Q.text(Q.LINES_SW_SETTINGS))
    exp = vcl.Field("EXpire_t", (st[0] if st else {}).get("EXPIRE_T"), DECIMAL_SEPARATOR).p_asstring
    tm = vcl.Field("time", (conn.query(SQL_TIME) or [{}])[0].get("TIME"), DECIMAL_SEPARATOR).p_asstring
    if tm > exp:
        return {"messages": [exp + " -dan sonra əməliyyat yığmaq olmaz!!!"]}
    conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["SW_OUT_NEW"], commit=False)
    return None


from fastapi import Depends                     # noqa: E402
from pydantic import BaseModel, Field as F      # noqa: E402


class OpenIn(BaseModel):
    k: str = F(pattern=r"^-?\d{1,12}$")
    caller: str = F(default="grid_out", pattern=r"^(toolbutton1|toolbutton2|grid_out|gridout2|gridout3)$")


class ActIn(BaseModel):
    fid: str = F(pattern=r"^[0-9a-f]{16}$")
    action: dict
    answers: list = F(default_factory=list, max_length=5)


class FidIn(BaseModel):
    fid: str = F(default="", max_length=16)


def add_routes(r, g, err):
    @r.post("/new-form/open")
    def _open(b: OpenIn, ws=Depends(g)):
        if b.caller == "toolbutton1":
            if b.k != "1":
                err(400, "azips.n_bad_action")
            m = toolbutton1(ws.conn)
            if m:
                return {"fid": None, **m}
        if b.caller == "toolbutton2":
            ws.conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["SW_OUT_EDIT"], commit=False)
        if b.caller in ("gridout2", "gridout3") and not b.k.startswith("-"):
            err(400, "azips.n_bad_action")
        return open_form(ws, b.k)

    @r.post("/new-form/act")
    def _act(b: ActIn, ws=Depends(g)):
        return form_action(ws, b.fid, b.action, b.answers)

    @r.post("/new-form/close")
    def _close(b: FidIn, ws=Depends(g)):
        close_form(ws, b.fid)
        return {"ok": True}
