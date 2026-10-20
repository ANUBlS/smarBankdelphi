"""Currency Position 'Kapital' (TfrmCapital, Packages/CurrencyPosition/UntCapital.pas) - api/app/cp_capital.py."""
import pytest
from fastapi.testclient import TestClient
from app import main, sessions, cp_sql as Q
from app.db import mock, mock_cp

U = "/api/currencyposition/capital"


@pytest.fixture(autouse=True)
def fresh():
    mock.reset(); mock_cp.reset(); sessions.attempts._f.clear(); sessions.store._s.clear(); yield


def cl():
    c = TestClient(main.app); assert c.post("/api/login", json={"username": "ADMIN", "password": "Admin#2026"}).status_code == 200; return c


def post(c, url, code=200, **b):
    r = c.post(U + url, json=b); assert r.status_code == code, r.text; return r.json()


def test_sql_verbatim():
    assert Q.sql_capital() == ("SELECT cap.rowid,cap.id, cap.type, cap.bal, cap.acc,ac.acc_no, cap.sum, cap.percent, cap.formula, "
                               "cap.op_type,cap.bal_type\n  FROM capital cap,account ac\n  where cap.acc=ac.id (+)\n order by id")
    assert Q.sql_capital("ACC_NO").endswith("where cap.acc=ac.id (+)\nORDER BY ACC_NO")          # SQL[SQL.Count-1]
    assert "FROM capital cap,CAPITAL_ACC_OUT ac" in Q.sql_capital(None, True)
    assert Q.SQL_CAP_ADI_4 == "select * from  Bal_SPR1 where (Bal_CN like '%91') and (length(Bal_CN)=4) order by Bal_CN "
    assert Q.SQL_CAP_ODS2.startswith("select  *  from capital   where OP_TYPE=3 and BAL_TYPE=1")
    with pytest.raises(ValueError):
        Q.sql_capital("ID; drop table capital")


def test_order_field_whitelisted():
    assert cl().post(U + "/rows", json={"order": "BAL desc"}).status_code == 422


def test_form_opens_all_design_time_datasets():
    j = cl().get(U + "/form").json()
    assert j["date"].startswith("2026-10-12")                                   # PK_CAPITAL.GetDate (sysdat.tek_dat)
    assert [r["id"] for r in j["capital"]] == list(range(1, 14))                # order by id
    assert j["accounts"][0]["acc_no"] < j["accounts"][1]["acc_no"]               # order by acc_no
    assert [b["bal_cn"] for b in j["adi"]] == [1891, 1991, 3091]                      # like '%91' and length 4
    assert [r["type"] for r in j["ods2"]] == ["AM"] and [r["type"] for r in j["ods3"]] == ["PM"]
    r3 = next(r for r in j["capital"] if r["id"] == 3)
    assert r3["acc_no"] == "AZ12SMRT30110000000000000701" and r3["rowid"]       # outer join to account


def test_page_change_bank_day_and_reopen():
    c = cl()
    assert post(c, "/page", index=0) == {"date": "2026-10-12T00:00:00"}
    assert [b["bal_cn"] for b in post(c, "/page", index=4)["adi"]] == [1891, 1991, 3091]
    assert len(post(c, "/page", index=5)["adi"]) == 12                          # all of BAL_SPR1
    assert len(post(c, "/page", index=6)["ods1"]) == 12


def test_insert_seven_and_eight_arguments(monkeypatch):
    calls = []
    orig = mock.MockConnection.call_proc
    monkeypatch.setattr(mock.MockConnection, "call_proc", lambda s, p, n, a, named=None, commit=True: (calls.append((p, n, list(a), commit)), orig(s, p, n, a, named, commit))[1])
    c = cl()
    j = post(c, "/insert", type="I", bal=3031, acc=0, op_type=2)
    assert calls[-1] == ("SB_CAPITAL", "cap_insert", ["I", 3031, 0, 0, 0, "", 2], False)
    new = j["capital"][-1]
    assert (new["type"], new["bal"], new["acc"], new["op_type"], new["bal_type"]) == ("I", 3031, None, 2, 1)   # decode(0,null)
    assert "ods2" in j and "capital_out" not in j
    j = post(c, "/insert", type="A", bal=0, acc=902, percent=30, op_type=1, bal_type=2, out_active=True)
    assert calls[-1][2] == ["A", 0, 902, 0, 30, "", 1, 2]
    o = next(r for r in j["capital_out"] if r["acc"] == 902)
    assert o["acc_no"] == "AZ12SMRT90210000000000000902" and o["percent"] == 30 and o["bal_type"] == 2


def test_delete_refreshes_like_delphi():
    c = cl()
    j = post(c, "/delete", id=2)
    assert 2 not in [r["id"] for r in j["capital"]] and "ods3" in j
    j = post(c, "/delete", id=8, out=True, out_active=True)
    assert set(j) == {"capital_out"} and 8 not in [r["id"] for r in j["capital_out"]]
    assert post(c, "/delete", id=0)["capital"]                                  # BitBtn15Click with an empty dataset


def test_insert_type_validated():
    assert cl().post(U + "/insert", json={"type": "X", "bal": 1, "acc": 0, "op_type": 1}).status_code == 422


def test_calc_all_memos_and_error_keeps_zeros(monkeypatch):
    c = cl()
    m = post(c, "/calc", date="2026-10-12")["memos"]
    assert m["m_firstcap"] == "48250000,5" and m["m_capumh"] == "52010000" and m["m_passivm"] == "98000,5"
    assert list(m) == [k for k, _ in Q.CAP_CALC]
    assert set(post(c, "/calc", date="2026-01-01")["memos"].values()) == {"0"}
    from app.db.base import DBError
    orig = mock.MockConnection.call_func
    def boom(s, p, n, a, rettype=str, named=None):
        if n == "calculate_capital":
            raise DBError("ORA-01476: divisor is equal to zero", 1476)
        return orig(s, p, n, a, rettype, named)
    monkeypatch.setattr(mock.MockConnection, "call_func", boom)
    j = post(c, "/calc", date="2026-10-12")
    assert "ORA-01476" in j["error"] and j["memos"]["m_adieh"] == "2400000" and j["memos"]["m_cap"] == "0" and j["memos"]["m_capumh"] == "0"


def test_formula_post_commits():
    c = cl()
    f = next(r for r in c.get(U + "/form").json()["capital"] if r["type"] == "F")
    assert post(c, "/formula", rowid=f["rowid"], formula="X+Y-Z+D") == {"ok": True}
    assert next(r for r in post(c, "/rows")["capital"] if r["id"] == f["id"])["formula"] == "X+Y-Z+D"


def test_out_open_and_failure(monkeypatch):
    c = cl()
    j = post(c, "/out/open")
    assert [a["id"] for a in j["accounts_out"]] == [901, 902] and any(r["bal_type"] == 2 for r in j["capital_out"])
    from app.db.base import DBError
    orig = mock.MockConnection.query
    def q(s, sql, b=None):
        if "CAPITAL_ACC_OUT" in sql:
            raise DBError("ORA-00942: table or view does not exist", 942)
        return orig(s, sql, b)
    monkeypatch.setattr(mock.MockConnection, "query", q)
    r = c.post(U + "/out/open", json={})
    assert r.status_code == 400 and r.json()["detail"]["key"] == "cp.cap_out_fail"


def test_rows_reorder_each_dataset():
    c = cl()
    j = post(c, "/rows", order="BAL")
    assert set(j) == {"capital"}
    j = post(c, "/rows", out=True, order_out="PERCENT")
    assert set(j) == {"capital_out"}
