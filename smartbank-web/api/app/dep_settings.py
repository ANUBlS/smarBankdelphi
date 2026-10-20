"""SBDM_Settings_new.bpl (ReferLoader_new.exportproc: showrefer / showcccgroups / showcategories / showdeposittypes /
showaccountturning). SQL verbatim in dep_settings_sql.py.

The forms edit TOracleDataSets directly (DB grids, TDBNavigator, DB-aware combos). DOA's default ApplyRecord is
reproduced: Post -> insert into / update <table> ... where rowid = :rowid with the dataset's persistent data fields,
Delete -> delete ... where rowid; CommitOnPost (default True) commits after each Post / Delete. The OnApplyRecord
handlers of DepositTypes and settings only read fields (their package calls are commented out), so the default applies.
TDataSet.Post checks Required fields in field order: "Field '<DisplayName>' must have a value".
Esc on an add/edit form only closes it; the caller's following Refresh runs CheckBrowseMode, which Posts a modified
record (without the values the Qəbul handler would have set) or Cancels an unmodified one - reproduced via `esc`.
"""
from __future__ import annotations

from fastapi import APIRouter, Depends
from pydantic import BaseModel, Field

from . import deposits as D
from . import dep_settings_sql as Q
from .customers import row
from .db import DBError

RIGHTS = {"cccgroups": "SBCM_ACCOUNT_GROUP", "categories": "SBCM_CUSTOMERS_TYPE", "deposittypes": "SBCM_DEPOSIT_TYPE",
          "accountturning": "SBCM_LOSS_INCOME_ADJUSTMENT_ACC", "refer": None}     # DepositsManagerImpl_new N1-N5Click


class SErr(Exception):
    def __init__(self, key, **kw):
        self.key, self.kw = key, kw


def _rows(conn, sql, binds=None):
    out = []
    for r in conn.query(sql, binds or {}):
        x = row(r)
        rid = r.get("ROWID")
        x.pop("rowid", None)
        x["rid"] = None if rid is None else str(rid)
        out.append(x)
    return out


# (table, [(field, DisplayName, required, kind)])  - the persistent TFields with FieldKind = fkData, in dfm order.
# kind: "f" TFloatField, "i" TIntegerField, int n = TWideStringField Size n
DS = {
    "categories": ("sbcm_categories_new", [("CATEGORY", "CATEGORY", False, 128)]),                    # frmCategoriesImpl_new.dfm:87-90
    "zone_info": ("sbcm_acc_zone_info_new", [("ZONEID", "ZONEID", False, "f"), ("ACCGROUP", "ACCGROUP", False, "f")]),   # frmAccGroupsImpl_new.dfm:150-155
    "deposittypes": ("sbcm_deposit_types_new", [("ID", "№", False, "f"), ("TYPE", "Adı", True, 256), ("ADDITIONALTYPE", "ADDITIONALTYPE", False, 32),
                                                ("WITHDRAWTYPE", "WITHDRAWTYPE", False, 32), ("DATEINTERVAL", "DATEINTERVAL", False, "i"),
                                                ("PERCENT_RULE", "PERCENT_RULE", False, "f"), ("AMOUNT_RULE", "AMOUNT_RULE", False, "f")]),  # dfm:279-305
    "settings": ("sbcm_settings_new", [("ID", "ID", False, "f"), ("PARENTID", "PARENTID", True, "f"), ("CURRENCYID", "CURRENCYID", True, "f"),
                                       ("ACCID", "ACCID", True, "f"), ("BRANCHID", "BRANCHID", True, "f")]),    # frmAccountTurningImpl_new.dfm:632-650
}


def _conv(f, kind, v):
    """TField.AsString assignment: StrToFloat / StrToInt ('x' is not a valid ... value); string fields keep MaxLength = Size."""
    if v is None or v == "":
        return None
    if kind in ("f", "i"):
        try:
            x = float(str(v).replace(",", ".")) if kind == "f" else int(str(v))
        except ValueError:
            raise SErr("deposits.st_err_float" if kind == "f" else "deposits.st_err_int", value=str(v)[:64])
        return int(x) if kind == "f" and x == int(x) else x
    v = str(v)
    if len(v) > kind:
        raise SErr("deposits.st_err_size", field=f, size=kind)
    return v


def post(conn, ds, rid, values: dict, current: dict | None = None):
    """TDataSet.Post: CheckRequiredFields, then DOA's default insert / update (rowid), CommitOnPost."""
    table, fields = DS[ds]
    kinds = {f: k for f, _, _, k in fields}
    rec = {f: (current or {}).get(f.lower()) for f, _, _, _ in fields}
    rec.update({k.upper(): _conv(k.upper(), kinds[k.upper()], v) for k, v in values.items() if k.upper() in rec})
    for f, lab, req, _ in fields:
        if req and rec[f] in (None, ""):
            raise SErr("deposits.st_err_required", field=lab)
    try:
        if rid is None:
            cols = [f for f, _, _, _ in fields]
            conn.execute(f"insert into {table} ({', '.join(cols)}) values ({', '.join(':' + c for c in cols)})", rec)
        else:
            conn.execute(f"update {table} set {', '.join(f'{c} = :{c}' for c in rec)} where rowid = :RID", {**rec, "RID": rid})
        conn.commit()
    except DBError:
        conn.rollback()
        raise


