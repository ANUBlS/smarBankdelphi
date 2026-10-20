"""DepositsManager_New main form - api/app/deposits.py (Packages/DepositsManager_New/DepositsManagerImpl_new.pas)."""
import io

import openpyxl
import pytest
from fastapi.testclient import TestClient
from app import main, sessions, deposits as dp, dep_sql as Q
from app.db import mock


@pytest.fixture(autouse=True)
def fresh():
    mock.reset(); sessions.attempts._f.clear(); sessions.store._s.clear(); yield


def cl(u="ADMIN", p="Admin#2026"):
    c = TestClient(main.app); assert c.post("/api/login", json={"username": u, "password": p}).status_code == 200; return c


def rows(c, **b):
    r = c.post("/api/deposits/list", json=b); assert r.status_code == 200, r.text; return r.json()["rows"]


def ids(c, **b):
    return [x["id"] for x in rows(c, **b)]


# ------------------------------------------------------------------ BuildFilterString (DepositsManagerImpl_new.pas:488-550)
def test_filter_string_empty_when_nothing_checked():
    assert dp.build_filter_string(dp.FilterIn()) == ""


def test_filter_string_currency_and_dates():
    s = dp.build_filter_string(dp.FilterIn(cb_currency=True, currency=944, cb_opendat=True, d1="2026-03-01", d2="2026-10-20"))
    assert s == "(CURRENCY=944) and (( opendate >=  '01.03.2026') and ( opendate <=  '20.10.2026'))"


def test_filter_string_crossed_category_person_and_status():
    s = dp.build_filter_string(dp.FilterIn(cb_persons=True, category=2, cb_clienttype=True, person=1, cb_status=True, status_index=1))
    assert s == "(clienttype=2) and (personaltype=1) and (Status = 0)"


def test_sql_is_verbatim_from_the_production_dm():
    assert "from sbcm_contracts_new cont," in Q.SQL_DEPOSITSDATA and Q.SQL_DEPOSITSDATA.endswith("order by :OrderField     \r\n  ")
    assert Q.SQL_DEPOSITTYPES == "select id,type\r\nfrom sbcm_deposit_Types_new"


def test_init_defaults_first_lookup_record_and_bank_date():
    i = cl().get("/api/deposits/init").json()
    assert i["defaults"]["currency"] == 944 and i["defaults"]["contracttype"] == 1
    assert i["defaults"]["d1"] == i["bank_date"] == i["defaults"]["d2"] == "2026-10-12"
    assert i["grid"] == dp.GRID and i["plugins"]["wreport"]["on_hold"]


def test_list_all_type3_contracts_order_by_cont_id():
    r = rows(cl())
    assert [x["id"] for x in r] == list(range(5001, 5009))               # 4990 is type# 4
    x = {y["id"]: y for y in r}
    assert x[5003]["facticaldebt"] == 48000 and x[5003]["interest"] == "10;10.5"     # sum over the two state rows
    assert x[5002]["ekamount"] == 4250 and x[5001]["contractaccno"] and x[5001]["customername"].startswith("Əliyev")


def test_filter_status_and_combo():
    assert ids(cl(), filtered=True, filter={"cb_status": True, "status_index": 1}) == [5002, 5004, 5008]
    f = {"cb_currency": True, "currency": 944, "cb_opendat": True, "d1": "2026-03-01", "d2": "2026-07-31"}
    assert ids(cl(), filtered=True, filter=f) == [5003, 5005, 5007]


def test_filtered_false_ignores_checkboxes():
    assert len(ids(cl(), filtered=False, filter={"cb_currency": True, "currency": 840})) == 8


def test_export_visible_fields_and_sheet():
    x = cl().post("/api/deposits/export.xlsx", json={})
    ws = openpyxl.load_workbook(io.BytesIO(x.content)).active
    assert ws.title == "Depozitlər" and ws.max_row == 9
    assert [c.value for c in ws[1]] == ["Müqavilənin №", "Hesabın №", "$", "Müştərinin adı", "Faiz Hesabın №", "Açılma tarixi",
                                        "Bağlanma tarixi", "Məbləğ", "Ekvivalent", "Faiz", "Cari Məbləğ", "Ekvivalent",
                                        "Cari Məbləğ üzrə %", "Ekvivalent", "Son Kapital/Ödəmə tarixi"]


def test_close_loops_over_selected_rows_and_does_not_commit():
    c = cl()
    r = c.post("/api/deposits/close", json={"ids": [5001, 5003]}).json()
    assert r == {"ok": True, "pending": True, "closed": 2}
    x = {y["id"]: y for y in rows(c)}
    assert x[5001]["facticaldebt"] == 0 and x[5003]["status"] == 0 and x[5005]["facticaldebt"] == 15000
    assert c.post("/api/deposits/close", json={"ids": []}).json()["closed"] == 0              # nothing marked: nothing closed
    assert "ORA-20101" in c.post("/api/deposits/close", json={"ids": [5001]}).json()["detail"]["ora"]


def test_calc_toggle():
    c = cl()
    assert c.get("/api/deposits/5001/calc").json() == {"enabled": True}
    c.post("/api/deposits/5001/calc", json={"enabled": True})
    assert c.get("/api/deposits/5001/calc").json() == {"enabled": False}
    assert ids(c, filtered=True, filter={"cb_status": True, "status_index": 1})[0] == 5001


def test_plugin_rights_and_not_migrated():
    c = cl()
    r = c.post("/api/deposits/plugin/contract_insert").json()
    assert r["bpl"] == "SBDM_Contract_new.bpl" and r["param"] == "InsertContract" and r["migrated"]
    assert not c.post("/api/deposits/plugin/capitalize").json()["migrated"]
    assert c.post("/api/deposits/plugin/rep_mis").json()["on_hold"] is True
    assert c.post("/api/deposits/plugin/nope").status_code == 404


def test_user_opens_module_but_is_denied_close_and_edit():
    c = cl("DEPOSITOR", "Depositor#2026")
    assert len(ids(c)) == 8
    assert c.post("/api/deposits/plugin/apply_money").status_code == 200                       # NEW_SBCM_TRANSH granted
    r = c.post("/api/deposits/plugin/contract_edit")
    assert r.status_code == 400 and "EDIT_SBCM_CONTRACT" in r.json()["detail"]["ora"]
    r = c.post("/api/deposits/right/SBCM_CLOSE_CONTRACT")
    assert r.status_code == 400 and "SBCM_CLOSE_CONTRACT" in r.json()["detail"]["ora"]
    assert c.post("/api/deposits/close", json={"ids": [5001]}).status_code == 400
    assert rows(c)[0]["facticaldebt"] == 10000
    assert c.post("/api/deposits/plugin/shedule").status_code == 200                            # N36Click: no right check


def test_module_denied_without_rights():
    assert cl("TELLER", "Teller#2026").get("/api/deposits/init").status_code == 403
