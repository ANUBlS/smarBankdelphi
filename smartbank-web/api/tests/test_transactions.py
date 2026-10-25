import pytest
from fastapi.testclient import TestClient
from app import main, sessions, transactions as tm
from app.db import mock


@pytest.fixture(autouse=True)
def fresh():
    mock.reset(); sessions.attempts._f.clear(); sessions.store._s.clear(); yield


def cl(u="TELLER", p="Teller#2026"):
    c = TestClient(main.app); assert c.post("/api/login", json={"username": u, "password": p}).status_code == 200; return c


D = "2026-10-12"


# ---------------------------------------------------------------- pure Delphi logic
def test_build_filter_matches_actionfilterexecute():
    f = dict(currencies=[(944, True), (840, False), (978, False)], op_types=[(0, True), (9, False)],
             debit_branch=101, credit_branch=None, operator=2, delayed=True, committed=False, rejected=True)
    assert tm.build_filter(f) == ("((DebitCurrencyID<>840)AND(CreditCurrencyID<>840)) AND "
                                  "((DebitCurrencyID<>978)AND(CreditCurrencyID<>978)) AND (DebitBranch=101) AND "
                                  "(OperatorID=2) AND (OperationCode<>9) AND ((Status=1)OR(Status=0)OR(Status=3))")
    assert tm.build_filter({}) == "((Status=1)OR(Status=2)OR(Status=3))"


def test_title_value():
    assert tm.title_value(" ID ", True) == " Status desc,  ID " and tm.title_value("LAMOUNT", False) == "LAMOUNT"


def test_set_amounts_roundnew():
    # same currency -> credit = debit; lamount via rate
    assert tm.set_amounts("debit", 100, 0, 0, 840, 840, 1.7, 1.7) == {"debit": 100.0, "credit": 100.0, "lamount": 170.0}
    # cross: 100 USD -> 170 AZN -> /1.8462 EUR
    r = tm.set_amounts("debit", 100, 0, 0, 840, 978, 1.7, 1.8462)
    assert r["lamount"] == 170.0 and r["credit"] == 92.08
    r = tm.set_amounts("credit", 0, 50, 0, 840, 978, 1.7, 1.8462)
    assert r["lamount"] == 92.31 and r["debit"] == 54.3
    # tsUnknown: only national currency (id 0) sides follow the equivalent
    assert tm.set_amounts("lamount", 1, 2, 30, 0, 840, 1, 1.7) == {"debit": 30.0, "credit": 2.0, "lamount": 30.0}


def test_cash_symbol_filter():
    cash_nat = {"iscacheaccount": 1, "val_acc": 0}
    assert tm.cash_symbol_filter(cash_nat, None) == 0
    assert tm.cash_symbol_filter({"iscacheaccount": 0, "val_acc": 0}, cash_nat) == 1
    assert tm.cash_symbol_filter({"iscacheaccount": 1, "val_acc": 840}, None) == -1


def test_add_params_types():
    t = tm.TrIn(mode="insert", transaction_date=D, debit_id=1, credit_id=2, debit_amount=1.23456, lamount=1)
    p = tm.add_params(t, 77)
    assert str(p["DebitAmount"]) == "1.2346" and p["OutBalanceChar"] == 0 and p["Flags"] == 0
    assert p["TransactionID"] == 77 and p["OperationType"] is None and str(p["DebitRate"]) == "0.0000"


# ---------------------------------------------------------------- API
def test_list_title_status_order_and_filter():
    c = cl()
    i = c.get("/api/transactions/init").json()
    assert i["date"] == D and not i["status_first"] and [o["id"] for o in i["operations"]] == [0, 1, 2, 9]
    r = c.post("/api/transactions/list", json={"date": D}).json()
    assert [x["id"] for x in r["rows"]] == [5001, 5002, 5003, 6001, 6002, 6003, 6004, 6005, 6006, 6007] and r["total"] == 10
    r = c.post("/api/transactions/list", json={"date": D, "title": "LAMOUNT"}).json()
    assert [x["lamount"] for x in r["rows"]] == sorted(x["lamount"] for x in r["rows"])
    r2 = c.post("/api/transactions/list", json={"date": D, "title": ""}).json()          # icon column -> keeps last title
    assert [x["id"] for x in r2["rows"]] == [x["id"] for x in r["rows"]]
    assert c.post("/api/transactions/list", json={"date": D, "title": "1;drop"}).status_code == 400
    assert c.put("/api/transactions/status-order", json={"on": True}).json()["ok"]
    r = c.post("/api/transactions/list", json={"date": D, "title": "ID"}).json()
    assert [x["status"] for x in r["rows"]][:1] == [3] and r["rows"][-1]["status"] == 1
    r = c.post("/api/transactions/list", json={"date": D, "currencies_off": [840], "committed": False}).json()
    assert [x["id"] for x in r["rows"]] == [6003, 6002, 6004, 6006]      # Status desc, ID; USD rows and committed filtered out
    assert r["filter"].startswith("((DebitCurrencyID<>840)")
    r = c.post("/api/transactions/list", json={"date": D, "operator": 2}).json()
    assert {x["operatorid"] for x in r["rows"]} == {2}
    mock._load()["users"]["TELLER"]["rights"].remove(tm.CLSID)
    assert c.post("/api/transactions/list", json={"date": D}).status_code == 403