def delete(conn, ds, rid):
    """TDataSet.Delete (DOA: delete ... where rowid), CommitOnPost."""
    if rid is None:
        raise SErr("deposits.st_err_empty")                    # SDataSetEmpty
    table = DS[ds][0]
    try:
        conn.execute(f"delete from {table} where rowid = :RID", {"RID": rid})
        conn.commit()
    except DBError:
        conn.rollback()
        raise


def refer_tree(conn):
    """TVBuild / TVAddNode: TVSubItems recursively from ParentID = -1 (pre-order = TreeItems / AbsoluteIndex)."""
    def node(pid, depth):
        if depth > 32:
            return []
        return [{"id": int(r["ID"]), "lname": r.get("LNAME"), "children": node(int(r["ID"]), depth + 1)}
                for r in conn.query(Q.REF_SQL_TVSUBITEMS, {"ParentID": pid})]
    return node(-1, 0)


def refer_item(conn, rid):
    """TVChange: ReferLink.Locate(ID); Value null -> both disabled; SourceList null -> edit, else combo (';'-split)."""
    r = next((x for x in conn.query(Q.REF_SQL_REFERLINK) if int(x["ID"]) == rid), None)
    if r is None or r.get("VALUE") is None:
        return {"mode": "none", "apply": False}
    if r.get("SOURCELIST") is None:
        return {"mode": "edit", "value": str(r["VALUE"]), "apply": True}
    items = str(r["SOURCELIST"]).split(";")
    return {"mode": "combo", "items": items, "index": items.index(str(r["VALUE"])) if str(r["VALUE"]) in items else -1, "apply": True}


