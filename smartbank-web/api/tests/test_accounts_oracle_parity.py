"""Oracle parity for Packages/Accounts: the SQL texts, package calls, parameters and commit order that the API sends
to the DB layer must be the ones the Delphi code sends (docs/oracle-parity.md, section Accounts).

A recording fake connection captures every call; expected values are copied from the Delphi sources, and when the
Delphi tree is present (repo checkout with Packages/Accounts) the dataset SQL is also re-read from the .dfm files."""
import datetime
import os
import sys

import pytest

from app import accounts

HERE = os.path.dirname(__file__)
DELPHI = os.path.normpath(os.path.join(HERE, "..", "..", "..", "Packages", "Accounts"))
SB = os.path.normpath(os.path.join(HERE, "..", "..", "..", "Packages", "sboapi50"))


class Rec:
    """Records what a handler sends to the DB layer (same interface as app.db.oracle.OracleConnection)."""

    def __init__(self, rows=None):
        self.calls, self.rows = [], rows or {}
        self.username = "TELLER"

    def _rows(self, sql):
        for k, v in self.rows.items():
            if k in sql:
                return v
        return []

    def query(self, sql, binds=None):
        self.calls.append(("query", sql, dict(binds or {})))
        return self._rows(sql)

    def call_func(self, pkg, name, args, rettype=str, named=None):
        self.calls.append(("func", f"{pkg}.{name}", list(args), dict(named or {})))
        return {int: 7, datetime.datetime: datetime.datetime(2026, 10, 12)}.get(rettype, "x")

    def call_bool(self, pkg, name, args, named=None):
        self.calls.append(("bool", f"{pkg}.{name}", list(args), dict(named or {})))
        return named.get("FlagChar") == "A"

    def call_proc(self, pkg, name, args, named=None, commit=True):
        self.calls.append(("proc", f"{pkg}.{name}", list(args), dict(named or {}), commit))
        return {}

    def commit(self):
        self.calls.append(("commit",))

    def rollback(self):
        self.calls.append(("rollback",))


def dfm_sql(fname, obj):
    sys.path.insert(0, os.path.join(HERE, "..", "..", "tools"))
    from dfmdump import dump
    for o in dump(os.path.join(DELPHI, fname)):
        if o["name"] == obj:
            return o["props"]["SQL.Strings"]
    raise KeyError(obj)


need_delphi = pytest.mark.skipif(not os.path.isdir(DELPHI), reason="Delphi sources (Packages/Accounts) not checked out")


@need_delphi
@pytest.mark.parametrize("fname,obj,const", [
    ("AccountDataModuleImpl.dfm", "SAccsData", accounts.SQL_SACCS[1]),
    ("AccountDataModuleImpl.dfm", "SAccsData2", accounts.SQL_SACCS[2]),
    ("AccountDataModuleImpl.dfm", "SAccsData3", accounts.SQL_SACCS[3]),
    ("AccountDataModuleImpl.dfm", "SAccsData4", accounts.SQL_SACCS[4]),
    ("AccountDataModuleImpl.dfm", "CustomersData", accounts.SQL_CUSTOMERS),
    ("AccountDataModuleImpl.dfm", "CurrencyData", accounts.SQL_CURRENCY),
    ("AccountDataModuleImpl.dfm", "ReportSymbolData", accounts.SQL_REPORT_SYMBOL),
    ("AccountDataModuleImpl.dfm", "FilialsData", accounts.SQL_FILIALS),
    ("AccountDataModuleImpl.dfm", "AccFlagsData", accounts.SQL_ACC_FLAGS),
    ("AccountDataModuleImpl.dfm", "AccountFlagsData", accounts.SQL_ACCOUNT_FLAGS),
    ("AccountPropertiesForm_Unit.dfm", "AccountsData", accounts.SQL_PAIR_ACCOUNTS),
    ("AccStatesImpl.dfm", "AccStateData", accounts.SQL_ACC_STATES),
    ("AccTransactionsFormImpl.dfm", "DebitTransactionsData", accounts.SQL_DEBIT_TRANSACTIONS),
    ("AccTransactionsFormImpl.dfm", "CreditTransactionsData", accounts.SQL_CREDIT_TRANSACTIONS),
])
def test_dataset_sql_is_verbatim_from_dfm(fname, obj, const):
    assert const == dfm_sql(fname, obj)


