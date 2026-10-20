"""Sbdm_Shedule_new - api/app/dep_shedule.py."""
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


def test_open_shows_dm_fields_and_rows():
    o = post(cl(), "/api/deposits/shedule/open", contract_id=5003, contract_no="DP-944-0003")
    assert o["caption"] == "DP-944-0003 № li müqavilə üçün ödəmə planı."
    assert (o["amount"], o["interest"], o["opendate"], o["closedate"]) == ("50000", "10", "10.03.2026", "10.03.2027")
    assert o["name"] and [r["seqno"] for r in o["rows"]] == [1, 2] and "rowid" not in o["rows"][0]


def test_plan_open_and_accept():
    c = cl()
    p = post(c, "/api/deposits/shedule/plan/open", contract_id=5001)
    assert p == {"date": "2010-04-23", "amount": 900, "periods": "12", "time": "21:40:02", "save_enabled": True}
    r = post(c, "/api/deposits/shedule/plan/accept", contract_id=5001, date="2026-02-15", amount=900, periods="12", time="21:40:02")
    assert len(r["rows"]) == 12 and r["rows"][0]["hdate"][:10] == "2026-02-15" and r["rows"][0]["ipinterest"] == 75


def test_plan_type_without_dateinterval_and_int_error():
    c = cl()
    p = post(c, "/api/deposits/shedule/plan/open", contract_id=5002)       # type 2 DATEINTERVAL = 0 -> OracleDataSet3 empty
    assert p["periods"] == ""
    e = post(c, "/api/deposits/shedule/plan/accept", code=400, contract_id=5002, date="2026-02-15", amount=1, periods="")
    assert e["detail"]["key"] == "deposits.s_err_int"
    assert post(c, "/api/deposits/shedule/open", code=400)["detail"]["key"] == "deposits.err_no_deposit"


def test_migrated_no_right():
    d = cl("DEPOSITOR", "Depositor#2026")
    assert post(d, "/api/deposits/plugin/shedule")["migrated"] is True
    assert post(d, "/api/deposits/shedule/open", contract_id=5001)["rows"] == []
