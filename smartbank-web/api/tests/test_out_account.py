"""Packages/Out_account/ocx (TAccountForm) - off-balance accounts."""
from fastapi.testclient import TestClient
from app.main import app
from app.db import mock as mock_db
from app import out_account as A
from app import out_acc_sql as Q

client = TestClient(app)
B = "/api/out-account"


def login(u="ADMIN", p="Admin#2026"):
    mock_db.reset()
    assert client.post("/api/login", json={"username": u, "password": p}).status_code == 200


def test_filter_text_like_delphi():
    sql, b = A.account_sql({"status": 1}, None)
    lines = sql.split("\r\n")
    assert lines[6] == " where (DECODE (close_dat, NULL, 1, 2)=1)" and lines[8] == "   acc_no"
    assert lines[:6] == Q.ACCOUNT_SQL_LINES[:6] and b == {}
    sql, b = A.account_sql({"status": 0, "filial": 101, "currency": 840, "user": 1, "tipacc": "G", "bal_cn": "9100"}, "NAME")
    assert sql.split("\r\n")[6] == (" where DECODE (close_dat, NULL, 1, 2) is not null AND (Filial=101) AND (Val_acc=840)"
                                    " AND (Op_ID=1) AND (Tipacc like  :f_tipacc) AND (Bal_cn1=:f_bal_cn)")
    assert b == {"f_tipacc": "%G%", "f_bal_cn": "9100"} and sql.endswith("   NAME\r\n")
    # :title only accepts grid field names (never user text)
    assert A.account_sql({"status": 2}, "1;drop table x")[0].endswith("   acc_no\r\n")


def test_flag_map_and_old_acc_no():
    assert A.flag_map(["G     Girov", "Z     Zəmanət"]) == "G,Z" and A.flag_map([]) == ""
    assert A.OLD_ACC_NO_OK.match("AB-12/3") and not A.OLD_ACC_NO_OK.match("AB 12")


def test_list_filters_and_order():
    login()
    rows = client.get(B).json()["rows"]                                  # default ItemIndex 1 = open accounts
    assert [r["id"] for r in rows] == [9102, 9101, 9103, 9105]
    assert len(client.get(B, params={"status": 0}).json()["rows"]) == 5
    assert [r["id"] for r in client.get(B, params={"status": 2}).json()["rows"]] == [9104]
    assert [r["id"] for r in client.get(B, params={"currency": 840}).json()["rows"]] == [9102]
    assert [r["id"] for r in client.get(B, params={"tipacc": "Z"}).json()["rows"]] == [9102, 9103]
    assert [r["id"] for r in client.get(B, params={"bal_cn": "9200", "filial": 101}).json()["rows"]] == [9105]
    assert [r["id"] for r in client.get(B, params={"user": 2, "status": 0}).json()["rows"]] == [9103, 9104]
    by_name = [r["name"] for r in client.get(B, params={"title": "NAME"}).json()["rows"]]
    assert by_name == sorted(by_name)
    assert rows[1]["expert"] == "Hüseynov R." and rows[1]["statu1"] == 1


def test_lookups():
    login()
    lk = client.get(B + "/lookups").json()
    assert lk["tek_dat"] == "2026-10-12" and lk["acc_flags"][0]["name"] == "*     Bütün"
    assert all(p["status"] == 1 for p in lk["pair_accounts"]) and 9104 not in [p["id"] for p in lk["pair_accounts"]]
    assert lk["customers"][0] == {"id": 1, "name": "Aliyev Elnur"} and lk["bal_acc"][0]["bal_cn"] == "9100"


def test_add_edit_close_cycle():
    login()
    gen = client.post(B + "/generate-acc-no", json={"bal_cn1": 9100, "val_acc": 0, "kli_id": 3, "filial": 101}).json()["acc_no"]
    body = {"acc_no": gen, "val_acc": 0, "bal_cn1": 9100, "kli_id": 3, "open_dat": "2026-10-12", "name": "Mammadova Leyla girov",
            "filial": 102, "tipacc": "G", "old_acc_no": "X-1", "tempid": 2, "bal_cn2": 91001}
    nid = client.post(B, json=body).json()["id"]
    a = client.get(f"{B}/{nid}").json()
    assert a["acc_no"] == gen and a["expert"] == "Quliyeva S." and a["op_id"] == 0 and a["rests"]["ostat"] is None
    assert [f["checked"] for f in client.get(f"{B}/{nid}/flags").json()] == [True, False, False]   # first AccFlags row skipped
    assert client.put(f"{B}/{nid}", json={**body, "name": "Renamed"}).status_code == 200
    assert client.get(f"{B}/{nid}").json()["name"] == "Renamed"
    assert client.put(f"{B}/{nid}", json={**body, "old_acc_no": "a b"}).json()["detail"]["key"] == "out_account.err_old_acc_no"
    dup = client.post(B, json=body)
    assert dup.status_code >= 400 and "ORA-00001" in dup.text
    assert client.post(f"{B}/{nid}/close").status_code == 200
    assert client.get(f"{B}/{nid}").json()["close_dat"] == "2026-10-12"


def test_update_keeps_hidden_fields():
    login()
    a = client.get(f"{B}/9103").json()
    body = {k: a[k] for k in ("acc_no", "val_acc", "bal_cn1", "kli_id", "open_dat", "pair_acc", "limit", "sim_otcet", "filial",
                              "name", "tipacc", "old_acc_no", "tempid", "bal_cn2")}
    client.put(f"{B}/9103", json=body)
    b = client.get(f"{B}/9103").json()
    assert b["op_id"] == 2 and b["pair_acc"] == 9101 and b["open_dat"] == a["open_dat"]


def test_transactions_and_states():
    login()
    t = client.get(f"{B}/9101/transactions").json()                      # default interval = tek_dat
    assert t["start"] == t["end"] == "2026-10-12" and len(t["debit"]) == 1 and len(t["credit"]) == 1
    t = client.get(f"{B}/9101/transactions", params={"start": "2026-10-01", "end": "2026-10-12"}).json()
    assert t["debit_total"] == 26500.0 and t["credit_total"] == 1500.0
    assert t["debit"][0]["debitaccno"] == "9100094400010001" and t["debit"][0]["creditaccno"] == "9200094400020001"
    s = client.get(f"{B}/9101/states").json()["rows"]
    assert [x["archivedate"] for x in s] == ["2026-10-08", "2026-10-09", "2026-10-12"] and s[0]["amount"] == 20000.0


def test_rights():
    login("TELLER", "Teller#2026")
    assert client.get(B).status_code == 403
