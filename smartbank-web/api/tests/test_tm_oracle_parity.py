"""Oracle parity for Packages/TransactionManager (docs/oracle-parity.md, section Transaction Manager).

A recording fake connection captures every DB call the handlers make. The expected SQL texts, package calls,
parameters and commit order come from the Delphi sources; dataset SQL is re-read from the .dfm files
(working tree, or `git show HEAD:` in a sparse checkout)."""
import datetime
import os
import sys

import pytest

from app import transactions as T
from app import tm_sql as Q
from app.db import DBError

sys.path.insert(0, os.path.dirname(__file__))
from test_accounts_oracle_parity import Rec as _Rec  # noqa: E402
from test_login_oracle_parity import dfm_props  # noqa: E402

TM = "Packages/TransactionManager/"


class Rec(_Rec):
    def execute(self, sql, binds=None):
        self.calls.append(("execute", sql, dict(binds or {})))
D = datetime.date(2026, 10, 12)


@pytest.mark.parametrize("rel,obj,const", [
    ("TransactionDataModuleUnit.dfm", "ODS_StatusT", Q.SQL_STATUST),
    ("TransactionDataModuleUnit.dfm", "ODS_VidOPTrDel", Q.SQL_VIDOP_TRDEL),
    ("TransactionDataModuleUnit.dfm", "ODS_Settings", Q.SQL_SRC_POS),
    ("TransactionDataModuleUnit.dfm", "Transactions", Q.SQL_TRANSACTIONS),
    ("TransactionDataModuleUnit.dfm", "Commission", Q.SQL_COMMISSION),
    ("TransactionDestinationImpl.dfm", "TrDest", Q.SQL_TRDEST),
])
def test_sql_verbatim_from_dfm(rel, obj, const):
    assert dfm_props(TM + rel, obj)["SQL.Strings"] == const


@pytest.mark.parametrize("rel,obj", [("TransactionDataModuleUnit.dfm", "ODS_StatusT"),
                                     ("TransactionDestinationImpl.dfm", "TrDest")])
def test_doa_defaults_for_generated_dml(rel, obj):
    # no LockingMode / CommitOnPost streamed -> DOA defaults: lock at Post, commit after Post/Delete
    p = dfm_props(TM + rel, obj)
    assert "LockingMode" not in p and "CommitOnPost" not in p


def test_trdest_navigator_is_editable():
    p = dfm_props(TM + "TransactionDestinationImpl.dfm", "DBNavigator1")
    assert "VisibleButtons" not in p and p.get("DataSource") == "TrDestData"


def _tr(**kw):
    base = dict(mode="insert", transaction_date=D, operation_code=3, debit_currency_id=0, credit_currency_id=0,
                debit_rate=1, credit_rate=1, debit_id=11, credit_id=12, debit_amount=5, credit_amount=5, lamount=5)
    base.update(kw)
    return T.TrIn(**base)


def _rec(cnt=0):
    return Rec({"Avalute": [{"VALUTE": 0}],
                "ACC_No_Search": [{"ID": 11, "VAL_ACC": 0}, {"ID": 12, "VAL_ACC": 0}],
                "vid_OP\nwhere ID =:v_ID": [{"CNT": cnt}], "AccNoSearchPos": [{"VALUE": None}]})


def _db(calls):
    """Calls without the web-only validation reads."""
    keep = (Q.SQL_VIDOP_TRDEL,)
    return [c for c in calls if c[0] != "query" or c[1] in keep]


def test_editor_open_access_checks():
    for mode, op in (("insert", "insert"), ("edit", "update")):
        c = Rec(); T.editor_open(c, mode)
        assert c.calls == [("proc", "SB_ACA.CheckObjectAccess", ["Transaction", op], {}, False)]
    c = Rec(); T.editor_open(c, "commission")
    assert c.calls == []                                   # GridCommissionDblClick: no access check


def test_save_insert_sequence():
    c = _rec(); assert T.save_transaction(c, _tr(), None, access_checked=True) == 7
    calls = _db(c.calls)
    assert calls[0] == ("query", Q.SQL_VIDOP_TRDEL, {"v_ID": 3})
    assert calls[1] == ("func", "SB_TRANSACTION.GenerateID", [], {})
    assert calls[2][1] == "SB_TRANSACTION.transaction_add" and calls[2][3]["TransactionID"] == 7
    assert calls[3:] == [("commit",)]


def test_save_commission_sequence_has_no_access_check():
    c = _rec(); T.save_transaction(c, _tr(mode="commission", commission_id=4), None, access_checked=False)
    names = [x[1] for x in _db(c.calls) if x[0] != "commit"]
    assert "SB_ACA.CheckObjectAccess" not in names
    assert names[1:] == ["SB_TRANSACTION.GenerateID", "SB_TRANSACTION.transaction_add", "SB_COMPLEX_TRANSACTIONS.SetTransactions"]
    sp = [x for x in c.calls if x[1:2] == ("SB_COMPLEX_TRANSACTIONS.SetTransactions",)][0]
    assert sp[3]["CommisionID"] == 4 and sp[3]["v_ParentID"] == 7 and c.calls[-1] == ("commit",)


def test_save_edit_committed_sequence():
    c = _rec(); T.save_transaction(c, _tr(mode="edit", id=9), {"status": T.TS_COMMITED}, access_checked=True)
    calls = _db(c.calls)
    assert calls[0] == ("proc", "SB_ACA.CheckAdvancedObjectAccess", ["TRANSACTIONCOMMITEDEDIT"], {}, False)
    assert calls[1][1] == Q.SQL_VIDOP_TRDEL
    assert calls[2] == ("proc", "SB_TRANSACTION.transaction_delete", [], {"TransactionID": 9}, False)
    assert calls[3][1] == "SB_TRANSACTION.transaction_add" and calls[3][3]["TransactionID"] == 9
    assert calls[4:] == [("commit",)]


