"""Exchange Manager chunk 3 (Packages/ExchangeMGR-NBC) - api/app/em_setup.py: set-up forms reachable from the Delphi UI."""
import pytest
from fastapi.testclient import TestClient
from app import main, sessions, em_setup
from app.db import mock, mock_em, DBError

U = "/api/exchangemgr/setup"
ENV = dict(EM_BAL_MANAT="1011", EM_BAL_VALUTA="1012", EM_BAL_GELIR="6011", EM_BAL_ZERER="7011",
           EM_BALANCE_MAIN_DEBT="1001", EM_BALANCE_MAIN_CRED="1002")


@pytest.fixture(autouse=True)
def fresh(monkeypatch):
    mock.reset(); mock_em.reset(); sessions.attempts._f.clear(); sessions.store._s.clear()
    for k, v in ENV.items():
        monkeypatch.setenv(k, v)
    yield


def cl(user="SMART", pw="Smart#2026"):
    c = TestClient(main.app); assert c.post("/api/login", json={"username": user, "password": pw}).status_code == 200; return c


def admin():
    return cl("ADMIN", "Admin#2026")


def post(c, url, code=200, **b):
    r = c.post(U + url, json=b); assert r.status_code == code, r.text; return r.json()


def calls(name):
    return [x for x in mock_em.CALLS if x[0] == name]


def test_offices_smart_only():
    a = admin()
    for url in ("/office/add-open", "/office/edit-open", "/office/delete", "/acc/refresh", "/acc/open", "/acc/save", "/acc/delete",
                "/param/open", "/role"):
        assert post(a, url) == {"done": False, "message": "em.err_no_right"}, url
    assert post(a, "/office/add", ex_no="9") == {"done": False, "message": "em.err_no_right"}


def test_office_add_edit_delete_no_commit():
    c = cl()
    j = post(c, "/office/add-open")
    assert j["filial"] == 101 and [f["id"] for f in j["filials"]] == [101, 102]
    j = post(c, "/office/add", ex_no="9", ex_name="VDM-9", ex_address="Bakı", ex_worker_name="X", ex_check_no="C9", filial=102)
    assert j["done"] and any(o["ex_no"] == 9 and o["filialname"] for o in j["offices"])
    assert calls("EXCH_MGR.EX_OFFICE_ADD")[0][1] == [9, "VDM-9", "Bakı", "X", "C9", 102]
    r = c.post(U + "/office/add", json=dict(ex_no="9.5", filial=101))            # StrToInt -> EConvertError, form stays open
    assert r.status_code == 400 and "'9.5' is not a valid integer value" in r.text
    new_id = next(o["id"] for o in j["offices"] if o["ex_no"] == 9)
    e = post(c, "/office/edit-open", id=new_id)
    assert (e["ex_no"], e["ex_name"], e["filial"]) == (9, "VDM-9", 102)
    j = post(c, "/office/edit", id=new_id, ex_no="10", ex_name="VDM-10", ex_address="Bakı", ex_worker_name="Y", ex_check_no="C10", filial=101)
    assert calls("EXCH_MGR.EX_OFFICE_EDIT")[0][1] == [new_id, 10, "VDM-10", "Bakı", "Y", "C10", 101]
    assert post(c, "/office/delete", id=new_id) == {"done": False, "ask": True}
    j = post(c, "/office/delete", id=new_id, confirmed=True)
    assert all(o["id"] != new_id for o in j["offices"])
    assert not calls("COMMIT")                                                  # Delphi never commits after these calls


def test_office_add_null_filial():
    c = cl()
    r = c.post(U + "/office/add", json=dict(ex_no="9", filial=None))
    assert r.status_code == 400 and "Could not convert variant of type (Null) into type (Integer)" in r.text
    assert not calls("EXCH_MGR.EX_OFFICE_ADD")


