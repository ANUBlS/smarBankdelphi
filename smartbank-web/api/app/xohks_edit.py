"""XÖHKS step 2 - OUT batch / beneficiary add, edit, delete and templates (Packages/LVPCSSManager_Turan).

Ported units: LVPCSSImpl.pas (Mt102InsertExecute :2635, Mt102EditExecute :2799, MT102DeleteExecute :2245, MessagesOutAddExecute
:2404, MessagesOutEditExecute :2477, MessOutDeleteExecute :2280, PrepareTrans :1164, ShowDetals :1283, ViewBankInfo :1141,
StrPart :970), Transaction_Unit.pas (TTransForm: CheckField, FindFilialID, Button_addClick, ButtonPostClick, EditidKeyPress,
AccSearchClick, SpeedButton1Click, Rb205/RB_102/RB_102T, FormClose), Payment_Det.pas (TPaymentDetalsForm: CheckField,
Button4Click, ButtonFinishClick, Combo_BankNameChange, SpeedButton2Click, Button1Click, Button5Click, RB_102TClick,
RB_102Click), Get_to_shablon_unit.pas, add_new_shablon.pas, Data_Unit.pas ODS_*AfterScroll.

The two modal forms are server-side state (ws.module_state['xohks']['tx'] / ['pd']) so the Delphi variables (new_id,
after_add, MT, mess_edit, Batchs_Edit, bnf_count, the current DataAccountIban record, edit8, the radio buttons) behave as in
the OCX. Commit timing is Delphi's: XS_CONTROL calls run with commit=False and SBSession.Commit / Rollback are issued exactly
where the Delphi code issues them (TTransForm.FormClose always rolls back; ButtonPost commits before its ChangeStatus, which
the following close then rolls back - kept).
"""
from __future__ import annotations

from fastapi import APIRouter, Depends
from pydantic import BaseModel

from . import xohks as X
from . import xohks_sql as Q
from .customers import row
from .db.base import DBError
from .delphi import float_to_str, subst

PKG = "XS_CONTROL"     # Data_Unit.dfm: Ins / Del / GetReference / PackTemp all have PackageName = 'XS_CONTROL'
MSG_INCOMPLETE = "xohks.err_incomplete"          # 'Məlumat Tam deyil !'
FMT = {"RB_102": "MT102", "RB_102T": "MT102T", "MT205": "MT205"}
EDIT8 = {"RB_102": "CREDIT", "RB_102T": "TREZ", "MT205": "CREDIT"}   # RB_102Click / RB_102TClick / Rb205Click


def _q(conn, lines, binds=None):
    return [row(r) for r in conn.query(Q.text(lines), binds or {})]


def _proc(conn, name, args):
    conn.call_proc(PKG, name, args, commit=False)


def _func(conn, name, args, typ=int):
    return conn.call_func(PKG, name, args, typ)


def _check(conn, right):
    """DataMod.SB_ACA.CallProcedure('CheckAdvancedObjectAccess',[right]) - not in try: the exception aborts the action."""
    try:
        conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", [right], commit=False)
    except DBError as e:
        raise X.XsError("error.access_denied", ora=str(e))


def str_part(s: str, find: str, nom: int) -> str:
    """TLVPCSSForm.StrPart :970 (copy(S,0,strpos) / Pos semantics; no separator -> '')."""
    if len(s) == 0:
        return ""
    tmp = ""
    for _ in range(nom):
        p = s.find(find) + 1
        tmp = s[:p] if p > 0 else ""
        s = s[p:] if p > 0 else s
    return tmp.replace(find, "")


def _batch(ws, bid):
    s = X._st(ws)
    for b in X._batchs(ws.conn, s)["batchs"]:
        if int(b["id"]) == int(bid):
            return b
    raise X.XsError("xohks.err_no_record")


def _benefs(ws, bid):
    return X.beneficiary(ws.conn, int(bid))


def _bankinfo(conn):
    r = _q(conn, Q.LINES_BANKINFO)
    return r[0] if r else {}


def _config(conn):
    r = _q(conn, Q.LINES_XS_CONFIG)
    return r[0] if r else {}


def view_bank_info(conn, filial: bool, fil_id: int) -> dict:
    """ViewBankInfo :1141 (TransForm sender bank edits)."""
    bi, cfg = _bankinfo(conn), _config(conn)
    if filial:
        f = _q(conn, Q.LINES_FILIALINFO, {"kod": int(fil_id)})
        f = f[0] if f else {}
        code, voen = f.get("kod_bfil"), f.get("inn_fil")
    else:
        code, voen = bi.get("kod_b"), bi.get("inn")
    return {"bank_code": "" if code is None else float_to_str(code) if isinstance(code, (int, float)) else str(code),
            "voen": voen or "", "sender": (bi.get("swift") or "") + "AXXX", "bik": bi.get("swift") or "",
            "account": bi.get("krno") or "", "account_sub": cfg.get("account") or ""}


def _iban(conn, line11, custid):
    L = list(Q.LINES_DATAACCOUNTIBAN)
    L[11] = line11
    return [row(r) for r in conn.query(Q.text(L), {"custid": custid})]


def _valutes(conn):
    return _q(conn, Q.LINES_VALUTE_COMBO)


