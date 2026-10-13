"""Cards ▸ Online Cards (onlinec.pas) and Karta Mədaxil (card_ufx.pas, arxivufx.pas)."""
from fastapi.testclient import TestClient

from app.main import app
from app.db import mock as mock_db
from app.db import mock_cards as MC

client = TestClient(app)


def login():
    mock_db.reset(); MC.reset()
    assert client.post("/api/login", json={"username": "ADMIN", "password": "Admin#2026"}).status_code == 200


def P(path, body=None, code=200):
    r = client.post("/api/cards" + path, json=body or {})
    assert r.status_code == code, r.text
    return r.json()


def test_online_grid_closed_and_prepare_form():
    login(); P("/clients/open")
    o = P("/online/open")
    assert o["rows"] == [] and o["cols"][:3] == ["ID", "STATUS", "CARDHOLDER"]          # Online_Cards never opened
    f = P("/clients/form", {"mode": "ONLINE"})
    assert f["mode"] == "ONLINE" and f["fields"]["Edit15"] == "" and f["fields"]["ComboBox4"] == ""
    assert f["fields"]["Edit19"] == "BAKU" and f["fields"]["Edit21"] == "AZE" and f["fields"]["ComboBox12"] == "CARD OK"


def test_ufx_list_refresh_and_archive():
    login()
    P("/ufx/refresh", code=409)
    r = P("/ufx/open")
    assert [x["id"] for x in r["rows"]] == [1, 2, 3] and r["status_img"] == {"0": 13, "1": 3, "2": 3, "3": 0}
    assert r["cols"][1] == "" and r["titles"]["OP_DATE"] == "Tarixi"
    a = P("/ufx/arxiv/open")
    assert a["begdat"] == "2017-10-18" and a["rows"] == []
    a = P("/ufx/arxiv/refresh", {"begdat": "2017-10-18", "enddat": "2017-10-18"})
    assert [x["id"] for x in a["rows"]] == [11, 12]
