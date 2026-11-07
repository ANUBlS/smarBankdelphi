"""AZIPS part 2 - outgoing message editor / creation (Packages/SWIFT_MANAGER_IBAN_NEW).

Reachability in the Delphi module (SWIFT_MAINImpl1.dfm / .pas):
* OUT_FORM (OUT_MT.pas) "Yeni": action `Yeni` (:2847-2852, ShortCut 16462 = Ctrl+N) -> YeniExecute :2604-2608, and the hidden
  ToolButton15 'Swift' (:1102-1108, Visible=False) -> ToolButton15Click :7086-7093. Save = CreateMessageBeginExecute
  OUT_MT.pas:771-1266 -> sw_main.savetransaction (MT103) / sw_main.saving205 (others).
* MT103 (editmt103.pas) and MT103AZN (formmt103.pas): toolbar "Redakte et" ToolButton2Click :3530-3576 (right SW_OUT_EDIT;
  SENDERLT<>'103' goes to filereport.bpl 'Azipsnew' = Packages/Cards_New/FileReprt/Unitazips.pas, another package).
  Save = TOracleDataSet sw_out.Post (DOA: update by ROWID, CommitOnPost) after CreatMessageExecute editmt103.pas:970-1353 /
  Change1Click formmt103.pas:257-272; BeforePost Unit2.pas:1441-1444 sets M70.
* MT103Show (Editmt103Show.pas): Redakteet1Click :3578-3591 on the Committed grid, FINCOPY<>'AZN' (AZN opens Form7/Unit7,
  not part of this step). Read-only (all DB controls ReadOnly/Enabled=False, no save action).
* Edit_outExecute :3205-3528 is NOT connected: action Edit_out has OnExecute = Capet1Click (SWIFT_MAINImpl1.dfm:2871-2874).
  Its prefill mapping is ported (edit_out_prefill) for parity documentation only and is not exposed in the UI.
* createmess.pas (TForm5) is compiled but never created (no CreateForm, no TForm5.Create anywhere) - not ported.
"""
from __future__ import annotations
import datetime

from fastapi import Depends
from pydantic import BaseModel, Field

from . import azips_sql as Q
from .customers import row

MT_TYPES = ("MT103", "MT205")          # Unit2.dfm MT: COLUMN_NAME in ('MT103','MT205')
FINCOPY_ITEMS = ("", "AZN")            # OUT_MT.dfm fincopy Items
MF71A_ITEMS = ("OUR", "BEN", "SHA")    # CBox_MF71A Items
COMBOS = ("CMF50", "CMF52", "CMF53", "CMF54", "CMF55", "CMF56", "CMF57", "CMF59")
SHOW_ERR = "MF50 - Hesab nömrəsi düzgün deyil!"          # editmt103.pas:1101


class AzEditError(Exception):
    def __init__(self, key, **extra):
        super().__init__(key)
        self.key, self.extra = key, extra


# ------------------------------------------------------------------------------------------------ text helpers
def lines_of(text: str) -> list[str]:
    """TStrings.Text setter: split on CRLF / LF / CR."""
    t = (text or "").replace("\r\n", "\n").replace("\r", "\n")
    L = t.split("\n")
    if L and L[-1] == "" and t.endswith("\n"):
        L.pop()
    return L


def strings_text(lines: list[str]) -> str:
    return "".join(x + "\r\n" for x in lines)


def delphi_trim(s: str) -> str:
    """SysUtils.Trim: removes chars <= ' ' at both ends."""
    i, j = 0, len(s)
    while i < j and s[i] <= " ":
        i += 1
    while j > i and s[j - 1] <= " ":
        j -= 1
    return s[i:j]


def rich70(text: str) -> str:
    """GetRichEditLine OUT_MT.pas:326-356 (OnChange of OF70_RichEdit): join non-empty lines, re-split in 4 x 35."""
    s = "".join(x for x in lines_of(text) if delphi_trim(x) != "")
    A = [s[k:k + 35] for k in (0, 35, 70, 105)]
    return strings_text([a for a in A if a != ""])


def rich72(text: str) -> str:
    """GetRichEditLine2 OUT_MT.pas:357-410 (OnChange of OF72_RichEdit / RichEdit3): '/BNF/'+30, then '//'+33 x4, '//'+27.
    Line 0 drops its first 5 chars when it contains '/BNF/'; lines 1..5 drop 2 chars when they contain '//' (pos > 0)."""
    s = ""
    for i, x in enumerate(lines_of(text)[:6]):
        if delphi_trim(x) == "":
            continue
        if i == 0 and "/BNF/" in x:
            x = x[5:]
        elif i > 0 and "//" in x:
            x = x[2:]
        s += x
    A = []
    for pre, a, n in (("/BNF/", 1, 30), ("//", 31, 33), ("//", 64, 33), ("//", 97, 33), ("//", 130, 33), ("//", 163, 27)):
        c = s[a - 1:a - 1 + n]
        if c != "":
            A.append(pre + c)
    return strings_text(A)


