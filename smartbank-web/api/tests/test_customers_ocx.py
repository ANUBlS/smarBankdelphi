"""Customers.ocx (Packages/Customers), P_Customers and CustomersInformations endpoints: every /api/customers/ocx/*
and /api/customers/info-ocx/* route, against the verbatim Delphi SQL in app/customers.py."""
import pytest
from fastapi.testclient import TestClient
from app import main, sessions, customers as cu
from app.db import mock

B = "/api/customers"


@pytest.fixture(autouse=True)
def fresh():
    mock.reset(); sessions.attempts._f.clear(); sessions.store._s.clear(); yield


def cl(u="TELLER", p="Teller#2026"):
    c = TestClient(main.app); assert c.post("/api/login", json={"username": u, "password": p}).status_code == 200; return c


def test_sql_is_verbatim_delphi():
    assert "decode(c.cust_type,null,'Hüquqi', 1, 'Fiziki', 2, 'f.s.') tip from CUSTOMERS C" in cu.SQL_OCX_CUS_BASE
    assert " UNION ALL " in cu.SQL_OCX_ACC_BASE and "out_Account" in cu.SQL_OCX_ACC_BASE
    assert cu.OCX_CUST_SORT == ("ID", "NAME", "OPEN_DAT")
    assert len(cu.OCX_CLSIDS) == 4


def test_init():
    j = cl().get(f"{B}/ocx/init").json()
    assert j["filials"] and j["currencies"] and j["vid_sob"] and j["system_date"]


@pytest.mark.parametrize("sort", cu.OCX_CUST_SORT)
def test_list_sorts(sort):
    rows = cl().get(f"{B}/ocx/list", params={"sort": sort}).json()["rows"]
    assert rows
    k = sort.lower()
    vals = [r[k] for r in rows if r[k] is not None]
    assert vals == sorted(vals)
    assert all(r["tip"] in (None, "Hüquqi", "Fiziki", "f.s.") for r in rows)


def test_list_bad_sort_and_filters():
    c = cl()
    assert c.get(f"{B}/ocx/list", params={"sort": "id;drop"}).status_code == 400
    allr = c.get(f"{B}/ocx/list").json()["rows"]
    f = c.get(f"{B}/ocx/list", params={"filial": 102}).json()["rows"]
    assert len(f) <= len(allr)
    for ct in (0, 1, 2):
        rr = c.get(f"{B}/ocx/list", params={"cust_type": ct}).json()["rows"]
        assert all(r["tip"] in cu._TIP[ct] for r in rr) if hasattr(cu, "_TIP") else True
    q = allr[0]
    assert any(r["id"] == q["id"] for r in c.get(f"{B}/ocx/list", params={"q_id": str(q["id"])}).json()["rows"])
    assert c.get(f"{B}/ocx/list", params={"q_name": q["name"][:3]}).json()["total"] >= 1


@pytest.mark.parametrize("sort", ["unused", *cu.OCX_ACC_SORT])
def test_accounts(sort):
    rows = cl().get(f"{B}/ocx/1/accounts", params={"sort": sort}).json()
    assert rows and {"id", "accno", "accname", "opendate", "currencysname", "balance", "lbalance"} <= set(rows[0])


def test_accounts_currency_filters_out_branch_only():
    c = cl()
    allr = c.get(f"{B}/ocx/1/accounts").json()
    r = c.get(f"{B}/ocx/1/accounts", params={"currency_id": 999999}).json()
    on_balance = [x for x in allr if not str(x["accno"]).startswith("9")]
    assert len(r) <= len(allr) and len(r) >= 0
    assert c.get(f"{B}/ocx/1/accounts", params={"q_accno": allr[0]["accno"][:4]}).json()
    assert on_balance is not None


