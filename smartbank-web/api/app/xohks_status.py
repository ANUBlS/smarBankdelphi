"""XÖHKS step 3a - OUT accept actions and the status chain (Packages/LVPCSSManager_Turan).

Ported: LVPCSSImpl.pas Mt102AcceptExecute :2343 (+ AcceptTransUnit.pas TFormAcceptTransaction for status msFileCreated),
MessagesOutAcceptExecute :2496, BtnSendToArchiveClick :2942, ToolButton39Click :3623 'Verifikator' (+ Verifying.pas TVerify),
ToolButton38Click :3677 'Avtorizator', ToolButton23Click :3720 'Geri qaytar', PopupMT102Popup :2784, Data_Unit.pas
XS_BATCHSAfterScroll :299 / XS_BENEFICIARYAfterScroll :326 (button enabling, returned as `enable`).
ToolButton20Click 'F.Verifikator' :3603 is ported in the API only - its button is Visible = False in LVPCSSImpl.dfm:845.
Status constants Data_Unit.pas:276-286. Commit timing as Delphi: only Mt102Accept commits (SBSession.Commit :2385); every
other call here is a plain Ins.CallProcedure without a commit (pending until the next Commit / Rollback of the session).
"""
from __future__ import annotations

import math

from fastapi import APIRouter, Depends
from pydantic import BaseModel

from . import xohks as X
from . import xohks_edit as E
from .db.base import DBError
from .delphi import float_to_str

msDefault, msCommit, msReject, msFileCreated, msVerifikator, msFVerifikator, msAvtorizator, msReturnBack = 0, 1, 2, 3, 4, 5, 6, 7
NO_RIGHT = "xohks.err_return_right"        # 'Bu statuslu əməliyyatı geri qaytarmaq hüququnuz yoxdur!...'


def _out(ws, bid=None, **k):
    d = X._batchs(ws.conn, X._st(ws))
    if bid is not None:
        d["rows"] = E._benefs(ws, bid)
        d["locate"] = int(bid)            # DataMod.XS_BATCHS.Locate('ID',ID,[])
    return {**d, **k}


def enable(batch: dict | None, benef: dict | None) -> dict:
    """XS_BATCHSAfterScroll / XS_BENEFICIARYAfterScroll / PopupMT102Popup. Delphi is case-insensitive: N4 (popup Accept) is
    first set by AfterScroll (status = msDefault) and overwritten by PopupMT102Popup when the popup opens
    (status in [msDefault, msFileCreated])."""
    bs = None if batch is None else int(batch.get("status") or 0)
    return {
        "AcceptButton": bs == msDefault, "ToolButton9": bs == msDefault, "N19": bs == msDefault, "N2": bs == msDefault,
        "N4": bs in (msDefault, msFileCreated),
        "ToolButton4": benef is not None and int(benef.get("status") or 0) == msDefault,
        "MenuItem1": benef is not None and bs == msDefault, "MenuItem2": benef is not None and bs == msDefault,
        "MenuItem4": benef is not None and bs == msDefault,
    }


# ------------------------------------------------------------------------------------------- Modifikator (Mt102Accept)
def batch_accept(ws, bid: int) -> dict:
    """Mt102AcceptExecute :2343. Status msFileCreated opens TFormAcceptTransaction first (returned as `accept_form`;
    the client then posts /batch/accept-form)."""
    E._check(ws.conn, "XOHKS_COMMIT")
    b = E._batch(ws, bid)
    if int(b["status"] or 0) not in (msDefault, msFileCreated):
        return _out(ws, bid)                                           # exit
    if int(b["status"]) == msFileCreated:
        X._st(ws)["accept_form"] = int(bid)
        return {"accept_form": {"CheckBox1": True, "CheckBox2": True, "GroupBox1": True, "Edit_Referens": b.get("trans_ref") or ""}}
    return _accept_tail(ws, bid)


def _accept_tail(ws, bid):
    conn = ws.conn
    msg = None
    if E._func(conn, "xs_Batchs_ChangeStatus", [int(bid), 1]) == 1:
        E._proc(conn, "SetBatchsTransaction", [int(bid)])
        conn.commit()                                                  # sboapiDataModule.SBSession.Commit
    else:
        msg = "xohks.err_benef_not_accepted"   # 'Batch-də olan bütün messajların düzgünlüyü təsdiq olunmalıdır !'
    return _out(ws, bid, warning=msg)


class AcceptForm(BaseModel):
    ok: bool                       # SpeedButton1 'Qəbul' (True) / SpeedButton2 'Imtina' (False)
    CheckBox1: bool = True         # 'Əməliyyat aparılsın'
    CheckBox2: bool = True         # 'Qeydiyyat № : (dəyişdirilsin)'
    Edit_Referens: str = ""


def accept_form_ref(ws) -> dict:
    """SpeedButton3Click: Edit_Referens := GetReference.GetNewBatchRefrence(0)."""
    return {"Edit_Referens": E._func(ws.conn, "GetNewBatchRefrence", [0], str)}


