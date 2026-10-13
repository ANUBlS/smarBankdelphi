"""AZIPS part 4a - row actions of TSWIFT_MAIN (SWIFT_MAINImpl1.pas), exact logic, ported by hand (short procedures, no
file building, so the interpreter is not needed):

  ToolButton9Click :2961 ('Ləğv et', OUT tab)  -> SW_OUT_DELETE right, out_deleteExecute :4515 -> sw_main.sw_out_delete
  opendayClick :4096 ('Geri qaytar!')          -> SW_back right, backClick :4428 (SW_BACK right) -> geriExecute :4458
                                                  -> sw_main.sw_out_back
  ToolButton13Click :3025 ('Verifikator', N1)  -> SW_OUT_COMMITS right, commitingExecute :6688 + Form12 (yoxp.pas)
                                                  -> sw_main.sw_out_commit
  ToolButton6Click :4087 ('Ləğv et', IN tab)   -> SW_IN_DELETE right, DeleteExecute :4377 -> sw_main.sw_in_delete
  Geriqaytar1Click :435 (popup on 'Sending')   -> SW_BACK right, sw_main.del_std_transaction(tr_id, id)
  mliyyatGnnsndlringondrm1Click :6778          -> SEND_TRAN right, sw_main.transend(id, 999)

The Delphi loops ask MessageDlg per selected row. The browser asks the same questions first and sends the answers in the
same order ('yes' / 'no' / 'cancel' / 'all' = mbYesToAll confirmed by the second dialog / 'all_no' = second dialog
cancelled); the loop below then runs exactly as Delphi with those answers.
"""
from __future__ import annotations

from . import azips_sql as Q

AZN_OUT_DELETED = "{} sayda əməliyyat silindi!"            # :4565
AZN_OUT_ALL_DELETED = "Bütün əməliyyatlar silinib!"        # :4566
AZN_BACK = "{} sayda əməliyyat qaytarıldı!"                # :4510
AZN_ALL_BACK = "Bütün əməliyyat qaytarılıb!"               # :4511
AZN_NOT_BACK = "Əməliyyatlar qaytarılmadı!"                # :4434
AZN_NO_FORMAT = "Heç bir format yoxdur!"                   # :3044 (leading space in Delphi: ' Heç bir format yoxdur!')
FORM12_BAD = "Mebleq ve ya Valyuta duzgun yazilmayib!"     # yoxp.pas Button1Click


def _rows(conn, lines, restricted):
    ls = list(lines)
    if restricted:
        ls[10] = Q.BRANCH_LINE
    return conn.query(Q.text(ls))


def _pick(rows, selected, current):
    """SelectedRows in bookmark order; 'if Count = 0 then CurrentRowSelected := True'. Only ids of the grid are accepted."""
    ids = [r.get("ID") for r in rows]
    sel = [i for i in dict.fromkeys(selected or []) if i in ids]
    if not sel and current in ids:
        sel = [current]
    sel.sort(key=ids.index)                      # TBookmarkList is kept sorted (grid order)
    return sel


def _loop(sel, answers, two_step=True):
    """The MessageDlg case of out_delete/geri/Delete (two_step) and commiting (mbYes/mbNo/mbCancel only).
    Yields (Index, id) for rows to process; returns the last Index (Delphi: loop variable after the loop)."""
    wait, last = True, -1
    answers = list(answers or [])
    for index, tid in enumerate(sel):
        last = index
        if wait:
            a = answers.pop(0) if answers else "cancel"
            if a == "no":
                continue
            if a == "cancel":
                break
            if two_step and a == "all":
                wait = False
            elif two_step and a == "all_no":
                continue
            elif a != "yes":
                break
        yield index, tid
    return last


def _run(sel, answers, fn, two_step=True):
    g = _loop(sel, answers, two_step)
    done = []
    try:
        while True:
            idx, tid = next(g)
            fn(tid)
            done.append(tid)
    except StopIteration as e:
        return done, (e.value if e.value is not None else -1)