def _filial(conn, acc) -> tuple[int, str]:
    """FindFilialID (Transaction_Unit.pas): DataAccountIban.Filial > 0 -> DataSetFilial name, else 'MƏRKƏZİ OFİS'."""
    f = int((acc or {}).get("filial") or 0)
    if f > 0:
        r = _q(conn, Q.LINES_DATASETFILIAL, {"filialID": f})
        r = r[0] if r else {}
        return int(r.get("id") or 0), "Filial - " + (r.get("name") or "")
    return 0, '"MƏRKƏZİ OFİS"'


def _acc_fill(conn, acc) -> dict:
    """AccSearchClick: name, voen ('/' when INN is NULL), filial label, ViewBankInfo(filial>0, id)."""
    fid, label = _filial(conn, acc)
    return {"acc_id": acc["id"], "client_name": acc.get("name") or "",
            "client_voen": "/" if acc.get("inn") is None else str(acc["inn"]), "filial_label": label,
            "bank": view_bank_info(conn, fid > 0, fid)}


def _st(ws):
    return X._st(ws)


# ======================================================================================== TTransForm (batch)
def _prepare(ws, edit_bid=None) -> dict:
    """PrepareTrans(BnfCount, EditBeneficiary) :1164."""
    conn, s = ws.conn, _st(ws)
    vals = _valutes(conn)
    tx = {"new_id": None, "batchs_edit": False, "post_enabled": False, "radio": "RB_102", "edit8": "CREDIT",
          "acc": None, "accounts": [], "amount": 0.0, "bnf": "/BNF/0", "ref": "", "client_code": "/", "client_name": "",
          "client_voen": "", "kli_id": "", "valute": vals[0]["valute"] if vals else 0, "add_enabled": True,
          "ref_enabled": True, "date": None, "filial_label": ""}
    s["pd_bnf_count"] = 0
    if edit_bid is not None:
        b = _batch(ws, edit_bid)
        bens = _benefs(ws, edit_bid)
        accs = _iban(conn, Q.IBAN_LINE11_ID, int(b.get("acc_id") or 0))
        tx.update(acc=accs[0] if accs else None, accounts=accs, kli_id=str(accs[0]["kli_id"]) if accs else "",
                  client_name=b.get("client_name") or "", client_code=b.get("client_code") or "",
                  amount=float(b.get("amount") or 0), bnf="/BNF/" + str(len(bens)), client_voen=b.get("client_inn") or "",
                  ref=b.get("trans_ref") or "", add_enabled=False, batchs_edit=True, new_id=int(b["id"]),
                  date=str(b.get("transdate") or "")[:10], batch_status=int(b.get("status") or 0))
        # Batchs_Edit := false when XS_BATCHS.status > 0 and the current XS_BENEFICIARY.status > 0 (first record)
        if int(b.get("status") or 0) > 0 and bens and int(bens[0].get("status") or 0) > 0:
            tx.update(batchs_edit=False, ref_enabled=False)
    tx["bank"] = view_bank_info(conn, False, 0)
    s["tx"] = tx
    return tx


def _tx_out(ws) -> dict:
    tx = _st(ws)["tx"]
    return {**{k: v for k, v in tx.items() if k != "acc"}, "valutes": _valutes(ws.conn),
            "acc_no": (tx["acc"] or {}).get("acc_no", ""), "amount_text": float_to_str(tx["amount"])}


def _tx(ws):
    tx = _st(ws).get("tx")
    if not tx:
        raise X.XsError("xohks.err_no_form")
    return tx


def tx_new(ws) -> dict:
    """Mt102InsertExecute :2635: right XOHKS_ADD, PrepareTrans(0,false), XS_BATCHS_insert('CREDIT',0,name,code,ref,amount,
    valute,0) with the cleared edits - BEFORE the form is shown, no commit -, then TransForm.ShowModal; FormActivate ->
    SpeedButton1Click (GetNewBatchRefrence)."""
    conn = ws.conn
    _check(conn, "XOHKS_ADD")
    tx = _prepare(ws)
    from .xohks_file import build_tree
    build_tree(ws)                                                   # createTransCodeTree :2640
    _st(ws).update(after_add=False, MT=True, mess_edit=False)
    tx["new_id"] = _func(conn, "XS_BATCHS_insert", ["CREDIT", 0, tx["client_name"], tx["client_code"], tx["ref"],
                                                    float(0), float(tx["valute"]), 0])
    tx_ref(ws)
    return _tx_out(ws)


def tx_edit(ws, bid: int) -> dict:
    """Mt102EditExecute :2799: right XOHKS_EDIT, exit when no record, PrepareTrans(0,true), ShowModal (+ FormActivate ref)."""
    _check(ws.conn, "XOHKS_EDIT")
    _prepare(ws, bid)
    tx_ref(ws)
    return _tx_out(ws)


def tx_ref(ws) -> dict:
    """SpeedButton1Click: Edit_Referens := GetReference.GetNewBatchRefrence(valute). Edit_ReferensChange enables ButtonPost
    when MT205 is checked or Batchs_Edit."""
    tx = _tx(ws)
    if tx.get("ref_enabled", True):
        tx["ref"] = _func(ws.conn, "GetNewBatchRefrence", [int(tx["valute"])], str)
        if tx["radio"] == "MT205" or tx["batchs_edit"]:
            tx["post_enabled"] = True
    return _tx_out(ws)


