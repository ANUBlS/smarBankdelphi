"""Packages/Cards_New/cards_azericard_turan_version (CARDS, TMAINFORM) step 1 - the card-holder list (customers.pas Tclients).
Expected values traced by hand from customers.pas / Unit18.dfm and fixtures/cards.json."""
import datetime

from fastapi.testclient import TestClient

from app.main import app
from app.db import mock as mock_db
from app import cards as C
from app import cards_sql as Q
from app import tdataset_filter as TF

client = TestClient(app)
B = "/api/cards"


def login(u="ADMIN", p="Admin#2026"):
    mock_db.reset()
    assert client.post("/api/login", json={"username": u, "password": p}).status_code == 200


def P(path, body=None, code=200):
    r = client.post(B + path, json=body or {})
    assert r.status_code == code, r.text
    return r.json()


def test_sql_verbatim_lines():
    assert Q.LINES_CLIENTS[0] == "SELECT   s.ROWID," and Q.LINES_CLIENTS[19] == "where s.accid=b.id"
    assert len(Q.LINES_CLIENTS) == 21                                           # cards_azericard: no SQL[25] line
    assert Q.LINES_CLIEXCEL[19] == "and s.multiacc is null order by s.rbsnumber"
    assert Q.LINES_SETTINGS == ["select s.rowid, s.* from card_settings s"]
    assert Q.SOURCES["ClientListSource"] == "Clients"


def test_open_admin_all_filials():
    login()
    r = P("/clients/open")
    assert r["count"] == 5 and r["dateclose"] == 30
    a = {x["id"]: x for x in r["rows"]}
    assert a[1]["fil"] == "Baş ofis" and a[3]["fil"] == "Nərimanov filialı" and a[1]["creat"] == "ADMIN" and a[2]["modi"] == "TELLER"
    assert a[1]["cardnumber"] == "4169730000001111" and a[1]["old_acc_no"] == "38110000000001"
    assert r["lookups"]["cardstatus"] == ["ACTIVE", "BLOCKED", "NEW"] and r["lookups"]["company"] == ["TURANBANK", "AZERSUN"]
    assert r["hidden"] == [] and "VERI" not in r["cols"] and r["cols"][2] == "MULTIACC"


def test_open_teller_sees_all_filials():
    """cards_azericard FormActivate has no CARD_FIL_VIEW branch (Turan-only): every user gets all rows."""
    login("TELLER", "Teller#2026")
    r = P("/clients/open")
    assert sorted(x["id"] for x in r["rows"]) == [1, 2, 3, 4, 5]


def test_excel_export_cliexcel():
    import io
    from openpyxl import load_workbook
    login(); P("/clients/open")
    P("/clients/edit-filter", {"field": "FNAME", "text": "R"})               # Panel4 filter does not reach cliexcel
    r = client.post(B + "/clients/excel")
    assert r.status_code == 200
    sh = load_workbook(io.BytesIO(r.content)).active
    assert [c.value for c in sh[1]][:4] == [" #", "RBSNUMBER", "CARDHOLDER", "CARDNUMBER"] and sh.max_column == 28
    assert sh["A1"].font.bold
    rbs = [sh.cell(i, 2).value for i in range(2, sh.max_row + 1)]
    # multiacc row (id 2) left out; Oracle puts the NULL RBSNUMBER last, the SQLite mock first - compare without it
    assert [x for x in rbs if x] == ["38110019440000000001", "38110019440000000004", "38110019840000000003"] and len(rbs) == 4
    P("/clients/filter", {"checks": [False, False, True, False, False, False], "d1": "2023-01-01", "d2": "2027-12-31", "valuta": "USD"})
    sh = load_workbook(io.BytesIO(client.post(B + "/clients/excel").content)).active
    assert all(sh.cell(i, 7).value == "USD" for i in range(2, sh.max_row + 1))


def test_open_needs_card_clients():
    login("ACCOUNTANT", "Accountant#2026")
    r = client.post(B + "/clients/open")
    assert r.status_code in (403, 400)


