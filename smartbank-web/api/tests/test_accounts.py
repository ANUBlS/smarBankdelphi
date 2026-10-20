import os
import pytest
from fastapi.testclient import TestClient
from app import main, sessions, accounts
from app.db import mock


@pytest.fixture(autouse=True)
def fresh():
    mock.reset(); sessions.attempts._f.clear(); sessions.store._s.clear(); yield


def cl(u="TELLER", p="Teller#2026"):
    c = TestClient(main.app); assert c.post("/api/login", json={"username": u, "password": p}).status_code == 200; return c


NEW = dict(acc_no="AZ12SMRT38010019440000000099", acc_name="New acc", customer_id=2, currency_id=944,
           open_date="2026-10-12T15:30:00", sacc=3801, acc_flags=["A - Arrested", "I - Insider"])


def test_query_builder_matches_delphi():
    sql, b = accounts.build_accs_query(dict(apply_filter=True, status="active", bal_cn=3801, customer_id=1,
                                            currency_id=944, filial_id=101, flag="A", order="name"))
    assert sql.startswith(accounts.SACCOUNTS_QUERY)
    assert sql[len(accounts.SACCOUNTS_QUERY):] == (" AND (acc.CLOSE_DAT IS NULL)\r\n AND (acc.BAL_CN1 = :bal_cn)\r\n"
        " AND (acc.KLI_ID = :customer_id)\r\n AND (acc.VAL_ACC = :currency_id)\r\n AND (acc.FILIAL = :filial_id)\r\n"
        " AND (acc.tipacc like :flag_like  )\r\nORDER BY acc.NAME\r\n")
    assert b == {"bal_cn": 3801, "customer_id": 1, "currency_id": 944, "filial_id": 101, "flag_like": "%A%"}
    sql2, b2 = accounts.build_accs_query(dict(apply_filter=False, status="active", bal_cn=1))  # filters ignored
    assert sql2 == accounts.SACCOUNTS_QUERY + "ORDER BY acc.ACC_NO\r\n" and b2 == {}


def test_build_acc_flags():
    assert accounts.build_acc_flags(["A - x", "O - y"]) == "A,O" and accounts.build_acc_flags([]) == ""


def test_module_right_enforced():
    c = TestClient(main.app); c.post("/api/login", json={"username": "TELLER", "password": "Teller#2026"})
    mock._load()["users"]["TELLER"]["rights"].remove(accounts.CLSID)
    assert c.get("/api/accounts").status_code == 403


def test_list_filter_order_paging():
    c = cl()
    r = c.get("/api/accounts").json(); assert len(r["rows"]) == 10 and r["rows"][0]["accno"].startswith("AZ12SMRT3001")
    r = c.get("/api/accounts?apply_filter=true&status=active").json(); assert all(x["closedate"] is None for x in r["rows"])
    r = c.get("/api/accounts?apply_filter=true&status=closed").json(); assert [x["accid"] for x in r["rows"]] == [1009, 1004]
    r = c.get("/api/accounts?apply_filter=true&customer_id=3&currency_id=840").json(); assert [x["accid"] for x in r["rows"]] == [1006]
    r = c.get("/api/accounts?apply_filter=true&flag=O").json(); assert {x["accid"] for x in r["rows"]} == {1001, 1005}
    r = c.get("/api/accounts?status=active&customer_id=3").json(); assert len(r["rows"]) == 10  # no ApplyFilter
    r = c.get("/api/accounts?order=name&limit=3").json(); assert r["more"] and len(r["rows"]) == 3
    r2 = c.get("/api/accounts?order=name&limit=3&offset=9").json(); assert not r2["more"] and len(r2["rows"]) == 1


def ids(c, qs):
    return [x["accid"] for x in c.get("/api/accounts?" + qs).json()["rows"]]


def test_each_filter_narrows_like_buildaccsquery():
    """AccountMainFormImpl.pas:559-603: every Use* filter adds its own AND line only while ApplyFilter is checked."""
    c = cl()
    every = ids(c, "apply_filter=true&status=all")
    assert len(every) == 10
    active = ids(c, "apply_filter=true&status=active")                       # :564 CLOSE_DAT IS NULL (Delphi default)
    assert 1004 not in active and 1009 not in active and len(active) == 8
    assert ids(c, "apply_filter=true&status=closed") == [1009, 1004]         # :570
    assert set(ids(c, "apply_filter=true&status=all&bal_cn=3301")) == {1005, 1006, 1008}      # :576 BAL_CN1
    assert set(ids(c, "apply_filter=true&status=all&customer_id=1")) == {1001, 1002, 1009}    # :578 KLI_ID
    assert set(ids(c, "apply_filter=true&status=all&currency_id=978")) == {1004, 1008}        # :580 VAL_ACC
    assert set(ids(c, "apply_filter=true&status=all&filial_id=102")) == {1007, 1008, 1009}   # :582 FILIAL
    assert set(ids(c, "apply_filter=true&status=all&flag=I")) == {1008}                       # :584 tipacc like '%I%'
    assert set(ids(c, "apply_filter=true&status=all&flag=A")) == {1001, 1006, 1010}
    assert set(ids(c, "apply_filter=true&status=active&filial_id=102")) == {1007, 1008}      # combined with AND
    assert len(ids(c, "apply_filter=false&status=active&filial_id=102&flag=I")) == 10         # ApplyFilter off: ignored
    by_cur = c.get("/api/accounts?apply_filter=true&status=all&order=currency").json()["rows"]
    assert [x["currencyid"] for x in by_cur] == sorted(x["currencyid"] for x in by_cur)       # :594 ORDER BY acc.VAL_ACC
    assert c.get("/api/accounts?status=bogus").status_code == 400 and c.get("/api/accounts?order=x;drop").status_code == 400