def tx_customer(ws, kli_id: str) -> dict:
    """EditidKeyPress (#13): digits only, DataAccountIban SQL[11] 'AND (a.kli_id=:custid)'; none -> 'Müştəri tapılmadı'."""
    tx = _tx(ws)
    if not kli_id.isdigit():
        raise X.XsError("xohks.err_digits")
    accs = _iban(ws.conn, Q.IBAN_LINE11_KLI, int(kli_id))
    tx.update(kli_id=kli_id, accounts=accs, acc=accs[0] if accs else None, client_name="", client_voen="")
    if not accs:
        raise X.XsError("xohks.err_no_customer")
    return _tx_out(ws)


def tx_account(ws, acc_id: int) -> dict:
    """AccSearchClick: picks the DataAccountIban record; Batchs_Edit -> ButtonPost enabled."""
    tx = _tx(ws)
    acc = next((a for a in tx["accounts"] if int(a["id"]) == int(acc_id)), None)
    if acc is None:
        raise X.XsError("xohks.err_lookup")
    f = _acc_fill(ws.conn, acc)
    tx.update(acc=acc, client_name=f["client_name"], client_voen=f["client_voen"], filial_label=f["filial_label"], bank=f["bank"])
    if tx["batchs_edit"]:
        tx["post_enabled"] = True
    return _tx_out(ws)


class TxFields(BaseModel):
    client_name: str | None = None
    client_code: str | None = None
    client_voen: str | None = None
    ref: str | None = None
    valute: int | None = None
    radio: str | None = None


def _apply(tx, f: TxFields | None):
    if not f:
        return
    for k in ("client_name", "client_code", "client_voen", "ref", "valute"):
        v = getattr(f, k)
        if v is not None:
            tx[k] = v
    if f.radio is not None:
        if f.radio not in FMT:
            raise X.XsError("xohks.err_lookup")
        tx["radio"], tx["edit8"] = f.radio, EDIT8[f.radio]


def _tx_checkfield(ws, tx, all_: bool) -> bool:
    """Transaction_Unit.pas CheckField: account text (spaces removed) must exist in ACCOUNT, voen / name not empty;
    all -> Edit_Amount.Text <> '0'."""
    acc_no = ((tx["acc"] or {}).get("acc_no") or "").replace(" ", "")
    found = _q(ws.conn, Q.LINES_DATACHECK_ACC, {"acc": acc_no}) if acc_no else []
    ok = not (acc_no.strip() == "" or tx["client_voen"] == "" or tx["client_name"].strip() == "" or not found)
    if all_ and float_to_str(tx["amount"]) == "0":
        ok = False
    return ok


def _valute_ok(tx) -> bool:
    """Valute_ID.Items[Combo_valute.ItemIndex] <> DataAccountIban.val_acc -> 'Bu hesab seçilmiş valyutaya uygun deyil !'."""
    return tx["acc"] is not None and str(tx["valute"]) == float_to_str((tx["acc"] or {}).get("val_acc"))


def tx_post(ws, f: TxFields | None) -> dict:
    """ButtonPostClick (Transaction_Unit.pas)."""
    conn, s = ws.conn, _st(ws)
    tx = _tx(ws)
    _apply(tx, f)
    if not tx["post_enabled"]:
        raise X.XsError("xohks.err_disabled")
    if tx["radio"] != "MT205":
        if not _tx_checkfield(ws, tx, True) or tx["ref"].strip() == "":
            raise X.XsError(MSG_INCOMPLETE)
    if not _valute_ok(tx):
        raise X.XsError("xohks.err_valute")
    if tx["bnf"] != "/BNF/0":
        if tx["batchs_edit"]:
            b = _batch(ws, tx["new_id"])
            if tx["ref"] == (b.get("trans_ref") or "") and int(b.get("status") or 0) != 0:
                raise X.XsError("xohks.err_ref_change")     # 'Qeydiyyat №-si dəyişilməlidir!'
        fid, _ = _filial(conn, tx["acc"])
        _proc(conn, "xs_Batchs_update", [tx["new_id"], tx["edit8"], int(tx["acc"]["id"]), tx["client_name"], tx["client_code"],
                                         tx["ref"], float(tx["amount"]), float(tx["valute"]), fid, tx["client_voen"],
                                         FMT[tx["radio"]]])
        conn.commit()                                         # sboapiDataModule.SBSession.Commit
        if tx["batchs_edit"]:
            _func(conn, "xs_Batchs_ChangeStatus", [tx["new_id"], 0])
    bid = tx["new_id"]
    tx_close(ws)                                              # close -> FormClose -> Rollback
    return {"located": bid, **X._batchs(conn, s)}


def tx_close(ws) -> dict:
    """Button2Click / Esc / FormClose: sboapiDataModule.SBSession.Rollback."""
    ws.conn.rollback()
    _st(ws).pop("tx", None)
    _st(ws).update(after_add=False, mess_edit=False, MT=True)
    return X._batchs(ws.conn, _st(ws))


# ======================================================================================== TPaymentDetalsForm
def _banks(conn):
    return _q(conn, Q.LINES_BANKM_COMBO)