def memo35(text: str) -> str:
    """Memo1_MF50KeyPress OUT_MT.pas:1393-1435 (and the copies for 52..59): UpCase, at most 4 lines of 35 chars."""
    L = [x.upper()[:35] for x in lines_of(text)][:4]
    return "\r\n".join(L)


def amount_ok(s: str) -> bool:
    """rKeyPress :2411 / edit11_mf32aKeyPress / DBEdit8KeyPress: only '0'..'9' and '.' (MaxLength 15 on OUT_FORM)."""
    return all(c in "0123456789." for c in s)


def str_to_float(s: str) -> float:
    """StrToFloat with '.' decimal separator; anything else raises EConvertError ('... is not a valid floating point value')."""
    try:
        if s.count(".") > 1 or s in ("", "."):
            raise ValueError
        return float(s)
    except ValueError:
        raise AzEditError("azips.err_float", value=s)


def date_to_str(d: datetime.date) -> str:
    """DateToStr(mf32_date.Date) with the Azerbaijani ShortDateFormat dd.mm.yyyy (host locale - see PARITY_AZIPS.md)."""
    return d.strftime("%d.%m.%Y")


# ------------------------------------------------------------------------------------------------ lookups
def bankinfo_swift(conn) -> str:
    r = conn.query(Q.text(Q.LINES_BANKINFO))
    return (r[0].get("SWIFT") if r else "") or ""


def mt_list(conn) -> list[str]:
    """FIN TDBViewComboBox on MT (Unit2.dfm MT), Sorted."""
    return sorted(str(x["COLUMN_NAME"]) for x in conn.query(Q.text(Q.LINES_MT)))


def valutes(conn) -> list[str]:
    """mf32a_val TDBViewComboBox on valute (Unit2.dfm valute: avalute where val_name<>'AZN')."""
    return [str(x["VAL_NAME"]) for x in conn.query(Q.text(Q.LINES_VALUTE))]


def bank(conn, bic: str) -> dict | None:
    """TSearchEdit on sw_banks/banks (SearchField BIC): found -> name/city/address/country, else the edit turns red."""
    for x in conn.query(Q.text(Q.LINES_BANKS)):
        if str(x.get("BIC") or "") == bic:
            return {"BIC": x.get("BIC"), "NAME": x.get("NAME") or "", "CITY": x.get("CITY") or "",
                    "ADDRESS": x.get("ADDRESS") or "", "COUNTRY": x.get("COUNTRY") or ""}
    return None


def tobic(conn, bic: str) -> dict:
    """Tobic (Unit2.dfm:4188-4190) - FormActivate of MT103 / MT103AZN fills the receiver box."""
    r = conn.query(Q.text(Q.LINES_TOBIC), {"dbs": bic})
    x = r[0] if r else {}
    return {k: x.get(k) or "" for k in ("NAME", "CITY", "ADDRESS", "COUNTRY")}


def account(conn, acc: str) -> bool:
    """TSearchEdit on Account_sw (SearchField acc_no): Account dataset 'where CLOSE_DAT is null'."""
    return any(str(x.get("ACC_NO")) == acc for x in conn.query(Q.text(Q.LINES_ACCOUNT)))


def accs_for_comission(conn, v_acc_no: str) -> list[dict]:
    """DS_AccsForComission: 'where kli_id=:v_acc_no' bound with the account text (as Delphi does)."""
    return [row(x) for x in conn.query(Q.text(Q.LINES_ACCS_FOR_COMISSION), {"v_acc_no": v_acc_no})]


def corr(conn, v: str, b: str) -> str:
    """mf32a_valChange OUT_MT.pas:2280-2286: CORR(:v valute name, :b receiver BIC) -> DBEdit1 CORACOUNT (first row)."""
    r = conn.query(Q.text(Q.LINES_CORR), {"v": v, "b": b})
    return str((r[0].get("CORACOUNT") if r else "") or "")


def cust_type(conn, acc: str):
    r = conn.query(Q.text(Q.LINES_CHK_ACCNO), {"acc_no": acc})
    return r[0].get("CUST_TYPE") if r else None


def referans(conn, fin: str, cur: str) -> str:
    """referans: select sw_main.Set_Referense(:FORMATS,:currensy). Delphi opens it once with old variables, sets
    them, Refresh, Close, Open (OUT_MT.pas:871-884) - the value read is the one from the last Open."""
    r = conn.query(Q.text(Q.LINES_REFERANS), {"FORMATS": fin, "currensy": cur})
    return str((r[0].get("REFE") if r else "") or "")


def check_fin(fin: str, fincopy: str):
    if fin not in MT_TYPES or fincopy not in FINCOPY_ITEMS:
        raise AzEditError("azips.err_type")


