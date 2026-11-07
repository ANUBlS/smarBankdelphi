"""Packages/out_memorial (Tmemorial_project) - off-balance memorial orders."""
from fastapi.testclient import TestClient
from app.main import app
from app.db import mock as mock_db
from app import out_memorial as M
from app import out_mem_sql as Q

client = TestClient(app)
B = "/api/out-memorial"
RUN = {"beg": "2026-10-01", "end": "2026-10-12"}


def login(u="ADMIN", p="Admin#2026"):
    mock_db.reset()
    assert client.post("/api/login", json={"username": u, "password": p}).status_code == 200


def test_sql_verbatim():
    assert Q.SQL_ODSRATE == "Select  Valute,Valu_Name from aValute"
    assert Q.SQL_REFER == "Select\r\n  RowID,Balance From Out_Memorial"
    assert Q.SQL_USERSLIST == "select \r\n  ID ,\r\n  NAME\r\nfrom USER$"
    assert Q.main_sql("Memorial_ADMIN", " ORDER BY DBAL_CN") == "Select  *  From  Memorial_ADMIN\r\n ORDER BY DBAL_CN\r\n"
    assert Q.ORDER[1] == " ORDER BY VAL_ACC,CURRENCYID_C" and len(Q.ORDER) == 8


def test_debt_kred_and_words():
    F = M.FilterIn
    assert [M.debt_kred(F(debt=a, kred=b)) for a, b in ((True, False), (False, True), (True, True), (False, False))] == [0, 1, 2, -1]
    assert M.currency_to_hr_azeri(20000) == "iyirmi minzaaaaaaa"
    assert M.currency_to_hr_azeri(1250.4) == "bir min iki yüz əllizaaaaaaa"
    assert M.currency_to_hr_azeri(0) == "zaaaaaaa"


def test_init_run_order_open():
    login()
    i = client.get(B + "/init").json()
    assert i["date"] == "2026-10-12" and i["rates"][0] == {"index": 0, "valute": -1, "name": "Bütün valyutalar"}
    assert [b["id"] for b in i["branches"]] == [101, 102] and i["users"][0]["name"] == "ADMIN"
    r = client.post(B + "/run", json={**RUN, "order": 6}).json()["rows"]
    assert len(r) == 4 and [x["ammount"] for x in r] == sorted(x["ammount"] for x in r)
    assert r[0]["currinnational"].endswith("zaaaaaaa/ ədəd")
    assert client.post(B + "/run", json={**RUN, "form": 2}).json()["rows"] is None           # separator item: no-op
    one = client.post(B + "/run", json={**RUN, "branch": 2}).json()["rows"]                  # FilialMode = branch 102
    assert all(x["debitor"].startswith(("92", "99")) for x in one)
    ids = [one[0]["id"]]
    assert [x["id"] for x in client.post(B + "/open", json={"order": 0, "ids": ids}).json()["rows"]] == ids
    assert client.post(B + "/run", json={**RUN, "rate": 99}).status_code == 400


def test_filter_dialog():
    login()
    f = {"debt": False, "kred": True, "balance": True, "plan": 0, "bal_list": "9200"}
    r = client.post(B + "/run", json={**RUN, "form": 1, "filter": f}).json()["rows"]
    assert r and all(x["kbal_cn"] == 9200 for x in r)


def test_report_kinds():
    login()
    client.post(B + "/run", json=RUN)
    a = client.post(B + "/report", json={**RUN, "rate": 0}).json()        # Rate = -1 -> <> 0 -> Memorial_Rpt3
    assert a["report"] == "rpt3" and a["header"][0] == "SmartBank ASC" and a["header"][2] == "01-10-2026 - 12-10-2026"
    assert "mem_amount" in a["cols"] and "diffrate" not in a["cols"] and a["totals"]["lammount"] > 0
    assert a["signatures"][0][0] == "Təhvil verən"
    b = client.post(B + "/report", json={**RUN, "rate": 1, "signer": "button"}).json()     # AZN (0) -> Memorial_Rpt4
    assert b["report"] == "rpt4" and "mem_amount" not in b["cols"]
    c = client.post(B + "/report", json={**RUN, "count": True, "blanck": 0}).json()
    assert c["report"] == "rpt2" and len(c["rows"]) == 2 * len(a["rows"])
    d = client.post(B + "/report", json={**RUN, "signer": "button", "form": 3}).json()
    assert d["signatures"][0][0] == "Baş mühasib" and "diffrate" in d["cols"] and d["header"][3].startswith("Multi")
    pdf = client.post(B + "/report.pdf", json={**RUN})
    assert pdf.status_code == 200 and pdf.content[:4] == b"%PDF"
    x = client.post(B + "/export.xlsx", json={**RUN, "op_id": 1})
    assert x.status_code == 200 and x.content[:2] == b"PK"


def test_refer_crud():
    login()
    rows = client.get(B + "/refer").json()["rows"]
    assert [x["balance"] for x in rows] == [9100, 9200]
    rows = client.post(B + "/refer", json={"balance": 9900}).json()["rows"]
    assert 9900 in [x["balance"] for x in rows]
    assert client.post(B + "/refer", json={"balance": 9900}).status_code == 400              # ORA-00001
    rid = rows[-1]["rowid"]
    rows = client.post(B + "/refer", params={"rowid": rid}, json={"balance": 9901}).json()["rows"]
    assert rows[-1]["balance"] == 9901
    assert [x["balance"] for x in client.delete(B + "/refer", params={"rowid": rid}).json()["rows"]] == [9100, 9200]


def test_rights():
    login("TELLER", "Teller#2026")
    assert client.get(B + "/init").status_code == 403
