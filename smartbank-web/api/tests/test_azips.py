"""Packages/SWIFT_MANAGER_IBAN_NEW (AZIPS, TSWIFT_MAIN) part 1 - lists, totals, archives."""
import datetime
from fastapi.testclient import TestClient
from app.main import app
from app.db import mock as mock_db
from app import azips as M
from app import azips_sql as Q

client = TestClient(app)
B = "/api/azips"


def login(u="ADMIN", p="Admin#2026"):
    mock_db.reset()
    assert client.post("/api/login", json={"username": u, "password": p}).status_code == 200


def test_sql_verbatim_lines():
    assert Q.LINES_SW_OUT[0] == "select s.*,s.rowid,sw_main.Find_UserName_out(s.id)  from sw_out_new"
    assert Q.LINES_SW_OUT[1] == " s   where status in (2,8,15)  " and Q.LINES_SW_OUT[-1] == "order by id desc"
    assert len(Q.LINES_SW_IN) == 117 and len(Q.LINES_SW_IN2) == 48 and len(Q.LINES_ARXIVIN) == 44
    assert Q.LINES_ARXIVIN[-1] == "order by :title" and Q.LINES_OUT_ARCHIVE[2].endswith("--and fcreate_opid=:oper")
    assert Q.text(Q.LINES_SWMAMMOUNT) == "select sum(mf32a_amount) as summ from sw_out_new where status=1\r\n"
    t = Q.text(Q.LINES_SW_OUT, i10=Q.BRANCH_LINE).split("\r\n")
    assert t[10] == Q.BRANCH_LINE and t[0] == Q.LINES_SW_OUT[0]


def test_sort_lines():
    assert M.in_order("", "dat") == "order by DAT desc"                # ExtractDesc('') = '' -> desc
    assert M.in_order("order by DAT desc", "ID") == "order by ID asc"
    assert M.in_order("order by ID asc", "ID") == "order by ID desc"
    assert M.in2_order("valu") == "order by VALU"
    for bad in ("ID;drop", "x", "1=1"):
        try:
            M.in_order("", bad)
            assert False
        except M.AzError:
            pass
    assert M.float_to_str(1500.25 + 2700) == "4200.25" and M.float_to_str(0.0) == "0"


def test_lists_admin_all_branches():
    login()
    r = client.post(B + "/list", json={}).json()
    assert [x["id"] for x in r["sw_out3"]] == [9111, 9110, 9109, 9108, 9107, 9102, 9101]                   # status 1, order by id desc
    assert [x["id"] for x in r["sw_out"]] == [9106, 9105, 9104] and [x["id"] for x in r["sw_out_2"]] == [9103]
    assert [x["id"] for x in r["sw_in"]] == [5001, 5002] and [x["id"] for x in r["sw_in2"]] == [5003]
    assert r["sum_send_text"] == "254951.5" and r["sum_verify_text"] == "9800"
    assert r["sw_out3"][0]["sw_main.find_username_out(s.id)"] == "Teller One"
    r = client.post(B + "/list", json={"in_sort": "VALU"}).json()
    assert r["in_order"] == "order by VALU desc" and [x["id"] for x in r["sw_in"]] == [5002, 5001]
    r = client.post(B + "/list", json={"in_order": r["in_order"], "in_sort": "VALU"}).json()
    assert r["in_order"] == "order by VALU asc" and [x["id"] for x in r["sw_in"]] == [5001, 5002]
    assert client.post(B + "/list", json={"in_sort": "ID desc,1"}).status_code == 400
    r = client.post(B + "/list", json={"in_order": "order by ID desc; drop"}).json()
    assert r["in_order"] == ""


def test_teller_branch_or_denied():
    login("TELLER", "Teller#2026")
    r = client.post(B + "/list", json={})
    if r.status_code == 403:
        return
    j = r.json()                                                              # filialid 101 -> SQL[10] branch line
    assert all(x["branch"] == 101 for x in j["sw_out3"] + j["sw_in"])


def test_archive_now_moves_processed():
    login()
    assert client.post(B + "/archive-now").json()["message"] == "Məlumatlar arxivə göndərildi!"
    r = client.post(B + "/archive-in", json={"dat1": "2026-10-01", "dat2": "2026-10-13"}).json()
    assert 4990 in [x["id"] for x in r["rows"]]


def test_archive_in_filters():
    login()
    r = client.post(B + "/archive-in", json={"dat1": "2026-10-01", "dat2": "2026-10-07"}).json()
    assert r["rows"] == []
    r = client.post(B + "/archive-in", json={"dat1": "2026-10-09", "dat2": "2026-10-13"}).json()
    assert [x["id"] for x in r["rows"]] == [4001, 4002]
    r = client.post(B + "/archive-in", json={"dat1": "2026-10-09", "dat2": "2026-10-13", "mt_index": 2}).json()
    assert [x["id"] for x in r["rows"]] == [4002]                           # 'and mt='MT102''
    r = client.post(B + "/archive-in", json={"dat1": "2026-10-10", "dat2": "2026-10-10", "mt_index": 0}).json()
    assert [x["id"] for x in r["rows"]] == [4002]
    assert client.post(B + "/archive-in", json={"dat1": "2026-10-01", "dat2": "2026-10-13", "mt_index": 99}).status_code == 400
    assert client.post(B + "/archive-in", json={"dat1": "2026-10-01", "dat2": "2026-10-13", "title": "id--"}).status_code == 400


def test_archive_out_operator_type():
    login()
    ops = client.get(B + "/operators").json()
    assert ops[0] == {"id": -1, "name": "Butun operatorlar"}
    D = {"dat1": "2026-10-01", "dat2": "2026-10-13"}
    assert [x["id"] for x in client.post(B + "/archive-out", json=D).json()["rows"]] == [8001, 8002]
    assert [x["id"] for x in client.post(B + "/archive-out", json={**D, "oper": 3}).json()["rows"]] == [8002]
    assert [x["id"] for x in client.post(B + "/archive-out", json={**D, "mt_index": 1}).json()["rows"]] == [8001]


class _Spy:
    def __init__(self):
        self.q = []

    def query(self, sql, b=None):
        self.q.append((sql, b))
        return [{"FILIALID": 0}] if sql.startswith("SELECT filialid") else []

    def call_func(self, *a, **k):
        return 0


def test_archive_out_sql_text_and_binds():
    s = _Spy()
    M.archive_out(s, datetime.date(2026, 10, 1), datetime.date(2026, 10, 2), oper=7, mt_index=3)
    sql, b = s.q[-1]
    L = sql.split("\r\n")
    assert L[5] == " and fcreate_opid=:oper" and L[6] == "and messagetype='MT205'" and L[10] == ""
    assert b == {"dat1": datetime.datetime(2026, 10, 1), "dat2": datetime.datetime(2026, 10, 2), "oper": 7, "title": "id"}
    s = _Spy()
    M.archive_in(s, datetime.date(2026, 10, 1), datetime.date(2026, 10, 2), mt_index=0)
    L = s.q[-1][0].split("\r\n")
    assert L[6] == "and mt<>' '" and L[10] == Q.BRANCH_LINE                  # SW_IN_FIL func returned 0