def combo_items(conn, fin: str, fincopy: str, combo: str) -> list[str]:
    """InsertComboBoxItems OUT_MT.pas:467-503 (OnEnter of an empty CMFxx / CMF50Click):
    ComboItems.SQL[1] := 'and '+fin+fincopy+' is not null'+' order by sw_field'; :comboname = component name;
    items = '' + CATEGORY of every row (Items[j+2] of a short list reads '' in a TComboBox, so every row is added)."""
    check_fin(fin, fincopy)
    if combo not in COMBOS:
        raise AzEditError("azips.err_field")
    sql = Q.text(Q.LINES_COMBOITEMS, i1="and " + fin + fincopy + " is not null" + " order by sw_field")
    return [""] + [str(x.get("CATEGORY") or "") for x in conn.query(sql, {"comboname": combo})]


def combo_panels(conn, combo: str, selected: str) -> dict:
    """CMF50Change OUT_MT.pas:654-709: panels of aftercomboselect (category<>selected) are hidden, panels of Comboselect
    (category=selected) shown; empty text -> '1'. aftercomboselect.SQL[2] is set but the dataset has only line 0 used."""
    if combo not in COMBOS:
        raise AzEditError("azips.err_field")
    sel = selected if selected != "" else "1"
    hide = [str(x.get("SW_FIELD")) for x in conn.query(Q.text(Q.LINES_AFTERCOMBOSELECT), {"name": combo, "selected": sel})]
    show = [str(x.get("SW_FIELD")) for x in conn.query(Q.text(Q.LINES_COMBOSELECT), {"name": combo, "selected": sel})]
    return {"hide": hide, "show": show[:1]}


def new_init(conn) -> dict:
    """OUT_FORM.FormActivate OUT_MT.pas:1298-1350 defaults."""
    sw = bankinfo_swift(conn)
    return {"senderlt": sw, "sendertype": "Institution", "ComboBox2": sw, "recivertype": "Institution",
            "Application": "FIN", "priority": "N", "monitoring": "N", "mf32_date": datetime.date.today().isoformat(),
            "fincopy": "AZN", "fin": (mt_list(conn) or [""])[0], "mf32a_val": "AZN", "mf32a_val_enabled": False,
            "MF23b_edit": "CRED", "Edit1_MF71A": "OUR", "mt_list": mt_list(conn), "valutes": valutes(conn),
            "MF71A": MF71A_ITEMS}


# ------------------------------------------------------------------------------------------------ OUT_FORM save
class NewMsg(BaseModel):
    """OUT_FORM controls (names as in OUT_MT.dfm). Combo indexes are ItemIndex; *_text the visible Text."""
    fin: str = Field(max_length=10)
    fincopy: str = Field(default="", max_length=3)
    reciverbic: str = Field(default="", max_length=11)
    Edit2: str = Field(default="", max_length=200)           # receiver bank name (reciverbicChange)
    Edit3: str = Field(default="", max_length=200)           # receiver city
    MF23b_edit: str = Field(default="CRED", max_length=4)
    MF26T_edit: str = Field(default="", max_length=3)
    mf32_date: datetime.date
    mf32a_val: str = Field(default="", max_length=3)
    Edit11_mf32a: str = Field(default="", max_length=15)
    MF33_edit: str = Field(default="", max_length=35)
    mf33_edit2: str = Field(default="", max_length=35)
    Edit1: str = Field(default="", max_length=35)             # MF36
    combos: dict[str, int] = {}                               # CMF50..CMF59 ItemIndex
    combo_text: dict[str, str] = {}                           # CMF50..CMF59 Text
    fields: dict[str, str] = {}                               # Edit1_MF50, Memo2_MF50, ... (OUT_MT.dfm names)
    OF70_RichEdit: str = Field(default="", max_length=400)
    OF72_RichEdit: str = Field(default="", max_length=400)
    MF77_memo: str = Field(default="", max_length=400)
    Edit1_MF71A: str = Field(default="OUR", max_length=3)


def _f(m: NewMsg, k: str) -> str:
    return str(m.fields.get(k, "") or "")