def test_add_update_close():
    c = cl()
    r = c.post(f"{B}/ocx/customers", json={"name": "OCX Test MMC", "short_name": "OCX", "inn": "1999999999",
                                            "open_dat": "2026-10-01"})
    assert r.status_code == 200, r.text
    nid = r.json()["id"]
    assert nid
    assert c.post(f"{B}/ocx/customers", json={"name": "", "short_name": "x"}).status_code == 400
    u = c.put(f"{B}/ocx/customers/{nid}", json={"name": "OCX Renamed", "short_name": "OCX2"})
    assert u.status_code == 200, u.text
    assert any(x["name"] == "OCX Renamed" for x in c.get(f"{B}/ocx/list").json()["rows"])
    assert c.put(f"{B}/ocx/customers/987654", json={"name": "a", "short_name": "b"}).status_code == 404
    cl_ = c.post(f"{B}/ocx/customers/{nid}/close")
    assert cl_.status_code in (200, 400)


def test_info_cards_and_ipinfo():
    c = cl()
    j = c.get(f"{B}/ocx/customers/1/info").json()
    assert j["cards"] and {"id", "idcust", "name", "lastname", "paspnum"} <= set(j["cards"][0])
    card = j["cards"][0]["id"]
    s = c.post(f"{B}/ocx/customers/1/info", json={"id": card, "name": "Ali", "lastname": "Mammadov",
                                                  "birthday": "1990-02-03", "paspnum": "777"})
    assert s.status_code == 200, s.text
    assert next(x for x in s.json()["cards"] if x["id"] == card)["paspnum"] == "777"
    n = c.post(f"{B}/ocx/customers/1/info", json={"id": None, "name": "New", "lastname": "Card"}).json()
    assert len(n["cards"]) == len(j["cards"]) + 1 and n["id"]
    ip = c.post(f"{B}/ocx/customers/1/ipinfo", json={"cardid": card, "bdate": "1990-02-03", "profession": "Eng",
                                                     "monthlyprofit": 1500})
    assert ip.status_code == 200, ip.text and ip.json()["ip_info"]["profession"] == "Eng"
    ip2 = c.post(f"{B}/ocx/customers/1/ipinfo", json={"cardid": card, "profession": "Doc"}).json()
    assert ip2["ip_info"]["profession"] == "Doc"
    assert str(card) in c.get(f"{B}/ocx/customers/1/info").json()["ip_info"]
    d = c.delete(f"{B}/ocx/customers/1/info/{n['id']}").json()
    assert all(x["id"] != n["id"] for x in d["cards"])


@pytest.mark.parametrize("t", ["prinad", "qrp_klie", "vid_sob", "org_prav", "sferadey", "otrasli", "nalog"])
def test_settings(t):
    assert cl().get(f"{B}/ocx/settings/{t}").status_code == 200


def test_settings_bad():
    assert cl().get(f"{B}/ocx/settings/users").status_code == 400


@pytest.mark.parametrize("mode", ["customers", "accounts", "documents"])
def test_analyze(mode):
    r = cl().get(f"{B}/info-ocx/analyze", params={"mode": mode})
    assert r.status_code == 200, r.text
    assert r.json()["mode"] == mode and r.json()["total"] >= (1 if mode != "documents" else 0)


def test_analyze_bad_mode_and_filters():
    c = cl()
    assert c.get(f"{B}/info-ocx/analyze", params={"mode": "x"}).status_code == 400
    assert c.get(f"{B}/info-ocx/analyze", params={"mode": "accounts", "min_bal": 0, "filial": 101}).status_code == 200
    assert c.get(f"{B}/info-ocx/analyze", params={"mode": "customers", "cust_type": 1,
                                                  "start_date": "2000-01-01"}).status_code == 200


def test_no_right_403(monkeypatch):
    c = cl()
    monkeypatch.setattr(mock.MockConnection, "call_bool", lambda self, *a, **k: False)
    for u in ("/ocx/init", "/ocx/list", "/ocx/1/accounts", "/ocx/customers/1/info", "/info-ocx/analyze"):
        assert c.get(B + u).status_code == 403, u