def test_save_blocked_by_vidop_before_post():
    c = _rec(cnt=1)
    with pytest.raises(T.TrError):
        T.save_transaction(c, _tr(), None, access_checked=True)
    assert [x for x in c.calls if x[0] in ("func", "proc", "commit")] == []


def test_delete_access_check_once_per_action():
    c = Rec({"vid_OP": [{"CNT": 0}]})
    T.delete_one(c, {"id": 1, "operationcode": 3}, True, check=True)
    T.delete_one(c, {"id": 2, "operationcode": 3}, True, check=False)
    assert c.calls == [
        ("proc", "SB_ACA.CheckObjectAccess", ["Transaction", "delete"], {}, False),
        ("query", Q.SQL_VIDOP_TRDEL, {"v_ID": 3}),
        ("proc", "SB_TRANSACTION.transaction_delete", [], {"TransactionID": 1}, False), ("commit",),
        ("query", Q.SQL_VIDOP_TRDEL, {"v_ID": 3}),
        ("proc", "SB_TRANSACTION.transaction_delete", [], {"TransactionID": 2}, False), ("commit",)]


class Failing(Rec):
    def call_proc(self, pkg, name, args, named=None, commit=True):
        super().call_proc(pkg, name, args, named, commit)
        if name == "transaction_delete":
            raise DBError("ORA-20101: x", 20101)


def test_delete_error_single_raises_without_commit_multi_swallows_and_commits():
    c = Failing({"vid_OP": [{"CNT": 0}]})
    with pytest.raises(DBError):
        T.delete_one(c, {"id": 1, "operationcode": 3}, False, check=False)
    assert ("commit",) not in c.calls
    c = Failing({"vid_OP": [{"CNT": 0}]})
    assert "failed" in T.delete_one(c, {"id": 1, "operationcode": 3}, True, check=False)
    assert c.calls[-1] == ("commit",)


def test_reject_sequence():
    c = Rec(); T.reject(c, {5: {"status": T.TS_DELAYED}, 6: {"status": T.TS_COMMITED}}, [5, 6], "r")
    assert c.calls == [("func", "SB_TRANSACTION.transaction_reject", [], {"TransactionID": 5, "RejectReason": "r"}), ("commit",)]


def test_status_first_doa_post():
    c = Rec({"TRANSACTION_STATUST": [{"ROWID": "AAS1", "VALUE": "0"}]})
    T.set_status_first(c, True)
    assert c.calls == [("query", Q.SQL_STATUST, {}),
                       ("query", Q.SQL_STATUST_LOCK, {"doa__rowid": "AAS1"}),
                       ("execute", Q.SQL_STATUST_UPDATE, {"VALUE": "1", "doa__rowid": "AAS1"}), ("commit",)]


def test_src_pos_defaults_to_zero():
    c = Rec({"AccNoSearchPos": []}); T.accounts(c)
    assert c.calls[-1] == ("query", Q.SQL_ACCOUNTS, {"src_pos": 0})


def test_trdest_dml():
    c = Rec(); T.trdest_insert(c, 8, "X")
    assert c.calls == [("execute", Q.SQL_TRDEST_INSERT, {"ID": 8, "NAME": "X"}), ("commit",)]
    c = Rec({"TRDESTINATION where ID": [{"DOA__ROWID": "R8"}]}); T.trdest_update(c, 8, 8, "Y", "X")
    assert c.calls[1:] == [("query", Q.SQL_TRDEST_LOCK, {"doa__rowid": "R8"}),
                           ("execute", Q.SQL_TRDEST_UPDATE_NAME, {"NAME": "Y", "doa__rowid": "R8"}), ("commit",)]
    c = Rec({"TRDESTINATION where ID": [{"DOA__ROWID": "R8"}]}); T.trdest_update(c, 8, 8, "X", "X")
    assert len(c.calls) == 1                                # unmodified Post sends nothing
    c = Rec({"TRDESTINATION where ID": [{"DOA__ROWID": "R8"}]}); T.trdest_delete(c, 8)
    assert c.calls[1:] == [("query", Q.SQL_TRDEST_LOCK, {"doa__rowid": "R8"}),
                           ("execute", Q.SQL_TRDEST_DELETE, {"doa__rowid": "R8"}), ("commit",)]


def test_mock_api_new_endpoints():
    from test_transactions import cl
    from app.db import mock
    mock.reset()
    c = cl()
    assert c.post("/api/transactions/editor-open", json={"mode": "insert"}).json() == {"ok": True}
    assert c.post("/api/transactions/editor-open", json={"mode": "commission"}).json() == {"ok": True}
    assert c.put("/api/transactions/status-order", json={"on": True}).json()["ok"]
    assert c.post("/api/transactions/trdest", json={"id": 9901, "name": "Test"}).json() == {"ok": True}
    assert c.post("/api/transactions/trdest", json={"id": 9901, "name": "Dup"}).status_code == 400
    assert c.put("/api/transactions/trdest/9901", json={"id": 9901, "name": "Test2"}).json() == {"ok": True}
    td = {d["id"]: d["name"] for d in c.get("/api/transactions/editor-lookups").json()["trdest"]}
    assert td[9901] == "Test2"
    assert c.delete("/api/transactions/trdest/9901").json() == {"ok": True}
    assert c.delete("/api/transactions/trdest/9901").status_code == 404
    mock.reset()
