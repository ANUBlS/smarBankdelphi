"""Off-balance balance group (Packages/Out_Balance, Out_todaybalance, Out_BalanceAnalys)."""
from fastapi.testclient import TestClient
from app.main import app
from app.db import mock as mock_db
from app import bal_logic as L, out_tb_sql as OTQ

client = TestClient(app)
W = {"beg": "2026-10-05", "end": "2026-10-09"}
OUT = {9101, 9201, 9301, 9901}


def login():
    mock_db.reset()
    assert client.post("/api/login", json={"username": "ADMIN", "password": "Admin#2026"}).status_code == 200


def test_out_balance_only_off_balance_accounts_and_no_settings():
    login()
    assert client.get("/api/out-balance/init").json()["settings_edit"] is False
    r = client.post("/api/out-balance/run", json={**W, "branches": [101, 102]})
    assert r.status_code == 200, r.text
    assert {x["bal_cn"] for x in r.json()["report"]["rows"]} <= OUT
    assert client.get("/api/out-balance/comp/settings").status_code == 403


def test_out_today_sql_placeholders_are_noops():
    """Lines without %s survive Format unchanged: always out_archost, AccountData always ostat."""
    s = L.tb_balance_sql(OTQ.SQL_OTB_BALANCEDATA, 0, -1, "", "Pok_", True)
    assert "out_archost" in s and "tenostat" not in s.lower()
    a = L.tb_account_sql(OTQ.SQL_OTB_ACCOUNTDATA, 0, -1, "Pok_", True)
    assert "pok_" not in a.lower() and "out_archost" in a
    assert "out_provarch" in L.tb_transactions_sql(OTQ.SQL_OTB_TRANSACTIONSDATA, True)


def test_out_today_uses_bank_work_date():
    login()
    r = client.post("/api/out-todaybalance/run", json={"date": "2026-10-10"})   # Saturday -> last Operkurs day
    assert r.status_code == 200, r.text
    assert r.json()["work_date"] == "09/10/2026"
    assert {x["accountnumber"] for x in r.json()["report"]["rows"]} == OUT
    r2 = client.post("/api/todaybalance/run", json={"date": "2026-10-10"})       # on-balance: picked date (H.R. 16.09.2012)
    assert r2.json()["report"]["rows"] == []


def test_out_analysis_no_balacc_and_bal_cn_only():
    login()
    assert client.get("/api/out-balanceanalys/init").json()["balacc"] is False
    r = client.post("/api/out-balanceanalys/refresh", json={**W, "branches": [101, 102], "balances": "9101"})
    assert [x["balanceaccount"] for x in r.json()["balance"]] == [9101]
    assert client.post("/api/out-balanceanalys/balacc", json={**W, "account_id": 50021}).status_code == 404
    tr = client.post("/api/out-balanceanalys/transactions", json={**W, "kind": "all", "account_id": 50021}).json()
    assert tr and all("kreditbalans" not in x for x in tr)
    from app import out_ba_sql as OBQ
    sql, _ = L.ba_balance_sql(OBQ.SQL_OBA_BALANCE, [101], [101], False, None, "9101", 0, 0, with_group=False)
    assert "b.bal_cn in (9101)" in sql and "accgroup in" not in sql
