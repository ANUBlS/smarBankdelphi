"""SBDM_Contract_new.bpl - api/app/dep_contract.py (Packages/SBDM_Contract_new/frmDepositContract_new_Impl.pas)."""
import pytest
from fastapi.testclient import TestClient
from app import main, sessions, dep_contract as dc
from app.db import mock


@pytest.fixture(autouse=True)
def fresh():
    mock.reset(); sessions.attempts._f.clear(); sessions.store._s.clear(); yield


def cl(u="ADMIN", p="Admin#2026"):
    c = TestClient(main.app); assert c.post("/api/login", json={"username": u, "password": p}).status_code == 200; return c


def op(c, mode="InsertContract", sid=None, sno=None):
    r = c.post("/api/deposits/contract/open", json={"mode": mode, "selected_id": sid, "selected_no": sno}); assert r.status_code == 200, r.text
    return r.json()


def ev(c, f, event, amount_text=None, code=200):
    r = c.post("/api/deposits/contract/event", json={"state": f["state"], "rec": {**f["rec"], "_ui": f["ui"]}, "event": event, "amount_text": amount_text})
    assert r.status_code == code, r.text
    if code == 200:
        j = r.json(); f.update(state=j["state"], rec=j["rec"], ui={**f["ui"], **j["ui"]})
    return r.json()


def save(c, f):
    return c.post("/api/deposits/contract/save", json={"state": f["state"], "rec": {**f["rec"], "_ui": f["ui"]}})


def fill(c, f):
    f["rec"].update(CUSTOMERID=30001); ev(c, f, "customer")
    f["rec"].update(CURRENCY=944); ev(c, f, "currency")
    f["rec"].update(CONTRACTTYPE=1); ev(c, f, "type")
    f["rec"].update(PERIODID=12); ev(c, f, "period")
    f["rec"].update(CAPITALPERID=121); ev(c, f, "capper")
    f["rec"].update(AMOUNT=5000); ev(c, f, "genint", "5000")
    f["rec"].update(CONTRACTNO="DP-944-0100", CLIENTTYPE=1, PERSONALTYPE=1, CONTRACTACCID=805001, INTERESTACCID=815001,
                    CLIENTACCID=905001, BOOROWERACCID=906101)


def test_new_defaults_from_addcontract():
    f = op(cl())
    r = f["rec"]
    assert r["CURRENCY"] == 0 and r["BRANCHID"] == 101 and r["OPENDATE"] == r["CLOSEDATE"] == r["FIRSTINTERESTPAYDAT"]
    assert f["state"]["inserted"] and f["state"]["autopr"] and f["ui"]["caption"] == "Müqavilənin  əlavə olunması"
    assert [t["withdrawtype"] for t in f["ui"]["types"]] == ["Standart", "Standart", "BefoPercent"]   # no status filter


def test_customer_opens_account_lookups_by_currency():
    c = cl(); f = op(c)
    f["rec"]["CUSTOMERID"] = 30001; ev(c, f, "customer")
    assert f["ui"]["cust_name"].startswith("Əliyev")
    a = f["ui"]["accs"]
    # CURRENCY 0 is not a valute: the valutes cursor stays on the first row (944)
    assert [x["accno"] for x in a["dep"]] == ["21160944005001"]               # the closed 2116 account is left out
    assert sorted(x["accno"] for x in a["client"]) == ["3811944005001", "3811944006101", "3811978005004"]
    f["rec"]["CURRENCY"] = 978; ev(c, f, "currency")
    assert [x["accno"] for x in f["ui"]["accs"]["dep"]] == ["21180978005004"]


def test_period_and_capital_period_dates():
    c = cl(); f = op(c)
    od = f["rec"]["OPENDATE"]
    f["rec"]["CONTRACTTYPE"] = 1; ev(c, f, "type")
    assert [p["id"] for p in f["ui"]["periods"]] == [11, 12, 13]
    f["rec"]["PERIODID"] = 12; ev(c, f, "period")
    assert f["rec"]["CLOSEDATE"] == dc.inc_month(dc._d(od), 6).isoformat() and f["state"]["close_enabled"]
    f["rec"]["CAPITALPERID"] = 122; ev(c, f, "capper")                       # Rüblük: 90 div 30 = 3 months
    assert f["rec"]["FIRSTINTERESTPAYDAT"] == dc.inc_month(dc._d(od), 3).isoformat()
    f["rec"]["CONTRACTTYPE"] = 2; f["rec"]["PERIODID"] = 22; ev(c, f, "type"); ev(c, f, "period")   # 'Gün'
    assert dc._d(f["rec"]["CLOSEDATE"]) - dc._d(od) == __import__("datetime").timedelta(days=90)
    f["rec"]["PERIODID"] = 21; ev(c, f, "period")
    assert not f["state"]["close_enabled"]                                   # period 0 disables the close date


