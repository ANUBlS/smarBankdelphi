import datetime as dt
from decimal import Decimal as D

import pytest
from fastapi.testclient import TestClient
from app import main, sessions, credits as cr, cr_logic as L
from app.db import mock


@pytest.fixture(autouse=True)
def fresh():
    mock.reset(); sessions.attempts._f.clear(); sessions.store._s.clear(); yield


def cl(u="TELLER", p="Teller#2026"):
    c = TestClient(main.app); assert c.post("/api/login", json={"username": u, "password": p}).status_code == 200; return c


# ------------------------------------------------------------------ Delphi runtime semantics
def test_inc_month_clamps_like_delphi():
    assert L.inc_month(dt.date(2026, 1, 31), 1) == dt.date(2026, 2, 28)
    assert L.inc_month(dt.date(2028, 1, 31), 1) == dt.date(2028, 2, 29)
    assert L.inc_month(dt.date(2026, 11, 30), 3) == dt.date(2027, 2, 28)


def test_months_beetwean_annutypaymentform():
    assert L.months_beetwean(dt.date(2026, 1, 15), dt.date(2027, 1, 15)) == 12
    assert L.months_beetwean(dt.date(2026, 1, 15), dt.date(2027, 1, 14)) == 11
    assert L.months_beetwean(dt.date(2026, 1, 15), dt.date(2026, 2, 10)) == 0     # starts at 1, then -1
    assert L.months_beetwean(dt.date(2026, 1, 31), dt.date(2026, 2, 28)) == 1     # IncMonth clamps


def test_period_rate_mapping():
    assert [L.period_rate(i) for i in range(5)] == [1, 3, 6, 12, 12]


def test_annuty_validate_dovr():
    L.annuty_validate(12, 12)
    with pytest.raises(L.CrError) as e:
        L.annuty_validate(12, 13)
    assert e.value.key == "credits.err_dovr"


def test_schedule_call_params_subtract_dovr():
    name, p = L.schedule_call(True, 7, 1000.0, 24.0, "f", "s", 12, 3, 2)
    assert name == "InsertAnnutySchedule" and p["p_Periods"] == 10 and p["p_dovr"] == 2 and p["p_PeriodRate"] == 3
    assert L.schedule_call(False, 7, 1, 1, "f", "s", 6, 1, 0)[0] == "InsertEqualSchedule"


def test_annuty_defaults_method2_amount_editable():
    c = {"INTCALCMETHOD": 2, "DATEOFCONCLUSION": dt.date(2026, 1, 31), "DUEDATEFIRSTCONTRACT": dt.date(2026, 7, 31),
         "CREDITLINEAMOUNT": 5000.12345}
    d = L.annuty_defaults(c)
    assert d["amount"] == 0 and not d["amount_readonly"] and d["first_pay_date"] == dt.date(2026, 2, 28) and d["n_periods"] == 6
    c["INTCALCMETHOD"] = 0
    assert L.annuty_defaults(c)["amount"] == D("5000.1234")      # Currency: 4 dp, banker's (…45 -> …4)


# ------------------------------------------------------------------ Oracle semantics (mock CM_SCHEDULE)
def test_oracle_add_months_last_day_rule():
    assert L.ora_add_months(dt.date(2026, 2, 28), 1) == dt.date(2026, 3, 31)
    assert L.ora_add_months(dt.date(2026, 1, 30), 1) == dt.date(2026, 2, 28)


def test_months_between_and_getperiod():
    assert L.ora_months_between(dt.date(2027, 1, 15), dt.date(2026, 1, 15)) == 12
    assert L.ora_months_between(dt.date(2026, 3, 31), dt.date(2026, 2, 28)) == 1
    assert L.cm_common_getperiod(dt.date(2026, 1, 1), dt.date(2026, 2, 20)) == 2     # 1.6129 -> 2 (INTEGER rounds)
    assert L.cm_common_getperiod(dt.date(2026, 1, 1), dt.date(2026, 2, 10)) == 1


