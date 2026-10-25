"""SBDM_PercentSettings_new.bpl (faizlərin sazlanması) - P = PercentSettingImpl_new.pas, F = PercentSettingImpl_new.dfm.
SQL verbatim in dep_pct_sql.py. Package sbcm_percent_converting_new (positional CallProcedure / CallFloatFunction).

The form is created once in the unit's initialization and the package is never unloaded (LoadPlugin has no UnLoadPlugin
call), so FormShow's Open calls are no-ops after the first opening: the browser keeps the cursor positions between openings
and the API simply re-reads the data (the Delphi grids would show the data as of the first opening until a Post/Refresh).

Cursor chain (DataSource.OnDataChange -> WaitForOp P:533-592, DSRsbcm_amount_settingDataChange P:421-482, WaitFor P:606-650):
  DepositTypes -> depperiods (master/detail DEPID) -> depcapitalperiods (master/detail PERIODID)
  any of DepositTypes / depperiods / depcapitalperiods / Valutes -> DSsbcm_amount_setting(periodid, currencyid) reopened (first row)
  DSsbcm_amount_setting -> DepositPerSetting(depid, periodid, capitalid, currencyid, amount_setting_id) reopened (first row)
  DepositPerSetting -> Depositdatsettings(depid, periodid, capitalid, valcod, amount_setting_id) reopened
FieldByName(..).AsInteger of an empty dataset / a record being inserted is 0, so the dependent queries run with 0.

Editing: DB grids with DOA's default ApplyRecord (insert / update / delete by rowid), CommitOnPost (default True), AfterPost
Refresh. DepositTypes and Valutes have no ROWID in the query (read-only). The grid OnKeyPress handlers assign the master values
when UpdateStatus in [usInserted, usModified] (assumed: the record being inserted / edited) - reproduced with `assign`.
"""
from __future__ import annotations

from fastapi import APIRouter, Depends
from pydantic import BaseModel, Field

from . import deposits as D
from . import dep_pct_sql as Q
from .customers import row
from .dep_ops import bank_date
from .dep_settings import DS, SErr, _conv, _rows, delete as ds_delete, post as ds_post

PKG = "sbcm_percent_converting_new"

# persistent data fields in dfm order (F:748-767, 807-836, 886-950, 1001-1021, 1118-1140)
DS.update({
    "periods": ("sbcm_depperiods_new", [("ID", "ID", False, "f"), ("PERIOD", "Period(aylarla)", True, "f"), ("DESCRIPTION", "Təyinatı", False, 30),
                                        ("DEPID", "DEPID", False, "f"), ("PERIOD_TYPE", "(Ay və ya Gün )", False, 100)]),
    "caps": ("sbcm_depcapitalperiods_new", [("ID", "ID", False, "f"), ("PERIOD", "Period(günlərlə)", True, "f"), ("DESCRIPTION", "Təyinatı", False, 30),
                                            ("PERIODID", "PERIODID", False, "f"), ("TYPE#", "TYPE#", False, 40)]),
    "amounts": ("sbcm_amount_setting", [("ID", "ID", False, "f"), ("FIRSTAMOUNT", "Məbləğ(min)", False, "f"), ("LASTAMOUNT", "Məbləğ(max)", False, "f"),
                                        ("PERIODID", "PERIODID", False, "f"), ("CURRENCYID", "CURRENCYID", False, "f"),
                                        ("MAXAMUONTCONRTACT", "MAXAMUONTCONRTACT", False, "f"), ("MAXAMUONTCONRTACTPERCENT", "MAXAMUONTCONRTACTPERCENT", False, "f")]),
    "pers": ("sbcm_depositpersetting_new", [("ID", "ID", False, "f"), ("CURRENCYID", "CURRENCYID", True, "f"), ("INTERESTRATE", "INTERESTRATE", True, "f"),
                                            ("DUEINTRATE", "DUEINTRATE", False, "f"), ("FIRSTAMOUNT", "FIRSTAMOUNT", False, "f"), ("LASTAMOUNT", "LASTAMOUNT", False, "f"),
                                            ("DEPID", "DEPID", False, "f"), ("PERIODID", "PERIODID", False, "f"), ("CAPITALID", "CAPITALID", False, "f"),
                                            ("BEFOINTRATE", "BEFOINTRATE", False, "f"), ("PERCENTAGE_GROWTH_STEP", "Faiz artımı ", False, "f"),
                                            ("FIRST_DAY", "Dövrün əvvəli", False, "f"), ("LAST_DAY", "Dövrün sonu", False, "f"),
                                            ("AMOUNT_SETTING_ID", "AMOUNT_SETTING_ID", False, "f"), ("AMOUNT_GROWTH_FIRST", "Məbləğ%(Min)", False, "f"),
                                            ("AMOUNT_GROWTH_LAST", "Məbləğ%(Max)", False, "f"), ("WRITE_MEMORY", "WRITE_MEMORY", False, "f"),
                                            ("CONFIRMATION", "CONFIRMATION", False, "f"), ("HDATE", "HDATE", False, "d")]),
    "dats": ("sbcm_depositunitime_new", [("ID", "ID", False, "f"), ("PERCENT", "PERCENT", False, "f"), ("FIRSTDATEINT", "FIRSTDATEINT", False, "f"),
                                         ("LASTDATEINT", "LASTDATEINT", False, "f"), ("VALCOD", "VALCOD", False, "f"), ("DEPID", "DEPID", False, "f"),
                                         ("PERIODID", "PERIODID", False, "f"), ("CAPITALID", "CAPITALID", False, "f"), ("DEPSETID", "DEPSETID", False, "f"),
                                         ("AMOUNT_SETTING_ID", "AMOUNT_SETTING_ID", False, "f")]),
})
# XDBGrid5KeyPress P:190-207: the 18 values passed to deppseting_upd_hist_new (AsFloat), in call order
HIST = ["ID", "CURRENCYID", "INTERESTRATE", "DUEINTRATE", "FIRSTAMOUNT", "LASTAMOUNT", "DEPID", "PERIODID", "CAPITALID", "BEFOINTRATE",
        "FIRST_DAY", "PERCENTAGE_GROWTH_STEP", "LAST_DAY", "AMOUNT_SETTING_ID", "AMOUNT_GROWTH_FIRST", "AMOUNT_GROWTH_LAST", "WRITE_MEMORY", "CONFIRMATION"]