def test_edit_filter_prefix_case_sensitive():
    login(); P("/clients/open")
    r = P("/clients/edit-filter", {"field": "FNAME", "text": "R"})
    assert r["filter"] == "FNAME = 'R*'" and [x["id"] for x in r["rows"]] == [3]
    assert P("/clients/edit-filter", {"field": "FNAME", "text": "r"})["count"] == 0          # FilterOptions = []
    r = P("/clients/edit-filter", {"field": "CARDNUMBER", "text": "5239"})                  # replaces the FNAME filter
    assert sorted(x["id"] for x in r["rows"]) == [4, 5]
    r = P("/clients/edit-filter", {"field": "CREDIT_LIM", "text": "5"})                     # numeric field vs '5*'
    assert r["filter_error"] and r["count"] == 0
    P("/clients/edit-filter", {"field": "PASSPORT", "text": "x"}, 400)


def test_refresh_hides_null_rbs():
    login(); P("/clients/open")
    r = P("/clients/refresh")
    assert r["filter"] == "RBSNUMBER = '*'" and sorted(x["id"] for x in r["rows"]) == [1, 2, 3, 4]


def test_panel_filter_combinations():
    assert C.panel5_filter([False, False, True, False, True, False], "", "", "", "AZN", "", "ACTIVE", "") == \
        "(CURRENCY = 'AZN') and (CARDSTATUS = 'ACTIVE')"
    # 1+3+5: Delphi's table has no f3 for this set - the status condition is dropped (kept)
    assert C.panel5_filter([True, False, True, False, True, False], "01.01.2024", "31.12.2027", "", "AZN", "", "ACTIVE", "") == \
        "(DATEOPEN >= '01.01.2024') and (EXPIRY <= '31.12.2027') and (CURRENCY = 'AZN')"
    login(); P("/clients/open")
    r = P("/clients/filter", {"checks": [True, False, False, False, False, True], "d1": "2023-01-01", "d2": "2027-12-31",
                              "company": "TURANBANK"})
    assert r["filter"] == "(DATEOPEN >= '01.01.2023') and (EXPIRY <= '31.12.2027') and (COMPANY = 'TURANBANK')"
    assert [x["id"] for x in r["rows"]] == [1]


def test_sort_toggle_and_delete():
    login(); P("/clients/open")
    assert [x["id"] for x in P("/clients/sort", {"field": "LNAME"})["rows"]] == [2, 3, 1, 4, 5]
    assert [x["id"] for x in P("/clients/sort", {"field": "LNAME"})["rows"]] == [5, 4, 1, 3, 2]
    assert P("/clients/sort", {"field": "ROWID"})["count"] == 5                              # not a grid column: no change
    r = P("/clients/delete", {"id": 2, "confirmed": False})
    assert r["count"] == 5
    r = P("/clients/delete", {"id": 2, "confirmed": True})
    assert sorted(x["id"] for x in r["rows"]) == [1, 3, 4, 5]


def test_filter_parser():
    rows = [{"A": "abc", "D": datetime.datetime(2025, 1, 1), "N": None}]
    assert TF.apply(rows, "A = 'ab*'", {"A", "D", "N"}) == rows
    assert TF.apply(rows, "(D >= '01.01.2025') and (A <> 'x')", {"A", "D", "N"}) == rows
    assert TF.apply(rows, "N = '*'", {"A", "D", "N"}) == []
    try:
        TF.apply(rows, "A = 'x", {"A"}); assert False
    except TF.FilterError:
        pass


def test_form_new_defaults():
    login(); P("/clients/open")
    r = P("/clients/form", {"mode": "NEW"})
    f = r["fields"]
    assert r["enabled"] and not r["button3"] and r["apptype"][0] == " " and "Suppl.Card" in r["apptype"]
    assert f["ComboBox12"] == "CARD OK" and f["ComboBox4"] == "RESIDENT" and f["Edit28"] == "0" and f["Edit19"] == "BAKU"
    assert f["Edit20"] == f["Edit21"] == "AZE" and f["ComboBox5"] == "WITH" and f["Edit15"] == ""
    assert "VISA CLASSIC" in r["cardtypes"]


