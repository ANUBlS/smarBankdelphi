"""Cards ▸ Sazlama (cards_azericard MAINFORMImpl1 ToolButton3Click :1089, right card_setting -> TForm10 setac.pas) and the
settings forms ported so far: balhs.pas TForm11 (id 1), comp.pas TForm13 (id 2), datclose.pas Tdateclose (id 4), paymentsett.pas
TPaymentset (id 12).

TForm10: DBGrid1 = sazlamalar ('select * from card_settingsform order by id', Filtered = True in Unit18.dfm). FormCreate: Close / Open.
Edit1Change / Edit2Change: Filter := 'id = ''<text>*''' / 'SAZLAMALAR = ''<text>*''' (tdataset_filter). DBGrid1TitleClick: SQL.Add('ORDER BY
<field>') after the dataset's own 'order by id' -> Oracle raises ORA-00933 (shown as the error, the list stays). Button1Click 'Aç' opens the form of the current row's id (1-14); DBGrid1DblClick knows only ids 1-10
(11 card_branch, 12 paymentset, 13 Exchangesettings, 14 RbsTaxFileAccsett open only from the button).

DOA DML: the datasets have no OnApplyRecord, so TOracleDataSet applies INSERT / UPDATE / DELETE on the table by ROWID; CommitOnPost
(DOA default True, unverified per dataset) commits after Post / Delete. The explicit Session.Commit calls of the forms are kept."""
from __future__ import annotations

from fastapi import APIRouter, Depends
from pydantic import BaseModel

from . import cards_sql as Q
from . import tdataset_filter as TF
from .cards import CLSID
from .customers import row

FORMS = {1: "balhs", 2: "comp", 3: "crdtype", 4: "datclose", 5: "filialaccounts", 6: "domesticbank", 7: "banksettings", 8: "atmendpos",
         9: "poscomission", 10: "unit155", 11: "cardbranch", 12: "paymentsett", 13: "excsett", 14: "taxfilessettings"}
PORTED = {"balhs", "comp", "datclose", "paymentsett"}
DBLCLICK_IDS = set(range(1, 11))
SAZ_FIELDS = {"ID", "SAZLAMALAR"}
MSG_DEL = "Seçilmiş sətir silinsin?"
MSG_SAVE = "Yadda saxlanılsın?"
# DOA-generated DML (no OnApplyRecord), by ROWID
SQL = {
    "balcn_ins": "insert into card_balcn (BALANS, HES) values (:BALANS, :HES)",
    "balcn_del": "delete from card_balcn where rowid = :doa_rowid",
    "company_ins": "insert into CARD_COMPANY (COMPANY_NAME) values (:COMPANY_NAME)",
    "company_del": "delete from CARD_COMPANY where rowid = :doa_rowid",
    "settings_upd": "update card_settings set DATECLOSE = :DATECLOSE where rowid = :doa_rowid",
    "vidop_ins": "insert into card_vidops (ID, VIDOP) values (:ID, :VIDOP)",
    "vidop_upd": "update card_vidops set ID = :ID, VIDOP = :VIDOP where rowid = :doa_rowid",
    "vidop_del": "delete from card_vidops where rowid = :doa_rowid",
}


def _q(ws, lines, b=None):
    return [dict(r) for r in ws.conn.query(Q.text(lines), b or {})]


def _rows(rows):
    return [dict(row(r), rowid=None if r.get("ROWID") is None else str(r.get("ROWID"))) for r in rows]


def _st(ws) -> dict:
    return ws.module_state.setdefault("cards_sett", {})


def _need(ws) -> dict:
    s = _st(ws)
    if "filter" not in s:
        raise LookupError("sett")
    return s


def _view(ws, sort=None):
    s = _need(ws)
    lines = list(Q.LINES_SAZLAMALAR) + (["ORDER BY " + sort] if sort else [])
    try:
        shown = TF.apply(_q(ws, lines), s["filter"], SAZ_FIELDS)
        ferr = None
    except TF.FilterError as e:
        shown, ferr = [], str(e)
    return {"rows": _rows(shown), "filter": s["filter"], "filter_error": ferr,
            "forms": {str(k): {"form": v, "ported": v in PORTED, "dblclick": k in DBLCLICK_IDS} for k, v in FORMS.items()}}