MSG_SAVED = "Seçilmiş sazlamalara görə faiz dərəcələri yaddaşa yazıldı."                                         # P:353
MSG_NOT_SAVED = "Seçilmiş sazlamalara görə faiz dərəcələri yaddaşa yazılmadığından təsdiqlənə bilməz!"            # P:376
MSG_CONFIRMED = "Seçilmiş sazlamalara görə faiz dərəcələri təsdiqləndi."                                         # P:388
ASK_OLD = "Sazlanmis yeni faiz dərəcəsi əvvəlki bu tip depozitlərin bütün yatrımlarının aid edilsinmi?"           # P:340


class Sel(BaseModel):
    """Current record of each dataset: id (rid for the editable detail grids). None = first row (dataset just reopened);
    0 = the cursor is on a record being inserted (its ID is still null -> AsInteger 0)."""
    dep: int | None = None
    period: int | None = None
    cap: int | None = None
    val: int | None = None
    amt: int | None = None
    pers: str | None = Field(None, max_length=64)


def _pick(rows, key, want):
    if want == 0:
        return None, 0
    r = next((x for x in rows if x.get(key) == want), None) if want is not None else None
    r = r or (rows[0] if rows else None)
    return r, (int(r[key]) if r and r.get(key) is not None else 0)


def state(conn, s: Sel) -> dict:
    """The open datasets for the given cursor positions (FormShow P:511-526 + the OnDataChange chain)."""
    types = [row(x) for x in conn.query(Q.PCT_SQL_DEPOSITTYPES)]
    _, dep = _pick(types, "id", s.dep)
    periods = _rows(conn, Q.PCT_SQL_DEPPERIODS, {"depid": dep}) if s.dep != 0 else []
    _, period = _pick(periods, "id", s.period)
    caps = _rows(conn, Q.PCT_SQL_DEPCAPITALPERIODS, {"periodid": period}) if period else []
    _, cap = _pick(caps, "id", s.cap)
    vals = [row(x) for x in conn.query(Q.PCT_SQL_VALUTES)]
    _, val = _pick(vals, "valute", s.val)
    amts = _rows(conn, Q.PCT_SQL_AMOUNT_SETTING, {"periodid": period, "currencyid": val})
    _, amt = _pick(amts, "id", s.amt)
    pers = _rows(conn, Q.PCT_SQL_DEPOSITPERSETTING, {"depid": dep, "periodid": period, "capitalid": cap, "currencyid": val, "amount_setting_id": amt})
    pr = None if s.pers == "0" else (next((x for x in pers if x["rid"] == s.pers), None) if s.pers else None) or (pers[0] if pers else None)
    dats = _rows(conn, Q.PCT_SQL_DEPOSITDATSETTINGS, {"depid": dep, "periodid": period, "capitalid": cap, "valcod": val, "amount_setting_id": amt})
    for r in pers:
        if r.get("hdate") is not None:
            r["hdate"] = r["hdate"].isoformat() if hasattr(r["hdate"], "isoformat") else str(r["hdate"])
    return {"types": types, "periods": periods, "caps": caps, "valutes": vals, "amounts": amts, "pers": pers, "dats": dats,
            "cur": {"dep": dep, "period": period, "cap": cap, "val": val, "amt": amt, "pers": pr["rid"] if pr else None,
                    "pers_id": int(pr["id"]) if pr and pr.get("id") is not None else 0}}


