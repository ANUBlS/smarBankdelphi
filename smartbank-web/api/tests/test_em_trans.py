"""Exchange Manager chunk 2 (Packages/ExchangeMGR-NBC) - api/app/em_trans.py: FormPurchase / FormSelling, Confirm, Delete."""
import pytest
from fastapi.testclient import TestClient
from app import main, sessions, em_trans
from app.db import mock, mock_em

U = "/api/exchangemgr/trans"
B = dict(ex_no=1, dat="2026-10-12", sdat="2026-10-12")
CUST = dict(cust_name="Elvin", cust_lname="Quliyev", cust_father="Rauf", cust_passport="1234567", cust_date="2018-03-01",
            cust_confirm="Pasport", cust_giving_member="ASAN", cust_country="Azərbaycan")


@pytest.fixture(autouse=True)
def fresh():
    mock.reset(); mock_em.reset(); sessions.attempts._f.clear(); sessions.store._s.clear(); yield


def cl():
    c = TestClient(main.app); assert c.post("/api/login", json={"username": "ADMIN", "password": "Admin#2026"}).status_code == 200; return c


def post(c, url, code=200, **b):
    r = c.post(U + url, json=b); assert r.status_code == code, r.text; return r.json()


def save_body(kind="purchase", **kw):
    b = dict(kind=kind, trans_date="2026-10-12", val_id=1, val_name="USD", amount="1000", ekv_amount="1695", fee_amount="5",
             course="1.695000", nb_course="1.7", setting="BİR MİN  USD -nin 1.695000 KURSLA ALIŞI ", exch_name="VDM-1 Nizami", **B)
    b.update(kw); return b


def test_sum_num_to_full_verbatim():
    f = em_trans.sum_num_to_full
    assert f(0) == "" and f(1) == "BİR " and f(15) == "ON BEŞ " and f(90) == "DOXSAN" and f(95) == "DOXSANBEŞ "
    assert f(1234.5) == "BİR MİN İKİ YÜZ OTUZ DÖRD "
    assert f(2000000) == "İKİ MİLİYON "                      # i = 3 -> 'MİLİYON ', the empty thousands add nothing
    assert f(12000) == "ON İKİ MİN " and f(100000) == "YÜZ MİN "


def test_float_helpers():
    assert em_trans.float_to_str(6.170000000000073) == "6.17000000000007" and em_trans.float_to_str(1695.0) == "1695"
    with pytest.raises(ValueError, match="'' is not a valid floating point value"):
        em_trans.str_to_float("")


def test_open_purchase_lookups_and_rights(monkeypatch):
    c = cl()
    j = post(c, "/open", kind="purchase", **B)
    assert j["opened"] and j["clear"] and j["date"].startswith("2026-10-12") and j["time"] == "10:15:00"
    usd = next(a for a in j["acc"] if a["val_id"] == 1)
    assert usd["val_purchase_course"] == 1.695 and usd["val_nb_course"] == 1.7            # ODSExchRate lookup
    assert usd["val_purchase_course_user"] == 1.695 and usd["cashless_purchase_course"] == 1.693   # ODSRatesFilial (all filials, first row)
    assert [a["val_id"] for a in j["acc"]] == [0, 1, 45, 48]                              # ex_accounts where ex_id = :ex_id
    assert j["cust"]["cust_name"] == ["Rəşad"]
    assert mock_em.CALLS[-1] == ("EXCH_MGR.EX_REMAINDERPROV_CHANGE", [1])                 # FormActivate ex_date_change = 0
    assert post(c, "/open", kind="selling", ex_no=1, dat="2026-10-11", sdat="2026-10-11") == {"opened": False, "message": "em.err_no_rates"}
    from app.db import DBError
    def deny(conn, code):
        raise DBError(f"ORA-20280: Access is denied for {code}", 20280)
    monkeypatch.setattr(em_trans, "check_right", deny)
    r = c.post(U + "/open", json=dict(kind="purchase", **B))
    assert r.status_code == 400 and "EXCH_BUYINSERT" in r.text


def test_calc_round_new_and_text():
    c = cl()
    j = post(c, "/calc", kind="purchase", amount="1234.5", course="1.695000", nb_course="1.7", val_name="USD")
    assert j == {"setting": "BİR MİN İKİ YÜZ OTUZ DÖRD  USD -nin 1.695000 KURSLA ALIŞI ", "ekv_amount": "2092.48", "fee_amount": "6.17000000000007"}
    assert post(c, "/calc", kind="selling", amount="", course="", nb_course="", val_name="")["setting"] == ""
    assert post(c, "/calc", kind="selling", amount="10", course="1.7050000", nb_course="1.7", val_name="USD")["setting"].endswith(" KURSLA SATIŞI ")
    assert "is not a valid floating point value" in post(c, "/calc", kind="purchase", amount="1x", course="1", nb_course="1", val_name="USD")["error"]