def create_message(conn, m: NewMsg) -> dict:
    """CreateMessageBeginExecute OUT_MT.pas:771-1266 (MtcreateClick :760-769 copies OF72 into MF72_memo first)."""
    check_fin(m.fin, m.fincopy)
    for k in m.fields:
        if len(k) > 20 or not k.replace("_", "").isalnum():
            raise AzEditError("azips.err_field")
    ci = lambda c: int(m.combos.get(c, 0 if m.combo_text.get(c) else -1))   # noqa: E731
    ct = lambda c: m.combo_text.get(c, "")                                 # noqa: E731
    dolmayan = ""
    ok = True
    if m.MF23b_edit == "":
        dolmayan += " MF23,"; ok = False
    if m.mf32a_val == "":
        dolmayan += "  MF32A  Valyuta,"; ok = False
    if m.Edit11_mf32a == "":
        dolmayan += "  MF32A  mebleq,"; ok = False
    if ct("CMF50") == "":
        dolmayan += "  MF50,"                       # stat4 'nextprosedure' either way (:820-824)
    if ct("CMF57") == "":
        dolmayan += "  MF57,"                       # stat7 'nextprosedure' either way
    if ct("CMF59") == "":
        dolmayan += "  MF59,"                       # stat5 'nextprosedure' either way
    if m.Edit1_MF71A == "":
        dolmayan += "  MF71A,"; ok = False
    if not ok:                                      # :853-859 both branches need stat1,2,3,6 (stat7 is always next)
        return {"ok": False, "message": " " + dolmayan + " Xanalar doldurulmayıb!"}
    if not amount_ok(m.Edit11_mf32a):
        raise AzEditError("azips.err_float", value=m.Edit11_mf32a)
    ref = referans(conn, m.fin, m.mf32a_val)                                  # :871-884 -> MF20_edit
    amount = str_to_float(m.Edit11_mf32a)                                     # :892 strtofloat
    azn = m.fincopy == "AZN"
    mf50_account = mf50_nameadress = ""
    i50 = ci("CMF50")
    if not azn:                                                               # :931-975
        if i50 == 1:
            mf50_account, mf50_nameadress = _f(m, "Edit1_MF50"), _f(m, "Memo1_MF50")
        elif i50 == 2:
            mf50_account, mf50_nameadress = _f(m, "Edit4_MF50"), _f(m, "Memo2_MF50")
        elif i50 == 3:
            mf50_account, mf50_nameadress = _f(m, "Edit3_MF50"), _f(m, "Memo2_MF50")
    elif i50 == 1:                                                            # :977-990 Memo2.Text := Memo2_MF50.Text
        mf50_account, mf50_nameadress = _f(m, "Edit3_MF50"), _f(m, "Memo2_MF50")
    # :992-1017 Chk_AccNo is opened (the 'not valid' check is commented out); voen is computed but never used.
    acc = _f(m, "Edit3_MF50") if azn else {1: _f(m, "Edit1_MF50"), 2: _f(m, "Edit4_MF50"), 3: _f(m, "Edit3_MF50")}.get(i50)
    if acc is not None:
        cust_type(conn, acc)
    # MF59 :1180-1199
    i59 = ci("CMF59")
    mf59_account = mf59_nameadress = ""
    if i59 == 1:
        mf59_account, mf59_nameadress = _f(m, "Edit1_MF59"), _f(m, "Memo2_MF59")
    elif i59 == 2:
        mf59_account, mf59_nameadress = _f(m, "Edit2_MF59"), _f(m, "Memo1_MF59")
    of70 = m.OF70_RichEdit
    of72 = m.OF72_RichEdit
    if m.fin == "MT103":                                                      # :1233-1254
        args = [date_to_str(m.mf32_date), ref, mf50_account, m.reciverbic, m.Edit2, mf59_account, mf59_nameadress,
                m.fincopy, of70, of72, amount, 0, 1, mf50_nameadress, mf59_nameadress, m.Edit3, m.reciverbic,
                mf50_nameadress, mf59_nameadress, "AZN"]
        conn.call_proc(Q.PKG_MAIN, "savetransaction", args)
    else:                                                                     # :1255-1269
        args = [date_to_str(m.mf32_date), m.reciverbic, ref, m.MF26T_edit, amount, mf50_nameadress, mf59_nameadress,
                of70, m.Edit2, "Institution", m.fincopy, 25]
        conn.call_proc(Q.PKG_MAIN, "saving205", args)
    return {"ok": True, "reference": ref}


# ------------------------------------------------------------------------------------------------ edit forms
def out_row(conn, rid: int, lines=None) -> dict:
    """The current record of grid_out (sw_out, status 2,8,15) / GRIDOUT2 (sw_out_2) - looked up by ID with the branch rule."""
    from .azips import _b, branch_restricted
    lines = lines or Q.LINES_SW_OUT
    for x in conn.query(Q.text(lines, **_b(branch_restricted(conn)))):
        if int(x.get("ID") or 0) == int(rid):
            return x
    raise AzEditError("azips.err_norow")


def _s(x, k):
    v = x.get(k)
    if v is None:
        return ""
    if isinstance(v, float) and v.is_integer():
        return str(int(v))
    return str(v)


def edit_kind(conn, rid: int) -> dict:
    """ToolButton2Click SWIFT_MAINImpl1.pas:3530-3576."""
    conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["SW_OUT_EDIT"], commit=False)
    x = out_row(conn, rid)
    if _s(x, "SENDERLT") != "103":
        return {"form": "plugin", "plugin": "filereport.bpl", "param": "Azipsnew", "id": str(rid)}
    if _s(x, "MESSAGETYPE") == "MT103" and _s(x, "FINCOPY") != "AZN":
        return {"form": "MT103", **mt103_open(conn, x)}
    if _s(x, "MESSAGETYPE") == "MT103" and _s(x, "FINCOPY") == "AZN":
        return {"form": "MT103AZN", **mt103azn_open(conn, x)}
    return {"form": None}


def _header(conn, x) -> dict:
    sw = bankinfo_swift(conn)
    return {"header": {"senderlt": sw, "sendertype": "Institution", "ComboBox2": sw, "recivertype": "Institution",
                       "Application": "FIN", "priority": "N", "monitoring": "N", "receiver": tobic(conn, _s(x, "RECEIVERBIC"))}}


