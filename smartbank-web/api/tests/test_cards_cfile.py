"""Cards ▸ C File (cfilepas.pas Tcfile): preview, Bazaya Göndər, Təsdiq Et, sort, Excel."""
import base64

from fastapi.testclient import TestClient

from app.main import app
from app.db import mock as mock_db
from app.db import mock_cards as MC

client = TestClient(app)


def put(buf, pos, val):
    """1-based column pos as Delphi copy(STmessage, pos, n)."""
    while len(buf) < pos - 1 + len(val):
        buf.append(" ")
    for i, ch in enumerate(val):
        buf[pos - 1 + i] = ch


def msg(card, rbs, amount_cents, sign="D", cur="944", fee_cents=150, kind="TRN"):
    b = [" "] * 650
    put(b, 19, kind); put(b, 71, card.ljust(24)); put(b, 95, rbs.ljust(32)); put(b, 221, "000000000012345".ljust(24))
    put(b, 245, "20261019"); put(b, 253, "101500"); put(b, 259, sign); put(b, 260, cur); put(b, 266, cur)
    put(b, 269, str(amount_cents).rjust(15, "0")); put(b, 299, str(amount_cents).rjust(15, "0")); put(b, 314, sign)
    put(b, 315, str(fee_cents).rjust(15, "0")); put(b, 374, "ATM BAKU".ljust(30))
    return "".join(b)


def cfile():
    L = ["FH" + " " * 100, msg("4270010000000009", "38110019440000000001", 12345), msg("4270010000000009", "38110019440000000001", 500, "C"),
         msg("4270010000000010", "38110019440000000002", 100), "FT" + " " * 100]
    return ("\r\n".join(L) + "\r\n").encode("cp1254")


def P(path, body=None, code=200):
    r = client.post("/api/cards/cfile" + path, json=body or {})
    assert r.status_code == code, r.text
    return r.json() if r.headers.get("content-type", "").startswith("application/json") else r


def login():
    mock_db.reset(); MC.reset()
    assert client.post("/api/login", json={"username": "ADMIN", "password": "Admin#2026"}).status_code == 200
    return P("/open")


def upload(name="C0002.293", data=None):
    return P("/upload", {"name": name, "b64": base64.b64encode(data or cfile()).decode()})


def test_open_preview_and_load():
    v = login()
    assert [r["id"] for r in v["grid1"]] == [1, 2] and [r["id"] for r in v["grid2"]] == [3]
    r = P("/tobase")                                                    # no file: Items.Count = 0 -> Exit
    assert r.get("posts") == 0 and r["calls"] == [["card_main", "delete_trancaction_c", []]]
    upload()
    r = P("/tobase")                                                    # RichEdit empty -> Exit after UMUMI open
    assert r["posts"] == 0
    r = P("/refresh", {"refwithsel": False})
    txt = [x["text"] for x in r["rich"]]
    assert txt[0] == "FILE NAME            :< C0002.293 >   Message count: 3"
    assert "CONTRACT NUMBER      :4270010000000009" in txt and "TRANSACTION AMOUNT   :123,45            DEBET  AZN" in txt
    assert "FEE AMOUNT           :1,5" + " " * 21 + " AZN" in txt
    assert r["rich"][0]["marks"][0][2] == "clBlue" and any(m[2] == "clRed" for m in r["rich"][0]["marks"])
    r = P("/tobase")
    assert r["posts"] == 3 and r["messages"] == ["All messages are sent in base!"]
    assert ["card_main", "carxiv", ["C0002.293"]] in r["calls"]
    loaded = [x for x in r["grid1"] if x["file_name"] == "C0002.293"]
    assert len(loaded) == 3 and loaded[0]["trandate"].startswith("2026-10-19") and loaded[0]["tranamount"] == 123.45
    assert loaded[0]["feeamount"] == 1.5 and loaded[0]["status"] == 1 and loaded[0]["send"] == 0


def test_replace_question_and_confirm():
    login(); upload(); P("/refresh", {})
    P("/tobase")
    q = P("/tobase")
    assert q["ask"].startswith('The file "C0002.293" already exits') and q["answered"] == 0
    n = P("/tobase", {"answers": ["mrno"]})                                  # No -> Continue: nothing new
    assert n["posts"] == 0 and n["messages"] == ["All messages are sent in base!"]
    r = P("/tobase", {"answers": ["mryes"]})
    assert r["posts"] == 3
    assert len([x for x in r["grid1"] if x["file_name"] == "C0002.293"]) == 3
    c = P("/confirm", {"ids": [1, 2], "answers": ["no", "yes"]})
    assert c["confirmed"] == [2] and c["messages"] == ["Əməliyyatlar günün sənədlərinə göndərildi!"]
    assert 2 in [x["id"] for x in c["grid2"]]
    assert P("/confirm", {"ids": [1], "answers": ["cancel"]})["confirmed"] == []
    assert P("/excel").content[:2] == b"PK"


def test_bad_number_stops_preview():
    login()
    lines = cfile().decode("cp1254").split("\r\n")
    l1 = list(lines[1]); l1[268:283] = list("0000000000ABCDE"); lines[1] = "".join(l1)
    upload(data="\r\n".join(lines).encode("cp1254"))
    r = P("/refresh")
    assert "is not a valid floating point value" in r["error"] and r["rich"][0]["text"].startswith("FILE NAME")


def test_interpreter_local_record_array():
    """pascal.py: 'type T = record .. end;' + 'array[1..n] of T' (cfilepas.pas ToolButton3Click Tclient, RefwithSel branch)."""
    from app import pascal as P
    u = P.Unit("""procedure X.Go(Sender: TObject);
type Tc = record
  a:string;
  n:Real;
  end;
var C : array[1..100] of Tc;
    i:integer;
begin
for i:=1 to 3 do begin C[i].a:='x'+inttostr(i); C[i].n:=C[i].n+i; end;
Edit1.Text:=C[2].a+'/'+floattostr(C[3].n)+'/'+C[7].a+'|';
end;
""")
    from app.azips_files import Module
    e = P.Sink("Edit1")
    P.Routine(u, "x.go", Module({"edit1": e}), {"inttostr": lambda v: str(int(v)), "floattostr": lambda v: P.float_to_str(v)}).invoke([None])
    assert e.props["text"] == "x2/3/|"
