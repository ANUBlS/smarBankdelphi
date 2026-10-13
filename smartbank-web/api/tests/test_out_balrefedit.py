"""Packages/Out_balancerefeditx/Ocx (TBalanceRefEditX) - off-balance chart of accounts editor."""
from fastapi.testclient import TestClient
from app.main import app
from app.db import mock as mock_db
from app import out_balrefedit as M
from app import out_set_sql as Q

client = TestClient(app)
B = "/api/out-balrefedit"


def login(u="ADMIN", p="Admin#2026"):
    mock_db.reset()
    assert client.post("/api/login", json={"username": u, "password": p}).status_code == 200


def test_sql_line1_replaced_like_delphi():
    assert M.balance_sql(0) == "select b.*, b.rowid from \r\nout_bal_spr1 b\r\n\r\nOrder by BAL_CN"
    assert M.balance_sql(3).split("\r\n")[1] == "out_bal_spr4 b"
    assert Q.BALANCE_SQL_LINES[1] == "OUT_bal_spr1 b"
    for bad in (-1, 4):
        try:
            M.balance_sql(bad)
            assert False
        except ValueError:
            pass


def test_calc_fields():
    r = M.calc({"TYPEID": 3, "ADDITIONALTYPEID": 9, "SALDO": 1, "RATEDIFFERENCE": 0})
    assert r["TYPEID_NAME"] == "Aktiv-Passiv" and r["ADDITIONALTYPEID_NAME"] is None
    assert r["SALDO_NAME"] == "Nəzərə alınır" and r["RATEDIFFERENCE_NAME"] == "Hesablanmır"


def test_list_insert_update_delete():
    login()
    r = client.get(B, params={"plan": 0}).json()["rows"]
    assert [x["bal_cn"] for x in r] == [9100, 9200, 9900] and r[0]["typeid_name"] == "Passiv" and r[0]["rowid"]
    assert client.get(B, params={"plan": 2}).json()["rows"][0]["bal_cn"] == 910010
    assert client.get(B, params={"plan": 5}).status_code == 400
    body = {"bal_cn": "9300", "typeid": 2, "additionaltypeid": 2, "accgroup": "93", "saldo": 1, "ratedifference": 0,
            "part": "9", "balname": "Test", "currencyposition": 1}
    assert client.post(B, params={"plan": 0}, json=body).status_code == 200
    rows = client.get(B, params={"plan": 0}).json()["rows"]
    n = [x for x in rows if x["bal_cn"] == 9300][0]
    assert n["currencyposition"] == 1 and n["saldo_name"] == "Nəzərə alınır"
    # duplicate key -> ORA text shown
    rr = client.post(B, params={"plan": 0}, json=body)
    assert rr.status_code >= 400 and "ORA-00001" in str(rr.json())
    # bad number in a TFloatField
    rr = client.put(B, params={"plan": 0, "rowid": n["rowid"]}, json={**body, "accgroup": "abc"})
    assert rr.status_code == 400 and rr.json()["detail"]["field"] == "ACCGROUP"
    assert client.put(B, params={"plan": 0, "rowid": n["rowid"]}, json={**body, "balname": "Yeni"}).status_code == 200
    assert [x for x in client.get(B, params={"plan": 0}).json()["rows"] if x["bal_cn"] == 9300][0]["balname"] == "Yeni"
    assert client.put(B, params={"plan": 0, "rowid": "nope"}, json=body).status_code == 404
    assert client.delete(B, params={"plan": 0, "rowid": n["rowid"]}).status_code == 200
    assert 9300 not in [x["bal_cn"] for x in client.get(B, params={"plan": 0}).json()["rows"]]


def test_dml_text():
    assert M.update_sql(1, ["BAL_CN", "PART"]) == "update out_bal_spr2 set BAL_CN = :BAL_CN, PART = :PART where rowid = :doa_rowid"
    assert M.delete_sql(0) == "delete from out_bal_spr1 where rowid = :doa_rowid"


def test_rights():
    login("TELLER", "Teller#2026")
    assert client.get(B).status_code == 403
