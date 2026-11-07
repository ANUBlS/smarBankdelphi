"""Packages/Out_Tuningacctypes (TFlagsEditor) - off-balance account types."""
from fastapi.testclient import TestClient
from app.main import app
from app.db import mock as mock_db
from app import out_tuningacctypes as M
from app import out_set_sql as Q

client = TestClient(app)
B = "/api/out-tuningacctypes"


def login(u="ADMIN", p="Admin#2026"):
    mock_db.reset()
    assert client.post("/api/login", json={"username": u, "password": p}).status_code == 200


def test_sql_verbatim():
    assert Q.SQL_ACCOUNT_TYPES == "select\r\n  AT.* ,\r\n  AT.RowID\r\nfrom\r\n  Out_Account_Flags AT  "
    assert M.SQL_DELETE == "delete from Out_Account_Flags where rowid = :doa_rowid"


def test_crud():
    login()
    rows = client.get(B).json()["rows"]
    assert [r["symbol"] for r in rows] == ["*", "G", "Z", "S"] and rows[1]["name"] == "Girov" and rows[1]["rowid"]
    assert client.post(B, json={"symbol": "K", "name": "Kredit xətti", "description": "Açılmamış kredit xətləri"}).status_code == 200
    assert client.post(B, json={"symbol": "K"}).status_code >= 400          # duplicate symbol (mock PK) -> ORA-00001
    assert client.post(B, json={"symbol": "KK"}).status_code == 422         # Size = 1
    assert client.post(B, json={"symbol": ""}).status_code == 422           # Required
    k = [r for r in client.get(B).json()["rows"] if r["symbol"] == "K"][0]
    assert client.put(B, params={"rowid": k["rowid"]}, json={"symbol": "K", "name": "Kredit", "description": ""}).status_code == 200
    k = [r for r in client.get(B).json()["rows"] if r["symbol"] == "K"][0]
    assert k["name"] == "Kredit" and k["description"] is None
    # the new symbol is seen by Off-balance Accounts (same OUT_ACCOUNT_FLAGS table)
    assert any(f["symbol"] == "K" for f in client.get("/api/out-account/lookups").json()["acc_flags"])
    assert client.delete(B, params={"rowid": k["rowid"]}).status_code == 200
    assert "K" not in [r["symbol"] for r in client.get(B).json()["rows"]]


def test_rights():
    login("TELLER", "Teller#2026")
    assert client.get(B).status_code == 403
