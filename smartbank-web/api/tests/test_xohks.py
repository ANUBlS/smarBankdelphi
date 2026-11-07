"""Packages/LVPCSSManager_Turan (XÖHKS, TLVPCSSForm) step 1 - the four tabs' lists and archives. Expected values traced by
hand from LVPCSSImpl.pas / Data_Unit.dfm and fixtures/xohks.json (bank date SBOP.GET_DATE = 2026-10-12, USEBANKDATE = 1)."""
from fastapi.testclient import TestClient

from app.main import app
from app.db import mock as mock_db
from app import xohks as X
from app import xohks_sql as Q

client = TestClient(app)
B = "/api/xohks"


def login(u="ADMIN", p="Admin#2026"):
    mock_db.reset()
    assert client.post("/api/login", json={"username": u, "password": p}).status_code == 200


def P(path, body=None, code=200):
    r = client.post(B + path, json=body or {})
    assert r.status_code == code, r.text
    return r.json()


def test_sql_verbatim_lines():
    assert Q.LINES_XS_BATCHS[15] == "  (x.transdate>=:BeginDate and x.transdate<=:EndDate)"
    assert Q.LINES_XS_BATCHS[25] == " order by :Title" and len(Q.LINES_XS_BATCHS) == 34
    assert [l for l in Q.LINES_XS_INCOMINGVIEW if l.strip()] == ["select * from xs_incomingview x", "order by :title"]
    assert len(Q.LINES_XS_INCOMINGSUM) == 7 and Q.LINES_XS_INCOMINGSUM[6] == ""      # BitBtn1Click writes SQL[6]
    assert Q.LINES_SUMAVTORIZATOR == ["select nvl(sum(amount),0) as cem  from xs_batchs_today where amount<>0", " and status=6"]
    assert Q.LINES_DATA_ADMIN_IN[3] == "where USER_ID=uid"


def test_open_form_create():
    """ActiveFormCreate :792: dates = GetUseDate (bank date), XS_BATCHS of 12.10 ordered by x.ID, sum, edit1..3 from
    xs_batchs_today (status 1 / 4 / 6), XS_IncomingView ordered by x.id."""
    login()
    r = P("/open")
    assert r["use_date"] == "2026-10-12" and r["beneficiary_visible"]
    assert [b["id"] for b in r["batchs"]] == [229, 230, 231, 232]                 # 233 is dated 11.10
    assert r["batchs_sum_text"] == "16801.25"
    assert (r["edit1"], r["edit2"], r["edit3"]) == ("Modifikasiya =12000", "Verifikasiya =800", "Avtorizasiya =2500.75")
    assert [x["id"] for x in r["incoming"]] == [71, 72, 73]
    assert r["batchs"][2]["filial_name"] == "Nərimanov filialı" and r["batchs"][0]["val_name"] == "AZN"


def test_out_refresh_and_sort_keep_dates():
    """RefreshDataBatchs uses the pickers (SelectDate); GridBatchsTitleClick keeps the last SelectDate variables;
    an unknown caption ('Tarix') exits without change."""
    login()
    P("/open")
    r = P("/out/refresh", {"beg": "2026-10-11", "end": "2026-10-12"})
    assert [b["id"] for b in r["batchs"]] == [229, 230, 231, 232, 233] and r["batchs_sum_text"] == "16901.15"
    r = P("/out/sort", {"caption": "Debet Məbləğ"})                                # x.AMOUNT,x.status
    assert [b["id"] for b in r["batchs"]] == [233, 231, 229, 232, 230]
    r = P("/out/sort", {"caption": "Tarix"})
    assert [b["id"] for b in r["batchs"]] == [233, 231, 229, 232, 230]
    r = P("/out/sort", {"caption": ""})                                            # x.status
    assert [b["status"] for b in r["batchs"]] == [0, 0, 1, 4, 6]


