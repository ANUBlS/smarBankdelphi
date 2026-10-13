"""AZIPS part 2 - OUT_FORM (Yeni) creation, MT103 / MT103AZN editors, MT103Show (Packages/SWIFT_MANAGER_IBAN_NEW)."""
import datetime
from fastapi.testclient import TestClient
from app.main import app
from app.db import mock as mock_db
from app.db import mock_azips
from app import azips_edit as E
from app import azips_sql as Q

client = TestClient(app)
B = "/api/azips"


def login(u="ADMIN", p="Admin#2026"):
    mock_db.reset()
    assert client.post("/api/login", json={"username": u, "password": p}).status_code == 200


def rows():
    return {r["ID"]: r for r in mock_azips._load()["sw_out_new"]}


def test_sql_verbatim():
    assert Q.LINES_COMBOITEMS[0] == "select * from sw_fields where sw_main_field=:comboname and category<>'00' "
    assert Q.LINES_REFERANS == ["select sw_main.Set_Referense(:FORMATS,:currensy) as refe from dual "]
    assert Q.LINES_BANKS[-1] == "city='BAKU'" and Q.LINES_BANKS[3] == "where "
    assert Q.LINES_ACCS_FOR_COMISSION == ["select id,acc_no from account -- SBA_ACCOUNT", "where kli_id=:v_acc_no"]
    assert Q.text(Q.LINES_COMBOITEMS, i1="and MT103AZN is not null order by sw_field").split("\r\n")[1] == \
        "and MT103AZN is not null order by sw_field"


def test_text_rules():
    assert E.rich70("A" * 40 + "\r\nB") == "A" * 35 + "\r\n" + "A" * 5 + "B\r\n"
    assert E.rich70("x" * 200).count("\r\n") == 4                        # 4 lines max, rest dropped
    t = E.rich72("/BNF/" + "Q" * 40)
    assert t == "/BNF/" + "Q" * 30 + "\r\n//" + "Q" * 10 + "\r\n"
    assert E.rich72(t) == t                                               # idempotent like the OnChange loop
    assert E.memo35("abc\n" + "d" * 50 + "\n1\n2\n3") == "ABC\r\n" + "D" * 35 + "\r\n1\r\n2"
    assert E.amount_ok("12.5") and not E.amount_ok("1,5") and not E.amount_ok("-1")
    assert E.date_to_str(datetime.date(2026, 10, 3)) == "03.10.2026"
    assert E.delphi_trim("\r\n x \t") == "x"


def test_init_and_combos():
    login()
    r = client.get(B + "/new/init").json()
    assert r["senderlt"] == "SMRTAZ22" and r["fincopy"] == "AZN" and r["mf32a_val"] == "AZN" and r["fin"] == "MT103"
    assert r["MF23b_edit"] == "CRED" and r["MF71A"] == ["OUR", "BEN", "SHA"] and "AZN" not in r["valutes"]
    it = client.post(B + "/new/combo", json={"fin": "MT103", "fincopy": "AZN", "combo": "CMF50"}).json()["items"]
    assert it == ["", "K-Ordering Customer-Name $ Address"]                # SQL[1] 'and MT103AZN is not null'
    it = client.post(B + "/new/combo", json={"fin": "MT103", "fincopy": "", "combo": "CMF50"}).json()["items"]
    assert len(it) == 4 and it[0] == ""
    p = client.post(B + "/new/panels", json={"fin": "MT103", "combo": "CMF59", "selected": "Field - 59A"}).json()
    assert p == {"hide": ["MF59"], "show": ["MF59A"]}
    bad = client.post(B + "/new/combo", json={"fin": "MT103 or 1=1", "fincopy": "", "combo": "CMF50"})
    assert bad.status_code in (400, 422)


def test_lookups():
    login()
    assert client.get(B + "/bank/IBAZAZ2X").json()["bank"]["NAME"] == "INTERNATIONAL BANK OF AZERBAIJAN"
    assert client.get(B + "/bank/DEUTDEFF").json()["bank"] is None          # banks: city='BAKU' only
    assert client.post(B + "/corr", json={"v": "USD", "b": "IBAZAZ2X"}).json()["CORACOUNT"] == "0137010023840"
    a = client.get(B + "/account/AZ41SMRT00000000000000001944").json()
    assert a["found"] and a["accs"][0]["acc_no"] == "AZ41SMRT00000000000000001944"


