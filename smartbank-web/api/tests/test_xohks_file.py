"""XÖHKS step 3b - TTransCodeForm tree, PrepareFile (CreateFile XML), Gedən fayl (XS_SENTINFO)."""
import base64

from app import xohks_file as F
from app import xohks_crypto as C
from tests.test_xohks_status import login, P, _b, client


def _authorised():
    login()
    P("/benef/accept", {"batch_id": 229, "ids": [r["id"] for r in P("/beneficiary", {"id": 229})["rows"]]})
    P("/batch/accept", {"id": 229})
    P("/batch/verify", {"id": 229})
    P("/batch/verify/confirm", {"edit1": "1500.5"})
    assert _b(P("/batch/authorize", {"id": 229}), 229)["status"] == 6


def test_helpers():
    assert F.change_decimal(1500.5) == "1500,50" and F.change_decimal(0.005) == "0,01" and F.change_decimal(1234567) == "1234567,00"
    assert F.set_string_length("12", 5, "0") == "00012" and F.set_string_length("123456", 3, "0") == "123456"
    assert C.sign_input(b"a\r\nb") == b"a\x00\n\x00b\x00"
    assert isinstance(C.get_signer(), C.NoSigner)


def test_transcode_tree_built_by_insert_only():
    login()
    assert client.get("/api/xohks/transcode/tree").json()["tree"] == []     # no Mt102Insert yet
    P("/tx/new")
    t = client.get("/api/xohks/transcode/tree").json()["tree"]
    assert [n["text"] for n in t] == ["Büdcə ödənişləri", "Kommunal ödənişlər", "Digər köçürmələr"]
    assert t[0]["children"][0] == {"text": "Vergi ödənişi", "image": 2, "state": 101}
    assert P("/transcode/ok", {"node": t[0]})["closed"] is False           # parent: typecode 0 -> stays open
    assert P("/transcode/ok", {"node": t[1]["children"][1]}) == {"closed": True, "trans_code": "900"}
    P("/tx/close")


def test_prepare_file_flow_and_xml():
    _authorised()
    o = P("/pf/open")
    assert o["pf"]["Edit_sender"] == "TURAAZ22AXXX" and o["pf"]["Edit_receiver"] == "NABZAZ2C" and o["pf"]["Edit1"] == "150"
    assert 229 in [r["id"] for r in o["ready"]] and o["sending"] == []
    assert P("/pf/ref")["Edit_reference"] == ""                       # SendingBatchs empty -> no reference
    d = P("/pf/create")
    assert "file" not in d                                             # exit
    d = P("/pf/tosend", {"id": 229})
    assert [r["id"] for r in d["sending"]] == [229] and d["pf"]["Edit_count"] == "1" and d["pf"]["CurrencyEdit1"] == 1500.5
    assert P("/pf/create")["warning"] == "xohks.err_no_file_ref"
    ref = P("/pf/ref")["Edit_reference"]
    assert ref.startswith("XF")
    d = P("/pf/create")
    x = base64.b64decode(d["file"]["b64"])
    assert d["file"]["name"] == ref + ".xml" and d["file"]["delphi_path"] == "C:\\XOHKS\\OUT\\" + ref + ".xml"
    assert x.startswith(b"<SWIFT_msg_fields>\r\n<format>MT</format>\r\n")
    assert b"<msg_amount>1500,50</msg_amount>\r\n" in x and b"<msg_num_of_batches>1</msg_num_of_batches>" in x
    assert b"<msg_del_notif_rq>N</msg_del_notif_rq> \r\n" in x
    body = x.split(b"<body>")[1].split(b"</body>")[0].decode("utf-8")
    assert body.startswith(":20:XS2610120001\n:23:102\n:50K:/AZ21TURA38010019440000000001\n")
    assert ":52A:/D/AZ62NABZ01350100000000014944\nTURAAZ22\n" in body and body.endswith(":72:/BNF/" + body.count(":21:").__str__())
    assert x.endswith(b"</body>\r\n</batch>\r\n</block4>\r\n</SWIFT_msg_fields>\r\n")
    assert d["pf"]["Edit_reference"] == "" and d["sending"] == [] and _b(d, 229)["status"] == 3
    s = P("/sent/list", {"beg": "2026-01-01", "end": "2030-01-01"})["rows"]
    assert s[-1]["user_reference"] == ref and s[-1]["type"] == "150"
    w = P("/sent/open", {"rec": s[-1]})
    assert w["warning"] == "xohks.err_file_not_found"                  # out_dir\ddmmyy\ - as in Delphi
    P("/pf/close")


def test_limit_and_nosend_and_sort():
    _authorised()
    P("/pf/open")
    d = P("/pf/sort", {"caption": "Debet Məbləğ"})
    assert d["title"] == "AMOUNT" and P("/pf/sort", {"caption": "$"})["title"] == "AMOUNT"
    P("/pf/tosend", {"all": True})
    d = P("/pf/nosend", {"all": True})
    assert d["sending"] == [] and d["pf"]["Edit_count"] == "0"
    assert P("/pf/set-ref", {"ref": "AB/1?ş"})["Edit_reference"] == "AB/1"
    P("/pf/close")


