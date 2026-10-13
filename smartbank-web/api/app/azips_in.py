"""AZIPS part 4b-2 - incoming postings, UFX card credit, account checks (SWIFT_MAINImpl1.pas, Checkacc.pas,
Tranzit_account.pas), exact logic ported by hand (no file building -> no interpreter):

  comitClick :3906 ('Təsdiq et', IN tab)  -> [MT102/MT103] ceskingClick :5330 (sw_main.check_account, RefreshRecord,
      Commit) -> status = 2 ? SW_IN_COMMIT right, Intesdiq (:vid), settings.SHOWR = 0 and MT102/MT103 ?
      AddINTransNewExecute :7118 + Commit ; Commit
  AddINTransNewExecute :7118-7296 -> IDs (selection filter :7146-7155), MessageDlg '%d sayda ...' [Yes, Cancel],
      SW_IN_FORAddIn (:IDs otSubst), per row: sw_settings.ENABLEDUFX = 1 ? cardufx.CardCheck / UfxCheck / Ufx_send,
      cardfindcredit, ufxcredit :6931, UFX71 fundstransfer, cardufx.UfxResponse ; sw_main.add_in_transactions2
  Hesabiyoxla1Click :4323 (popup 'Hesabi yoxla' on GridIN) -> Checkacc.pas TCheckinacc.Button1Click (acc_check, upd_none)
  ToolButton7Click :5391 ('Transit hesablar', SW_TRANZIT right) -> Tranzit_account.pas (list, sw_tranzit_insert, Delete)

Not ported (unreachable in Delphi): AddTransExecute :3629 and AddInTransExecute :4015 - TActions 'AddTrans' /
'AddInTrans' (SWIFT_MAINImpl1.dfm:2867-2882) are linked to no button or menu item; the only call (:3703) is commented
out. ceskingClick's button is Visible=False, so it only runs from comitClick. cheskaccountExecute is ported in part 3b.
"""
from __future__ import annotations
import datetime as _dt
import re

from . import azips_sql as Q
from .db.base import Out
from .delphi import float_to_str, subst

MSG_ZERO = "Əməliyyat Karta getmedi mebleg 0 !!!"          # :7209
MSG_OK = "Əməliyyat uğurla keçdi!!!"                       # :7226
MSG_FAIL = "Əməliyyat keçmədi!!!,Səhvin adı:"              # :7246 ('Əməliyyat keçmədi!!!' + ',' + 'Səhvin adı:' + RespText)
MSG_YEAH = "yeah"                                          # :7026 (debug ShowMessage left in Delphi)
MSG_KODE = "Kode Standarta uygun deyil"                    # :7063 / :7070
Q_ADD = "%d sayda əməliyyatlar günün sənədlərinə əlavə edilsin ?"   # :7167
MSG_TRANZIT = "Tranzit hesab əlavə olundu"                 # Tranzit_account.pas:43
OK_TEXT = "Successfully processed"
MT_CHECK = ("MT102", "MT103")
MT_SEL = ("MT102", "MT205", "MT900", "MT910", "MT950", "MT298", "MT999")
HEX_TAIL = "534D41525442414E4B2E455845584F484B53"            # String2Hex('SMARTBANK.EXEXOHKS')
# TField.AsString of the DATE column 'dat' = DateTimeToStr with the Windows short date / long time format of the client.
# Assumed 'dd.mm.yyyy hh:nn:ss' (Azerbaijani locale with 2-digit hour); characters 12-13 are then the hour.
DAT_FMT = "%d.%m.%Y %H:%M:%S"


class DelphiConvertError(Exception):
    """EConvertError of StrToInt (Delphi shows the text and aborts the event)."""


# ------------------------------------------------------------------ Delphi string helpers (1-based)
def _copy(s: str, i: int, n: int) -> str:
    i = max(i, 1)
    return s[i - 1:i - 1 + n] if n > 0 else ""


def _pos(sub: str, s: str) -> int:
    return s.find(sub) + 1 if sub else 0