def _assign(conn, ds, c: dict) -> dict:
    """The OnKeyPress assignments for a record in insert / edit state (master values via AsInteger)."""
    if ds == "amounts":                                       # XDBGrid7KeyPress P:286-300
        return {"PERIODID": c["period"], "CURRENCYID": c["val"]}
    if ds == "dats":                                          # XDBGrid6KeyPress P:265-280
        return {"DEPSETID": c["pers_id"], "DEPID": c["dep"], "PERIODID": c["period"], "CAPITALID": c["cap"], "VALCOD": c["val"],
                "AMOUNT_SETTING_ID": c["amt"]}
    if ds == "pers":                                          # XDBGrid5KeyPress P:214-225
        return {"DEPID": c["dep"], "PERIODID": c["period"], "CAPITALID": c["cap"], "CURRENCYID": c["val"], "AMOUNT_SETTING_ID": c["amt"],
                "WRITE_MEMORY": 0, "CONFIRMATION": 0, "HDATE": bank_date(conn)}
    return {}


def _f(v):
    """TField.AsFloat: null -> 0."""
    if v is None or v == "":
        return 0.0
    return float(v)


class PostIn(BaseModel):
    ds: str = Field(pattern=r"^(periods|caps|amounts|pers|dats)$")
    rid: str | None = Field(None, max_length=64)
    values: dict = Field(default_factory=dict)
    assign: bool = False
    sel: Sel = Field(default_factory=Sel)


class KeyIn(BaseModel):
    rid: str | None = Field(None, max_length=64)
    values: dict = Field(default_factory=dict)       # the record's field values (in-place editor text already written to the fields)
    assigned: bool = False                           # an earlier key press already assigned the master values
    sel: Sel = Field(default_factory=Sel)


class BtnIn(BaseModel):
    sel: Sel = Field(default_factory=Sel)
    change_old: bool = False                         # XFCheckBox1
    answer: bool | None = None                       # MessageDlg ASK_OLD (None = not asked yet)


def _current(conn, ds, rid, sel: Sel):
    if rid is None:
        return None
    st = state(conn, sel)
    return next((x for x in st[ds] if x["rid"] == rid), None)


def post(conn, b: PostIn):
    st = state(conn, b.sel)
    cur = next((x for x in st[b.ds] if x["rid"] == b.rid), None) if b.rid else None
    if b.rid and cur is None:
        raise SErr("deposits.st_err_empty")
    vals = {k.upper(): v for k, v in b.values.items() if k.upper() not in ("ID",)}
    if b.rid is None:                                         # DOA master/detail: DetailFields := master value on Insert
        if b.ds == "periods":
            vals["DEPID"] = st["cur"]["dep"]
        elif b.ds == "caps":
            vals["PERIODID"] = st["cur"]["period"] or None
    if b.assign:
        vals.update(_assign(conn, b.ds, st["cur"]))
    ds_post(conn, b.ds, b.rid, vals, cur)


def keypress(conn, b: KeyIn):
    """XDBGrid5KeyPress: read the 18 values (AsFloat) of the current DepositPerSetting record, then (insert / edit state) assign
    the master values, then CallProcedure('deppseting_upd_hist_new', [...]) - on every key press, no commit."""
    st = state(conn, b.sel)
    cur = next((x for x in st["pers"] if x["rid"] == b.rid), None) if b.rid else None
    rec = {f: (cur or {}).get(f.lower()) for f in HIST}
    kinds = {f: k for f, _, _, k in DS["pers"][1]}
    rec.update({k.upper(): _conv(k.upper(), kinds[k.upper()], v) for k, v in b.values.items() if k.upper() in rec})
    if b.assigned:
        rec.update({k: v for k, v in _assign(conn, "pers", st["cur"]).items() if k in rec})
    conn.call_proc(PKG, "deppseting_upd_hist_new", [_f(rec[f]) for f in HIST], commit=False)