def test_annuity_payment_formula_number_18_2():
    assert L.annutypayment_get(10000, 24, 12) == D("945.60")
    assert L.equalpartspayment_get(1000, 3) == D("333.33")


def test_bankdaysbetween_30_360():
    assert L.cm_utils_bankdaysbetween(dt.date(2026, 1, 15), dt.date(2026, 2, 15)) == 30   # Jan 31 -> -1
    assert L.cm_utils_bankdaysbetween(dt.date(2026, 2, 15), dt.date(2026, 3, 15)) == 30   # Feb 28 -> +2
    assert L.cm_utils_bankdaysbetween(dt.date(2026, 3, 1), dt.date(2026, 3, 1)) == 0
    assert L.cm_utils_bankdaysbetween(dt.date(2026, 1, 15), dt.date(2026, 2, 15), 365) == 31


def test_insert_annuty_schedule_totals_and_last_rest_zero():
    rows = L.insert_annuty_schedule(10000, 24, dt.date(2026, 11, 12), dt.date(2026, 10, 12), 12, 1, 10000)
    assert len(rows) == 12
    assert rows[0]["INTEREST"] == D("200") and rows[0]["PRINCIPAL"] == D("745.60") and rows[0]["REST"] == D("9254.40")
    assert rows[-1]["REST"] == 0
    assert abs(sum(r["PRINCIPAL"] for r in rows) - 10000) < D("0.10")   # last principal = remaining rest (unrounded)
    assert rows[10]["PAYMENTDATE"] == dt.date(2027, 9, 13)        # 12 Sep 2027 is a Sunday -> +1


def test_get_annutydate_skips_seldates():
    r0 = L.get_annutydate(dt.date(2026, 12, 10), "10", False, [], set())
    r1 = L.get_annutydate(dt.date(2026, 12, 10), "10", False, [], {r0})
    assert r1 > r0 and r1 not in {r0} and not L.is_sunday(r1)


def test_insert_equal_schedule():
    rows = L.insert_equal_schedule(1200, 12, dt.date(2026, 2, 1), dt.date(2026, 1, 1), 3, 1)
    assert [r["PRINCIPAL"] for r in rows] == [D("400.00")] * 3
    assert rows[1]["INTEREST"] == D(800) * 12 * 30 / 36000


# ------------------------------------------------------------------ form rules
def _rec(**kw):
    r = {k: 1 for k in L.CHECK_ORDER if not k.startswith(("@", "#"))}
    r.update(ACTIVITIES_TYPE=105, AIM_ID=1, PERSONALTYPE=1, PINCODE="5ZK2R7A", NUMBEROFCREDIT="X", BOORID="A",
             ADDRESS="B", SALARY="1")
    r.update(kw)
    return r


def test_check_fields_order_and_messages():
    with pytest.raises(L.CrError) as e:
        L.check_fields(_rec(ACTIVITIES_TYPE=None, CREDITACT=None), lambda p: False)
    assert e.value.key == "credits.err_estate_type"
    with pytest.raises(L.CrError) as e:
        L.check_fields(_rec(CREDITACT=None, CURRENCY=None), lambda p: False)
    assert e.value.kw["field"] == "CREDITACT"
    with pytest.raises(L.CrError) as e:
        L.check_fields(_rec(USRGROUP=None, AIM_ID=None), lambda p: False)
    assert e.value.kw["field"] == "USRGROUP"
    with pytest.raises(L.CrError) as e:
        L.check_fields(_rec(AIM_ID=None, CREDITLINEAMOUNT=None), lambda p: False)
    assert e.value.key == "credits.err_aim"


def test_check_fields_currency_zero_is_not_empty():
    L.check_fields(_rec(CURRENCY=0), lambda p: False)