def _new(**k):
    m = {"fin": "MT103", "fincopy": "AZN", "reciverbic": "AIIBAZ2X", "Edit2": "AZER TURK BANK", "Edit3": "BAKU",
         "mf32_date": "2026-10-13", "mf32a_val": "AZN", "Edit11_mf32a": "250.75", "combos": {"CMF50": 1, "CMF59": 1},
         "combo_text": {"CMF50": "K-Ordering Customer-Name $ Address", "CMF59": "Field - 59"},
         "fields": {"Edit3_MF50": "AZ41SMRT00000000000000001944", "Memo2_MF50": "SMART LLC\r\n1234567890",
                    "Edit1_MF59": "AZ12AIIB00000000000000000001", "Memo2_MF59": "ALI ALIYEV"},
         "OF70_RichEdit": "SALARY", "Edit1_MF71A": "OUR"}
    m.update(k)
    return m


def test_create_mt103_savetransaction_args():
    login()
    r = client.post(B + "/new/create", json=_new()).json()
    assert r["ok"] and r["reference"].startswith("OUT")
    new = max(rows().values(), key=lambda x: x["ID"])
    key, a = new["_CALL"]
    assert key == "SW_MAIN.SAVETRANSACTION" and len(a) == 20
    assert a[0] == "13.10.2026" and a[1] == r["reference"] and a[2] == "AZ41SMRT00000000000000001944"
    assert a[3] == a[16] == "AIIBAZ2X" and a[4] == "AZER TURK BANK" and a[15] == "BAKU"
    assert a[5] == "AZ12AIIB00000000000000000001" and a[6] == a[14] == a[18] == "ALI ALIYEV"
    assert a[7] == "AZN" and a[10] == 250.75 and a[11:13] == [0, 1] and a[13] == a[17] == "SMART LLC\r\n1234567890"
    assert a[19] == "AZN"
    lst = client.post(B + "/list", json={}).json()
    assert any(x["id"] == new["ID"] for x in lst["sw_out"])                   # status 2 -> "New created messages"


def test_create_validation_message():
    login()
    r = client.post(B + "/new/create", json=_new(Edit11_mf32a="", Edit1_MF71A="", combo_text={})).json()
    assert not r["ok"]
    assert r["message"] == "   MF32A  mebleq,  MF50,  MF57,  MF59,  MF71A, Xanalar doldurulmayıb!"
    # MF50/57/59 alone do not stop the save (stat4/5/7 'nextprosedure' in both branches)
    r = client.post(B + "/new/create", json=_new(combo_text={})).json()
    assert r["ok"]


def test_create_mt205_saving205():
    login()
    r = client.post(B + "/new/create", json=_new(fin="MT205", fincopy="", mf32a_val="USD", MF26T_edit="REL")).json()
    assert r["ok"]
    key, a = max(rows().values(), key=lambda x: x["ID"])["_CALL"]
    assert key == "SW_MAIN.SAVING205" and len(a) == 12
    assert a[1] == "AIIBAZ2X" and a[3] == "REL" and a[9] == "Institution" and a[10] == "" and a[11] == 25
    assert a[5] == ""                                     # non-AZN with CMF50 index 1 = 50A -> Memo1_MF50 (empty here)


def test_edit_dispatch_and_rights():
    login()
    assert client.get(B + "/out/9106/edit").json()["form"] == "plugin"       # SENDERLT<>'103' -> filereport.bpl
    r = client.get(B + "/out/9104/edit").json()
    assert r["form"] == "MT103" and r["combos"]["CMF50"] == 3 and r["combos"]["CMF53"] == 2 and r["combos"]["CMF57"] == 1
    assert r["MF71A"] == "SHA" and r["corr"] == "0137010023840" and r["header"]["receiver"]["CITY"] == "BAKU"
    assert client.get(B + "/out/9105/edit").json()["form"] == "MT103AZN"
    assert client.get(B + "/out/9101/edit").status_code == 400               # status 1 is not in grid_out
    login("TELLER", "Teller#2026")
    assert client.get(B + "/out/9104/edit").status_code in (400, 403, 500)  # SW_OUT_EDIT not granted


