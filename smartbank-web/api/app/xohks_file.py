"""XÖHKS step 3b - TTransCodeForm tree, PrepareFile (TPrepareFile_Form) and 'Gedən fayl' (TSendFileForm).

Ported: LVPCSSImpl.pas createTransCodeTree :1114 (built in Mt102InsertExecute :2640 only), TransTypeUnit.pas (But_OkClick,
TreeView1Changing, DblClick), Payment_Det.pas SpeedButton1Click :205; ToolButton11Click :2105 'Faylı Hazırla' ->
PrepareFile_Unit.pas (SpeedButton1Click, But_tosend / All_to_send / But_noSend / All_to_Nosend, GridReadyBatchsTitleClick,
Button_fileClick -> CreateFile, FormClose, Edit_referenceKeyPress); ToolButton5Click :2135 'Gedən fayl' -> FileSend_Unit.pas
(RefDate, BitBtn1Click, DBGrid1DblClick).
Not ported: CreateBatchFile / but_batchClick (but_batch Visible = False, PrepareFile_Unit.dfm:882).
Signing: cryptounit.SetSign is never called (commented out in CreateFile) -> xohks_crypto.get_signer() is not used by
CreateFile either; it is the plug-in point for a later signed format.

The file: Delphi wrote out_dir\<reference>.xml on the operator PC (Writeln = CRLF, UnicodeString lines in the Windows ANSI
code page, the UTF8String MessageBody written as raw UTF-8 bytes with #10 line breaks). The web returns it for download
and, when XOHKS_OUT_DIR is set, also writes a copy there (same convention as AZIPS_OUT_DIR).
"""
from __future__ import annotations

import base64
import datetime as dt
import os
from decimal import ROUND_HALF_UP, Decimal

from fastapi import APIRouter, Depends
from pydantic import BaseModel

from . import xohks as X
from . import xohks_edit as E
from . import xohks_sql as Q
from .customers import row
from .delphi import float_to_str, subst

CODEPAGE = os.getenv("XOHKS_FILE_CODEPAGE", "cp1254")
OUT_DIR = os.getenv("XOHKS_OUT_DIR", "")
READY_SORT = {"№": "id", "Debet": "ACC_NO", "Debet Məbləğ": "AMOUNT", "Tarix": "TRANSDATE"}
REF_CHARS = set("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ/-:().,'+{} ")


def _raw(conn, lines, binds=None, **repl):
    return conn.query(Q.text(lines, **repl), binds or {})


def _s(v) -> str:                     # TField.AsString
    if v is None:
        return ""
    if isinstance(v, float):
        return float_to_str(v)
    return str(v)


def _f(v) -> float:                   # TField.AsFloat
    return float(v or 0)


# ============================================================================================ TTransCodeForm
def build_tree(ws) -> None:
    """createTransCodeTree :1114. Parent nodes ImageIndex 0 / SelectedIndex 1, children ImageIndex 2 with StateIndex = CODE.
    Items.Add(GetFirstNode, ...) appends a sibling at the end of the top level, so the order is TransTypeName's 'order by id'."""
    conn = ws.conn
    tree = []
    for n in _raw(conn, Q.LINES_TRANSTYPENAME):
        kids = [{"text": _s(c.get("NAME")), "image": 2, "state": int(c.get("CODE") or 0)}
                for c in _raw(conn, Q.LINES_TRANSTYPECODE, {"ID": n.get("ID")})]
        tree.append({"text": _s(n.get("NAME")), "image": 0, "children": kids})
    X._st(ws)["tc_tree"] = tree


def tree(ws) -> dict:
    """Payment_Det SpeedButton1Click: typecode 0, all nodes collapsed, ShowModal. The tree is whatever the last Mt102Insert
    built in this form (empty when no 'Yeni' was pressed since the module opened - as in Delphi)."""
    return {"tree": X._st(ws).get("tc_tree", [])}


def tree_ok(ws, node: dict | None) -> dict:
    """But_OkClick / DblClick: only when the selected node is a child (typecode = ImageIndex = 2) Edit_TransCode :=
    StateIndex and close; otherwise the form stays open."""
    if not node or int(node.get("image", -1)) != 2:
        return {"closed": False}
    pd = X._st(ws).get("pd")
    code = str(int(node.get("state") or 0))
    if pd is not None:
        pd["trans_code"] = code
    return {"closed": True, "trans_code": code}


# ============================================================================================ TPrepareFile_Form
def change_decimal(r: float) -> str:
    """ChangeDecimal: formatfloat('##0.00') with ',' (DecimalSeparator replaced by ',')."""
    d = Decimal(repr(float(r))).quantize(Decimal("0.01"), rounding=ROUND_HALF_UP)
    return f"{d:.2f}".replace(".", ",")


