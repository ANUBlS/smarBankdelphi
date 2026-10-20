"""Cards ▸ Kliring (klirinqUnit), Limitlər (limittur), Excel yükləmələr list (Unitexcel)."""
from fastapi.testclient import TestClient

from app.main import app
from app.db import mock as mock_db
from app.db import mock_cards as MC

client = TestClient(app)


def P(path, body=None, code=200):
    r = client.post("/api/cards" + path, json=body or {})
    assert r.status_code == code, r.text
    return r.json() if r.headers.get("content-type", "").startswith("application/json") else r


def login():
    mock_db.reset(); MC.reset()
    assert client.post("/api/login", json={"username": "ADMIN", "password": "Admin#2026"}).status_code == 200


def test_kliring():
    login()
    v = P("/kliring/open")
    assert v["grid1"] == [] and [x["bankname"] for x in v["grid2"]] == ["AZER TURK"] and v["grid2"][0]["hesab1"]
    r = P("/kliring/tobase")
    assert [x["bankid"] for x in r["grid1"]] == ["NBAZ", "PAHA"]
    s = P("/kliring/sort", {"grid": "grid1", "field": "MEBLEQ"})
    assert [x["mebleq"] for x in s["grid1"]] == [25.5, 150]
    n = P("/kliring/confirm", {"yes": False})
    assert len(n["grid1"]) == 2
    y = P("/kliring/confirm", {"yes": True})
    assert y["grid1"] == [] and len(y["grid2"]) == 3
    P("/kliring/tobase"); d = P("/kliring/delete")
    assert d["grid1"] == []
    assert P("/kliring/excel", {"grid": "grid2", "field": ""}).content[:2] == b"PK"
    assert P("/kliring/close")["ok"]


def test_limits_and_excel_list():
    login()
    v = P("/limits/open")
    assert [x["id"] for x in v["grid1"]] == [1] and [x["id"] for x in v["grid2"]] == [2]
    c = P("/limits/confirm")
    assert c["grid1"] == [] and len(c["grid2"]) == 2 and c["messages"] == ["Limitlər daxil edildi!"]
    e = P("/excelforms/open")
    assert [x["id"] for x in e["grid"]] == [1, 2, 3, 4]
    assert P("/excelforms/pick", {"id": 3})["form"] == "prolongationxls" and P("/excelforms/pick", {"id": 9})["form"] is None