def test_each_filter_narrows_like_actionfilter():
    """TransactionManagerImpl.pas ActionFilterExecute: every sidebar control narrows the fixture rows."""
    c = cl()
    ids = lambda **f: [x["id"] for x in c.post("/api/transactions/list", json={"date": D, **f}).json()["rows"]]
    full = ids()
    assert len(full) == 10
    cases = {
        "currency 978 off": dict(currencies_off=[978]),
        "currency 840 off": dict(currencies_off=[840]),
        "op type 1 off": dict(op_types_off=[1]),
        "op type 2 off": dict(op_types_off=[2]),
        "debit branch 102": dict(debit_branch=102),
        "credit branch 102": dict(credit_branch=102),
        "operator 1": dict(operator=1),
        "no delayed": dict(delayed=False),
        "no committed": dict(committed=False),
        "no rejected": dict(rejected=False),
    }
    for name, f in cases.items():
        got = ids(**f)
        assert got and len(got) < len(full) and set(got) <= set(full), name
    assert 6006 not in ids(currencies_off=[978]) and 6006 not in ids(op_types_off=[1])
    assert 6007 not in ids(op_types_off=[2]) and ids(debit_branch=102) == [6006]
    assert 6006 in ids(credit_branch=102) and 6003 not in ids(rejected=False)
    assert c.post("/api/transactions/list", json={"date": D, "debit_branch": "1 or 1=1"}).status_code == 422   # bound int


def test_commission_list_columns():
    c = cl()
    rows = c.get("/api/transactions/commissions").json()
    r = next(x for x in rows if x["id"] == 2)
    assert r["adebitaccount"] and r["acreditaccount"] and r["adebitcurrency"] and r["commisionassignment"]
    assert [x["name"] for x in rows] == sorted(x["name"] for x in rows)    # order by name


def test_reject_commit_delete():
    c = cl()
    r = c.post("/api/transactions/reject", json={"date": D, "ids": [6001, 5001], "reason": "Səhv"}).json()
    assert r == {"rejected": 1, "errors": 0, "total": 1}
    rows = {x["id"]: x for x in c.post("/api/transactions/list", json={"date": D}).json()["rows"]}
    assert rows[6001]["status"] == 3 and rows[6001]["reject_reason"] == "Səhv"
    r = c.post("/api/transactions/commit", json={"date": D, "ids": [6001, 6003]}).json()
    assert r["committed"] == 1 and r["errors"] == 1
    assert c.post("/api/transactions/delete", json={"date": D, "id": 6004}).json() == {"blocked": True}
    assert c.post("/api/transactions/delete", json={"date": D, "id": 6002}).json() == {"deleted": True}
    assert c.post("/api/transactions/delete", json={"date": D, "id": 5001}).status_code == 400   # single: error shown
    assert "failed" in c.post("/api/transactions/delete", json={"date": D, "id": 5001, "multi": True}).json()


def test_editor_save_insert_edit_commission():
    c = cl()
    lk = c.get("/api/transactions/editor-lookups").json()
    assert lk["system_date"] == D and lk["accounts"][0]["acc_no_search"] == lk["accounts"][0]["acc_no"]
    assert [x["id"] for x in lk["trdest"]] == [1, 2, 3]
    am = c.post("/api/transactions/amounts", json={"side": "debit", "debit": 100, "debit_currency_id": 840, "credit_currency_id": 944}).json()
    assert am == {"debit": 100.0, "credit": 170.0, "lamount": 170.0}
    base = dict(mode="insert", transaction_date=D, debit_currency_id=840, credit_currency_id=944, debit_rate=1.7,
                credit_rate=1, debit_id=1002, credit_id=1005, debit_amount=100, credit_amount=170, lamount=170, name="Satış",
                report_id=0, countr_id=1)
    assert c.post("/api/transactions/save", json={**base, "lamount": 0}).json()["detail"]["key"] == "transactions.err_lamount"
    assert c.post("/api/transactions/save", json={**base, "credit_id": 1006}).json()["detail"]["key"] == "transactions.err_account_currency"
    assert c.post("/api/transactions/save", json={**base, "inbalancechar": "99"}).json()["detail"]["key"] == "transactions.err_cash_symbol"
    assert c.post("/api/transactions/save", json={**base, "operation_code": 9}).json()["detail"]["key"] == "transactions.err_tredit"
    new_id = c.post("/api/transactions/save", json=base).json()["id"]
    rows = {x["id"]: x for x in c.post("/api/transactions/list", json={"date": D}).json()["rows"]}
    assert rows[new_id]["status"] == 1 and rows[new_id]["lamount"] == 170.0
    # edit = delete + add with the same id
    assert c.post("/api/transactions/save", json={**base, "mode": "edit", "id": new_id, "orig_date": D, "name": "Düzəliş"}).json()["id"] == new_id
    rows = {x["id"]: x for x in c.post("/api/transactions/list", json={"date": D}).json()["rows"]}
    assert rows[new_id]["name"] == "Düzəliş"
    # editing a committed transaction needs TRANSACTIONCOMMITEDEDIT
    r = c.post("/api/transactions/save", json={**base, "mode": "edit", "id": 5001, "orig_date": D, "debit_id": 1001, "debit_currency_id": 944,
                                                "debit_rate": 1, "debit_amount": 250, "credit_amount": 250, "lamount": 250})
    assert r.status_code == 400 and "20280" in str(r.json())
    # commission: main + SetTransactions child
    com = c.get("/api/transactions/commissions").json()[0]
    n = len(c.post("/api/transactions/list", json={"date": D}).json()["rows"])
    c.post("/api/transactions/save", json={**base, "mode": "commission", "commission_id": com["id"], "debit_id": 1003, "credit_id": 1007,
                                           "debit_currency_id": 944, "credit_currency_id": 944, "debit_rate": 1, "debit_amount": 5,
                                           "credit_amount": 5, "lamount": 5})
    assert len(c.post("/api/transactions/list", json={"date": D}).json()["rows"]) == n + 2
