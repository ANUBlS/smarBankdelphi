"""Packages/out_repair (TOut_RepairFrm) - off-balance transaction correction through Out_Correct.Main."""
from fastapi.testclient import TestClient
from app.main import app
from app.db import mock as mock_db, mock_oacc
from app import out_repair as M
from app import out_rep_sql as Q

client = TestClient(app)
B = "/api/out-repair"
D = {"dat": "2026-10-01", "dat2": "2026-10-12"}


def login(u="ADMIN", p="Admin#2026"):
    mock_db.reset()
    mock_oacc.reset()
    assert client.post("/api/login", json={"username": u, "password": p}).status_code == 200


def test_sql_verbatim():
    assert "p.dat between :DAT and :DAT2" in Q.SQL_TRANSACTIONS and Q.SQL_TRANSACTIONS.rstrip().endswith("ORDER BY :Title")
    assert Q.SQL_KASSA == "select * from KASSA_B\r\norder by symbol\r\n"
    assert Q.SQL_RATES.count("OperKurs rates") == 1 and " and dat=:Dat" in Q.SQL_RATES
    assert "Out_Bal_SPR1 b" in Q.SQL_DEBIT_ACCOUNTS and "out_Bal_SPR1 b" in Q.SQL_CREDIT_ACCOUNTS
    assert Q.PKG_CORRECT == "Out_Correct"


def test_mode_and_rounding():
    assert [M.mode_of(r, p) for r, p in ((False, True), (False, False), (True, True), (True, False))] == [2, 2, 0, 1]
    assert M.round_new(2.345, 100) == 2.35 and M.round_new(2.344, 100) == 2.34
    a = M.change_amounts("debit", 100, 0, 0, 1.7, 1.0)
    assert a == {"debit": 100, "credit": 170.0, "lamount": 170.0}
    assert M.change_amounts("debit", 0, 5, 7, 1.7, 1.0) == {"debit": 0, "credit": 5, "lamount": 7}   # Text '0' -> Exit
    assert M.in_balance_state({"iscacheaccount": 1, "val_acc": 0}, None) == 0
    assert M.in_balance_state({"iscacheaccount": 1, "val_acc": 840}, {"iscacheaccount": 1, "val_acc": 0}) == 1
    assert M.in_balance_state(None, None) == -1


def test_filter_string_quirks():
    vals = [{"id": 0}, {"id": 840}]
    ops = [{"id": 0}, {"id": 1}, {"id": 2}]
    users = [{"id": 1}, {"id": 2}]
    fil = [{"id": 101}, {"id": 102}]
    s, _ = M.build_filter({"user_index": 2, "valute_checked": [True, False, True]}, vals, ops, users, fil)
    assert s == "(OPERATORID=2) and ((DebitCurrencyID<>840) or (CreditCurrencyID<>840))"
    s, _ = M.build_filter({"valute_checked": [True, True, False]}, vals, ops, users, fil)
    assert s == "((DebitCurrencyID<>CreditCurrencyID) or (CreditCurrencyID<>CreditCurrencyID))"
    s, _ = M.build_filter({"operation_checked": [False, True, False]}, vals, ops, users, fil)
    assert s == "((OperationType<>0) or (OperationType<>0)) and (OperationType=2)"      # last row: '=' (Val=True)
    s, _ = M.build_filter({"debit_filial": 0, "credit_filial": 2}, vals, ops, users, fil)
    assert s == "(CredFil=102)"                                                         # ItemIndex 0 ignored


def test_rights():
    login("TELLER", "Teller#2026")
    r = client.get(B + "/init")
    assert r.status_code in (200, 403)


def test_init_list_filter_dates():
    login()
    i = client.get(B + "/init").json()
    assert i["date"] == "2026-10-12" and [v["id"] for v in i["valutes"]] == [0, 840, 978]
    assert [k["mediocrity"] for k in i["kassa"]] == [0, 1, -1]
    rows = client.post(B + "/list", json=D).json()["rows"]
    assert len(rows) == 4 and {"debfil", "credfil", "operationtype"} <= set(rows[0])
    r = client.post(B + "/list", json={**D, "filter": {"debit_filial": 2}}).json()
    assert r["filter"] == "(DebFil=102)" and all(x["debfil"] == 102 for x in r["rows"])
    e = client.post(B + "/list", json={"dat": "2026-10-12", "dat2": "2026-10-01"})
    assert e.status_code == 400 and e.json()["detail"]["key"] == "out_repair.err_dates"


def _tr(**k):
    t = {"action": "insert", "date": "2026-10-12", "debit_currency_id": 0, "credit_currency_id": 0, "debit_id": 9101,
         "credit_id": 9103, "debit_rate": 1, "credit_rate": 1, "debit_amount": 50, "credit_amount": 50, "lamount": 50,
         "name": "Düzəliş"}
    t.update(k)
    return t


def test_check_messages():
    login()
    for k, key in (({"debit_currency_id": 840}, "err_debt"), ({"credit_id": 9105}, "err_cred"), ({"name": ""}, "err_descr")):
        r = client.post(B + "/save", json=_tr(**k))
        assert r.status_code == 400 and r.json()["detail"]["key"] == "out_repair." + key


def test_convert_question_then_save():
    login()
    t = _tr(credit_currency_id=978, credit_id=9105, credit_amount=46, outbalancechar=0)
    assert client.post(B + "/save", json=t).json() == {"ask_convert": True}
    r = client.post(B + "/save", json={**t, "convert_confirmed": True}).json()
    assert r["result"] > 0
    log = mock_oacc._load()["out_correct_log"][-1]
    assert log["Flag"] == 1 and log["CorMode"] == 2 and log["TransactionID"] is None and log["OutBalanceChar"] == 0


def test_insert_update_delete():
    login()
    new = client.post(B + "/save", json=_tr()).json()["result"]
    rows = client.post(B + "/list", json=D).json()["rows"]
    assert any(x["id"] == new for x in rows)
    client.post(B + "/save", json=_tr(action="update", id=new, debit_amount=60, credit_amount=60, lamount=60, ch_rate=True))
    log = mock_oacc._load()["out_correct_log"][-1]
    assert log["Flag"] == 2 and log["CorMode"] == 1 and log["TransactionID"] == new
    assert client.post(B + "/delete", json={**D, "id": new}).json()["result"] == 1
    log = mock_oacc._load()["out_correct_log"][-1]
    assert log["Flag"] == 0 and log["CorMode"] == 0 and log["InBalanceChar"] == 0
    assert not any(x["id"] == new for x in client.post(B + "/list", json=D).json()["rows"])


def test_amounts_and_accounts():
    login()
    a = client.post(B + "/amounts", json={"side": "debit", "date": "2026-10-12", "debit_currency_id": 840,
                                          "credit_currency_id": 0, "debit": 10}).json()
    assert a["lamount"] == 17.0 and a["credit"] == 17.0
    acc = client.get(B + "/accounts", params={"side": "debit", "val_acc": 0}).json()
    assert [x["acc_no"] for x in acc] == sorted(x["acc_no"] for x in acc) and all(x["val_acc"] == 0 for x in acc)
    assert client.get(B + "/descriptions").json()[0] == "Girov qəbulu"
