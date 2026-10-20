"""SBDM_ApplyMoney_new / SBDM_ExtractMoney_new + TrDelayed_Show - api/app/dep_ops.py."""
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


def state(c, cid):
    return [x for x in post(c, "/api/deposits/list") ["rows"] if x["id"] == cid][0]


def test_apply_open_and_add_form():
    c = cl()
    o = post(c, "/api/deposits/apply/open", contract_id=5001)
    assert o["accid"] == 905001 and [x["acc_no"] for x in o["debit"]] == ["3811944005001"] and o["info"]["name"].startswith("Əliyev")
    a = post(c, "/api/deposits/apply/add", contract_id=5001)
    assert a["percent_text"] == "9" and a["counttransh"] >= 0 and a["date"] == "2026-10-12"


def test_apply_run_confirm_commits():
    c = cl()
    before = state(c, 5001)["facticaldebt"]
    a = post(c, "/api/deposits/apply/add", contract_id=5001)
    r = post(c, "/api/deposits/apply/run", contract_id=5001, accid=a["accid"], total=1500, percent_text=a["percent_text"], counttransh=a["counttransh"])
    assert r["caption"] == "Depozit yatrımı ..." and r["delayed"][0]["tramount"] == 1500 and r["delayed"][0]["creditaccno"] == "21160944005001"
    assert post(c, "/api/deposits/delayed/finish", ok=True)["committed"]
    assert state(c, 5001)["facticaldebt"] == before + 1500
    assert any(t["total"] == 1500 for t in post(c, "/api/deposits/apply/open", contract_id=5001)["tranches"])
    post(c, "/api/deposits/delayed/finish", code=400, ok=True)                  # nothing pending any more


def test_apply_dismiss_rolls_back_and_checks():
    c = cl()
    a = post(c, "/api/deposits/apply/add", contract_id=5001)
    post(c, "/api/deposits/apply/run", contract_id=5001, accid=a["accid"], total=10, percent_text="9", counttransh=0)
    post(c, "/api/deposits/delayed/finish", ok=False)
    assert all(t["total"] != 10 for t in post(c, "/api/deposits/apply/open", contract_id=5001)["tranches"])
    assert post(c, "/api/deposits/apply/run", code=400, contract_id=5001, total=10, percent_text="0")["detail"]["key"] == "deposits.m_err_percent0"
    assert post(c, "/api/deposits/apply/run", code=400, contract_id=5001, total=0, percent_text="9")["detail"]["key"] == "deposits.m_err_disabled"
    # contract 5004: checkedtranch = 0 on the first deposit; 5006: checkedaddtranch = 2 on a later one
    assert post(c, "/api/deposits/apply/run", code=400, contract_id=5004, total=10, percent_text="3", counttransh=0)["detail"]["key"] == "deposits.a_chk1_0"
    assert post(c, "/api/deposits/apply/run", code=400, contract_id=5006, total=10, percent_text="7", counttransh=1)["detail"]["key"] == "deposits.a_chk2_2"
    assert post(c, "/api/deposits/apply/run", contract_id=5006, total=10, percent_text="7", counttransh=0)["delayed"]   # check2 ignored on the first


def test_apply_delete_and_export():
    c = cl()
    o = post(c, "/api/deposits/apply/open", contract_id=5001)
    tid = o["tranches"][0]["id"]
    r = post(c, "/api/deposits/apply/delete", contract_id=5001, item_id=tid)
    assert r["pending"] and all(t["id"] != tid for t in r["tranches"])
    x = c.post("/api/deposits/apply/export.xlsx", json={"contract_id": 5002})
    assert x.status_code == 200
    ws = openpyxl.load_workbook(io.BytesIO(x.content)).active
    assert ws.title == "Depozit yatrımları" and [c.value for c in ws[1]] == ["Məbləğ", "Faiz", "Tarix", "Qeyd"]


def test_extract_flow_and_rights():
    c = cl()
    o = post(c, "/api/deposits/extract/add", contract_id=5001)
    assert o["custacc"]["contractaccno"] == "21160944005001" and o["accid"] is None            # client acc not an InternalBankAccs row
    assert [a["acc_no"] for a in o["accs"]] == ["1001840000001", "1001944000001"]
    st = state(c, 5001)
    r = post(c, "/api/deposits/extract/run", contract_id=5001, accid=100101, main=0, interest=10)
    assert r["caption"] == "Depozitin ödənilməsi ..." and r["delayed"][0]["debitaccno"] == "2119944005001"
    post(c, "/api/deposits/delayed/finish", ok=True)
    assert round(state(c, 5001)["facticalinterestdebt"], 2) == round(st["facticalinterestdebt"] - 10, 2)
    big = post(c, "/api/deposits/extract/run", code=400, contract_id=5001, accid=100101, main=10 ** 9, interest=0)
    assert "ORA-20103" in big["detail"]["ora"]
    pays = post(c, "/api/deposits/extract/open", contract_id=5001)["payments"]
    assert len(pays) == 2
    assert post(c, "/api/deposits/extract/delete", contract_id=5002, item_id=0, code=400)["detail"]["key"] == "deposits.m_err_disabled"
    d = cl("DEPOSITOR", "Depositor#2026")
    assert "NEW_SBCM_PEYMENT" in post(d, "/api/deposits/extract/open", code=400, contract_id=5001)["detail"]["ora"]
    assert "INSERT_SBCM_TRANSH" in post(d, "/api/deposits/apply/add", code=400, contract_id=5001)["detail"]["ora"]