def test_pin_rules_depend_on_checkperson():
    with pytest.raises(L.CrError) as e:
        L.check_fields(_rec(PINCODE="123456"), lambda p: False)
    assert e.value.key == "credits.err_pin"
    with pytest.raises(L.CrError) as e:
        L.check_fields(_rec(PINCODE="12345678"), lambda p: False)
    assert e.value.key == "credits.err_pin"        # message says 'at least 7' but the rule is <> 7
    L.check_fields(_rec(PINCODE=""), lambda p: True)   # legal entity: no PIN check


def test_pin_and_boorid_key_filters():
    assert L.pin_filter("5ZK-2r7 Oo0") == "5ZK2r70"
    assert L.boorid_filter("AZ-0 o") == "AZ-0 o"


def test_credit_type_and_usrgroup_rules():
    assert L.credit_type_rules(9) == {"show_payint_panel": True, "clear": False, "PAYPERIOD": 20}
    assert L.credit_type_rules(1)["clear"] and not L.credit_type_rules(None)["show_payint_panel"]
    assert L.usrgroup_rules(11)["show_aif"] and not L.usrgroup_rules("")["show_aif"]


def test_cust_accs_line14_and_replace():
    assert L.cust_accs_line14(541) == "and ac.kli_id in (541,502)"
    assert L.cust_accs_line14(7) == " and ac.kli_id=7"
    assert L.replace_sql_line("a\nb\nc", 1, "X") == "a\nX\nc"
    assert L.replace_sql_line("a", 2, "X") == "a\n\nX"


def test_cm_filter_string_exact():
    s = L.cm_filter_string({"CURRENCY": 840, "BRANCHID": 101, "TODAY_PAYMENTS": True})
    assert s == "(CURRENCY=840) and (BRANCHID=101) and (ID=select creditid from cm_payments where paydate=sbop.get_date)"
    assert L.cm_filter_string({}) == ""


def test_contract_params_insert_vs_edit():
    rec = {"CURRENCY": None, "PINCODE": None, "CREDITLINEAMOUNT": "1500.5", "DATEOFCONCLUSION": "2026-10-12"}
    p = cr.contract_params(rec, True)
    assert p["Currency"] == 0 and p["PINCODE"] == "" and p["CreditLineAmount"] == 1500.5 and p["insuranceid"] == 222
    assert p["DateOfConclusion"] == dt.datetime(2026, 10, 12) and "CreditID" not in p
    e = cr.contract_params(rec, False, 9)
    assert e["CreditID"] == 9 and e["insuranceid"] == 0 and list(e)[0] == "CreditID"
    assert list(p)[-2:] == ["aif", "komisya"] and len(p) == 73


# ------------------------------------------------------------------ coefficient / DECA
def test_coefficient_ratios_and_totals():
    rows = [{"NAME": "A", "PORTFEL": 100, "ODENILMELI": 50, "ODENILMISH": 40, "ARTIQ": 5, "GECES": 10, "GEC": 20},
            {"NAME": "B", "PORTFEL": 0, "ODENILMELI": 0, "ODENILMISH": 0, "ARTIQ": 0, "GECES": 0, "GEC": 0}]
    r = L.coefficient_main(rows)
    assert r["rows"][0]["r_geces"] == D("0.1") and r["rows"][0]["r_pay"] == D("0.7") and r["rows"][1]["r_gec"] is None
    assert r["total"]["portfel"] == 100 and r["total"]["r_gec"] == D("0.2")


def test_coefficient_additional_params():
    assert L.coefficient_additional_params([1, 2], [1, 2], [3], [3]) == ""
    assert L.coefficient_additional_params([1], [1, 2], [3], [3, 4]) == \
        " AND p.branchid in(1)\r\n AND p.CUSTOMERTYPE in(3)\r\n"


