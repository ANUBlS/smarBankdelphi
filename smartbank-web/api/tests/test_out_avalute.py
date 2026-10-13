"""Packages/out_Avalute (Tout_AvaluteForm) - off-balance currencies."""
from fastapi.testclient import TestClient
from app.main import app
from app.db import mock as mock_db
from app import out_avalute as M
from app import out_set_sql as Q

client = TestClient(app)
B = "/api/out-avalute"


def login(u="ADMIN", p="Admin#2026"):
    mock_db.reset()
    assert client.post("/api/login", json={"username": u, "password": p}).status_code == 200


def test_sql_and_args():
    assert Q.SQL_AVALUTE_T == "select a.rowID, a.* from out_avalute a\r\norder by a.valute"
    assert Q.SQL_VALUTE_SETTINGS == "select VS.rowID, VS.* from ValuteSettings VS\r\nwhere VS.Valute=:Val"
    assert Q.SQL_AVALUTE_ACCOUNTS.split("\r\n")[3] == "  'YOX' as acc_no"
    a = M.proc_args({"valute": 840, "ustorg": 1.7, "limit": 2.0, "using": None, "val_name": "USD"})
    assert list(a)[:3] == ["v_VALUTE", "v_VAL_NAME", "v_VALU_NAME"] and len(a) == 23
    assert a["v_VALUTE"] == "840" and a["v_USTORG"] == "1.7" and a["v_LIMIT"] == "2" and a["v_USING"] == "" and a["v_VALU_NAME"] == ""


def test_list_settings_accounts():
    login()
    r = client.get(B).json()
    assert [x["valute"] for x in r["rows"]] == [0, 840, 978] and r["rows"][1]["rowid"]
    assert r["accounts"][0] == {"status": 0, "id": 0, "acc_no": "YOX"} and len(r["accounts"]) == 6
    assert client.get(B + "/settings", params={"valute": 840}).json()["settings"]["kredit"] == 9101
    assert client.get(B + "/settings", params={"valute": 978}).json()["settings"] is None


def test_grid_upd_add_delete():
    login()
    rows = client.get(B).json()["rows"]
    usd = rows[1]
    assert client.post(B + "/row", params={"rowid": usd["rowid"]}, json={"rec": {**usd, "country": "Amerika"}}).status_code == 200
    assert client.get(B).json()["rows"][1]["country"] == "Amerika" and client.get(B).json()["rows"][1]["ustorg"] == 1.7
    assert client.post(B + "/row", json={"rec": {"valute": "826", "val_name": "GBP", "valu_name": "Funt sterlinq"}}).status_code == 200
    gbp = [x for x in client.get(B).json()["rows"] if x["valute"] == 826][0]
    assert gbp["val_name"] == "GBP" and gbp["limit"] is None
    assert client.post(B + "/row", json={"rec": {"valute": "826"}}).status_code >= 400          # add_avalute duplicate (mock)
    assert client.post(B + "/row", json={"rec": {"valute": "x"}}).status_code == 400
    assert client.post(B + "/row", json={"rec": {"val_name": "ZZ"}}).status_code == 400        # VALUTE Required
    assert client.delete(B + "/row", params={"rowid": gbp["rowid"]}).status_code == 200
    assert 826 not in [x["valute"] for x in client.get(B).json()["rows"]]


def test_ok_updates_settings_and_swallows_grid_error():
    login()
    r = client.post(B + "/ok", json={"valute": 840, "kredit": 9103, "debet": 9102,
                                     "grid": {"rowid": None, "rec": {"valute": "840"}}}).json()   # duplicate -> swallowed
    assert r["ok"] and "ORA-00001" in r["grid_error"]
    assert client.get(B + "/settings", params={"valute": 840}).json()["settings"]["kredit"] == 9103
    # no settings row for 978: Edit on an empty dataset = Insert, VALUTE stays NULL (Delphi behaviour)
    assert client.post(B + "/ok", json={"valute": 978, "kredit": 9105, "debet": None}).json()["grid_error"] is None
    assert client.get(B + "/settings", params={"valute": 978}).json()["settings"] is None
    from app.db import mock_oacc
    assert {"VALUTE": None, "KREDIT": 9105} in [{k: x.get(k) for k in ("VALUTE", "KREDIT")} for x in mock_oacc._load()["valutesettings"]]


def test_rights():
    login("TELLER", "Teller#2026")
    assert client.get(B).status_code == 403
