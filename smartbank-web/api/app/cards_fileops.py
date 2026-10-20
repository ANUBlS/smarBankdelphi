"""Cards ▸ Əməliyyat file forms that share the Tcfile shape (cards_azericard MAINFORMImpl1 PopupMenu2): Dxxx, SMS, Int.Retail, R.Visa,
D File, ... Each form is the Delphi unit's own toolbar:
- ToolButton3 'Yenilə' (the RichEdit preview of the files of C:\\AZCARD\\IN) and isertbtn 'Bazaya Göndər' (card_main inserts per message,
  then card_main.<x>arxiv(file)) run VERBATIM from delphi_src/<unit>.pas in pascal.py (cards_files runtime). The file is the one uploaded by
  hand (the only file of C:\\AZCARD\\IN). MessageDlg questions go to the browser (probe run first, as cards_cfile).
- ToolButton1 'Təsdiq Et': the Delphi loop over DBGrid1.SelectedRows (Count = 0 -> current row): Yes / No / Cancel / Yes to all, then one
  card_main.transaction_<x>(ID) per row; finally WillRefresh -> the grids' Refresh + message. No commit (DOA CallProcedure does not commit).
- ToolButton7 'Excel': CMExcelExport.ExportDataset(<dataset>, '<sheet>', True), all fields.
- DBGrid TitleClick (only when the grid's Options has dgTitleClick): SQL.Add('ORDER BY F'); Refresh; SQL[pos] := '' (sorted for that Refresh).
- PopupMenu 'SELECT ALL'.
FORMS below holds each form's Delphi names, cited by unit:line."""
from __future__ import annotations

import base64

from fastapi import APIRouter, Depends
from fastapi.responses import Response
from pydantic import BaseModel, Field

from . import cards_files as CF
from . import cards_sql as Q
from .azips_files import Module
from .cards import CLSID
from .customers import row

# card_Exchange_file.pas isertbtnClick :173-189 SQL.Clear / Add texts (the quoted file name is sent as a bind)
CF.EXTRA_SELECTS += ["select card_exchange_FILES.rowid,card_exchange_FILES.* from card_exchange_FILES\r\n",
                     "select * from card_exchange_FILES where filename = :b0\r\n"]
CF.DML_TABLES.add("card_exchange_files")