@need_delphi
def test_saccountsquery_is_verbatim_from_pas():
    src = open(os.path.join(DELPHI, "AccountMainFormImpl.pas"), encoding="latin-1").read()
    body = src[src.index("SAccountsQuery =") + len("SAccountsQuery ="):]
    body = body[:body.index(";")]
    text = "".join(p.replace("''", "'") + ("\r\n" if crlf else "")
                   for p, crlf in __import__("re").findall(r"'((?:[^']|'')*)'(#13#10)?", body))
    assert accounts.SACCOUNTS_QUERY == text


@pytest.mark.skipif(not os.path.isdir(SB), reason="Packages/sboapi50 not checked out")
def test_package_procedure_names_from_sbsrvintf():
    src = open(os.path.join(SB, "SBSrvIntf.pas"), encoding="latin-1").read()
    for const, name in (("sPN_AddAccount", "add_account"), ("sPN_UpdateAccount", "upd_account"),
                        ("sPN_CloseAccount", "close_account"), ("sPN_GetDate", "get_date"), ("sPN_FlagExsist", "FlagExsist")):
        assert f"{const} = '{name}';" in src


def test_refresh_runs_buildaccsquery_then_accflags():
    c = Rec()
    accounts.refresh(c, dict(apply_filter=True, status="closed", customer_id=3, order="currency"))
    (k1, sql1, b1), (k2, sql2, b2) = c.calls
    assert sql1.startswith("select * from (select q.*, rownum rn__ from (\r\n" + accounts.SACCOUNTS_QUERY)
    assert " AND (acc.CLOSE_DAT IS NOT NULL)\r\n AND (acc.KLI_ID = 3)\r\nORDER BY acc.VAL_ACC\r\n) q" in sql1
    assert b1 == {"lo__": 0, "hi__": 51}                                   # FetchRecLimit = 50 (+1 to see "more")
    assert sql2 == "SELECT symbol, name, description\n  FROM account_flags" and b2 == {}


def body(**kw):
    d = dict(acc_no="AZ12SMRT38010019440000000099", acc_name="N", customer_id=2, currency_id=944,
             open_date="2026-10-12T15:30:00", sacc=3801, acc_flags="A,O")
    d.update(kw)
    return accounts.AccountIn(**d)


ADD_PARAMS = {"customerid": 2, "op_id": 0, "accno": "AZ12SMRT38010019440000000099", "currencyid": 944, "NAME": "N",
              "open_dat": datetime.datetime(2026, 10, 12), "balcn": 3801, "LIMIT": 0.0,
              "close_dat": None,   # NullDate 0.0 -> NULL (DOA Preferences.ZeroDateIsNull, default True)
              "filial": 0, "sim_otcet": 0, "pair_acc": 0, "bal_cn2": 0, "bal_cn3": 0, "bal_cn4": 0, "typeacc": "A,O"}


def test_add_account_calls_sbop_add_account_then_commit():
    # SBAccount.pas:80-103 Sb_AddAccount (SBOP pmNamed) ; AccountDataModuleImpl.pas:131 Sb_Commit
    c = Rec()
    assert accounts.add_account(c, body()) == 7
    assert c.calls == [("func", "SBOP.add_account", [], ADD_PARAMS), ("commit",)]


def test_update_account_locks_row_then_upd_account_then_commit():
    # lmCheckImmediate lock on Edit, SBAccount.pas:124-147 Sb_EditAccount, Sb_Commit
    c = Rec({"select rowid as doa__rowid": [{"DOA__ROWID": "AAAx"}]})
    accounts.update_account(c, 1001, body())
    assert c.calls[0] == ("query", "select rowid as doa__rowid from ACCOUNT where ID = :acc_id", {"acc_id": 1001})
    assert c.calls[1] == ("query", "select * from ACCOUNT where rowid = :doa__rowid for update nowait", {"doa__rowid": "AAAx"})
    assert c.calls[2] == ("proc", "SBOP.upd_account", [], {"v_id": 1001, **{"v_" + k: v for k, v in ADD_PARAMS.items()}}, False)
    assert c.calls[3:] == [("commit",)]


