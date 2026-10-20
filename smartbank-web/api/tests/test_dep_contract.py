"""NewDepositsContract.bpl (new / edit / view contract) - api/app/dep_contract.py."""
import datetime as dt

import pytest
from fastapi.testclient import TestClient
from app import main, sessions
from app.db import mock, mock_dep


@pytest.fixture(autouse=True)
def fresh():
    mock.reset(); mock_dep.reset(); sessions.attempts._f.clear(); sessions.store._s.clear(); yield


def cl(u="ADMIN", p="Admin#2026"):
    c = TestClient(main.app); assert c.post("/api/login", json={"username": u, "password": p}).status_code == 200; return c


class Form:
    def __init__(self, c, mode="InsertContract", **sel):
        self.c = c
        r = c.post("/api/deposits/contract/open", json={"mode": mode, **sel})
        self.status = r.status_code; self.j = r.json()
        if r.status_code == 200:
            self.st, self.rec, self.ui = self.j["state"], self.j["rec"], self.j["ui"]

    def ev(self, e, **rec):
        self.rec.update(rec)
        r = self.c.post("/api/deposits/contract/event", json={"state": self.st, "rec": {**self.rec, "_ui": self.ui}, "event": e})
        assert r.status_code == 200, r.text
        j = r.json(); self.st, self.rec = j["state"], j["rec"]; self.ui.update(j["ui"]); return self

    def save(self):
        return self.c.post("/api/deposits/contract/save", json={"state": self.st, "rec": {**self.rec, "_ui": self.ui}})


def filled(c):
    f = Form(c)
    f.st["custno_text"] = "30001"; f.ev("customer", CUSTOMERID=30001)
    f.ev("customer", CURRENCY=944).ev("type", CONTRACTTYPE=1).ev("period", PERIODID=11).ev("capper", CAPITALPERID=111, AMOUNT=60000)
    return f


def test_insert_defaults_sequence_and_panels():
    f = Form(cl())
    today = dt.date.today().isoformat()
    assert f.rec["ID"] == 6001 and f.rec["CURRENCY"] == 0 and f.rec["BRANCHID"] == 101             # SEG_DM_CONTRACTS, Get_FilialID
    assert f.rec["OPENDATE"] == f.rec["CLOSEDATE"] == f.rec["FIRSTINTERESTPAYDAT"] == today          # Date, not Get_BankDate
    assert f.ui["caption"] == "Müqavilənin  əlavə olunması" and f.ui["user"] is None and f.ui["buttons"]
    vis = {p["name"]: p["visible"] for p in f.ui["panels"]}
    assert vis["CustNomPanel"] and not vis["ThirdPersonNamePanel"] and not vis["CreditParticepatePanel"] and not vis["AgentPanel"]
    assert [t["id"] for t in f.ui["types"]] == [1, 2]                                                  # Filter 'status=0'


def test_customer_change_fills_name_type_and_category():
    f = filled(cl())
    assert f.ui["cust_name"].startswith("Əliyev") and f.ui["custtype_name"] == " Fiziki "
    assert f.st["persons_type"] == 1 and f.st["client_type"] == 3                                      # valcategory 1 (currency <> 0)
    f.st["custno_text"] = "30008"; f.ev("customer", CUSTOMERID=30008)                                  # closed customer: no row
    assert f.ui["cust_name"] == "" and f.st["persons_type"] == 0 and f.st["client_type"] == 3          # FClientType kept


def test_customer_not_integer_is_rejected():
    f = Form(cl()); f.st["custno_text"] = "12a"
    r = f.c.post("/api/deposits/contract/event", json={"state": f.st, "rec": f.rec, "event": "customer"})
    assert r.status_code == 400 and r.json()["detail"]["key"] == "deposits.c_err_int"


def test_type_period_capper_compute_dates_and_rates():
    f = filled(cl())
    assert f.rec["CONTRACTNO"] == "DM1-101-0006"
    od = dt.date.today()
    assert f.rec["CLOSEDATE"] == od.replace(year=od.year + 1).isoformat()                             # 12 'AY'
    assert f.rec["INTEREST"] == 10.0 and f.rec["DUEINTEREST"] == 2.5 and f.rec["OVERDUEINTEREST"] == 1.0 and f.st["depperset_id"] == 2
    assert not f.ui["percent_list_visible"]
    f.ev("capper", CAPITALPERID=112)                                                                   # two settings rows
    assert f.ui["percent_list_visible"] and f.rec["INTEREST"] == 8.5 and f.rec["FIRSTINTERESTPAYDAT"] == od.isoformat()
    f.ev("type", CONTRACTTYPE=2).ev("period", PERIODID=22).ev("capper", CAPITALPERID=221)
    assert f.rec["CLOSEDATE"] == (od + dt.timedelta(days=180)).isoformat()                             # 'GÜN'
    f.ev("type", CONTRACTTYPE=None)
    assert f.ui["periods"] == [] and f.ui["capperiods"] == []


