"""ASAN Finance - port of Delphi Packages/ASANFinance (ASANFinance / TASANFinanceForm; units ASANFinanceImpl,
AsanDmInpl (TAsanDm), PersonalQrFmImpl / EpployeRepImpl / PensioonRepImpl / EtkisRepİmpl / VoenRepImpl (QuickReport
prints - on hold)). No other copies: CLASS_ASANFinanceForm is only in Packages/ASANFinance/ASANFinance_TLB.pas.
SQL verbatim in asan_sql.py; the HTTP service is behind asan_http.py (ASAN_MODE).

DataModuleCreate (AsanDmInpl.pas): BankInfo.Open; ods_link.Open. ActiveFormCreate: PageControl1.TabIndex := 1;
DateTimePicker1 / 2 := now.
CheckAsan(Fin, service, url) (ASANFinanceImpl.pas): IdDSet (seq_asan_loq.NEXTVAL) -> id;
if service <> 'BalanceExp': LogDSest(:pin, :service, :doc = PaspNum.Text) -> log := RecordCount;
if (log > 0) and (service <> 'Balance'): InsAsanLog insert (id, pin, service, status 'duplicate', info = LogDSest.info),
  Post (CommitOnPost default True -> commit), Memo1 := cached info;
else HTTP (GET / POST), Memo1 := response; if service <> 'Balance': insert (id, pin, service, 'success', info,
  DOCNUMBER = PaspNum.Text, URL = BASE + url + Fin), Post -> commit; on exception: ShowMessage('Asan Finansa qoşulmada
  problem var: ' + E.Message); exit - the caller continues with the unchanged Memo1 / the new id.
Memo1 and the global id live as long as the form: kept in ws.module_state['asan'].
Status (by id): code := FieldByName('code').AsInteger (0 when no row); (status <> 0) or (Message not null) ->
ShowMessage(Message) and exit.
"""
from __future__ import annotations

import base64
import datetime
import io
import json

from fastapi import APIRouter, Depends, Response
from pydantic import BaseModel, Field

from . import asan_sql as Q
from .asan_http import AsanError, client
from .customers import row

CLSID = "{DA5847F2-71D4-4757-AB06-8C280C2677A9}"     # ASANFinance_TLB.pas CLASS_ASANFinanceForm
# DOA default insert of InsAsanLog (UpdatingTable asan_log; assigned fields only)
SQL_INS_LOG_DUP = "insert into asan_log (ID, PIN, SERVICE, STATUS, INFO) values (:ID, :PIN, :SERVICE, :STATUS, :INFO)"
SQL_INS_LOG_OK = ("insert into asan_log (ID, PIN, SERVICE, STATUS, INFO, DOCNUMBER, URL) "
                  "values (:ID, :PIN, :SERVICE, :STATUS, :INFO, :DOCNUMBER, :URL)")
# TabSheet1 TEdits with Tag = 20, in component (dfm) order; Button2 fills each from Response.<Name>
TAG20 = ("PIN", "Citizenship", "GivenOrganization", "MaritalStatus", "ExpireDate", "GivenDate", "RegistrationAddress",
         "Gender", "BirthAddress", "BirthDate", "Patronymic", "Surname", "Name", "DocumentNumber", "MilitaryStatus",
         "BloodType", "EyeColor", "Height")


class AsanMsg(Exception):
    def __init__(self, key, **kw):
        self.key, self.kw = key, kw


def _st(ws) -> dict:
    return ws.module_state.setdefault("asan", {"memo1": "", "id": None})


def _jv(v) -> str:
    """TJSONValue.Value: string / number text, 'true' / 'false', 'null'; objects and arrays -> ''."""
    if v is None:
        return "null"
    if isinstance(v, bool):
        return "true" if v else "false"
    if isinstance(v, (int, float)):
        return json.dumps(v)
    return v if isinstance(v, str) else ""


def links(c) -> dict:
    r = c.query(Q.SQL_ASAN_ODS_LINK)
    return {k: v for k, v in (r[0] if r else {}).items()}


def check_asan(ws, fin: str, service: str, url: str, doc: str) -> str | None:
    """CheckAsan; returns the 'Asan Finansa qoşulmada problem var' text when the HTTP call failed (else None)."""
    c, st = ws.conn, _st(ws)
    st["id"] = c.query(Q.SQL_ASAN_IDDSET)[0]["ID"]
    log, cached = 0, None
    if service != "BalanceExp":
        rows = c.query(Q.SQL_ASAN_LOGDSEST, {"pin": fin, "service": service, "doc": doc})
        log = len(rows)
        cached = rows[0]["INFO"] if rows else None
    if log > 0 and service != "Balance":
        c.execute(SQL_INS_LOG_DUP, {"ID": st["id"], "PIN": fin, "SERVICE": service, "STATUS": "duplicate", "INFO": cached})
        c.commit()                                                     # CommitOnPost
        st["memo1"] = "" if cached is None else str(cached)
        return None
    bi = c.query(Q.SQL_ASAN_BANKINFO)
    key = "" if not bi or bi[0].get("FOND_REG_NO") is None else str(bi[0]["FOND_REG_NO"])
    try:
        h = client()
        if fin == "post":
            st["memo1"] = h.post(url, key)
        elif service == "Personalinfo":
            st["memo1"] = h.get(url + "PinAndDocNumber?pin=" + fin + "&docNumber=" + doc, key)
        else:
            st["memo1"] = h.get(url + fin, key)
    except AsanError as e:
        return str(e)
    if service != "Balance":
        from .asan_http import base
        c.execute(SQL_INS_LOG_OK, {"ID": st["id"], "PIN": fin, "SERVICE": service, "STATUS": "success",
                                   "INFO": st["memo1"], "DOCNUMBER": doc, "URL": base() + url + fin})
        c.commit()                                                     # CommitOnPost
    return None


