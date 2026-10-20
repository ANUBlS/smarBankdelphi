"""Exchange Manager chunk 1 (TExchangeMGR_X, Packages/ExchangeMGR-NBC) - api/app/exchangemgr.py."""
import json
import pytest
from fastapi.testclient import TestClient
from app import main, sessions, em_sql as Q
from app.db import mock, mock_em

U = "/api/exchangemgr"
B = dict(dat="2026-10-12", sdat="2026-10-12")


@pytest.fixture(autouse=True)
def fresh():
    mock.reset(); mock_em.reset(); sessions.attempts._f.clear(); sessions.store._s.clear(); yield


def cl():
    c = TestClient(main.app); assert c.post("/api/login", json={"username": "ADMIN", "password": "Admin#2026"}).status_code == 200; return c


def post(c, url, code=200, **b):
    r = c.post(U + url, json=b); assert r.status_code == code, r.text; return r.json()


def test_sql_verbatim_from_binary_dfm():
    assert Q.DM_ODSExchOffice == "select * from ex_office \norder by ex_no"
    assert "decode(p.status,'1', 'alış', '2','satış', '3', 'mübadilə') as status_str" in Q.DM_ODSExchProvarch
    assert Q.DM_ODSExchProvarch.endswith("p.status not in (4,5)\n\n\nORDER BY :Title")
    assert Q.DM_ODS_RFilial.startswith("select -1 as ID, 'Bütün məntəqələr' as name from Dual")
    assert Q.SQL_EX_REMAINDER == "begin exch_mgr.ExRemainderSql(vdat=>:dat,v_exid=>:ex_id,sdat=>:sdat,result=>:result); end;"


def test_rates_filial_sql3():
    assert Q.sql_rates_filial(-1).split("\n")[3] == ""
    assert Q.sql_rates_filial(2).split("\n")[3] == "and ex_id=2"
    assert Q.sql_rates_filial(-1).split("\n")[2] == "     dat   =:dat and val_id in(1,45,48,50,784,792,981)"


def test_init_opens_like_activeformcreate():
    j = cl().get(U + "/init").json()
    assert j["opened"] and j["message"] is None and j["dat"].startswith("2026-10-12") and j["time"] == "10:15:00"
    assert mock_em.CALLS[0] == ("EXCH_MGR.NEXTRESURS", ["2026-10-12"])
    assert [o["ex_no"] for o in j["offices"]] == [1, 2, 3] and j["offices"][1]["filialname"]  # shared mock filial table
    assert {r["status"] for r in j["provarch"]} == {1, 2} and all(r["ex_id"] == 1 for r in j["provarch"])   # status not in (4,5)
    assert j["provarch"][0]["status_str"] == "alış" and j["provarch"][2]["status_cashless"] == "nağdsız"
    assert j["sum_fee"] == 14.5                                                    # status in (1,2,3), max(dat)
    assert [r["id"] for r in j["resurs"]] == [71, 72]                              # dat = :vdat or nextstatus = 1
    assert j["resurs"][1]["status_str"] == "Resurs qaytarılır"
    usd = j["remainder"][0]
    assert usd["current_ostat"] == 12000 + 5000 - 0 + 1000 - 0                     # ODSExRemainderCalcFields
    assert len(j["rates_filial"]) == 6 and j["rates_filial"][3]["exname"] == "VDM-2 Gəncə"
    assert j["vdm_all"][0] == {"ex_no": -1, "ex_name": "Bütün məntəqələr"}


def _fixture(monkeypatch, **kw):
    from app.config import settings
    D = json.load(open(settings.mock_fixtures + "/exchangemgr.json", encoding="utf-8"))
    D.update(kw)
    orig = mock_em._db
    def db():
        if mock_em._DB is None:
            orig()
            mock_em._DB = (mock_em._DB[0], D)
        return mock_em._DB
    monkeypatch.setattr(mock_em, "_db", db)


def test_init_system_date_greater(monkeypatch):
    _fixture(monkeypatch, sbop_date="2026-10-13")
    j = cl().get(U + "/init").json()
    assert not j["opened"] and j["message"] == "em.err_sysdate_greater" and mock_em.CALLS == []


def test_init_calendar_message(monkeypatch):
    _fixture(monkeypatch, calendar=["2026-10-12"])
    j = cl().get(U + "/init").json()
    assert j["message"] == "em.err_calendar" and not j["opened"] and "remainder" not in j
    assert mock_em.CALLS[0][0] == "EXCH_MGR.NEXTRESURS"                          # NextResurs runs before the check


def test_office_scroll_reopens_details():
    c = cl()
    j = post(c, "/office", ex_no=2, **B)
    assert [r["id"] for r in j["provarch"]] == [505] and [r["id"] for r in j["resurs"]] == [73]
    assert j["remainder"][0]["current_ostat"] == 10700 and j["sum_fee"] == 1.5
    assert post(c, "/office", ex_no=1, title="LAMOUNT", **B)["provarch"]          # ORDER BY :Title (bind)
    assert post(c, "/office", ex_no=None, **B)["provarch"] == []


def test_remainder_show_calls_change_proc(monkeypatch):
    c = cl()
    assert post(c, "/remainder/show", ex_no=1, **B)["refreshed"]
    assert mock_em.CALLS[-1] == ("EXCH_MGR.EX_REMAINDERPROV_CHANGE", [1])
    _fixture(monkeypatch, ex_date_change=2)
    mock_em._DB = None
    assert post(c, "/remainder/show", ex_no=1, **B) == {"refreshed": False}


def test_rates_and_filial_filter_and_resurs():
    c = cl()
    assert [r["val_id"] for r in post(c, "/rates", dat="2026-10-12")["rates"]] == [1, 45, 48]
    assert post(c, "/rates", dat="2026-10-11")["rates"] == []
    rf = post(c, "/rates-filial", ex_id=2, dat="2026-10-12")["rates_filial"]
    assert {r["ex_id"] for r in rf} == {2} and len(rf) == 3
    assert [r["id"] for r in post(c, "/resurs/refresh", ex_no=1, **B)["resurs"]] == [71, 72]