def test_prize_regenerates_contract_number():
    f = filled(cl()); f.st["prize"] = 2; f.ev("type")
    assert f.rec["CONTRACTNO"].endswith("-P2")


def test_check_needs_fields_first_null():
    f = Form(cl())
    r = f.save(); assert r.status_code == 400
    assert r.json()["detail"] == {"key": "deposits.c_err_empty", "ora": None, "field": "Müştərinin No"}


def test_insert_save_commits_adds_accounts_and_opens_next():
    c = cl(); f = filled(c)
    r = f.save(); assert r.status_code == 200, r.text
    j = r.json()
    assert j["closed"] is False and j["accounts"] == 3 and j["pending"] and j["rec"]["ID"] == 6002 and j["state"]["commited"]
    n = mock_dep._LAST["n"]
    assert n["p_ContractID"] == 6001 and n["p_Type"] == 3 and n["p_OverduePercent"] == 2.5 and n["p_DuePercent"] == 1.0   # crossed
    assert n["p_ClientType"] == 3 and n["p_personaltype"] == 1 and n["p_deppersetid"] == 2
    row = next(x for x in c.post("/api/deposits/list", json={}).json()["rows"] if x["id"] == 6001)
    assert row["contractno"] == "DM1-101-0006" and row["amount"] == 60000
    acc = mock_dep._db().execute("select count(*) from dm_contract_accno where contractid = 6001").fetchone()[0]
    assert acc == 3
    mock_dep._db().rollback()                                                                           # AddAccount is not committed
    assert mock_dep._db().execute("select count(*) from dm_contract_accno").fetchone()[0] == 0
    assert mock_dep._db().execute("select count(*) from dm_contracts where id = 6001").fetchone()[0] == 1


def test_insert_failed_post_rolls_back():
    c = cl(); f = filled(c); f.rec["CUSTOMERID"] = 39999
    r = f.save(); assert r.status_code == 400 and "ORA-02291" in r.json()["detail"]["ora"]


def test_browse_after_cancel_save_shows_first_field():
    f = filled(cl()); f.st["browse"] = True
    r = f.save(); assert r.json()["detail"]["field"] == "Müştərinin No"


def test_edit_loads_record_and_updates_selected_contract():
    c = cl()
    f = Form(c, "EditContract", selected_id=5001, selected_no="DM-2026-0001")
    assert f.status == 200 and f.ui["caption"] == "DM-2026-0001 № li müqavilənin redaktə olunması" and f.ui["user"] == "teller"
    assert [x["id"] for x in f.ui["filials"]] == [101] and [t["id"] for t in f.ui["types"]] == [1, 2, 3]
    assert f.rec["INTEREST"] == 9.0 and f.ui["cust_name"].startswith("Əliyev")
    f.rec["AMOUNT"] = 12345
    r = f.save(); assert r.status_code == 200 and r.json()["closed"] is True
    assert mock_dep._LAST["n"]["p_ContractID"] == 5001
    assert next(x for x in c.post("/api/deposits/list", json={}).json()["rows"] if x["id"] == 5001)["amount"] == 12345


def test_look_has_no_buttons_and_cannot_save():
    f = Form(cl(), "LookContract", selected_id=5001, selected_no="DM-2026-0001")
    assert f.ui["buttons"] is False
    assert f.save().status_code == 400


def test_edit_without_selection():
    f = Form(cl(), "EditContract")
    assert f.status == 400 and f.j["detail"]["key"] == "deposits.err_no_deposit"


def test_credit_list_uses_sid():
    f = Form(cl(), "EditContract", selected_id=5001, selected_no="DM-2026-0001")
    r = f.c.post("/api/deposits/contract/credits", json={"state": f.st, "rec": {**f.rec, "_ui": f.ui}}).json()["rows"]
    assert len(r) == 1 and r[0]["numberofcredit"] == "KR-2026-0701" and r[0]["name"].startswith("Əliyev") and r[0]["filialname"]


def test_user_opens_module_but_is_denied_edit_only():
    """DEPOSITOR has the deposits module and DM_CONTRACTLOOK, but not DM_CONTRACTUPDATE (nor DM_ADMIN)."""
    c = cl("DEPOSITOR", "Depositor#2026")
    assert c.get("/api/deposits/init").status_code == 200
    assert c.post("/api/deposits/list", json={}).status_code == 200
    assert Form(c).status == 200                                                                       # Yeni: no right check
    assert Form(c, "LookContract", selected_id=5001, selected_no="x").status == 200
    f = Form(c, "EditContract", selected_id=5001, selected_no="x")
    assert f.status == 400 and "ORA-20280" in f.j["detail"]["ora"] and "DM_CONTRACTUPDATE" in f.j["detail"]["ora"]
    assert c.post("/api/deposits/settings-menu").status_code == 400