FORMS: dict[str, dict] = {
    # MAINFORMImpl1 MenuItem2Click :1110 (card_dxxxfile) -> TDxxx UnitDxxx.pas
    "dxxx": dict(
        right="card_dxxxfile", src="cards_unitdxxx.pas", cls="tdxxx", rich="redxxx", routines=("checkfileext",),
        filelists=("filelistboxdxxx", "filelistbox1", "filelistboxsmsfiles"), sinks=("toolbar1", "animate1"),
        clicks={"toolbutton2": "tdxxx.toolbutton2click"},
        preview="tdxxx.toolbutton3click", tobase="tdxxx.isertbtnclick",                 # :76 (-> ToolButton2Click :82), :217
        grids={"grid1": ("dxxx", Q.LINES_DXXX), "grid2": ("dxxx2", Q.LINES_DXXX2)},
        sort={},                                        # DBGrid1/2 Options (UnitDxxx.dfm) have no dgTitleClick: TitleClick :427/:448 never run
        confirm=dict(proc="transaction_dxxx", ask="əməliyyat təsdiq edilsin? №", all="%d  sayda əməliyyat təsdiq edlisin?",
                     done="Əməliyyat günün sənədlərinə göndərildi!", refresh=("grid1", "grid2")),            # ToolButton1Click :469
        excel=("grid1", "DXXXFILES"),                                                                         # ToolButton7Click :420
        icons=("grid1", "grid2"),                                                                             # DBGrid1DrawColumnCell :382 (both grids)
    ),
    # MenuItem3Click :1096 (card_smsfiles) -> Tsmsfile sms.pas (an ANSI unit: its strings are Azl Sans Serif Cyrillic code points)
    "sms": dict(
        right="card_smsfiles", src="cards_sms.pas", cls="tsmsfile", rich="refiles", routines=("checkfileext", "monthintnum"),
        filelists=("filelistboxsmsfiles",), cwd_lists=("filelistbox1",), sinks=("toolbar1", "animate1"),
        clicks={"toolbutton2": "tsmsfile.toolbutton2click"}, dbgrids={"dbgrid1": "grid1", "dbgrid3": "grid2"},
        preview="tsmsfile.toolbutton3click", tobase="tsmsfile.isertbtnclick",             # :76, :199 (-> empty_sms_messages, ToolButton2Click :469)
        grids={"grid1": ("smsfiles", Q.LINES_SMSFILES), "grid2": ("smsfiles2", Q.LINES_SMSFILES2)},
        sort={"grid1": ("ID", "TERMINALNAME", "CARDNUMBER", "TERMINAL", "AUTH_CODE", "AMOUNT_TR", "TRANDATE", "CURRENCY", "POST_DATE", "AMOUNTSET", "INFO"),
              "grid2": ("ID", "TERMINALNAME", "CARDNUMBER", "TERMINAL", "AUTH_CODE", "AMOUNT_TR", "TRANDATE", "CURRENCY", "POST_DATE", "AMOUNTSET")},
        confirm=dict(proc="transaction_sms", done=None, refresh=("grid2", "grid1")),     # ToolButton1Click :287: smsfiles2 reopened per row, DBGrid1 Refresh, no message
        excel=("grid1", "SMSFILES"), icons=("grid1", "grid2"),                            # ToolButton7Click :259
    ),
    # IntReatil1Click :1103 (card_intretail) -> Tintfile Unitintfile.pas
    "intretail": dict(
        right="card_intretail", src="cards_unitintfile.pas", cls="tintfile", rich="refiles", routines=("checkfileext",),
        filelists=("filelistintretailfiles",), cwd_lists=("filelistbox1",), sinks=("toolbar1", "animate1"),
        clicks={"toolbutton2": "tintfile.toolbutton2click"},
        preview="tintfile.toolbutton3click", tobase="tintfile.isertbtnclick",             # :77, :210 (-> empty_intretail, ToolButton2Click :522)
        grids={"grid1": ("intfiles", Q.LINES_INTFILES), "grid2": ("intfile2", Q.LINES_INTFILE2)},
        sort={"grid1": ("ID", "CHANELL", "TR_TYPE", "OUTWORDSTATUS", "TR_CURRENCY", "ACC_CURRENCY", "MERCHANT", "CARDNUMBER", "TR_DATE", "AUTH", "TR_AMOUNT",
                        "ACC_AMOUNT", "FEE", "CLEAR_AMOUNT", "TERMINAL", "INFO"),
              "grid2": ("ID", "CHANELL", "TR_TYPE", "OUTWORDSTATUS", "TR_CURRENCY", "ACC_CURRENCY", "MERCHANT", "CARDNUMBER", "TR_DATE", "AUTH", "TR_AMOUNT",
                        "ACC_AMOUNT", "FEE", "CLEAR_AMOUNT", "TERMINAL")},
        confirm=dict(proc="transaction_int", done="Əməliyyatlar günün sənədlərinə göndərildi!!", refresh=("grid1", "grid2")),   # ToolButton1Click :341
        excel=("grid1", "INTFILES"), icons=("grid1", "grid2"),                            # ToolButton7Click :334
    ),
    # RVisa1Click :1123 (card_rvisa) -> Trvisa UnitRvisa.pas; ToolButton1 'Təsdiq Et' is Visible = False with no OnClick
    "rvisa": dict(
        right="card_rvisa", src="cards_unitrvisa.pas", cls="trvisa", rich="refiles", routines=("checkfileext",),
        filelists=("filelistrvisafiles",), sinks=("toolbar1", "animate1"),
        preview="trvisa.toolbutton3click", tobase="trvisa.isertbtnclick",                 # :63, :233
        on_open="trvisa.formpaint",                                                       # FormPaint :449: rvisa_delete, REFiles.Clear, rvisa reopen
        grids={"grid1": ("rvisa", Q.LINES_RVISA)},
        sort={"grid1": ("REPORTING_FOR", "REPORTING_CODE", "REPORTING_DATE", "ROLLUP_TO", "ROLLUP_TO_CODE", "PROC_DATE", "FUNDS_XFER_ENTITY", "FUNDS_XFER_CODE",
                        "SETTLEMENT_CURRENCY", "INTERCHANGE_TOTAL_AMMOUNT", "INTERCHANGE_ISDEBET", "REIMBURSEMENT_FEES_AMOUNT", "REIMBURSEMENT_FEES_ISDEBET",
                        "VISA_CHARGES_AMMOUNT", "VISA_CHARGES_ISDEBET", "SETTLEMENT_AMOUNT", "SETTLEMENT_AMOUNT_ISDEBET")},
        confirm=None, excel=("grid1", "RVISA"), icons=(),                                 # ToolButton7Click :416
    ),
    # DFile1Click :1130 (card_dfile) -> TDfile UnitDfile.pas
    "dfile": dict(
        right="card_dfile", src="cards_unitdfile.pas", cls="tdfile", rich="redxxx", routines=("checkfileext",),
        filelists=("filelistbox1", "filelistboxsmsfiles", "filelistboxdxxx"), sinks=("toolbar1", "animate1"),
        clicks={"toolbutton2": "tdfile.toolbutton2click"},
        preview="tdfile.toolbutton3click", tobase="tdfile.isertbtnclick",                 # :76 (-> ToolButton2Click :83), :365
        grids={"grid1": ("Dfile", Q.LINES_DFILE), "grid2": ("dfile2", Q.LINES_DFILE2)},
        sort={"grid1": ("BANKNAME", "LOROACCOUNT", "PAYMENTORDERAMMOUNT", "PAYMENTDIRECTION", "SOURCECONTRACT", "TRANSACTIONDATE", "TRANSACTIONTIME", "FILENAME", "INFO"),
              "grid2": ("BANKNAME", "LOROACCOUNT", "PAYMENTORDERAMMOUNT", "PAYMENTDIRECTION", "SOURCECONTRACT", "TRANSACTIONDATE", "TRANSACTIONTIME", "FILENAME")},
        confirm=dict(mode="single", proc="transaction_d", ask="Əməliyyatlar təsdiq edilsin?", refresh=("grid1", "grid2")),   # ToolButton1Click :600
        excel=("grid1", "DFILES"), icons=("grid1", "grid2"),                              # ToolButton7Click :593
    ),
    # E1Click :398 (no right check) -> Texchange_files card_Exchange_file.pas
    "exchange": dict(
        right=None, src="cards_exchange_file.pas", cls="texchange_files", rich="ctinboxrich", routines=("checkfileext", "directoryexists"),
        filelists=("filelistbox1",), sinks=("toolbar1", "animate1"),
        preview="texchange_files.toolbutton3click", tobase="texchange_files.isertbtnclick",          # :327, :152
        datasets={"UMUMI": Q.LINES_UMUMI, "UMUMI1": Q.LINES_UMUMI1},
        grids={"grid1": ("atm_exchange", Q.LINES_ATM_EXCHANGE), "grid2": ("atm_exchange2", Q.LINES_ATM_EXCHANGE2)},
        sort={},                                        # DBGrid1/2 Options have no dgTitleClick (and no OnTitleClick)
        confirm=dict(proc="transaction_exchange", done="Əməliyyatlar günün sənədlərinə göndərildi!", refresh=("grid1", "grid2")),   # :251
        excel=("grid1", "ExchangeFiles"), icons=("grid1", "grid2"), icon_col=1,                    # :411; DrawColumnCell :75/:111 DataCol 1 = STATUS
    ),
    # R1Click :1117 (no right check) -> Tdorbsfile Rbsdofiles.pas; ToolButton1 is Visible = False (no OnClick)
    "rbsdo": dict(
        right=None, src="cards_rbsdofiles.pas", cls="tdorbsfile", rich="rbsdorich", routines=("checkfileext",),
        filelists=("filelistrbsbox",), sinks=("toolbar1", "animate1"), keep_rich=("richedit1",),
        preview="tdorbsfile.toolbutton3click", tobase="tdorbsfile.isertbtnclick",                  # :250, :89
        grids={"grid1": ("rbsdofile", Q.LINES_RBSDOFILE)},
        sort={},                                        # DBGrid1 Options have no dgTitleClick: TitleClick :63 never runs
        confirm=None, excel=("grid1", "RbsDoFile"), icons=(),                                       # :394 ExportDataset(DBGrid1.DataSource.DataSet)
    ),
    # T1Click :647 (no right check) -> TRbsdoTax Taxrbs.pas
    "rbstax": dict(
        right=None, src="cards_taxrbs.pas", cls="trbsdotax", rich="rbsdorich", routines=("checkfileext",),
        filelists=("filelistrbsbox",), sinks=("toolbar1", "animate1"), keep_rich=("richedit1",),
        preview="trbsdotax.toolbutton3click", tobase="trbsdotax.isertbtnclick",                    # :378, :150
        grids={"grid1": ("rbs_tax", Q.LINES_RBS_TAX), "grid2": ("rbs_taxcommited", Q.LINES_RBS_TAXCOMMITED)},
        sort={},
        confirm=dict(proc="transaction_rbstax", done="Əməliyyatlar günün sənədlərinə göndərildi!", refresh=("grid1", "grid2")),     # :300
        excel=("grid1", "RbsTaxFile"), icons=("grid1", "grid2"),                                    # :503
    ),
}