def test_accounts_open_add_edit_delete():
    c = cl()
    assert [a["val_id"] for a in post(admin(), "/acc/list", ex_no=1)["acc"]] == [0, 1, 45, 48]   # list: no SMART check
    j = post(c, "/acc/open", ex_no=1, mode=1)
    assert calls("EXCH_MGR.CHECK_USERROLE")[0][1] == ["SMART"]
    assert j["val_id"] == -1 and j["sel"]["selling"] is None and j["sel"]["purchase"] == -1
    assert j["filial"] == 101 and {a["acc_no"][:4] for a in j["main_debt"]} == {"1011"}
    assert j["main_cred"] == [] and j["cash_kredit"] == []                     # val_id = -1
    cur = post(c, "/acc/currency", val_id=45, filial=101)
    assert [a["acc_no"][:7] for a in cur["main_cred"]] == ["1012045"] and [a["acc_no"][:7] for a in cur["cash_kredit"]] == ["1002045"]
    ids = dict(purchase_acc_id=j["main_debt"][0]["id"], selling_acc_id=cur["main_cred"][0]["id"], profit_acc_id=j["child_debt"][0]["id"],
               harm_acc_id=j["child_cred"][0]["id"], cash_acc_id=j["cash_debt"][0]["id"], pur_acc_id=cur["cash_kredit"][0]["id"])
    bad = c.post(U + "/acc/save", json=dict(mode=1, ex_no=1, val_id=45, val_name="EUR", **{**ids, "selling_acc_id": None}))
    assert bad.status_code == 400 and "(Null) into type (Integer)" in bad.text
    j = post(c, "/acc/save", mode=1, ex_no=1, val_id=45, val_name="EUR", **ids)
    assert calls("EXCH_MGR.EX_ACCOUNTS_ADD")[0][1][:3] == [1, 45, "EUR"] and len(j["acc"]) == 5
    assert post(c, "/acc/save", mode=1, ex_no=1, val_id=-1)["done"] and len(calls("EXCH_MGR.EX_ACCOUNTS_ADD")) == 1   # KeyValue = -1 -> nothing
    acc = next(a for a in j["acc"] if a["val_id"] == 45 and a["purchase_acc_id"] == ids["purchase_acc_id"])
    e = post(c, "/acc/open", ex_no=1, mode=2, acc_id=acc["id"])
    assert e["val_id"] == 45 and e["sel"]["selling"] == ids["selling_acc_id"] and e["main_cred"]
    post(c, "/acc/save", mode=2, ex_no=1, acc_id=acc["id"], val_id=45, val_name="EUR", **ids)
    assert calls("EXCH_MGR.EX_ACCOUNTS_EDIT")[0][1][:3] == [acc["id"], 1, 45]
    assert post(c, "/acc/delete", ex_no=1, acc_id=acc["id"]) == {"done": False, "ask": True}
    assert len(post(c, "/acc/delete", ex_no=1, acc_id=acc["id"], confirmed=True)["acc"]) == 4
    assert not calls("COMMIT")


def test_ini_default_minus_one(monkeypatch):
    monkeypatch.setenv("EM_BAL_MANAT", " ")
    assert em_setup.ini("Bal_Manat") == "-1"
    j = post(cl(), "/acc/open", ex_no=1, mode=1)
    assert j["main_debt"] == []


def test_parametr():
    c = cl()
    j = post(c, "/param/open")
    assert [u["name"] for u in j["users"]] == ["ADMIN", "SMART", "TELLER"]        # checkmodaccess_int = 1, order by name
    assert j["admin_in"] == []                                                  # master = first user (ADMIN, id 1)
    assert [a["ex_id"] for a in post(c, "/param/admin-in", user_id=2)["admin_in"]] == [1]
    j = post(c, "/param/add", user_id=2, user_name="TELLER", ex_no=2)
    off2 = mock_em._run("select * from ex_office where EX_NO = 2")[0]
    assert calls("EXCH_MGR.EX_ADMIN_IN_ADD")[0][1] == [2, off2["FILIAL"], "TELLER", 2, off2["EX_NAME"]]
    assert sorted(a["ex_id"] for a in j["admin_in"]) == [1, 2]
    j = post(c, "/param/del", user_id=2, ex_no=1)
    assert calls("EXCH_MGR.EX_ADMIN_IN_DEL")[0][1] == [2, "TELLER", 1, "VDM-1 Nizami"] and [a["ex_id"] for a in j["admin_in"]] == [2]
    assert not calls("COMMIT")


def test_remainder_form():
    j = post(admin(), "/remainder", ex_no=1, dat="2026-10-12")
    usd = next(r for r in j["rows"] if r["val_id"] == 1)
    assert usd["current_ostat"] == 12000 + 5000 - 0 + 1000 - 0