def set_string_length(s: str, n: int, add: str) -> str:
    for _ in range(len(s), n):
        s = add + s
    return s


def _pf(ws):
    p = X._st(ws).get("pf")
    if p is None:
        raise X.XsError("xohks.err_pf_closed")
    return p


def _lists(ws) -> dict:
    conn, p = ws.conn, _pf(ws)
    title = X._st(ws).get("pf_title", Q.TITLE_READY_DEFAULT)
    ready = [row(r) for r in conn.query(subst(Q.text(Q.LINES_READYBATCHS), "Title", title), {})]
    sending = [row(r) for r in _raw(conn, Q.LINES_SENDINGBATCHS)]
    p["ready"], p["sending"] = ready, sending
    return {"pf": {k: p[k] for k in ("Edit_sender", "Edit_receiver", "Edit_reference", "Edit_count", "CurrencyEdit1", "Edit1")},
            "ready": ready, "sending": sending, "title": title}


def pf_open(ws) -> dict:
    """ToolButton11Click :2105: right XOHKS_CREATEFILE (not in try), Edit_sender = BankInfo.SWIFT+'AXXX', reference cleared,
    count '0', amount 0, receiver = XS_CONFIG.NB_SWIFT, Convert_pack.BatchToReadyBatchs(0,1), ReadyBatchs / SendingBatchs."""
    conn = ws.conn
    E._check(conn, "XOHKS_CREATEFILE")
    bi = X._one(conn, Q.LINES_BANKINFO)
    cfg = X._one(conn, Q.LINES_XS_CONFIG)
    X._st(ws)["pf"] = {"Edit_sender": _s(bi.get("SWIFT")) + "AXXX", "Edit_reference": "", "Edit_count": "0",
                       "CurrencyEdit1": 0.0, "Edit_receiver": _s(cfg.get("NB_SWIFT")), "Edit1": "150",
                       "amount_limit": _f(cfg.get("AMOUNT_LIMIT"))}
    E._proc(conn, "BatchToReadyBatchs", [0, 1])
    return _lists(ws)


def _amount_count(ws):
    p = _pf(ws)
    p["CurrencyEdit1"] = float(ws.conn.call_func(E.PKG, "GetBatchAmount", [], float) or 0)
    out = _lists(ws)
    p["Edit_count"] = str(len(p["sending"]))
    out["pf"]["Edit_count"], out["pf"]["CurrencyEdit1"] = p["Edit_count"], p["CurrencyEdit1"]
    return out


def _fmt_amt(v):
    """formatfloat('##,##.00', v) (thousands ' ' as in the az-AZ locale is not assumed: ',' grouping, '.' decimals)."""
    return f"{Decimal(repr(float(v))).quantize(Decimal('0.01'), rounding=ROUND_HALF_UP):,.2f}"


def _limit_check(ws, cur):
    """But_tosendClick / All_to_sendClick: the CURRENT ReadyBatchs record against XS_CONFIG.amount_limit, then RecordCount = 0."""
    p = _pf(ws)
    if cur is not None and _f(cur.get("amount")) > p["amount_limit"]:
        return {"warning": "xohks.err_limit", "amount": _fmt_amt(cur["amount"]), "limit": _fmt_amt(p["amount_limit"])}
    if not p.get("ready"):
        return {"warning": "xohks.err_no_ready"}          # 'Təsdiq olunmuş "Batch" yoxdur !'
    return None


def _cur(rows, rid):
    if not rows:
        return None
    return next((r for r in rows if r.get("id") == rid), rows[0]) if rid is not None else rows[0]


def pf_tosend(ws, rid, all_: bool) -> dict:
    p = _pf(ws)
    cur = _cur(p.get("ready"), rid)
    w = _limit_check(ws, cur)
    if w:
        return {**_lists(ws), **w}
    E._proc(ws.conn, "BatchToSendingBatchs", [0, 1] if all_ else [int(cur["id"]), 0])
    return _amount_count(ws)


def pf_nosend(ws, rid, all_: bool) -> dict:
    p = _pf(ws)
    if not p.get("sending"):
        return _lists(ws)                                 # exit
    cur = _cur(p["sending"], rid)
    E._proc(ws.conn, "BatchToReadyBatchs", [0, 1] if all_ else [int(cur["id"]), 0])
    return _amount_count(ws)


def pf_sort(ws, caption: str) -> dict:
    """GridReadyBatchsTitleClick: ReadyBatchs.SetVariable('Title', field) (otSubst), Refresh; other captions exit."""
    if caption not in READY_SORT:
        return _lists(ws)
    X._st(ws)["pf_title"] = READY_SORT[caption]
    return _lists(ws)


