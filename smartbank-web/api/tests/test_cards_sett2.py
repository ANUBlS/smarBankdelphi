"""Cards ▸ Sazlama sub forms 3, 5-11, 13, 14 (cards_sett2)."""
import base64

from fastapi.testclient import TestClient

from app.main import app
from app.db import mock as mock_db
from app.db import mock_cards as MC

client = TestClient(app)


def login():
    mock_db.reset(); MC.reset()
    assert client.post("/api/login", json={"username": "ADMIN", "password": "Admin#2026"}).status_code == 200
    assert client.post("/api/cards/sett/open", json={}).status_code == 200


def P(path, body=None, code=200):
    r = client.post("/api/cards/sett" + path, json=body or {})
    assert r.status_code == code, r.text
    return r.json() if r.headers.get("content-type", "").startswith("application/json") else r


def test_all_ported_and_need_list():
    mock_db.reset(); MC.reset()
    client.post("/api/login", json={"username": "ADMIN", "password": "Admin#2026"})
    P("/crdtype/open", code=409)
    r = P("/open")
    assert all(f["ported"] for f in r["forms"].values())


def test_crdtype():
    login()
    v = P("/crdtype/open")
    assert len(v["rows"]) == 3 and v["valuta"][0]["val_name"] == "AZN"
    r = P("/crdtype/add", {"f": {"edit1": "MC STD", "edit2": "103", "currency": "", "edit5": "1", "edit3": "M"}})
    assert r["message"] == "Xanalar tam doldurulmalıdır!" and len(r["rows"]) == 3
    r = P("/crdtype/add", {"f": {"edit1": "MC STD", "edit2": "103", "currency": "AZN", "edit5": "1", "edit3": "M", "edit4": "5"}})
    new = [x for x in r["rows"] if x["name"] == "MC STD"][0]
    assert new["bin"] == "5" and "message" not in r
    names = [x["name"] for x in P("/crdtype/sort", {"field": "NAME"})["rows"]]
    assert names == sorted(names) and "MC STD" in names
    assert len(P("/crdtype/delete", {"rowid": new["rowid"], "confirmed": True})["rows"]) == 3


def test_filialaccounts_domestic():
    login()
    v = P("/filialaccounts/open")
    assert {x["kod"] for x in v["rows"]} == {"01", "00"}
    r = P("/filialaccounts/add", {"f": {"filial": "Baş ofis", "currency": "USD", "se1": "AZ25NBC0000000025010944001",
                                       "se2": "AZ45NBC0000000045010944001", "edit1": "07"}})
    assert "07" in [x["kod"] for x in r["rows"]]
    rid = [x for x in r["rows"] if x["kod"] == "07"][0]["rowid"]
    assert len(P("/filialaccounts/delete", {"rowid": rid, "confirmed": False})["rows"]) == 3
    assert len(P("/filialaccounts/delete", {"rowid": rid, "confirmed": True})["rows"]) == 2
    d = P("/domesticbank/open")
    assert d["rows"][0]["acc_no_2"] == "AZ64NBC0000000067017944001" and len(d["accounts"]) == 3
    assert len(P("/domesticbank/add", {"f": {"edit1": "1"}, "confirmed": False})["rows"]) == 1
    r = client.post("/api/cards/sett/domesticbank/sort", json={"field": "ACC_NO"})
    assert r.status_code >= 400 and "ORA-00918" in r.text
    assert P("/domesticbank/sort", {"field": "BANKNAME"})["rows"]


def test_banksettings():
    login()
    v = P("/banksettings/open")
    assert v["bankid"] == "507699" and v["dord"] is True and v["rez"] == 0
    f = dict(bankid="507700", accountclosecode="CLOSE14", rez=1, dord=False, kliring_25="X25", kliring_45="X45")
    assert P("/banksettings/save", {"f": f, "confirmed": False})["bankid"] == "507699"
    v = P("/banksettings/save", {"f": f, "confirmed": True})
    assert (v["bankid"], v["rez"], v["dord"], v["kliring_25"]) == ("507700", 1, False, "X25")


