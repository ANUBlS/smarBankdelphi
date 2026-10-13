"""XÖHKS step 3a - Mt102Accept (+TFormAcceptTransaction), MessagesOutAccept, TVerify, Avtorizator, Geri qaytar,
SendToArchive, AfterScroll button enabling. XS_CONTROL emulated on the SQLite fixture (bodies unknown)."""
from fastapi.testclient import TestClient

from app.main import app
from app.db import mock as mock_db
from app.db import mock_xohks
from app import xohks_status as S

client = TestClient(app)
B = "/api/xohks"


def login():
    mock_db.reset()
    mock_xohks.reset()
    assert client.post("/api/login", json={"username": "ADMIN", "password": "Admin#2026"}).status_code == 200
    P("/open")


def P(path, body=None, code=200):
    r = client.post(B + path, json=body or {})
    assert r.status_code == code, r.text
    return r.json()


def _b(d, i):
    return next(x for x in d["batchs"] if x["id"] == i)


def test_full_chain_accept_verify_authorize_return():
    login()
    rows = P("/beneficiary", {"id": 229})["rows"]
    d = P("/batch/accept", {"id": 229})
    assert d["warning"] == "xohks.err_benef_not_accepted" and _b(d, 229)["status"] == 0
    d = P("/benef/accept", {"batch_id": 229, "ids": [r["id"] for r in rows]})
    assert all(r["status"] == 1 for r in d["rows"])
    d = P("/batch/accept", {"id": 229})
    assert d.get("warning") is None and _b(d, 229)["status"] == 1
    v = P("/batch/verify", {"id": 229})["verify"]
    assert v["DBEdit4"] == 229
    d = P("/batch/verify/confirm", {"edit1": "1500.5"})
    assert d["verified"] and _b(d, 229)["status"] == 4 and _b(d, 229)["vuserid"] == "ADMIN"
    d = P("/batch/return", {"id": 229})                  # 4/4 -> 7
    assert _b(d, 229)["status"] == 7
    d = P("/batch/return", {"id": 229})                  # 7/7 -> 0 (+deletetrans)
    assert _b(d, 229)["status"] == 0


def test_verify_mismatch_and_authorize():
    login()
    P("/benef/accept", {"batch_id": 229, "ids": [r["id"] for r in P("/beneficiary", {"id": 229})["rows"]]})
    P("/batch/accept", {"id": 229})
    P("/batch/verify", {"id": 229})
    d = P("/batch/verify/confirm", {"edit1": "1500"})
    assert d["verified"] is False and _b(d, 229)["status"] == 8
    P("/batch/verify", {"id": 229})
    assert _b(P("/batch/verify/confirm", {"edit1": "1500.5"}), 229)["status"] == 4
    d = P("/batch/authorize", {"id": 229})
    assert _b(d, 229)["status"] == 6 and _b(d, 229)["auserid"] == "ADMIN"


def test_accept_form_for_file_created():
    login()
    c = mock_xohks._db()
    c.execute("update xs_batchs set status=3 where id=229")
    c.execute("update xs_beneficiary set status=1 where batchid=229")
    f = P("/batch/accept", {"id": 229})["accept_form"]
    assert f["CheckBox1"] and f["Edit_Referens"] == "XS2610120001"
    P("/batch/accept-form", {"ok": True, "Edit_Referens": "XS2610120001"}, 400)   # same ref
    ref = P("/batch/accept-form/ref")["Edit_Referens"]
    P("/batch/accept", {"id": 229})
    d = P("/batch/accept-form", {"ok": True, "Edit_Referens": ref})
    b = _b(d, 229)
    assert b["status"] == 1 and b["trans_ref"] == ref


def test_enable_and_verify_text():
    e = S.enable({"status": 3}, None)
    assert e["N4"] and not e["AcceptButton"] and not e["ToolButton4"]
    assert S._verify_edit2(1500.0) == "1500" and S._verify_edit2(1500.5) == "1500.5"


def test_send_to_archive():
    login()
    assert P("/archive/send")["message"] == "xohks.msg_archived"