def test_form_edit_loads_by_multi_acc():
    login(); P("/clients/open")
    r = P("/clients/form", {"mode": "EDIT", "id": 1})
    f = r["fields"]
    assert not r["enabled"] and r["button3"] and f["Edit15"] == "Elchin" and f["Edit24"] == "4169730000001111"
    assert f["DBLookupComboBox6"] == "38110019440000000001" and r["accounts"] == ["38110019440000000001"]
    assert f["Edit14"] == "501" and f["Edit29"] == "AZN" and f["DBEdit17"] == "1250.5" and f["Edit25"] == "ANA"
    assert [c["id"] for c in r["cards"]] == [1] and "tip" in r["cards"][0] and not r["multicard"]
    assert [o["emeliyyat"] for o in r["operations"]] == ["PROLONGATION"]                  # MESSTYPE<>1, status in (1,4)
    assert [c["numberofcredit"] for c in r["credits"]] == ["KR-2025-071"]
    r = P("/clients/form", {"mode": "EDIT", "id": 3})                                     # multi_acc NULL -> all empty
    assert r["cards"] == [] and r["fields"]["Edit14"] == "0" and r["fields"]["DBLookupComboBox6"] == ""
    P("/clients/form", {"mode": "EDIT", "id": 999}, 404)


def test_form_rights():
    login("TELLER", "Teller#2026"); P("/clients/open")
    assert client.post(B + "/clients/form", json={"mode": "NEW"}).status_code in (400, 403)


# ---------------------------------------------------------------- step 2b: Tclients2 actions
from app.db import mock_cards as MC


def _apps():
    return [dict(zip(["MESSTYPE", "RBSNUMBER", "CARDNUMBER", "REFERENCE", "WITHP", "CREDIT_LIM", "URG"], r)) for r in MC._db().execute(
        "select messtype, rbsnumber, cardnumber, reference, withp, credit_lim, urg from card_client_app order by id").fetchall()]


def _new_form():
    login(); P("/clients/open"); r = P("/clients/form", {"mode": "NEW"})
    return dict(r["fields"])


def test_new_required_and_account_fill():
    MC.reset()
    f = _new_form()
    r = P("/clients/form/save", {"fields": f})
    assert [m["key"] for m in r["messages"]] == ["required"] and not r["close"]
    r = P("/clients/form/edit14", {"edit14": "501"})
    assert r["accounts"] == ["38110018400000000101", "38110019440000000001", "38110019780000000102"] and r["fields"]["Edit_acc_name"] == "Mammadov Elchin"
    r = P("/clients/form/account", {"acc": "38110019440000000001", "edit14": "501"})
    g = r["fields"]
    assert g["Edit14"] == "501" and g["Edit15"] == "Elchin" and g["Edit18"] == "AZE C1234567" and g["Edit27"] == "0501234567"
    assert g["DateTimePicker7"] == "1985-04-12" and g["Edit33"] == "1250.5" and r["dbedit18"] == "AZN"
    assert P("/clients/form/edit14", {"edit14": "x1"})["error"] == "'x1' is not a valid integer value"


def test_new_save_paths():
    MC.reset()
    f = _new_form()
    P("/clients/form/edit14", {"edit14": "501"})
    f.update(P("/clients/form/account", {"acc": "38110019440000000001", "edit14": "501"})["fields"])
    f.update(DBLookupComboBox6="38110019440000000001", ComboBox1="VISA GOLD", Edit23="MAMMADOV ELCHIN", Edit25="ANA")
    r = P("/clients/form/save", {"fields": f})
    assert [m["key"] for m in r["messages"]] == ["currency_bad"]                     # VISA GOLD is USD, the account AZN
    f["ComboBox1"] = "VISA CLASSIC"
    r = P("/clients/form/save", {"fields": f})
    assert [m["key"] for m in r["messages"]] == ["expiry_bad"]                       # DateTimePicker8 = Date, not > Date
    f["DateTimePicker8"] = (datetime.date.today() + datetime.timedelta(days=1000)).isoformat()
    f["Edit23"] = "X" * 21
    assert [m["key"] for m in P("/clients/form/save", {"fields": f})["messages"]] == ["emboss_long"]
    f["Edit23"] = "MAMMADOV ELCHIN"
    n = len(_apps())
    r = P("/clients/form/save", {"fields": f, "checkbox2": True})
    assert [m["key"] for m in r["messages"]] == ["added"] and r["close"] and r["fields"]["Edit26"] == "700003"
    a = _apps()[n:]
    assert a == [dict(MESSTYPE=1, RBSNUMBER="38110019440000000001", CARDNUMBER=None, REFERENCE="700003", WITHP=None, CREDIT_LIM="0", URG=1)]
    r = P("/clients/form/save", {"fields": f, "checkbox4": True})
    assert r["multicurrency"] == {"Edit3": "38110019440000000001", "Edit4": "new"} and r["messages"] == []


