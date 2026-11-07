"""SBDM_Settings_new - api/app/dep_settings.py."""
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


U = "/api/deposits/sett/"


def test_categories_post_delete():
    c = cl()
    o = post(c, U + "open", form="categories")
    assert [r["category"] for r in o["rows"]] == ["Fiziki şəxs", "Fərdi sahibkar", "Hüquqi şəxs"]
    o = post(c, U + "post", form="categories", values={"CATEGORY": "Bank"})
    assert o["rows"][-1]["category"] == "Bank" and o["rows"][-1]["id"] == 4
    rid = o["rows"][-1]["rid"]
    o = post(c, U + "post", form="categories", rid=rid, values={"CATEGORY": "Bank 2"})
    assert o["rows"][-1]["category"] == "Bank 2"
    assert post(c, U + "post", form="categories", code=400, values={"CATEGORY": "x" * 129})["detail"]["key"] == "deposits.st_err_size"
    o = post(c, U + "delete", form="categories", rid=rid)                  # also the Esc-in-grid path
    assert len(o["rows"]) == 3
    assert post(c, U + "delete", form="categories", code=400)["detail"]["key"] == "deposits.st_err_empty"


def test_cccgroups_master_detail():
    c = cl()
    o = post(c, U + "open", form="cccgroups")
    assert o["zones"][0]["zoneid"] == 1 and o["zones"][0]["description"] == "Depozit hesabları"
    z = o["zoneid"]; n = len(o["rows"])
    o = post(c, U + "post", form="cccgroups", zoneid=z, values={"ACCGROUP": "2120"})
    assert len(o["rows"]) == n + 1 and o["rows"][-1]["zoneid"] == z and o["rows"][-1]["accgroup"] == 2120
    assert post(c, U + "post", form="cccgroups", code=400, zoneid=z, values={"ACCGROUP": "abc"})["detail"]["key"] == "deposits.st_err_float"
    o = post(c, U + "delete", form="cccgroups", zoneid=z, rid=o["rows"][-1]["rid"])
    assert len(o["rows"]) == n


def test_deposittypes():
    c = cl()
    o = post(c, U + "open", form="deposittypes")
    assert [w["withdrtype"] for w in o["withtypes"]] == ["Standart", "Monthly"]
    assert post(c, U + "post", form="deposittypes", code=400, values={"TYPE": ""})["detail"]["key"] == "deposits.st_err_required"
    o = post(c, U + "post", form="deposittypes", values={"TYPE": "Yeni növ", "WITHDRAWTYPE": "Monthly", "AMOUNT_RULE": True})
    t = next(r for r in o["rows"] if r["type"] == "Yeni növ")
    assert t["amount_rule"] == 1 and t["percent_rule"] == 0 and t["withdrawtype"] == "Monthly"
    o = post(c, U + "post", form="deposittypes", rid=t["rid"], esc=True, values={"TYPE": "Esc növ", "WITHDRAWTYPE": "Monthly"})
    t2 = next(r for r in o["rows"] if r["id"] == t["id"])
    assert t2["type"] == "Esc növ" and t2["amount_rule"] == 1                 # CheckBrowseMode Post keeps the old rules
    o = post(c, U + "delete", form="deposittypes", id=t["id"])
    assert all(r["id"] != t["id"] for r in o["rows"])
    used = post(c, U + "delete", form="deposittypes", code=400, id=1)
    assert "ORA-02292" in used["detail"]["ora"]


def test_accountturning():
    c = cl()
    o = post(c, U + "open", form="accountturning")
    assert o["typeid"] == 1 and [m["id"] for m in o["movies"]] == [41, 42] and o["parentid"] == 41
    n = len(o["rows"])
    assert post(c, U + "post", form="accountturning", code=400, parentid=41, values={"ACCID": 340001})["detail"]["field"] == "BRANCHID"
    acc = next(a for a in o["accounts"])
    o = post(c, U + "post", form="accountturning", parentid=41, values={"BRANCHID": 102, "ACCID": acc["id"]})
    r = o["rows"][-1]
    assert len(o["rows"]) == n + 1 and r["currencyid"] == o["valutes"][0]["valute"] and r["filialname"] and r["accountnumber"] == acc["acc_no"]
    o = post(c, U + "delete", form="accountturning", parentid=41, rid=r["rid"])
    assert len(o["rows"]) == n


def test_refer():
    c = cl()
    t = post(c, U + "open", form="refer")["tree"]
    assert [n["lname"] for n in t] == ["Ümumi", "Faizlər"] and [n["id"] for n in t[0]["children"]] == [2, 3]
    assert post(c, U + "refer/item", form="refer", id=1) == {"mode": "none", "apply": False}
    assert post(c, U + "refer/item", form="refer", id=3)["mode"] == "edit"
    i = post(c, U + "refer/item", form="refer", id=2)
    assert i["items"] == ["360", "365", "366"] and i["index"] == 1
    assert post(c, U + "refer/apply", form="refer", id=2, index=2)["index"] == 2
    assert post(c, U + "refer/apply", form="refer", id=2, code=400)["detail"]["key"] == "deposits.st_err_index"
    assert post(c, U + "refer/apply", form="refer", id=3, value="4")["value"] == "4"


def test_rights():
    d = cl("DEPOSITOR", "Depositor#2026")
    for f, code in (("categories", "SBCM_CUSTOMERS_TYPE"), ("deposittypes", "SBCM_DEPOSIT_TYPE")):
        r = d.post(U + "open", json={"form": f})
        assert r.status_code == 400 and code in r.json()["detail"]["ora"], r.text