def _strtoint(s: str) -> int:
    if not re.fullmatch(r"\s*[-+]?\d+", s or ""):
        raise DelphiConvertError(f"'{s}' is not a valid integer value")
    return int(s)


def _tdatetime(d: _dt.datetime) -> float:
    days = (d.date() - _dt.date(1899, 12, 30)).days
    ms = ((d.hour * 60 + d.minute) * 60 + d.second) * 1000 + d.microsecond // 1000     # Now has ms resolution
    return days + ms / 86400000.0


def datetime_to_str_us(d: _dt.datetime) -> str:
    """DateTimeToStrUs :6846-6861."""
    res = d.strftime("%H:%M:%S- %d.%m.%Y")
    f = _tdatetime(d)
    f = f - int(f)
    f = f * 24 * 60 * 60
    us = str(round((f - int(f)) * 1000000)) + "*"
    return us + res + "0" * max(0, 6 - len(us))


def string2hex(s: str) -> str:
    return s.encode("cp1254", errors="replace").hex().upper()


def hex2string(s: str) -> str:
    """Hex2String :6870 (HexToBin stops at the first non-hex pair; the rest of the buffer stays #0)."""
    n = len(s) // 2
    out = bytearray(n)
    for i in range(n):
        p = s[2 * i:2 * i + 2]
        if not re.fullmatch(r"[0-9A-Fa-f]{2}", p):
            break
        out[i] = int(p, 16)
    return out.decode("cp1254", errors="replace")


def encrypting(now: _dt.datetime) -> str:
    """Encrypting :6876-6907 (the key argument is unused; datdate := now)."""
    dt = datetime_to_str_us(now)
    k = _strtoint(_copy(dt, 8, 2))
    st = string2hex(dt + "SMARTBANK.EXE" + "XOHKS")
    return "".join(chr((ord(c) - k) & 0xFFFF) for c in st)


def decrypt(v: str, key: int) -> str:
    return "".join(chr((ord(c) + key) & 0xFFFF) for c in v)


def _dat_str(v) -> str:
    if v is None:
        return ""
    if isinstance(v, _dt.datetime):
        return v.strftime("%d.%m.%Y") if v.time() == _dt.time(0) else v.strftime(DAT_FMT)   # DateTimeToStr drops 00:00:00
    return str(v)


def _f(v) -> float:
    return float(v) if v is not None else 0.0


def _i(v) -> int:
    return int(round(float(v))) if v is not None else 0


def _one(rows) -> dict:
    return rows[0] if rows else {}


# ------------------------------------------------------------------ ufxcredit :6931-7080
def ufxcredit(conn, accountid: int, v_amount: float, msgs: list, now) -> float:
    """Returns Result. On 'Kode Standarta uygun deyil' Delphi exits with an unassigned Result (undefined Double);
    the web returns 0 there, so nothing goes to the card (see PARITY_AZIPS.md)."""
    b = {"vaccid": accountid}
    ncount = _i(_one(conn.query(Q.sql(Q.LINES_GET_CR_ACC), b)).get("NCOUNT"))
    v_cnt = _i(_one(conn.query(Q.sql(Q.LINES_GET_UFX_CHECK), b)).get("V_CNT"))
    if ncount <= 0:
        return v_amount
    if v_cnt == 0:
        cid = _i(_one(conn.query(Q.sql(Q.LINES_GET_CREDITID), b)).get("VCREDITID"))
        debt = _f(_one(conn.query(Q.sql(Q.LINES_GET_DEBTAMOUNT), {"vcreditid": cid})).get("VDUEINTERESTREST"))
        result = 0.0 if v_amount < debt else v_amount - debt
        code = encrypting(now)                                    # evaluated before SetVariable('DATDATE', datdate)
        conn.execute(Q.sql(Q.LINES_INSUFX), {"vcreditid": cid, "vaccid": accountid, "vdueinterestrest": debt,
                                             "v_rest": v_amount - debt, "vcode": code, "datdate": now.replace(microsecond=0)})
        conn.commit()
        return result
    uc = _one(conn.query(Q.sql(Q.LINES_UFXCODE), b))
    conn.query(Q.sql(Q.LINES_GET_CREDITID), b)                     # opened, not used
    hour = _copy(_dat_str(uc.get("DAT")), 12, 2)
    st2 = decrypt(str(uc.get("CODE") or ""), _strtoint(hour))
    L = len(HEX_TAIL)
    rev = _copy(st2, len(st2) - L + 1, len(st2))[::-1]
    st = _copy(rev, _pos("584F484B53", rev) + len("584F484B53") + 1, len(rev))
    rst = st[::-1]
    if not (rst and rst.upper() in st2.upper()):                   # ContainsText
        msgs.append(MSG_KODE)
        return 0.0
    st4 = _copy(st2, 0, len(st2) - L)
    st5 = hex2string(st4)
    st5 = _copy(st5, st5.rfind("*") + 1 + 1, 2)                     # LastDelimiter('*', st5) + 1
    if st5 != hour:
        msgs.append(MSG_KODE)
        return 0.0
    msgs.append(MSG_YEAH)
    r = _f(_one(conn.query(Q.sql(Q.LINES_GET_RESTUFXCHECK), b)).get("V_RSTAMOUNT"))
    if r < 0:
        conn.execute(Q.sql(Q.LINES_UPDUFX), {"vaccid": accountid, "transamount": v_amount - abs(r)})
        conn.commit()
        return 0.0 if (v_amount - abs(r)) < 0 else v_amount - abs(r)
    return v_amount