def test_genannualint_null_amount_and_rates():
    c = cl(); f = op(c)
    r = ev(c, f, "genint", None, code=400)
    assert r["detail"]["key"] == "deposits.c_err_variant"                    # DBNumberEditEh.Value Null -> Real
    fill(c, f)
    assert f["rec"]["INTEREST"] == "9" and f["rec"]["OVERDUEINTEREST"] == 1.5 and f["rec"]["DUEINTEREST"] == 0.5


def test_checkneedsfields_order_and_messages():
    c = cl(); f = op(c)
    r = save(c, f).json()["detail"]
    assert r["key"] == "deposits.c_err_empty" and r["field"] == "Müqavilənin №"     # BRANCHID is set by AddContract
    fill(c, f); f["rec"]["BOOROWERACCID"] = None
    assert save(c, f).json()["detail"]["key"] == "deposits.c_err_boracc"
    f["rec"].update(BOOROWERACCID=906101, CLIENTTYPE=3, CURRENCY=978, BRANCHID=103)
    assert save(c, f).json()["detail"]["key"] == "deposits.c_err_bankacc"
    f["rec"].update(CLIENTTYPE=1, CURRENCY=944, BRANCHID=101, CONTRACTTYPE=3)
    assert save(c, f).json()["detail"]["key"] == "deposits.c_err_befoacc"


def test_insert_saves_commits_and_stays_open():
    c = cl(); f = op(c); fill(c, f)
    r = save(c, f); assert r.status_code == 200, r.text
    j = r.json()
    assert not j["closed"] and j["state"]["commited"] and j["rec"]["CONTRACTNO"] is None   # AddContract: next blank record
    lst = c.post("/api/deposits/list", json={}).json()["rows"]
    new = [x for x in lst if x["contractno"] == "DP-944-0100"]
    assert new and new[0]["interest"] == "9" and new[0]["contractaccno"] == "21160944005001"
    f["state"] = j["state"]
    r = save(c, f)                                                           # same number again -> ORA-00001, rolled back
    assert r.status_code == 400 and "ORA-00001" in r.json()["detail"]["ora"]


def test_edit_loads_record_and_updates():
    c = cl(); f = op(c, "EditContract", 5003, "DP-944-0003")
    r = f["rec"]
    assert r["CONTRACTNO"] == "DP-944-0003" and r["INTEREST"] == "10;10.5" and r["PERIODID"] == 31 and r["AUTOPR"] == 1
    assert f["ui"]["caption"] == "DP-944-0003 № li müqavilənin redaktə olunması" and f["ui"]["user"] == ""
    assert f["state"]["accs_open"] and [x["accno"] for x in f["ui"]["accs"]["befo"]] == ["2120944006003"]
    f["rec"].update(AMOUNT=60000, BEFO_INTERESTPEYTACCID=836003)
    j = save(c, f).json()
    assert j["closed"] and j["state"]["commited"]
    row = [x for x in c.post("/api/deposits/list", json={}).json()["rows"] if x["id"] == 5003][0]
    assert row["amount"] == 60000


def test_cancel_insert_then_save_hints_filial_and_f5_closed_dataset():
    c = cl(); f = op(c)
    r = c.post("/api/deposits/contract/refresh", json={"state": f["state"], "rec": {**f["rec"], "_ui": f["ui"]}})
    assert r.status_code == 400 and r.json()["detail"]["key"] == "deposits.c_err_closed_ds"   # account lookups not open yet
    f["state"]["browse"] = True
    assert save(c, f).json()["detail"]["field"] == "Filial"


def test_rights_new_allowed_edit_denied():
    c = cl("DEPOSITOR", "Depositor#2026")
    assert c.post("/api/deposits/contract/open", json={"mode": "InsertContract"}).status_code == 200
    r = c.post("/api/deposits/contract/open", json={"mode": "EditContract", "selected_id": 5001})
    assert r.status_code == 400 and "EDIT_SBCM_CONTRACT" in r.json()["detail"]["ora"]


def test_float_to_str():
    assert dc.float_to_str(9.0) == "9" and dc.float_to_str(10.5) == "10.5" and dc.float_to_str(0.1 + 0.2) == "0.3"
