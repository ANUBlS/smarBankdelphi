"""XÖHKS step 2 - OUT add / edit / delete and templates (Mt102Insert/Edit/Delete, MessagesOutAdd/Edit, MessOutDelete,
TTransForm, TPaymentDetalsForm, Get_to_shablon). Mock: XS_CONTROL emulated on the SQLite fixture inside a transaction,
so the Delphi Commit / Rollback points are checked."""
from fastapi.testclient import TestClient

from app.main import app
from app.db import mock as mock_db
from app.db import mock_xohks
from app import xohks_edit as E

client = TestClient(app)
B = "/api/xohks"
IBAN = "AZ77IBAZ38010019440000000777"     # valid mod-97 check below


def login():
    mock_db.reset()
    mock_xohks.reset()
    assert client.post("/api/login", json={"username": "ADMIN", "password": "Admin#2026"}).status_code == 200
    P("/open")


def P(path, body=None, code=200):
    r = client.post(B + path, json=body or {})
    assert r.status_code == code, r.text
    return r.json()


def _valid_iban():
    a = IBAN
    n = int("".join(str(int(ch, 36)) for ch in (a[4:] + a[:4])))
    return n % 97 == 1


def test_str_part():
    assert E.str_part("A|B|C|", "|", 1) == "A" and E.str_part("A|B|C|", "|", 3) == "C"
    assert E.str_part("Maas", "|", 1) == "" and E.str_part("", "|", 2) == ""
    assert E.str_part("A|B|", "|", 4) == ""


def _benef_fields(**k):
    f = dict(bank_id=2, client_acc_no=IBAN, client_name="NURLAN QASIMOV", client_code="/", client_voen="/",
             tey=["KOMMUNAL", "", "", ""], inf=["", "", ""], amount="250.5")
    f.update(k)
    return {"fields": f}


def test_insert_batch_with_beneficiaries_commit_on_post():
    """Mt102Insert inserts the batch before the form (no commit); ButtonPost updates and commits."""
    login()
    t = P("/tx/new")
    nid = t["new_id"]
    assert t["ref"].startswith("XS261012") and t["bnf"] == "/BNF/0" and t["client_code"] == "/"
    P("/tx/customer", {"kli_id": "abc"}, 400)
    P("/tx/customer", {"kli_id": "9099"}, 400)                  # Müştəri tapılmadı
    t = P("/tx/customer", {"kli_id": "9002"})
    assert [a["acc_no"] for a in t["accounts"]] == ["AZ55TURA  38010019440000000004", "AZ65TURA  38010019440000000002"]
    t = P("/tx/account", {"acc_id": 504})
    assert t["client_name"] == "KASPIAN SERVIS OMMC" and t["client_voen"] == "1700123451"
    assert t["filial_label"] == "Filial - Nərimanov filialı" and t["bank"]["bank_code"] == "507700"
    P("/tx/post", {}, 400)                                      # ButtonPost disabled until a beneficiary is added
    pd = P("/pd/open-tx")
    assert pd["trans_code"] == "900" and pd["ref"].startswith("BN") and pd["self"]["code"] == "507699"
    P("/pd/add", _benef_fields(tey=["kommunal", "", "", ""], client_voen=""), 400)    # Məlumat Tam deyil (voen)
    P("/pd/add", _benef_fields(inf=["-x", "", ""]), 400)                             # first char check
    r = P("/pd/add", _benef_fields())
    assert r["added"] and r["tx"]["bnf"] == "\\BNF\\1" and r["tx"]["amount_text"] == "250.5" and r["tx"]["post_enabled"]
    assert r["client_code"] == "/" and r["client_name"] == ""
    P("/pd/finish", _benef_fields(client_acc_no="AZ12IBAZ3801001944000000077"), 400)     # length 28
    r = P("/pd/finish", _benef_fields(amount="100"))
    assert r["closed"] and r["tx"]["amount_text"] == "350.5" and r["tx"]["bnf"] == "\\BNF\\2"
    r = P("/tx/post")
    assert r["located"] == nid
    b = next(x for x in r["batchs"] if x["id"] == nid)
    assert (b["amount"], b["acc_no"], b["format"], b["opercode"], b["filial"]) == (350.5, "AZ55TURA38010019440000000004",
                                                                                   "MT102", "CREDIT", 101)
    ben = P("/beneficiary", {"id": nid})["rows"]
    assert [x["amount"] for x in ben] == [250.5, 100.0] and ben[0]["remit_inf"] == "KOMMUNAL||||" and ben[0]["trans_cod"] == "900"
    mock_xohks._db().rollback()                                 # committed -> survives a rollback
    assert mock_xohks._db().execute("select amount from xs_batchs where id=?", (nid,)).fetchone()[0] == 350.5