def open_form(ws) -> dict:
    ws.conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["card_setting"], commit=False)
    _st(ws).clear()
    _st(ws)["filter"] = ""
    return _view(ws)


def set_filter(ws, edit: int, text: str) -> dict:
    s = _need(ws)
    s["filter"] = ("id = '" if edit == 1 else "SAZLAMALAR = '") + text.replace("'", "''") + "*'"
    return _view(ws)


def sort(ws, field: str) -> dict:
    return _view(ws, field.upper() if field.upper() in SAZ_FIELDS else None)


def _run(ws, key, b, commit=True):
    c = ws.conn
    try:
        c.execute(SQL[key], b)
        if commit:
            c.commit()
    except Exception:
        c.rollback()
        raise


# ---------------------------------------------------------------- TForm11 (balhs.pas): card_balcn
def balhs_view(ws):
    _need(ws)
    return {"rows": _rows(_q(ws, Q.LINES_BALANSLAR)), "balspr": [r.get("BAL_CN") for r in _q(ws, Q.LINES_BALSPR)],
            "reports": [r.get("ID") for r in _q(ws, Q.LINES_REPORTESC)], "msg_del": MSG_DEL}


def balhs_add(ws, balans: str, hes: str):
    """Button1Click: Insert; balans := DBLookupComboBox1.Text; if SearchEdit1.Text <> '' then hes := StrToInt (EConvertError leaves
    the dataset in insert mode: nothing is written); Post (+ CommitOnPost); Session.Commit; Refresh."""
    _need(ws)
    h = None
    if hes != "":
        try:
            h = int(hes.strip())
        except ValueError:
            raise ValueError(f"'{hes}' is not a valid integer value") from None
    _run(ws, "balcn_ins", {"BALANS": balans, "HES": h})
    return balhs_view(ws)


def balhs_delete(ws, rowid: str | None, confirmed: bool):
    """Button2Click: 'Seçilmiş sətir silinsin?' Yes -> Delete; Session.Commit runs after Yes and No."""
    _need(ws)
    if confirmed and rowid:
        _run(ws, "balcn_del", {"doa_rowid": rowid}, commit=False)
    ws.conn.commit()
    return balhs_view(ws)


# ---------------------------------------------------------------- TForm13 (comp.pas): CARD_COMPANY
def comp_view(ws):
    _need(ws)
    return {"rows": _rows(_q(ws, Q.LINES_COMPANY)), "msg_del": MSG_DEL}


def comp_key(text: str) -> str:
    """Edit1KeyPress per typed key: UpCase; Ord > 126 or '?' dropped (+ US keyboard layout)."""
    return "".join(ch.upper() if "a" <= ch <= "z" else ch for ch in text if ord(ch) <= 126 and ch != "?")


def comp_add(ws, name: str):
    _need(ws)
    _run(ws, "company_ins", {"COMPANY_NAME": name})       # Insert / Post / Session.Commit / Close / Open
    return comp_view(ws)


def comp_delete(ws, rowid: str | None, confirmed: bool):
    _need(ws)
    if confirmed and rowid:
        _run(ws, "company_del", {"doa_rowid": rowid}, commit=False)
    ws.conn.commit()
    return comp_view(ws)


# ---------------------------------------------------------------- Tdateclose (datclose.pas): card_settings.dateclose
def datclose_view(ws):
    _need(ws)
    st = _q(ws, Q.LINES_SETTINGS)                          # FormActivate: settings.Edit (first row)
    r = st[0] if st else {}
    return {"dateclose": r.get("DATECLOSE"), "rowid": r.get("ROWID"), "msg_save": MSG_SAVE}


