"""Currency Position (TFrmCurrencyPosition, Packages/CurrencyPosition) - api/app/currencyposition.py."""
import pytest
from fastapi.testclient import TestClient
from app import main, sessions, cp_sql as Q, currencyposition as CP, dbf_template as DBF
from app.db import mock, mock_cp


@pytest.fixture(autouse=True)
def fresh():
    mock.reset(); sessions.attempts._f.clear(); sessions.store._s.clear(); yield


def cl(u="ADMIN", p="Admin#2026"):
    c = TestClient(main.app); assert c.post("/api/login", json={"username": u, "password": p}).status_code == 200; return c


def post(c, url, code=200, **b):
    r = c.post(url, json=b); assert r.status_code == code, r.text; return r


U = "/api/currencyposition"
RUN = dict(beg="2026-10-01", end="2026-10-12", plan=1)


def test_sql_built_like_delphi():
    assert Q.sql_do_open("ADMIN") == "Select  *  From CurrencyPosition_ADMIN  Order By  PresentDate,Balance"
    assert Q.sql_remainders("ADMIN") == "Select Sum(Active),Sum(Passive) From CurrencyPosition_ADMIN"
    assert Q.refresh_where(True, True) == " Where  (PresentDate=:ADate)And (Currency =:Currency)"
    assert Q.refresh_where(False, True) == " Where  (Currency =:Currency)"
    assert Q.sql_refresh("U", Q.refresh_where(True, False)) == "Select * From CurrencyPosition_U Where  (PresentDate=:ADate) Order By  PresentDate,Balance"
    assert Q.sql_checking("U") == "Select  TblChecking.*,TblChecking.RowID From  CPSUM_U TblChecking"
    assert Q.SQL_CP_ODSCURRENCY == "Select  Valute,Valu_Name \n From  AVALUTE"
    assert "( DAT=:CurrentDate)  And   (VAL_KOD=:Currency)" in Q.SQL_CP_ODSFILLFILE


def test_init():
    j = cl().get(U + "/init").json()
    assert j["bank_day"].startswith("2026-10-12") and j["file"] == "C:\\Balansb.dbf"
    assert [c["valute"] for c in j["currencies"]] == [0, 1, 2, 3] and j["currencies"][1]["name"] == "ABŞ dolları"


def test_refresh_before_execute_table_missing():
    # the page blocks Təzələ while ODSDate is closed; the table itself does not exist yet
    assert cl().post(U + "/refresh", json={}).status_code >= 400


def test_execute_fills_table_dates_and_sums():
    c = cl()
    j = post(c, U + "/execute", **RUN).json()
    assert [d[:10] for d in j["dates"]] == ["2026-10-08", "2026-10-09", "2026-10-12"]
    assert all(r["bankid"] == "0122" for r in j["rows"])                   # calc field '0' + BANKID
    assert not any(r["active"] == 0 and r["passive"] == 0 for r in j["rows"])   # Delete ... Active=0 And Passive=0
    keys = [(r["presentdate"], r["balance"]) for r in j["rows"]]
    assert keys == sorted(keys)                                             # Order By PresentDate,Balance
    assert j["sum_active"] == pytest.approx(sum(r["active"] for r in j["rows"]))
    assert {r["shortname"] for r in j["rows"] if r["currency"] == 0} == {"AZM"}


def test_execute_range_and_plan():
    c = cl()
    j = post(c, U + "/execute", beg="2026-10-09", end="2026-10-09", plan=1).json()
    assert [d[:10] for d in j["dates"]] == ["2026-10-09"]
    assert post(c, U + "/execute", beg="2026-10-01", end="2026-10-12", plan=2).json()["rows"] == []


def test_refresh_filters():
    c = cl(); post(c, U + "/execute", **RUN)
    j = post(c, U + "/refresh", date="2026-10-09", currency=1).json()
    assert {(r["presentdate"], r["currency"]) for r in j["rows"]} == {("2026-10-09", 1)}
    assert j["sum_passive"] == pytest.approx(sum(r["passive"] for r in j["rows"]))
    j2 = post(c, U + "/refresh", currency=0).json()
    assert {r["currency"] for r in j2["rows"]} == {0} and len({r["presentdate"] for r in j2["rows"]}) == 3
    assert len(post(c, U + "/refresh").json()["rows"]) == len(post(c, U + "/execute", **RUN).json()["rows"])


def test_capital_is_floattostr():
    c = cl()
    assert post(c, U + "/capital", date="2026-10-09").json()["capital"] == "51904500,5"
    assert post(c, U + "/capital", date="2026-10-12").json()["capital"] == "52010000"
    assert post(c, U + "/capital", date="2026-01-01").json()["capital"] == "0"


