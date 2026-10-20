import pytest
from fastapi.testclient import TestClient
from app import main, sessions, customers as cu
from app.db import mock


@pytest.fixture(autouse=True)
def fresh():
    mock.reset(); sessions.attempts._f.clear(); sessions.store._s.clear(); yield


def cl(u="TELLER", p="Teller#2026"):
    c = TestClient(main.app); assert c.post("/api/login", json={"username": u, "password": p}).status_code == 200; return c


GOOD = dict(open_dat="2026-10-12", name="Yeni Şirkət MMC", short_name="Yeni Şirkət", inn="1900000001", risk_categ=1,
            incorporation_cntr=31, country_code=31, city=1, address="Neftçilər pr. 1", tph_number="+994125550000",
            quality_id=1)


# ---------------------------------------------------------------- ToolButton4Click (pure)
ALL_REQ = {c: True for c in cu.REQUIRED_FLAG_COLUMNS}


def _err(c, req):
    with pytest.raises(cu.ValidationError) as e:
        cu.validate(cu.CustomerIn(**c), req)
    return e.value.key


def test_validation_order_matches_toolbutton4click():
    c = {}
    order = []
    full = dict(name="N", short_name="S", incorporation_number="1", risk_categ=1, inn="1", dat_nal="2020-01-01",
                dat_ustav="2020-01-01", samelydate="2020-01-01", incorporation_cntr=31, address_type="W", country_code=31,
                city=1, address="a", tph_contact_type="W", tph_communication_type="T", tph_number="1")
    # remove fields one by one from the end: the reported error must always be the first missing in Delphi order
    for f, _flag, kind in cu.VALIDATION:
        if kind == "eqstr":
            continue
        c = dict(full); c[f] = None
        assert _err(c, ALL_REQ) == "customers.err_" + f
        order.append(f)
    assert order == ["name", "short_name", "incorporation_number", "risk_categ", "inn", "dat_nal", "dat_ustav",
                     "samelydate", "incorporation_cntr", "country_code", "city", "address", "tph_number"]
    cu.validate(cu.CustomerIn(**full), ALL_REQ)


def test_short_name_is_always_required_and_flags_switch_others_off():
    assert _err(dict(name="x"), {}) == "customers.err_short_name"
    cu.validate(cu.CustomerIn(short_name="s"), {})          # nothing else required when get_Messaj = 0


def test_no_trim_and_keyvalue_quirk():
    cu.validate(cu.CustomerIn(name=" ", short_name=" "), {"name": True})   # Delphi: Text='' only, no Trim
    # address_type / tph_* compare KeyValue = '' -> an unselected (NULL) lookup does NOT fail
    cu.validate(cu.CustomerIn(short_name="s", address_type=None, tph_contact_type=None), ALL_REQ | {
        "name": False, "incorporation_number": False, "risk_categ": False, "inn": False, "dat_nal": False,
        "dat_ustav": False, "samelydate": False, "incorporation_cntr": False, "country_code": False, "city": False,
        "address": False, "tph_number": False})
    assert _err(dict(short_name="s", address_type=""), {"address_type": True}) == "customers.err_address_type"


def test_add_customer_params_null_to_zero_and_names():
    r = cu.customer_record(cu.CustomerIn(short_name="s", nerezident=1, city=7))
    p = cu.add_customer_params(r)
    assert p["OP_ID"] == 0 and p["CLOSE_DAT"] is None and p["NEREZIDENT"] == 1
    assert p["PRINAD_KOD"] == 0 and p["v_risk_categ"] == 0 and p["v_quality_id"] is None   # AsInteger(NULL)=0
    assert p["v_CITY"] == "7" and p["NAME"] is None
    u = cu.upd_customer_params(9, r)
    assert u["v_ID"] == 9 and u["v_OPEN_DAT"] is None and u["v_INCORP_NUM"] is None and "OP_ID" not in u
    assert len(u) == len(p) + 1