MT103_FIELDS = ("FINCOPY", "MESSAGETYPE", "RECEIVERBIC", "COUNTRY", "HESABAT", "MF20_REFERENCE", "MF23B", "MF21", "MF36",
                "MF32A_DATE", "MF32A_CURR", "MF32A_AMOUNT", "M50", "MF50_ACCOUNT", "MF50_BIC", "MF50_NAME$ADRESS", "M52",
                "MF52_ACCOUNT", "MF52_BIC", "MF52_NAME$ADRESS", "M53", "MF53_ACCOUNT", "MF53_BIC", "MF53_NAME$LOCATION", "M54",
                "MF54_ACCOUNT", "MF54_BIC", "MF54_NAME$LOCATION", "M55", "MF55_ACCOUNT", "MF55_BIC", "MF55_NAME$LOCATION",
                "M56", "MF56_ACCOUNT", "MF56_BIC", "MF56_NAME$LOCATION", "M58", "MF58_ACCOUNT", "MF58_BIC",
                "MF58_NAME$LOCATION", "M59", "MF59_ACCOUNT", "MF59_BIC", "MF59_NAME$ADRESS", "M70", "MF70", "MF71A",
                "MF71G_CHILD", "MF72", "MF77B", "COM_ACCID", "TAX", "SENDERLT")


def mt103_open(conn, x) -> dict:
    """TMT103.FormActivate editmt103.pas:616-650 + open_edit_form :652-919 (TabSheet1Show)."""
    rec = {k: _s(x, k) for k in MT103_FIELDS}
    c = {}
    c["CMF50"] = {":50A:": 1, ":50F:": 2, ":50K:": 3}.get(rec["M50"], 0)
    c["CMF52"] = {":52A:": 1, ":52D:": 2}.get(rec["M52"], 0)
    c["CMF53"] = 2                                                     # :740-745 fixed to B, disabled
    c["CMF54"] = {":54A:": 1, ":54B:": 2, ":54D:": 3}.get(rec["M54"], 0)
    c["CMF55"] = {":55A:": 1, ":55B:": 2, ":55D:": 3}.get(rec["M55"], 0)
    c["CMF56"] = {":56A:": 1, ":56C:": 2, ":56D:": 3}.get(rec["M56"], 0)
    c["CMF57"] = {":58A:": 1, ":58B:": 2, ":58C:": 3, ":57D:": 4}.get(rec["M58"], 0)
    c["CMF59"] = {":59:": 1, ":59A:": 2}.get(rec["M59"], -1)          # else branch only hides the panels (index kept)
    v71 = rec["MF71A"]
    g = rec["MF71G_CHILD"]
    p = g.rfind("|")                                                   # LastDelimiter: 0 when absent -> copy(...,1,-1)=''
    return {**_header(conn, x), "rec": rec, "combos": c,
            "MF71A": v71 if v71 in MF71A_ITEMS else "",
            "Edit1_MF71G": g[:p] if p >= 0 else "", "Edit2_MF71G": g[p + 1:] if p >= 0 else g,
            "Edit3_MF50": rec["MF36"],   # FormActivate :637 runs after TabSheet1Show (ActivePage=TabSheet1) and wins
            "corr": corr(conn, rec["MF32A_CURR"], rec["RECEIVERBIC"]),
            "accs": accs_for_comission(conn, rec["MF50_ACCOUNT"])}


class Mt103Save(BaseModel):
    reciverbic: str = Field(default="", max_length=11)
    mf32a_val: str = Field(default="", max_length=3)
    combos: dict[str, int] = {}
    combo_text: dict[str, str] = {}
    edits: dict[str, str] = {}          # Edit1_MF50, Edit2_MF50, Edit4_MF50, Edit3_MF50, Edit2_MF52..., Edit59A_bic, Edit1_MF71A...
    bound: dict[str, str | None] = {}   # DB-aware controls by DataField (MF32A_AMOUNT, MF50_NAME$ADRESS, ...)
    OF70_RichEdit: str = Field(default="", max_length=400)
    OF72_RichEdit: str = Field(default="", max_length=400)


MT103_BOUND = ("COUNTRY", "HESABAT", "MF32A_AMOUNT", "MF36", "MF50_NAME$ADRESS", "MF52_ACCOUNT", "MF52_NAME$ADRESS",
               "MF53_ACCOUNT", "MF53_NAME$LOCATION", "MF54_ACCOUNT", "MF54_NAME$LOCATION", "MF55_ACCOUNT",
               "MF55_NAME$LOCATION", "MF56_ACCOUNT", "MF56_NAME$LOCATION", "MF59_ACCOUNT", "MF59_NAME$ADRESS", "MF77B",
               "COM_ACCID")
MT103AZN_BOUND = ("RECEIVERBIC", "COUNTRY", "HESABAT", "MF32A_AMOUNT", "MF32A_DATE", "MF50_NAME$ADRESS", "MF50_ACCOUNT",
                  "MF59_ACCOUNT", "MF59_NAME$ADRESS", "MF59_BIC")