def _edit_form(rid=1):
    login(); P("/clients/open"); r = P("/clients/form", {"mode": "EDIT", "id": rid})
    f = dict(r["fields"])
    f.update(P("/clients/form/edit", {"card_id": rid})["fields"])
    return f


def test_edit_branches():
    MC.reset()
    f = _edit_form()
    assert f["ComboBox5"] == "WITH" and f["Edit24"] == "4169730000001111"
    assert P("/clients/form/save", {"fields": f, "combobox9": ""})["messages"] == []            # ComboBox9.Text = ''
    r = P("/clients/form/apptype", {"text": "Credit Limit", "dtp8": f["DateTimePicker8"]})
    assert r["enabled"]["Edit28"] is True and r["enabled"]["ComboBox5"] is False
    n = len(_apps())
    f["Edit28"] = "500"
    r = P("/clients/form/save", {"fields": f, "combobox9": "Credit Limit"})
    assert [m["key"] for m in r["messages"]] == ["credit_diff", "saved"] and r["edit28_red"] and r["fields"]["ComboBox9"] == ""
    assert _apps()[n:] == [dict(MESSTYPE=5, RBSNUMBER="38110019440000000001", CARDNUMBER=4169730000001111, REFERENCE=None, WITHP=None,
                                CREDIT_LIM="500", URG=0)] or _apps()[n]["MESSTYPE"] == 5
    P("/clients/form/apptype", {"text": "Security Word Change"})
    P("/clients/form/save", {"fields": f, "combobox9": "x"})
    assert _apps()[-1]["CREDIT_LIM"] == "50000"                                               # floattostr(strtofloat*100)
    f["Edit28"] = ""
    assert P("/clients/form/save", {"fields": f, "combobox9": "x"})["error"] == "'' is not a valid floating point value"
    # prolongation: confirm first, then DateTimePicker8 must be > DateTimePicker1 (= DateTimePicker8 at the ComboBox9 click)
    P("/clients/form/apptype", {"text": "Prolongation", "dtp8": "2027-01-01"})
    f["DateTimePicker8"] = "2027-01-01"
    r = P("/clients/form/save", {"fields": f, "combobox9": "Prolongation"})
    assert r["confirm"]["key"] == "prolong_q" and r["confirm"]["args"]["date"] == "01.01.2027" and r["messages"] == []
    assert [m["key"] for m in P("/clients/form/save", {"fields": f, "combobox9": "P", "confirmed": True})["messages"]] == ["date_bad"]
    f["DateTimePicker8"] = "2029-01-01"
    n = len(_apps())
    assert [m["key"] for m in P("/clients/form/save", {"fields": f, "combobox9": "P", "confirmed": True})["messages"]] == ["saved"]
    assert _apps()[n]["MESSTYPE"] == 3 and _apps()[n]["WITHP"] == "0003"


def test_edit_rbs_change_and_rights():
    MC.reset()
    f = _edit_form()
    r = P("/clients/form/apptype", {"text": "RBS Change", "edit14": f["Edit14"]})
    assert r["accounts"] == ["38110018400000000101", "38110019440000000001", "38110019780000000102"] and r["fields"]["DBLookupComboBox6"] == "" and r["enabled"]["DBLookupComboBox6"]
    login("TELLER", "Teller#2026"); P("/clients/open")
    assert client.post(B + "/clients/form/save", json={"fields": {}}).status_code in (400, 403, 409)
    assert client.post(B + "/clients/form/save", json={"fields": {"Bogus": "1"}}).status_code in (400, 403)