def accept_form(ws, f: AcceptForm) -> dict:
    """TFormAcceptTransaction.SpeedButton1Click / SpeedButton2Click, then the rest of Mt102AcceptExecute
    (`if not AcceptTransForCreated then Exit`)."""
    s = X._st(ws)
    bid = s.get("accept_form")
    if bid is None:
        raise X.XsError("xohks.err_no_record")
    if not f.ok:
        s.pop("accept_form", None)
        return _out(ws, bid)
    b = E._batch(ws, bid)
    ref = "".join(ch for ch in f.Edit_Referens if ch.isascii() and ch.isalnum())   # Edit_ReferensKeyPress filter
    if f.CheckBox2:
        if ref == (b.get("trans_ref") or ""):
            raise X.XsError("xohks.err_ref_same")      # 'New Reference must be different of current reference !'
        if ref.strip() == "":
            raise X.XsError("xohks.err_ref_empty")     # 'Please enter Reference !'
        E._proc(ws.conn, "UpdateBatchReference", [int(bid), ref])
    s.pop("accept_form", None)
    if not f.CheckBox1:
        E._func(ws.conn, "xs_Batchs_ChangeStatus", [int(bid), 1])
        return _out(ws, bid)                           # AcceptTransForCreated stays False -> Exit
    return _accept_tail(ws, bid)


# ------------------------------------------------------------------------------------------- beneficiaries 'Düzgündür'
def benef_accept(ws, bid: int, ids: list[int]) -> dict:
    """MessagesOutAcceptExecute :2496 - exit when no beneficiary, current one not status 0 or batch status 2; then
    xs_beneficiary_ChangeStatus(ID,1) for every selected row (no commit, no right check)."""
    b = E._batch(ws, bid)
    rows = E._benefs(ws, bid)
    cur = next((r for r in rows if ids and int(r["id"]) == int(ids[-1])), None)
    if not rows or cur is None or int(cur["status"] or 0) != 0 or int(b["status"] or 0) == msReject:
        return _out(ws, bid)
    ok = {int(r["id"]) for r in rows}
    for i in dict.fromkeys(int(x) for x in ids):
        if i in ok:
            E._proc(ws.conn, "xs_beneficiary_ChangeStatus", [i, 1])
    return _out(ws, bid)


def send_to_archive(ws) -> dict:
    """BtnSendToArchiveClick :2942: PackTemp.SendToArchive, ShowMessage('Messajlar arxivə göndərildi'); no refresh."""
    E._proc(ws.conn, "SendToArchive", [])
    return {"message": "xohks.msg_archived"}


# ------------------------------------------------------------------------------------------- verifikator / avtorizator
def fverify(ws, bid: int) -> dict:
    """ToolButton20Click :3603 (button hidden in the dfm)."""
    E._check(ws.conn, "FVERIFIKATOR")
    b = E._batch(ws, bid)
    if int(b["status"] or 0) == 1 and int(b.get("filial") or 0) > 0:
        E._proc(ws.conn, "xs_Batchs_FVerifStatus", [int(bid)])
        E._proc(ws.conn, "xs_beneficiary_FVerifStatus", [int(bid)])
    return _out(ws, bid)


def _verify_edit2(amount) -> str:
    """Tverify.FormCreate: a := StrToFloat(DBEdit1 without ','); Frac(a)<>0 -> text as is, else FloatToStr(Int(a))."""
    a = float(amount or 0)
    if a - math.trunc(a) != 0:
        return float_to_str(a).replace(",", "")
    return float_to_str(float(math.trunc(a)))


def verify_open(ws, bid: int) -> dict:
    """ToolButton39Click :3650: right VERIFIKATOR; status 1 or 8 -> TVerify.ShowModal (else exit)."""
    E._check(ws.conn, "VERIFIKATOR")
    b = E._batch(ws, bid)
    if int(b["status"] or 0) not in (1, 8):
        return _out(ws, bid)
    X._st(ws)["verify"] = {"id": int(bid), "edit2": _verify_edit2(b.get("amount"))}
    return {"verify": {"DBEdit4": int(bid), "DBEdit1": float_to_str(float(b.get("amount") or 0))}}


def verify_confirm(ws, edit1: str | None) -> dict:
    """Tverify.Button1Click (edit1 = the typed amount, edit2 from FormCreate; equal -> xs_Batchs_VerifStatus +
    xs_beneficiary_VerifStatus, else xs_batchs_error); edit1 None = Button2 'Çıx'. Then the sums of ToolButton39Click."""
    s = X._st(ws)
    v = s.pop("verify", None)
    if v is None:
        raise X.XsError("xohks.err_no_record")
    bid = v["id"]
    if edit1 is None:
        return _out(ws, bid)
    b = E._batch(ws, bid)
    if int(b["status"] or 0) in (1, 8):
        if edit1 == v["edit2"]:
            E._proc(ws.conn, "xs_Batchs_VerifStatus", [str(bid)])          # [dbedit4.Text]
            E._proc(ws.conn, "xs_beneficiary_VerifStatus", [str(bid)])
            return _out(ws, bid, verified=True)
        E._proc(ws.conn, "xs_batchs_error", [str(bid)])
        return _out(ws, bid, verified=False)
    return _out(ws, bid)


