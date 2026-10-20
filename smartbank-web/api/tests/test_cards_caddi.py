"""Cards ▸ C File ▸ XML Göndər (cfile_addi.pas TAdditional_cfile)."""
import base64

from fastapi.testclient import TestClient

from app.main import app
from app.db import mock as mock_db
from app.db import mock_cards as MC

client = TestClient(app)

XML = """<?xml version="1.0" encoding="UTF-8"?>
<AnalyticTransfer>
 <DocTransList>
  <DocDetails><DocID>7001</DocID>
   <SynteticTransList>
    <SyntheticDoc><TransferedAmount><GMTrCurrency>840</GMTrCurrency></TransferedAmount><AccountAmount><GMCurrency>944</GMCurrency><GMAmount>42,50</GMAmount></AccountAmount></SyntheticDoc>
    <SyntheticDoc><TransferedAmount><GMTrCurrency>944</GMTrCurrency></TransferedAmount><AccountAmount><GMCurrency>944</GMCurrency><GMAmount>1,00</GMAmount></AccountAmount></SyntheticDoc>
   </SynteticTransList></DocDetails>
  <DocDetails><DocID>7005</DocID>
   <SynteticTransList>
    <SyntheticDoc><TransferedAmount><GMTrCurrency>978</GMTrCurrency></TransferedAmount><AccountAmount><GMCurrency>840</GMCurrency><GMAmount>3,10</GMAmount></AccountAmount></SyntheticDoc>
   </SynteticTransList></DocDetails>
 </DocTransList>
</AnalyticTransfer>"""


def P(path, body=None, code=200):
    r = client.post("/api/cards" + path, json=body or {})
    assert r.status_code == code, r.text
    return r.json()


def login():
    mock_db.reset(); MC.reset()
    assert client.post("/api/login", json={"username": "ADMIN", "password": "Admin#2026"}).status_code == 200
    P("/cfile/open")
    return P("/caddi/open")


def test_open_refresh_sort():
    v = login()
    assert v["grid1"] is None and v["grid2"] is None                 # caddi / c_add_ar not Active at design time
    r = P("/caddi/refresh")
    assert [x["id"] for x in r["grid1"]] == [1, 2] and [x["id"] for x in r["grid2"]] == [3]   # begdat = trunc(sysdate)
    r = P("/caddi/sort", {"field": "AMMOUNT"})
    assert [x["id"] for x in r["grid1"]] == [2, 1] and not r.get("error")
    r = P("/caddi/sort", {"field": "ID"})                            # the first ORDER BY line stays: ORA-00933
    assert "ORA-00933" in r["error"]


def test_load_and_confirm():
    login()
    r = P("/caddi/load")
    assert r["error"].startswith("Cannot open file") and r["calls"] == []
    P("/caddi/upload", {"name": "a.xml", "b64": base64.b64encode(XML.encode()).decode()})
    r = P("/caddi/load")
    assert r["error"] is None
    assert r["calls"] == [["multi_del", ["7001"]], ["multi_ins", ["7001", "42,50", 944]], ["multi_del", ["7005"]], ["multi_ins", ["7005", "3,10", 840]]]
    assert r["memo"][:4] == ["#" * 20, "42,50", "*" * 20, "7001"]
    assert sorted(x["docid"] for x in r["grid1"]) == [7001, 7002, 7005]
    ids = [x["id"] for x in r["grid1"]]
    c = P("/caddi/confirm", {"ids": ids[:2], "answers": ["no", "yes"]})
    assert c["confirmed"] == [ids[1]] and c["messages"] == ["Əməliyyatlar günün sənədlərinə göndərildi!"]
    assert ids[1] in [x["id"] for x in c["grid2"]]


def test_bad_integer_stops():
    login()
    bad = XML.replace("<GMTrCurrency>978</GMTrCurrency>", "<GMTrCurrency>x</GMTrCurrency>")
    P("/caddi/upload", {"name": "a.xml", "b64": base64.b64encode(bad.encode()).decode()})
    r = P("/caddi/load")
    assert r["error"] == "'x' is not a valid integer value" and r["calls"][-1] == ["multi_del", ["7005"]]