def _cfg(form):
    c = FORMS.get(form)
    if c is None:
        raise LookupError(form)
    return c


def _st(ws, form) -> dict:
    s = ws.module_state.get("cards_fo_" + form)
    if s is None:
        raise LookupError(form)
    return s


def _q(ws, lines, sort=None):
    L = list(lines) + (["ORDER BY " + sort] if sort else [])
    return [dict(r) for r in ws.conn.query(Q.text(L), {})]


def _dm_open(ws) -> set:
    """DataMod_CARDS datasets that are open in this session (none of these is Active at design time; Open state outlives the form)."""
    return ws.module_state.setdefault("cards_dm_open", set())


def _open(ws, form, g, sort=None):
    c = _cfg(form)
    _st(ws, form)["rows"][g] = _q(ws, c["grids"][g][1], sort)
    _dm_open(ws).add(c["grids"][g][0].lower())


def _closed(ws, form, g):
    _st(ws, form)["rows"][g] = None
    _dm_open(ws).discard(_cfg(form)["grids"][g][0].lower())


def _view(ws, form, **extra) -> dict:
    c, s = _cfg(form), _st(ws, form)
    f = CF.uploaded(ws, "fo_" + form)
    out = {g: None if s["rows"].get(g) is None else [row(r) for r in s["rows"][g]] for g in c["grids"]}
    out.update(rich=CF.lines_view(s["rich"], s["spans"]), file=None if not f else {"name": f["name"], "size": len(f["data"])})
    out.update(extra)
    return out


