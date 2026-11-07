import datetime as dt
import io
from decimal import Decimal as D

import pytest
from fastapi.testclient import TestClient
from app import main, sessions, bal_logic as L, bal_sql as Q
from app.db import mock


@pytest.fixture(autouse=True)
def fresh():
    mock.reset(); sessions.attempts._f.clear(); sessions.store._s.clear(); yield


def cl(u="ADMIN", p="Admin#2026"):
    c = TestClient(main.app); assert c.post("/api/login", json={"username": u, "password": p}).status_code == 200; return c


W = dict(beg="2026-10-05", end="2026-10-09")


# ------------------------------------------------------------------ Balance (BalanceImplUnit.pas)
def test_cr_filial_str_and_split():
    assert L.cr_filial_str([101, 102]) == " 101,102"
    t = "x" * 2500
    a, b = L.split_astr(t)
    assert len(a) == 1999 and a + b == t
    assert L.balance_text("A", None) == "A Order By Bal_CN"


def test_ds_filter_null_is_not_nonzero():
    rows = [{"LASTACTIVE": None, "LASTPASSIVE": 0}, {"LASTACTIVE": 0, "LASTPASSIVE": 5}, {"LASTACTIVE": None, "LASTPASSIVE": None}]
    assert L.ds_filter(rows, ("LastActive", "LastPassive")) == [rows[1]]


def test_balance_report_groups_and_totals():
    rows = [{"BAL_CN": 1, "LASTACTIVE": D("1.10"), "LASTPASSIVE": 0, "ACCGROUP": 10},
            {"BAL_CN": 2, "LASTACTIVE": D("2.20"), "LASTPASSIVE": 0, "ACCGROUP": 10},
            {"BAL_CN": 3, "LASTACTIVE": 0, "LASTPASSIVE": D("3"), "ACCGROUP": 20},
            {"BAL_CN": 4, "LASTACTIVE": 0, "LASTPASSIVE": 0, "ACCGROUP": 20}]
    r = L.balance_report(rows, 4)
    assert len(r["rows"]) == 3 and [g["key"] for g in r["groups"]] == [10, 20]
    assert r["groups"][0]["totals"]["LASTACTIVE"] == D("3.30") and r["totals"]["LASTPASSIVE"] == D("3")
    assert len(L.balance_report(rows, 1)["rows"]) == 4


def test_report_dates():
    assert L.report_dates(dt.date(2026, 10, 5), dt.date(2026, 10, 5))["show_ldate"] is False


def test_f600_and_dbf():
    rows = L.f600_rows([{"BAL_CN": 1001, "LASTACTIVE": D("10.5"), "LASTPASSIVE": 0}, {"BAL_CN": 2, "LASTACTIVE": 0, "LASTPASSIVE": 0}], 5, 7, 1000)
    assert rows == [{"NB": 5, "NF": 7, "NB1": 1001, "SUM1": D("10500.0"), "SUM2": D("0")}]
    b = L.write_dbf(rows)
    assert b[0] == 3 and int.from_bytes(b[4:8], "little") == 1 and b[-1] == 0x1A


def test_balance_api_reports_and_exports():
    c = cl()
    for rp in range(6):
        r = c.post("/api/balance/run", json={**W, "branches": [101, 102], "report": rp}).json()
        assert r["report"]["rows"] and r["sql"].endswith(" Order By Bal_CN")
    assert c.post("/api/balance/run", json={**W, "branches": []}).json()["detail"]["key"] == "balance.err_branch"
    assert c.post("/api/balance/report.pdf", json={**W, "branches": [101], "labels": {"title": "<b>&"}}).content[:4] == b"%PDF"
    x = c.post("/api/balance/export.xlsx", json={**W, "branches": [101], "fields": ["bal_cn", "lastactive"]})
    import openpyxl
    ws = openpyxl.load_workbook(io.BytesIO(x.content)).active
    assert ws.max_column == 2
    assert c.post("/api/balance/export.xlsx", json={**W, "branches": [101], "fields": ["evil"]}).status_code == 400
    assert c.post("/api/balance/f600.dbf", json={**W, "divisor": "abc"}).json()["detail"]["key"] == "balance.err_divisor"
    assert c.post("/api/balance/f600.dbf", json=W).status_code == 200


def test_balance_procedure_is_whitelisted_text():
    assert ":P_Procedure" in Q.SQL_BAL_SELECTIONS


def test_comp_settings_rowid_validation():
    c = cl()
    s = c.get("/api/balance/comp/settings").json()
    assert c.post("/api/balance/comp/settings", json={**s[0], "rowid": "x' or 1=1"}).status_code == 422
    assert c.post("/api/balance/comp/settings", json={**s[0], "code": "999"}).json() == {"ok": True}
    assert c.get("/api/balance/comp/settings").json()[0]["code"] == "999"
    assert c.post("/api/balance/comp", json={**W, "branches": [101]}).json()["report"]["groups"]