def status_msg(c, i) -> str | None:
    """AsanDm.Status by id: (code <> 0) or (Message not null) -> the message (ShowMessage + exit)."""
    r = c.query(Q.SQL_ASAN_STATUS, {"id": i})
    if not r:
        return None
    try:
        code = int(r[0].get("CODE") or 0)
    except ValueError:
        raise AsanMsg("asan.err_not_int", value=str(r[0].get("CODE")))
    if code != 0 or r[0].get("MESSAGE") is not None:
        return "" if r[0].get("MESSAGE") is None else str(r[0]["MESSAGE"])
    return None


def parse_status(memo: str):
    """Button2 / Button3: ParseJSONValue(Memo1.Text); TJSONObject(Status).Code; <> 0 -> ShowMessage(Message), exit."""
    try:
        j = json.loads(memo)
        s = j["Status"]
        code = int(_jv(s["Code"]))
    except Exception:  # noqa: BLE001 - Delphi raises an unhandled exception (access violation / EConvertError)
        raise AsanMsg("asan.err_parse")
    if code != 0:
        return j, _jv(s.get("Message"))
    return j, None


class PinIn(BaseModel):
    pin: str = Field(default="", max_length=64)
    doc: str = Field(default="", max_length=64)


class ExpIn(BaseModel):
    start: str = Field(pattern=r"^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$")
    end: str = Field(pattern=r"^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$")
    offset: float = 0
    limit: float = 0


class IdIn(BaseModel):
    id: int


class CustIn(BaseModel):
    fields: dict[str, str]


def _curr(v: float) -> str:
    """CurrToStr: shortest decimal text (comma as DecimalSeparator in az locale is not used by the JSON)."""
    return str(int(v)) if v == int(v) else repr(v)