def open_form(ws, form) -> dict:
    c = _cfg(form)
    if c.get("right"):
        ws.conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", [c["right"]], commit=False)
    ws.module_state["cards_fo_" + form] = {"rows": {g: None for g in c["grids"]}, "rich": [], "spans": [], "keep": {}}
    for g in c["grids"]:
        if c["grids"][g][0].lower() in _dm_open(ws):      # opened by an earlier visit (Delphi shows its cached rows; the web re-reads)
            _open(ws, form, g)
    if c.get("on_open"):
        return _run(ws, form, c["on_open"])
    return _view(ws, form)


class TrackedDataSet(CF.DataSet):
    closed = False

    def m_close(self):
        super().m_close()
        self.closed = True


class LoadStrings(CF.Strings):
    def __init__(self, lines, files):
        super().__init__(lines)
        self.files = files

    def m_loadfromfile(self, name):
        """TStrings.LoadFromFile(FileListrbsbox.items[i]): a relative name, resolved in C:\\AZCARD\\IN (TFileListBox.Directory := .. does ChDir)."""
        base = str(name).replace("/", "\\").rsplit("\\", 1)[-1]
        if base not in self.files:
            raise CF.P.PascalError(f"Cannot open file \"{name}\". The system cannot find the file specified")
        self.lines[:] = CF.split_lines(self.files[base])


class LoadRich(CF.RichEdit):
    def __init__(self, lines, files):
        super().__init__(lines)
        self.files = files

    @property
    def p_lines(self):
        return LoadStrings(self.lines, self.files)


class GridRef(CF.P.PObj):
    def __init__(self, ds):
        self.p_datasource = CF.P.Sink("DataSource")
        self.p_datasource.props["dataset"] = ds


class CwdListBox(CF.FileListBox):
    """A TFileListBox whose Directory the unit never sets (FileListBox1 of sms.pas / Unitintfile.pas, used for <x>arxiv(Items[i])): it lists
    the Delphi client's working folder, which the web does not have. The web lists the uploaded file there, so <x>arxiv gets the incoming
    file's name (unverified: Delphi passes the i-th name of the client's working folder)."""

    @property
    def p_items(self):
        d = self.p_directory.rstrip("\\").upper()
        return CF.Items(sorted(self.files) if d in ("", CF.IN_DIR.upper()) else [])


