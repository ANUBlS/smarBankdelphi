"""SBDM_PercentSettings_new - api/app/dep_pct.py."""
import pytest
from fastapi.testclient import TestClient
from app import main, sessions
from app.db import mock, mock_dep


@pytest.fixture(autouse=True)
def fresh():
    mock.reset(); sessions.attempts._f.clear(); sessions.store._s.clear(); yield


def cl(u="ADMIN", p="Admin#2026"):
    c = TestClient(main.app); assert c.post("/api/login", json={"username": u, "password": p}).status_code == 200; return c


def post(c, url, code=200, **b):
    r = c.post(url, json=b); assert r.status_code == code, r.text; return r.json()


U = "/api/deposits/pct/"


def test_open_chain_first_rows():
    c = cl()
    o = post(c, U + "open")
    cur = o["cur"]
    # DepositTypes first (1) -> depperiods order by period (11) -> caps order by period (113, PERIOD 0) -> AZN -> amount order by lastamount (1)
    assert (cur["dep"], cur["period"], cur["cap"], cur["val"], cur["amt"]) == (1, 11, 113, 944, 1)
    assert [r["id"] for r in o["caps"]] == [113, 111, 112]
    assert [r["id"] for r in o["pers"]] == [201, 202]            # order by LAST_DAY, id
    assert [r["id"] for r in o["dats"]] == [301, 302]
    # amount row 2 -> DepositPerSetting reopened with amount_setting_id 2
    o = post(c, U + "state", dep=1, period=11, cap=113, val=944, amt=2)
    assert [r["id"] for r in o["pers"]] == [203] and o["dats"] == []
    # USD: amount 3, no rate rows; a period being inserted (0) -> dependent queries with 0
    o = post(c, U + "state", val=840)
    assert o["cur"]["amt"] == 3 and o["pers"] == []
    o = post(c, U + "state", period=0)
    assert o["caps"] == [] and o["amounts"] == [] and o["cur"]["amt"] == 0


def test_post_master_detail_and_keypress_assign():
    c = cl()
    o = post(c, U + "post", ds="periods", values={"PERIOD": "18", "DESCRIPTION": "18 ay", "PERIOD_TYPE": "Ay"}, sel={})
    new = [r for r in o["periods"] if r["period"] == 18][0]
    assert new["depid"] == 1                                       # DetailFields DEPID := DepositTypes.ID
    assert post(c, U + "post", 400, ds="periods", values={"DESCRIPTION": "x"}, sel={})["detail"]["key"] == "deposits.st_err_required"
    assert post(c, U + "post", 400, ds="caps", values={"PERIOD": "abc"}, sel={})["detail"]["key"] == "deposits.st_err_float"
    # amount grid: KeyPress assigns PeriodID / Currencyid
    o = post(c, U + "post", ds="amounts", values={"FIRSTAMOUNT": "1000000,01", "LASTAMOUNT": "5000000"}, assign=True, sel={})
    a = [r for r in o["amounts"] if r["lastamount"] == 5000000][0]
    assert (a["periodid"], a["currencyid"], a["firstamount"]) == (11, 944, 1000000.01)
    # rate row without the KeyPress assignment: CURRENCYID required
    assert post(c, U + "post", 400, ds="pers", values={"INTERESTRATE": "7"}, sel={})["detail"]["field"] == "CURRENCYID"
    o = post(c, U + "post", ds="pers", values={"INTERESTRATE": "7", "LAST_DAY": "720"}, assign=True, sel={})
    r = [x for x in o["pers"] if x["last_day"] == 720][0]
    assert (r["depid"], r["capitalid"], r["amount_setting_id"], r["write_memory"], r["confirmation"]) == (1, 113, 1, 0, 0)
    assert r["hdate"].startswith("2026-10-12")
    # early-payout row: DEPSETID := DepositPerSetting.ID (current record)
    o = post(c, U + "post", ds="dats", values={"PERCENT": "1", "LASTDATEINT": "180"}, assign=True, sel={"pers": o["pers"][1]["rid"]})
    d = [x for x in o["dats"] if x["lastdateint"] == 180][0]
    assert d["depsetid"] == 202 and d["valcod"] == 944
    # key press: 18 AsFloat values, before the assignment on the first press
    mock_dep.PCT_LOG.clear()
    post(c, U + "keypress", rid=None, values={"INTERESTRATE": "6"}, assigned=False, sel={})
    post(c, U + "keypress", rid=None, values={"INTERESTRATE": "6"}, assigned=True, sel={})
    (n1, a1), (n2, a2) = mock_dep.PCT_LOG
    assert n1 == n2 == "DEPPSETING_UPD_HIST_NEW" and len(a1) == 18
    assert a1[1] == 0.0 and a1[2] == 6.0 and a2[1] == 944.0 and a2[6] == 1.0


def test_delete_and_buttons():
    c = cl()
    o = post(c, U + "open")
    mock_dep.PCT_LOG.clear()
    o = post(c, U + "delete", ds="pers", rid=o["pers"][0]["rid"], sel={})
    assert [r["id"] for r in o["pers"]] == [202]
    assert mock_dep.PCT_LOG[0] == ("DEPPSETING_HIST_NEW", [201, 0])
    assert post(c, U + "delete", 400, ds="dats", rid=None, sel={})["detail"]["key"] == "deposits.st_err_empty"
    # Təsdiqlə before Yaddaşa yaz: 202 has write_memory 0
    assert post(c, U + "confirm", sel={})["message"].endswith("təsdiqlənə bilməz!")
    assert post(c, U + "save", sel={})["message"].endswith("yaddaşa yazıldı.")
    assert post(c, U + "confirm", change_old=True, sel={}) == {"ask": "Sazlanmis yeni faiz dərəcəsi əvvəlki bu tip depozitlərin bütün yatrımlarının aid edilsinmi?"}
    mock_dep.PCT_LOG.clear()
    assert post(c, U + "confirm", change_old=True, answer=True, sel={})["message"].endswith("təsdiqləndi.")
    assert mock_dep.PCT_LOG[0] == ("UPD_TRANSH_PERCENT", [944, 11, 113, 1, 1, 0.0, 10000.0, 9.0])
    assert mock_dep.PCT_LOG[1] == ("upd_confir_and_writ_memory_new", [944, 11, 113, 1, 1, 1])


def test_rights():
    c = cl("TELLER", "Teller#2026")
    assert c.post(U + "open", json={}).status_code in (400, 403)          # no Deposits module right
    c = cl("DEPOSITOR", "Depositor#2026")
    post(c, U + "open")                                                     # SBCM_PERCENT_SETTING granted
    assert "SBCM_PERCENT_SETTING_SAVE" in post(c, U + "save", 400, sel={})["detail"]["ora"]
    assert "SBCM_PERCENT_SETTING_COMMIT" in post(c, U + "confirm", 400, sel={})["detail"]["ora"]
