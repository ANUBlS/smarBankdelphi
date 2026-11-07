"""Order (order.py, ord_sql.py, db/mock_ord.py)."""
import pytest
from fastapi.testclient import TestClient
from app import main, sessions, ord_sql
from app.db import mock


@pytest.fixture(autouse=True)
def fresh():
    mock.reset(); sessions.attempts._f.clear(); sessions.store._s.clear(); yield


def cl(u="ADMIN", p="Admin#2026"):
    c = TestClient(main.app); assert c.post("/api/login", json={"username": u, "password": p}).status_code == 200; return c


def test_sql_verbatim():
    assert ord_sql.SQL_ORD_CLIENTACCS == "select\n  Val_Acc ,\n  KLI_ID ,\n  Acc_No ,\n  Name\nfrom\n  Account\nwhere\n  Val_acc = :Val_Acc\n\norder by\n  Acc_No    \n \n "
    assert "where zoneid = (select zoneid from sbcm_acc_zones where name = 'Reserv')))" in ord_sql.SQL_ORD_RESERVEACCS
    assert ord_sql.SQL_ORD_BANKINFODATA == "select\n  Bank \nfrom BankInfo"


def test_init_master_detail():
    c = cl()
    i = c.get("/api/order/init").json()
    assert i["date"] == "2003-06-04"                                           # design-time DTPSysdate
    assert [x["val_name"] for x in i["currencies"]] == ["AZN", "USD", "EUR"]
    assert {x["val_acc"] for x in i["client"] + i["reserve"]} == {944}          # :Val_Acc = first CurrencyData.VALUTE
    assert [x["acc_no"] for x in i["client"]] == sorted(x["acc_no"] for x in i["client"]) and len(i["client"]) == 6
    assert len(i["reserve"]) == 2 and {x["kli_id"] for x in i["reserve"]} == {5001, 5002}   # pok_ostat > 0, Reserv zone, sysdat day
    d = c.post("/api/order/accounts", json={"valute": 840}).json()
    assert {x["val_acc"] for x in d["client"] + d["reserve"]} == {840}
    assert c.post("/api/order/accounts", json={"valute": "x"}).status_code == 422


def test_rights_denied():
    c = cl("TELLER", "Teller#2026")
    assert c.get("/api/order/init").status_code == 403
    assert c.post("/api/order/accounts", json={"valute": 944}).status_code == 403