class Clicker(CF.P.PObj):
    """TToolButton.Click -> its OnClick handler (run from the same unit)."""

    def __init__(self, routine):
        self.r = routine

    def m_click(self):
        return self.r.invoke([None])


def _run(ws, form, method, answers=None) -> dict:
    c, s = _cfg(form), _st(ws, form)
    f = CF.uploaded(ws, "fo_" + form)
    files = {f["name"]: f["data"]} if f else {}
    u = CF.unit(c["src"])
    st_rows = [dict(x) for x in ws.conn.query(Q.text(Q.LINES_SETTINGS), {})]
    for probe in (True, False):
        rt = CF.Runtime(ws.conn, files, answers, probe=probe)
        dm = {"mainpacket": CF.Package(rt, "card_main"), "sb_aca": CF.Package(rt, "SB_ACA"),
              "settings": CF.DataSet(rt, "settings", Q.LINES_SETTINGS, [dict(r) for r in st_rows])}
        grid_ds = {}
        for g, (name, lines) in c["grids"].items():
            dm[name.lower()] = grid_ds[g] = TrackedDataSet(rt, name, lines)
        for name, lines in c.get("datasets", {}).items():
            dm[name.lower()] = CF.DataSet(rt, name, lines)
        rich = CF.RichEdit(list(s["rich"]), list(s["spans"]))
        comps = {c["rich"]: rich, "refwithsel": CF.Down(False)}
        for n in c["filelists"]:
            comps[n] = CF.FileListBox(rt.in_files)
        for n, g in c.get("dbgrids", {"dbgrid1": "grid1", "dbgrid2": "grid2"}).items():   # DBGrid<n>.DataSource.DataSet
            if g in grid_ds:
                comps[n] = GridRef(grid_ds[g])
        for n in c.get("cwd_lists", ()):
            comps[n] = CwdListBox(rt.in_files)
        for n in c.get("sinks", ()):
            comps[n] = CF.P.Sink(n)
        keep = {}
        for n in c.get("keep_rich", ()):                 # hidden RichEdit1: Lines.LoadFromFile in the preview, read by Bazaya Göndər
            keep[n] = comps[n] = LoadRich(list(s["keep"].get(n, [])), rt.in_files)
        form_m = Module(comps)
        b = rt.builtins({})
        b["datamod_cards"] = Module(dm)
        b.update(getfileattributes=lambda n: 16, pchar=lambda x: x, file_attribute_directory=16)   # C:\\AZCARD\\IN is a directory
        for n, m in c.get("clicks", {}).items():
            r = CF.P.Routine(u, m, form_m, b); r.factories = {"textfile": CF.TextFile}
            comps[n] = Clicker(r)
        error = None
        try:
            CF.run_routine(u, method, form_m, b, c.get("routines", ()))
        except CF.NeedAnswer as q:
            return {"ask": q.msg, "buttons": q.buttons, "answered": len(answers or [])}
        except CF.P.PascalUnsupported:
            raise
        except Exception as e:      # noqa: BLE001 - Delphi shows the exception; what was done stays
            error = str(e)
        if probe:
            continue
        s["rich"], s["spans"] = rich.lines, rich.spans
        for n, r_ in keep.items():
            s["keep"][n] = r_.lines
        for g, ds in grid_ds.items():                   # the grids after the routine: open ones are re-read, closed ones are empty
            if ds.rows is not None or ((s["rows"].get(g) is not None) and not ds.closed):
                _open(ws, form, g)
            elif ds.closed:
                _closed(ws, form, g)
        return _view(ws, form, messages=rt.messages, error=error, calls=rt.calls, posts=len(rt.posts), files=rt.out_files())


def preview(ws, form):
    _st(ws, form)
    return _run(ws, form, _cfg(form)["preview"])


def to_base(ws, form, answers):
    _st(ws, form)
    return _run(ws, form, _cfg(form)["tobase"], answers)


