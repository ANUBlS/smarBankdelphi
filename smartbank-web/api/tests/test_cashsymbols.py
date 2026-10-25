"""CashSymbols (TCashSymbolX) - api/app/cashsymbols.py."""
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


U = "/api/cashsymbols"


def test_list_ordered_with_assignment():
    rows = cl().get(U).json()["rows"]
    syms = [r["symbol"] for r in rows]
    assert syms == sorted(syms) and len(rows) == 6
    assert {r["assignment"] for r in rows} <= {"Mədaxil", "Məxaric"}
    for r in rows:
        assert r["assignment"] == ("Mədaxil" if r["mediocrity"] == 0 else "Məxaric")


def test_add_update_delete():
    c = cl()
    rows = post(c, U + "/add", symbol="77", name="Yeni simvol", mediocrity=1)["rows"]
    r = next(x for x in rows if x["symbol"] == "77")
    assert r["assignment"] == "Məxaric"
    assert post(c, U + "/add", 400, symbol="77", name="dup", mediocrity=0)["detail"]["key"]
    rows = post(c, U + "/update", old_symbol="77", symbol="78", name="Dəyişdi", mediocrity=0)["rows"]
    assert any(x["symbol"] == "78" and x["name"] == "Dəyişdi" for x in rows) and not any(x["symbol"] == "77" for x in rows)
    rows = post(c, U + "/delete", symbol="78")["rows"]
    assert not any(x["symbol"] == "78" for x in rows) and len(rows) == 6
    assert post(c, U + "/add", 422, symbol="1", name="x", mediocrity=2)
