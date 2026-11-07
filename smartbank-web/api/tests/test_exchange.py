"""Exchange (TFrmExchange, Packages/Exchange) - api/app/exchange.py."""
import io
import pytest
from fastapi.testclient import TestClient
from app import main, sessions, exchange as EX, dbf_template as DBF, ex_sql as Q
from app.db import mock


@pytest.fixture(autouse=True)
def fresh():
    mock.reset(); sessions.attempts._f.clear(); sessions.store._s.clear(); yield


def cl(u="ADMIN", p="Admin#2026"):
    c = TestClient(main.app); assert c.post("/api/login", json={"username": u, "password": p}).status_code == 200; return c


def post(c, url, code=200, **b):
    r = c.post(url, json=b); assert r.status_code == code, r.text; return r


U = "/api/exchange"
PER = dict(beg="2026-10-01", end="2026-10-12")


def test_init_lists_and_bank_day():
    j = cl().get(U + "/init").json()
    assert j["date"] == "2026-10-12"
    assert [x["exnum"] for x in j["exchanges"]] == [1, 2, 3]
    assert len(j["accounts"]) == 5 and {"val_name", "acc_no", "id", "exnum", "accountid"} <= set(j["accounts"][0])
    assert [c["valute"] for c in j["currencies"]] == [0, 840, 978, 643]
    assert j["exch_file"] == "EXCH122.dbf" and j["conv_file"] == "$MB12212.dbf"


def test_verbatim_sql_kept():
    assert "Order by :Title  ,currency" in Q.SQL_EX_EXCHANGE
    assert "ORDER BY :title" in Q.SQL_EX_ODSCONVERTATION
    assert "(bal_cn1=1013 or bal_cn1=1003)" in Q.SQL_EX_EXACCOUNT


def test_add_update_exchange_and_validation():
    c = cl()
    assert post(c, U + "/exchanges/save", 400, mode=1, exnum="", name="X").json()["detail"]["key"] == "exchange.err_incomplete"
    d = post(c, U + "/exchanges/save", 400, mode=1, exnum="4a", name="X").json()["detail"]
    assert d["key"] == "exchange.err_convert" and d["msg"] == "'4a' is not a valid integer value"
    j = post(c, U + "/exchanges/save", mode=1, exnum="$A", name="Bakı VDM").json()      # StrToInt accepts $hex
    assert any(x["name"] == "Bakı VDM" and x["exnum"] == 10 for x in j["exchanges"])
    j = post(c, U + "/exchanges/save", mode=2, id=2, exnum="22", name="Gəncə-2").json()
    assert next(x for x in j["exchanges"] if x["id"] == 2) == {"id": 2, "name": "Gəncə-2", "exnum": 22}


def test_delete_vdm_removes_only_accounts():
    j = post(cl(), U + "/exchanges/delete", id=1).json()
    assert any(x["id"] == 1 for x in j["exchanges"])                                 # del_exchanges is commented out
    assert not any(a["id"] == 1 for a in j["accounts"])


def test_accounts_add_update_delete():
    c = cl()
    accs = c.get(U + "/exaccounts/1").json()["acc_no"]                               # USD: bal_cn1 1013 / 1003 only
    assert accs == ["AZ31SMRT10130000000000840101", "AZ32SMRT10030000000000840102"]
    j = post(c, U + "/exaccounts/save", mode=3, exchange_id=3, acc_no=accs[0]).json()
    assert [a["accountid"] for a in j["accounts"] if a["id"] == 3] == [21]
    d = post(c, U + "/exaccounts/save", 400, mode=3, exchange_id=3, acc_no=accs[0]).json()["detail"]
    assert d["key"] == "exchange.err_repeating_3" and "ORA-00001" in d["ora"]
    d = post(c, U + "/exaccounts/save", 400, mode=3, exchange_id=3, acc_no="").json()["detail"]   # TakeAccountID empty -> 0
    assert "ORA-02291" in d["ora"]
    j = post(c, U + "/exaccounts/save", mode=4, exchange_id=3, acc_no=accs[1], last_account_id=21).json()
    assert [a["accountid"] for a in j["accounts"] if a["id"] == 3] == [22]
    j = post(c, U + "/exaccounts/delete", exchange_id=3, account_id=22).json()
    assert not any(a["id"] == 3 for a in j["accounts"])
    assert c.get(U + "/exaccounts/9").status_code == 400


def test_access_check_denies_teller():
    r = cl().post(U + "/access", json={"action": "Insert"})
    assert r.status_code == 200
    assert cl().post(U + "/access", json={"action": "Drop"}).status_code == 422