def out_delete(conn, restricted, selected, current, answers):
    calls = []
    rows = _rows(conn, Q.LINES_SW_OUT, restricted)
    if not rows:                                             # ToolButton9Click: RecordCount=0 -> nothing (message commented)
        return {"done": [], "memo2": None}
    conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["SW_OUT_DELETE"])
    done, index = _run(_pick(rows, selected, current), answers,
                       lambda t: conn.call_proc(Q.PKG_MAIN, "sw_out_delete", [t], commit=False))
    conn.commit()                                            # sboapiDataModule.SBSession.Commit
    left = _rows(conn, Q.LINES_SW_OUT, restricted)
    return {"done": done, "memo2": AZN_OUT_DELETED.format(index) if left else AZN_OUT_ALL_DELETED}


def out_back(conn, restricted, selected, current, answers):
    conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["SW_back"])      # opendayClick :4098
    rows = _rows(conn, Q.LINES_SW_OUT_2, restricted)
    if not rows:                                                            # backClick :4434
        return {"done": [], "memo2": AZN_NOT_BACK}
    conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["SW_BACK"])
    done, index = _run(_pick(rows, selected, current), answers,
                       lambda t: conn.call_proc(Q.PKG_MAIN, "sw_out_back", [t], commit=False))
    conn.commit()
    left = _rows(conn, Q.LINES_SW_OUT_2, restricted)
    return {"done": done, "memo2": AZN_BACK.format(index) if left else AZN_ALL_BACK}


def commit_currencies(conn) -> list[str]:
    """Form12.FormActivate: ValuteForCommit opened, DBLookupComboBox1 shows VAL_NAME (first row preselected)."""
    return [str(r.get("VAL_NAME") or "") for r in conn.query(Q.text(Q.LINES_VALUTEFORCOMMIT))]


def out_commit(conn, restricted, selected, current, answers, form12):
    """ToolButton13Click + commitingExecute + Form12. form12[i] = {'amount': Edit1 text, 'curr': combo text} or
    {'close': True} (Button2 'Çıx') for the i-th row that was answered 'yes'."""
    from .azips import float_to_str
    conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["SW_OUT_COMMITS"])
    rows = _rows(conn, Q.LINES_SW_OUT_2, restricted)
    if not rows:
        return {"done": [], "message": " " + AZN_NO_FORMAT, "exited": False}
    by_id = {r.get("ID"): r for r in rows}
    forms = list(form12 or [])
    done, wrong = [], None
    g = _loop(_pick(rows, selected, current), answers, two_step=False)
    for _idx, tid in g:
        f = forms.pop(0) if forms else {"close": True}
        if f.get("close"):                                     # Button2Click: Edit2 := '0' -> exit (Commit skipped)
            return {"done": done, "message": None, "exited": True}
        r = by_id[tid]
        amt = r.get("MF32A_AMOUNT")
        shown = "" if amt is None else float_to_str(float(amt))          # DBEdit1.Text (MF32A_AMOUNT DisplayText)
        if f.get("amount", "") == shown and str(r.get("MF32A_CURR") or "") == f.get("curr", ""):
            conn.call_proc(Q.PKG_MAIN, "sw_out_commit", [tid], commit=False)
            done.append(tid)
            continue
        # Button1Click mismatch: sw_out_2.Edit; STATUS := '7'; INFO := ...; Post; Session.Commit; Edit2 := '0' -> exit
        conn.execute("update SW_OUT_NEW set INFO = :p0, STATUS = :p1 where rowid = :doa__rowid",
                     {"p0": FORM12_BAD, "p1": 7, "doa__rowid": r.get("ROWID")})
        conn.commit()
        wrong = tid
        return {"done": done, "message": FORM12_BAD, "wrong": wrong, "exited": True}
    conn.commit()
    return {"done": done, "message": None, "exited": False}