def test_deca_writer_groups():
    tags = [{"FIELDNAME": "A", "TAGFIRST": "<a>", "TAGLAST": "</a>", "TAGPREFIX": "<G>", "TAGSUFFIX": "", "FIELDGROUP": 2, "PARENTGROUP": 1},
            {"FIELDNAME": "B", "TAGFIRST": "<b>", "TAGLAST": "</b>", "TAGPREFIX": "", "TAGSUFFIX": "</G>", "FIELDGROUP": 2, "PARENTGROUP": 1},
            {"FIELDNAME": "Z", "TAGFIRST": "<z>", "TAGLAST": "</z>", "TAGPREFIX": "", "TAGSUFFIX": "", "FIELDGROUP": 0, "PARENTGROUP": -2}]
    w = L.DecaWriter(tags)
    assert w.write("A", "") == "<G>" and w.write("B", "x") == "</G>" and w.write("Z", "") == "<z></z>"
    w2 = L.DecaWriter(tags)
    assert w2.write("A", "1") + w2.write("B", "2") == "<G><a>1</a><b>2</b></G>"
    with pytest.raises(L.CrError):
        w2.write("NOPE", "1")


def test_deca_header_and_strdate():
    h = L.deca_file_begin("1", "B", dt.date(2026, 3, 5))
    assert h.startswith('<?xml version="1.0" encoding="UTF-8" ?> <CreditInfo>') and "<ReportingDate>05/03/2026<" in h
    assert L.deca_strdate(0, dt.date(2026, 1, 2), dt.date(2026, 2, 3)) == "and DATEOFCONCLUSION between  '02-JAN-2026' and '03-FEB-2026'"
    assert L.deca_strdate(None, dt.date(2026, 1, 2), dt.date(2026, 2, 3)) == " "


# ------------------------------------------------------------------ API (mock)
def test_list_order_whitelist_and_filter():
    c = cl()
    r = c.post("/api/credits/list", json={"order": "REST", "desc": True}).json()
    assert r["rows"][0]["id"] == 7002 and r["total"] == 8
    r = c.post("/api/credits/list", json={"order": "id; drop table x", "filter": {"CURRENCY": 840}}).json()
    assert [x["id"] for x in r["rows"]] == [7003, 7008] and r["filter"] == "(CURRENCY=840)"


def test_edit_rights_status1_requires_post():
    c = cl()
    assert c.get("/api/credits/card/7001?mode=edit").json()["detail"]["key"] == "credits.err_right"
    assert c.get("/api/credits/card/7003?mode=edit").status_code == 200
    a = cl("ADMIN", "Admin#2026")
    assert a.get("/api/credits/card/7001?mode=edit").status_code == 200


def test_plugin_access_denied():
    from app.db import mock_cr
    c = cl()
    mock_cr.load(main.settings.mock_fixtures if hasattr(main, "settings") else "fixtures")["user_plugins"]["TELLER"] = [13]
    assert c.get("/api/credits/card/7003?mode=edit").json()["detail"]["key"] == "credits.err_plugin"
    assert c.get("/api/credits/card/7003?mode=look").status_code == 200


def test_insert_validates_then_saves():
    c = cl()
    new = c.get("/api/credits/card/new").json()["rec"]
    assert new["CURRENCY"] == 0 and new["COUNTRYCODE"] == "AZE" and new["PAYINTDAY"] == 12
    r = c.post("/api/credits/card", json={"mode": "insert", "rec": new}).json()
    assert r["detail"]["key"] == "credits.err_estate_type"
    rec = dict(c.get("/api/credits/card/7001?mode=look").json()["rec"], NUMBEROFCREDIT="KR-NEW-1")
    r = c.post("/api/credits/card", json={"mode": "insert", "rec": rec})
    assert r.status_code == 200
    nid = r.json()["id"]
    lst = c.post("/api/credits/list", json={}).json()["rows"]
    assert any(x["id"] == nid and x["status"] == 2 for x in lst)
    dup = c.post("/api/credits/card", json={"mode": "insert", "rec": rec}).json()
    assert dup["detail"]["key"] == "error.oracle" and "ORA-00001" in dup["detail"]["ora"]