def test_save_purchase_insert_commits():
    c = cl()
    j = post(c, "/save", **save_body(**CUST))
    assert j["closed"] and j["message"] is None and j["result_id"] == 507
    add = next(x for x in mock_em.CALLS if x[0] == "EXCH_MGR.ADD_EX_PROV_TRANS")[1]
    assert add["status"] == 1 and add["val_changed_name"] == "AZN" and add["val_changed_course"] == 1 and add["trans_close"] == 0
    assert add["RDebitAmount"] == 18000.0 and add["RLAmount"] == 0.0 and add["PCashless"] == 0 and add["SessionName"] == "ADMIN"
    assert add["cust_date"].isoformat().startswith("2018-03-01")
    names = [x[0] for x in mock_em.CALLS]
    assert names[-2:] == ["EXCH_MGR.EX_CONSTANTS_ADD", "COMMIT"]                          # INSERT_POSTS False: no ex_transaction
    assert 507 in [r["id"] for r in j["provarch"]] and "Elvin" in j["cust"]["cust_name"]


def test_save_validation_paths():
    c = cl()
    assert post(c, "/save", **save_body(cust_name="X")) == {"closed": False, "message": "em.err_cust_incomplete"}
    assert post(c, "/save", **save_body(val_name="AZN", val_id=0)) == {"closed": False, "message": "em.err_same_currency"}
    j = post(c, "/save", **save_body(amount=""))                                          # StrToFloat('') inside try
    assert j["closed"] and j["message"] == "em.err_raw" and "not a valid floating point" in j["text"]
    assert not any(x[0] == "EXCH_MGR.ADD_EX_PROV_TRANS" for x in mock_em.CALLS)


def test_save_selling_cashless_and_insert_posts(monkeypatch):
    c = cl()
    monkeypatch.setattr(em_trans, "INSERT_POSTS", True)
    j = post(c, "/save", **save_body("selling", cashless=True, course="1.7050000", trans_date="2026-10-13"))
    assert j["closed"] and j["message"] is None
    add = next(x for x in mock_em.CALLS if x[0] == "EXCH_MGR.ADD_EX_PROV_TRANS")[1]
    assert add["status"] == 2 and add["PCashless"] == 1
    tx = next(x for x in mock_em.CALLS if x[0].startswith("EXCH_TRANS."))
    assert tx[0] == "EXCH_TRANS.EX_TRANSACTION_ADDITIONAL" and tx[2] is True                # sysdate < dat -> a_Flags
    assert tx[1][1:5] == [1002, 2002, 5002, 6002] and tx[1][9:11] == [1, 1.705]             # Kredit, Debit, ... changed course, course


def test_confirm_posts_and_commits():
    c = cl()
    j = post(c, "/confirm", id=501, **B)
    assert j["done"]
    names = [x[0] for x in mock_em.CALLS]
    assert names[-3:] == ["EXCH_MGR.CALCULATE_REMAINDER", "EXCH_TRANS.EX_TRANSACTION", "COMMIT"]
    tx = mock_em.CALLS[-2]
    assert tx[1][:6] == [501, 2002, 1002, 5002, 6002, 1] and tx[2] is False
    assert next(r for r in j["provarch"] if r["id"] == 501)["trans_close"] == 1
    assert post(c, "/confirm", id=502, **B)["done"] is False                                 # trans_close = 1 -> exit
    post(c, "/confirm", id=503, **B)
    assert mock_em.CALLS[-2][0] == "EXCH_TRANS.EX_TRANSACTION"


def test_confirm_selling_uses_additional():
    c = cl()
    post(c, "/confirm", id=505, ex_no=2, dat="2026-10-12", sdat="2026-10-12")
    tx = mock_em.CALLS[-2]
    assert tx[0] == "EXCH_TRANS.EX_TRANSACTION_ADDITIONAL" and tx[1][1:3] == [1006, 2006]


def test_delete_asks_then_deletes():
    c = cl()
    assert post(c, "/delete", id=501, **B) == {"done": False, "ask": True}
    assert not any(x[0] == "EXCH_MGR.EX_PROVARCH_DELETE" for x in mock_em.CALLS)
    j = post(c, "/delete", id=501, confirmed=True, **B)
    assert j["done"] and 501 not in [r["id"] for r in j["provarch"]]
    assert mock_em.CALLS[-2:] == [("EXCH_MGR.EX_PROVARCH_DELETE", [1, 501]), ("COMMIT",)]
