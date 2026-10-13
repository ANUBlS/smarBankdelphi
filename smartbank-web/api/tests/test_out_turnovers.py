"""Packages/Out_turn_over_for_period (TTurnOvers_Form)."""
from fastapi.testclient import TestClient
from app.main import app
from app.db import mock as mock_db
from app import out_turnovers as TO
from app import out_tp_sql as Q

client = TestClient(app)
R = {"beg": "2026-10-06", "end": "2026-10-09"}


def login():
    mock_db.reset()
    assert client.post("/api/login", json={"username": "ADMIN", "password": "Admin#2026"}).status_code == 200


def test_sql_lines_formatted_like_build_turnover_query():
    base = Q.SQL_OTP_TURNOVERSDATA.split("\n")
    s = TO.turnover_sql(101, 840, 2, "9101,9201").split("\n")
    assert len(s) == len(base)
    assert s[52] == "  out_bal_spr2 b  /*52*/" and s[117] == "  ac.bal_cn2 = b.bal_cn and /*117*/"
    assert s[124] == "  (RestForLastPeriod.BalanceNo in (9101,9201)) and /*124*/"
    assert s[125] == "  RestForLastPeriod.CurrencyID = 840 and /*125*/" and s[126] == "  RestForLastPeriod.BranchID = 101 and /*126*/"
    e = TO.turnover_sql(-1, -1, 1, "  ").split("\n")
    assert e[124] == e[125] == e[126] == ""
    assert [i for i, (a, b) in enumerate(zip(base, e)) if a != b] == [52, 55, 94, 97, 114, 117, 124, 125, 126]


def test_report_and_export():
    login()
    i = client.get("/api/out-turnovers/init").json()
    assert i["currencies"][0]["index"] == 0 and len(i["branches"]) >= 2
    rep = client.post("/api/out-turnovers/report", json=R).json()
    assert rep["rows"] and rep["cols"][0] == "accno" and "acc_name" not in rep["cols"] and rep["bank"]["bank"] == "SmartBank ASC"
    assert abs(sum(x["dturnover"] or 0 for x in rep["rows"]) - rep["totals"]["dturnover"]) < 1e-6
    n = client.post("/api/out-turnovers/report", json={**R, "with_names": True}).json()
    assert n["cols"][1] == "acc_name"
    ex = client.post("/api/out-turnovers/export", json=R).json()
    assert len(ex["rows"]) >= len(rep["rows"]) and "lendactive" in ex["cols"]
    usd = client.post("/api/out-turnovers/export", json={**R, "currency": 2}).json()   # USD (index 2)
    assert usd["rows"] and {x["currencyid"] for x in usd["rows"]} == {840}
    b = client.post("/api/out-turnovers/export", json={**R, "balances": "9901"}).json()
    assert {x["balanceno"] for x in b["rows"]} == {9901}


def test_balances_validated_and_files():
    login()
    assert client.post("/api/out-turnovers/report", json={**R, "balances": "1) or (1=1"}).status_code == 400
    assert client.post("/api/out-turnovers/report.pdf", json=R).content[:4] == b"%PDF"
    assert client.post("/api/out-turnovers/export.xlsx", json=R).status_code == 200