# ------------------------------------------------------------------ comitClick :3906 / AddINTransNewExecute :7118
def _row(conn, lines, rid):
    return next((r for r in conn.query(Q.text(lines)) if r.get("ID") == rid), None)


def comit_start(conn, lines, current, selected, pending: dict):
    """Runs comitClick up to the MessageDlg of AddINTransNewExecute. Returns {'ask': text} (state kept in pending)
    or a final result {'done': ..., 'messages': [...]}."""
    rows = conn.query(Q.text(lines))
    cur = next((r for r in rows if r.get("ID") == current), None)
    if cur is None:
        return {"done": False, "messages": []}
    if str(cur.get("MT") or "") in MT_CHECK:                         # cesking.Click :5330-5355
        conn.call_proc(Q.PKG_MAIN, "check_account", [current, str(cur.get("ACOUNT") or "")], commit=False)
        cur = _row(conn, lines, current) or cur                      # sw_in.RefreshRecord
        conn.commit()
    if _i(cur.get("STATUS")) != 2:
        return {"done": False, "messages": [], "status": cur.get("STATUS")}
    conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["SW_IN_COMMIT"])
    conn.query(Q.sql(Q.LINES_INTESDIQ), {"vid": current})            # Intesdiq.open (result unused)
    st = _one(conn.query(Q.text(Q.LINES_SW_SETTINGS)))                # settings / sw_settings: same SQL text
    if _i(st.get("SHOWR")) == 0 and str(cur.get("MT") or "") in MT_CHECK:
        ids = [r.get("ID") for r in rows]
        sel = sorted({i for i in (selected or []) if i in ids}, key=ids.index)
        by = {r.get("ID"): r for r in rows}
        by[current] = cur
        if not sel:                                                  # SelectedRows.Count = 0 -> current row, no filter
            pick = [current]
        else:
            pick = [i for i in sel if (_i(by[i].get("STATUS")) == 2 and by[i].get("MT") == "MT103")
                    or by[i].get("MT") in MT_SEL]                     # :7146-7155 (and binds tighter than or)
        pending.clear()
        pending.update(ids=pick, acount=str(cur.get("ACOUNT") or ""), enabledufx=_i(st.get("ENABLEDUFX")))
        return {"ask": Q_ADD % len(pick), "count": len(pick)}
    conn.commit()
    return {"done": True, "messages": []}