def _empty_pd(ws, valute=0) -> dict:
    conn = ws.conn
    bi = _bankinfo(conn)
    tx = _st(ws).get("tx") or {}
    return {"bank_id": None, "bank_code": "", "bank_account": "", "bank_voen": "", "bik": "", "account_sub": "", "ref": "",
            "amount": "0", "trans_code": "900", "client_name": "", "client_code": "/", "client_acc_no": "", "client_voen": "",
            "tey": ["", "", "", ""], "inf": ["", "", ""], "valute": valute, "radio": tx.get("radio", "RB_102"),
            "self": {"bank": bi.get("bank") or "", "bik": bi.get("swift") or "",
                     "code": "" if bi.get("kod_b") is None else float_to_str(bi.get("kod_b")),
                     "account": bi.get("krno") or "", "voen": bi.get("inn") or "",
                     "account_sub": (tx.get("bank") or {}).get("account_sub", "")},
            "locked": False, "finish_enabled": True, "add_visible": True, "template_saved_enabled": True}


def _pd(ws):
    pd = _st(ws).get("pd")
    if not pd:
        raise X.XsError("xohks.err_no_form")
    return pd


def _pd_out(ws):
    return {**_pd(ws), "banks": _banks(ws.conn), "valutes": _valutes(ws.conn),
            "tx": _tx_out(ws) if _st(ws).get("tx") else None}


def pd_ref(ws) -> dict:
    """SpeedButton2Click: Button1.Enabled := true; Edit_Referens := INS.GetNewBeneficiaryReference."""
    pd = _pd(ws)
    pd["template_saved_enabled"] = True
    pd["ref"] = _func(ws.conn, "GetNewBeneficiaryReference", [], str)
    return _pd_out(ws)


def pd_open_from_tx(ws, f: TxFields | None) -> dict:
    """TTransForm.Button_addClick: CheckField(false), valute check, clear the PaymentDetals edits (Edit_TransCode '900'),
    ShowModal (FormActivate -> SpeedButton2 new reference; RB_102T checked -> RB_102TClick)."""
    tx = _tx(ws)
    _apply(tx, f)
    if not tx["add_enabled"]:
        raise X.XsError("xohks.err_disabled")
    if not _tx_checkfield(ws, tx, False):
        raise X.XsError(MSG_INCOMPLETE)
    if not _valute_ok(tx):
        raise X.XsError("xohks.err_valute")
    s = _st(ws)
    s["pd"] = _empty_pd(ws, tx["valute"])
    s["pd"].update(mode="tx", radio=tx["radio"])
    if tx["radio"] == "RB_102T":
        _rb102t(ws)
    return pd_ref(ws)


def pd_open_add(ws, bid: int) -> dict:
    """MessagesOutAddExecute :2404: right XOHKS_ADD, exit when no batch, PrepareTrans(1,false), new_id = current batch,
    After_Add := true, cleared edits, Combo_Valute.ItemIndex := 0, ShowModal (FormActivate: new reference, '900')."""
    conn, s = ws.conn, _st(ws)
    _check(conn, "XOHKS_ADD")
    _batch(ws, bid)
    tx = _prepare(ws)
    tx["new_id"] = int(bid)
    s["pd_bnf_count"] = 1
    s.update(after_add=True)
    vals = _valutes(conn)
    s["pd"] = _empty_pd(ws, vals[0]["valute"] if vals else 0)
    s["pd"].update(mode="add", standalone=True)
    return pd_ref(ws)


def pd_open_edit(ws, bid: int, ben_id: int) -> dict:
    """MessagesOutEditExecute :2477: right XOHKS_EDIT, exit when no beneficiary, ShowDetals :1283, ButtonFinish disabled,
    RB_102T -> RB_102 checked. ShowDetals locks the form when (batch.status > 0 and benef.status > 0) or TRANSACTION_ID > 0."""
    conn, s = ws.conn, _st(ws)
    _check(conn, "XOHKS_EDIT")
    b = _batch(ws, bid)
    ben = next((x for x in _benefs(ws, bid) if int(x["id"]) == int(ben_id)), None)
    if ben is None:
        raise X.XsError("xohks.err_no_record")
    pd = _empty_pd(ws, ben.get("val_cod") or 0)
    pd.update(mode="edit", standalone=True, ben_id=int(ben_id), batch_id=int(bid), bank_id=ben.get("rec_bank_id"),
              ref=ben.get("mess_reference") or "", amount=float_to_str(ben.get("amount")),
              trans_code=str(ben.get("trans_cod") or ""), client_acc_no=ben.get("client_acc_no") or "",
              client_name=ben.get("client_name") or "", client_code=ben.get("client_code") or "",
              client_voen=ben.get("client_inn") or "", ben_status=int(ben.get("status") or 0),
              tey=[str_part(ben.get("remit_inf") or "", "|", i) for i in (1, 2, 3, 4)],
              inf=[str_part(ben.get("add_inf") or "", "|", i) for i in (1, 2, 3)],
              add_visible=False, finish_enabled=False, radio="RB_102")
    s.update(pd=pd, mess_edit=True)
    s.setdefault("tx", None)
    if pd["bank_id"] is not None:
        _bank_fill(ws, pd["bank_id"], keep_sub=False)
    pd["account_sub"] = ben.get("rec_bank_sub_acc") or ""
    pd["self"]["account_sub"] = _config(conn).get("account") or ""
    if (int(b.get("status") or 0) > 0 and pd["ben_status"] > 0) or int(ben.get("transaction_id") or 0) > 0:
        pd.update(locked=True, finish_enabled=False)
    return _pd_out(ws)