def _post(conn, rowid: str, vals: dict):
    """TOracleDataSet.Post: DOA writes the changed fields 'update SW_OUT_NEW set ... where rowid = :doa__rowid' and commits
    (CommitOnPost default True). sw_outBeforePost Unit2.pas:1441-1444: MF70<>'' -> M70 := ':70:'."""
    if (vals.get("MF70") or "") != "":
        vals["M70"] = ":70:"
    cols = sorted(vals)
    binds = {f"p{i}": vals[c] for i, c in enumerate(cols)}
    binds["doa__rowid"] = rowid
    sql = "update SW_OUT_NEW set " + ", ".join(f"{c} = :p{i}" for i, c in enumerate(cols)) + " where rowid = :doa__rowid"
    conn.execute(sql, binds)
    conn.commit()


def mt103_save(conn, rid: int, m: Mt103Save) -> dict:
    """CreatMessageExecute editmt103.pas:970-1353."""
    x = out_row(conn, rid)
    rec = {k: _s(x, k) for k in MT103_FIELDS}
    ci = lambda c: int(m.combos.get(c, -1))             # noqa: E731
    ct = lambda c: m.combo_text.get(c, "")              # noqa: E731
    e = lambda k: str(m.edits.get(k, "") or "")        # noqa: E731
    bound = {k: v for k, v in m.bound.items() if k in MT103_BOUND}
    dolmayan, ok = "", True
    if rec["MF23B"] == "":
        dolmayan += " MF23,"; ok = False
    if m.mf32a_val == "":
        dolmayan += "  MF32A  Valyuta,"; ok = False
    if m.mf32a_val == "":                               # :996 checks mf32a_val again (not the amount) - kept
        dolmayan += "  MF32A  mebleq,"; ok = False
    for c, lab in (("CMF50", "  MF50,"), ("CMF57", "  MF57,"), ("CMF59", "  MF59,")):
        if ct(c) == "":
            dolmayan += lab; ok = False
    if e("Edit1_MF71A") == "":
        dolmayan += "  MF71A,"; ok = False
    if not ok:
        return {"ok": False, "message": " " + dolmayan + " Xanalar doldurulmayıb!"}
    if "MF32A_AMOUNT" in bound and not amount_ok(str(bound["MF32A_AMOUNT"] or "")):
        raise AzEditError("azips.err_float", value=bound["MF32A_AMOUNT"])
    v = dict(bound)
    v["MF20_REFERENCE"] = referans(conn, rec["MESSAGETYPE"], m.mf32a_val)   # :1023-1036 MF20_edit (DBEdit) := refe
    h = _header(conn, x)["header"]
    if (bound.get("MF36") if "MF36" in bound else rec["MF36"]) not in ("", None):
        v["SENDERTYPE"] = h["sendertype"]               # :1044 'if DBEdit_M36.Text<>'' then' governs only this line
    v.update(SENDERBIC=h["senderlt"], SENDERLT=h["senderlt"], APPLICATION="FIN", FINCOPY=rec["FINCOPY"],
             MESSAGETYPE=rec["MESSAGETYPE"], PRIORITY="N", MONITORING="N", RECEIVERTYPE=m.reciverbic,
             RECEIVERBIC=m.reciverbic, MF32A_CURR=m.mf32a_val)
    i50 = ci("CMF50")
    if i50 == 0:
        v.update(M50="", MF50_ACCOUNT="", MF50_BIC="", **{"MF50_NAME$ADRESS": ""})
    elif i50 == 1:
        v.update(M50=":50A:", MF50_ACCOUNT=e("Edit1_MF50"), MF50_BIC=e("Edit2_MF50"))
    elif i50 == 2:
        v.update(M50=":50F:", MF50_ACCOUNT=e("Edit4_MF50"), MF50_BIC="")
    elif i50 == 3:
        v.update(M50=":50K:", MF50_ACCOUNT=e("Edit3_MF50"), MF50_BIC="")
        nl = lines_of(v.get("MF50_NAME$ADRESS", rec["MF50_NAME$ADRESS"]) or "")
        v["TAX"] = delphi_trim((nl[1] if len(nl) > 1 else "")[:20])          # trim(copy(Lines[1],0,20))
    acc = {1: e("Edit1_MF50"), 2: e("Edit4_MF50"), 3: e("Edit3_MF50")}.get(i50)
    ct_ = cust_type(conn, acc) if acc is not None else None
    if ct_ is None:                                     # :1099-1102 (also when no CMF50 row was chosen: variable unset)
        return {"ok": False, "message": SHOW_ERR}
    if i50 == 3 and int(ct_) == 1:
        v["TAX"] = ""
    i52 = ci("CMF52")
    if i52 == 1:
        v.update(M52=":52A:", MF52_BIC=e("Edit2_MF52"))
    elif i52 == 2:
        v.update(M52=":52D:", MF52_BIC="")
    elif i52 == 0:
        v.update(M52="", MF52_ACCOUNT="", MF52_BIC="", **{"MF52_NAME$ADRESS": ""})
    i53 = ci("CMF53")
    if i53 == 1:
        v.update(M53=":53A:", MF53_ACCOUNT=e("DBEdit1_MF53"), MF53_BIC=e("Edit2_MF53"))
    elif i53 == 2:                                      # DBEdit3_MF53 shows CORR.CORACOUNT
        v.update(M53=":53B:", MF53_ACCOUNT=corr(conn, m.mf32a_val, m.reciverbic), MF53_BIC="")
    elif i53 == 3:
        v.update(M53=":53D:", MF53_BIC="")
    elif i53 == 0:
        v.update(M53="", MF53_ACCOUNT="", **{"MF53_NAME$LOCATION": ""})
    for n, letters in (("54", "ABD"), ("55", "ABD"), ("56", "ACD")):
        i = ci("CMF" + n)
        if i == 1:
            v.update({"M" + n: f":{n}A:", f"MF{n}_BIC": e(f"Edit2_MF{n}")})
        elif i in (2, 3):
            v.update({"M" + n: f":{n}{letters[i - 1]}:", f"MF{n}_BIC": ""})
        elif i == 0:
            v.update({"M" + n: "", f"MF{n}_ACCOUNT": "", f"MF{n}_BIC": "", f"MF{n}_NAME$LOCATION": ""})
    i57 = ci("CMF57")                                   # :1262-1296 writes the 58 fields, with the letters as Delphi has them
    if i57 == 1:
        v.update(M58=":58A:", MF58_BIC=e("Edit2_MF57"))
    elif i57 == 2:
        v.update(M58=":58B:", MF58_BIC="")
    elif i57 == 3:
        v.update(M58=":57C:", MF58_BIC="", **{"MF58_NAME$LOCATION": ""})
    elif i57 == 4:
        v.update(M58=":58D:", MF58_BIC="")
    elif i57 == 0:
        v.update(M58="", MF58_ACCOUNT="", MF58_BIC="", **{"MF58_NAME$LOCATION": ""})
    i59 = ci("CMF59")
    if i59 == 1:
        v.update(M59=":59:", MF59_BIC="")
    elif i59 == 2:
        v.update(M59=":59A:", MF59_BIC=e("Edit59A_bic"))
    elif i59 == 0:
        v.update(M59="", MF59_ACCOUNT="", MF59_BIC="", **{"MF59_NAME$ADRESS": ""})
    if m.OF70_RichEdit != "":
        v.update(M70=":70:", MF70=delphi_trim(m.OF70_RichEdit))
    else:
        v["M70"] = ""
    if e("Edit1_MF71A") != "":
        v.update(M71A=":71A:", MF71A=e("Edit1_MF71A"))
    else:
        v["M71A"] = ""
    if e("Edit1_MF71G") != "":
        v.update(M71G=":71G:", MF71G_CHILD=e("Edit1_MF71G") + "|" + e("Edit2_MF71G"))
    else:
        v["M71G"] = ""
    if m.OF72_RichEdit != "":
        v.update(M72=":72:", MF72=delphi_trim(m.OF72_RichEdit))
    else:
        v["M72"] = ""
    if (bound.get("MF77B") if "MF77B" in bound else rec["MF77B"]) not in ("", None):
        v["M77B"] = ":77B:"
    if "MF70" not in v and rec["MF70"] != "":
        v["MF70"] = rec["MF70"]                          # BeforePost reads the record value
    _post(conn, _s(x, "ROWID"), v)
    return {"ok": True}