def comit_answer(conn, answer: str, pending: dict, ufx, now=None):
    """MessageDlg answer (yes / cancel); then the rest of AddINTransNewExecute and comitClick's two Commits."""
    if not pending:
        return {"done": False, "messages": []}
    st = dict(pending)
    pending.clear()
    msgs: list[str] = []
    posted: list[int] = []
    if answer == "yes":
        _add_in_new(conn, st, ufx, msgs, posted, now)
        conn.commit()                                                # comitClick :3938
    conn.commit()                                                    # :3975
    return {"done": True, "messages": msgs, "posted": posted}


def _add2(conn, r, posted):
    conn.call_proc(Q.PKG_MAIN, "add_in_transactions2",
                   [r.get("ID"), str(r.get("BIC") or ""), str(r.get("ACOUNT") or ""), _f(r.get("VALU")),
                    str(r.get("DESCRIPTION") or ""), str(r.get("DESCRIPTION2") or ""), str(r.get("TAX") or "")], commit=False)
    posted.append(r.get("ID"))


def _add_in_new(conn, st, ufx, msgs, posted, now):
    ids = ",".join(str(int(i)) for i in st["ids"])                   # IDs text (integers from the grid only)
    rows = conn.query(subst(Q.text(Q.LINES_SW_IN_FORADDIN), "IDs", ids))
    for r in rows:
        rid = r.get("ID")
        if st["enabledufx"] != 1 or _i(conn.call_func(Q.PKG_CARD, "CardCheck", [rid, 2], int)) <= 0:
            _add2(conn, r, posted)
            continue
        if _f(conn.call_func(Q.PKG_CARD, "UfxCheck", [rid], float)) != 0:
            _add2(conn, r, posted)
            continue
        o = conn.plsql_out("begin cardufx.Ufx_send(:p0, :p1, :p2, :p3, :p4, :p5, :p6); end;",
                           {"p0": rid, "p1": 2, "p2": Out(str), "p3": Out(str), "p4": Out(str), "p5": Out(float), "p6": Out(str)})
        v_transamount = _f(o.get("p5"))
        cardnumber, cardtype = str(o.get("p3") or ""), str(o.get("p2") or "")
        descp, valyuta = str(o.get("p6") or ""), str(o.get("p4") or "")
        crdt = _i(_one(conn.query(Q.sql(Q.LINES_CARDFINDCREDIT), {"card_accid": st["acount"]})).get("CRDT"))
        t = now() if callable(now) else (now or _dt.datetime.now())
        v_send = ufxcredit(conn, crdt, v_transamount, msgs, t)
        if v_send == 0:
            resp_text = OK_TEXT
            msgs.append(MSG_ZERO)
        else:
            resp = ufx.fundstransfer(cardnumber, cardtype, t.strftime("%Y-%m-%d %H:%M:%S"), descp, valyuta,
                                     float_to_str(v_send))
            p = _pos("#", resp)
            resp_text = _copy(resp, p + 1, len(resp))
            conn.call_proc(Q.PKG_CARD, "UfxResponse", [rid, 2, resp_text, v_send, resp], commit=False)
        if resp_text.upper() == OK_TEXT.upper():
            if v_send != 0:
                msgs.append(MSG_OK)
            _add2(conn, r, posted)
        else:
            msgs.append(MSG_FAIL + resp_text)
            return                                                   # Exit (comitClick still commits)


# ------------------------------------------------------------------ Checkacc.pas (Hesabiyoxla1Click :4323)
def checkinacc(conn, lines, rid: int, acc: str):
    """Button1Click: acc_check(:acc = Edit1), Edit2 := NAME, sw_main.upd_none(Edit3.Text) in both branches (no commit),
    empty name -> form closes."""
    if _row(conn, lines, rid) is None:
        return None
    name = str(_one(conn.query(Q.sql(Q.LINES_ACC_CHECK), {"acc": acc})).get("NAME") or "")
    conn.call_proc(Q.PKG_MAIN, "upd_none", [str(rid)], commit=False)
    return {"name": name, "closed": name == ""}


# ------------------------------------------------------------------ Tranzit_account.pas (ToolButton7Click :5391)
def tranzit_list(conn):
    conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["SW_TRANZIT"])
    return conn.query(Q.sql(Q.LINES_TRANZIT))


