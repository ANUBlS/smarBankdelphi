"""Off-balance currencies - port of Delphi Packages/out_Avalute (Tout_AvaluteForm, CLSID below).

out_Avalute.dpr compiles only out_AvaluteImpl1.pas (+ TLB). Visible UI (Panel19): grid DBGridAvalute_T on OrDS_Avalute_T,
GroupBox1 'Məzənnə fərqi hesabları' (CBoxKREDIT = GƏLIR, CBoxDebet = XƏRC on OrDS_ValuteSettings, list = Accounts),
buttons Yadda saxla / Imtina / Yeniləmək. Panel2 (AvaluteDataSet editors), DBGrid1, DBNavigator1, GroupBox2 and GroupBox3
are Visible = False and are not ported.
OrDS_Avalute_TApplyRecord (.pas:523-599): 'I' -> P_AVALUTE.add_avalute, 'U' -> P_AVALUTE.upd_avalute (23 named v_* params,
every value FieldByName(..).AsString), 'L','R','C' -> nothing, anything else ('D') -> Applied := False, i.e. DOA's own
DELETE by ROWID. CommitOnPost (DOA default).
"""
from __future__ import annotations
from decimal import Decimal, InvalidOperation

from fastapi import APIRouter, Depends
from pydantic import BaseModel, Field

from . import out_set_sql as Q
from .customers import row
from .delphi import float_to_str

CLSID = "{83FA9280-CF34-4704-A329-5FB25414F0F5}"     # out_Avalute_TLB.pas:56 CLASS_out_AvaluteForm

# Order of the CallProcedure name/value list (.pas:531-555 and :564-588) and the field types (dfm:1017-1095).
PARAMS = ["VALUTE", "VAL_NAME", "VALU_NAME", "VALU_SHORT", "USTORG", "USTPOK", "VALU_GEN", "VALU_AZ", "USING", "VALU_OTHER",
          "VALU_INTER", "VALU_BALA", "PRISTAVKA", "COUNTRY", "UST_POK1", "OFFICAL", "LIMIT", "DEBET", "KREDIT", "F5501P",
          "F5501V", "SDEBET", "SCREDIT"]
INT_F = {"VALUTE", "USING"}
FLOAT_F = {"USTORG", "USTPOK", "PRISTAVKA", "UST_POK1", "LIMIT", "DEBET", "KREDIT", "F5501P", "F5501V", "SDEBET", "SCREDIT"}
SIZES = {"VAL_NAME": 10, "VALU_NAME": 25, "VALU_SHORT": 10, "VALU_GEN": 10, "VALU_AZ": 25, "VALU_OTHER": 25, "VALU_INTER": 3,
         "VALU_BALA": 25, "OFFICAL": 5, "COUNTRY": 20}
GRID = ["VALUTE", "VAL_NAME", "VALU_NAME", "VALU_SHORT", "VALU_BALA", "COUNTRY", "USING"]    # DBGridAvalute_T dfm:698-800
SQL_DELETE = "delete from out_avalute where rowid = :doa_rowid"                              # DOA default (Applied = False)


class BadValue(Exception):
    def __init__(self, field):
        self.field = field


def as_string(name: str, v) -> str:
    """Value as the dataset holds it, then TField.AsString. Typed fields reject non-numbers like the DB-aware edit does."""
    if v is None or (isinstance(v, str) and v.strip() == ""):
        return ""
    if name in INT_F or name in FLOAT_F:
        try:
            d = Decimal(str(v).strip().replace(",", "."))
        except InvalidOperation:
            raise BadValue(name)
        if name in INT_F:
            if d != d.to_integral_value():
                raise BadValue(name)
            return str(int(d))
        return float_to_str(int(d) if d == d.to_integral_value() else float(d))
    s = str(v)
    if len(s) > SIZES.get(name, 4000):
        raise BadValue(name)
    return s


def proc_args(rec: dict) -> dict:
    """['v_VALUTE', FieldByName('VALUTE').AsString, ...] -> named parameters."""
    return {"v_" + n: as_string(n, rec.get(n.lower())) for n in PARAMS}


class AvIn(BaseModel):
    rec: dict                           # the whole record as the client dataset holds it (lower-case field names)


