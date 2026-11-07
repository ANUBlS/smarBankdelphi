"""SBDM_Capitalize_new - api/app/dep_capitalize.py."""
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


def test_open_add_run_commit():
    c = cl()
    o = post(c, "/api/deposits/capitalize/open", contract_id=5001, contract_no="DP-944-0001")
    assert o["caption"] == "DP-944-0001 nömrəli depozitin  kapitallaşdırılması" and o["rows"] == []
    assert o["info"]["contractaccno"] == "21160944005001" and o["info"]["interestaccno"] == "2119944005001"
    a = post(c, "/api/deposits/capitalize/add/open", contract_id=5001)
    assert a["date"] == "2026-10-12" and a["total"] == 0
    assert post(c, "/api/deposits/capitalize/run", code=400, contract_id=5001, total=0)["detail"]["key"] == "deposits.m_err_disabled"
    r = post(c, "/api/deposits/capitalize/run", contract_id=5001, total=100)
    assert r["caption"] == "Depozit karitallaşdırılması ..." and r["delayed"][0]["debitaccno"] == "2119944005001"
    post(c, "/api/deposits/delayed/finish", ok=True)
    o = post(c, "/api/deposits/capitalize/open", contract_id=5001)
    assert [x["total"] for x in o["rows"]] == [100] and o["info"]["facticalinterestdebt"] == 312.5


def test_delete_export_rights():
    c = cl()
    o = post(c, "/api/deposits/capitalize/delete", contract_id=5003, item_id=8001)
    assert o["rows"] == []
    assert "ORA-20106" in post(c, "/api/deposits/capitalize/delete", code=400, contract_id=5003, item_id=0)["detail"]["ora"]  # no OnUpdate
    assert c.post("/api/deposits/capitalize/export.xlsx", json={"contract_id": 5001}).status_code == 400
    mock.reset()
    c = cl()
    x = c.post("/api/deposits/capitalize/export.xlsx", json={"contract_id": 5003}); assert x.status_code == 200
    ws = openpyxl.load_workbook(io.BytesIO(x.content)).active
    assert ws.title == "Kapitallaşdırma" and [v.value for v in ws[1]] == ["№", "Tarix", "Məbləğ"]
    d = cl("DEPOSITOR", "Depositor#2026")
    assert "NEW_SBCM_CAPITALIZATION" in post(d, "/api/deposits/capitalize/open", code=400, contract_id=5001)["detail"]["ora"]