def _bank_fill(ws, bank_id, keep_sub=False):
    """Combo_BankNameChange: DataBankM.Locate('ID', ...) -> BankCode, KRNO, INN, SWIFT, SUBKRNO."""
    pd = _pd(ws)
    bm = next((x for x in _q(ws.conn, Q.LINES_BANKM_COMBO) if str(x["id"]) == str(bank_id)), None)
    if bm is None:
        raise X.XsError("xohks.err_lookup")
    pd.update(bank_id=bm["id"], bank_code="" if bm.get("bankcode") is None else float_to_str(bm.get("bankcode")),
              bank_account=bm.get("krno") or "", bank_voen=bm.get("inn") or "", bik=bm.get("swift") or "",
              account_sub=bm.get("subkrno") or "")


def pd_bank(ws, bank_id) -> dict:
    pd = _pd(ws)
    if pd["locked"] or pd["radio"] == "RB_102T":       # Combo_BankName.Enabled := false
        raise X.XsError("xohks.err_disabled")
    _pd_apply(ws, PdFields(bank_id=bank_id))
    return _pd_out(ws)


def _rb102t(ws):
    """RB_102TClick: DataBankM filtered on BANKCODE=210005 (Combo_BankNameChange), client edits cleared and disabled,
    ODS_Institution / ODS_BudgetLevel / ODS_Destination opened (their AfterScroll fills the edits)."""
    pd = _pd(ws)
    pd.update(tey=["", "", "", ""], client_name="", client_code="", client_voen="", client_acc_no="")
    bm = next((x for x in _q(ws.conn, Q.LINES_BANKM_COMBO) if float_to_str(x.get("bankcode")) == "210005"), None)
    if bm:
        _bank_fill(ws, bm["id"])


def lookups_102t(conn) -> dict:
    return {"institution": _q(conn, Q.LINES_ODS_INSTITUTION), "budgetlevel": _q(conn, Q.LINES_ODS_BUDGETLEVEL),
            "destination": _q(conn, Q.LINES_ODS_DESTINATION)}


class PdFields(BaseModel):
    bank_id: int | None = None
    account_sub: str | None = None
    client_acc_no: str | None = None
    client_name: str | None = None
    client_code: str | None = None
    client_voen: str | None = None
    tey: list[str] | None = None
    inf: list[str] | None = None
    trans_code: str | None = None
    valute: int | None = None
    ref: str | None = None
    amount: str | None = None
    institution: str | None = None      # MT102 T: ODS_Institution.ID (AfterScroll fills the client edits)
    budgetlevel: str | None = None      # ODS_BudgetLevel.ID -> Edit_tey1
    destination: str | None = None      # ODS_Destination.ID -> Edit_tey2


_WATCH = ("bank_code", "bank_account", "bank_voen", "bik", "account_sub", "ref", "amount", "trans_code", "client_name",
          "client_code", "client_voen", "tey", "inf", "valute")     # edits with an OnChange that enables ButtonFinish


def _pd_apply(ws, f: PdFields | None):
    """Copies the edits. With mess_edit, Edit_ReferensChange / Edit_Client_NameChange / Edit_BankName_SelfChange enable
    ButtonFinish when any of those edits changes (Edit_Client_acc_no has no OnChange)."""
    pd = _pd(ws)
    if not f or pd["locked"]:
        return pd
    before = {k: pd[k] if not isinstance(pd[k], list) else list(pd[k]) for k in _WATCH}
    _pd_apply2(ws, pd, f)
    if _st(ws).get("mess_edit") and any(before[k] != pd[k] for k in _WATCH):
        pd["finish_enabled"] = True
    return pd


def _pd_apply2(ws, pd, f):
    if f.bank_id is not None and pd["radio"] != "RB_102T":
        _bank_fill(ws, f.bank_id)
    for k in ("account_sub", "client_acc_no", "client_name", "client_code", "client_voen", "trans_code", "valute", "ref",
              "amount"):
        v = getattr(f, k)
        if v is not None and not (pd["radio"] == "RB_102T" and k.startswith("client_")):
            pd[k] = v
    if f.tey is not None:
        pd["tey"] = (list(f.tey) + ["", "", "", ""])[:4]
        pd["tey"][0] = pd["tey"][0].upper()          # Edit_tey1Change / Edit_tey2Change: Edit_tey1 := AnsiUpperCase
    if f.inf is not None:
        pd["inf"] = (list(f.inf) + ["", "", ""])[:3]
    if pd["radio"] == "RB_102T":
        lk = lookups_102t(ws.conn)
        if f.institution is not None:
            i = next((x for x in lk["institution"] if str(x["id"]) == f.institution), None)
            if i is None:
                raise X.XsError("xohks.err_lookup")
            pd.update(client_acc_no=str(i["id"]), client_name=i.get("name") or "", client_code="/" + str(i.get("bosh") or ""),
                      client_voen=str(i.get("tek") or ""))
        if f.budgetlevel is not None:
            if f.budgetlevel not in [str(x["id"]) for x in lk["budgetlevel"]]:
                raise X.XsError("xohks.err_lookup")
            pd["tey"][0] = f.budgetlevel
        if f.destination is not None:
            d = next((x for x in lk["destination"] if str(x["id"]) == f.destination), None)
            if d is None:
                raise X.XsError("xohks.err_lookup")
            pd["tey"][1] = str(int(d["id"]))


