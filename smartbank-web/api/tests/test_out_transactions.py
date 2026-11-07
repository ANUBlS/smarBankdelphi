"""Off-balance transactions (Packages/Out_transaction_manager)."""
from fastapi.testclient import TestClient
from app.main import app
from app.db import mock as mock_db

client = TestClient(app)


def login():
    mock_db.reset()
    r = client.post("/api/login", json={"username": "ADMIN", "password": "Admin#2026"})
    assert r.status_code == 200, r.text
    return r


def test_init_and_list():
    login()
    r = client.get("/api/out-transactions/init")
    assert r.status_code == 200, r.text
    body = r.json()
    assert "date" in body
    r = client.post("/api/out-transactions/list", json={"date": body["date"]})
    assert r.status_code == 200, r.text
    rows = r.json()["rows"]
    assert any(x["id"] == 7001 for x in rows)
    assert any(x["status"] == 1 for x in rows)


def test_commit_reject_delete_save():
    login()
    init = client.get("/api/out-transactions/init").json()
    d = init["date"]
    r = client.post("/api/out-transactions/commit", json={"date": d, "ids": [7001]})
    assert r.status_code == 200, r.text
    assert r.json()["committed"] >= 1
    rows = client.post("/api/out-transactions/list", json={"date": d}).json()["rows"]
    assert next(x for x in rows if x["id"] == 7001)["status"] == 2
    lk = client.get("/api/out-transactions/editor-lookups", params={"cust_id": 1}).json()
    cur = next(c["id"] for c in lk["currencies"] if c["id"] == 944)
    accs = [a for a in lk["accounts"] if a["val_acc"] == cur]
    assert len(accs) >= 2
    r = client.post("/api/out-transactions/save", json={
        "mode": "insert", "transaction_date": d, "operation_code": 1,
        "debit_currency_id": cur, "credit_currency_id": cur, "debit_rate": 1, "credit_rate": 1,
        "debit_id": accs[0]["id"], "credit_id": accs[1]["id"], "debit_amount": 10, "credit_amount": 10, "lamount": 10,
        "name": "new out tr",
    })
    assert r.status_code == 200, r.text
    nid = r.json()["id"]
    r = client.post("/api/out-transactions/reject", json={"date": d, "ids": [nid], "reason": "test"})
    assert r.status_code == 200, r.text
    r = client.post("/api/out-transactions/delete", json={"date": d, "id": nid, "multi": False})
    assert r.status_code == 200, r.text


def test_out_roundnew_threshold_is_04():
    from app.out_transactions import round_new_out
    assert round_new_out(1.0045, 100) == 1.01          # fraction .45 of a cent >= 0.4 -> up (on-balance: 1.00)
    assert round_new_out(1.0035, 100) == 1.0
    assert round_new_out(-1.0045, 100) == -1.01


def test_out_set_amounts_no_same_currency_shortcut():
    from app.out_transactions import set_amounts
    r = set_amounts("debit", 100, 0, 0, 840, 840, 1.7, 1.7)
    assert r == {"debit": 100.0, "credit": 100.0, "lamount": 170.0}
    r = set_amounts("debit", 10, 0, 0, 840, 978, 1.7, 1.9)
    assert r["lamount"] == 17.0 and r["credit"] == 8.95    # 17/1.9 = 8.947368 -> 8.9474 -> 8.95


def test_out_bulk_commit_and_delete_error_propagates():
    login()
    d = client.get("/api/out-transactions/init").json()["date"]
    r = client.post("/api/out-transactions/commit-bulk", json={"date": d, "ids": [], "current_id": 7001})
    assert r.status_code == 200 and r.json()["count"] == 1
    rows = client.post("/api/out-transactions/list", json={"date": d}).json()["rows"]
    assert next(x for x in rows if x["id"] == 7001)["status"] == 2