class SetIn(BaseModel):
    valute: int | None = None           # OrDS_Avalute_T current VALUTE (the :Val the settings were opened with)
    kredit: float | None = None         # CBoxKREDIT  (GƏLIR)
    debet: float | None = None          # CBoxDebet   (XƏRC)
    grid: dict | None = None            # pending grid edit: {"rowid": .. or None for insert, "rec": {...}}


def list_rows(conn):
    out = []
    for r in conn.query(Q.SQL_AVALUTE_T):
        o = row(dict(r))
        o["rowid"] = r.get("ROWID")
        out.append(o)
    return out


def settings(conn, valute: int):
    rows = conn.query(Q.SQL_VALUTE_SETTINGS, {"Val": int(valute)})
    if not rows:
        return None
    o = row(dict(rows[0]))
    o["rowid"] = rows[0].get("ROWID")
    return o


def post_grid(conn, rowid: str | None, rec: dict):
    """OrDS_Avalute_TApplyRecord 'I' / 'U' + CommitOnPost."""
    args = proc_args(rec)
    if not args["v_VALUTE"]:
        raise BadValue("VALUTE")                     # AvaluteDataSetVALUTE Required = True (dfm:1019)
    conn.call_proc("P_AVALUTE", "add_avalute" if not rowid else "upd_avalute", [], named=args)


# DOA-generated DML for OrDS_ValuteSettings (no OnApplyRecord): only modified fields are written.
def save_settings(conn, valute: int | None, kredit, debet):
    """BtnOKClick .pas:601-606: OrDS_ValuteSettings.Edit; Post.
    With a record: UPDATE of the changed lookup fields by ROWID. With no record for this currency, TDataSet.Edit on an empty
    dataset turns into Insert: the new row gets only the chosen DEBET/KREDIT (VALUTE is not set - Delphi behaviour)."""
    cur = settings(conn, valute) if valute is not None else None
    if cur:
        ch = {}
        if kredit != cur.get("kredit"):
            ch["KREDIT"] = kredit
        if debet != cur.get("debet"):
            ch["DEBET"] = debet
        if ch:
            conn.execute("update ValuteSettings set %s where rowid = :doa_rowid" % ", ".join("%s = :%s" % (k, k) for k in ch),
                         {**ch, "doa_rowid": cur["rowid"]})
    else:
        ch = {k: v for k, v in (("DEBET", debet), ("KREDIT", kredit)) if v is not None}
        if ch:
            conn.execute("insert into ValuteSettings (%s) values (%s)" % (", ".join(ch), ", ".join(":" + k for k in ch)), ch)
    conn.commit()


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/out-avalute")
    g = require_module(CLSID)

    @r.get("")
    def _list(ws=Depends(g)):
        c = ws.conn
        return {"rows": list_rows(c), "accounts": [row(x) for x in c.query(Q.SQL_AVALUTE_ACCOUNTS)]}

    @r.get("/settings")
    def _settings(valute: int, ws=Depends(g)):
        return {"settings": settings(ws.conn, valute)}

    @r.post("/row")
    def _post(b: AvIn, rowid: str | None = None, ws=Depends(g)):
        """Grid post (moving off an edited row / Enter)."""
        try:
            post_grid(ws.conn, rowid, b.rec)
        except BadValue as e:
            err(400, "out_avalute.err_value", field=e.field)
        return {"ok": True}

    @r.delete("/row")
    def _del(rowid: str, ws=Depends(g)):
        c = ws.conn
        try:
            c.execute(SQL_DELETE, {"doa_rowid": rowid})
            c.commit()
        except Exception:
            c.rollback()
            raise
        return {"ok": True}

    @r.post("/ok")
    def _ok(b: SetIn, ws=Depends(g)):
        """BtnOKClick: try OrDS_Avalute_T.Post; except end;  then settings Edit/Post. The grid error is swallowed by
        Delphi; the web still saves the settings but returns the error text so the user is told (see PARITY)."""
        c, grid_error = ws.conn, None
        if b.grid:
            try:
                post_grid(c, b.grid.get("rowid"), b.grid.get("rec") or {})
            except BadValue as e:
                grid_error = "field " + e.field
            except Exception as e:  # noqa: BLE001 - mirrors the empty except
                grid_error = getattr(e, "message", str(e))
        save_settings(c, b.valute, b.kredit, b.debet)
        return {"ok": True, "grid_error": grid_error}

    return r