def mt103azn_open(conn, x) -> dict:
    """TMT103AZN.FormActivate formmt103.pas:312-350 + TabSheet1Show :645-662."""
    rec = {k: _s(x, k) for k in MT103_FIELDS}
    L70, L72 = lines_of(rec["MF70"]), lines_of(rec["MF72"])
    c59 = {":59:": 1, ":59A:": 2}.get(rec["M59"], -1)
    return {**_header(conn, x), "rec": rec, "combos": {"CMF59": c59}, "mf32a_val": "AZN",
            "Edit3_MF50": rec["MF50_ACCOUNT"], "OF70_RichEdit": strings_text((L70 + [""] * 4)[:4]),
            "RichEdit3": strings_text((L72 + [""] * 6)[:6])}


class AznSave(BaseModel):
    CMF59_text: str = Field(default="", max_length=20)
    RichEdit1: str = Field(default="", max_length=400)
    OF70_RichEdit: str = Field(default="", max_length=400)
    RichEdit3: str = Field(default="", max_length=400)
    bound: dict[str, str | None] = {}


def mt103azn_save(conn, rid: int, m: AznSave) -> dict:
    """Change1Click formmt103.pas:257-272: 59A -> DBMemo5 := RichEdit1; MF70 := trim(OF70); MF72 := trim(RichEdit3); Post."""
    x = out_row(conn, rid)
    v = {k: val for k, val in m.bound.items() if k in MT103AZN_BOUND}
    if "MF32A_AMOUNT" in v and not amount_ok(str(v["MF32A_AMOUNT"] or "")):
        raise AzEditError("azips.err_float", value=v["MF32A_AMOUNT"])
    if m.CMF59_text == "Field - 59A":
        v["MF59_NAME$ADRESS"] = m.RichEdit1
    v["MF70"] = delphi_trim(m.OF70_RichEdit)
    v["MF72"] = delphi_trim(m.RichEdit3)
    _post(conn, _s(x, "ROWID"), v)
    return {"ok": True}


