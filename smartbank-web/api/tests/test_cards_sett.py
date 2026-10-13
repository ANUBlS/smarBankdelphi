"""Cards ▸ Sazlama (setac.pas TForm10) + balhs / comp / datclose / paymentsett."""
from fastapi.testclient import TestClient

from app.main import app
from app.db import mock as mock_db
from app.db import mock_cards as MC

client = TestClient(app)


def login():
    mock_db.reset(); MC.reset()
    assert client.post("/api/login", json={"username": "ADMIN", "password": "Admin#2026"}).status_code == 200


def P(path, body=None, code=200):
    r = client.post("/api/cards/sett" + path, json=body or {})
    assert r.status_code == code, r.text
    return r.json()


def test_list_filter_sort_dispatch():
    login()
    P("/filter", {"edit": 1, "text": "1"}, 409)
    r = P("/open")
    assert len(r["rows"]) == 14 and r["forms"]["12"] == {"form": "paymentsett", "ported": True, "dblclick": False}
    f = P("/filter", {"edit": 1, "text": "1"})                       # numeric ID vs '1*': tdataset_filter rules (unverified)
    assert f["filter"] == "id = '1*'"
    assert [x["id"] for x in P("/filter", {"edit": 2, "text": "Kart"})["rows"]] == [3, 11]
    P("/filter", {"edit": 2, "text": ""})
    r = client.post("/api/cards/sett/sort", json={"field": "SAZLAMALAR"})     # second ORDER BY: ORA-00933 as in Delphi
    assert r.status_code >= 400 and "ORA-00933" in r.text


def test_balhs_add_delete():
    login(); P("/open")
    r = P("/balhs/open")
    assert r["balspr"] == ["19440", "19840"] and len(r["rows"]) == 2
    P("/balhs/add", {"balans": "19440", "hes": "x"}, 400)
    r = P("/balhs/add", {"balans": "30000", "hes": "2"})
    new = [x for x in r["rows"] if x["balans"] == "30000"][0]
    assert new["hes"] == 2
    assert len(P("/balhs/delete", {"rowid": new["rowid"], "confirmed": False})["rows"]) == 3
    assert len(P("/balhs/delete", {"rowid": new["rowid"], "confirmed": True})["rows"]) == 2


def test_comp_datclose_paymentsett():
    login(); P("/open")
    r = P("/comp/add", {"name": "new co?ş"})
    assert "NEW CO" in [x["company_name"] for x in r["rows"]]
    assert P("/datclose/open")["dateclose"] == 30
    assert P("/datclose/save", {"value": "45", "confirmed": False})["dateclose"] == 30
    assert P("/datclose/save", {"value": "45", "confirmed": True})["dateclose"] == 45
    v = P("/paymentsett/open")["rows"]
    assert [x["vidop"] for x in v] == ["77"]
    v = P("/paymentsett/apply", {"op": "insert", "id": 2, "vidop": "88"})["rows"]
    v = P("/paymentsett/apply", {"op": "update", "rowid": v[1]["rowid"], "id": 2, "vidop": "89"})["rows"]
    assert [x["vidop"] for x in v] == ["77", "89"]
    v = P("/paymentsett/apply", {"op": "delete", "rowid": v[1]["rowid"]})["rows"]
    assert len(v) == 1