class Body(BaseModel):
    form: str = Field(pattern=r"^(refer|cccgroups|categories|deposittypes|accountturning)$")
    rid: str | None = Field(None, max_length=64)
    id: int | None = None
    zoneid: int | None = None
    typeid: int | None = None
    parentid: int | None = None
    values: dict = Field(default_factory=dict)
    esc: bool = False
    modified: bool = True
    value: str | None = Field(None, max_length=4000)
    index: int | None = None


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/deposits/sett")
    g = require_module(D.CLSID)

    def guard(conn, b: Body):
        if RIGHTS[b.form]:
            D.check_right(conn, RIGHTS[b.form])

    def run(fn, *a):
        try:
            return fn(*a)
        except SErr as e:
            err(400, e.key, **e.kw)

    def data(conn, b: Body):
        if b.form == "categories":
            return {"rows": _rows(conn, Q.CAT_SQL_CATEGORIES)}
        if b.form == "cccgroups":
            zones = [row(x) for x in conn.query(Q.GRP_SQL_ACC_ZONES)]
            z = b.zoneid if b.zoneid is not None else (zones[0]["zoneid"] if zones else None)
            return {"zones": zones, "zoneid": z, "rows": _rows(conn, Q.GRP_SQL_ACC_ZONE_INFO, {"zoneid": z}) if z is not None else []}
        if b.form == "deposittypes":
            return {"rows": _rows(conn, Q.DT_SQL_DEPOSITTYPES), "withtypes": [row(x) for x in conn.query(Q.DT_SQL_ADDTYPESFORWITH)],
                    "colltypes": [row(x) for x in conn.query(Q.DT_SQL_ADDTYPESFORCOLL)]}
        if b.form == "accountturning":
            cats = [row(x) for x in conn.query(Q.AT_SQL_CATEGORIES)]
            t = b.typeid if b.typeid is not None else (cats[0]["id"] if cats else None)
            movies = [row(x) for x in conn.query(Q.AT_SQL_MOVIE_NAMES, {"typeid": t})] if t is not None else []
            p = b.parentid if b.parentid is not None and any(m["id"] == b.parentid for m in movies) else (movies[0]["id"] if movies else None)
            fil = [row(x) for x in conn.query(Q.AT_SQL_FILIALS)]
            val = [row(x) for x in conn.query(Q.AT_SQL_VALUTE)]
            acc = [row(x) for x in conn.query(Q.AT_SQL_ACCOUNTS)]
            sets = _rows(conn, Q.AT_SQL_SETTINGS, {"parentid": p}) if p is not None else []
            lk = lambda lst, k, v, key: next((x[v] for x in lst if x[k] == key), None)    # noqa: E731  fkLookup fields
            for s in sets:
                s.update(filialname=lk(fil, "id", "name", s.get("branchid")), currencyname=lk(val, "valute", "val_name", s.get("currencyid")),
                         accountnumber=lk(acc, "id", "acc_no", s.get("accid")))
            return {"categories": cats, "typeid": t, "movies": movies, "parentid": p, "rows": sets, "filials": fil, "valutes": val, "accounts": acc}
        return {"tree": refer_tree(conn)}

    @r.post("/open")
    def _open(b: Body, ws=Depends(g)):
        guard(ws.conn, b)
        return data(ws.conn, b)

    @r.post("/post")
    def _post(b: Body, ws=Depends(g)):
        guard(ws.conn, b)
        c = ws.conn
        if b.esc and not b.modified:                        # CheckBrowseMode on an unmodified record: Cancel
            return {"posted": False, **data(c, b)}
        if b.form == "categories":
            cur = next((x for x in _rows(c, Q.CAT_SQL_CATEGORIES) if x["rid"] == b.rid), None) if b.rid else None
            run(post, c, "categories", b.rid, {"CATEGORY": b.values.get("CATEGORY")}, cur)
        elif b.form == "cccgroups":
            if b.zoneid is None:
                err(400, "deposits.st_err_empty")
            cur = next((x for x in _rows(c, Q.GRP_SQL_ACC_ZONE_INFO, {"zoneid": b.zoneid}) if x["rid"] == b.rid), None) if b.rid else None
            vals = {k: b.values[k] for k in ("ZONEID", "ACCGROUP") if k in b.values}
            if b.rid is None:                                  # master/detail: DetailFields ZONEID := master ZONEID on insert (editable after)
                vals.setdefault("ZONEID", b.zoneid)
            run(post, c, "zone_info", b.rid, vals, cur)
        elif b.form == "deposittypes":
            cur = next((x for x in _rows(c, Q.DT_SQL_DEPOSITTYPES) if x["rid"] == b.rid), None) if b.rid else None
            vals = {"TYPE": b.values.get("TYPE"), "WITHDRAWTYPE": b.values.get("WITHDRAWTYPE")}
            if not b.esc:                                      # ButtonOkClick: PERCENT_RULE (hidden CheckBox1) / AMOUNT_RULE (CheckBox2)
                vals.update(PERCENT_RULE=1 if b.values.get("PERCENT_RULE") else 0, AMOUNT_RULE=1 if b.values.get("AMOUNT_RULE") else 0)
            run(post, c, "deposittypes", b.rid, vals, cur)
        elif b.form == "accountturning":
            if b.parentid is None:
                err(400, "deposits.st_err_empty")
            cur = next((x for x in _rows(c, Q.AT_SQL_SETTINGS, {"parentid": b.parentid}) if x["rid"] == b.rid), None) if b.rid else None
            vals = {k: b.values.get(k) for k in ("BRANCHID", "CURRENCYID", "ACCID")}
            if not b.esc:                                      # Button1Click: CurrencyID := valute.Valute (the combo's located row)
                vs = c.query(Q.AT_SQL_VALUTE)
                vals["CURRENCYID"] = b.values.get("CURRENCYID") if b.values.get("CURRENCYID") is not None else (vs[0]["VALUTE"] if vs else None)
            if b.rid is None:
                vals["PARENTID"] = b.parentid                  # DetailFields PARENTID := movie_names.ID
            run(post, c, "settings", b.rid, vals, cur)
        return {"posted": True, **data(c, b)}

    @r.post("/delete")
    def _delete(b: Body, ws=Depends(g)):
        guard(ws.conn, b)
        c = ws.conn
        if b.form == "deposittypes":                          # ToolButton5Click: delDepositTypes(ID) positional, no commit
            c.call_proc("SBCM_RPDEPOSITORY_new", "delDepositTypes", [int(b.id or 0)], commit=False)
        else:
            run(delete, c, {"categories": "categories", "cccgroups": "zone_info", "accountturning": "settings"}[b.form], b.rid)
        return data(c, b)

    @r.post("/refer/item")
    def _ritem(b: Body, ws=Depends(g)):
        return refer_item(ws.conn, int(b.id or 0))

    @r.post("/refer/apply")
    def _rapply(b: Body, ws=Depends(g)):
        """BtnApplyClick: UPD_SBCM_REFERENCES(ID, Name, LName, ParentID, NewValue, SourceList) positional; Refresh; no commit."""
        c = ws.conn
        rec = next((x for x in c.query(Q.REF_SQL_REFERLINK) if int(x["ID"]) == int(b.id or 0)), None)
        if rec is None:
            err(400, "deposits.st_err_empty")
        it = refer_item(c, int(rec["ID"]))
        if it["mode"] == "combo":
            if b.index is None or not 0 <= b.index < len(it["items"]):
                err(400, "deposits.st_err_index", index=-1 if b.index is None else b.index)   # Items.Strings[-1]: EListError
            nv = it["items"][b.index]
        else:
            nv = b.value or ""
        c.call_proc("sbcm_rpdepository_new", "UPD_SBCM_REFERENCES",
                    [rec["ID"], rec.get("NAME"), rec.get("LNAME"), rec.get("PARENTID"), nv, rec.get("SOURCELIST")], commit=False)
        return refer_item(c, int(rec["ID"]))

    return r