def test_detail_fields_pair_accno_and_flags_kept():
    c = cl()
    a = c.get("/api/accounts/1008").json()
    assert a["pair_accno"] == "AZ12SMRT33010084000000000006" and a["accflags"] == "I" and a["acc_flags_checked"] == ["I"]
    assert a["delayedamount"] == 500.0 and a["daystartlamount"] == 14356.0
    assert c.get("/api/accounts/1001").json()["pair_accno"] is None
    # edit without opening the flags dialog sends the raw AccFlags string unchanged
    body = dict(acc_no=a["accno"], acc_name=a["accname"], customer_id=3, currency_id=978, sacc=3301, open_date="2025-06-01",
                filial_id=102, pair_acc=1006, acc_flags="I")
    assert c.put("/api/accounts/1008", json=body).status_code == 200
    assert mock._load()["acc"]["accounts"][-3]["TIPACC"] == "I"


def test_lookups_and_defaults():
    c = cl(); lk = c.get("/api/accounts/lookups").json()
    assert [x["id"] for x in lk["customers"]] == [1, 2, 3, 4]  # close_dat is null
    assert lk["acc_flags"][0]["symbol"] == "A"
    d = c.get("/api/accounts/new-defaults").json(); assert d == {"open_date": "2026-10-12", "filial_id": 101, "acc_limit": 0, "acc_flags": []}


def test_required_fields_in_delphi_order():
    c = cl()
    for missing in accounts.REQUIRED_ORDER:
        body = {**NEW, missing: None}
        r = c.post("/api/accounts", json=body).json()["detail"]
        assert r["key"] == "accounts.err_required" and r["field"] == missing
    r = c.post("/api/accounts", json={**NEW, "acc_no": "", "acc_name": ""}).json()["detail"]; assert r["field"] == "acc_no"
    r = c.post("/api/accounts", json={**NEW, "acc_no": "AZ12_BAD*"}).json()["detail"]; assert r["key"] == "accounts.err_accno_chars"


def test_add_edit_flags_trunc_date():
    c = cl(); new = c.post("/api/accounts", json=NEW).json()["accid"]
    a = c.get(f"/api/accounts/{new}").json()
    assert a["opendate"] == "2026-10-12" and a["accflags"] == "A,I" and a["acc_flags_checked"] == ["A", "I"]
    assert c.post("/api/accounts", json=NEW).json()["detail"]["ora"].startswith("ORA-00001")
    assert c.put(f"/api/accounts/{new}", json={**NEW, "acc_name": "Renamed", "acc_flags": []}).json()["ok"]
    a = c.get(f"/api/accounts/{new}").json(); assert a["accname"] == "Renamed" and a["accflags"] == ""


def test_close_rules():
    c = cl("ADMIN", "Admin#2026")
    assert c.post("/api/accounts/1001/close").json()["detail"]["key"] == "accounts.err_close_balance"
    assert c.post("/api/accounts/1004/close").json()["detail"]["key"] == "accounts.err_already_closed"
    assert c.post("/api/accounts/1003/close").json()["ok"]
    assert c.get("/api/accounts/1003").json()["closedate"] == "2026-10-12"


def test_close_denied_by_db_for_teller():
    c = cl(); r = c.post("/api/accounts/1003/close").json()["detail"]; assert "ORA-20280" in r["ora"]


def test_transactions_and_totals():
    c = cl(); t = c.get("/api/accounts/1001/transactions").json()
    assert t["start"] == t["end"] == "2026-10-12"
    assert t["debit_total"] == 1250.0 and len(t["debit"]) == 2 and t["debit"][0]["debitaccno"] == t["accno"]
    assert t["credit_total"] == 830.5 and t["credit"][0]["creditaccno"] == t["accno"]
    t = c.get("/api/accounts/1001/transactions?start=2026-10-09&end=2026-10-09").json()
    assert t["debit"] == [] and t["active_tab"] == "credit" and t["credit_total"] == 120.0


def test_states_desc_abs():
    s = cl().get("/api/accounts/1001/states").json(); assert s[0]["archivedate"] == "2026-10-11" and s[0]["amount"] > 0