def test_close_account_calls_close_account_doclose_1():
    # AccountMainFormImpl.pas:813-829 CloseExecute -> SBAccount.pas:149-155 SBOP.close_account(AccID, DoClose => 1)
    c = Rec({"AND (acc.ID = :acc_id)": [{"ACCID": 1001, "AMOUNT": 0, "LAMOUNT": 0, "CLOSEDATE": None}]})
    accounts.close_account(c, 1001)
    assert c.calls[1] == ("proc", "SBOP.close_account", [], {"AccID": 1001, "DoClose": 1}, False)


def test_new_defaults_order_matches_new_and_formactivate():
    # AccountPropertiesForm_Unit.pas:180 CustomersData.Refresh, :182 Sb_GetSystemDate, :283 SB_ACA.getuserfilialid
    c = Rec()
    accounts.new_defaults(c)
    assert [x[1] for x in c.calls] == [accounts.SQL_CUSTOMERS, "SBOP.get_date", "SB_ACA.getuserfilialid"]
    assert c.calls[1][2:] == ([], {}) and c.calls[2][2:] == ([], {})


def test_flagexsist_named_params():
    # AccountPropertiesForm_Unit.pas:221 FlagExsist(AccFlags, Symbol[1]) -> SBAccount.pas:70-78 SBUTIL (pmNamed)
    c = Rec()
    assert accounts.flags_of(c, "A,O", ["A", "I"]) == ["A"]
    assert c.calls == [("bool", "SBUTIL.FlagExsist", [], {"AccountType": "A,O", "FlagChar": "A"}),
                       ("bool", "SBUTIL.FlagExsist", [], {"AccountType": "A,O", "FlagChar": "I"})]


def test_transactions_and_states_binds():
    c = Rec()
    accounts.transactions(c, 1001, "X", datetime.date(2026, 10, 1), datetime.date(2026, 10, 12))
    s, e = datetime.datetime(2026, 10, 1), datetime.datetime(2026, 10, 12)
    assert c.calls == [("query", accounts.SQL_DEBIT_TRANSACTIONS, {"StartDate": s, "EndDate": e, "DebitAccID": 1001}),
                       ("query", accounts.SQL_CREDIT_TRANSACTIONS, {"CreditAccID": 1001, "StartDate": s, "EndDate": e})]
    c = Rec()
    accounts.states(c, 1001)
    assert c.calls == [("query", accounts.SQL_ACC_STATES, {"AccID": 1001})]


def test_mock_path_literal_filters_and_flags_refresh():
    """DB_MODE=mock keeps working with the literal BuildAccsQuery filters."""
    from fastapi.testclient import TestClient
    from app.main import app
    with TestClient(app) as c:
        assert c.post("/api/login", json={"username": "TELLER", "password": "Teller#2026"}).status_code == 200
        r = c.get("/api/accounts", params=dict(apply_filter=True, status="all", customer_id=3, flag="A")).json()
        assert r["rows"] and all(x["customerid"] == 3 and "A" in (x["accflags"] or "") for x in r["rows"])
        assert [f["symbol"] for f in r["acc_flags"]]                       # AccFlagsData.Refresh
        acc = r["rows"][0]
        a = c.get(f"/api/accounts/{acc['accid']}").json()
        r2 = c.put(f"/api/accounts/{acc['accid']}", json=dict(acc_no=a["accno"], acc_name=a["accname"], customer_id=a["customerid"],
                   currency_id=a["currencyid"], open_date=a["opendate"], sacc=a["sacc"], acc_flags=a["accflags"]))
        assert r2.status_code == 200, r2.text                              # lock + upd_account + commit on the mock