def test_resurs_give_return_confirm_delete(monkeypatch):
    a = admin()
    R = dict(ex_no=1, dat="2026-10-12", sdat="2026-10-12", rem_dat="2026-10-12")
    g = post(a, "/resurs/give-open", **R)
    assert g["vdm"] == "VDM-1 Nizami" and [v["valute"] for v in g["valutes"]] == [0, 1, 45, 48, 50]
    assert post(a, "/resurs/give", **R, val_id=None) == {"done": False, "message": "em.err_choose_currency"}
    assert post(a, "/resurs/give", **R, val_id=1, amount=0) == {"done": False, "message": "em.err_enter_amount"}
    assert post(a, "/resurs/give", **R, val_id=1, amount=10, next_day=True) == {"done": False, "message": "em.err_enter_date"}
    j = post(a, "/resurs/give", **R, val_id=1, val_name="USD", amount=250.5, next_day=True, next_dat="2026-10-13")
    assert calls("EXCH_MGR.VDMRESURSINSERT")[0][1] == [1, "USD", 1, "VDM-1 Nizami", 250.5, "2026-10-12", "2026-10-13", 1, 1, 1,
                                                        "VDM-ə dövriyyədən vəsaitin verilməsi"]
    new = max(j["resurs"], key=lambda r: r["id"])
    assert new["commitstatus"] == 0 and new["status_str"] == "Resurs verilir"
    assert post(a, "/resurs/return-amount", **R, val_id=1)["amount"] == 18000
    r = a.post(U + "/resurs/return-amount", json=dict(R, val_id=-1))
    assert r.status_code == 400 and "(Null)" in r.text
    post(a, "/resurs/return", **R, val_id=1, val_name="USD", amount=100)
    assert calls("EXCH_MGR.VDMRETRUNRESURSINSERT")[0][1] == [1, "USD", 1, "VDM-1 Nizami", 100.0, "2026-10-12", 2, 1, "VDM-dən resursun geri qaytarılması"]
    assert not calls("COMMIT")
    j = post(a, "/resurs/confirm", **R, id=new["id"])
    assert j["done"] and calls("EXCH_MGR.VDMRESURSTRANSACTION")[0][1] == [new["id"]] and calls("COMMIT")
    assert post(a, "/resurs/delete", **R, id=new["id"]) == {"done": False, "ask": True}
    assert post(a, "/resurs/delete", **R, id=new["id"], confirmed=True)["done"]
    assert post(a, "/resurs/delete", **R, id=73, confirmed=True) == {"done": False}       # commitstatus <> 1 -> exit
    def deny(conn, code):
        raise DBError(f"ORA-20280: Access is denied for {code}", 20280)
    monkeypatch.setattr(em_setup, "check_right", deny)
    assert "EXCH_RESURSCOMMIT" in a.post(U + "/resurs/confirm", json=dict(R, id=73)).text
    assert "EXCH_RESURSINSERT" in a.post(U + "/resurs/give-open", json=R).text


def test_rates_filial_post_commits_then_checks(monkeypatch):
    a = admin()
    rf = a.post("/api/exchangemgr/rates-filial", json=dict(ex_id=-1, dat="2026-10-12")).json()["rates_filial"]
    row = rf[0]
    j = post(a, "/rates-filial/post", rowid=row["rowid"], changes={"VAL_PURCHASE_COURSE_USER": 1.69}, ex_id=-1, dat="2026-10-12")
    assert j["done"] and j["message"] is None and j["rates_filial"][0]["val_purchase_course_user"] == 1.69
    assert [x[0] for x in mock_em.CALLS][-2:] == ["UPDATE EX_RATES_FILIAL", "COMMIT"]
    assert post(a, "/rates-filial/post", 400, rowid=row["rowid"], changes={"DAT": 1}, ex_id=-1, dat="2026-10-12")
    def deny(conn, code):
        raise DBError(f"ORA-20280: Access is denied for {code}", 20280)
    monkeypatch.setattr(em_setup, "check_right", deny)
    assert "EXCH_UPDATE" in post(a, "/rates-filial/nav", button="edit", dat="2026-10-12")["message"]
    j = post(a, "/rates-filial/nav", button="refresh", ex_id=1, dat="2026-10-12")
    assert "EXCH_UPDATE" in j["message"] and {r["ex_id"] for r in j["rates_filial"]} == {1}
    j = post(a, "/rates-filial/post", rowid=row["rowid"], changes={"CASHLESS_SELLING_COURSE": 1.71}, ex_id=-1, dat="2026-10-12")
    assert j["done"] and "EXCH_UPDATE" in j["message"] and j["rates_filial"][0]["cashless_selling_course"] == 1.71   # committed anyway