def tranzit_add(conn, value1: str, value2: str):
    """Button1Click: two InputQuery (Cancel keeps ''), sw_main.sw_tranzit_insert, ShowMessage; no commit."""
    conn.call_proc(Q.PKG_MAIN, "sw_tranzit_insert", [value1, value2], commit=False)
    return {"message": MSG_TRANZIT}


def tranzit_delete(conn, rowid: str):
    """Button2Click: Tranzit.Delete -> DOA 'delete from SW_TRANSIT_ACC where rowid = :doa__rowid' + CommitOnPost."""
    if rowid not in {str(r.get("ROWID")) for r in conn.query(Q.sql(Q.LINES_TRANZIT))}:
        return False
    conn.execute("delete from SW_TRANSIT_ACC where rowid = :doa__rowid", {"doa__rowid": rowid})
    conn.commit()
    return True


# ------------------------------------------------------------------ Unit16.pas TrdkİN (Redaktet1Click :3595, popup 'Redaktə et')
def in_redakte(conn, lines, rid: int, acount: str, voin2: str):
    """Button1Click: sw_main.UPDIN(Edit1 = Hesab №, Edit2 = Vöen, Edit3 = ID text); sw_in.Refresh; Close. No right, no commit.
    (Unit4 IN_edit is only reachable from ToolButton5, which is Visible=False - not ported.)"""
    if _row(conn, lines, rid) is None:
        return None
    conn.call_proc(Q.PKG_MAIN, "UPDIN", [acount, voin2, str(rid)], commit=False)
    return {"done": True}


# ------------------------------------------------------------------ prints: printClick :3984 / GridINDblClick :4186 / ToolButton17Click :7106
def in_print(conn, lines, rid: int, field: str):
    """SW_IN_PRINT right; a := current GridIN row 'all_text2' (Çap et, double click) or 'all_text' (XML CAP);
    cap.pas TPrintform: text starting with '<' is shown in a TWebBrowser (HTML/XML), otherwise in the RichEdit and printed
    with prt.Print('A.Z.I.P.S'). Returns the text and the mode; the web renders the RichEdit case as PDF."""
    conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["SW_IN_PRINT"])
    r = _row(conn, lines, rid)
    if r is None:
        return None
    a = str(r.get(field) or "")
    return {"text": a, "html": a[:1] == "<"}


def text_pdf(text: str, title: str = "A.Z.I.P.S") -> bytes:
    """TRichEdit.Print(title): plain text, MS Sans Serif 16 px (~12 pt) -> DejaVu 12 pt (Azerbaijani letters), A4."""
    import io
    from reportlab.lib.pagesizes import A4
    from reportlab.pdfgen import canvas
    from .report_render import _font
    font = _font()
    buf = io.BytesIO()
    c = canvas.Canvas(buf, pagesize=A4)
    c.setTitle(title)
    w, h = A4
    y = h - 40
    for line in text.replace("\r\n", "\n").replace("\r", "\n").split("\n"):
        while True:
            chunk = line
            while chunk and c.stringWidth(chunk, font, 12) > w - 80:
                chunk = chunk[:-1]
            if y < 40:
                c.showPage(); y = h - 40
            c.setFont(font, 12)
            c.drawString(40, y, chunk)
            y -= 15
            line = line[len(chunk):]
            if not line:
                break
    c.save()
    return buf.getvalue()


# ------------------------------------------------------------------ OUT print: ToolButton8Click :6179-6476 (cap.pas TPrintform)
def _pf(x, k):
    v = x.get(k.upper())
    if v is None:
        return ""
    if isinstance(v, float) and v.is_integer():
        return str(int(v))
    return str(v)


