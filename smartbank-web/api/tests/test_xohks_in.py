"""XÖHKS step 4 - IN file load (one uploaded file), ConvertToBase run verbatim by pascal.py, accept, delete."""
import base64
import os

from app import vcl
from tests.test_xohks_status import login, P, client

SAMPLE = open(os.path.join(os.path.dirname(__file__), "data", "xohks_in_sample.xml"), "rb").read()


def _load(name="in1.xml", data=SAMPLE):
    return P("/in/load", {"name": name, "b64": base64.b64encode(data).decode()})


def test_richedit_model():
    r = vcl.RichEdit({"f": b"\xef\xbb\xbfab\r\ncd\nef\r\n"})
    r.p_lines.m_loadfromfile("f")
    assert r.text == "ab\rcd\ref\r" and r.m_gettextlen() == 12
    assert r.m_findtext("cd", 0, 100) == 3 and r.m_findtext("cd", 4, 100) == -1 and r.m_findtext("cd", 0, 4) == -1
    r.p_selstart = 3; r.p_sellength = 2
    assert r.p_seltext == "cd" and r.p_caretpos.get("y") == 1 and r.p_lines.index(2) == "ef" and r.p_lines.index(9) == ""


def test_convert_inserts_each_message_and_rejects_second_time():
    login()
    assert _load()["files"] == ["in1.xml"]
    d = P("/in/convert", {"all": True})
    assert d["error"] is None and d["warnings"] == []
    ins = [c for c in d["calls"] if c[1] == "xs_incoming_insert"]
    assert len(ins) == 2
    a = ins[0][2]
    # v_reference, F20 (copy(line,26,7)), F21, val code, amount, sen acc / name / inn / code, bank id
    assert a[1:11] == ["XIN2610130001", "0000017", "BN000101", 0, 150.5, "AZ12NABZ01350100000000009001", "Mammadov Ali",
                       "1234567891", "ABC123", 1]
    assert a[11] == "AZ75NABZ01350100000000001944" and a[13] == 210005 and a[18] == "AZ21TURA38010019440000000001"
    assert a[19] == 0 and a[20] == "Aliyev Vali" and a[23] == 501 and a[25] == 101
    assert a[24] == "Odenis teyinati\rikinci setir"            # SelText keeps the RichEdit CR (chr(10) replace finds none)
    b = ins[1][2]
    assert b[3] == "BN000102" and b[4] == 840 and b[18] == "AZ65TURA38010019440000000002" and b[23] == 502 and b[25] == 102
    assert any(r["reference"] == "XIN2610130001" for r in d["rows"])
    d = P("/in/convert", {"all": False})
    assert d["warnings"] == ["Warning:  <in1.xml>   Artıq konvert olunub !"] and not d["calls"]


def test_convert_error_shown_not_committed():
    login()
    _load("bad.xml", SAMPLE.replace(b"AZN150,50", b"AZN150x50"))
    d = P("/in/convert", {"all": True})
    assert "is not a valid floating point value" in d["error"]
    assert P("/in/clear")["files"] == []


def test_accept_and_delete():
    login()
    _load("acc.xml", SAMPLE.replace(b"XIN2610130001", b"XIN2610130009"))
    rows = P("/in/convert", {"all": True})["rows"]
    new = [r for r in rows if r["reference"] == "XIN2610130009"]
    d = P("/in/accept", {"current": new[0]["id"], "selected": [new[1]["id"]]})
    assert sorted(d["accepted"]) == sorted(r["id"] for r in new)
    assert all(r["status"] == 1 for r in d["rows"] if r["reference"] == "XIN2610130009")
    old = [r for r in rows if r["trans_date"] != new[0]["trans_date"]]
    if old:
        assert P("/in/accept", {"current": old[0]["id"], "selected": []}, 400)
    rid = rows[0]["id"]
    f = P("/in/accept/prepare", {"current": rid})
    assert set(f) == {"edit1", "edit2"}
    plan = P("/in/delete/plan", {"current": rid, "selected": []})
    assert plan["ids"] == [rid]
    d = P("/in/delete", {"ids": plan["ids"], "answer": "no"})
    assert d["deleted"] == []
    d = P("/in/delete", {"ids": [rid, rows[1]["id"]], "answer": "yes"})
    assert d["deleted"] == [rid] and d["error"].startswith("List index")
    d = P("/in/delete", {"ids": [rows[1]["id"]], "answer": "all", "confirm_all": True})
    assert d["deleted"] == [rows[1]["id"]]
