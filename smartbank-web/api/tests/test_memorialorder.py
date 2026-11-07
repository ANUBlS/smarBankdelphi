"""RatesViewer (ratesviewer.py) and MemorialOrder (memorialorder.py, mo_sql.py, db/mock_mo.py)."""
import pytest
from fastapi.testclient import TestClient
from app import main, sessions, mo_sql, memorialorder as M
from app.db import mock


@pytest.fixture(autouse=True)
def fresh():
    mock.reset(); sessions.attempts._f.clear(); sessions.store._s.clear(); yield


def cl(u="ADMIN", p="Admin#2026"):
    c = TestClient(main.app); assert c.post("/api/login", json={"username": u, "password": p}).status_code == 200; return c


def post(c, url, code=200, **b):
    r = c.post(url, json=b); assert r.status_code == code, r.text; return r.json()


def test_sql_verbatim():
    assert mo_sql.SQL_MO_MEMORIAL == "select M.RowID ,M.BALANCE from Memorial M\n "
    assert mo_sql.SQL_MO_USERS == "select \n  ID UserID ,\n  Name as UserName\nfrom \n  user$"
    assert mo_sql.SQL_MO_CURRENCYSDATA.endswith("valu_name as CurrencyLName\nfrom\n  Avalute")
    assert mo_sql.SQL_MO_TRANSACTIONS.endswith("CA.Val_Acc = CV.Valute and")      # dangling 'and': never opened
    assert M.SQL_UPD == "update Memorial set BALANCE = :BALANCE where rowid = :RID"


def test_ratesviewer_never_opened():
    assert cl().get("/api/ratesviewer/init").json() == {"active": False, "rows": []}


def test_mo_init():
    i = cl().get("/api/memorialorder/init").json()
    assert i["first"] == i["last"] == "2003-11-21"                    # design-time DTP dates, never set by code
    assert i["currencies"][0] == "Azərbaycan manatı" and len(i["currencies"]) == 5
    assert i["branches"] == ["Baş ofis", "Nərimanov filialı", "Gəncə filialı"]
    assert "TELLER" in i["users"] and i["transactions"] == []
    assert [r["balance"] for r in i["memorial"]] == [1001, 1002, 1101, 1102, 1201] and all(r["rid"] for r in i["memorial"])


def test_mo_tuning_post_delete():
    c = cl()
    m = post(c, "/api/memorialorder/memorial/post", rid=None, balance="1301")["memorial"]
    assert [r["balance"] for r in m][-1] == 1301
    rid = m[0]["rid"]
    m = post(c, "/api/memorialorder/memorial/post", rid=rid, balance="1001,5")["memorial"]
    assert m[0]["balance"] == 1001.5
    assert post(c, "/api/memorialorder/memorial/post", 400, rid=rid, balance="x")["detail"]["key"] == "mo.err_float"
    assert post(c, "/api/memorialorder/memorial/post", 400, rid=None, balance=" ")["detail"] == {"key": "mo.err_required", "ora": None, "field": "BALANCE"}
    m = post(c, "/api/memorialorder/memorial/delete", rid=m[1]["rid"])["memorial"]
    assert [r["balance"] for r in m] == [1001.5, 1101, 1102, 1201, 1301]
    assert post(c, "/api/memorialorder/memorial/delete", 400, rid=None)["detail"]["key"] == "mo.err_empty"
    # committed (CommitOnPost): a new session sees the change
    assert [r["balance"] for r in cl().get("/api/memorialorder/memorial").json()["memorial"]] == [1001.5, 1101, 1102, 1201, 1301]


def test_rights_denied():
    c = cl("TELLER", "Teller#2026")
    for u in ("/api/ratesviewer/init", "/api/memorialorder/init", "/api/memorialorder/memorial"):
        assert c.get(u).status_code == 403
    assert c.post("/api/memorialorder/memorial/delete", json={"rid": "1"}).status_code == 403