def show(conn, rid: int) -> dict:
    """Redakteet1Click :3578-3591 -> MT103Show (read-only, sw_out_2s) unless FINCOPY='AZN' (Form7, not ported here)."""
    x = out_row(conn, rid, Q.LINES_SW_OUT_2)
    if _s(x, "FINCOPY") == "AZN":
        return {"form": "Form7"}
    return {"form": "MT103Show", **mt103_open(conn, x)}


def edit_out_prefill(x: dict) -> dict:
    """Edit_outExecute :3205-3528 (not wired - documentation only): the OUT_FORM controls it would fill from grid_out."""
    s = lambda k: _s(x, k)  # noqa: E731
    f = {"FIN": s("MESSAGETYPE"), "sendertype": s("SENDERTYPE"), "reciverbic": s("RECEIVERBIC")}
    if s("MESSAGETYPE") != "MT103":
        return f
    f.update(MF20_edit=s("MF20_REFERENCE"), MF23b_edit=s("MF23B"), MF26T_edit=s("MF26T"), mf32_date=s("MF32A_DATE"),
             mf32a_val=s("MF32A_CURR"), Edit11_mf32a=s("MF32A_AMOUNT"))
    m = {(50, ":50A:"): ("Edit1_MF50", "Edit2_MF50", "Memo1_MF50", "MF50_NAME$ADRESS"),
         (50, ":50D:"): ("Edit4_MF50", None, "Memo3_MF50", "MF50_NAME$ADRESS"),
         (50, ":50K:"): ("Edit3_MF50", None, "Memo2_MF50", "MF50_NAME$ADRESS")}
    for (n, tag), (a, b, memo, fld) in m.items():
        if s(f"M{n}") == tag:
            f[a] = s(f"MF{n}_ACCOUNT")
            if b:
                f[b] = s(f"MF{n}_BIC")
            f[memo] = s(fld)
            if tag == ":50A:":
                f["CMF50"] = 1
    f["MF70_memo"] = s("MF59_NAME$ADRESS")       # :3524 (kept: MF70_memo gets the 59 name)
    return f


# ------------------------------------------------------------------------------------------------ routes
class FinIn(BaseModel):
    fin: str = Field(max_length=10)
    fincopy: str = Field(default="", max_length=3)
    combo: str = Field(max_length=10)
    selected: str = Field(default="", max_length=80)


class CorrIn(BaseModel):
    v: str = Field(default="", max_length=3)
    b: str = Field(default="", max_length=11)


def add_routes(r, g, guard):
    @r.get("/new/init")
    def _ninit(ws=Depends(g)):
        return new_init(ws.conn)

    @r.post("/new/combo")
    def _ncombo(b: FinIn, ws=Depends(g)):
        return {"items": guard(combo_items, ws.conn, b.fin, b.fincopy, b.combo)}

    @r.post("/new/panels")
    def _npanels(b: FinIn, ws=Depends(g)):
        return guard(combo_panels, ws.conn, b.combo, b.selected)

    @r.post("/new/create")
    def _ncreate(b: NewMsg, ws=Depends(g)):
        return guard(create_message, ws.conn, b)

    @r.get("/bank/{bic}")
    def _bank(bic: str, ws=Depends(g)):
        return {"bank": bank(ws.conn, bic[:11])}

    @r.get("/account/{acc}")
    def _acc(acc: str, ws=Depends(g)):
        a = acc[:40]
        return {"found": account(ws.conn, a), "accs": accs_for_comission(ws.conn, a)}

    @r.post("/corr")
    def _corr(b: CorrIn, ws=Depends(g)):
        return {"CORACOUNT": corr(ws.conn, b.v, b.b)}

    @r.post("/text/{kind}")
    def _text(kind: str, b: dict, ws=Depends(g)):
        t = str(b.get("text", ""))[:600]
        f = {"70": rich70, "72": rich72, "memo": memo35}.get(kind)
        return {"text": f(t) if f else t}

    @r.get("/out/{rid}/edit")
    def _edit(rid: int, ws=Depends(g)):
        return guard(edit_kind, ws.conn, rid)

    @r.post("/out/{rid}/mt103")
    def _s103(rid: int, b: Mt103Save, ws=Depends(g)):
        ws.conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["SW_OUT_EDIT"], commit=False)
        return guard(mt103_save, ws.conn, rid, b)

    @r.post("/out/{rid}/mt103azn")
    def _sazn(rid: int, b: AznSave, ws=Depends(g)):
        ws.conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["SW_OUT_EDIT"], commit=False)
        return guard(mt103azn_save, ws.conn, rid, b)

    @r.get("/out2/{rid}/show")
    def _show(rid: int, ws=Depends(g)):
        return guard(show, ws.conn, rid)