# ------------------------------------------------------------------ DBDBalance
def test_dbd_params_validation():
    allv, alls = [0, 840], ["A", "D"]
    with pytest.raises(L.BalError):
        L.dbd_params(0, [0], allv, [], alls, 0, "")
    with pytest.raises(L.BalError):
        L.dbd_params(0, [], allv, ["A"], alls, 0, "")
    with pytest.raises(L.BalError):
        L.dbd_params(0, [0], allv, ["A"], alls, 0, "1001) or (1=1")
    with pytest.raises(L.BalError):
        L.dbd_params(0, [0], allv, ["A"], alls, 1, "AZ1';--")
    p = L.dbd_params(1, [0], allv, ["A"], alls, 0, "1001,1101")
    assert p["t"] == "2" and "ac.VAL_ACC in (0)" in p["additional"] and "ac.tipacc like ('%A%')" in p["additional"]
    assert p["balans_h"] == "and (ac.bal_cn2 IN (1001,1101))"
    p = L.dbd_params(0, allv, allv, alls, alls, 1, "AZ1, AZ2")
    assert p["additional"] == "" and p["ssuda_h"] == "and (ac.acc_no IN ('AZ1','AZ2'))"


def test_dbd_call_arity():
    p = L.dbd_params(0, [0], [0], ["A"], ["A"], 0, "")
    calls = L.dbd_calls(p, dt.datetime(2026, 1, 1), dt.datetime(2026, 1, 2), -1, True)
    assert [(k, len(a)) for k, a in calls] == [("OUT_SB_BALANCE", 9), ("SB_BALANCE", 18)]
    p = L.dbd_params(0, [0], [0], ["A"], ["A"], 1, "AZ1")
    assert len(L.dbd_calls(p, None, None, -1, False)[0][1]) == 18


def test_dbd_row_id():
    assert L.dbd_row_id({"ADATE": dt.datetime(2026, 10, 5), "ACCOUNTNUM": "3001"}) == 5003001


def test_dbd_api():
    c = cl()
    r = c.post("/api/dbdbalance/run", json={**W, "symbols": ["A"], "currencies": [0, 840, 978], "with_out": True}).json()
    assert r["balance"]
    assert c.post("/api/dbdbalance/export.xlsx", json={**W, "symbols": ["A"], "currencies": [0], "with_out": True}).status_code in (200, 400)


# ------------------------------------------------------------------ TodayBalance
def test_tb_sql_lines():
    s = L.tb_balance_sql(Q.SQL_TB_BALANCE, -1, -1, "", "national", True)
    assert "Tenostat" in s and "Pok_" in s
    s2 = L.tb_balance_sql(Q.SQL_TB_BALANCE, 840, 101, "1001,1101", "exist", False)
    assert "Archost" in s2 and "1001,1101" in s2 and "840" in s2
    with pytest.raises(L.BalError):
        L.tb_balance_sql(Q.SQL_TB_BALANCE, -1, -1, "1) union select", "national", True)
    assert "Provarch" in L.tb_transactions_sql(Q.SQL_TB_TRANSACTIONS, False)
    assert L.tb_amount_type(-1, 0) == "national" and L.tb_amount_type(840, 0) == "exist"


def test_tb_api():
    c = cl()
    for rp in range(3):
        assert c.post("/api/todaybalance/run", json={"date": "2026-10-12", "report": rp}).json()["report"]["rows"]
    r = c.post("/api/todaybalance/checking", json={"date": "2026-10-12"}).json()
    assert r["balance"]
    assert c.post("/api/todaybalance/checking/accounts", json={"date": "2026-10-12", "account_number": 1001}).json()


# ------------------------------------------------------------------ BalanceAnalys
def test_ba_sql_conditions():
    s, cond = L.ba_balance_sql(Q.SQL_BA_BALANCE, [101], [101, 102], True, 840, "1001,1101", 1, 0)
    assert cond == " AND Ac.filial in (101) AND Ac.val_acc =840 AND (b.bal_cn in (1001,1101) or b.accgroup in (1001,1101))"
    _, cond = L.ba_balance_sql(Q.SQL_BA_BALANCE, [101, 102], [101, 102], False, None, "", 0, 0)
    assert cond == ""
    with pytest.raises(L.BalError):
        L.ba_balance_sql(Q.SQL_BA_BALANCE, [], [1], False, None, "1001;drop", 0, 0)
    t = L.ba_transaction_sql(Q.SQL_BA_TRANSACTION, 7, L.ba_debt_line20(5, 1001))
    assert "t.op_id = 7 and" in t and " and t.Debt = 5 and c.bal_cn1=1001" in t


def test_ba_api():
    c = cl()
    r = c.post("/api/balanceanalys/refresh", json={**W, "branches": [101, 102]}).json()
    assert r["balance"] and r["accounts"]
    assert c.post("/api/balanceanalys/transactions", json={**W, "kind": "all", "account_id": 50001}).json()
    assert c.post("/api/balanceanalys/refresh", json={**W, "currency_on": True}).status_code == 400


# ------------------------------------------------------------------ AccBalanceCheck + rights
def test_acc_check_flow():
    c = cl()
    l = c.get("/api/accbalancecheck/list").json()
    assert all(x["status"] == "" for x in l)
    broken = 50005
    assert c.post(f"/api/accbalancecheck/{broken}/check").json()["status"] == "Error"
    assert c.post(f"/api/accbalancecheck/{broken}/correct").json()["status"] == "Ok"
    st = {x["id"]: x["status"] for x in c.get("/api/accbalancecheck/list").json()}
    assert st[broken] == "Ok"


def test_rights_enforced():
    c = cl("ACCOUNTANT", "Accountant#2026")
    assert c.get("/api/accbalancecheck/list").status_code == 403
    assert c.get("/api/balance/init").status_code == 200
    assert cl("TELLER", "Teller#2026").get("/api/balance/init").status_code == 403