def _keys(st):
    c = st["cur"]
    return [c["val"], c["period"], c["cap"], c["dep"], c["amt"]]     # Valute, Depperiods.ID, Depcapitalperiods.ID, DepositTypes.id, amount id


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/deposits/pct")
    g = require_module(D.CLSID)

    def run(fn, *a):
        try:
            return fn(*a)
        except SErr as e:
            err(400, e.key, **e.kw)

    @r.post("/open")
    def _open(b: Sel, ws=Depends(g)):
        D.check_right(ws.conn, "SBCM_PERCENT_SETTING")                     # N7Click (manager)
        return state(ws.conn, b)

    @r.post("/state")
    def _state(b: Sel, ws=Depends(g)):
        return state(ws.conn, b)

    @r.post("/post")
    def _post(b: PostIn, ws=Depends(g)):
        run(post, ws.conn, b)
        return state(ws.conn, b.sel)

    @r.post("/delete")
    def _delete(b: PostIn, ws=Depends(g)):
        """XDBGrid3KeyDown (depperiods / depcapitalperiods / amount grid), XDBGrid6KeyDown (Depositdatsettings): Delete key,
        RecordCount > 0, 'Silinməsinə əminsinizmi?', DataSet.Delete. XDBGrid5KeyDown: deppseting_hist_new(id, 0) first."""
        c = ws.conn
        cur = _current(c, b.ds, b.rid, b.sel)
        if cur is None:
            err(400, "deposits.st_err_empty")
        if b.ds == "pers":
            c.call_proc(PKG, "deppseting_hist_new", [int(cur.get("id") or 0), 0], commit=False)
        run(ds_delete, c, b.ds, b.rid)
        return state(c, b.sel)

    @r.post("/keypress")
    def _key(b: KeyIn, ws=Depends(g)):
        run(keypress, ws.conn, b)
        return {"ok": True}

    @r.post("/save")
    def _save(b: BtnIn, ws=Depends(g)):
        """XFButton1Click P:338-355: right SBCM_PERCENT_SETTING_SAVE; upd_confir_and_writ_memory_new(..., 0); no commit."""
        c = ws.conn
        D.check_right(c, "SBCM_PERCENT_SETTING_SAVE")
        c.call_proc(PKG, "upd_confir_and_writ_memory_new", _keys(state(c, b.sel)) + [0], commit=False)
        return {"message": MSG_SAVED}

    @r.post("/confirm")
    def _confirm(b: BtnIn, ws=Depends(g)):
        """XFButton2Click P:357-392: right SBCM_PERCENT_SETTING_COMMIT; checkbox -> MessageDlg -> upd_transh_percent(keys,
        amount FIRSTAMOUNT, LASTAMOUNT, DepositPerSetting INTERESTRATE); say := get_write_memory(keys); say > 0 -> message, exit;
        say = 0 -> upd_confir_and_writ_memory_new(..., 1) + message; no commit. The browser asks the question between two calls,
        so the right is checked again on the second call (a read-only check)."""
        c = ws.conn
        D.check_right(c, "SBCM_PERCENT_SETTING_COMMIT")
        if b.change_old and b.answer is None:
            return {"ask": ASK_OLD}
        st = state(c, b.sel)
        k = _keys(st)
        if b.change_old and b.answer:
            a = next((x for x in st["amounts"] if int(x.get("id") or 0) == st["cur"]["amt"]), {}) if st["cur"]["amt"] else {}
            p = next((x for x in st["pers"] if x["rid"] == st["cur"]["pers"]), {})
            c.call_proc(PKG, "upd_transh_percent", k + [_f(a.get("firstamount")), _f(a.get("lastamount")), _f(p.get("interestrate"))], commit=False)
        say = float(c.call_func(PKG, "get_write_memory", k, float) or 0)
        if say > 0:
            return {"message": MSG_NOT_SAVED}
        if say == 0:
            c.call_proc(PKG, "upd_confir_and_writ_memory_new", k + [1], commit=False)
            return {"message": MSG_CONFIRMED}
        return {"message": None}                              # say < 0: neither branch runs

    return r
