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