# ---------------------------------------------------------------------------------------------------- step 2c
def test_grid5_click_fills_and_disables():
    login(); P("/clients/open"); P("/clients/form", {"mode": "EDIT", "id": 1})
    r = P("/clients/form/card-click", {"card_id": 1})
    f = r["fields"]
    assert f["Edit15"] == "Elchin" and f["Edit24"] == "4169730000001111" and "Edit28" not in f      # Edit28 line commented out
    assert f["DateTimePicker6"] == f["DateTimePicker8"] and f["DateTimePicker5"] != "1899-12-30"
    assert r["enabled"]["ComboBox9"] is False and r["enabled"]["ComboBox5"] is False and all(v is False for v in r["enabled"].values())
    P("/clients/form/card-click", {"card_id": 999}, 409)


def test_credit_info_krinfo():
    login(); P("/clients/open"); P("/clients/form", {"mode": "EDIT", "id": 1})
    r = P("/clients/form/credit-info", {"id": 71})
    assert r["rows"][0]["numberofcredit"] == "KR-2025-071" and r["columns"][0] == "NUMBEROFCREDIT" and len(r["columns"]) == 26
    P("/clients/form/credit-info", {"id": 72}, 409)                          # not a row of allclientcredits


def test_delete_application_sil():
    login(); P("/clients/open"); r = P("/clients/form", {"mode": "EDIT", "id": 1})
    oid = r["operations"][0]["id"]
    out = P("/clients/form/delete-application", {"id": oid})
    assert out["operations"] == []
    P("/clients/form/delete-application", {"id": oid}, 409)


def test_combo_enter_quirks():
    login(); P("/clients/open"); r = P("/clients/form", {"mode": "NEW"})
    ct = r["cardtypes"]
    a = P("/clients/form/combo-enter", {"combo": "ComboBox1", "items": ct, "item_index": 0})
    assert a["items"] == ct and a["item_index"] == -1 and a["combobox9_add"] == 1        # cleared, then appended once
    b = P("/clients/form/combo-enter", {"combo": "ComboBox1", "items": ct, "item_index": 1})
    assert b["items"] == ct + ct                                                       # appended again (Delphi duplicates)
    c = P("/clients/form/combo-enter", {"combo": "ComboBox2", "items": ["x"], "item_index": 2})
    assert c["items"] == [" ", "TURANBANK", "AZERSUN"]
    P("/clients/form/combo-enter", {"combo": "ComboBox3"}, 400)


def test_multicurrency_new():
    MC.reset()
    f = _new_form()
    P("/clients/form/edit14", {"edit14": "501"})
    f.update(P("/clients/form/account", {"acc": "38110019440000000001", "edit14": "501"})["fields"])
    f.update(DBLookupComboBox6="38110019440000000001", ComboBox1="VISA CLASSIC", Edit23="MAMMADOV ELCHIN", Edit25="ANA",
             Edit14="501", DateTimePicker8=(datetime.date.today() + datetime.timedelta(days=900)).isoformat())
    P("/clients/form/multi/open", {}, 409)                                      # nothing pending
    r = P("/clients/form/save", {"fields": f, "checkbox4": True})
    assert r["multicurrency"]["Edit4"] == "new"
    o = P("/clients/form/multi/open")
    assert [a["acc"] for a in o["accounts"]] == ["38110018400000000101", "38110019440000000001", "38110019780000000102"]
    n = len(_apps())
    m = P("/clients/form/multi/save", {"multi1": True, "multi2": True, "acc1": "38110018400000000101", "acc2": "38110019780000000102"})
    assert [x["key"] for x in m["messages"]] == ["multi_added"] and m["edit1"] == "USD" and m["edit2"] == "EUR"
    new = _apps()[n:]
    assert [x["RBSNUMBER"] for x in new] == ["38110019780000000102", "38110018400000000101"]        # multi2 first, then multi1
    P("/clients/form/multi/save", {"multi1": True}, 409)                        # consumed
