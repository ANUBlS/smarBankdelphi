"""SBDM_Prolongation_new - api/app/dep_prolong.py."""
import io
import openpyxl
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


def test_open_add_delete():
    c = cl()
    o = post(c, "/api/deposits/prolong/open", contract_id=5002)
    assert o["closedate"] == "2026-08-03" and [x["olddate"][:10] for x in o["rows"]] == ["2026-05-03"]
    a = post(c, "/api/deposits/prolong/add/open", contract_id=5002)
    assert a["newdate"] == "2026-10-12"
    assert post(c, "/api/deposits/prolong/add", code=400, contract_id=5002, newdate="2026-08-03")["detail"]["key"] == "deposits.p_err_date"
    r = post(c, "/api/deposits/prolong/add", contract_id=5002, newdate="2027-02-03")
    assert r["closedate"] == "2027-02-03" and r["rows"][-1]["olddate"][:10] == "2026-08-03" and r["rows"][-1]["hdate"][:10] == "2026-10-12"
    r = post(c, "/api/deposits/prolong/delete", contract_id=5002)
    assert r["closedate"] == "2026-08-03" and len(r["rows"]) == 1


def test_empty_disables_and_export():
    c = cl()
    assert post(c, "/api/deposits/prolong/delete", code=400, contract_id=5001)["detail"]["key"] == "deposits.m_err_disabled"
    assert c.post("/api/deposits/prolong/export.xlsx", json={"contract_id": 5001}).status_code == 400
    x = c.post("/api/deposits/prolong/export.xlsx", json={"contract_id": 5002}); assert x.status_code == 200
    ws = openpyxl.load_workbook(io.BytesIO(x.content)).active
    assert ws.title == "Prolonqasiya" and [v.value for v in ws[1]] == ["№", "Tarix", "Əvvəlki tarix", "Yeni tarix"]
    assert post(c, "/api/deposits/prolong/open", code=400)["detail"]["key"] == "deposits.err_no_deposit"


def test_rights():
    d = cl("DEPOSITOR", "Depositor#2026")
    assert "NEW_SBCM_PROLONGATION" in post(d, "/api/deposits/prolong/open", code=400, contract_id=5002)["detail"]["ora"]


def test_wrsetup_on_hold():
    c = cl()
    assert post(c, "/api/deposits/plugin/sett_wrsetup")["on_hold"] is True