def pf_ref(ws) -> dict:
    """SpeedButton1Click: if SendingBatchs.RecordCount > 0 then Edit_Reference := INS.GetNewFileReference."""
    p = _pf(ws)
    if p.get("sending"):
        p["Edit_reference"] = ws.conn.call_func(E.PKG, "GetNewFileReference", [], str) or ""
    return {"Edit_reference": p["Edit_reference"]}


def _body_lines(conn, p, sending) -> tuple[list[tuple[str, object]], list]:
    """CreateFile :152. Returns ('u', text) for Writeln/Write of UnicodeString (ANSI code page) and ('b', text) for the
    UTF8String MessageBody (raw UTF-8). Writeln adds CRLF; Write does not ('w')."""
    out = []
    W = lambda s: out.append(("u", s + "\r\n"))
    Wn = lambda s: out.append(("u", s))
    cfg = X._one(conn, Q.LINES_PF_CONFIG)                     # DataTemp 'Select * from xs_config'
    W("<SWIFT_msg_fields>")
    first = sending[0] if sending else {}
    if _s(first.get("FORMAT")) != "MT205":
        for s in ("<format>MT</format>", "<msg_format>S</msg_format>", "<msg_sub_format>I</msg_sub_format>",
                  "<msg_sender>" + p["Edit_sender"] + "</msg_sender>", "<msg_receiver>" + p["Edit_receiver"] + "</msg_receiver>",
                  "<msg_type>" + p["Edit1"] + "</msg_type>", "<msg_priority>N</msg_priority>", "<msg_del_notif_rq>N</msg_del_notif_rq> ",
                  "<msg_num_of_batches>" + p["Edit_count"] + "</msg_num_of_batches>",
                  "<msg_amount>" + change_decimal(p["CurrencyEdit1"]) + "</msg_amount>", "<msg_mac_result></msg_mac_result>",
                  "<msg_user_priority>0100</msg_user_priority>", "<msg_user_reference>" + p["Edit_reference"] + "</msg_user_reference>",
                  "<block4>"):
            W(s)
        # xs_batchs.Refresh (:239) on the local 'Select * From xs_sendingbatchs' dataset (see PARITY: unverified on a closed set)
        for b in _raw(conn, Q.LINES_PF_XS_BATCHS):
            W("<batch>")
            W("<msg_subtype>102</msg_subtype>")
            Wn("<body>")
            mb = []
            A = lambda s, nl=True: mb.append(s + ("\n" if nl else ""))
            A(":20:" + _s(b.get("TRANS_REF")))
            A(":23:" + _s(b.get("OPERCODE")))
            A(":50K:/" + _s(b.get("ACC_NO")))
            A(_s(b.get("CLIENT_NAME")))
            A(_s(b.get("CLIENT_INN")) + "/")
            br = X._one(conn, Q.LINES_PF_BRANCH, {"acc_id": _s(b.get("ACC_ID"))})
            bi = X._one(conn, Q.LINES_PF_BANKINFO_T, {"kod_fil": br.get("BRANCH")})
            swift = _s(bi.get("SWIFT"))
            A(_s(bi.get("KOD_B")) + "/" + _s(bi.get("INN")))
            A(set_string_length(_s(bi.get("KRNO")), 13, "0"))
            acc = X._one(conn, Q.LINES_PF_ACCOUNT)
            A(":52A:/D/" + _s(acc.get("ACCOUNT")))
            A(swift)
            cnt, sm, last = 0, 0.0, {}
            for m in _raw(conn, Q.LINES_PF_MESSAGES, {"batch_id": _s(b.get("ID"))}):
                last = m
                A(":21:" + _s(m.get("MESS_REFERENCE")))
                A(":32B:" + _s(m.get("VAL_NAME")) + change_decimal(_f(m.get("AMOUNT"))))
                A(":57A:/C/" + set_string_length(_s(m.get("REC_BANK_SUB_ACC")), 13, "0"))
                A(_s(X._one(conn, Q.LINES_PF_BANKM_SWIFT, {"id": _s(m.get("REC_BANK_ID"))}).get("SWIFT")))
                A(":59:/" + _s(m.get("CLIENT_ACC_NO")))
                A(_s(m.get("CLIENT_NAME")))
                A(_s(m.get("CLIENT_INN")) + "/")
                k = X._one(conn, Q.LINES_PF_BANKM_KRNO, {"id": _s(m.get("REC_BANK_ID"))})
                A(_s(k.get("BANKCODE")) + "/" + _s(k.get("INN")))
                A(set_string_length(_s(k.get("KRNO")), 13, "0"))
                for i in range(1, 5):
                    t = E.str_part(_s(m.get("REMIT_INF")), "|", i)
                    if t.strip():
                        A((":70:" if i == 1 else "") + t)
                A(":26T:" + _s(m.get("TRANS_COD")))
                for i in range(1, 4):
                    t = E.str_part(_s(m.get("ADD_INF")), "|", i)
                    if t.strip():
                        A((":77B:" if i == 1 else "") + t)
                cnt += 1
                sm += _f(m.get("AMOUNT"))
            vd = last.get("VAL_DATE")                     # at Eof the dataset stays on the last record; empty -> 30.12.1899
            vd = vd if isinstance(vd, (dt.datetime, dt.date)) else dt.datetime(1899, 12, 30)
            A(":32A:" + vd.strftime("%y%m%d") + _s(b.get("VAL_NAME")) + change_decimal(sm))
            A(":72:/BNF/" + str(cnt), False)
            out.append(("b", "".join(mb)))
            W("</body>")
            W("</batch>")
        W("</block4>")
    else:
        for s in ("<msg_format>S</msg_format>", "<msg_sub_format>I</msg_sub_format>",
                  "<msg_sender>" + p["Edit_sender"] + "</msg_sender>", "<msg_receiver>" + p["Edit_receiver"] + "</msg_receiver>",
                  "<msg_type>999</msg_type>", "<msg_priority>N</msg_priority>", "<msg_del_notif_rq>N</msg_del_notif_rq> ",
                  "<msg_user_priority>0099</msg_user_priority>", "<msg_user_reference/>", "<msg_copy_srv_id/>",
                  "<msg_fin_validation/>", "<msg_pde>N</msg_pde>", "<msg_mac_result></msg_mac_result>"):
            W(s)
        dcfg = X._one(conn, Q.LINES_XS_CONFIG)                # datamod.XS_CONFIG
        mb = ":20:" + _s(first.get("TRANS_REF")) + "\n" + ":79:/SETACCOUNTDEBITCAP/SESSION\n" + \
             "/ACCOUNT/" + _s(dcfg.get("ACCOUNT")) + "\n"
        Wn("<block4>" + mb)                                 # MessageBody is a UTF8String, the concatenation a UnicodeString
        a = _f(first.get("AMOUNT"))
        W("/AMOUNT/" + _s(first.get("AMOUNT")) + ("," if a == int(a) else "") + "</block4>")
    W("</SWIFT_msg_fields>")
    return out, cfg