def test_atm_pos_noprov():
    login()
    v = P("/atmendpos/open")
    assert v["rows"][0]["mainaccount"] == "AZ25NBC0000000025010944001" and v["rows"][0]["interacount"] is None
    f = {"type": "POS", "edit1": "P1", "edit2": "Shop", "filial": "Baş ofis", "currency": "AZN", "se1": "AZ64NBC0000000067017944001"}
    assert P("/atmendpos/check", {"f": f})["ask"] is True and P("/atmendpos/check", {"f": {}})["ask"] is False
    r = P("/atmendpos/add", {"f": f, "confirmed": True})
    assert "P1" in [x["atmid"] for x in r["rows"]]
    nid = [x for x in r["rows"] if x["atmid"] == "P1"][0]["id"]
    assert len(P("/atmendpos/delete", {"id": nid, "confirmed": True})["rows"]) == 1
    assert P("/atmendpos/excel").content[:2] == b"PK"
    p = P("/poscomission/add", {"f": {"posid": "M2", "minvalue": "1,5", "maxvalue": "x"}})          # 'x': swallowed, nothing saved
    assert len(p["rows"]) == 1
    p = P("/poscomission/add", {"f": {"posid": "M2", "minvalue": "1,5", "maxvalue": "200"}})
    assert [x["minvalue"] for x in p["rows"] if x["posid"] == "M2"] == [1.5]
    assert len(P("/poscomission/delete", {"rowid": p["rows"][1]["rowid"], "confirmed": True})["rows"]) == 1
    assert P("/poscomission/excel").content[:2] == b"PK"
    n = P("/unit155/add", {"text": "ABC"})
    assert [x["str"] for x in n["rows"]] == ["TEST PROV", "ABC"]
    assert len(P("/unit155/delete", {"rowid": n["rows"][0]["rowid"]})["rows"]) == 1


def test_cardbranch_excsett_tax():
    login()
    r = P("/cardbranch/add", {"filial_id": 102, "filial_name": "Nərimanov filialı", "code": "0099"})
    assert r["message"].startswith("Filialın") and "0099" in [x["branch_code"] for x in r["rows"]]
    assert len(P("/cardbranch/delete", {"id": 102, "confirmed": True})["rows"]) == 1
    x = P("/cardbranch/xml")
    t = base64.b64decode(x["files"][0]["b64"]).decode("cp1254")
    assert t.startswith('<?xml version="1.0" encoding="windows-1251"?>\r\n') and "<Application>" in t
    t2 = base64.b64decode(P("/cardbranch/xml")["files"][0]["b64"]).decode("cp1254")
    assert "<Application>" not in t2                                       # Open no-op, cursor at Eof
    e = P("/excsett/open")
    assert e["accounts"] == [] and len(e["rows"]) == 1
    assert P("/excsett/filial", {"fil": 101})["accounts"] == ["AZ10NBC0000000010030944001", "AZ45NBC0000000045090944001"]
    assert len(P("/excsett/add", {"f": {"filial": 101, "nameofatm": "N"}})["rows"]) == 2
    t = P("/taxfilessettings/open")
    assert t["accounts_open"] is False
    P("/taxfilessettings/delete", {"confirmed": True}, 400)
    assert len(P("/taxfilessettings/valute", {"fil": 101, "valu": 944})["accounts"]) >= 5
    assert len(P("/taxfilessettings/add", {"f": {"filial": 101, "valute": 944, "tax1": "A"}})["rows"]) == 2
    assert len(P("/taxfilessettings/delete", {"confirmed": False})["rows"]) == 2


def test_pos_sort_and_empty_titleclick():
    login()
    P("/poscomission/add", {"f": {"posid": "A0", "minvalue": "1", "maxvalue": "2"}})
    assert [x["posid"] for x in P("/poscomission/sort", {"field": "POSID"})["rows"]] == ["A0", "M0001"]
    P("/poscomission/sort", {"field": "NOPE"}, 400)
    for r in P("/domesticbank/open")["rows"]:
        P("/domesticbank/delete", {"rowid": r["rowid"], "confirmed": True})
    assert P("/domesticbank/sort", {"field": "ACC_NO"})["rows"] == []       # IsEmpty -> Exit (no ORA-00918)


def test_tax_grid_editing():
    login()
    rows = P("/taxfilessettings/open")["rows"]
    rid = rows[0]["rowid"]
    r = P("/taxfilessettings/apply", {"op": "update", "rowid": rid, "f": dict(rows[0], tax10="T10")})
    assert r["rows"][0]["tax10"] == "T10"
    r = P("/taxfilessettings/apply", {"op": "insert", "f": {"id": "9", "branch": "102", "valute": "840", "tax1": "X"}})
    assert [x["id"] for x in r["rows"]] == [rows[0]["id"], 9]
    r = P("/taxfilessettings/apply", {"op": "delete", "rowid": r["rows"][1]["rowid"]})
    assert len(r["rows"]) == 1
    P("/taxfilessettings/apply", {"op": "x"}, 400)