def test_beneficiary_detail():
    login()
    P("/open")
    rows = P("/beneficiary", {"id": 229})["rows"]
    assert [x["mess_reference"] for x in rows] == ["BN0001", "BN0002"] and rows[1]["bankname"] == "Azərbaycan Beynəlxalq Bankı"
    r = P("/beneficiary", {"id": 202, "archive": True, "filial": 101})
    assert r["rows"][0]["client_name"] == "Karimov Ruslan" and r["filial_name"] == "Nərimanov filialı"


def test_incoming_sort():
    """GridIncomingTitleClick :4200: 'Debet Məbləğ' -> ' x.AMOUNT,x.status'; 'F' has no branch (exit)."""
    login()
    P("/open")
    assert [x["id"] for x in P("/in/list", {"caption": "Debet Məbləğ"})["rows"]] == [73, 71, 72]
    assert [x["id"] for x in P("/in/list", {"caption": "F"})["rows"]] == [73, 71, 72]
    assert [x["id"] for x in P("/in/list", {"caption": "№"})["rows"]] == [71, 72, 73]


def test_out_archive():
    login()
    P("/open")
    r = P("/out-archive", {"beg": "2026-10-01", "end": "2026-10-12"})
    assert [b["id"] for b in r["batchs"]] == [190, 201, 202] and r["sum_text"] == "10450"
    r = P("/out-archive/sort", {"caption": "Debet Məbləğ"})
    assert [b["id"] for b in r["batchs"]] == [202, 201, 190]
    assert P("/out-archive", {"beg": "2026-10-11", "end": "2026-10-11"})["sum_text"] == "3450"


def test_in_archive_filters_and_sum_quirk():
    """ToolButton41Click resets the grid filter but not XS_INCOMINGSUM SQL[6]: after a filial filter the total stays
    filtered on the next 'Yenilə' (Delphi behaviour)."""
    login()
    P("/open")
    r = P("/in-archive", {"beg": "2026-10-01", "end": "2026-10-12"})
    assert len(r["rows"]) == 5 and r["sum_text"] == "6465.25"
    lk = client.get(B + "/in-archive/lookups").json()
    assert lk["filials"][0] == {"filial_id": -1, "filial_name": "Bütün filiallar"} and [c["code"] for c in lk["codes"]] == [-1, 101, 105]
    r = P("/in-archive/filter", {"check2": True, "filial": 101})
    assert sorted(x["id"] for x in r["rows"]) == [55, 72, 73] and r["sum_text"] == "4915.25"
    r = P("/in-archive/filter", {"check2": True, "filial": 101, "check3": True, "code": 101})
    assert sorted(x["id"] for x in r["rows"]) == [55, 73] and r["sum_text"] == "715.25"
    r = P("/in-archive/filter", {"check2": True, "filial": -1, "check3": False, "code": 105})   # neither valid -> all
    assert len(r["rows"]) == 5 and r["sum_text"] == "6465.25"
    P("/in-archive/filter", {"check3": True, "code": 105})
    r = P("/in-archive", {"beg": "2026-10-01", "end": "2026-10-12"})
    assert len(r["rows"]) == 5 and r["sum_text"] == "5400"                    # SQL[6] 'and TYPECODE=105' kept
    assert client.post(B + "/in-archive/filter", json={"check2": True, "filial": 999}).status_code == 400


def test_rights():
    """No module right -> 403; module right without XOHKSBENIFICARY -> PanelBeneficary hidden."""
    login("TELLER", "Teller#2026")
    assert client.post(B + "/open").status_code == 403
    mock_db.reset()
    u = mock_db._load()["users"]["TELLER"]
    u["rights"] = u["rights"] + [X.CLSID]
    assert client.post("/api/login", json={"username": "TELLER", "password": "Teller#2026"}).status_code == 200
    r = P("/open")
    assert r["beneficiary_visible"] is False
    assert client.post(B + "/beneficiary", json={"id": 229}).status_code == 403