def confirm(ws, form, ids, current, answers) -> dict:
    c, s = _cfg(form), _st(ws, form)
    k_ = c["confirm"]
    if k_.get("mode") == "single":                     # one MessageDlg [mbYes, mbNo]; Yes -> <proc>([]), both grids Close / Open; No -> Exit
        if answers[:1] != ["yes"]:
            return _view(ws, form, confirmed=[], messages=[], error=None)
        error = None
        try:
            ws.conn.call_proc("card_main", k_["proc"], [], commit=False)
        except Exception as e:      # noqa: BLE001
            return _view(ws, form, confirmed=[], messages=[], error=str(e))
        for g in k_["refresh"]:
            _open(ws, form, g)
        return _view(ws, form, confirmed=True, messages=[], error=error)
    order = [r.get("ID") for r in (s["rows"]["grid1"] or [])]
    sel = sorted(set(ids) & set(order), key=order.index)
    if not sel and current in order:
        sel = [current]
    wait, will, done, error = True, False, [], None
    it = iter(answers)
    try:
        for tid in sel:
            if wait:
                a = next(it, "cancel")
                if a in ("no", "all_no"):
                    continue
                if a == "cancel":
                    break
                if a == "all":
                    wait = False
            ws.conn.call_proc("card_main", k_["proc"], [int(tid)], commit=False)
            done.append(tid)
            will = True
    except Exception as e:      # noqa: BLE001
        error = str(e)
    msgs = []
    if will:
        for g in k_["refresh"]:
            _open(ws, form, g)
        if k_.get("done"):
            msgs.append(k_["done"])
    return _view(ws, form, confirmed=done, messages=msgs, error=error)


def sort(ws, form, grid, field) -> dict:
    c, s = _cfg(form), _st(ws, form)
    cols = c["sort"].get(grid)
    if cols is None or not s["rows"].get(grid) or field.upper() not in cols:
        return _view(ws, form)
    try:
        _open(ws, form, grid, field.upper())
    except Exception as e:      # noqa: BLE001
        return _view(ws, form, error=str(e))
    return _view(ws, form)


def excel(ws, form) -> bytes:
    c = _cfg(form)
    _st(ws, form)
    from .cards_balpay import _excel
    g, sheet = c["excel"]
    return _excel(_q(ws, c["grids"][g][1]), sheet)


class LoadIn(BaseModel):
    name: str = Field(max_length=255)
    b64: str = Field(max_length=14_000_000)


class AnsIn(BaseModel):
    answers: list[str] = []


class ConfIn(BaseModel):
    ids: list[int] = []
    current: int | None = None
    answers: list[str] = []


class SortIn(BaseModel):
    grid: str = Field(max_length=10)
    field: str = Field(max_length=40)


XLSX = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/cards/fo")
    g = require_module(CLSID)

    def _fe(fn, *a):
        try:
            return fn(*a)
        except LookupError:
            err(409, "error.bad_request")
        except ValueError as e:
            err(400, "error.bad_request", ora=str(e))

    @r.post("/{form}/open")
    def _o(form: str, ws=Depends(g)):
        _ = form in FORMS or err(404, "error.bad_request")
        return open_form(ws, form)

    @r.post("/{form}/upload")
    def _u(form: str, b: LoadIn, ws=Depends(g)):
        def f():
            _st(ws, form)
            try:
                data = base64.b64decode(b.b64, validate=True)
            except Exception:       # noqa: BLE001
                raise ValueError("base64") from None
            CF.upload(ws, "fo_" + form, b.name, data)
            return _view(ws, form)
        return _fe(f)

    @r.post("/{form}/refresh")
    def _r(form: str, ws=Depends(g)):
        return _fe(preview, ws, form)

    @r.post("/{form}/tobase")
    def _b(form: str, b: AnsIn, ws=Depends(g)):
        for a in b.answers:
            if a not in ("mryes", "mrno", "mrcancel", "mrok"):
                err(400, "error.bad_request")
        return _fe(to_base, ws, form, b.answers)

    @r.post("/{form}/confirm")
    def _c(form: str, b: ConfIn, ws=Depends(g)):
        for a in b.answers:
            if a not in ("yes", "no", "cancel", "all", "all_no"):
                err(400, "error.bad_request")
        if not _cfg(form).get("confirm"):
            err(404, "error.bad_request")
        return _fe(confirm, ws, form, b.ids, b.current, b.answers)

    @r.post("/{form}/sort")
    def _s(form: str, b: SortIn, ws=Depends(g)):
        return _fe(sort, ws, form, b.grid, b.field)

    @r.post("/{form}/excel")
    def _x(form: str, ws=Depends(g)):
        if not _cfg(form).get("excel"):
            err(404, "error.bad_request")
        return Response(_fe(excel, ws, form), media_type=XLSX, headers={"Content-Disposition": f'attachment; filename="{form.upper()}.xlsx"'})

    return r
