"""Cards ▸ Əməliyyat file forms run through cards_fileops (verbatim Yenilə / Bazaya Göndər, Təsdiq Et loop, Excel, sort)."""
import base64

from fastapi.testclient import TestClient

from app.main import app
from app.db import mock as mock_db
from app.db import mock_cards as MC
from tests import fo_files as FF

client = TestClient(app)


def P(path, body=None, code=200):
    r = client.post("/api/cards/fo" + path, json=body or {})
    assert r.status_code == code, r.text
    return r.json() if r.headers.get("content-type", "").startswith("application/json") else r


def login(form):
    mock_db.reset(); MC.reset()
    assert client.post("/api/login", json={"username": "ADMIN", "password": "Admin#2026"}).status_code == 200
    return P(f"/{form}/open")


def up(form, name, data):
    return P(f"/{form}/upload", {"name": name, "b64": base64.b64encode(data).decode()})


def test_dxxx():
    v = login("dxxx")
    assert v["grid1"] is None and v["grid2"] is None                  # dxxx / dxxx2 not Active at design time
    r = P("/dxxx/refresh")
    assert r["messages"] == ["There is not file (D_XXX) in the directory 'C:\\AZCARD\\IN'"]
    up("dxxx", "DTUR_XXX.293", FF.dxxx())
    r = P("/dxxx/refresh")
    txt = [x["text"] for x in r["rich"]]
    assert txt[0] == "FILE NAME            :< DTUR_XXX.293 >   " and r["messages"] == []
    assert "MERCHANT             :000777" in txt and "AMOUNT               :12.50" in txt and "CURRENCY             :944" in txt
    assert "TYPE                 :Issuing" in txt and "CURRENCY             :840" in txt and txt.count("TYPE                 :Acquiring") == 2
    assert r["rich"][0]["marks"] and r["rich"][0]["marks"][0][2] == "clRed"
    r = P("/dxxx/tobase")
    assert r["messages"] == ["All records send to base!"] and r["error"] is None
    ins = [c for c in r["calls"] if c[1] == "Insert_dxxx"]
    assert len(ins) == 3 and ins[0][2] == ["TURANBANK", "944", "19.10.26", "000777", "12.50", "0.10", "T0100", "Acquiring", "Purchase",
                                           "DTUR_XXX.293", "507699", "BAKU MALL", "AB12CD"]
    assert r["calls"][0] == ["card_main", "delete_dxxx", []] and r["calls"][-1] == ["card_main", "dxxarxiv", ["DTUR_XXX.293"]]
    assert len(r["grid1"]) == 4
    new = [x["id"] for x in r["grid1"] if x["status"] == 1]
    c = P("/dxxx/confirm", {"ids": new, "answers": ["yes", "all"]})
    assert c["confirmed"] == new and c["messages"] == ["Əməliyyat günün sənədlərinə göndərildi!"] and len(c["grid2"]) == 4
    x = P("/dxxx/excel")
    assert x.content[:2] == b"PK"


def test_dxxx_wrong_prefix_and_ext():
    login("dxxx")
    up("dxxx", "DABC_XXX.293", FF.dxxx())
    assert P("/dxxx/refresh")["messages"] == ["There is not file (D_XXX) in the directory 'C:\\AZCARD\\IN'"]
    up("dxxx", "DTUR_XXX.txt", FF.dxxx())                      # CheckFileExt: only digits and '.'
    assert P("/dxxx/refresh")["messages"] == ["There is not file (D_XXX) in the directory 'C:\\AZCARD\\IN'"]


def test_sms():
    v = login("sms")
    assert v["grid1"] is None and v["grid2"] is None                  # smsfiles / smsfiles2 not Active at design time
    up("sms", "SMS0001.293", FF.sms())
    r = P("/sms/refresh")
    txt = [x["text"] for x in r["rich"]]
    assert txt[0] == "FILE NAME            :< SMS0001.293 >   Message count: 3"
    assert "TERMINAL NAME        :BAKU MALL ATM" in txt and "AMOUNT SETTLEMENT    :5.80" in txt and "GANJA POS" not in " ".join(txt)
    r = P("/sms/tobase")
    ins = [c for c in r["calls"] if c[1] == "Insert_SMS_Messages"]
    assert [c[1] for c in r["calls"][:2]] == ["empty_sms_messages", "empty_sms_messages"] and len(ins) == 2
    assert ins[0][2] == ["BAKU MALL ATM", "4270010000000009", "T0100", "AB12CD", "25.00", "18-OCT-26", "944", "19-OCT-26", "25.00", "SMS0001.293"]
    assert ["card_main", "smsarxiv", ["SMS0001.293"]] in r["calls"] and r["messages"] == ["All messages have sent into base"]
    assert len(r["grid1"]) == 2 and len(r["grid2"]) == 1
    s = P("/sms/sort", {"grid": "grid1", "field": "AMOUNTSET"})
    assert [x["amountset"] for x in s["grid1"]] == ["25.00", "5.80"]
    c = P("/sms/confirm", {"ids": [s["grid1"][0]["id"]], "answers": ["yes"]})
    assert c["messages"] == [] and len(c["grid2"]) == 2 and len(c["grid1"]) == 1


def test_intretail():
    login("intretail")
    up("intretail", "INT_I_0001.293", FF.intretail())
    r = P("/intretail/refresh")
    assert r["error"] is None and any("AMAZON" in x["text"] for x in r["rich"])
    r = P("/intretail/tobase")
    ins = [c[2] for c in r["calls"] if c[1] == "Insert_IntRetail"]
    assert r["error"] is None and len(ins) == 2
    assert ins[0] == ["POS", "Purchase", "Accepted", "840", "944", "AMAZON", "4270010000000009", "18.10.26", "AA11", "10.00", "17.00", "0.20", "17.00",
                      "TRM00001", "INT_I_0001.293"]
    assert ["card_main", "intarxiv", ["INT_I_0001.293"]] in r["calls"]
    c = P("/intretail/confirm", {"ids": [x["id"] for x in r["grid1"]], "answers": ["all"]})
    assert c["messages"] == ["Əməliyyatlar günün sənədlərinə göndərildi!!"] and len(c["grid2"]) == 3


def test_rvisa_open_runs_formpaint():
    v = login("rvisa")
    assert v["calls"] == [["card_main", "rvisa_delete", []]] and v["grid1"] == []      # FormPaint: rvisa_delete + reopen
    assert P("/rvisa/refresh")["error"] is None
    P("/rvisa/excel")


def test_dfile():
    login("dfile")
    up("dfile", "D5076001.293", FF.dfile())
    r = P("/dfile/tobase")                                  # copy(name, 0, 5) <> 'D' + BANKID ('D507699'): every file is skipped
    assert [c[1] for c in r["calls"]] == ["delete_dfiles"] and len(r["grid1"]) == 0
    MC._db().execute("update card_settings set BANKID = '5076'")
    r = P("/dfile/tobase")
    ins = [c[2] for c in r["calls"] if c[1] == "insert_dfiles"]
    assert r["error"] is None and len(ins) == 2 and ins[0][5] == "KAPITAL BANK" and ins[0][25] == "944" and ins[0][26:] == ["D5076001.293", 1]
    assert ["card_main", "darxiv", ["D5076001.293"]] in r["calls"] and len(r["grid1"]) == 2
    n = P("/dfile/confirm", {"answers": ["no"]})
    assert n["confirmed"] == [] and len(n["grid1"]) == 2
    y = P("/dfile/confirm", {"answers": ["yes"]})
    assert len(y["grid1"]) == 0 and len(y["grid2"]) == 3