def test_flag_map_and_check_params():
    assert cu.flag_map(["A     Arrested", "O     Open"]) == "A,O" and cu.flag_map([]) == ""
    a = cu.NewAccountIn(currency="944", bal_cn="3801", customer_id="1", branch="101", report_symbol="1")
    assert not cu.check_params(a, False, False) and cu.check_params(a, False, True)     # commit also needs acc no
    assert cu.check_params(a, True, False)                                              # Bal_CN2 visible -> required
    assert cu.check_params(cu.NewAccountIn(currency="944", bal_cn=" ", customer_id="1", branch="1", report_symbol="1"), False, False)


# ---------------------------------------------------------------- API
def test_module_right_and_list():
    c = cl()
    r = c.get("/api/customers").json()
    assert [x["id"] for x in r["rows"]] == [1, 2, 3, 4, 6, 7]       # cust_type 0 only, closed excluded
    r = c.get("/api/customers?sort=NAME").json(); assert r["rows"][0]["name"] == "Aysel Mammadova"
    assert c.get("/api/customers?sort=1;drop").status_code == 400
    mock._load()["users"]["TELLER"]["rights"].remove(cu.CLSID)
    assert c.get("/api/customers").status_code == 403


def test_speed_search_prefix_from_current_and_backtick():
    c = cl()
    assert c.get("/api/customers/locate?field=name&text=ca").json()["rn"] == 3
    assert c.get("/api/customers/locate?field=name&text=i").json()["rn"] == 5      # 'i' -> '`' matches 'Ilkin' via NAME1
    assert c.get("/api/customers/locate?field=name&text=ca&after=3").json()["rn"] is None   # 'sona çatdı'
    assert c.get("/api/customers/locate?field=inn&text=1400").json()["rn"] == 1
    assert c.get("/api/customers/locate?field=id&text=7").json()["rn"] == 6
    assert c.get("/api/customers/locate?field=name&text=%25").json()["rn"] is None     # wildcards literal
    assert c.get("/api/customers/locate-date?d=2020-02-14").json()["rn"] == 3


def test_accounts_transactions_and_account_search():
    c = cl()
    accs = c.get("/api/customers/1/accounts").json(); assert [a["id"] for a in accs] == [1001, 1002]
    r = c.get("/api/customers/search-account?acc_no=AZ12SMRT3301").json()
    assert r["customer_id"] == 3 and [a["id"] for a in r["accounts"]] == [1005, 1006, 1008]
    assert c.get("/api/customers/search-account-name?name=trade").json()["customer_id"] == 3
    tr = c.get("/api/customers/accounts/1001/transactions").json()
    assert [t["id"] for t in tr] == [5001, 5002, 5003, 5004, 6003, 6004]
    assert {t["status"] for t in tr} == {1, 2, 3}
    st = c.get("/api/customers/accounts/1001/states").json(); assert st[0]["archivedate"] < st[-1]["archivedate"]
    d = c.get("/api/customers/accounts/1001/documents?acc_no=X").json()
    assert d["start"] == d["end"] == "2026-10-12" and d["debit_total"] == 1250.0 and d["credit_total"] == 830.5


def test_save_flow_pep_then_blacklist_then_saved():
    c = cl()
    lk = c.get("/api/customers/card-lookups").json()
    assert lk["required"]["name"] and not lk["required"]["dat_nal"] and lk["default_quality_id"] == 1
    assert c.post("/api/customers", json={**GOOD, "name": ""}).json()["detail"]["key"] == "customers.err_name"
    assert c.post("/api/customers", json=GOOD).json()["status"] == "pep_check"        # first save -> PEP dialog
    assert c.post("/api/customers/pep/close").json()["ok"]
    assert c.post("/api/customers", json=GOOD).json()["status"] == "saved"
    bl = {**GOOD, "name": "  Black Sanction Ltd "}
    assert c.post("/api/customers", json=bl).json()["status"] == "blacklist"
    assert c.post("/api/customers", json={**bl, "blacklist_confirmed": True}).json() == {"status": "saved", "blacklisted": True}
    rows = c.get("/api/customers").json()["rows"]; assert len(rows) == 8
    new = [r for r in rows if r["name"] == "Yeni Şirkət MMC"][0]
    assert new["prinad_kod"] == 0 and new["open_dat"] == "2026-10-12"
    # edit
    assert c.put(f"/api/customers/{new['id']}", json={**GOOD, "short_name": "YŞ"}).json()["status"] == "saved"
    assert c.get(f"/api/customers/{new['id']}").json()["short_name"] == "YŞ"
    # PEP state is per web session (Delphi: per loaded plugin)
    c2 = cl("ADMIN", "Admin#2026")
    assert c2.post("/api/customers", json=GOOD).json()["status"] == "pep_check"