def test_insert_cancel_rolls_back():
    login()
    nid = P("/tx/new")["new_id"]
    q = lambda: mock_xohks._db().execute("select count(*) from xs_batchs where id=?", (nid,)).fetchone()[0]   # noqa: E731
    assert q() == 1          # inserted (acc_id NULL -> not in the XS_BATCHS inner join, as in Delphi)
    P("/tx/close")                                              # FormClose -> Rollback
    assert q() == 0


def test_edit_batch_valute_and_ref_rules():
    login()
    t = P("/tx/edit", {"id": 229})
    assert t["batchs_edit"] and t["bnf"] == "/BNF/2" and t["acc_no"] == "AZ21TURA  38010019440000000001"
    assert "err_incomplete" in client.post(B + "/tx/post", json={"fields": {"valute": 840}}).text   # CLIENT_NAME ''
    assert "err_valute" in client.post(B + "/tx/post", json={"fields": {"client_name": "ALIYEV VALI"}}).text
    r = P("/tx/post", {"fields": {"valute": 0, "client_name": "ALIYEV VALI"}})
    assert next(x for x in r["batchs"] if x["id"] == 229)["client_name"] == "ALIYEV VALI"


def test_messages_out_add_edit_and_delete():
    login()
    P("/pd/open-add", {"id": 229})
    r = P("/pd/add", _benef_fields())                           # After_Add -> commit
    assert r["added"]
    rows = P("/beneficiary", {"id": 229})["rows"]
    new = rows[-1]
    assert new["amount"] == 250.5
    pd = P("/pd/open-edit", {"batch_id": 229, "id": new["id"]})
    assert pd["tey"][0] == "KOMMUNAL" and not pd["add_visible"] and not pd["finish_enabled"]
    P("/pd/finish", {}, 400)                                    # ButtonFinish disabled until an edit changes
    assert P("/pd/bank", {"bank_id": 1})["finish_enabled"]      # bank edits change -> Edit_BankName_SelfChange
    r = P("/pd/finish", _benef_fields(amount="300"))
    assert r["closed"]
    assert P("/beneficiary", {"id": 229})["rows"][-1]["amount"] == 300
    r = P("/benef/delete", {"batch_id": 229, "ids": [new["id"]]})
    assert all(x["id"] != new["id"] for x in r["rows"])
    r = P("/batch/delete", {"ids": [229, 230]})
    assert [b["id"] for b in r["batchs"]] == [231, 232]


def test_templates():
    login()
    P("/tx/new"); P("/tx/customer", {"kli_id": "9002"}); P("/tx/account", {"acc_id": 504})
    P("/pd/open-tx")
    rows = P("/shablon/list")["rows"]
    assert [r["shablonun_adi"] for r in rows] == ["BN0099"]
    pd = P("/shablon/pick", {"name": "BN0099"})
    assert pd["bank_id"] == 2 and pd["bank_code"] == "805250" and pd["client_name"] == "NURLAN QASIMOV"
    r = P("/shablon/save", {"fields": {"amount": "1,250.00"}})
    assert r["saved"]
    P("/shablon/save", {}, 400)                                 # Button1 disabled after saving
    rows = P("/shablon/list", {"field": "mebleg"})["rows"]
    assert [x["mebleg"] for x in rows] == ["1250.00", "250.00"] and rows[0]["odenish"] == "KASPIAN SERVIS OMMC"
    P("/shablon/list", {"field": "x; drop"}, 400)
    assert P("/shablon/delete", {"name": rows[0]["shablonun_adi"]})["rows"][0]["shablonun_adi"] == "BN0099"


def test_fixture_iban_valid():
    assert _valid_iban()


def test_delete_needs_right():
    """MT102DeleteExecute: SB_ACA.CheckAdvancedObjectAccess('XOHKS_DELETE') raises -> nothing deleted."""
    login()
    from app import xohks as X
    import types
    ws = types.SimpleNamespace(conn=types.SimpleNamespace(call_proc=lambda *a, **k: (_ for _ in ()).throw(E.DBError("ORA-20280"))),
                               module_state={})
    try:
        E.delete_batchs(ws, [229])
        assert False
    except X.XsError as e:
        assert e.key == "error.access_denied"