def _num(t) -> float:
    try:
        return float(str(t).replace(",", "") or 0)
    except ValueError:
        raise X.XsError("xohks.err_number")


_FIRST_OK = set("0123456789ABCDEFGHJKLMNOPQRSTUVWXYZƏÜÖĞŞÇİI")


def pd_checkfield(ws, pd) -> None:
    """Payment_Det.pas CheckField: required edits + first character of each non-empty tey / inf edit ('Məlumat düzgün deyil !')."""
    if (pd["ref"].strip() == "" or _num(pd["amount"]) == 0 or pd["trans_code"].strip() == "" or pd["bank_id"] is None
            or pd["bank_code"].strip() == "" or pd["bank_account"].strip() == "" or pd["bank_voen"].strip() == ""
            or pd["account_sub"].strip() == "" or pd["bik"].strip() == "" or pd["client_acc_no"].strip() == ""
            or pd["client_name"].strip() == "" or pd["client_voen"].strip() == "" or pd["tey"][0].strip() == ""):
        raise X.XsError(MSG_INCOMPLETE)
    for t in pd["tey"] + pd["inf"]:
        if t != "" and t[0] not in _FIRST_OK:
            raise X.XsError("xohks.err_invalid")


def _iban_checks(ws, pd):
    """ButtonFinishClick: length 28 ('Hesabın uzunluğu düzgün deyil!!!!!!'), SBOP.check_IBAN_acc_num = 0 ('Hesab ibana
    uyğun deyil!!!!!!'), VÖEN length 10 or '/' ('Voen-nin uzunluğu düzgün deyil!!!!!!')."""
    if len(pd["client_acc_no"]) != 28:
        raise X.XsError("xohks.err_acc_len")
    if int(ws.conn.call_func("SBOP", "check_IBAN_acc_num", [pd["client_acc_no"]], int) or 0) == 0:
        raise X.XsError("xohks.err_iban")
    if len(pd["client_voen"]) != 10 and pd["client_voen"] != "/":
        raise X.XsError("xohks.err_voen_len")


def _benef_args(pd, first):
    return [first, float(pd["bank_id"]), pd["account_sub"], pd["client_acc_no"], pd["client_name"], pd["client_code"],
            pd["client_voen"], "|".join(pd["tey"]) + "|", float(_num(pd["trans_code"])), "|".join(pd["inf"]) + "|",
            float(pd["valute"]), pd["ref"], _num(pd["amount"])]


def pd_add(ws, f: PdFields | None) -> dict:
    """Button4Click 'Əlavə et': CheckField, bnf_count+1, xs_beneficiary_insert(new_id, ...). After_Add (MessagesOutAdd):
    Commit, then xs_BatchAmount_update + xs_Batchs_ChangeStatus(0) (not committed). Otherwise TransForm Edit_BNF :=
    '\\BNF\\'+count, Edit_Amount += amount. Edits cleared, new reference (SpeedButton2), TransCode '900', ButtonPost enabled."""
    conn, s = ws.conn, _st(ws)
    pd = _pd_apply(ws, f)
    if not pd["add_visible"]:
        raise X.XsError("xohks.err_disabled")
    pd_checkfield(ws, pd)
    tx = s.get("tx") or {}
    s["pd_bnf_count"] = int(s.get("pd_bnf_count") or 0) + 1
    _proc(conn, "xs_beneficiary_insert", _benef_args(pd, tx["new_id"]) + [s["pd_bnf_count"]])
    if s.get("after_add"):
        conn.commit()
        _proc(conn, "xs_BatchAmount_update", [tx["new_id"]])
        _func(conn, "xs_Batchs_ChangeStatus", [tx["new_id"], 0])
    else:
        tx["bnf"] = "\\BNF\\" + str(s["pd_bnf_count"])
        tx["amount"] = float(tx["amount"]) + _num(pd["amount"])
    keep = {k: pd[k] for k in ("mode", "self", "radio", "standalone") if k in pd}
    s["pd"] = {**_empty_pd(ws, pd["valute"]), **keep}
    s["pd"]["client_code"] = "/"
    if s.get("MT") and s["pd"]["radio"] == "RB_102T":       # if MT then If RB_102T.Checked then RB_102.Checked:=true
        s["pd"]["radio"] = "RB_102"
    tx["post_enabled"] = True
    pd_ref(ws)
    s["pd"]["trans_code"] = "900"
    return {**_pd_out(ws), "added": True}


