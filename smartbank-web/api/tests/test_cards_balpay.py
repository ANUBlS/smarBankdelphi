"""Cards ▸ Balans (balans.pas) and Payment (payment.pas): fixture cards 31 (acc 9001 AZN) and 32 (acc 9003 USD), provarch 7001-7004."""
import base64
import io

from fastapi.testclient import TestClient
from openpyxl import load_workbook

from app.main import app
from app.db import mock as mock_db
from app.db import mock_cards as MC
from app import cards_app_file as AF

client = TestClient(app)


def login():
    mock_db.reset(); MC.reset(); AF._CREATED.clear()
    assert client.post("/api/login", json={"username": "ADMIN", "password": "Admin#2026"}).status_code == 200


def P(path, body=None, code=200):
    r = client.post("/api/cards" + path, json=body or {})
    assert r.status_code == code, r.text
    return r.json()


def test_balance_collect_sort_close():
    login()
    r = P("/balance/open")
    assert r["active"] is False and r["cols"] == ["FILIAL", "MULTI_ACC", "QALIQ", "CREDIT", "OSTAT"]
    P("/balance/collect", code=200)
    r = P("/balance/collect")
    o = {x["multi_acc"]: x for x in r["rows"]}
    assert o["MA-31"]["ostat"] == 100000 and o["MA-31"]["credit"] == 200 and o["MA-32"]["ostat"] == -4025
    assert [x["multi_acc"] for x in P("/balance/sort", {"field": "OSTAT"})["rows"]] == ["MA-32", "MA-31"]
    assert P("/balance/close")["rows"] == []


def test_balance_file_layout():
    login(); P("/balance/open")
    r = P("/balance/file", {"date": "2026-10-13"})
    assert r["messages"] == ["BALANCE FILE CREATED"] and r["error"] is None
    f = r["files"][0]
    assert f["name"] == "b507699__1.286" and f["delphi_path"] == "C:\\AZCARD\\OUT\\131026\\b507699__1.286"
    L = base64.b64decode(f["b64"]).decode("cp1254").split("\r\n")
    assert L[0].startswith("FH000001BALANCE   20 507699  20261013") and L[0].endswith("*") and len(L[0]) == 176
    rd = [x for x in L if x.startswith("RD")]
    assert rd[0][:8] == "RD000002" and rd[0][8:40] == "MA-31".ljust(32) and rd[0][100:103] == "944"
    assert rd[0][103:118] == "000000000100000" and rd[0][118:121] == "C  "
    assert rd[1][100:103] == "840" and rd[1][103:118] == "000000000004025" and rd[1][118:121] == "D  "
    ft = [x for x in L if x.startswith("FT")][0]
    assert ft[:14] == "FT000004000002" and ft[14:32] == "000000000000104025"
    assert P("/balance/file", {"date": "2026-10-13"})["files"][0]["name"] == "b507699__2.286"   # next free number


def test_payment_refresh_file_calls():
    login()
    r = P("/payment/open")
    assert r["active"] is False and r["dat1"] == "2026-10-12"                    # sysdat.tek_dat (fixtures/system.json)
    r = P("/payment/refresh", {"date": r["dat1"]})
    ids = sorted((x["id"], x["tip"]) for x in r["rows"])
    assert ids == [(7001, "D"), (7002, "C"), (7003, "D")]                         # 7004: vid_op 77 = card_vidops (NOT IN :vids)
    bms = [x["_bm"] for x in r["rows"]]
    out = P("/payment/file", {"selected": bms})
    assert out["messages"] == ["PAYMENT FILE CREATED"] and out["error"] is None, out
    L = base64.b64decode(out["files"][0]["b64"]).decode("cp1254").split("\r\n")
    assert L[0].startswith("FH000001PAYMENT   12 507699  ") and L[0].endswith("*")
    assert any(x.startswith("BH") for x in L) and L[-2].startswith("FT")
    names = [c[1] for c in out["calls"]]
    assert names.count("insert_payment") == 3 and names.count("delete_payment") == 3


def test_payment_nothing_selected_and_excel():
    login(); P("/payment/refresh", {"date": P("/payment/open")["dat1"]})
    out = P("/payment/file", {"selected": []})
    assert out["files"] == [] and out["messages"] == []                           # SelectedRows.Count = 0: Exit
    x = client.post("/api/cards/payment/excel")
    assert load_workbook(io.BytesIO(x.content)).active.title == "payment"