def test_approve_and_reject_rights():
    c = cl()
    assert c.post("/api/credits/card/7003/post", json={"approve": True}).status_code == 200      # status 2 + PLANPOST
    assert c.post("/api/credits/card/7006/post", json={"approve": True}).json()["detail"]["key"] == "credits.err_right_ink"
    assert c.post("/api/credits/card/7004/post", json={"approve": False}).json()["detail"]["key"] == "credits.err_right"
    st = {x["id"]: x["status"] for x in c.post("/api/credits/list", json={}).json()["rows"]}
    assert st[7003] == 1 and st[7004] == 2


def test_schedule_generate_rollback_and_save():
    c = cl()
    d = c.get("/api/credits/7001/schedule/annuty-defaults").json()
    assert d["n_periods"] == 12 and d["first_pay_date"] == "2026-04-12"
    b = {"first_pay_date": d["first_pay_date"], "amount": d["amount"], "n_periods": 12, "dovr": 13}
    assert c.post("/api/credits/7001/schedule/annuty", json=b).json()["detail"]["key"] == "credits.err_dovr"
    b["dovr"] = 0
    assert c.post("/api/credits/7001/schedule/annuty", json=b).status_code == 200
    assert len(c.get("/api/credits/7001/schedule").json()["rows"]) == 12
    c.post("/api/credits/7001/schedule/close")
    assert c.get("/api/credits/7001/schedule").json()["rows"] == []
    c.post("/api/credits/7001/schedule/annuty", json=b); c.post("/api/credits/7001/schedule/save")
    c.post("/api/credits/7001/schedule/close")
    rows = c.get("/api/credits/7001/schedule").json()["rows"]
    assert len(rows) == 12 and rows[-1]["rest"] == 0
    c.post("/api/credits/7001/schedule/delete", json={"rowids": [rows[0]["rowid"], "bogus"]})
    assert len(c.get("/api/credits/7001/schedule").json()["rows"]) == 11


def test_coefficient_endpoint_logs_failing_credit_and_xlsx():
    c = cl()
    b = {"kind": "interest", "date": "2026-10-12", "branches": [101, 102], "categories": [11, 12, 21]}
    r = c.post("/api/credits/reports/coefficient", json=b).json()
    assert r["errors"] == [{"id": 7006, "message": "ORA-01476: divisor is equal to zero"}] and len(r["rows"]) == 2
    assert c.post("/api/credits/reports/coefficient", json=dict(b, branches=[])).json()["detail"]["key"] == "credits.err_coef_branch"
    x = c.post("/api/credits/reports/coefficient.xlsx", json=dict(b, kind="main"))
    assert x.status_code == 200 and x.content[:2] == b"PK"
    import io, openpyxl
    ws = openpyxl.load_workbook(io.BytesIO(x.content)).active
    assert ws["A9"].value == "Yekun cem" and ws["C9"].value == "=SUM(C7:C8)" and ws["K7"].value == "=(E7-F7)/D7"


def test_deca_export_binds_number():
    c = cl()
    b = {"rep_date": "2026-10-12", "hdate": "2026-10-12", "edate": "2026-10-12", "bank_id": "1", "bank_name": "SB",
         "number": "KR-2026/101' or '1'='1"}
    assert c.post("/api/credits/reports/deca.xml", json=b).json()["detail"]["key"] == "credits.err_deca_empty"
    b["number"] = "KR-2026/101"
    x = c.post("/api/credits/reports/deca.xml", json=b)
    assert x.headers["x-exported"] == "1" and x.text.endswith("</Credits></CreditInfo>")


def test_module_requires_right():
    c = cl("ADMIN", "Admin#2026")
    assert c.get("/api/credits/init").status_code == 200


def test_deca_sql_line_indices_match_delphi_tstrings():
    from app import cr_sql as Q
    L_ = Q.SQL_DECA_DECADATA_CLOS.split("\n")
    assert "DATEOFCONCLUSION<=:HDATE" in L_[76] and "P.ID = B.CUSTOMERTYPE" in L_[77]
    assert Q.SQL_CUST_ACCS.split("\n")[14] == ""