def authorize(ws, bid: int) -> dict:
    """ToolButton38Click :3677: AVTORIZATOR; for SWIFT TURAAZ22 the amount-band rights; status 4 -> (filial>0:
    setbatchsAVTOtransaction) xs_Batchs_AvtStatus, xs_beneficiary_AvtStatus."""
    conn = ws.conn
    E._check(conn, "AVTORIZATOR")
    b = E._batch(ws, bid)
    if (E._bankinfo(conn).get("swift") or "") == "TURAAZ22":
        a = float(b.get("amount") or 0)
        if a <= 10000:
            E._check(conn, "XOHKS_CREATEFILE1000")
        if 10000 < a <= 40000:
            E._check(conn, "XOHKS_CREATEFILE10000")
        if 40000 < a <= 100000:
            E._check(conn, "XOHKS_CREATEFILE40000")
        if a >= 100000:                                # 100000 itself needs both 40000 and 100000 rights (as Delphi)
            E._check(conn, "XOHKS_CREATEFILE100000")
    if int(b["status"] or 0) != msVerifikator:
        return _out(ws, bid)
    if int(b.get("filial") or 0) > 0:
        E._proc(conn, "setbatchsAVTOtransaction", [int(bid)])
    E._proc(conn, "xs_Batchs_AvtStatus", [int(bid)])
    E._proc(conn, "xs_beneficiary_AvtStatus", [int(bid)])
    return _out(ws, bid)


def _try(conn, right) -> bool:
    try:
        conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", [right], commit=False)
        return True
    except DBError:
        return False


def return_back(ws, bid: int, cur_benef_id: int | None) -> dict:
    """ToolButton23Click :3720 'Geri qaytar' (the later commented-out block is not ported). Compares the batch status with
    the CURRENT beneficiary's status (xs_beneficiary.fieldbyname('status'))."""
    conn = ws.conn
    E._check(conn, "RETURNBACK")
    b = E._batch(ws, bid)
    rows = E._benefs(ws, bid)
    cur = next((r for r in rows if cur_benef_id is not None and int(r["id"]) == int(cur_benef_id)), rows[0] if rows else None)
    bs, ns = int(b["status"] or 0), (int(cur["status"] or 0) if cur else 0)   # empty dataset: AsInteger = 0
    i = int(bid)

    def ret(to, deltrans):
        if deltrans:
            E._proc(conn, "xs_batchs_deletetrans", [i])
        E._proc(conn, "xs_Batchs_ReturnChangeStatus", [i, to])
        E._proc(conn, "xs_beneficiary_ReturnStatus", [i, to])
        return _out(ws, bid)

    if bs == 4 and ns == 4:
        if not _try(conn, "AVTORIZATOR"):
            return _out(ws, bid, warning=NO_RIGHT)
        return ret(7, False)
    if bs == 8 and ns == 8:
        return ret(0, True)
    if bs == 7 and ns == 7:
        if not _try(conn, "VERIFIKATOR"):
            return _out(ws, bid, warning=NO_RIGHT)
        return ret(0, True)
    if bs == 1 and ns == 1:
        if not _try(conn, "VERIFIKATOR"):
            return _out(ws, bid, warning=NO_RIGHT)
        return ret(0, True)
    return _out(ws, bid)


# ------------------------------------------------------------------------------------------- API
class BidIn(BaseModel):
    id: int
    benef_id: int | None = None


class BenAccIn(BaseModel):
    batch_id: int
    ids: list[int]


class VerifyIn(BaseModel):
    edit1: str | None = None


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

    @r.post("/batch/accept")
    def _ba(b: BidIn, ws=Depends(g)):
        return G(batch_accept, ws, b.id)

    @r.post("/batch/accept-form")
    def _baf(b: AcceptForm, ws=Depends(g)):
        return G(accept_form, ws, b)

    @r.post("/batch/accept-form/ref")
    def _bafr(ws=Depends(g)):
        return G(accept_form_ref, ws)

    @r.post("/benef/accept")
    def _bna(b: BenAccIn, ws=Depends(g)):
        if not X._st(ws).get("benef", True):
            err(403, "error.access_denied")
        return G(benef_accept, ws, b.batch_id, b.ids)

    @r.post("/archive/send")
    def _as(ws=Depends(g)):
        return G(send_to_archive, ws)

    @r.post("/batch/fverify")
    def _fv(b: BidIn, ws=Depends(g)):
        return G(fverify, ws, b.id)

    @r.post("/batch/verify")
    def _vo(b: BidIn, ws=Depends(g)):
        return G(verify_open, ws, b.id)

    @r.post("/batch/verify/confirm")
    def _vc(b: VerifyIn, ws=Depends(g)):
        return G(verify_confirm, ws, b.edit1)

    @r.post("/batch/authorize")
    def _au(b: BidIn, ws=Depends(g)):
        return G(authorize, ws, b.id)

    @r.post("/batch/return")
    def _rt(b: BidIn, ws=Depends(g)):
        return G(return_back, ws, b.id, b.benef_id)

    return r