def in_delete(conn, restricted_lines, selected, current, answers):
    conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["SW_IN_DELETE"])
    rows = conn.query(Q.text(restricted_lines))
    done, _ = _run(_pick(rows, selected, current), answers,
                   lambda t: conn.call_proc(Q.PKG_MAIN, "sw_in_delete", [t], commit=False))
    conn.commit()
    return {"done": done}


def sending_back(conn, restricted, current):
    """Geriqaytar1Click :435-441 on the current 'Sending' (gridout3) row; no explicit commit in Delphi (DOA CallProcedure
    does not commit; the session commits at the next commit)."""
    conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["SW_BACK"])
    rows = {r.get("ID"): r for r in _rows(conn, Q.LINES_SW_OUT3, restricted)}
    r = rows.get(current)
    if r is None:
        return {"done": []}
    tr = r.get("TR_ID")
    conn.call_proc(Q.PKG_MAIN, "del_std_transaction", [int(tr or 0), current], commit=False)
    return {"done": [current]}


def transend(conn, restricted, current):
    """mliyyatGnnsndlringondrm1Click :6778-6789 on the current 'New' (grid_out) row; no commit in Delphi."""
    conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["SEND_TRAN"])
    ids = {r.get("ID") for r in _rows(conn, Q.LINES_SW_OUT, restricted)}
    if current not in ids:
        return {"done": []}
    conn.call_proc(Q.PKG_MAIN, "transend", [current, 999], commit=False)
    return {"done": [current]}


# ------------------------------------------------------------------ part 4b: Modifikator
import re as _re
_IDENT = _re.compile(r"[A-Za-z][A-Za-z0-9_$#]{0,29}")


class ProwError(ValueError):
    """sw_prow column name that is not a plain Oracle identifier (Delphi would concatenate it into SQL as is)."""


def modifikator(conn, restricted, selected, current, answers):
    """ToolButton11Click :3097 (SW_OUT_COMMIT right; empty grid -> ShowMessage 'Heç bir format yoxdur!') ->
    addtrans2Execute :5146-5260: per selected grid_out row, setprow(:Q = MESSAGETYPE), transac SQL[0] rebuilt from the
    sw_prow column names, sw_main.add_transaction(ID, debet, kredit, summa, MF32A_DATE, DESTINATION, vbic, tax, k1);
    one SBSession.Commit after the loop. vbic is only assigned when KREDIT = 'RECEIVERBIC' and keeps its value for the
    following rows (local string, '' at start); k1 is never assigned (WorldCheck commented out) -> 0."""
    conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["SW_OUT_COMMIT"])
    rows = _rows(conn, Q.LINES_SW_OUT, restricted)
    if not rows:
        return {"done": [], "message": AZN_NO_FORMAT}
    by_id = {r.get("ID"): r for r in rows}
    sel = _pick(rows, selected, current)
    st = {"vbic": ""}

    def one(tid):
        g = by_id[tid]
        p = (conn.query(Q.text(Q.LINES_SETPROW), {"Q": str(g.get("MESSAGETYPE") or "")}) or [{}])[0]
        kredit = str(p.get("KREDIT") or "")
        if kredit.strip() == "RECEIVERBIC":
            st["vbic"] = "BIC"
        debet, summa = str(p.get("DEBET") or ""), str(p.get("SUMM") or "")
        for x in (kredit, debet, summa):
            if not _IDENT.fullmatch(x):
                raise ProwError(x)
        t = (conn.query(Q.transac_sql0(kredit, debet, summa), {"ids1": int(g.get("ID") or 0)}) or [{}])[0]
        sm = t.get("SUMMA")
        conn.call_proc(Q.PKG_MAIN, "add_transaction",
                       [int(t.get("ID") or 0), str(t.get("DEBET") or ""), str(t.get("KREDIT") or ""),
                        float(sm) if sm is not None else 0.0, g.get("MF32A_DATE"), str(t.get("DESTINATION") or ""),
                        st["vbic"], str(g.get("TAX") or ""), 0], commit=False)

    done, _ = _run(sel, answers, one)
    conn.commit()
    return {"done": done, "message": None}