def _encode(parts) -> bytes:
    return b"".join(t.encode("utf-8") if k == "b" else t.encode(CODEPAGE, errors="replace") for k, t in parts)


def pf_create(ws, rid=None) -> dict:
    """Button_fileClick :798: exit when SendingBatchs is empty; 'Qeydiyyat №-si verilməyib !' when the reference is blank;
    CreateFile; Convert_pack.xs_SentInfo_insert('S', sender, receiver, Edit1, 'N', 'N', 'C099', date, reference, 0)
    (no commit); edits cleared, lists refreshed, LVPCSSForm.RefreshDataBatchs."""
    conn, p = ws.conn, _pf(ws)
    if not p.get("sending"):
        return _lists(ws)
    if not p["Edit_reference"].strip():
        return {**_lists(ws), "warning": "xohks.err_no_file_ref"}
    sending = _raw(conn, Q.LINES_SENDINGBATCHS)
    parts, cfg = _body_lines(conn, p, sending)
    data = _encode(parts)
    name = p["Edit_reference"] + ".xml"
    delphi_path = _s(cfg.get("OUT_DIR")) + "\\" + name
    if OUT_DIR:
        os.makedirs(OUT_DIR, exist_ok=True)
        with open(os.path.join(OUT_DIR, os.path.basename(name.replace("\\", "/"))), "wb") as fh:
            fh.write(data)
    E._proc(conn, "xs_SentInfo_insert", ["S", p["Edit_sender"], p["Edit_receiver"], p["Edit1"], "N", "N", "C099",
                                         dt.datetime.combine(dt.date.today(), dt.time()), p["Edit_reference"], 0])
    p.update(Edit_reference="", Edit_count="0", CurrencyEdit1=0.0)
    out = _lists(ws)
    out["file"] = {"name": name, "delphi_path": delphi_path, "size": len(data), "b64": base64.b64encode(data).decode(),
                   "server_dir": OUT_DIR or None}
    out["batchs"] = X._batchs(conn, X._st(ws))["batchs"]       # LVPCSSForm.RefreshDataBatchs
    return out