def pd_finish(ws, f: PdFields | None) -> dict:
    """ButtonFinishClick 'SON' / 'Yaddaşa yaz' (Payment_Det.pas). Edit_TransCode := '900' first, MT := false."""
    conn, s = ws.conn, _st(ws)
    pd = _pd_apply(ws, f)
    if not pd["finish_enabled"]:
        raise X.XsError("xohks.err_disabled")
    pd["trans_code"] = "900"
    s["MT"] = False
    if pd["radio"] != "MT205":
        if s.get("mess_edit"):
            _iban_checks(ws, pd)
            fmt = FMT.get(pd["radio"])
            pd_checkfield(ws, pd)
            ben = next((x for x in _benefs(ws, pd["batch_id"]) if int(x["id"]) == pd["ben_id"]), {})
            if int(ben.get("status") or 0) == 2:
                return {"closed": False, **_pd_out(ws)}
            _proc(conn, "xs_Beneficiary_update", _benef_args(pd, pd["ben_id"]) + [int(s.get("pd_bnf_count") or 0)])
            conn.commit()
            bid = pd["batch_id"]
            _proc(conn, "xs_BatchAmount_update", [bid])
            _proc(conn, "xs_format_update", [bid, fmt])
            _proc(conn, "xs_beneficiary_ChangeStatus", [pd["ben_id"], 0])
            _func(conn, "xs_Batchs_ChangeStatus", [bid, 0])
        else:
            pd_checkfield(ws, pd)
            _iban_checks(ws, pd)
            pd_add(ws, None)
        return {"closed": True, **pd_close(ws)}
    # MT205: xs_batchs205(Edit_Amount, Edit_Referens), Commit, TransForm amount += , close both, RefreshDataBatchs
    _proc(conn, "xs_batchs205", [_num(pd["amount"]), pd["ref"]])
    conn.commit()
    tx = s.get("tx")
    if tx:
        tx["amount"] = float(tx["amount"]) + _num(pd["amount"])
    pd_close(ws)
    out = tx_close(ws)
    return {"closed": True, "tx_closed": True, **out}


def pd_close(ws) -> dict:
    """FormClose: after_add := false, mess_edit := false, MT := true (no rollback here)."""
    s = _st(ws)
    pd = s.pop("pd", None) or {}
    if pd.get("standalone"):                 # MessagesOutAdd / MessagesOutEdit: no TransForm is shown
        s.pop("tx", None)
    s.update(after_add=False, mess_edit=False, MT=True)
    res = {"tx": _tx_out(ws) if s.get("tx") else None}
    if not s.get("tx"):
        res.update(X._batchs(ws.conn, s))
    return res


# ======================================================================================== templates
def shablon_list(conn, field: str | None = None) -> list[dict]:
    """Button5Click: ODS_shablon close / open; GridReadyBatchsTitleClick: order by Column.FieldName (grid fields only)."""
    if field is None:
        return _q(conn, Q.LINES_ODS_SHABLON)
    if field.upper() not in Q.SHABLON_FIELDS:
        raise X.XsError("xohks.err_lookup")
    return [row(r) for r in conn.query(subst(Q.text(Q.LINES_ODS_SHABLON_SORT), "Field", field.upper()))]


def shablon_save(ws, f: PdFields | None) -> dict:
    """Button1Click 'Şablon kimi saxla': Button1 disabled, insert_shablon[1..17] -> xs_Beneficiary_shablon_insert (no commit),
    'Melumat yadda saxlanildi!'. [1] = amount text without ',' ; [3] = Combo_BankName.Text ; [16] = Edit_BankCode ;
    [17] = TransForm client name."""
    pd = _pd_apply(ws, f)
    if not pd["template_saved_enabled"]:
        raise X.XsError("xohks.err_disabled")
    pd["template_saved_enabled"] = False
    bank = next((x["name"] for x in _banks(ws.conn) if str(x["id"]) == str(pd["bank_id"])), "")
    tx = _st(ws).get("tx") or {}
    v = [str(pd["amount"]).strip().replace(",", ""), pd["trans_code"], bank, pd["client_acc_no"], pd["client_name"],
         pd["client_code"], pd["client_voen"], *pd["tey"], *pd["inf"], pd["ref"], pd["bank_code"],
         (tx.get("client_name") or "").strip()]
    _proc(ws.conn, "xs_Beneficiary_shablon_insert", v)
    return {"saved": True, **_pd_out(ws)}


def shablon_pick(ws, name: str) -> dict:
    """GridReadyBatchsDblClick: Fields[0..13] into the edits (bank by Combo_BankName.Items.IndexOf(Fields[2]) +
    Combo_BankNameChange), SpeedButton2Click (new reference), Button1 enabled."""
    pd = _pd(ws)
    r = next((x for x in shablon_list(ws.conn) if x.get("shablonun_adi") == name), None)
    if r is None:
        raise X.XsError("xohks.err_no_record")
    pd.update(amount=r.get("mebleg") or "", trans_code=r.get("odenish_kod") or "", client_acc_no=r.get("hesab_no") or "",
              client_name=r.get("adi") or "", client_code=r.get("kodu") or "", client_voen=r.get("voen") or "",
              tey=[r.get(k) or "" for k in ("od_tey1", "od_tey2", "od_tey3", "od_tey4")],
              inf=[r.get(k) or "" for k in ("elave_mel1", "elave_mel2", "elave_mel3")])
    bm = next((x for x in _banks(ws.conn) if x.get("name") == r.get("bankin_kodu")), None)
    if bm:
        _bank_fill(ws, bm["id"])
    else:
        pd["bank_id"] = None
    return pd_ref(ws)


def shablon_delete(ws, name: str) -> list[dict]:
    """Button2Click 'Sil': xs_Beneficiary_shablon_delete(Fields[14] = shablonun_adi), ODS_shablon.Refresh (no confirm)."""
    _proc(ws.conn, "xs_Beneficiary_shablon_delete", [name])
    return shablon_list(ws.conn)