def test_vdm_refresh_title_is_bind_variable():
    c = cl()
    rows = post(c, U + "/vdm/refresh", **PER).json()["rows"]
    assert len(rows) == 9 and [r["currency"] for r in rows] == [643] * 3 + [840] * 3 + [978] * 3
    rows2 = post(c, U + "/vdm/refresh", **PER, title="SELLRATE").json()["rows"]      # ORDER BY :Title is a constant
    assert rows2 == rows


def test_vdm_excels():
    from openpyxl import load_workbook
    c = cl()
    r = post(c, U + "/vdm/total-excel", **PER)
    ws = load_workbook(io.BytesIO(r.content)).active
    assert [x.value for x in ws[1]][:3] == ["Valyuta kodu", "Valyuta adı", "Alış sayı"] and ws.max_row == 4
    usd = [x.value for x in ws[3]]
    assert usd[0] == 840 and usd[2] == 123 and usd[4] == 55.5                       # sum(BuyAmmount)/1000
    r = post(c, U + "/vdm/excel", **PER)
    ws = load_workbook(io.BytesIO(r.content)).active
    assert ws.max_row == 10 and ws.max_column == 16


def test_vdm_file_dbf():
    r = post(cl(), U + "/vdm/file", **PER, filename="C:\\out\\EXCH122.dbf")
    assert 'filename="EXCH122.dbf"' in r.headers["content-disposition"]
    recs = DBF.read(r.content)
    assert len(recs) == 9
    assert recs[3] == {"WHEN": "20261008", "BANK_CODE": "122", "VALUTE": "840", "RATE1": "1.7050", "TOTAL1": "12750",
                       "MANAT1": "21738.75", "RATE2": "1.6950", "TOTAL2": "18500", "MANAT2": "31357.50"}


def test_dbf_missing_template(monkeypatch, tmp_path):
    monkeypatch.setenv("DBF_TEMPLATE_DIR", str(tmp_path))
    d = post(cl(), U + "/vdm/file", 400, **PER, filename="x.dbf").json()["detail"]
    assert d["key"] == "exchange.err_file_creation"


def test_tooling_post_and_delete():
    c = cl()
    assert c.get(U + "/tooling").json()["row"] == {"nat_balance": "1001", "for_balance": "1011"}
    assert post(c, U + "/tooling", nat_balance="1002", for_balance="1012").json()["row"] == {"nat_balance": "1002", "for_balance": "1012"}
    assert post(c, U + "/tooling/delete").json()["row"] is None
    assert post(c, U + "/tooling", nat_balance="1001", for_balance="").json()["row"] == {"nat_balance": "1001", "for_balance": None}


def test_convert_refresh_excel_and_filename():
    from openpyxl import load_workbook
    c = cl()
    rows = post(c, U + "/convert/refresh", **PER).json()["rows"]
    assert len(rows) == 3 and rows[1]["fullpath"] == "İdxal əməliyyatları üzrə ödənişlər" and rows[2]["mbankkurs"] == 1.8456
    ws = load_workbook(io.BytesIO(post(c, U + "/convert/excel", **PER).content)).active
    assert ws.title == "List1" and ws.max_column == 16 and ws["A1"].value == "Tarix"
    assert post(c, U + "/convert/excel", 204, beg="2020-01-01", end="2020-01-02").status_code == 204
    ws = load_workbook(io.BytesIO(post(c, U + "/convert/excel-status", **PER, status="BUY").content)).active
    assert [x.value for x in ws[1]] == ["Əqd", "Orta", "Orta kurs", "Valyuta məbləği", "Ekvivalent", "Konvertasiyanın təyinatı", "Valyuta"]
    assert c.get(U + "/convert/filename/15").json()["filename"] == "$MB12201.dbf"
    assert c.get(U + "/convert/filename/16").json()["filename"] == "$MB12202.dbf"


def test_convert_file_records():
    r = post(cl(), U + "/convert/file", **PER, filename="$MB12202.dbf")
    recs = DBF.read(r.content)
    assert [(x["TIP"], x["OPERATOR"], x["ALQ_SAT"], x["MABLAG"], x["KURS"]) for x in recs] == [
        ("2", "DIG", "0", "25000.00", "1.7000"), ("1", "DIG", "0", "25000.00", "1.7000"),
        ("2", "IDX", "1", "50000.00", "1.7050"),
        ("2", "KRD", "0", "10000.00", "1.8400"), ("1", "KRD", "0", "10000.00", "1.8400")]
    assert {x["INS2"] for x in recs} == {"048"}
    empty = post(cl(), U + "/convert/file", filename="a.dbf")                     # never refreshed -> header only
    assert DBF.read(empty.content) == []


def test_foreign_currency_rule():
    assert EX.get_foreign_currency("048", "840") == "840" and EX.get_foreign_currency("840", "048") == "840"


def test_module_right_required():
    c = cl("TELLER", "Teller#2026")
    assert c.get(U + "/init").status_code == 403