def test_close_customer():
    c = cl("ADMIN", "Admin#2026")
    assert c.post("/api/customers/1/close").json()["detail"]["key"] == "customers.err_has_accounts"
    assert c.post("/api/customers/6/close").json() == {"ok": True}
    assert 6 not in [r["id"] for r in c.get("/api/customers").json()["rows"]]


def test_close_customer_denied_for_teller():
    c = cl()
    r = c.post("/api/customers/6/close"); assert r.status_code >= 400 and "20280" in str(r.json())


def test_step_commit_and_delete():
    c = cl()
    assert c.post("/api/customers/transactions/commit", json={"acc_id": 1001, "ids": [5001], "current_id": 5001}).json()["detail"]["key"] == "customers.err_already_committed"
    r = c.post("/api/customers/transactions/commit", json={"acc_id": 1001, "ids": [6003, 6004, 5002], "current_id": 6004}).json()
    assert r == {"committed": 1, "errors": 1, "last_error": "ORA-20110: Amount exceeds the operator commit limit", "total": 2}
    r = c.post("/api/customers/transactions/delete", json={"acc_id": 1003, "ids": [6002], "multi": False}).json()
    assert r == {"deleted": [6002], "blocked": [], "failed": []}
    # 6004 is operation type 9, vid_op.TrDelete=1 -> 'Bu tip əməliyyatı bu moduldan ləğv etmək olmaz'
    r = c.post("/api/customers/transactions/delete", json={"acc_id": 1001, "ids": [6004], "multi": False}).json()
    assert r == {"deleted": [], "blocked": [6004], "failed": []}


def test_delete_single_error_raises_multi_swallows():
    c = cl()
    r = c.post("/api/customers/transactions/delete", json={"acc_id": 1001, "ids": [5001], "multi": False})
    assert r.status_code >= 400
    r = c.post("/api/customers/transactions/delete", json={"acc_id": 1001, "ids": [5001, 6003], "multi": True}).json()
    assert r["deleted"] == [6003] and r["failed"][0]["id"] == 5001


def test_new_account_generate_and_open():
    c = cl()
    f = c.get("/api/customers/3/new-account").json()
    assert f["defaults"]["customer_id"] == "3" and f["defaults"]["branch"] == "101" and not f["bal2_visible"]
    assert f["lists"]["currencies"][0]["valute"] == -1 and f["lists"]["flags"][0]["symbol"] == "A"
    body = dict(currency="944", bal_cn="3801", customer_id="3", branch="101", report_symbol="1", open_date="2026-10-12",
                acc_name="Caspian Trade LLC", limit="0", flags=["A     x"])
    assert c.post("/api/customers/new-account/generate", json={**body, "bal_cn": ""}).json()["detail"]["key"] == "customers.err_incomplete"
    no = c.post("/api/customers/new-account/generate", json=body).json()["acc_no"]
    assert c.post("/api/customers/new-account", json=body).json()["detail"]["key"] == "customers.err_incomplete"
    assert c.post("/api/customers/new-account", json={**body, "acc_no": no}).json()["result"] > 1007
    assert no in [a["accno"] for a in c.get("/api/customers/3/accounts").json()]