def pf_close(ws) -> dict:
    """FormClose: ReadyBatchs / SendingBatchs closed (the Title variable is kept on the dataset)."""
    X._st(ws).pop("pf", None)
    return {"closed": True}


# ============================================================================================ TSendFileForm
def sent_list(ws, beg: dt.date, end: dt.date) -> dict:
    """ToolButton5Click / RefDate / BitBtn1Click: XS_SENTINFO between Trunc(DateTimePicker1/2)."""
    b = dt.datetime.combine(beg, dt.time())
    e = dt.datetime.combine(end, dt.time())
    rows = [row(r) for r in _raw(ws.conn, Q.LINES_SENTINFO, {"BeginDate": b, "EndDate": e})]
    return {"rows": rows}


def sent_open(ws, rec: dict | None) -> dict:
    """DBGrid1DblClick: out_dir\\ddmmyy(today)\\[Batches\\]<user_reference>.xml; FileExists -> ShellExecute open, else
    'File %s not found !'. The web looks for the same relative path under XOHKS_OUT_DIR. Note: CreateFile writes to out_dir\\
    (no date folder), so - as in Delphi - a file made by 'XML Faylını yarat' is normally not found here."""
    if not rec:
        return {}
    oc = X._one(ws.conn, Q.LINES_FORCHECK)
    sub = dt.date.today().strftime("%d%m%y")
    ref = _s(rec.get("user_reference"))
    rel = [sub] + (["Batches"] if int(rec.get("batchfile") or 0) != 0 else []) + [ref + ".xml"]
    full = os.path.join(OUT_DIR, *rel) if OUT_DIR else None
    delphi_path = "\\".join([_s(oc.get("OUT_DIR"))] + rel)
    if full and os.path.isfile(full):
        data = open(full, "rb").read()
        return {"file": {"name": ref + ".xml", "delphi_path": delphi_path, "b64": base64.b64encode(data).decode()}}
    return {"warning": "xohks.err_file_not_found", "file_name": ref + ".xml", "delphi_path": delphi_path}


# ============================================================================================ router
class NodeIn(BaseModel):
    node: dict | None = None


class PfIn(BaseModel):
    id: int | None = None
    all: bool = False
    caption: str | None = None


class SentIn(BaseModel):
    beg: dt.date | None = None
    end: dt.date | None = None
    rec: dict | None = None


class RefIn(BaseModel):
    ref: str = ""


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/xohks")
    g = require_module(X.CLSID)

    def G(fn, ws, *a):
        if not X._st(ws):
            X.open_form(ws)
        try:
            return fn(ws, *a)
        except X.XsError as e:
            err(400 if e.key != "error.access_denied" else 403, e.key, **e.extra)

    @r.get("/transcode/tree")
    def _tt(ws=Depends(g)):
        return G(tree, ws)

    @r.post("/transcode/ok")
    def _to(b: NodeIn, ws=Depends(g)):
        return G(tree_ok, ws, b.node)

    @r.post("/pf/open")
    def _po(ws=Depends(g)):
        return G(pf_open, ws)

    @r.post("/pf/tosend")
    def _pt(b: PfIn, ws=Depends(g)):
        return G(pf_tosend, ws, b.id, b.all)

    @r.post("/pf/nosend")
    def _pn(b: PfIn, ws=Depends(g)):
        return G(pf_nosend, ws, b.id, b.all)

    @r.post("/pf/sort")
    def _ps(b: PfIn, ws=Depends(g)):
        return G(pf_sort, ws, b.caption or "")

    @r.post("/pf/ref")
    def _pr(ws=Depends(g)):
        return G(pf_ref, ws)

    @r.post("/pf/set-ref")
    def _psr(b: RefIn, ws=Depends(g)):
        def f(ws):   # Edit_referenceKeyPress: other keys are dropped
            _pf(ws)["Edit_reference"] = "".join(c for c in b.ref if c in REF_CHARS)
            return {"Edit_reference": _pf(ws)["Edit_reference"]}
        return G(f, ws)

    @r.post("/pf/create")
    def _pc(ws=Depends(g)):
        return G(pf_create, ws)

    @r.post("/pf/close")
    def _pcl(ws=Depends(g)):
        return G(pf_close, ws)

    @r.post("/sent/list")
    def _sl(b: SentIn, ws=Depends(g)):
        t = dt.date.today()
        return G(sent_list, ws, b.beg or t, b.end or t)

    @r.post("/sent/open")
    def _so(b: SentIn, ws=Depends(g)):
        return G(sent_open, ws, b.rec)

    return r