def out_print_text(x: dict) -> str:
    """ToolButton8Click :6179-6447: the MT text built from the grid record (no right check in Delphi).
    #13 is CR as in Delphi; the TRichEdit shows CR as a line break."""
    f = lambda k: _pf(x, k)  # noqa: E731
    CR = "\r"
    mf20 = f("MF20") + " " + f("MF20_REFERENCE")
    mf21 = f("M21") + " " + f("mf21")
    mf23 = CR + CR + f("M23B") + " " + f("mf23b")
    mf32 = CR + CR + f("M32A") + " " + f("MF32A_DATE") + " " + f("MF32A_CURR") + f("MF32A_AMOUNT")
    if f("M50") == ":50A:":
        mf50 = CR + CR + f("M50") + " /" + f("MF50_NAME$ADRESS")
    elif f("M50") == ":50K:" and f("FINCOPY") != "AZN":
        na = f("MF50_NAME$ADRESS")
        p = na.find(CR) + 1                                   # Delphi pos (1-based, 0 = not found)
        # copy(na,0,p-1) + #13 + copy(na,p+2,length(na)-p)
        na = na[:max(p - 1, 0)] + CR + na[p + 1:p + 1 + len(na) - p]
        mf50 = CR + CR + f("M50") + na
    else:
        mf50 = CR + CR + f("M50") + f("MF50_NAME$ADRESS")
    if f("M52") == ":52A:":
        mf52 = CR + CR + f("M52") + " /" + f("MF52_ACCOUNT") + CR + f("MF52_BIC") + CR + f("MF52_NAME$ADRESS")
    elif f("M52") == ":52D:":
        mf52 = CR + CR + f("M52") + " /" + f("MF52_ACCOUNT") + CR + f("MF52_NAME$ADRESS")
    else:
        mf52 = ""
    mf53 = "" if f("FINCOPY") == "AZN" else CR + CR + f("M53") + " /" + f("MF53_ACCOUNT")

    def abd(tag, a, bd, extra_c=False):
        t = f(tag)
        n = tag.replace("M", "MF", 1)
        if t == a:
            return CR + CR + t + " /" + f(n + "_ACCOUNT") + CR + f(n + "_BIC") + CR + f(n + "_NAME$LOCATION")
        if t in bd:
            return CR + CR + t + " /" + f(n + "_ACCOUNT") + CR + f(n + "_NAME$LOCATION")
        return ""
    mf54 = abd("M54", ":54A:", (":54B:", ":54D:"))
    mf55 = abd("M55", ":55A:", (":55B:", ":55D:"))
    if f("M56") == ":56C:":
        mf56 = CR + CR + f("M56") + " /" + f("MF56_ACCOUNT")
    else:
        mf56 = abd("M56", ":56A:", (":56D:",))
    # 'M57' block reads M58 fields; the ':57C:' test on M58 never matches a 58 tag (Delphi as written)
    m58 = f("M58")
    if m58 == ":57C:":
        mf57 = CR + CR + m58 + " /" + f("MF58_ACCOUNT")
    else:
        mf57 = abd("M58", ":58A:", (":58D:",))
    mf59 = CR + CR + f("M59") + f("MF59_NAME$ADRESS")
    mf70 = CR + CR + f("M70") + " " + f("MF70") if f("M70") == ":70:" else ""
    mf71 = CR + CR + f("M71A") + " " + f("MF71A")
    mf72 = CR + CR + f("M72") + " " + f("MF72") if f("M72") == ":72:" else ""
    mf77 = CR + CR + f("M77B") + " " + f("MF77B") if f("M77B") == ":77B:" else ""
    return (mf20 + "\r\n" + mf21 + mf23 + mf32 + mf50 + mf52 + mf53 + mf54 + mf55 + mf56 + mf57 + mf59 + mf70 + mf71
            + mf72 + mf77)


def out_print(x: dict):
    """:6439-6476: hesabat empty -> built MT text, else the stored 'hesabat' text; both go to cap.pas TPrintform.
    Oracle stores '' as NULL: NULL is treated like '' here (see PARITY_AZIPS.md 4e, unverified)."""
    h = x.get("HESABAT")
    a = out_print_text(x) if h is None or h == "" else str(h)
    return {"text": a, "html": a[:1] == "<"}