def test_mt103_save_post():
    login()
    body = {"reciverbic": "IBAZAZ2X", "mf32a_val": "USD",
            "combos": {"CMF50": 3, "CMF52": 0, "CMF53": 2, "CMF54": 0, "CMF55": 0, "CMF56": 0, "CMF57": 1, "CMF59": 1},
            "combo_text": {"CMF50": "K", "CMF57": "A", "CMF59": "59"},
            "edits": {"Edit3_MF50": "AZ41SMRT00000000000000001944", "Edit2_MF57": "DEUTDEFF", "Edit1_MF71A": "BEN",
                      "Edit1_MF71G": "USD10", "Edit2_MF71G": "X"},
            "bound": {"MF32A_AMOUNT": "999.5", "MF50_NAME$ADRESS": "SMART LLC\r\n1234567890  \r\nBAKU", "MF26T": "zzz"},
            "OF70_RichEdit": "INV 1", "OF72_RichEdit": ""}
    r = client.post(B + "/out/9104/mt103", json=body).json()
    assert r == {"ok": True}
    x = rows()[9104]
    assert x["_POSTED"] and x["MF20_REFERENCE"].startswith("OUT") and x["MF32A_AMOUNT"] == "999.5"
    assert x["M50"] == ":50K:" and x["TAX"] == "1234567890" and x["M53"] == ":53B:" and x["MF53_ACCOUNT"] == "0137010023840"
    assert x["M58"] == ":58A:" and x["MF58_BIC"] == "DEUTDEFF" and x["M59"] == ":59:" and x["MF71A"] == "BEN"
    assert x["MF71G_CHILD"] == "USD10|X" and x["M72"] == "" and x["M70"] == ":70:" and x["MF70"] == "INV 1"
    assert "MF26T" not in x or x["MF26T"] != "zzz"                           # MF26T is not a field of sw_out
    assert "SENDERTYPE" in x and x["RECEIVERTYPE"] == "IBAZAZ2X"


def test_mt103_save_bad_account_and_missing():
    login()
    body = {"reciverbic": "IBAZAZ2X", "mf32a_val": "USD", "combos": {"CMF50": 1, "CMF57": 1, "CMF59": 1},
            "combo_text": {"CMF50": "A", "CMF57": "A", "CMF59": "59"}, "edits": {"Edit1_MF50": "NOPE", "Edit1_MF71A": "OUR"}}
    assert client.post(B + "/out/9104/mt103", json=body).json()["message"] == "MF50 - Hesab nömrəsi düzgün deyil!"
    body["combo_text"] = {}
    m = client.post(B + "/out/9104/mt103", json=body).json()["message"]
    assert m == "   MF50,  MF57,  MF59, Xanalar doldurulmayıb!"


def test_mt103azn_change():
    login()
    r = client.get(B + "/out/9105/edit").json()
    assert r["OF70_RichEdit"].count("\r\n") == 4 and r["RichEdit3"].startswith("/BNF/SALARY OCTOBER")
    s = client.post(B + "/out/9105/mt103azn", json={"CMF59_text": "Field - 59", "OF70_RichEdit": " NEW 70 \r\n\r\n",
                                                    "RichEdit3": "/BNF/X\r\n", "bound": {"MF32A_AMOUNT": "821"}}).json()
    assert s["ok"]
    x = rows()[9105]
    assert x["MF70"] == "NEW 70" and x["M70"] == ":70:" and x["MF72"] == "/BNF/X" and x["MF32A_AMOUNT"] == "821"


def test_show_committed():
    login()
    r = client.get(B + "/out2/9103/show").json()
    assert r["form"] == "MT103Show" and r["rec"]["MESSAGETYPE"] == "MT103"