def test_file_not_active_copies_template_only():
    r = post(cl(), U + "/file", filename="D:\\out\\B.dbf", active=False)
    assert DBF.read(r.content) == [] and 'filename="B.dbf"' in r.headers["content-disposition"]


def test_file_records():
    c = cl(); rows = post(c, U + "/execute", **RUN).json()["rows"]
    pr = post(c, U + "/file/prepare").json()["dates"]
    assert [d["capital"] for d in pr] == ["51830000,25", "51904500,5", "52010000"]
    r = post(c, U + "/file", active=True, capitals=["100", "200,5", "300"])
    recs = DBF.read(r.content)
    assert len(recs) == len(rows) + 2 * 3
    first = recs[0]
    assert first["BANK_CODE"] == "012" and first["TARIX"] == "20261008" and first["VALUTE"] == "AZM" and first["BALANS"] == "1001"
    azm, usd = recs[len(rows)], recs[len(rows) + 1]
    assert (azm["VALUTE"], azm["BALANS"], azm["ACTIVES"], azm["PASSIVES"], azm["POUL"]) == ("AZM", "9601", "42500.00", "100.00", "1.0000")
    assert (usd["VALUTE"], usd["ACTIVES"], usd["PASSIVES"], usd["POUL"]) == ("USD", "25000.00", "0.00", "1.7000")
    assert recs[len(rows) + 2]["PASSIVES"] == "200.50"


def test_file_bad_capital_and_missing_template(monkeypatch, tmp_path):
    c = cl(); post(c, U + "/execute", **RUN)
    d = post(c, U + "/file", 400, active=True, capitals=["abc", "1", "2"]).json()["detail"]
    assert d["key"] == "cp.err_file" and "is not a valid floating point value" in d["msg"]
    monkeypatch.setenv("DBF_TEMPLATE_DIR", str(tmp_path))
    assert post(c, U + "/file", 400, active=True).json()["detail"]["key"] == "cp.err_copy"


def test_file_record_formatting_helpers():
    assert CP.fixed2(1234.5) == "1234,50" or DBF.DECIMAL_SEPARATOR != ","
    with pytest.raises(ValueError):
        CP.fixed2(None)


def test_checking_datachecking():
    c = cl(); post(c, U + "/execute", **RUN)
    rows = post(c, U + "/checking/create", date="2026-10-09").json()["rows"]
    usd = next(r for r in rows if r["currency"] == 1)
    raw = post(c, U + "/refresh", date="2026-10-09", currency=1).json()["rows"]
    act = round(sum(r["active"] for r in raw if r["incoming"] in (1, 3)))
    pas = round(sum(r["passive"] for r in raw if r["incoming"] in (2, 3)))
    assert usd["actives"] == act and usd["passives"] == pas + 25000         # + BankInfo.SVM on Currency=1
    assert usd["pok_passives"] == round(pas * 1.7) + round(25000 * 1.7) and usd["limit"] == 10
    assert {r["shortname"] for r in rows} == {"USD", "EUR", "RUR"}
    assert post(c, U + "/checking/refresh").json()["rows"] == rows


def test_checking_needs_usd_rate():
    c = cl(); post(c, U + "/execute", **RUN)
    assert c.post(U + "/checking/create", json={"date": "2026-10-10"}).status_code >= 400   # ORA-01403 (no OperKurs VAL_KOD=1)


def test_tuning_read_and_save_commits():
    c = cl()
    row = c.get(U + "/tuning").json()["row"]
    assert row["bank"] == "SmartBank ASC" and row["svm"] == 25000 and row["rowid"]
    post(c, U + "/tuning/save", rowid=row["rowid"], values={"CAPITAL": "53000000,5", "BANK": "X"})
    r2 = c.get(U + "/tuning").json()["row"]
    assert r2["capital"] == 53000000.5 and r2["bank"] == "X" and r2["svm"] == 25000
    assert post(c, U + "/tuning/save", 400, rowid=row["rowid"], values={"SVM": "1.2.3"}).json()["detail"]["key"] == "cp.err_float"
    assert Q.sql_tuning_update(["CAPITAL"]) == "update BankInfo set CAPITAL = :CAPITAL where rowid = :ROWID_"


def test_user_name_guard():
    class C:
        def call_func(self, *a):
            return "x'; drop"
    with pytest.raises(ValueError):
        CP.user_name(C())


def test_module_rights_required():
    c = TestClient(main.app)
    assert c.get(U + "/init").status_code == 401
