"""SBDM_PartialPayment_new - api/app/dep_partial.py."""
import pytest
from fastapi.testclient import TestClient
from app import main, sessions
from app.db import mock


@pytest.fixture(autouse=True)
def fresh():
    mock.reset(); sessions.attempts._f.clear(); sessions.store._s.clear(); yield


def cl(u="ADMIN", p="Admin#2026"):
    c = TestClient(main.app); assert c.post("/api/login", json={"username": u, "password": p}).status_code == 200; return c


def post(c, url, code=200, **b):
    r = c.post(url, json=b); assert r.status_code == code, r.text; return r.json()


def test_open_and_add_form():
    c = cl()
    o = post(c, "/api/deposits/partial/open", contract_id=5001)
    assert o["name"].startswith("Əliyev") and o["rows"][0]["total"] == 10000 and "rowid" not in o["rows"][0]
    a = post(c, "/api/deposits/partial/add/open", contract_id=5001, item_id=o["rows"][0]["id"])
    assert a["tek_dat"] == "12.10.2026" and a["creditacc"] == "3811944005001" and a["debitacc"] == "21160944005001"
    assert a["percentacc"] == "2119944005001" and a["total"] == 10000 and (a["main"], a["rest"], a["interest"]) == (0, 0, 0)


def test_rights():
    d = cl("DEPOSITOR", "Depositor#2026")
    assert "NEW_SBCM_PARTIAL_PEYMENT" in post(d, "/api/deposits/partial/open", code=400, contract_id=5001)["detail"]["ora"]