def datclose_save(ws, value: str, confirmed: bool):
    """Button1Click: 'Yadda saxlanılsın?' Yes -> settings.Post (CommitOnPost). FormClose: Cancel (an unsaved edit is dropped)."""
    _need(ws)
    v = datclose_view(ws)
    if confirmed and v["rowid"]:
        val = value.strip()
        if val == "":
            num = None
        else:
            try:
                num = float(val.replace(",", "."))
            except ValueError:
                raise ValueError(f"'{value}' is not a valid floating point value") from None
            num = int(num) if num.is_integer() else num
        _run(ws, "settings_upd", {"DATECLOSE": num, "doa_rowid": v["rowid"]})
    return datclose_view(ws)


# ---------------------------------------------------------------- TPaymentset (paymentsett.pas): card_vidops, editable DBGrid
def vidop_view(ws):
    _need(ws)
    return {"rows": _rows(_q(ws, Q.LINES_CARD_VIDOP))}    # FormShow: Card_vidop.Open


def vidop_apply(ws, op: str, rowid: str | None, id_, vidop):
    """DBGrid1 (default Options: dgEditing, insert / delete by keyboard): DOA Post / Delete by ROWID, CommitOnPost."""
    _need(ws)
    if op == "insert":
        _run(ws, "vidop_ins", {"ID": id_, "VIDOP": vidop})
    elif op == "update" and rowid:
        _run(ws, "vidop_upd", {"ID": id_, "VIDOP": vidop, "doa_rowid": rowid})
    elif op == "delete" and rowid:
        _run(ws, "vidop_del", {"doa_rowid": rowid})
    else:
        raise ValueError(op)
    return vidop_view(ws)


class FilterIn(BaseModel):
    edit: int
    text: str = ""


class SortIn(BaseModel):
    field: str


class BalIn(BaseModel):
    balans: str = ""
    hes: str = ""


class DelIn(BaseModel):
    rowid: str | None = None
    confirmed: bool = False


class CompIn(BaseModel):
    name: str = ""


class DcIn(BaseModel):
    value: str = ""
    confirmed: bool = False


class VidIn(BaseModel):
    op: str
    rowid: str | None = None
    id: float | None = None
    vidop: str | None = None


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/cards/sett")
    g = require_module(CLSID)

    def _fe(fn, *a):
        try:
            return fn(*a)
        except LookupError:
            err(409, "error.bad_request")
        except ValueError as e:
            err(400, "error.bad_request", ora=str(e))

    @r.post("/open")
    def _o(ws=Depends(g)):
        return open_form(ws)

    @r.post("/filter")
    def _f(b: FilterIn, ws=Depends(g)):
        return _fe(set_filter, ws, b.edit, b.text)

    @r.post("/sort")
    def _s(b: SortIn, ws=Depends(g)):
        return _fe(sort, ws, b.field)

    @r.post("/balhs/open")
    def _bo(ws=Depends(g)):
        return _fe(balhs_view, ws)

    @r.post("/balhs/add")
    def _ba(b: BalIn, ws=Depends(g)):
        return _fe(balhs_add, ws, b.balans, b.hes)

    @r.post("/balhs/delete")
    def _bd(b: DelIn, ws=Depends(g)):
        return _fe(balhs_delete, ws, b.rowid, b.confirmed)

    @r.post("/comp/open")
    def _co(ws=Depends(g)):
        return _fe(comp_view, ws)

    @r.post("/comp/add")
    def _ca(b: CompIn, ws=Depends(g)):
        return _fe(comp_add, ws, comp_key(b.name))

    @r.post("/comp/delete")
    def _cd(b: DelIn, ws=Depends(g)):
        return _fe(comp_delete, ws, b.rowid, b.confirmed)

    @r.post("/datclose/open")
    def _do(ws=Depends(g)):
        return _fe(datclose_view, ws)

    @r.post("/datclose/save")
    def _ds(b: DcIn, ws=Depends(g)):
        return _fe(datclose_save, ws, b.value, b.confirmed)

    @r.post("/paymentsett/open")
    def _vo(ws=Depends(g)):
        return _fe(vidop_view, ws)

    @r.post("/paymentsett/apply")
    def _va(b: VidIn, ws=Depends(g)):
        return _fe(vidop_apply, ws, b.op, b.rowid, b.id, b.vidop)

    return r