def _strtodate(s: str) -> datetime.datetime:
    """StrToDate with ShortDateFormat dd.mm.yyyy (DateSeparator '.')."""
    try:
        return datetime.datetime.strptime(s.strip(), "%d.%m.%Y")
    except ValueError:
        raise AsanMsg("asan.err_date", value=s)


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/asan")
    g = require_module(CLSID)

    def fail(e: AsanMsg):
        err(400, e.key, **e.kw)

    @r.get("/init")
    def _init(ws=Depends(g)):
        c = ws.conn
        c.query(Q.SQL_ASAN_BANKINFO)                                       # DataModuleCreate BankInfo.Open (logo: prints)
        links(c)                                                           # ods_link.Open
        now = datetime.datetime.now().replace(microsecond=0)
        return {"now": now.isoformat(sep=" ")}

    def _after(ws, conn_err, sets):
        """Button4/5/6/7/10 after CheckAsan: Status check, then the result datasets by id."""
        c, i = ws.conn, _st(ws)["id"]
        out = {"conn_error": conn_err, "id": i}
        m = status_msg(c, i)
        if m is not None:
            out["message"] = m
            return out
        for k, sql in sets:
            out[k] = [row(x) for x in c.query(sql, {"id": i})]
        return out

    @r.post("/balance")                                                    # Button3Click
    def _bal(ws=Depends(g)):
        ce = check_asan(ws, "", "Balance", "/api/v1/Info/Balance", "")
        try:
            j, m = parse_status(_st(ws)["memo1"])
            if m is not None:
                return {"conn_error": ce, "message": m}
            return {"conn_error": ce, "balance": _jv(j["Response"]["Balance"])}
        except AsanMsg as e:
            return {"conn_error": ce, "error": e.key}
        except Exception:  # noqa: BLE001
            return {"conn_error": ce, "error": "asan.err_parse"}

    @r.post("/personal")                                                   # Button2Click
    def _pers(b: PinIn, ws=Depends(g)):
        if b.pin == "" or b.doc == "":
            err(400, "asan.err_pin_doc")
        ce = check_asan(ws, b.pin, "Personalinfo", links(ws.conn).get("PERSONALINFO") or "", b.doc)
        try:
            j, m = parse_status(_st(ws)["memo1"])
        except AsanMsg as e:
            return {"conn_error": ce, "error": e.key}
        if m is not None:
            return {"conn_error": ce, "message": m}
        fill = {}
        resp = j.get("Response")
        for name in TAG20:                                                 # Components order; a missing pair -> AV
            if not isinstance(resp, dict) or name not in resp:
                return {"conn_error": ce, "fill": fill, "error": "asan.err_pin_wrong", "field": name}
            fill[name] = _jv(resp[name])
        img = resp.get("Image")
        try:
            data = base64.b64decode(img.strip()) if isinstance(img, str) else b""
        except Exception:  # noqa: BLE001
            data = b""
        return {"conn_error": ce, "fill": fill, "image": base64.b64encode(data).decode() if data else None}

    @r.post("/employee")                                                   # Button4Click (PaspNum := '' first)
    def _emp(b: PinIn, ws=Depends(g)):
        if b.pin == "":
            err(400, "asan.err_pin")
        ce = check_asan(ws, b.pin, "Employeeinfo", links(ws.conn).get("EMPLOYEEINFO") or "", "")
        return _after(ws, ce, [("active", Q.SQL_ASAN_EMPLOYERDATASET), ("deactive", Q.SQL_ASAN_DEACTIVEEMPDSET)])

    @r.post("/pension")                                                    # Button5Click (PaspNum := '' first)
    def _pen(b: PinIn, ws=Depends(g)):
        if b.pin == "":
            err(400, "asan.err_pin")
        ce = check_asan(ws, b.pin, "PensionInfo", links(ws.conn).get("PENSIONINFO") or "", "")
        return _after(ws, ce, [("pension", Q.SQL_ASAN_PENSIONDSET)])

    @r.post("/farm")                                                       # Button6Click (doc = current PaspNum)
    def _farm(b: PinIn, ws=Depends(g)):
        if b.pin == "":
            err(400, "asan.err_pin")
        ce = check_asan(ws, b.pin, "FarmInfo", links(ws.conn).get("FARMINFO") or "", b.doc)
        return _after(ws, ce, [("person", Q.SQL_ASAN_FARMPERSONDSET), ("farms", Q.SQL_ASAN_FARMSET)])

    @r.post("/voen")                                                       # Button10Click (doc = current PaspNum)
    def _voen(b: PinIn, ws=Depends(g)):
        if b.pin == "":
            err(400, "asan.err_voen")
        ce = check_asan(ws, b.pin, "VoenInfo", links(ws.conn).get("VOENINFO") or "", b.doc)
        return _after(ws, ce, [("voen", Q.SQL_ASAN_VOENSET)])

    @r.post("/expenses")                                                   # Button7Click
    def _exp(b: ExpIn, ws=Depends(g)):
        x = ('{ "StartDate": "' + b.start + '", "EndDate": "' + b.end + '","Offset": ' + _curr(b.offset)
             + ',"Limit":' + _curr(b.limit) + '}')
        ce = check_asan(ws, "post", "BalanceExp", x, "")
        out = _after(ws, ce, [("expenses", Q.SQL_ASAN_XERCSET)])
        out["memo4"] = x
        return out

    @r.post("/expenses_excel")                                             # Button8Click: ExportDataset(XercSet,'Xercler')
    def _xls(b: IdIn, ws=Depends(g)):
        from openpyxl import Workbook
        from openpyxl.styles import Font
        if _st(ws)["id"] != b.id:
            err(400, "error.generic")
        rows = ws.conn.query(Q.SQL_ASAN_XERCSET, {"id": b.id})
        wb = Workbook()
        sh = wb.active
        sh.title = "Xercler"
        cols = list(rows[0].keys()) if rows else ["ID", "ROW_NUMBER", "PIN", "DAT", "SERVICE", "AMOUNT", "IPADDRESS"]
        sh.append(cols)
        for cell in sh[1]:
            cell.font = Font(bold=True)
        for x in rows:
            sh.append(list(x.values()))
        bio = io.BytesIO()
        wb.save(bio)
        return Response(bio.getvalue(), media_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                        headers={"Content-Disposition": 'attachment; filename="Xercler.xlsx"'})

    @r.post("/add_customer")                                               # Button9Click
    def _cust(b: CustIn, ws=Depends(g)):
        f = {k: (b.fields.get(k) or "") for k in TAG20}
        if f["DocumentNumber"] == "":
            err(400, "asan.err_query_first")
        try:
            named = {
                "p_passnum": f["DocumentNumber"], "p_paspin": f["PIN"], "p_name": f["Name"], "p_soname": f["Patronymic"],
                "p_lastname": f["Surname"], "p_birthday": _strtodate(f["BirthDate"]), "p_birthplace": f["BirthAddress"],
                "p_sex": 2 if f["Gender"] == "Qadın" else 1, "p_address": f["RegistrationAddress"],
                "p_paspdate": _strtodate(f["GivenDate"]), "p_passexpire": f["ExpireDate"],
                "p_fam_status": 2 if f["MaritalStatus"] == "Subay" else 1, "p_paspplace": f["GivenOrganization"],
                "p_citizenship": f["Citizenship"], "p_work_place": "", "p_work_post": "", "p_monthlyprofit": ""}
        except AsanMsg as e:
            fail(e)
        cid = ws.conn.call_func("asan_transaction", "add_cust", [], rettype=int, named=named)   # no commit (as Delphi)
        return {"cust_id": cid}

    return r