# ======================================================================================== delete
def delete_batchs(ws, ids: list[int]) -> dict:
    """MT102DeleteExecute :2245 (one call per confirmed record; 'Hamısı' sends every selected id in one call):
    right XOHKS_DELETE, DEL.xs_batchs_delete(ID) (no commit), RefreshDataBatchs."""
    _check(ws.conn, "XOHKS_DELETE")
    for i in ids:
        _proc(ws.conn, "xs_batchs_delete", [int(i)])
    return X._batchs(ws.conn, _st(ws))


def delete_benefs(ws, bid: int, ids: list[int]) -> dict:
    """MessOutDeleteExecute :2280: DEL.xs_beneficiary_delete(ID) per record, then INS.xs_BatchAmount_update(batch) and
    xs_Batchs_ChangeStatus(batch, 0) (no commit), RefreshDataBatchs."""
    _check(ws.conn, "XOHKS_DELETE")
    for i in ids:
        _proc(ws.conn, "xs_beneficiary_delete", [int(i)])
    _proc(ws.conn, "xs_BatchAmount_update", [int(bid)])
    _func(ws.conn, "xs_Batchs_ChangeStatus", [int(bid), 0])
    return {**X._batchs(ws.conn, _st(ws)), "rows": _benefs(ws, bid)}


# ======================================================================================== API
class IdIn(BaseModel):
    id: int


class CustIn(BaseModel):
    kli_id: str


class AccIn(BaseModel):
    acc_id: int


class TxIn(BaseModel):
    fields: TxFields | None = None


class BenEditIn(BaseModel):
    batch_id: int
    id: int


class BankIn(BaseModel):
    bank_id: int


class PdIn(BaseModel):
    fields: PdFields | None = None


class IdsIn(BaseModel):
    ids: list[int]
    batch_id: int | None = None


class NameIn(BaseModel):
    name: str


class FieldIn(BaseModel):
    field: str | None = None


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

    def benef_ok(ws):
        if not X._st(ws).get("benef", True):
            err(403, "error.access_denied")

    @r.post("/tx/new")
    def _txn(ws=Depends(g)):
        return G(tx_new, ws)

    @r.post("/tx/edit")
    def _txe(b: IdIn, ws=Depends(g)):
        return G(tx_edit, ws, b.id)

    @r.post("/tx/ref")
    def _txr(b: TxIn, ws=Depends(g)):
        return G(lambda w: (_apply(_tx(w), b.fields), tx_ref(w))[1], ws)

    @r.post("/tx/customer")
    def _txc(b: CustIn, ws=Depends(g)):
        return G(tx_customer, ws, b.kli_id)

    @r.post("/tx/account")
    def _txa(b: AccIn, ws=Depends(g)):
        return G(tx_account, ws, b.acc_id)

    @r.post("/tx/post")
    def _txp(b: TxIn, ws=Depends(g)):
        return G(tx_post, ws, b.fields)

    @r.post("/tx/close")
    def _txx(ws=Depends(g)):
        return G(tx_close, ws)

    @r.post("/pd/open-tx")
    def _pdo(b: TxIn, ws=Depends(g)):
        benef_ok(ws)
        return G(pd_open_from_tx, ws, b.fields)

    @r.post("/pd/open-add")
    def _pda(b: IdIn, ws=Depends(g)):
        benef_ok(ws)
        return G(pd_open_add, ws, b.id)

    @r.post("/pd/open-edit")
    def _pde(b: BenEditIn, ws=Depends(g)):
        benef_ok(ws)
        return G(pd_open_edit, ws, b.batch_id, b.id)

    @r.post("/pd/bank")
    def _pdb(b: BankIn, ws=Depends(g)):
        return G(pd_bank, ws, b.bank_id)

    @r.post("/pd/ref")
    def _pdr(ws=Depends(g)):
        return G(pd_ref, ws)

    @r.post("/pd/add")
    def _pdad(b: PdIn, ws=Depends(g)):
        return G(pd_add, ws, b.fields)

    @r.post("/pd/finish")
    def _pdf(b: PdIn, ws=Depends(g)):
        return G(pd_finish, ws, b.fields)

    @r.post("/pd/close")
    def _pdc(ws=Depends(g)):
        return G(pd_close, ws)

    @r.get("/pd/lookups-102t")
    def _pdl(ws=Depends(g)):
        return lookups_102t(ws.conn)

    @r.post("/shablon/list")
    def _shl(b: FieldIn, ws=Depends(g)):
        return G(lambda w: {"rows": shablon_list(w.conn, b.field)}, ws)

    @r.post("/shablon/save")
    def _shs(b: PdIn, ws=Depends(g)):
        return G(shablon_save, ws, b.fields)

    @r.post("/shablon/pick")
    def _shp(b: NameIn, ws=Depends(g)):
        return G(shablon_pick, ws, b.name)

    @r.post("/shablon/delete")
    def _shd(b: NameIn, ws=Depends(g)):
        return G(lambda w: {"rows": shablon_delete(w, b.name)}, ws)

    @r.post("/batch/delete")
    def _bd(b: IdsIn, ws=Depends(g)):
        return G(delete_batchs, ws, b.ids)

    @r.post("/benef/delete")
    def _bnd(b: IdsIn, ws=Depends(g)):
        benef_ok(ws)
        return G(delete_benefs, ws, b.batch_id or 0, b.ids)

    return r
