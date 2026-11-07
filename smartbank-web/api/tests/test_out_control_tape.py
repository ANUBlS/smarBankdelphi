"""Packages/Out_control_tape (TFrmControlTape)."""
import datetime
from fastapi.testclient import TestClient
from app.main import app
from app.db import mock as mock_db
from app import out_control_tape as CT

client = TestClient(app)
D = "2026-10-09"


def login():
    mock_db.reset()
    assert client.post("/api/login", json={"username": "ADMIN", "password": "Admin#2026"}).status_code == 200


def B(**k):
    return CT.TapeIn(**{"date": datetime.date(2026, 10, 9), **k})


def test_sql_text_matches_delphi_concatenation():
    # ControlTapeImpl.pas:453-454 with all branches, no toggle
    assert CT.table_sql(B(), [0, 840]) == ("select a.bal_cn1, Sum(p.ammount) as AMMOUNTS,Sum(p.lammount) as LAMMOUNTS  from Out_provarch p, Out_account a"
                                           " where a.id=p.debt and  p.dat=:ADate Group By a.Bal_cn1 order by a.bal_cn1")
    s = CT.table_sql(B(currency=2, branch=101, toggle=True, balances="9101", balans=1), [0, 840])
    assert " a.filial = 101 and   a.bal_cn2 in (9101) and p.dat=:ADate and a.Val_Acc=840 Group by bal_cn2 order by bal_cn2" in s
    assert " out_provdoc p," in CT.group_sql(B(), [0], datetime.date(2026, 10, 9))
    assert " out_provarch p," in CT.group_sql(B(), [0], datetime.date(2026, 10, 12))
    assert CT.build_filter(True, "", 1) == " a.bal_cn1 in (-1) and "          # Delphi quirk kept
    assert CT.view_sql(B(currency=1), [0]).count("d.val_acc= 0 and") == 1


def test_refresh_print_summary_report():
    login()
    i = client.get("/api/out-control-tape/init").json()
    assert i["date"] == "2026-10-12" and i["currencies"][0]["name"] == "Bütün valyutalar"
    r = client.post("/api/out-control-tape/refresh", json={"date": D}).json()
    assert r["rows"] and {x["bal_cn1"] for x in r["rows"]} <= {9101, 9201, 9301, 9901}
    p = client.post("/api/out-control-tape/print", json={"date": D}).json()
    assert p["groups"] and abs(sum(g["totals"]["ammount"] for g in p["groups"]) - r["totals"]["ammounts"]) < 1e-6
    s = client.post("/api/out-control-tape/summary", json={"date": D}).json()
    assert s["bank"] == "SmartBank ASC" and s["amount_visible"] is False and s["cols"] == ["bal_cn1", "lammounts"]
    v = client.post("/api/out-control-tape/report", json={"date": D}).json()
    assert v["rows"] and "debitammount" in v["rows"][0]
    t = client.post("/api/out-control-tape/refresh", json={"date": D, "toggle": True}).json()
    assert t["rows"] == []                                                    # bal_cn1 in (-1)


def test_balances_text_is_validated_and_files():
    login()
    assert client.post("/api/out-control-tape/refresh", json={"date": D, "toggle": True, "balances": "1) or (1=1"}).status_code == 400
    assert client.post("/api/out-control-tape/refresh.pdf", json={"date": D}).content[:4] == b"%PDF"
    assert client.post("/api/out-control-tape/print.xlsx", json={"date": D}).status_code == 200
