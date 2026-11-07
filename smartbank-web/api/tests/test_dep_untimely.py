"""SBDM_UntimelyEtMoney_new - api/app/dep_untimely.py."""
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


def test_open():
    o = post(cl(), "/api/deposits/untimely/open", contract_id=5002, contract_no="DP-840-0002")
    assert o["caption"] == "DP-840-0002 nömrəli depozitin vaxtından əvvəl ödənilməsi"
    assert o["depositacc"]["acc_no"] == "3400840000001" and o["calcdate"] == "2026-02-03" and o["bankdate"] == "2026-10-12"
    assert o["info"]["closedate"][:10] == "2026-05-03"            # SBCMGetOldDate: before the prolongation
    assert o["info"]["overdueannualint"] == 1 and o["full"] is False


def test_run_confirm_closes_deposit():
    c = cl()
    r = post(c, "/api/deposits/untimely/run", contract_id=5001, calcdate="2026-01-15", full=False)
    assert r["caption"] == "Depozitin vaxtından əvvəl ödənilməsi ..." and r["delayed"][0]["creditaccno"] == "3400944000001"
    assert len(r["delayed"]) == 2
    post(c, "/api/deposits/delayed/finish", ok=True)
    row = [x for x in post(c, "/api/deposits/list")["rows"] if x["id"] == 5001][0]
    assert row["facticaldebt"] == 0


def test_full_interest_dismiss_and_cancel():
    c = cl()
    r = post(c, "/api/deposits/untimely/run", contract_id=5001, calcdate="2026-01-15", full=True)
    assert r["delayed"][1]["tramount"] == 412.5
    post(c, "/api/deposits/delayed/finish", ok=False)
    assert post(c, "/api/deposits/untimely/cancel")["ok"]
    assert post(c, "/api/deposits/untimely/run", code=400, calcdate="2026-01-15")["detail"]["key"] == "deposits.err_no_deposit"


def test_right():
    d = cl("DEPOSITOR", "Depositor#2026")
    assert "NEW_SBCM_UNTIMELY" in post(d, "/api/deposits/untimely/open", code=400, contract_id=5001)["detail"]["ora"]
