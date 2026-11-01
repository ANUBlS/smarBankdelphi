"""PCustService_irshad port (custservice.py) against the offline mock."""
import pytest
from fastapi.testclient import TestClient
from app import main, sessions, custservice as cs
from app.db import mock, mock_cs

B = "/api/custservice"


@pytest.fixture(autouse=True)
def fresh():
    mock.reset(); sessions.attempts._f.clear(); sessions.store._s.clear(); yield


def cl(u="TELLER", p="Teller#2026"):
    c = TestClient(main.app); assert c.post("/api/login", json={"username": u, "password": p}).status_code == 200; return c


NEW1 = {"type1": 1, "type": 1, "EditPINCode1": "NEWPIN1", "CBoxDocType1": 1, "EditDocSerie1": "AA",
        "EditDocNumber1": "999", "Eh3": 1, "id_quality": 1, "Resident": 1}


def test_rights_enforced():
    assert cl("ACCOUNTANT", "Accountant#2026").get(B + "/init").status_code == 403


def test_init_and_lookups():
    c = cl(); r = c.get(B + "/init").json()
    assert {"comp", "req", "lookups", "required_by_type"} <= set(r)
    assert r["lookups"]["data"] and r["lookups"]["combos"]
    cities = c.get(B + "/lookup/Odscities?value=31").json()
    assert cities and all(x["COUNTRY_ID"] == 31 for x in cities)
    assert "dat" in c.get(B + "/months?risk=2").json()
    assert isinstance(c.get(B + "/required?cust_type=1").json(), dict)


def test_search():
    c = cl()
    r = c.post(B + "/search", json={"f": {"type": 1}}).json(); assert r["rows"]
    r = c.post(B + "/search", json={"f": {"type": 1, "EditPINCode1": "NOPE-NOPE"}}).json()
    assert r["rows"] == [] and r["msg"]


def test_detail_fill_and_mirrors():
    c = cl()
    d = c.get(B + "/cust/1001").json(); f = d["f"]
    assert f["EditEmail"] == "info" and f["Edit1"] == "kaspianlog.az" and f["type"] == 0
    assert {"group_info", "bank_stetment", "related", "tipacc", "samely"} <= set(d)
    f = c.get(B + "/cust/1002").json()["f"]   # EditPINCode1Change / EditDocSerieChange / EditFullNameChange
    assert f["EditPINCode1"] == f["EditPINCode"] == "5ABC123" and f["EditDocSerie1"] == "AZE"
    assert f["Edit10"] == f["EditFullName"]


def test_continue_validation_and_success():
    c = cl()
    r = c.post(B + "/continue", json={"f": {"type1": 1}}).json(); assert r["kind"] == "msg" and "Pinkod" in r["msg"]
    r = c.post(B + "/continue", json={"f": NEW1}).json(); assert r["ok"] and r["type"] == 1 and r["tab"] == "TabSheet1"


def test_add_confirm_then_black():
    c = cl()
    g = {**c.get(B + "/cust/1002").json()["f"], **NEW1, "EditPINCode": "NEWPIN1", "EditDocSerie": "AA", "EditDocNumber": "999"}
    r = c.post(B + "/add", json={"f": g}).json(); assert r["kind"] == "confirm"
    assert c.post(B + "/add", json={"f": g, "confirm": True}).json()["ok"]
    h = {**g, "EditPINCode1": "NEWPIN2", "EditPINCode": "NEWPIN2", "EditDocNumber1": "998", "EditDocNumber": "998"}
    mock_cs._cs["blacklist"].append(f'{h["EditLastName"]} {h["EditFirstName"]} {h["EditPatronymic"]}')
    r = c.post(B + "/add", json={"f": h, "confirm": True}).json(); assert r["kind"] == "black"
    assert c.post(B + "/add", json={"f": h, "confirm": True, "black_ok": True}).json()["ok"]


def test_edit_and_close():
    c = cl(); f = c.get(B + "/cust/1002").json()["f"]
    assert c.post(B + "/edit", json={"f": f, "row_id": 1002}).json()["kind"] == "confirm"
    assert c.post(B + "/edit", json={"f": f, "row_id": 1002, "confirm": True}).json()["ok"]
    assert c.post(B + "/close/1003").json()["kind"] == "confirm"
    assert c.post(B + "/close/1003?confirm=true").json()["ok"]


@pytest.mark.parametrize("kind", [1, 2, 3])
def test_relations(kind):
    c = cl()
    r = c.post(B + "/rel", json={"custid": 1002, "custid2": 1003, "kind": kind}).json()
    assert r.get("ok") or r.get("kind") in ("msg", "confirm")
    r = c.post(B + f"/rel/delete?confirm=true", json={"custid": 1002, "custid2": 1003, "kind": kind})
    assert r.status_code == 200


def test_side_dialogs():
    c = cl()
    assert c.get(B + "/credits/1002?cust_phys=1&cust_fs=1").status_code == 200
    assert c.get(B + "/deposits/1002?cust_phys=1&cust_fs=1").status_code == 200
    assert c.get(B + "/business-ops/1006?cust_type=4&bdat=2026-01-01&edat=2026-10-12").status_code == 200
    r = c.post(B + "/pep?name=Elçin&surname=Məmmədov").json(); assert "ok" in r and "line" in r
    assert [x["ID"] for x in c.get(B + "/picker?col=2&text=məmm").json()] == [1002]
    assert c.get(B + "/picker?col=2&text=Kaspian").json() == []   # FormCustomers: cust_type in (1,2,3,4) only


def test_fin_bad_verbatim():
    assert cs.fin_bad("AZE", "123456") and not cs.fin_bad("AZE", "1234567")
    assert not cs.fin_bad("MY", "12345") and cs.fin_bad("DY", "1234")
